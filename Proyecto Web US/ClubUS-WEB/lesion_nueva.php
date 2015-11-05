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
			
		<form action="nueva_lesionBD.php" autocomplete method="post" onsubmit="return validaLesion()">	
			
			<input name="dnijugadoralesion" type="hidden" value="<?php echo $_REQUEST['lesiondni'] ?>" />
		
			<div id="div_introducirtitulo">
				<label for="lesionjugadora" id="label_lesionjugadora">Jugadora:<label id="lesionjugadora" name="lesionjugadora" size="60%" > <?php echo $_REQUEST['lesionjugadora'] ?></label>
			</div>
			<div id="div_introducirtipo">
				<label for="tipolesion" id="label_fechainiciolesion">Tipo:<input id="tipolesion" name="tipolesion" type="text" size="60%" ></label>
			</div>
			<div id="div_introducirautor">
				<label for="fechadeiniciolesion" id="label_fechainiciolesion">Fecha de inicio:<input id="fechadeiniciolesion" name="fechadeiniciolesion" type="text" size="60%" ></label>
			</div>
			<div id="div_introducirautor">
				<label for="fechadefinlesion" id="label_fechafinlesion">Fecha de fin:<input id="fechadefinlesion" name="fechadefinlesion" type="text" size="60%" ></label>
			</div>
		
		<select id="select_lesion" name="selec_lesion">
 			<option>no</option>
  			<option>si</option>
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
