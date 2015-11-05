<?php
    
    session_start();
	include_once("BD.php");
	include_once("validar.php");
	$conexion = crearConexionBD();
	
	if(isset($_SESSION['error'])){
		unset($_SESSION['error']);
	}
	$errores="";
	
	if(isset($_REQUEST['fdni']) && filter_var($_REQUEST['fdni'], FILTER_VALIDATE_INT)){
		$dni = $_REQUEST['fdni'];
	}else{
		$errores = $errores . "Dni no introducido\n";
	}
	if(isset($_REQUEST['fnombre']) && validarRequerido($_REQUEST['fnombre'])){
		$nombre = $_REQUEST['fnombre'];
	}else{
		$errores = $errores . "Nombre no introducido\n";
	}	
	if(isset($_REQUEST['fapellidos']) && validarRequerido($_REQUEST['fapellidos'])){
		$apellidos = $_REQUEST['fapellidos'];
	}else{
		$errores = $errores . "Apellidos no introducido\n";
	}	
	if(isset($_REQUEST['ftelefono'])&& filter_var($_REQUEST['ftelefono'], FILTER_VALIDATE_INT)){
	$telefono = $_REQUEST['ftelefono'];
	}else{
		$errores = $errores . "Telefono no introducido\n";
	}	
	if(isset($_REQUEST['femail']) && validarEmail($_REQUEST['femail'])){
	$email = $_REQUEST['femail'];
	}else{
		$errores = $errores . "Email no introducido\n";
	}
	
	if(strcmp($errores, "")!=0){
		$_SESSION['error']=$errores;
		header("Location: crearNoticia.php");
	}else{
    
	try{
		insertaSocio($conexion,$dni,$nombre,$apellidos,$telefono,$email);
		header("Location: sociosok.php");
	}catch(PDOException $e){
		if(isset($_SESSION['error'])){
			unset($_SESSION['error']);
		}
		$_SESSION['error'] = "Error agregando socio";
		header("Location: error.php");
	}
	}
	 CerrarConexionBD($conexion);
	  
?>