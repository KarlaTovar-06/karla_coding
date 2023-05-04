<?php
require 'conexion.php';

$estadoId = $_GET['estado_id'];
echo "el valor del id estado es:" . $estadoId;

// consulta la base de datos para obtener los municipios correspondientes al estado
$municipios = mysqli_query($conexion, "SELECT nukidmunicipio, chd_municipio FROM municipio WHERE nukidestado = '$estadoId'");

// construye una cadena de opciones HTML con los municipios obtenidos
$options = '<option value="">Seleccione una opción.</option>';
if (mysqli_num_rows($municipios) > 0) {
    while ($fila = mysqli_fetch_assoc($municipios)) {
        $options .= "<option value='" . $fila["nukidmunicipio"] . "'>" . $fila["chd_municipio"] . "</option>";
    }
} else {
    $options = "<option value=''>No hay municipios disponibles.</option>";
}

// devuelve la cadena de opciones HTML
echo $options;
?>
