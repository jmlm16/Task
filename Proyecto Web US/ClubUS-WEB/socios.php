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
		<script src="js/jquery-2.1.1.min.js"></script>
	</head>

	<body>

		<header class="cabecera">
			<?php
			include_once ('cabecera.php');
			?>
		</header>

		<?php include_once('menuHorizontal.php')
		?>
		<?php include_once('bloqueIzquierda.php')
		?>
		
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

		<article>
			<h2>Hazte socio y forma parte de nuestra familia</h2>
			<p>
				Forma parte de nuestra familia y disfruta de las ventajas de ser socio de nuestro club rellenando el <a href=#fsocios>formulario</a>
			</p>
			<iframe width="560" height="315" src="//www.youtube-nocookie.com/embed/VBSB-nqb9Vc?rel=0" frameborder="0" allowfullscreen></iframe>
			
			<a name="fsocios"><br>Subscripción</a></p>
			<form action="nuevosocio.php" autocomplete method="post">
				<div>
					Nombre:
					<input type="text" name="fnombre" placeholder="Su nombre" required id="fnombre">
					Apellidos:
					<input type="text" name="fapellidos"placeholder="Sus Apellidos" required id="fapellidos">
					Dni(sin letra):
					<input type="text" name="fdni" placeholder="11111111" pattern="[0-9]{8}" required id="fdni">
					telefono:
					<input type="tel" name="ftelefono" placeholder="666666666" pattern="[0-9]{9}"required id="ftelefono">
					E-mail:
					<input type="email" name="femail" placeholder="suemail@email.com" required id="email">
					<input type="submit">
				</div>
			</form>
			</article>
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
	</body>
</html>
