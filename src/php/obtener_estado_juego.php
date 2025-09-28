<?php
require_once("conexion.php");
session_start();

$user_id = $_SESSION['user_id'] ?? null;
$juego_id = intval($_GET['juego_id']);

// Obtener likes/dislikes
$result = $conn->query("SELECT Likes, Dislikes FROM juegos WHERE Id = $juego_id");
$row = $result->fetch_assoc();

$likes = $row['Likes'] ?? 0;
$dislikes = $row['Dislikes'] ?? 0;

// Inicializar valores por defecto
$favorito = false;
$user_like = false;
$user_dislike = false;

// Si hay sesión de usuario, verificar reacciones y favoritos
if ($user_id) {
    // Verificar favorito
    $res = $conn->query("SELECT 1 FROM usuario_juego_favorito WHERE Id_usuario = $user_id AND Id_juego = $juego_id");
    $favorito = $res->num_rows > 0;

    // Verificar reacción
    $res = $conn->query("SELECT Reaccion FROM usuario_reaccion_juego WHERE Id_usuario = $user_id AND Id_juego = $juego_id");
    if ($res && $res->num_rows > 0) {
        $reac = $res->fetch_assoc()['Reaccion'];
        $user_like = $reac === 'like';
        $user_dislike = $reac === 'dislike';
    }
}

echo json_encode([
    "likes" => $likes,
    "dislikes" => $dislikes,
    "favorito" => $favorito,
    "user_like" => $user_like,
    "user_dislike" => $user_dislike
]);
