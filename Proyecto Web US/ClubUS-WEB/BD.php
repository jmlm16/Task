<?php

function crearConexionBD()
{
	//$host="oci:dbname=localhost/XE";
	$host="oci:host=localhost;dbname=XE;port=8080";
	$usuario="user"; //usuario creado en la base de datos
	$password="*****"; //contraseña para el usuario en la base de datos
	$conexion=null;
	
	try{
		$conexion=new PDO($host,$usuario,$password);
    	
     /* Indicar que queremos que lance excepciones cuando ocurra un error*/ 
     $conexion->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION); 
    	
	}catch(PDOException $e){
		echo "Error de conexion";
		header("Location: index.php");
	}
	return $conexion;
}

function CerrarConexionBD($conexion){
	$conexion=null;
}


function getEntradaBD($conexion,$tabla){
	
	try{
		$entradas=$conexion->query("SELECT * FROM " . $tabla);
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entradas;
}

function getEntradaNaturaljoinBD($conexion,$tabla,$join){
	try{
		$entrada=$conexion->query("select * from $tabla natural join $join");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
}

function getEntradaNaturaljoinOrderDescBD($conexion,$tabla,$join,$order){
	try{
		$entrada=$conexion->query("select * from $tabla natural join $join order by $order desc");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
}

function getEntradaOrderBD($conexion,$tabla,$order){
	try{
		$entrada=$conexion->query("SELECT * FROM " . $tabla . " ORDER BY ".$order);
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
}

function getEntradaOrderDescBD($conexion,$tabla,$order){
	try{
		$entrada=$conexion->query("SELECT * FROM " . $tabla . " ORDER BY ".$order." DESC");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
}

function getEntradaCondicionBD($conexion,$tabla,$where,$condicion){
	try{
		$entrada=$conexion->query("SELECT * FROM " . $tabla . " WHERE " . $where . " = '" . $condicion . "'");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
}

function getEntradaCondicionNumBD($conexion,$tabla,$where,$condicion){
	
		$entrada=$conexion->query("SELECT * FROM $tabla WHERE $where = $condicion");
	
	return $entrada;
}

function getEntradaCondicionOrderBD($conexion,$tabla,$where,$condicion,$order){
	try{
		$entrada=$conexion->query("SELECT * FROM " . $tabla . " WHERE " . $where . " = '" . $condicion . "'" . " ORDER BY ".$order);
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
}

function getEntradaCondicionOrderDescBD($conexion,$tabla,$where,$condicion,$order){
	try{
		$entrada=$conexion->query("SELECT * FROM " . $tabla . " WHERE " . $where . " = '" . $condicion . "'" . " ORDER BY ".$order." desc");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
}

function deleteEntradaBD($conexion,$tabla,$where,$condicion){
	try{
		$conexion->query("DELETE FROM $tabla WHERE $where = '$condicion'");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}	
}

function insertaSocio($conexion,$dni,$nombre,$apellidos,$telefono,$email){
	$conexion->query("INSERT INTO SOCIOS VALUES ( '" . $dni . "','" . $nombre . "','" . $apellidos . "','" . $telefono . "','" . $email . "')");
}

function insertaNoticia($conexion,$titulo,$autor,$contenido){
		$conexion->query("insert into noticias values(sec_noticia.nextval,'$titulo' , '$autor', '$contenido')");	
}
/* ejecuta procedure nuevo_oficial */
function insertaOficial($conexion,$dni,$nombre,$apellidos,$direccion,$fechanacimiento,$sueldo,$titulacion,$categoria){
		$conexion->query("EXECUTE nuevo_oficial ('".$dni."','" . $nombre . "','".$apellidos."','" . $direccion . "','" . $fechanacimiento . "'," . $sueldo . ",'" . $titulacion . "','" . $categoria . "')");	
}
/* ejecuta procedure nueva_jugadora */
function insertaJugadora($conexion,$dni,$nombre,$apellidos,$direccion,$fechanacimiento,$dorsal,$peso,$posicion,$manohabil,$equipo){
		$conexion->query("EXECUTE nueva_jugadora ('".$dni."','" . $nombre . "','".$apellidos."','" . $direccion . "','" . $fechanacimiento . "'," . $dorsal . "," . $peso . ",'" . $posicion . "','" . $manohabil . "','" . $equipo . "')");	
}
/* ejecuta procedure nuevo_material */
function insertaMaterial($conexion,$stock,$proveedor,$tipo){
		$conexion->query("EXECUTE nuevo_material ( $stock , '$proveedor' , '$tipo' )");
}
/* ejecuta procedure nueva_asistencia */
function insertaAsistencia($conexion,$dni,$tipo,$fecha,$falta){
		$conexion->query("INSERT INTO ASISTENCIA VALUES ( '$dni' , '$tipo', '$fecha', '$falta' )");
}
/* ejecuta procedure nueva_competicion */
function insertaCompeticion($conexion,$tipo,$categoria,$fechainicio,$fechafin){	
		$conexion->query("EXECUTE nueva_competicion ( '$tipo' , '$categoria', '$fechainicio', '$fechafin' )");
}
/* ejecuta procedure nueva_clasificacion*/
function insertaClasificacion($conexion,$idequipo,$idcompeticion,$puntos){
		$conexion->query("EXECUTE nueva_clasificacion ( $idequipo , $idcompeticion, $puntos)");
}
/* ejecuta procedure nueva_cuota*/
function insertaCuota($conexion,$dni,$pago,$fecha){
		$conexion->query("INSERT INTO CUOTAS VALUES( sec_cuota.nextval,'$dni','$pago','$fecha')");
}
/* ejecuta procedure nueva_lesion*/
function insertaLesion($conexion,$dni,$tipo,$fechainicio,$fechafin,$recaida){ 
	$conexion->query("INSERT INTO LESION VALUES (sec_lesion.nextval,'$dni','$tipo','$fechainicio','$fechafin','$recaida')");
}
/* ejecuta procedure nueva_reserva*/
function insertaReserva($conexion,$dni , $horainicio, $horafin , $idpista , $idmaterial){
		$conexion->query("INSERT INTO RESERVAS VALUES (sec_reserva.nextval,'$dni','$horainicio','$horafin',$idpista,$idmaterial)");
}
/* ejecuta procedure nuevo_lugarpartida*/
function insertaLugarpartido($conexion,$lugar,$desplaz){

	$conexion->query("EXECUTE nuevo_lugarpartido ( '$lugar' , $desplaz )");
		
}
/* ejecuta procedure nuevo_equipo*/
function insertaEquipo($conexion,$categoria,$liga){
	$conexion->query("EXECUTE nuevo_equipo ( '$categoria' , '$liga')");		
}
/* ejecuta procedure nuevo_oficialequipo*/
function insertaOficialequipo($conexion,$dni,$equipo){
	$conexion->query("EXECUTE nuevo_oficialequipo ( '$dni' , '$equipo' )");	

}
/* ejecuta procedure nuevo_partido*/
function insertaPartido($conexion,$idequipo,$idcompeticion,$fecha,$rival,$emplazamiento,$golesf,$categoria,$golesc,$lugar,$tipopartido){

	$conexion->query("EXECUTE nuevo_partido ( $idequipo,$idcompeticion,'$fecha','$rival','$emplazamiento',$golesf,'$categoria',$golesc,'$lugar','$tipopartido')");	

}
/* ejecuta procedure actualiza_lugarpartido*/
function actualizaLugarpartido($conexion,$lugar,$desplaz){
	try{
		$conexion->query("EXECUTE actualiza_lugarpartido ( '$lugar' , $desplaz )");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
}

function getComponentesOficialesBD($conexion){
	try{
		$entradas=$conexion->query("select * from persona natural join oficial natural join oficialequipo order by idequipo desc");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entradas;
}

function getComponentesJugadorasBD($conexion){
	try{
		$entradas= $conexion->query("select * from persona natural join jugadora order by idequipo desc");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entradas;
}

function getClasificacionCompeticionBD($conexion){
	try{
		$entradas=$conexion->query("select * from competicion natural join clasificacion order by idequipo desc");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entradas;
}

function modificaNoticia($conexion,$id,$titulo,$autor,$contenido){
	try{
		$conexion->query("update noticias set autor = '$autor', contenido = '$contenido', titulo = '$titulo' where idnoticia = '$id'");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}	
}

function getReservasDePistas($conexion){
	try{
			$entrada=$conexion->query("select * from PERSONA natural join (select * from RESERVAS natural join PISTA order by idpista) order by dni");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
}

function getReservasDeMaterial($conexion){
	try{
		$entrada=$conexion->query("select * from PERSONA natural join (select * from RESERVAS natural join MATERIAL order by idmaterial) order by dni");
	}CATCH(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";
	}
	return $entrada;
	
}

function getCuotas($conexion){
	try{
		$entradas=$conexion->query("select * from PERSONA natural join (select * from CUOTAS natural join JUGADORA) order by FECHAPAGO desc");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";	
		
	}
	return $entradas;
}

function getAsistencias($conexion){
	try{
		$entradas=$conexion->query("select * from PERSONA natural join (select * from ASISTENCIA natural join JUGADORA) order by FECHAEVENTO desc");
	}catch(PDOException $e){
		echo "No se pudo contactar con el servidor, lo sentimos, pruebe más tarde.";	
		
	}
	return $entradas;
}
?>
