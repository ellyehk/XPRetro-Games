<?php
require_once("conexion.php");
session_start();

if (!isset($_SESSION['user_id'])) {
    echo json_encode(["error" => "No autenticado"]);
    exit;
}

$input = json_decode(file_get_contents("php://input"), true);
$juego_id = intval($input["juego_id"]);
$tipo = $input["tipo"];
$user_id = $_SESSION['user_id'];

if (!in_array($tipo, ["like", "dislike"])) {
    echo json_encode(["error" => "Tipo inválido"]);
    exit;
}

// Verificar si ya reaccionó
$stmt = $conn->prepare("SELECT Reaccion FROM usuario_reaccion_juego WHERE Id_usuario = ? AND Id_juego = ?");
$stmt->bind_param("ii", $user_id, $juego_id);
$stmt->execute();
$res = $stmt->get_result();
$prev = $res->fetch_assoc();

if ($prev) {
    if ($prev['Reaccion'] === $tipo) {
        // Si repite la misma reacción, se elimina (quita su voto)
        if ($tipo === 'like') {
            $conn->query("UPDATE juegos SET Likes = Likes - 1 WHERE Id = $juego_id");
        } else {
            $conn->query("UPDATE juegos SET Dislikes = Dislikes - 1 WHERE Id = $juego_id");
        }
        $stmt = $conn->prepare("DELETE FROM usuario_reaccion_juego WHERE Id_usuario = ? AND Id_juego = ?");
        $stmt->bind_param("ii", $user_id, $juego_id);
        $stmt->execute();

        $user_like = false;
        $user_dislike = false;
    } else {
        // Cambia de like a dislike o viceversa
        if ($tipo === 'like') {
            $conn->query("UPDATE juegos SET Likes = Likes + 1, Dislikes = Dislikes - 1 WHERE Id = $juego_id");
        } else {
            $conn->query("UPDATE juegos SET Dislikes = Dislikes + 1, Likes = Likes - 1 WHERE Id = $juego_id");
        }
        $stmt = $conn->prepare("UPDATE usuario_reaccion_juego SET Reaccion = ? WHERE Id_usuario = ? AND Id_juego = ?");
        $stmt->bind_param("sii", $tipo, $user_id, $juego_id);
        $stmt->execute();

        $user_like = $tipo === 'like';
        $user_dislike = $tipo === 'dislike';
    }
} else {
    // Primera vez que vota
    if ($tipo === 'like') {
        $conn->query("UPDATE juegos SET Likes = Likes + 1 WHERE Id = $juego_id");
    } else {
        $conn->query("UPDATE juegos SET Dislikes = Dislikes + 1 WHERE Id = $juego_id");
    }
    $stmt = $conn->prepare("INSERT INTO usuario_reaccion_juego (Id_usuario, Id_juego, Reaccion) VALUES (?, ?, ?)");
    $stmt->bind_param("iis", $user_id, $juego_id, $tipo);
    $stmt->execute();

    $user_like = $tipo === 'like';
    $user_dislike = $tipo === 'dislike';
}

// Obtener totales
$result = $conn->query("SELECT Likes, Dislikes FROM juegos WHERE Id = $juego_id");
$row = $result->fetch_assoc();

echo json_encode([
    "likes" => $row['Likes'],
    "dislikes" => $row['Dislikes'],
    "user_like" => $user_like,
    "user_dislike" => $user_dislike
]);
