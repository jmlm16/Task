function procesar(){
	var camposNoVacios= new Array("nombre", "apellidos", "email");
	var errores="";
	for(id in camposNoVacios){
		errores+=campoNoVacio(camposNoVacios[id]);
	}
	
	if(!errores==""){
		alert(errores);
		return false;
	}else{
		return true;	
	}
}

function campoNoVacio(id){
	
	var campo=document.getElementById(id);
	if(!campo)
		return "Campo "+id+" no existe. \n";
	
	if(campo.value==""){
		return "Campo "+id+" vacío. \n";	
	}
	return "";
}

function validarEmail(idEmail){
	var error="";
	var email=document.getElementById(idEmail).value;
	var EmailRegExp= /([\w-\.]+)@((?:[\w]+\.)+)([a-zA-Z]{2,4})\be(\w*)s\b/;	/*ni ellos se aclaran, sacar de la pagina http://regexr.com/*/
	if(!EmailRegExp.test(email)){	
		error="El email es inválido";
	}
	
}

function validaReserva(){
	var camposNoVacios= new Array("oficial", "horadeinicio", "horadefin","reservanombre");
	var errores="";
	for(id in camposNoVacios){
		errores+=campoNoVacio(camposNoVacios[id]);
	}
		errores+=validaFechas();
	if(!errores==""){
		alert(errores);
		return false;
	}else{

		return true;	
	}
	
}

function validaFechas(){
	var fechas= new Array("horadeinicio", "horadefin");
	var errores="";
	var fechaRegExp= /^(0?[1-9]|[12][0-9]|3[01])[\/\-](0?[1-9]|1[012])[\/\-]\d{4}$/;	/*ni ellos se aclaran, sacar de la pagina http://regexr.com/*/
	for(id in fechas){
		var campo = document.getElementById(id);		
		if(!fechaRegExp.test(campo)){	
			if(id.localCompare("horadeinicio")==0){
				errores+="Fecha de inicio no está bien declarada \n";
			}else{
				errores+="Fecha de fin no está bien declarada \n";
			}
		}
	}
	return errores;
}