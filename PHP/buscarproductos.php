<?php
header('Content-type: text/xml');
require("bd.php");

if(isset($_GET['idtenda'])) {
	$sql = "SELECT * FROM producto JOIN tenda_producto ON tenda_producto.producto_idproducto = producto.idproducto WHERE ";
			$sql .= " tenda_producto.tenda_idtenda = '%$_GET[idtenda]%';";
}
else {
	die ("<erro>Falta o id da tenda</erro>");
}


$resultado = $bd->query($sql);
	
echo "<productos>";
while($fila = $resultado->fetch_array()){
	echo "<producto";
	echo " id_producto='".$fila['producto.idproducto'] . "'";
	echo " nome='".$fila['producto.nome'] . "'";
	echo " descricion='" . $fila['producto.descr'] . "'";
	echo " foto='".$fila['producto.foto'] . "'";
	echo " prezo='".$fila['tenda_producto.prezo'] . "'";
	echo "/>";
}
echo "</productos>";

?>