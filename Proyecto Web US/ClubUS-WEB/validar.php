<?php 
 function validarRequerido($valor){
    if(trim($valor) == ''){
       return false;
    }else{
       return true;
    }
 }
 function validarEntero($valor){
    if(filter_var($valor, FILTER_VALIDATE_INT) == FALSE){
       return false;
    }else{
       return true;
    }
 }
 function validarEmail($valor){
    if(filter_var($valor, FILTER_VALIDATE_EMAIL) == FALSE){
       return false;
    }else{
       return true;
    }
 }
 
function validarFecha($date,$format){
	$d = DateTime::createFromFormat($format,$date);
	return $d && $d->format($format) == $date;
}
?>