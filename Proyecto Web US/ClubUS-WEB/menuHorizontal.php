<?php
	session_start();
	if(!(isset($_SESSION['login']))){
		$_SESSION['login'] = 0;
	}
?>

<script>$(function(){
	    $('nav ul li').hover(
	        function () {
	            $('ul', this).slideDown(150);
	        },
	        function () {
	            $('ul', this).slideUp(150);        
	        }
	    );
	});
</script>

<div id="mHorizontal">
				
					<nav>
						<ul>
							<li><a href="./Index.php">Inicio</a>
							</li>
							<li><a href="./noticias.php">Noticias</a></li>
							<li>
								<a href="./equipos.php">Equipos</a>
								<ul class="sub_menu">
									<li class="arrow_top">&nbsp;</li>
									<li><a href="./componentes.php">Componentes</a></li>
									<li><a href="./clasificacion.php">Clasificación</a></li>
								</ul>
							</li>
							<?php if($_SESSION['login'] == 1){ ?>
							<li>
								<a href="#">Consultas</a></a>
								<ul class="sub_menu">
									<li class="arrow_top">&nbsp;</li>
									<li><a href="./lesion.php">Lesion</a></li>
									<li><a href="./asistencia.php">Asistencia</a></li>
									<li><a href="./cuotas.php">Cuotas</a></li>
									<li><a href="./material.php">Material</a></li>
									<li><a href="./pista.php">Pista</a></li>
								</ul>
							</li>
							<?php } ?>
							<li><a href="./partidos.php">Partidos</a></li>
							<li><a href="./contacto.php">contacto</a></li>
							<li><a href="./login.php">Login</a></li>
						</ul>
					</nav>
	</div>