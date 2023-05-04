<?php

include 'conexion.php';

// Escapar los datos POST
$nombre_completo = mysqli_real_escape_string($conexion, $_POST['nombre_completo']);
$correo = mysqli_real_escape_string($conexion, $_POST['correo']);
$usuario = mysqli_real_escape_string($conexion, $_POST['usuario']);
$contraseña = mysqli_real_escape_string($conexion, $_POST['contraseña']);

if (empty($_POST['nombre_completo'] || $_POST['correo'] || $_POST['usuario'] || $_POST['contraseña'])){
    echo '
    <script>
        alert("¡Existen Campos Vacíos! Por favor, complete todos los campos.");
        window.location= "../login.php";
    </script>  
    ';
    exit();
}

$query = "INSERT INTO usuarios(nombre_completo, correo, usuario, contraseña) 
            VALUES('$nombre_completo', '$correo', '$usuario', '$contraseña')";

$verificar_correo = mysqli_query($conexion, "SELECT*FROM usuarios WHERE correo='$correo' ");

if (mysqli_num_rows($verificar_correo) > 0) {
    echo '
    <script>
        alert("Este correo ya esta registrado, intente con otro diferente");
        window.location= "../login.php";
    </script>  
    ';
    exit();
}

$verificar_usuario = mysqli_query($conexion, "SELECT*FROM usuarios WHERE usuario='$usuario' ");

if (mysqli_num_rows($verificar_usuario) > 0) {
    echo '
    <script>
        alert("Este usuario ya esta registrado, intente con otro diferente");
        window.location= "../login.php";
    </script>  
    ';
    exit();
}

$ejecutar = mysqli_query($conexion, $query);

if ($ejecutar) {
    echo '
    <script>
        alert("Usario almacenado exitosamente");
        window.location= "../login.php";
    </script>  
    ';
} else {
    echo '
    <script>
        alert("Intentelo de nuevo");
        window.location= "../login.php";
    </script>  
    ';
}

mysqli_close($conexion);
