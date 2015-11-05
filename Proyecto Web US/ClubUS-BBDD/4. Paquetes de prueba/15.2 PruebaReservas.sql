SET SERVEROUTPUT ON;


BEGIN

  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA LUGARPARTIDO
  **********************************************************************/
  Prueba_Reservas.INICIALIZAR;
  Prueba_Reservas.INSERTAR('Prueba 1 - Inserción reserva correcta', '49091675K','12/5/2012','12/5/2012',3,2, true); --falla porque no hay reservas creadas
  Prueba_Reservas.INSERTAR('Prueba 2 - Inserción datos negativos incorrecta', '49091675K','12/5/2012','12/5/2012',3,-2, false);  
  Prueba_Reservas.ACTUALIZAR('Prueba 3 - Actualizar reserva','1', '49091675K','12/5/2012','12/5/2012',3,3, true); --no hay reservas creadas
  Prueba_Reservas.ACTUALIZAR('Prueba 4 - Actualizar reserva con dato negativo', '1', '49091675K','12/5/2012','12/5/2012',-2,3, false);
  Prueba_Reservas.ACTUALIZAR('Prueba 5 - Actualizar reserva no existente', '450', '49091675K','12/5/2012','12/5/2012',3,4, false);
  Prueba_Reservas.ELIMINAR('Prueba 9 - Eliminar reserva', '1', true);
  Prueba_Reservas.ELIMINAR('Prueba 9 - Eliminar reserva inexistente', '140', false); --no funciona

END;