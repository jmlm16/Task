<?php
require("BD.php");
$conexion=crearConexionBD();
$materiales=getEntradaBD($conexion,"MATERIAL");
$reservas=getReservasDeMaterial($conexion);
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
			
			<h3>Material</h3>
			<div id="tabla" >
				<table>	
					<tr id="fila1">
						<td>Tipo</td>
						<td>Stock</td>
						<td>Proveedor</td>
					</tr>
				 <?php foreach($materiales as $material){?>				
						<tr>
							<td><?php echo $material["TIPO"]?></td>
							<td><?php echo $material["STOCK"]?></td>
							<td><?php echo $material["PROVEEDOR"]?></td>
						</tr>	
				<?php }?>	
				</table>
			</div>
		
			<br />

			<h3>Reservas</h3>
			<div id="tabla" >
				<table>	
					<tr id="fila1">
						<td>Tipo</td>
						<td>Reservado por</td>
						<td>Hora de reserva</td>
						<td>Hora de  devolución</td>
					</tr>
				 <?php foreach($reservas as $reserva){?>				
						<tr >
							<td><?php echo $reserva["TIPO"]?></td>
							<td><?php echo $reserva["NOMBRE"]?></td>
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
