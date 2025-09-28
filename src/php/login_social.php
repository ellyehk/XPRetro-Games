<?php
require 'conexion.php';
session_start();

$data = json_decode(file_get_contents("php://input"), true);

$nombre = $conn->real_escape_string($data['name'] ?? '');
$correo = $conn->real_escape_string($data['email'] ?? '');
$proveedor_id = $conn->real_escape_string($data['proveedor_id'] ?? '');
$proveedor = $conn->real_escape_string($data['proveedor'] ?? '');

if (!$correo || !$proveedor_id || !$proveedor) {
    echo json_encode(["success" => false, "message" => "Faltan datos"]);
    exit;
}

// Token de sesión
$tokenSesion = hash('sha256', uniqid($correo, true));

// Verificar si ya existe
$stmt = $conn->prepare("SELECT Id FROM usuarios WHERE Correo = ?");
$stmt->bind_param("s", $correo);
$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
    // Usuario ya existe: actualizar datos
    $stmt->close();
    $update = $conn->prepare("UPDATE usuarios SET Nombre_usuario = ?, proveedor = ?, proveedor_id = ?, token_sesion = ? WHERE Correo = ?");
    $update->bind_param("sssss", $nombre, $proveedor, $proveedor_id, $tokenSesion, $correo);
    $update->execute();
} else {
    // Usuario nuevo: registrar
    $descripcion = "Cuenta creada con $proveedor";
    $contraseña = password_hash(uniqid(), PASSWORD_DEFAULT);
    $fecha = "2000-01-01";

    $insert = $conn->prepare("INSERT INTO usuarios 
    (Nombre_usuario, Correo, Contraseña, Horas_jugadas, Fecha_registro, Descripcion, Fecha_nacimiento,
     Id_region, Id_pais, Id_genero, Id_logros, Id_rango, proveedor_id, proveedor, token_sesion, Juegos_jugados, Id_foto_perfil, Id_foto_portada) 
    VALUES (?, ?, ?, 0, CURDATE(), ?, ?, 1, 1, 1, 1, 1, ?, ?, ?, 0, 1, 1)");
    $insert->bind_param("ssssssss", $nombre, $correo, $contraseña, $descripcion, $fecha, $proveedor_id, $proveedor, $tokenSesion);
    $insert->execute();
}

// Obtener ID
$result = $conn->query("SELECT Id FROM usuarios WHERE Correo = '$correo'");
$user = $result->fetch_assoc();
setcookie("sesion_token", $tokenSesion, time() + (30 * 24 * 60 * 60), "/");

$_SESSION["user_id"] = $user["Id"];

echo json_encode([
    "success" => true,
    "user_id" => $user["Id"]
]);
