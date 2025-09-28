<?php
require 'conexion.php';
session_start();

$token = $_COOKIE['sesion_token'] ?? null;

if ($token) {
    $stmt = $conn->prepare("SELECT id, nombre_usuario, id_foto_perfil FROM usuarios WHERE token_sesion = ?");
    $stmt->bind_param("s", $token);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($user = $result->fetch_assoc()) {
        $_SESSION['user_id'] = $user['id'];
        echo json_encode([
            "success" => true,
            "usuario" => $user['nombre_usuario'],
            "user_id" => $user['id'],
            "foto_perfil" => $user['id_foto_perfil']
        ]);
        exit;
    }
}

echo json_encode(["success" => false]);
