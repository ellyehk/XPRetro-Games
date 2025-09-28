<?php
require_once("conexion.php");
$result = $conn->query("SELECT Id, Genero AS Nombre FROM genero ORDER BY Id");
echo json_encode($result->fetch_all(MYSQLI_ASSOC));
