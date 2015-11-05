<?php
require("BD.php");
$conexion=crearConexionBD();
$filas=getEntradaBD($conexion,"EQUIPO");
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
			<table>
				<tr id="fila1">
					<td>Equipo</label></td>
					<td>Categoria</td>
					<td>Liga</td>
				</tr>				
			<?php foreach($filas as $fila){?>
			
				<tr>
					<td id="columna1"><?php echo $fila["IDEQUIPO"]?></td>
					<td><?php echo $fila["CATEGORIA"]?></td>
					<td><?php echo $fila["LIGA"]?></td>
					<td id="tcomp">
						<a href="./componentes.php#idequipo" >Componentes</a>				
					</td>
					<td id="tclas">
						<a href="./clasificacion.php#idequipo" >Clasificacion</a>				
					</td>
					<?php
						if(isset($_SESSION['login'])){
							if($_SESSION['login']==1){
					 ?>
					<td id="tcomp"> 
						<form method="post" action="nueva_asistencia.php">
							<input type="hidden" value="<?php echo $fila["IDEQUIPO"]?>" name="nuevasasistencias"/>
							<button type="submit">Nuevas asistencias</button>
						</form>
					</td>
					<td id="tclas">
						<form method="post" action="nueva_cuota.php">
							<input type="hidden" value="<?php echo $fila["IDEQUIPO"]?>" name=""/>		
         					<button type="submit">Nuevas cuotas</button>		
						</form>
					</td>
					<?php 	}
						} ?>
				</tr>	
			
			<?php } ?>	
			
			</table>
			</div>
			<footer>
				<?php include_once ('footer.php');?>
			</footer>		
			<?php CerrarConexionBD($conexion); ?>	
	</body>
</html>