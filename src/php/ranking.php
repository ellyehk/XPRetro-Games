<?php
include 'conexion.php';

// Consulta de los 10 usuarios con más horas jugadas
$sql = "
    SELECT 
        u.Id,
        u.Nombre_usuario AS usuario,
        u.Horas_jugadas,
        u.Id_foto_perfil,
        r.Nombre AS rango
    FROM usuarios u
    LEFT JOIN rango r ON u.Id_rango = r.Id
    ORDER BY u.Horas_jugadas DESC
    LIMIT 10
";

$result = $conn->query($sql);

$jugadores = [];

if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $jugadores[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode($jugadores);
?>
