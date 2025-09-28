<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

echo "📦 Conectando a la base de datos...<br>";

// Conexión a la base de datos
$conexion = new mysqli("localhost", "root", "", "xp_retro_games");

// Verificar conexión
if ($conexion->connect_error) {
    die("❌ Error de conexión: " . $conexion->connect_error);
}
echo "✅ Conexión exitosa<br>";

// Verificar si llegan los datos POST
if (!isset($_POST["username"], $_POST["email"], $_POST["password"])) {
    echo "⚠️ No llegaron todos los datos esperados.<br>";
    echo "Datos recibidos: " . json_encode($_POST);
    exit;
}

$nombre_usuario = trim($_POST["username"]);
$correo = trim($_POST["email"]);
$contraseña = trim($_POST["password"]);

echo "🧾 Datos recibidos:<br>";
echo "Usuario: $nombre_usuario<br>";
echo "Correo: $correo<br>";
echo "Contraseña (plana): $contraseña<br>";

// Validación de campos vacíos
if ($nombre_usuario === "" || $correo === "" || $contraseña === "") {
    echo "⚠️ Algún campo está vacío.";
    exit;
}

// Encriptar contraseña
$contraseña_hash = password_hash($contraseña, PASSWORD_DEFAULT);

// Valores por defecto
$horas_jugadas = 0;
$fecha_registro = date("Y-m-d");
$descripcion = "Nuevo usuario";
$fecha_nacimiento = "2000-01-01";
$id_region = 1;
$id_pais = 1;
$id_genero = 1;
$id_logros = 1;
$id_rango = 1;

echo "🔐 Contraseña encriptada: $contraseña_hash<br>";

// COMENTAR LA INSERCIÓN para depuración inicial
echo "<br>🚧 Deteniendo antes de insertar en la base de datos para pruebas.";
exit;

// Si quieres probar la inserción, descomenta este bloque:
/*
$sql = "INSERT INTO usuarios (
    Nombre_usuario, Correo, Contraseña, Horas_jugadas, Fecha_registro, Descripcion,
    Fecha_nacimiento, Id_region, Id_pais, Id_genero, Id_logros, Id_rango
) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

$stmt = $conexion->prepare($sql);
if (!$stmt) {
    echo "❌ Error al preparar SQL: " . $conexion->error;
    exit;
}

$stmt->bind_param("sssisssiiiii",
    $nombre_usuario,
    $correo,
    $contraseña_hash,
    $horas_jugadas,
    $fecha_registro,
    $descripcion,
    $fecha_nacimiento,
    $id_region,
    $id_pais,
    $id_genero,
    $id_logros,
    $id_rango
);

if ($stmt->execute()) {
    echo "✅ Usuario registrado correctamente.";
} else {
    echo "❌ Error al ejecutar SQL: " . $stmt->error;
}

$stmt->close();
$conexion->close();
*/
?>
