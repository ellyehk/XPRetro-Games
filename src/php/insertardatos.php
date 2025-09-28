<?php
include 'conexion.php'; // Asegúrate de que la ruta sea correcta

// Valores de ejemplo (puedes modificarlos según los datos válidos de tu DB)
$nombre_usuario = "Eminem";
$correo = "Eminem@rap.god";
$contraseña = "123456"; // En producción, usa hash (password_hash)
$horas_jugadas = 18;
$fecha_registro = date('Y-m-d'); // Fecha actual
$juegos_jugados = 2;
$descripcion = "Usuario";
$fecha_nacimiento = "2000-01-01";
$id_region = 1; // Norteamérica
$id_pais = 7;   // México
$id_genero = 2; // Hombre
$id_logros = 1; // Primer logro
$id_rango = 1;  // Novato
$id_foto_perfil = 1;
$Id_foto_portada = 1;

$sql = "INSERT INTO usuarios (
            nombre_usuario, correo, contraseña, horas_jugadas,
            fecha_registro, juegos_jugados, descripcion,
            fecha_nacimiento, id_region, id_pais, id_genero, 
            id_logros, id_rango, id_foto_perfil, id_foto_portada
        ) VALUES (
            ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?
        )";

$stmt = $conn->prepare($sql);

if (!$stmt) {
    die("Error en la preparación: " . $conn->error);
}

$stmt->bind_param("sssisissiiiiiii", $nombre_usuario, $correo, $contraseña,
                  $horas_jugadas, $fecha_registro, $juegos_jugados, $descripcion,
                  $fecha_nacimiento, $id_region, $id_pais,
                  $id_genero, $id_logros, $id_rango, $id_foto_perfil, $Id_foto_portada);

if ($stmt->execute()) {
    echo "✅ Usuario de prueba insertado con éxito.";
} else {
    echo "❌ Error al insertar usuario: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
