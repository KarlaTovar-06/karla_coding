<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>Formulario</title>
</head>
<body>
    <div class="nav-bar">Barra navegación
        <a href="index.php">Inicio</a>
        <a href="edificios.php">Edificios</a>
        <a href="formulario.php">Formulario</a>
    </div>

    <!-- AÑADIR EDIFICIOS -->
    <div class="container">
        <h2>Añadir Edificación</h2>
        <form method="POST">
            Nombre: <input type="text" name="nombre"> <br>
            Genero Edificio: <br>
            Uso Actual: <br>
            <textarea id="usoActual" name="usoActual" rows="5" cols="50" placeholder="ssssssss"></textarea> <br>
            Fecha de Construcción: <input type="date" 
            name="fechaConstruc"> <br>
            
            <!-- Arquitecto(s) o Ingeniero(s): <br> -->
            <!-- <select name='arquitectos'>
                <option value="">Seleccione una opción.</option>
                <?php 
                    // require 'backend/conexion.php';

                    // $arquis = mysqli_query($conexion, "SELECT idPersonaje, nomPer, apellido FROM personaje");

                    // if (mysqli_num_rows($arquis) > 0) {
                    //     while ($fila = mysqli_fetch_assoc($arquis)) {
                    //     echo "<option value='" . $fila["idPersonaje"] . "'>" . $fila["nomPer"] .' '. $fila["apellido"] . "</option>";}
                    // }
                    // else {
                    //     echo "Error con la conexión.";
                    // }
                ?>
            </select> <br>
            <button id="botonAgregarSelect">Agregar Personaje.</button> <br>
            <div id="contenedorSelect"></div> -->
            <!-- SECCION ELIMINADA PORQUE SE ASOCIARÁN LOS PERSONAJES EN OTRO APARTADO -->

            <div class="container" style="background-color: cornsilk;">
                <h3>Ubicación:</h3>
                URL dirección en Google Maps: <input type="text" name="urlUbi"> <br>
                Calle: <input type="text" name="calle"> <br>
                Estado:
                    <select name='estados' onchange='getMunicipios(this.value)'>
                        <option value="">Seleccione una opción.</option>
                        <?php 
                            require 'backend/conexion.php';

                            $estados = mysqli_query($conexion, "SELECT nukidestado, chd_estado FROM estado");

                            if (mysqli_num_rows($estados) > 0) {
                                while ($fila = mysqli_fetch_assoc($estados)) {
                                echo "<option value='" . $fila["nukidestado"] . "'>" . $fila["chd_estado"] ."</option>";}
                            }
                            else {
                                echo "Error con la conexión.";
                            }
                        ?>
                    </select> <br>
                Municipio:
                <select name='municipios' onchange='getColonias(this.value)' id='municipios'>
                    <option value="">Seleccione una opción.</option>
                </select> <br>
                Colonia:
                <select name="colonias" id="colonias">
                    <option value="">Seleccione una opción.</option>
                </select>
            </div>

            Contexto Histórico: <br>
            <textarea id="contexto" name="contexto" rows="5" cols="50"></textarea> <br>

            <div class="container" style="background-color: cornsilk;">
                <h3>Descripcion del Edificio</h3>
                Concepto: <br>
                <textarea id="concepto" name="concepto" rows="5" cols="50"></textarea> <br>
            </div>

            Corriente Estilística: <br>
            <textarea id="corrienteEst" name="corrienteEst" rows="5" cols="50"></textarea> <br>

            Materiales y Sistema: <br>
            <textarea id="matYSist" name="matYSist" rows="5" cols="50"></textarea> <br>

            Contexto Urbano: <br>
            <textarea id="contextUrb" name="contextUrb" rows="5" cols="50"></textarea> <br>

            Transformaciones del espacio: <br>
            <textarea id="transform" name="transform" rows="5" cols="50"></textarea> <br>
        </form>
    </div>
    <!--  -->

    <!-- AÑADIR ESPACIOS URBANOS -->
    <div class="container">
        <h2>Añadir Espacio Urbano</h2>
        <form method="POST">
            Nombre: <input type="text" name="nombre"> <br>

            Periodo de Construcción: <br>
            <textarea id="periodoConstruc" name="periodoConstruc" rows="5" cols="50" placeholder="Inserte texto aquí..."></textarea> <br>

            Función: <br>
            <textarea id="funcion" name="funcion" rows="5" cols="50" placeholder="Inserte texto aquí..."></textarea> <br>

            <div class="container" style="background-color: cornsilk;">
                <h3>Ubicación:</h3>
                URL dirección en Google Maps: <input type="text" name="urlUbi"> <br>
                Calle: <input type="text" name="calle"> <br>
                Estado:
                    <select name='estados' onchange='getMunicipios(this.value)'>
                        <option value="">Seleccione una opción.</option>
                        <?php 
                            require 'backend/conexion.php';

                            $estados = mysqli_query($conexion, "SELECT nukidestado, chd_estado FROM estado");

                            if (mysqli_num_rows($estados) > 0) {
                                while ($fila = mysqli_fetch_assoc($estados)) {
                                echo "<option value='" . $fila["nukidestado"] . "'>" . $fila["chd_estado"] ."</option>";}
                            }
                            else {
                                echo "Error con la conexión.";
                            }
                        ?>
                    </select> <br>
                Municipio:
                <select name='municipios' onchange='getColonias(this.value)' id='municipios'>
                    <option value="">Seleccione una opción.</option>
                </select> <br>
                Colonia:
                <select name="colonias" id="colonias">
                    <option value="">Seleccione una opción.</option>
                </select>
            </div>

            Contexto Histórico: <br>
            <textarea id="contexto" name="contexto" rows="5" cols="50"></textarea> <br>

            <div class="container" style="background-color: cornsilk;">
                <h3>Descripcion del Edificio</h3>
                Plan Urbanistico: <br>
                <textarea id="plan" name="plan" rows="5" cols="50"></textarea> <br>
                Características: <br>
                <textarea id="caracteristicas" name="caracteristicas" rows="5" cols="50"></textarea> <br>
                Orientación: <br>
                <textarea id="orientacion" name="orientacion" rows="5" cols="50"></textarea> <br>
                Dimensiones: <br>
                <textarea id="dimensiones" name="dimensiones" rows="5" cols="50"></textarea> <br>
                Secciones: <br>
                <textarea id="secciones" name="secciones" rows="5" cols="50"></textarea> <br>
                Elementos de la imagen urbana: <br>
                <textarea id="elementos" name="elementos" rows="5" cols="50"></textarea> <br>
                Tipos de edificaciones que rodean el espacio urbano: <br>
                <textarea id="tiposEdif" name="tiposEdif" rows="5" cols="50"></textarea> <br>
            </div>

            Transformaciones del espacio: <br>
            <textarea id="transform" name="transform" rows="5" cols="50"></textarea> <br>

            Principios del diseño: <br>
            <textarea id="principiosDis" name="principiosDis" rows="5" cols="50"></textarea> <br>

            Importancia del espacio urbano: <br>
            <textarea id="importancia" name="importancia" rows="5" cols="50"></textarea> <br>

        </form>
    </div>

    <!-- AÑADIR PERSONAJES -->
    <div class="container">
        <h2>Añadir Arquitecto o Ingeniero</h2>
        <form action="backend/subir_personaje.php" method="POST">
            <div id="mensaje-exito" style="display: none;">
                <p>El registro se ha subido exitosamente a la base de datos.</p>
            </div>
            Nombre: <input type="text" name="nombre"> <br>
            Primer Apellido: <input type="text" name="apellido1"> <br>
            Segundo Apellido: <input type="text" name="apellido2"> <br>
            Fecha de Nacimiento: <input type="date" name="nacimiento"> <br>
            País de Origen:
            <select name='paises'>
                <option value="">Seleccione una opción.</option>
                <?php 
                    require 'backend/conexion.php';

                    $paises = mysqli_query($conexion, "SELECT idPais, nombre FROM pais");

                    if (mysqli_num_rows($paises) > 0) {
                        while ($fila = mysqli_fetch_assoc($paises)) {
                        echo "<option value='" . $fila["idPais"] . "'>" . $fila["nombre"] . "</option>";}
                    }
                    else {
                        echo "Error con la conexión.";
                    }
                ?>
            </select> <br>
            Información: <br>
            <textarea id="informacion" name="informacion" rows="5" cols="50"></textarea> <br>

            <input type="submit" name="subirArqui" value="Subir Personaje">

        </form>
    </div>

    <div class="footer footer-J">
        Pie de página
    </div>

    <!-- JAVASCRIPT -->
    <script>
    function getMunicipios(estadoId) {
        // crea una instancia del objeto XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // configura la solicitud AJAX
        xhr.open('GET', 'backend/get_municipios.php?estado_id=' + estadoId, true);

        // define la función que se llamará cuando la solicitud AJAX se complete
        xhr.onload = function() {
            // comprueba si la solicitud AJAX se realizó correctamente
            if (this.status == 200) {
                // actualiza el select de municipios con los datos obtenidos
                document.getElementById('municipios').innerHTML = this.responseText;
            }
        };

        // envía la solicitud AJAX
        xhr.send();
    }

    function getColonias(municipioId) {
        // crea una instancia del objeto XMLHttpRequest
        var xhr = new XMLHttpRequest();

        // configura la solicitud AJAX
        xhr.open('GET', 'backend/get_colonias.php?municipio_id=' + municipioId, true);

        // define la función que se llamará cuando la solicitud AJAX se complete
        xhr.onload = function() {
            // comprueba si la solicitud AJAX se realizó correctamente
            if (this.status == 200) {
                // actualiza el select de municipios con los datos obtenidos
                document.getElementById('colonias').innerHTML = this.responseText;
            }
        };

        // envía la solicitud AJAX
        xhr.send();
    }

    // Obtener el valor de éxito en la URL
    const urlParams = new URLSearchParams(window.location.search);
    const exito = urlParams.get('exito');
    // Mostrar el mensaje de éxito si se encuentra el valor en la URL
    if (exito) {
        document.getElementById('mensaje-exito').style.display = 'block';
    }
</script>
</body>
</html>