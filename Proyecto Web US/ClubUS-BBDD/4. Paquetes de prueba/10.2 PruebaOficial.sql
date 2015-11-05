SET SERVEROUTPUT ON;


BEGIN

  /************************************************************************************
        PRUEBAS DE LAS OPERACIONES SOBRE LA TABLA OFICIAL, Y SOBRE LA TABLA PERSONA
  ************************************************************************************/
  Prueba_Oficial.INICIALIZAR;   --si el primero da exito, el segundo da fallo y viceversa, estando los dos bien 
  Prueba_Oficial.INSERTAR('Prueba 1 - Inserción Oficial correcto', '49091675s','Don Nadie','Espacio en blanco', 'Calle Sierpes', '12/12/1992', 150, 'Nacional', 'alevin', true);
  Prueba_Oficial.INSERTAR('Prueba 2 - Inserción Oficial con sueldo negativo', '49091675K','Antonio','Martin', 'Calle Sierpes', '12/12/1992', -2, 'Nacional', 'alevin', false); 
  Prueba_Oficial.INSERTAR('Prueba 3 - Inserción Oficial con titulacion incorrecta', '49091675R','Antonia','Martin', 'Calle Sierpes', '12/12/1992', 250, 'Nacionalista', 'alevin', false);  
  Prueba_Oficial.INSERTAR('Prueba 4 - Inserción Oficial con categoria incorrecta', '49091675R','Antonia','Martin', 'Calle Sierpes', '12/12/1992', 250, 'Nacional', 'fjnañh', false);
  Prueba_Oficial.ACTUALIZAR('Prueba 5 - Actualizar Oficial correctamente', '49091675R','Antonia','Martin', 'Calle Sierpes', '12/12/1992', 250, 'Nacional', 'benjamin', true);
  Prueba_Oficial.ACTUALIZAR('Prueba 6 - Actualizar Oficial erroneamente', '49091675R','Antonia','Martin', 'Calle Sierpes', '12/12/1992', -75, 'Nacional', 'benjamin', false);
  Prueba_Oficial.ACTUALIZAR('Prueba 7 - Actualizar Oficial inexistente', '49091667d','Antonia','Martin', 'Calle Sierpes', '12/12/1992', 250, 'Nacional', 'benjamin', false);
  Prueba_Oficial.ELIMINAR('Prueba 9 - Eliminar oficial', '49091675m', true);

END;