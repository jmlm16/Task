SET SERVEROUTPUT ON;

BEGIN

PRUEBAS_CLASIFICACION.INICIALIZAR;
PRUEBAS_CLASIFICACION.INSERTAR('Prueba 1 - Inserción',1,1,23,TRUE);
PRUEBAS_CLASIFICACION.INSERTAR('Prueba 2 - Prueba de puntos null',1,1,NULL,FALSE);
PRUEBAS_CLASIFICACION.ACTUALIZAR('Prueba 3 - Actualización de puntos',1,1,26,TRUE);
pruebas_clasificacion.ELIMINAR('Prueba 4 - Eliminar clasificacion',1,1,true);

END;
