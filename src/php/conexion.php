<?php
// conexion.php

$host = "localhost";
$user = "root";
$pass = ""; // o tu contraseña
$db = "retro_games_xp";

$conn = new mysqli($host, $user, $pass, $db);

if ($conn->connect_error) {
    die("Error de conexión: " . $conn->connect_error);
}
?>
