<?php
require 'conexion.php';
session_start();

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$recordar = $_POST['recordar'] ?? false; // true o "on"

error_log("📩 Correo recibido: $email");
error_log("🔐 Password recibido: $password");

$stmt = $conn->prepare("SELECT id, contraseña FROM usuarios WHERE correo = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows === 1) {
    $user = $result->fetch_assoc();
    $hashDB = $user['contraseña'];

    error_log("🔑 Hash en BD: $hashDB");

    if (password_verify($password, $hashDB)) {
        $_SESSION['user_id'] = $user['id'];

        // Si el usuario marcó "Recordar contraseña"
        if ($recordar === "true" || $recordar === true || $recordar === "on") {
            $token = bin2hex(random_bytes(32)); // 64 caracteres seguros

            // Guardamos el token en la base de datos
            $update = $conn->prepare("UPDATE usuarios SET token_sesion = ? WHERE id = ?");
            $update->bind_param("si", $token, $user['id']);
            $update->execute();
            $update->close();

            // Guardamos el token en una cookie (7 días de duración)
            setcookie("sesion_token", $token, time() + (86400 * 7), "/", "", false, true);
        }

        echo json_encode([
            "success" => true,
            "user_id" => $user['id'],
            "debug" => [
                "input_password" => $password,
                "stored_hash" => $hashDB
            ]
        ]);
    } else {
        echo json_encode([
            "success" => false,
            "message" => "Contraseña incorrecta",
            "debug" => [
                "input_password" => $password,
                "stored_hash" => $hashDB
            ]
        ]);
    }
} else {
    echo json_encode([
        "success" => false,
        "message" => "Correo no registrado",
        "debug" => [
            "input_password" => $password
        ]
    ]);
}

$stmt->close();
$conn->close();
?>
