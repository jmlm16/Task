<?php
include_once("validar.php");
//Importamos las variables del formulario de contacto
if(isset($_REQUEST['nombre']) && validarRequerido($_REQUEST['nombre']) && isset($_REQUEST["apellidos"]) && validarRequerido($_REQUEST['apellidos'])){
	@$nombre =($_REQUEST['nombre'] . " " . $_REQUEST["apellidos"]);
}else{
		echo "falta nombre y/o apellidos";
	
}
if (filter_var($_REQUEST['email'], FILTER_VALIDATE_EMAIL)) {
@$email = $_REQUEST['email'];
}else{
	echo "email invalido";
}
if(isset($_REQUEST['descripcion']) && validarRequerido($_REQUEST['descripcion'])){
@$mensaje =$_REQUEST['descripcion'];
}else{

}
//Preparamos el mensaje de contacto
$cabeceras = "From: $email\n" //La persona que envia el correo
 . "Reply-To: $email\n"
 . "MIME-Version: 1.0\n"
 ."Content-type: text/plain\n";
$asunto = "Contactos Club UnionSevilla"; //asunto aparecera en la bandeja del servidor de correo
$email_to = "guille.informatica.sevilla@gmail.com"; //cambiar por tu email
$contenido = "$nombre ha enviado un mensaje desde la web UnionSevilla Contactos\n"
. "\n"
. "Nombre: $nombre\n"
. "Email: $email\n"
. "Mensaje: $mensaje\n"
. "\n";
 
//Enviamos el mensaje y comprobamos el resultado
if (@mail($email_to, $asunto ,$contenido ,$cabeceras )) {
 
//Si el mensaje se envía muestra una confirmación
echo("Gracias, su mensaje se envio correctamente.");
}else{
 
//Si el mensaje no se envía muestra el mensaje de error
echo("Error: Su información no pudo ser enviada, intente más tarde");
}
 
?>