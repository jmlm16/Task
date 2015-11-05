<?php 
	$id=$_REQUEST['contenido_modificarid'];
	$titulo = $_REQUEST['contenido_modificartitulo'];
	$autor = $_REQUEST['contenido_modificarautor'];
	$contenido = $_REQUEST['contenido_modificarcontenido'];
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
			
		<form action="modificanoticia.php" autocomplete method="post">	
			
		<div id="div_introducirtitulo">
			<label for="titulo" id="label_titulo">Título:<input id="titulo" name="ntitulo" type="text" size="60%" value="<?php echo $titulo?>"></label>
		</div>
		<div id="div_introducirautor">
			<label for="autor" id="label_autor">Autor:<input id="autor" name="nautor" type="text" size="60%" value="<?php echo $autor?>"></label>
			
		</div>
		<div id="div_introducircontenido">
			<label for="contenido" id="label_contenido">Contenido:</label>
		</div>
		<div id="div_cuadroTexto">
			<textarea id="contenido" name="ncontenido" rows="20" cols="80" ><?php echo $contenido?></textarea>
		</div>
		
		<input name="nid" type="hidden" value="<?php echo $id?>"/>
		
		<div id="div_submit">
          <button type="submit">Subir</button>
		</div>
		
		</form>
			
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
	</body>
</html>
