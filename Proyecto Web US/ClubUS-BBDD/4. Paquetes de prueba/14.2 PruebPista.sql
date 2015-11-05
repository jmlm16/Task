SET SERVEROUTPUT ON;

BEGIN

PRUEBAS_PISTA.INICIALIZAR;
PRUEBAS_pista.INSERTAR('Prueba 1 - Inserción','paquito',TRUE);
PRUEBAS_PISTA.INSERTAR('Prueba 2 - Prueba de nombre null',NULL,FALSE);
PRUEBAS_PISTA.ACTUALIZAR('Prueba 3 - Actualización del lugar',SEC_PISTA.CURRVAL,'malaga',TRUE);
pruebas_pista.ELIMINAR('Prueba 4 - Eliminar pista',sec_pista.currval,true);

END;