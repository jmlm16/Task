SET SERVEROUTPUT ON;


BEGIN

  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA OFICIALEQUIPO
  **********************************************************************/
  Prueba_OficialEquipo.INICIALIZAR;
  Prueba_OficialEquipo.INSERTAR('Prueba 1 - Inserción oficialequipo correcta', '49091675s', 3, true);
  Prueba_OficialEquipo.INSERTAR('Prueba 2 - Inserción oficialequipo incorrecta', '49091675s',-9 , false);  
  Prueba_OficialEquipo.ACTUALIZAR('Prueba 3 - Actualizar oficialequipo correctamente', '49091675s',  9, true); --fallo del codigo?
  Prueba_OficialEquipo.ACTUALIZAR('Prueba 6 - Actualizar equipo con ID negativo', '49091675s', -7, false);
  Prueba_OficialEquipo.ACTUALIZAR('Prueba 7 - Actualizar oficial no existente', 'sfasf', 9, false);
  Prueba_OficialEquipo.ELIMINAR('Prueba 9 - Eliminar oficialequipo', '49091675s', true);

END;