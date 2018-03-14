<?php
header('Content-type: text/xml');
require("bd.php");

if(isset($_GET['idproducto'])) {
	$sql = "SELECT * FROM comentario JOIN usuario ON comentario.usuario_idusuario = usuario.idusuario WHERE";
		$sql .= " comentario.producto_idproducto = '%$_GET[idproducto]%';";
}
else {
	die ("<erro>Falta o id de producto</erro>");
}


$resultado = $bd->query($sql);
	
echo "<comentarios>";
while($fila = $resultado->fetch_array()){
	echo "<comentario";
	echo " usuario='".$fila['usuario.nick'] . "'";
	echo " texto='".$fila['comentario.texto'] . "'";
	echo "/>";
}
echo "</comentarios>";

?>