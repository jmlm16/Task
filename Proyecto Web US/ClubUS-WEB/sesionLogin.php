<?php

session_start();
include_once("BD.php");

$conexion = crearConexionBD();

$filas = $conexion->query("SELECT * FROM LOGIN WHERE USUARIO = '" . $_REQUEST['username'] . "'");
$_SESSION['login'] = 0;

foreach($filas as $fila){	
	if($fila['PASSWORD_USER'] == $_REQUEST['password']){
		$_SESSION['login'] = 1;
		$_SESSION['usuario'] = $_REQUEST['username'];
		$_SESSION['rol'] = $fila['ROL'];
		
	}
	 
}

if($_SESSION['login'] == 0){
	echo "Usuario no registrado.";
	header ("Location: login.php");	
}else{
	header ("Location: index.php");	
} 
	 
CerrarConexionBD($conexion);

?>