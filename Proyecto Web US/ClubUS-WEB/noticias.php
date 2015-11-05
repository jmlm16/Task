<?php
require("BD.php");
require("paginacion.php");
$conexion=crearConexionBD();

$page_size=5;

$total = totalQuery( $conexion); 

$total_pages = ( $total / $page_size );
if ( $total % $page_size > 0 ) // resto de la división 
 $total_pages++; 



$page_num = isset( $_GET[ "page_num" ] ) ? (int)$_GET[ "page_num" ] : 1;
 if ( $page_num < 1 ) $page_num = 1;


							
$filas=paginatedQuery($conexion, $page_num, 5);
							//pagenum,pagesize
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
			
			<p id="descripcion">Sección de la página donde encontrarás los últimos anuncios y eventos.</p>
			<?php 
			if($_SESSION['login'] == 1){
		?>
			<div id="boton_crearNoticia">
				<a href="crearNoticia.php" >Crear entrada</a>
			</div>
			<?php 
			}
		?>
			<div>
			<?php foreach($filas as $fila){?>				
				<fieldset>				
					
         	   		<div id="div_titulo">
         	   			<?php echo $fila["TITULO"]?>
         	   		</div>
				
					<div id="div_contenido">  
           	   			<?php echo $fila["CONTENIDO"]?>
           	 		</div>
			
            		<div id="div_autor">  
              			Autor:<?php echo $fila["AUTOR"]?>          
            		</div>
            		<?php 
			if($_SESSION['login'] == 1){
				?>
					<form action="modificarNoticia.php" method="post">
            		<div id="botones">
            			<input name="contenido_modificarid" type="hidden" value="<?php echo $fila["IDNOTICIA"]?>"/>
            			<input name="contenido_modificartitulo" type="hidden" value="<?php echo $fila["TITULO"]?>"/>
            			<input name="contenido_modificarautor" type="hidden" value="<?php echo $fila["AUTOR"]?>"/>
            			<input name="contenido_modificarcontenido" type="hidden" value="<?php echo $fila["CONTENIDO"]?>"/>
            			<button type="submit" value="Modificar"/>Modificar</button>
            		</div>
            		</form>
            	<?php 
			}?>	
            		
            		<?php 
			if($_SESSION['login'] == 1){
				?>
            		<form action="borranoticia.php" autocomplete method="post">
            			<input name="contenido_borrar" type="hidden"  value="<?php echo $fila["IDNOTICIA"]?>" />
            			<button type="submit">Borrar</button>
					</form>			
				<?php } ?>		
				
				</fieldset>
			<?php } ?>		
			</div>
			
			<div class="paginacion">
				<?php 
 
				for( $page = 1; $page <= $total_pages; $page++ ) { 
		 			if ( $page == $page_num ) { // página actual 
				?> 
						<span class="current"><?=$page?></span> 
						<?php 
					} else { // resto de páginas 
						?> 
						<a href="noticias.php?page_num=<?=$page?>& 
						page_size=<?=$page_size?>"><?=$page?></a> 
					<?php 
					} 
				} 
					?> 	
				
			</div>
		
			
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
			<?php CerrarConexionBD($conexion); ?>
	</body>
</html>
