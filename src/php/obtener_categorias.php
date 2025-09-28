<?php
require 'conexion.php';

$id_juego = $_GET['id_juego'] ?? 1;

$stmt = $conn->prepare("
    SELECT c.Nombre
    FROM categorias c
    INNER JOIN juego_categoria jc ON c.Id = jc.Id_categoria
    WHERE jc.Id_juego = ?
");
$stmt->execute([$id_juego]);
$categorias = $stmt->fetchAll(PDO::FETCH_COLUMN);

header('Content-Type: application/json');
echo json_encode($categorias);
