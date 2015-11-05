<?php

	session_start();
	
	include_once("BD.php");
	include_once("validar.php");
	
	$conexion=crearConexionBD();
	
	if(isset($_REQUEST['contenido_borrar']) && validarEntero($_REQUEST['contenido_borrar'])){
	$id= $_REQUEST['contenido_borrar'];
	}
	
	try{
		deleteEntradaBD($conexion, 'NOTICIAS', 'IDNOTICIA', $id);
		header("Location: noticias.php");
	}catch(PDOException $e){
		if(isset($_SESSION['error'])){
			unset($_SESSION['error']);
		}
		$_SESSION['error'] = "Error borrando noticia";
		header("Location: error.php");
	}
	
     CerrarConexionBD($conexion); 
?>