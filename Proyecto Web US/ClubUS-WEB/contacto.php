<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8">		
		
		<title>Contacto</title>
		<meta name="description" content="">
		<meta name="author" content="SrHypercube">

		<meta name="viewport" content="width=device-width; initial-scale=1.0">

		<!-- Replace favicon.ico & apple-touch-icon.png in the root of your domain and delete these references -->
		<link rel="shortcut icon" href="/images/favicon.ico">
		<link rel="stylesheet" href="css/stylesheet.css" type="text/css">
		<link rel="stylesheet" href="css/estilo_formulario.css" type="text/css">
		
		<script type="text/javascript" src="scripts/scriptFormulario.js"></script>
		<script src="js/jquery-2.1.1.min.js"></script>
		
	</head>

	<body>			
			<header class="cabecera">
				<?php include_once('cabecera.php');?>
			</header>
		
			<?php include_once('menuHorizontal.php')?>
			<?php include_once('bloqueIzquierda.php')?>
			
			<div id="div_form">

      <form name="contacto" onsubmit="return procesar()" method="post" action="enviarcorreo.php">
	  
        <div id="div_datos_personales">

          <fieldset>

            <legend>Datos personales</legend>

            <div id="div_nombre">  
              <label id="label_nombre" for="nombre">Nombre:</label>
              <input id="nombre" name="nombre" type="text"/>
            </div>

            <div id="div_apellidos">  
              <label id="label_apellidos" for="apellidos">Apellidos:</label>
              <input id="apellidos" name="apellidos" type="text"/>
            </div>

            <div id="div_email">  
              <label id="label_email" for="email">Email:</label> 
              <input id="email" name="email" type="text"/>		
            </div>

          </fieldset>

        </div>

     	 <div id="div_practica">
	
      	  <fieldset>
	
        	  <legend>Coméntanos</legend>

       	   <div id="div_descripcion">       
       	     <textarea id="descripcion" name="descripcion"></textarea>
       	   </div>

       	 </fieldset>

       	 </div>

       	 <div id="div_submit">
         	 <button type="submit" id="submit" value="Enviar consulta">Enviar consulta</button>
		 </div>

      </form>
    </div>
			
			<footer>
				<?php include_once ('footer.php');?>
			</footer>
	</body>
</html>
