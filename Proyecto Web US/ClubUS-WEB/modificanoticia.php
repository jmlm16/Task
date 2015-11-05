<?php

	session_start();
	
	include_once("BD.php");
	include_once("validar.php");
	
	$conexion=crearConexionBD();
	
	if(isset($_SESSION['error'])){
		unset($_SESSION['error']);
	}
	$errores="";
	
	if(isset($_REQUEST['nid']) && validarEntero($_REQUEST['nid'])){
		$id=$_REQUEST['nid'];
	}
	
	if(isset($_REQUEST['ntitulo']) && validarRequerido($_REQUEST['ntitulo'])){
	$titulo= $_REQUEST['ntitulo'];
	}else{
		$errores = $errores . "Titulo no introducido\n";
	}
	if(isset($_REQUEST['nautor'])&& validarRequerido($_REQUEST['nautor'])){
	$autor= $_REQUEST['nautor'];
	}else{
		$errores = $errores . "Autor no introducido\n";
	}
	if(isset($_REQUEST['ncontenido'])&& validarRequerido($_REQUEST['ncontenido'])){
	$contenido=$_REQUEST['ncontenido']; 
	} else{
		$errores = $errores . "Sin contenido\n";
	}  
    
	if(strcmp($errores, "")!=0){
		$_SESSION['error']=$errores;
		header("Location: modificarNoticia.php");
	}else{
    
	try{
		modificaNoticia($conexion,$id,$titulo,$autor,$contenido);
		header("Location: noticias.php");
	}catch(PDOException $e){
		if(isset($_SESSION['error'])){
			unset($_SESSION['error']);
		}
		$_SESSION['error'] = "Error modificando noticia";
		header("Location: error.php");
	}
	}
	
    CerrarConexionBD($conexion); 
?>