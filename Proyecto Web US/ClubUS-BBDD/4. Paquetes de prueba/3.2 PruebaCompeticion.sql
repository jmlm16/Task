SET SERVEROUTPUT ON;

BEGIN

pruebas_competicion.INICIALIZAR;
pruebas_competicion.INSERTAR('Prueba 1 - Inserción','liga','senior','10/01/2014','10/04/2014',true);
pruebas_competicion.INSERTAR('Prueba 2 - Prueba de disparador, fechafin antes de fecha inicio','liga','senior','10/03/2014','10/02/2014',false);
pruebas_competicion.INSERTAR('Prueba 3 - Inserción con categoria null','liga',null,'10/01/2014','10/04/2014',false);
pruebas_competicion.INSERTAR('Prueba 4 - Inserción con tipocompeticion null',null,'senior','10/01/2014','10/04/2014',false);
pruebas_competicion.ACTUALIZAR('Prueba 5 - Actualización del tipocompeticion',sec_competicion.currval,'amistoso',false);
pruebas_competicion.ACTUALIZAR('Prueba 6 - Actualización del tipocompeticion a null',sec_competicion.currval,null,false);
pruebas_competicion.ELIMINAR('Prueba 7 - Eliminar competicion',sec_competicion.currval,true);

END;