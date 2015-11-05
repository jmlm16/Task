SET SERVEROUTPUT ON;


BEGIN

  /*********************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA Cuotas
  **********************************************************************/
  Prueba_Cuotas.INICIALIZAR;
  Prueba_Cuotas.INSERTAR('Prueba 1 - Inserción cuota correcta', '49091675s', 'si', '12/5/2012', true);
  Prueba_Cuotas.INSERTAR('Prueba 2 - Inserción cuota con persona inexistente', '49091075s', 'si', '12/5/2012', false);  
  Prueba_Cuotas.ACTUALIZAR('Prueba 3 - Actualizar cuota correcta','10', '49091675s', 'no', '12/6/2012', true);
  Prueba_Cuotas.ACTUALIZAR('Prueba 4 - Actualizar cuota inexistente', '150', '49091675s', 'no', '12/6/2012', false);
  Prueba_Cuotas.ELIMINAR('Prueba 5 - Eliminar cuota', '10', true);
  Prueba_Cuotas.ELIMINAR('Prueba 5 - Eliminar cuota inexistente', '1500', false);

END;