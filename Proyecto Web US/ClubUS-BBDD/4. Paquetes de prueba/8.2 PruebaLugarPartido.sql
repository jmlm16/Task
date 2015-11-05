SET SERVEROUTPUT ON;


BEGIN

  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA LUGARPARTIDO
  **********************************************************************/
  Prueba_LugarPartido.INICIALIZAR;
  Prueba_LugarPartido.INSERTAR('Prueba 1 - Inserci�n lugar correcta', 'Dos Hermanas', 10, true);
  Prueba_LugarPartido.INSERTAR('Prueba 2 - Inserci�n distancia negativa incorrecta', 'Lora del R�o',-9 , false);  
  Prueba_LugarPartido.ACTUALIZAR('Prueba 3 - Actualizar distancia', 'Dos Hermanas',  9, false); --fallo del codigo?
  Prueba_LugarPartido.ACTUALIZAR('Prueba 6 - Actualizar distancia con dato negativo', 'Dos Hermanas', -7, false);
  Prueba_LugarPartido.ACTUALIZAR('Prueba 7 - Actualizar lugar no existente', 'Zombieland', 9, false);
  Prueba_LugarPartido.ELIMINAR('Prueba 9 - Eliminar empleado', 'Dos Hermanas', true);

END;