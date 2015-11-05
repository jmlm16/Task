<?php

	session_start();
	
	include_once("BD.php");
	include_once("validar.php");
	
	$conexion=crearConexionBD();
	
	if(isset($_SESSION['error'])){
		unset($_SESSION['error']);
	}
	$errores="";
	
	if(isset($_REQUEST['ntitulo']) && validarRequerido($_REQUEST['ntitulo'])){
		$titulo= $_REQUEST['ntitulo'];
	}else{	
		$errores = $errores . "Error insertando titulo\n";
	}
	if(isset($_REQUEST['nautor']) && validarRequerido($_REQUEST['nautor'])){
		$autor= $_REQUEST['nautor'];
	}else{
		$errores = $errores . "Error insertando autor\n";
	}
	if(isset($_REQUEST['ncontenido']) && validarRequerido($_REQUEST['ncontenido'])){
		$contenido=$_REQUEST['ncontenido']; 
	}else{
		$errores = $errores . "Error insertando contenido\n";
	}
	
	if(strcmp($errores, "")!=0){
		$_SESSION['error']=$errores;
		header("Location: crearNoticia.php");
	}else{
    
	try{
		insertaNoticia($conexion,$titulo,$autor,$contenido);
		header("Location: noticias.php");
	}catch(PDOException $e){
		if(isset($_SESSION['error'])){
			unset($_SESSION['error']);
		}
		$_SESSION['error'] = "Error agregando noticia";
		header("Location: error.php");
	}
	
	}
     CerrarConexionBD($conexion); 
?>