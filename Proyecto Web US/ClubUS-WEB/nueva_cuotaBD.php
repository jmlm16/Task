<?php
    session_start();
	
	include("BD.php");
	include("validar.php");
	
	$conexion=crearConexionBD();
	
	if(isset($_SESSION['error'])){
		unset($_SESSION['error']);
	}
	$errores="";
	
	if(isset($_REQUEST['fechaeventocuota']) && validarFecha($_REQUEST['fechaeventocuota'],"d/m/Y")){
		$fecha=$_REQUEST['fechaeventocuota'];
	}else{
		$errores = $errores . "Fecha de cuota no introducida.\n";
	}
	$num=$_REQUEST['numElementscuota'];
	
	if(strcmp($errores, "")!=0){
		$_SESSION['error']=$errores;
		header("Location: nueva_cuota.php");
	}else{
    
	for($i=1;$i<$num;$i++){
    	$dni=$_REQUEST['dnicuota'.$i];
		$pago=$_REQUEST['selectpago'.$i];
		try{
			insertaCuota($conexion,$dni,$pago,$fecha);
			header("Location: equipos.php");
		}catch(PDOException $e){
			if(isset($_SESSION['error'])){
			unset($_SESSION['error']);
		}
		$_SESSION['error'] = "Error agregando cuota.";
		header("Location: error.php");
		}
	}
	}
	
    CerrarConexionBD($conexion);   
?>