<?php
require("BD.php");
$conexion=crearConexionBD();
$equipos=getEntradaBD($conexion,"EQUIPO");
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
			
			<?php
			if(isset($_SESSION['error'])){
				?>
				<table id="tablaerror">
				<td>
					<?php 
						if(isset($_SESSION['error'])){
							echo $_SESSION['error'];
							unset($_SESSION['error']);
						}else{
							echo "Error";
						} 
					?>
				</td>
			</table>
				<?php
			}
		?>
			
			<div id="tabla">	

			<?php foreach($equipos as $equipo){?>	
				<a name="Equipo<?php echo $equipo["IDEQUIPO"]?>">&nbsp;</a>	
				<fieldset id="fieldcomponentes">			
					<legend>Equipo <?php echo $equipo["IDEQUIPO"]?></legend>					
					<p>Oficiales</p>
					<table>	
						<tr id="fila1">
							<td>Nombre</td>
							<td>Apellidos</td>
							<td>Titulacion</td>
						</tr>
				 <?php 
				 	$oficiales=getComponentesOficialesBD($conexion);
				 	foreach($oficiales as $oficial){
					if($equipo["IDEQUIPO"] == $oficial["IDEQUIPO"]){
					?>				
						<tr>
							<td><?php echo $oficial["NOMBRE"]?></td>
							<td><?php echo $oficial["APELLIDOS"]?></td>
							<td><?php echo $oficial["TITULACION"]?></td>
							<?php 
								if(isset($_SESSION['login'])){
									if($_SESSION['login']==1){		
							?>
							<td id="tclas">
								<form method="post" action="nueva_reserva.php">
									<input name="reservaoficial" type="hidden" value="<?php echo $oficial["NOMBRE"]?> <?php echo $oficial["APELLIDOS"]?>" />
									<input name="reservadni" type="hidden" value="<?php echo $oficial["DNI"]?>" />
									<button type="submit">Reserva</button>
								</form>	
							</td>
							<?php 	}
								}
							?>
						</tr>	
				<?php 
					}
				} 
				?>
					</table>
					<p>Jugadoras</p>
					<table>	
						<tr id="fila1">
							<td>Nombre</td>
							<td>Apellidos</td>
							<td>Posicion</td>
						</tr>
				<?php
					$jugadoras=getComponentesJugadorasBD($conexion);					 
					foreach($jugadoras as $jugadora){
					if($equipo["IDEQUIPO"] == $jugadora["IDEQUIPO"]){
					?>				
					<tr>
							<td><?php echo $jugadora["NOMBRE"]?></td>
							<td><?php echo $jugadora["APELLIDOS"]?></td>
							<td><?php echo $jugadora["POSICION"]?></td>
							<?php 
								if(isset($_SESSION['login'])){
									if($_SESSION['login']==1){	
							?>
							<td id="tcomp">
								<form method="post" action="lesion_nueva.php">
									<input name="lesionjugadora" type="hidden" value="<?php echo $jugadora["NOMBRE"]?> <?php echo $jugadora["APELLIDOS"]?>" />
									<input name="lesiondni" type="hidden" value="<?php echo $jugadora["DNI"]?>" />
									<button type="submit">Lesion</button>
								</form>				
							</td>
							<?php 	}
								}
							?>
					</tr>
					
				<?php } 
				}
				?>
				</table>
				</fieldset>
			<?php } ?>			
			
			
			</div>
			
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
			<?php CerrarConexionBD($conexion); ?>
	</body>
</html>
