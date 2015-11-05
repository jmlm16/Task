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
		<link rel="stylesheet" href="css/formLogin.css" type="text/css">
		<script src="js/jquery-2.1.1.min.js"></script>
	</head>

	<body>
		
			<header class="cabecera">
				<?php include_once('cabecera.php');?>
			</header>
		
			<?php include_once('menuHorizontal.php')?>
			<?php include_once('bloqueIzquierda.php')?>
			
			<?php 
				if($_SESSION['login'] == 1){
			?>
			
			<div id="sectionlogin">
			<section id="loginBox">
				<div id="h3login">
					<h3>Login</h3>
				</div>	
					<form method="post" class="minimal"action="sesionDeslogin.php">				
						<label for="username">
							Username: <?php echo $_SESSION['usuario'] ?>
						</label>
						<label for="password">
							Rol: <?php echo $_SESSION['rol'] ?>
						</label>
						<div id="buttonsubmit">
						<button type="submit" class="btn-minimal">Deslogueate</button>
						</div>
					</form>
			</section>
			</div>
			
			<?php 
				}else{
			?>
			
			<div id="sectionlogin">
			<section id="loginBox">
				<div id="h3login">
					<h3>Login</h3>
				</div>	
					<form method="post" class="minimal" method="post" action="sesionLogin.php">				
						<label for="username">
							Username:<input type="text" name="username" id="username" required="required" />
						</label>
						<label for="password">
							Password:<input type="password" name="password" id="password" required="required" />
						</label>
						<div id="buttonsubmit">
						<button type="submit" class="btn-minimal">Conéctate</button>
						</div>
					</form>
			</section>
			</div>
			
			<?php 
				}
			?>
			
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
	</body>
</html>
