<?php
header('Content-type: text/xml');
require("bd.php");

if(isset($_GET['idtenda'])) {
	$sql = "SELECT * FROM producto JOIN tenda_producto ON tenda_producto.producto_idproducto = producto.idproducto WHERE ";
			$sql .= " tenda_producto.tenda_idtenda = '" . $_GET['idtenda'] . "';";
}
else {
	die ("<erro>Falta o id da tenda</erro>");
}


$resultado = $bd->query($sql);

echo "<?xml version=\"1.0\" encoding=\"utf8\" standalone=\"yes\"?>";
echo "<productos>";
while($fila = $resultado->fetch_array()){
	echo "<producto";
	echo " id_producto='".$fila['idproducto'] . "'";
	echo " nome='".$fila['nome'] . "'";
	echo " descricion='" . $fila['descript'] . "'";
	echo " foto='".$fila['foto'] . "'";
	echo " prezo='".$fila['prezo'] . "'";
	echo "/>";
}
echo "</productos>";

?>

