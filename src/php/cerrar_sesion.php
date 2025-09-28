<?php
session_start();
setcookie("sesion_token", "", time() - 3600, "/"); // eliminar cookie
session_destroy();
echo json_encode(["success" => true]);
?>