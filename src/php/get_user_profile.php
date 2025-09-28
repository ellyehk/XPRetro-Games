<?php
session_start();
require 'conexion.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user_id'])) {
    echo json_encode(['success' => false, 'error' => 'No session']);
    exit;
}

$userId = $_SESSION['user_id'];

$stmt = $conn->prepare("SELECT Id_foto_perfil FROM usuarios WHERE Id = ?");
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();

if ($row = $result->fetch_assoc()) {
    echo json_encode([
        'success' => true,
        'id_foto_perfil' => $row['Id_foto_perfil']
    ]);
} else {
    echo json_encode(['success' => false, 'error' => 'User not found']);
}
