SET SERVEROUTPUT ON;
BEGIN
PRUEBAS_EQUIPO.INICIALIZAR;
PRUEBAS_EQUIPO.INSERTAR('Prueba 1 - Inserci�n Equipo','senior','local',TRUE);
PRUEBAS_EQUIPO.INSERTAR('Prueba 2 - Inserci�n equipo con liga null','cadete',NULL,FALSE);
PRUEBAS_EQUIPO.INSERTAR('Prueba 3 - Inserci�n equipo con categoria null',NULL,'local',FALSE);
PRUEBAS_EQUIPO.ACTUALIZAR('Prueba 4 - Actualizaci�n del categoria de equipo',SEC_EQUIPO.CURRVAL,'juvenil','local',TRUE);
PRUEBAS_EQUIPO.ACTUALIZAR('Prueba 5 - Actualizaci�n del liga de equipo',SEC_EQUIPO.CURRVAL,'juvenil','provincial',TRUE);
PRUEBAS_EQUIPO.ACTUALIZAR('Prueba 6 - Actualizaci�n a null',SEC_EQUIPO.CURRVAL,NULL,NULL,FALSE);
pruebas_equipo.ELIMINAR('Prueba 7 - Eliminar equipo',sec_equipo.currval,true);
END;