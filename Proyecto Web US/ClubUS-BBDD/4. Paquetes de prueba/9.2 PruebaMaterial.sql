SET SERVEROUTPUT ON;

BEGIN
  pruebas_material.INICIALIZAR;
  pruebas_material.INSERTAR('Prueba 1 - Inserción material',10,'decathlon','pista',true);
  pruebas_material.INSERTAR('Prueba 2 - Inserción material con tipo null',10,null,null,false);
  pruebas_material.ACTUALIZAR('Prueba 3 - Actualización del stock',15,true);
  pruebas_material.ACTUALIZAR('Prueba 4 - Disparador, stock menor que 0',-2,false);
  pruebas_material.ELIMINAR('Prueba 5 - Eliminar material',true);
END;