<?php
	
	session_start();
	
	include_once("BD.php");
	include("validar.php");
	
	if(isset($_SESSION['error'])){
		unset($_SESSION['error']);
	}
	$errores="";
	
	$conexon=crearConexionBD();
	if(isset($_REQUEST['dnijugadoralesion']) && validarRequerido($_REQUEST['dnijugadoralesion'])){
		$dni = $_REQUEST['dnijugadoralesion'];
	}
	
	if(isset($_REQUEST['tipolesion']) && validarRequerido($_REQUEST['tipolesion'])){
		$tipo=$_REQUEST['tipolesion'];
	}else{
		$errores = $errores . "Tipo no introducido.\n";
	}
	if(isset($_REQUEST['fechadeiniciolesion']) && validarFecha($_REQUEST['fechadeiniciolesion'],"d/m/Y")){
		$fechainicio=$_REQUEST['fechadeiniciolesion'];
	}else{
		$errores = $errores . "Fecha no introducida adecuadamente DD/MM/YYYY.\n";
	}
	if(isset($_REQUEST['fechadefinlesion']) && validarFecha($_REQUEST['fechadefinlesion'],"d/m/Y")){
		$fechafin=$_REQUEST['fechadefinlesion'];
	}else{
		$errores = $errores . "Fecha no introducida adecuadamente DD/MM/YYYY.\n";
	}
	$recaida=$_REQUEST['selec_lesion'];   
	
	if(strcmp($errores, "")!=0){
		$_SESSION['error']=$errores;
		header("Location: componentes.php");
	}else{
    
	try{
		insertaLesion($conexon,$dni,$tipo,$fechainicio,$fechafin,$recaida);
		header("Location: componentes.php");
	}catch(PDOException $e){
		if(isset($_SESSION['error'])){
			unset($_SESSION['error']);
		}
		$_SESSION['error'] = "Error agregando lesion.";
		header("Location: error.php");
	}
	}
    CerrarConexionBD($conexon); 
	
?>