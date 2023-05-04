<?php
require 'conexion.php';

$municipioId = $_GET['municipio_id'];

// consulta la base de datos para obtener los municipios correspondientes al estado
$colonias = mysqli_query($conexion, "SELECT nukidcolonia, chdescripcion FROM colonia WHERE nukidmunicipio = '$municipioId'");

// construye una cadena de opciones HTML con los municipios obtenidos
$options = '<option value="">Seleccione una opción.</option>';
if (mysqli_num_rows($colonias) > 0) {
    while ($fila = mysqli_fetch_assoc($colonias)) {
        $options .= "<option value='" . $fila["nukidcolonia"] . "'>" . $fila["chdescripcion"] . "</option>";
    }
} else {
    $options = "<option value=''>No hay municipios disponibles.</option>";
}

// devuelve la cadena de opciones HTML
echo $options;
?>
