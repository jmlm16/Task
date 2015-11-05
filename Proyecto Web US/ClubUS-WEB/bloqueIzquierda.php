
		<?php 
			if($_SESSION['login'] == 1){
		?>
		<div class="leftblock usuario"> 
			<p> || Bienvenido, <?php echo $_SESSION['usuario'] ?> ||</p>
			<form method="post" class="minimal"action="sesionDeslogin.php">				
				<div id="buttonsubmit">
					<button type="submit" class="btn-minimal">Deslogueate</button>
				</div>
			</form>
		</div>
		<?php 
			} 
		?>
		<div class="leftblock">
			<img src="images/mini.jpg" alt="Escudo Club"/>
		</div>

		<div class="leftblock socios">
			<p>
				<a href="./socios.php">Hazte Socio
				<img src="images/campeonas.jpg" alt="Campeonas!" /></a>
			</p>
		</div>

		<div class="leftblock patrocinadores">
			
				<p>Patroncinadores</p>
				<img src="images/samsung.jpg" alt="samsung" />
				<img src="images/hotel.jpg" alt="Hilton" />
			
		</div>
