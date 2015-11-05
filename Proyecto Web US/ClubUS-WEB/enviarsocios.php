<?php

$nombre = addslashes($_REQUEST['fnombre']);
$apellidos = addslashes($_REQUEST['fapellidos']);
$email = addslashes($_REQUEST['femail']);
$dni = addslashes($_REQUEST['fdni']);
$telefono = addslashes($_REQUEST['ftelefono']);

header('location: sociosok.php');
?>