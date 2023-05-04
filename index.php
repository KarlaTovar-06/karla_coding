<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Espacio Urbano</title>
</head>
<body>
    <div class="nav-bar">Barra navegación
        <a href="index.php">Inicio</a>
        <a href="edificios.php">Edificios</a>
        <a href="login.php">Login</a>
    </div>

    <div class="main-image">IMAGEN PRINCIPAL</div>

    <div class="container">
        <div class="row container-section">
            <!-- <div class="card">jijii</div>
            <div class="card">jojo</div>
            <div class="card">jojo</div>
            <div class="card">jijii</div>
            <div class="card">jojo</div>
            <div class="card">jojo</div> -->
            <h2>Información</h2>
        </div>
    </div>


    <div class="container-section col-12">
        <h2>Container de Urbanismo</h2>
    </div>

    <div class="container-section col-12">
        <h2>Container de Edificios</h2>
    </div>

    <div class="container">
        <div class="row container-section">
            <h2>Container de Biografias</h2>
            <?php 
                require 'backend/conexion.php';
                $personaje = mysqli_query($conexion, "SELECT * FROM personaje");

                while ($fila = mysqli_fetch_assoc($personaje)) {
                    $nombre = $fila['nomPer'];
                    $apellido = $fila['apellido'];
                    $informacion = $fila['informacion'];
                
                    echo"<div class='card'>
                            <div class='card-body'>
                                <h5 class='card-title'>$nombre $apellido</h5>
                                <p class='card-text'>$informacion</p>
                            </div>
                        </div>";
                }
            ?>
        </div>
    </div>

    <div class="footer footer-J">
        Pie de página
    </div>
</body>
</html>