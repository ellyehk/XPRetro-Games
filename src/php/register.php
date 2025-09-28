<?php
require 'conexion.php';

// Sanitizar y validar entrada
$username = $_POST['username'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$foto_perfil_id = $_POST['foto_perfil_id'] ?? 1;

// Validación básica
if (!$username || !$email || !$password) {
    echo json_encode(["success" => false, "message" => "Datos incompletos."]);
    exit;
}

// Verificar si ya existe ese correo
$check = $conn->prepare("SELECT id FROM usuarios WHERE correo = ?");
$check->bind_param("s", $email);
$check->execute();
$check->store_result();
if ($check->num_rows > 0) {
    echo json_encode(["success" => false, "message" => "El correo ya está registrado."]);
    exit;
}
$check->close();

// Valores predeterminados para campos obligatorios
$horas_jugadas = 0;
$fecha_registro = date('Y-m-d');
$juegos_jugados = 0;
$descripcion = "Nuevo usuario";
$fecha_nacimiento = "2000-01-01";
$id_region = 1;
$id_pais = 7;
$id_genero = 1;
$id_logros = 1;
$id_rango = 1;
$id_foto_portada = 1;

// ❗ CORREGIDO: hash de contraseña
$passwordHash = password_hash($password, PASSWORD_DEFAULT);

$stmt = $conn->prepare("INSERT INTO usuarios (
    nombre_usuario, correo, contraseña, horas_jugadas, 
    fecha_registro, juegos_jugados, descripcion, fecha_nacimiento,
    id_region, id_pais, id_genero, id_logros, id_rango,
    id_foto_perfil, id_foto_portada
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

$stmt->bind_param(
    "sssissssiiiiiii",
    $username,
    $email,
    $passwordHash,
    $horas_jugadas,
    $fecha_registro,
    $juegos_jugados,
    $descripcion,
    $fecha_nacimiento,
    $id_region,
    $id_pais,
    $id_genero,
    $id_logros,
    $id_rango,
    $foto_perfil_id,
    $id_foto_portada
);

if ($stmt->execute()) {
    echo json_encode(["success" => true]);
} else {
    echo json_encode(["success" => false, "message" => "Error al registrar: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
