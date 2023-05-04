<?php
    require 'conexion.php';

    if (isset($_POST['subirArqui'])){
        // Establecer la conexión a la base de datos
        require 'conexion.php';

        // Escapar los datos POST
        $nombre = mysqli_real_escape_string($conexion, $_POST['nombre']);
        $apellidoUno = mysqli_real_escape_string($conexion, $_POST['apellido1']);
        $apellidoDos = mysqli_real_escape_string($conexion, $_POST['apellido2']);
        $nacimiento = mysqli_real_escape_string($conexion, $_POST['nacimiento']);
        $pais = mysqli_real_escape_string($conexion, $_POST['paises']);
        $informacion = mysqli_real_escape_string($conexion, $_POST['informacion']);

        // Construir la consulta SQL utilizando los valores escapados
        $sql = "INSERT INTO personaje (nomPer, apellido, apellido2, fechaNac, idPais, informacion) 
                VALUES ('$nombre', '$apellidoUno', '$apellidoDos', '$nacimiento', '$pais', '$informacion')";

        // Ejecutar la consulta SQL
        if(mysqli_query($conexion, $sql)) {
            echo "El registro se ha subido exitosamente a la base de datos. <br>";
            unset($_POST['nombre']);
            unset($_POST['apellido1']);
            unset($_POST['apellido2']);
            unset($_POST['nacimiento']);
            unset($_POST['paises']);
            unset($_POST['informacion']);

            echo '
            <script>
                alert("Personaje Subido con éxito.");
                window.location= "../formulario.php";
            </script>  
            ';
            exit();
        } else {
            echo '
            <script>
                alert("Intentelo de nuevo");
                window.location= "../formulario.php";
            </script>  
            ';
        }
    }
?>