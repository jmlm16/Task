<?php
	include_once ("BD.php");
	$conexion = crearConexionBD();
	$pistas=getEntradaBD($conexion,"PISTA");
	$materiales=getEntradaBD($conexion,"MATERIAL");
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
			
		<form action="nueva_reservaBD.php" autocomplete method="post" onsubmit="return validaReserva()">	
			
		<div id="div_introduciroficial">
			<label for="oficial" id="label_oficial">Oficial:<label id="oficial" name="noficial" size="60%" ><?php echo $_REQUEST['reservaoficial'] ?></label>
		</div>
		<div id="div_introducirhorainicio">
			<label for="reserva_horai" id="label_horadeinicio">Hora de inicio:<input id="reserva_horai" name="reserva_horai" type="text" size="60%" ></label>
		</div>
		<div id="div_introducirhorafin">
			<label for="reserva_horaf" id="label_horadefin">Hora de fin:<input id="reserva_horaf" name="reserva_horaf" type="text" size="60%" ></label>
		</div>
		
		<input name="oficialreservadni" type="hidden" value="<?php echo $_REQUEST['reservadni'] ?>" />
		
		
			
				<select id="select_pista" name="select_pista">
					<option >---</option>
					<?php
						foreach ($pistas as $pista) { ?>
							<option value="<?php echo $pista['IDPISTA'] ?>"><?php echo $pista['LUGAR'] ?></option>
					<?php }
					?>
				</select>
			
			
				<select id="select_material" name="select_material">
					<option>---</option>
					<?php
						foreach ($materiales as $material) { ?>
							<option value="<?php echo $material['IDMATERIAL'] ?>"><?php echo $material['TIPO'] ?></option>
					<?php }
					?>
				</select>
			
	
		
		<div id="div_submit">
          <button type="submit">Subir</button>
		</div>
		
		</form>
			
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
	</body>
</html>
