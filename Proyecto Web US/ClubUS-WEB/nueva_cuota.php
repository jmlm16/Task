<?php
	require("BD.php");
	$conexion=crearConexionBD();
	$jugadoras=getComponentesJugadorasBD($conexion);
	$i= 1;
?>

<!DOCTYPE html>
<html lang="es">
	<head>
		
		<meta charset="UTF-8">		
		<title>Club Deportivo Unión Sevilla</title>
		<meta name="description" content="">
		<meta name="author" content="JaviBF">

		<meta name="viewport" content="width=device-width; initial-scale=1.0">

		<!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
		<link rel="shortcut icon" href="/images/favicon.ico">
		<link rel="stylesheet" href="css/estilo_noticia.css" type="text/css">
		<link rel="stylesheet" href="css/stylesheet.css" type="text/css">
		<link rel="stylesheet" href="css/tablas.css" type="text/css">
		
		<script type="text/javascript" src="scripts/scriptFormulario.js"></script>
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
		<form action="nueva_cuotaBD.php" autocomplete method="post">	
	
			<table>
				<tr>
				<td>Fecha:</td>
				<td>
					<input type="text" name="fechaeventocuota" size="100%" />
				</td>
				</tr>
			</table>			
			<table >
				<tr id="fila1">
					<td>Jugadora</td>
					<td>Pago</td>
				</tr>
			<?php
				foreach ($jugadoras as $jugadora) {
			?>	
			<input name="dnicuota<?php echo $i?>" type="hidden" value="<?php echo $jugadora['DNI'] ?>" />
			<tr>	
			<td>
				<label id="cuotajugadora" name="cuotajugadora" size="60%" ><?php echo $jugadora['NOMBRE'] ?> <?php echo $jugadora['APELLIDOS'] ?></label>
			</td>
			<td>
				<select name="selectpago<?php echo $i ?>">
					<option>si</option>
					<option>no</option>
				</select>
			</td>
			</tr>
			<?php 
					$i++;
				} ?>
			</table>
		<input name="idequipocuota" type="hidden" value="<?php echo $_REQUEST['nuevasasistencias'] ?>" />
		<input name="numElementscuota" type="hidden" value="<?php echo $i ?>" />
		<div id="div_submit">
          <button type="submit">Subir</button>
		</div>
		
		</form>
			
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
	</body>
</html>