<?php
require_once("conexion.php");
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(["error" => "No autenticado"]);
    exit;
}

$input = json_decode(file_get_contents("php://input"), true);
$comentario = trim($input['comentario']);
$juego_id = intval($input['juego_id']);
$user_id = $_SESSION['user_id'];

if (strlen($comentario) < 1) {
    echo json_encode(["error" => "Comentario vacío"]);
    exit;
}

$stmt = $conn->prepare("INSERT INTO comentarios (Id_usuario, Fecha, Comentario, Likes, Dislikes, Id_juego)
                        VALUES (?, NOW(), ?, 0, 0, ?)");
$stmt->bind_param("isi", $user_id, $comentario, $juego_id);
$stmt->execute();

echo json_encode(["ok" => true]);
