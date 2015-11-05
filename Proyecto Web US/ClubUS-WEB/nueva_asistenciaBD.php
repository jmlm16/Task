<?php
    session_start();
	
	include("BD.php");
	include_once("validar.php");
	$conexion=crearConexionBD();
	
	if(isset($_SESSION['error'])){
		unset($_SESSION['error']);
	}
	$errores="";
	
	if(isset($_REQUEST['tipoeventoasistencia']) && validarRequerido($_REQUEST['tipoeventoasistencia'])){
		$tipo=$_REQUEST['tipoeventoasistencia'];
	}else{
		$errores= $errores ."Tipo de evento no introducido.";
	}
	if(isset($_REQUEST['fechaeventoasistencia']) && validarFecha($_REQUEST['fechaeventoasistencia'])){
		$fecha=$_REQUEST['fechaeventoasistencia'];
	}else{
		$errores=$errores."Fecha de evento no introducido.";
	}
	
	$num=$_REQUEST['numElements'];
	
	if(strcmp($errores, "")!=0){
		$_SESSION['error']=$errores;
		header("Location: nueva_asistencia.php");
	}else{
    
	for($i=1;$i<$num;$i++){
    	$dni=$_REQUEST['dni'.$i];
		$falta=$_REQUEST['select'.$i];
		try{
			insertaAsistencia($conexion,$dni,$tipo,$fecha,$falta);
			header("Location: equipos.php");
		}catch(PDOException $e){
			if(isset($_SESSION['error'])){
			unset($_SESSION['error']);
		}
		$_SESSION['error'] = "Error agregando asistencia.";
		header("Location: error.php");
		}
	}
	}
    CerrarConexionBD($conexion);   
?>