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
		<!--introduccion slide fotos-->
		<script>
			imagenes = new Array();

			imagenes[0] = "./images/us1.jpg";
			imagenes[1] = "./images/us2.jpg";
			imagenes[2] = "./images/us3.jpg";
			imagenes[3] = "./images/us4.jpg";
			siguiente = 0;

			function CambiaImagen() {
				dimensiones = $("#box-imagen").width();
				$("#box-imagen img").css({
					left : -dimensiones + "px"
				}).attr("src", imagenes[siguiente]);
				$("#box-imagen img").animate({
					left : "+=" + dimensiones
				});

				$("#box-imagen a").attr("href", imagenes[siguiente]);
				siguiente = siguiente + 1;
				if (siguiente >= imagenes.length) {
					siguiente = 0;
				}
				transicion = 4000;
				setTimeout("CambiaImagen()", transicion);
			}

			$(function() {
				CambiaImagen();
			});
		</script>
		<div>
		<div id="box-imagen">
			<a href="/images/us1.jpg"><img src="/images/us1.jpg" alt="Fotos del club"></a>
		</div>
		<article><h2>Unión Sevilla y Los Olivos buscan el ascenso</h2>


El conjunto hispalense y el malagueño ponen rumbo este fin de semana hacia la localidad valenciana de Sagunto para disputar la fase sector de la Primera División Femenina, clasificatoria para jugar la próxima campaña en la División de Honor Plata.

El Unión Sevilla, campeón regional, comenzará su triangular del Grupo F mañana sábado a las 18:30 horas frente al BM Móstoles, y rematará su participación en jornada dominical (12:00 horas) contra el H. Tortosa Hidrocanal.

Por su parte, Los Olivos se verá las caras el sábado en el Grupo E con el BM Sonseca (20:15 horas) y el domingo, a partir de las 13:00 horas, medirá sus fuerzas con el BM Morvedre en busca de dos puntos que pueden resultar clave.

Y es que el billete para la División de Honor Plata lo conseguirán cada uno de los campeones de grupo, más los dos mejores clasificados de los seis sectores que se disputarán a lo largo del territorio español. 
		</article>
		</div>
		<footer>
			<?php
			include_once ('footer.php');
			?>
		</footer>
	</body>
</html>
