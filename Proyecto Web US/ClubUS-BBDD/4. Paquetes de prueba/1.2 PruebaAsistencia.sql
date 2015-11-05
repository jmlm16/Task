SET SERVEROUTPUT ON;

BEGIN

PRUEBAS_ASISTENCIA.INICIALIZAR;
PRUEBAS_ASISTENCIA.INSERTAR('Prueba 1 - Inserción','11111111a','entrenamiento','22/01/2014','no',TRUE);
PRUEBAS_ASISTENCIA.INSERTAR('Prueba 2 - Prueba de asistencia null','11111111b','entrenamiento','21/01/2014',NULL,FALSE);
PRUEBAS_ASISTENCIA.ACTUALIZAR('Prueba 3 - Actualización del asistencia','11111111a','entrenamiento','21/01/2014','si',TRUE);
pruebas_asistencia.ELIMINAR('Prueba 4 - Eliminar pista','11111111a',true);

END;
