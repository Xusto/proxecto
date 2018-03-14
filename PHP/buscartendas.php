<?php
header('Content-type: text/xml');
require("bd.php");

$sql = "SELECT * FROM tenda";
$resultado = $bd->query($sql);
	
echo "<tendas>";
while($fila = $resultado->fetch_array()){
	echo "<tenda";
	echo " id_tenda='".$fila['idtenda'] . "'";
	echo " nome='".$fila['nome'] . "'";
	echo " enderezo='" . $fila['enderezo'] . "'";
	echo " codpostal='".$fila['codpostal'] . "'";
	echo " latitude='".$fila['latitude'] . "'";
	echo " lonxitude='".$fila['lonxitude'] . "'";
	echo "/>";
}
echo "</tendas>";

?>