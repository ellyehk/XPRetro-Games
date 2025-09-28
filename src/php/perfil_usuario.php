<?php
require_once("conexion.php");
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(["error" => "No autenticado"]);
    exit;
}

$id = $_SESSION['user_id'];

// Datos del usuario
$stmt = $conn->prepare("
    SELECT u.Nombre_usuario, u.Correo, u.Descripcion, u.Fecha_nacimiento, u.Id_region, u.Id_pais, u.Id_genero, 
           u.Id_foto_perfil, u.Horas_jugadas, u.Fecha_registro, r.Nombre AS Rango
    FROM usuarios u
    JOIN rango r ON u.Id_rango = r.Id
    WHERE u.Id = ?
");
$stmt->bind_param("i", $id);
$stmt->execute();
$result = $stmt->get_result();
$usuario = $result->fetch_assoc();

// Juegos favoritos
$favoritos = [];
$res = $conn->query("
    SELECT j.Id, j.Nombre 
    FROM usuario_juego_favorito ujf
    JOIN juegos j ON ujf.Id_juego = j.Id
    WHERE ujf.Id_usuario = $id
");
while ($row = $res->fetch_assoc()) {
    $row['Imagen'] = "../public/Img/Perfil/Perfil/portrait{$row['Id']}.png";
    $favoritos[] = $row;
}

// Me gusta
$likes = [];
$res2 = $conn->query("
    SELECT j.Id, j.Nombre 
    FROM reacciones r
    JOIN juegos j ON r.Id_juego = j.Id
    WHERE r.Id_usuario = $id AND r.Tipo = 'like'
");
while ($row = $res2->fetch_assoc()) {
    $row['Imagen'] = "../public/Img/Perfil/Perfil/portrait{$row['Id']}.png";
    $likes[] = $row;
}

echo json_encode([
    "usuario" => $usuario,
    "favoritos" => $favoritos,
    "likes" => $likes
]);
