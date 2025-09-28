<?php
require_once("conexion.php");

$juego_id = intval($_GET['juego_id']);

$query = "
    SELECT c.Fecha, c.Comentario, u.Nombre_usuario, u.Id AS Id_usuario, u.Id_foto_perfil
    FROM comentarios c
    JOIN usuarios u ON c.Id_usuario = u.Id
    WHERE c.Id_juego = ?
    ORDER BY c.Fecha DESC
";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $juego_id);
$stmt->execute();
$result = $stmt->get_result();

$comentarios = [];

while ($row = $result->fetch_assoc()) {
    $comentarios[] = [
        "fecha" => $row['Fecha'],
        "comentario" => $row['Comentario'],
        "usuario" => $row['Nombre_usuario'],
        "foto" => "/public/Img/Perfil/Perfil/portrait" . $row['Id_foto_perfil'] . ".png"
    ];
}

echo json_encode($comentarios);
