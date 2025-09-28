<?php
header('Content-Type: application/json');
include 'conexion.php'; // tu archivo de conexión

$id = isset($_GET['id']) ? (int)$_GET['id'] : 0;

$sql = "SELECT * FROM respuestas_juego WHERE Id_juego = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $id);
$stmt->execute();
$resultado = $stmt->get_result();
$data = $resultado->fetch_assoc();

echo json_encode($data ?: null);
?>
