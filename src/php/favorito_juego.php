<?php
require_once("conexion.php");
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(["error" => "No autenticado"]);
    exit;
}

$input = json_decode(file_get_contents("php://input"), true);
$juego_id = intval($input["juego_id"]);
$favorito = $input["favorito"];
$user_id = $_SESSION['user_id'];

if ($favorito) {
    $stmt = $conn->prepare("INSERT IGNORE INTO usuario_juego_favorito (Id_usuario, Id_juego) VALUES (?, ?)");
    $stmt->bind_param("ii", $user_id, $juego_id);
    $stmt->execute();
} else {
    $stmt = $conn->prepare("DELETE FROM usuario_juego_favorito WHERE Id_usuario = ? AND Id_juego = ?");
    $stmt->bind_param("ii", $user_id, $juego_id);
    $stmt->execute();
}

echo json_encode(["ok" => true]);
