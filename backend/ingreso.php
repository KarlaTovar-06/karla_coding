<?php

include 'conexion.php';

// Escapar los datos POST
$usuarioOcorreo = mysqli_real_escape_string($conexion, $_POST['usuario']);
$contraseña = mysqli_real_escape_string($conexion, $_POST['contraseña']);

if (empty($_POST['usuario'] || $_POST['contraseña'])){
    echo '
    <script>
        alert("¡Existen Campos Vacíos! Por favor, complete todos los campos.");
        window.location= "../login.php";
    </script>  
    ';
    exit();
}

$verificar_correo = mysqli_query($conexion, "SELECT*FROM usuarios WHERE correo='$usuarioOcorreo' ");

$verificar_usuario = mysqli_query($conexion, "SELECT*FROM usuarios WHERE usuario='$usuarioOcorreo' ");

if (mysqli_num_rows($verificar_usuario) > 0) {
    $sql = $conexion->query("SELECT*FROM usuarios WHERE usuario='$usuarioOcorreo' and contraseña = '$contraseña'");
    if ($datos = $sql->fetch_object()){
        header("location:../formulario.php");
    } else {
        echo '
        <script>
            alert("¡ACCESO DENEGADO!");
            window.location= "../login.php";
        </script>  
        ';
    }
} else if (mysqli_num_rows($verificar_correo) > 0){
    $sql = $conexion->query("SELECT*FROM usuarios WHERE correo='$usuarioOcorreo' and contraseña = '$contraseña'");
    if ($datos = $sql->fetch_object()){
        header("location:../formulario.php");
    } else {
        echo '
        <script>
            alert("¡ACCESO DENEGADO!");
            window.location= "../login.php";
        </script>  
        ';
    }
}


?>