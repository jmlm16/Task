<?php
    session_start();
	$_SESSION['select_reserva']=$_REQUEST['select_reserva'];
	header("Location: nueva_reserva.php");
?>