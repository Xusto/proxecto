<?php
// session_start();
header('Content-type: text/xml');

if( ! isset($_GET['idtenda']) ){
	echo "<erro mensaxe='Falta o parámetro idtenda' >Erro ó inserir o produto</erro>";
	exit();
}

if( ! isset($_GET['nome']) ){
	echo "<erro mensaxe='Falta o parámetro nome' >Erro ó inserir o produto</erro>";
	exit();
}

if( ! isset($_GET['descript']) ){
	echo "<erro mensaxe='Falta o parámetro descript' >Erro ó inserir o produto</erro>";
	exit();
}

if( ! isset($_GET['prezo']) ){
	echo "<erro mensaxe='Falta o parámetro prezo' >Erro ó inserir o produto</erro>";
	exit();
}

require("bd.php");


$sql  = "INSERT INTO producto (nome, descript, urlFoto) ";
$sql .= "VALUES ('" . $_GET['nome'] . "', '" . $_GET['descript'] . "', '');";

// echo $sql;

if($bd->query($sql)) {

    $sql = "SELECT last_insert_id() as id";
   
// echo $sql;
    $resultado = $bd->query($sql);
	$fila = $resultado->fetch_array();
	
	$sql  = "INSERT INTO tenda_producto (tenda_idtenda, producto_idproducto, prezo) ";
    $sql .= "VALUES ('" . $_GET['idtenda'] . "', '" . $fila['id'] . "', '". $_GET['idtenda'] . "');";
    
    $bd->query($sql);
    
    echo "<exito/>";
	
} else {
    echo "error";
}
?>
