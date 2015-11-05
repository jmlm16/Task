SET SERVEROUTPUT ON;
BEGIN
PRUEBAS_EQUIPO.INICIALIZAR;
PRUEBAS_EQUIPO.INSERTAR('Prueba 1 - Inserción Equipo','senior','local',TRUE);
PRUEBAS_EQUIPO.INSERTAR('Prueba 2 - Inserción equipo con liga null','cadete',NULL,FALSE);
PRUEBAS_EQUIPO.INSERTAR('Prueba 3 - Inserción equipo con categoria null',NULL,'local',FALSE);
PRUEBAS_EQUIPO.ACTUALIZAR('Prueba 4 - Actualización del categoria de equipo',SEC_EQUIPO.CURRVAL,'juvenil','local',TRUE);
PRUEBAS_EQUIPO.ACTUALIZAR('Prueba 5 - Actualización del liga de equipo',SEC_EQUIPO.CURRVAL,'juvenil','provincial',TRUE);
PRUEBAS_EQUIPO.ACTUALIZAR('Prueba 6 - Actualización a null',SEC_EQUIPO.CURRVAL,NULL,NULL,FALSE);
pruebas_equipo.ELIMINAR('Prueba 7 - Eliminar equipo',sec_equipo.currval,true);
END;