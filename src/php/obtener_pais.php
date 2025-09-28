<?php
require_once("conexion.php");
$result = $conn->query("SELECT Id, Nombre FROM pais ORDER BY Nombre");
echo json_encode($result->fetch_all(MYSQLI_ASSOC));
