<?php
$servername = "localhost";
$username = "root";
$password = ".URh3Mbz[21TwE4Y";
$dbname = "arquitectura";

$conexion = mysqli_connect($servername, $username, $password, $dbname);

if (!$conexion) {
    die("Conexión fallida: " . mysqli_connect_error());
}
?>