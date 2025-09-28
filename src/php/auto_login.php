<?php
require 'conexion.php';
session_start();

$token = $_COOKIE['sesion_token'] ?? null;

if ($token) {
    $stmt = $conn->prepare("SELECT Id, Nombre_usuario FROM usuarios WHERE token_sesion = ?");
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($user = $result->fetch_assoc()) {
        $_SESSION['user_id'] = $user['Id'];
        echo json_encode([
            "success" => true,
            "usuario" => $user['Nombre_usuario'],
            "user_id" => $user['Id']
        ]);
        exit;
    }
}

echo json_encode(["success" => false]);
