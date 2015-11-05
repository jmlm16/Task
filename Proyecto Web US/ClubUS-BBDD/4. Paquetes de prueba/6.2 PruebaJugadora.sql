SET SERVEROUTPUT ON;

BEGIN

PRUEBAS_JUGADORA.INICIALIZAR;
PRUEBAS_Jugadora.INSERTAR('Prueba 1 - Inserción','11111111a',12,60,'central','D','senior',1,TRUE);
PRUEBAS_JUGADORA.INSERTAR('Prueba 2 - Prueba de nombre null',NULL,FALSE);
PRUEBAS_JUGADORA.ACTUALIZAR('Prueba 3 - Actualización del lugar',SEC_PISTA.CURRVAL,'malaga',TRUE);
pruebas_Jugadora.ELIMINAR('Prueba 4 - Eliminar Jugadora','11111111a',true);

END;
