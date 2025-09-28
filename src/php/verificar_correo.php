<?php
require 'conexion.php';

header('Content-Type: application/json');

$email = $_POST['email'] ?? '';

if (!$email) {
    echo json_encode(['success' => false, 'error' => 'Email vacío']);
    exit;
}

$stmt = $conn->prepare("SELECT `Id` FROM `usuarios` WHERE `Correo` = ?");
$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    echo json_encode(['success' => true]);
} else {
    echo json_encode(['success' => false]);
}

$stmt->close();
$conn->close();
?>
