SET SERVEROUTPUT ON;

BEGIN
  pruebas_lesion.INICIALIZAR;
  pruebas_lesion.INSERTAR('Prueba 1 - Inserción lesion','123456789','desgarro anal','23/01/2014','31/01/2014',true);
  pruebas_lesion.INSERTAR('Prueba 2 - Inserción lesion con tipo null',null,null,'23/01/2014','31/01/2014',false);
  pruebas_lesion.ACTUALIZAR('Prueba 3 - Actualización del fecha fin','01/02/2014',true);
  pruebas_lesion.ACTUALIZAR('Prueba 4 - Disparador, fecha fin anterior a fechainicio','31/01/2013',false);
  pruebas_lesion.ELIMINAR('Prueba 5 - Eliminar lesion',true);
END;