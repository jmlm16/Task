<?php
   
    session_start();
	
	include_once("BD.php");
	include_once("validar.php");
	
	$conexion=crearConexionBD();
	
	if(isset($_SESSION['error'])){
		unset($_SESSION['error']);
	}
	$errores="";
	
	if(isset($_REQUEST['oficialreservadni']) && validarRequerido($_REQUEST['oficialreservadni']) ){
		$dni=$_REQUEST['oficialreservadni'];
	}
	
	if(isset($_REQUEST['reserva_horai']) && validarFecha($_REQUEST['reserva_horai'],"d/m/Y") ){
		$horai=$_REQUEST['reserva_horai'];
	}else{
		$errores = $errores . "Hora no introducida adecuadamente DD/MM/YYYY.\n";
	}
	if(isset($_REQUEST['reserva_horaf']) && validarFecha($_REQUEST['reserva_horaf'],"d/m/Y") ){
		$horaf=$_REQUEST['reserva_horaf'];
	}else{
		$errores = $errores . "Hora no introducida adecuadamente DD/MM/YYYY.\n";
	}
	$pista=$_REQUEST['select_pista'];
	$material=$_REQUEST['select_material'];
	
	$compare="---";
	if(strcmp($pista,$compare)==0){
		$idpista='null';
	} else {
		$idpistas=getEntradaCondicionNumBD($conexion,"PISTA","IDPISTA",$pista);
		foreach ($idpistas as $a) {
			$idpista=$a['IDPISTA'];
		}
	}
    if(strcmp($material,$compare)==0){
		$idmaterial='null';
	} else{
		$idmateriales=getEntradaCondicionNumBD($conexion,"MATERIAL","IDMATERIAL",$material);
		foreach ($idmateriales as $i) {
			$idmaterial=$i['IDMATERIAL'];
		}
	}
	
	if(strcmp($errores, "")!=0){
		$_SESSION['error']=$errores;
		header("Location: componentes.php");
	}else{
    
	
	try{
		insertaReserva($conexion,$dni,$horai,$horaf,$idpista,$idmaterial);
		header("Location: componentes.php");
	}catch(PDOException $e){
		if(isset($_SESSION['error'])){
			unset($_SESSION['error']);
		}
		$_SESSION['error'] = "Error agregando reserva";
		header("Location: error.php");
	}
	
	}
    CerrarConexionBD($conexion);    
   
?>