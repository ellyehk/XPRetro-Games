<?php
require 'conexion.php';

$id = $_GET['id'] ?? 1;

// Obtener información del juego
$stmt = $conn->prepare("SELECT Nombre, Desarrollador, Clasificacion, Fecha_publicacion, Ultima_actualizacion, Tecnologia, Plataforma FROM juegos WHERE Id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$resultado = $stmt->get_result();

if ($resultado->num_rows === 0) {
    echo "<p class='text-white'>Juego no encontrado.</p>";
    exit;
}

$juego = $resultado->fetch_assoc();

// Obtener categorías
$stmt2 = $conn->prepare("
    SELECT c.Nombre
    FROM categorias c
    INNER JOIN juego_categoria jc ON c.Id = jc.Id_categoria
    WHERE jc.Id_juego = ?
");
$stmt2->bind_param("i", $id);
$stmt2->execute();
$resultado2 = $stmt2->get_result();

$categorias = [];
while ($fila = $resultado2->fetch_assoc()) {
    $categorias[] = $fila['Nombre'];
}
?>

<div class="container">
    <div class="row text-white">
        <!-- INFO GAME CARD -->
        <div class="col-8">
            <div class="row game-card">
                <!-- PORTADA DEL JUEGO -->
                <div class="col-md-4 game-cover">
                    <?php $idJuego = intval($_GET['id'] ?? 1); ?>
                    <img src="/public/Img/posterJuegos/poster<?= $idJuego ?>.png" alt="Portada del juego"
                        class="img-fluid">
                </div>
                <!-- INFORMACION DEL JUEGO -->
                <div class="col-md-8">
                    <h5><?= htmlspecialchars($juego['Nombre']) ?></h5>

                    <div class="info-row"><span
                            class="info-label">Desarrollador:</span><span><?= htmlspecialchars($juego['Desarrollador']) ?></span>
                    </div>
                    <div class="info-row"><span
                            class="info-label">Clasificación:</span><span><?= htmlspecialchars($juego['Clasificacion']) ?>/10</span>
                    </div>
                    <div class="info-row"><span class="info-label">Publicado
                            en:</span><span><?= htmlspecialchars($juego['Fecha_publicacion']) ?></span></div>
                    <div class="info-row"><span class="info-label">Última
                            actualización:</span><span><?= htmlspecialchars($juego['Ultima_actualizacion']) ?></span>
                    </div>
                    <div class="info-row"><span
                            class="info-label">Tecnología:</span><span><?= htmlspecialchars($juego['Tecnologia']) ?></span>
                    </div>
                    <div class="info-row"><span
                            class="info-label">Plataforma:</span><span><?= htmlspecialchars($juego['Plataforma']) ?></span>
                    </div>
                </div>
            </div>
        </div>

        <!-- CATEGORÍAS -->
        <div class="col-4 text-white">
            <h5>Categoría</h5>
            <div class="flex-wrap">
                <?php foreach ($categorias as $cat): ?>
                    <button class="button-bg me-3 mb-2"><?= htmlspecialchars($cat) ?></button>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
</div>