<?php
require("BD.php");
$conexion=crearConexionBD();
$reservas=getReservasDePistas($conexion);
$pistas = getEntradaBD($conexion,"PISTA");
?>
<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="UTF-8">		

		<title>Club Deportivo Unión Sevilla</title>
		<meta name="description" content="">
		<meta name="author" content="IISSI">

		<meta name="viewport" content="width=device-width; initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
		<link rel="shortcut icon" href="/images/favicon.ico">
		
		<link rel="stylesheet" href="css/stylesheet.css" type="text/css">
		<link rel="stylesheet" href="css/tablas.css" type="text/css">
		<script src="js/jquery-2.1.1.min.js"></script>
	</head>

	<body>
		
			<header class="cabecera">
				<?php include_once('cabecera.php');?>
			</header>
			
			<?php include_once('menuHorizontal.php')?>
			<?php include_once('bloqueIzquierda.php')?>
			
			<h3>Pistas</h3>
			<div id="tablapistas" >
				<table>	
					<tr id="fila1">
						<td>Lugar</td>
					</tr>
				 <?php foreach($pistas as $pista){?>				
						<tr>
							<td><?php echo $pista["LUGAR"]?></td>
						</tr>	
				<?php }?>	
				</table>
			</div>
			
			<br />
			
			<h3>Reservas</h3>
			<div id="tablareservaspista" >
				<table>	
					<tr id="fila1">
						<td>ID</td>
						<td>Lugar</td>
						<td>Reservado por</td>
						<td>Hora de reserva</td>
						<td>Hora de  devolución</td>
					</tr>
				 <?php foreach($reservas as $reserva){?>				
						<tr>
							<td id="columna1"><?php echo $reserva["IDPISTA"]?></td>
							<td><?php echo $reserva["LUGAR"]?></td>
							<td><?php echo $reserva["NOMBRE"]?> <?php echo $reserva["APELLIDOS"]?></td>
							<!--<td><?php echo date_format($date, 'd/m/Y H:i') ?></td>-->
							<td><?php echo $reserva["HORAINICIO"]?></td>
							<td><?php echo $reserva["HORAFIN"]?></td>
						</tr>	
				<?php }?>	
				</table>
			</div>
			
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
	</body>
</html>
