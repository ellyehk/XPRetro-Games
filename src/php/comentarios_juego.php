<?php
require 'conexion.php';

$id_juego = $_GET['id'] ?? 1;

$stmt = $conn->prepare("
    SELECT c.Comentario, c.Fecha, c.Likes, c.Dislikes, u.Nombre_usuario
    FROM comentarios c
    JOIN usuarios u ON c.Id_usuario = u.Id
    WHERE c.Id_juego = ?
    ORDER BY c.Fecha DESC
");
$stmt->bind_param("i", $id_juego);
$stmt->execute();
$result = $stmt->get_result();

$comentarios = [];

while ($fila = $result->fetch_assoc()) {
    $comentarios[] = $fila;
}

header('Content-Type: application/json');
echo json_encode($comentarios);
