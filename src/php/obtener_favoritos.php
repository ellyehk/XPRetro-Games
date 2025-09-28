<?php
require_once("conexion.php");
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(["error" => "Debes iniciar sesión para ver tus favoritos."]);
    exit;
}

$user_id = $_SESSION['user_id'];

$query = "
    SELECT j.Id, j.Nombre
    FROM usuario_juego_favorito ujf
    JOIN juegos j ON ujf.Id_juego = j.Id
    WHERE ujf.Id_usuario = ?
";

$stmt = $conn->prepare($query);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$favoritos = [];

while ($row = $result->fetch_assoc()) {
    $favoritos[] = [
        "id" => $row['Id'],
        "nombre" => $row['Nombre'],
        // Aquí usas "portrait<ID>.png" como imagen
        "imagen" => "../public/Img/posterJuegos/poster" . $row['Id'] . ".png"
    ];
}

echo json_encode($favoritos);
