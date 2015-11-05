SET SERVEROUTPUT ON;
BEGIN
pruebas_persona.INICIALIZAR;
pruebas_persona.INSERTAR('Prueba 1 - Inserción persona','123456789','Pepito','Grillo','cartones','21/02/1984',true);
pruebas_persona.INSERTAR('Prueba 2 - Inserción persona con nombre null','12345678A',null,'Grillo','cartones','21/02/1984',false);
pruebas_persona.ACTUALIZAR('Prueba 3 - Actualización del nombre de persona','123456789','Jiminy',true);
pruebas_persona.ACTUALIZAR('Prueba 4 - Actualización del nombre de persona a null','123456789',null,false);
pruebas_persona.ELIMINAR('Prueba 5 - Eliminar persona','123456789',true);
END;