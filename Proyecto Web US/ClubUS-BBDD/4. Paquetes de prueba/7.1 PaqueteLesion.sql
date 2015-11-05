create or replace PACKAGE Pruebas_lesion AS 
  
   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, n_dni char, n_tipo VARCHAR2, n_fechainicio date, n_fechafin date ,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2,  n_fechafin date, salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, salidaEsperada BOOLEAN);

END pruebas_lesion;
/

create or replace PACKAGE BODY Pruebas_lesion AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM lesion;
    NULL;
  END inicializar;

  PROCEDURE insertar (nombre_prueba VARCHAR2, n_dni char, n_tipo VARCHAR2, n_fechainicio date, n_fechafin date ,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_lesion lesion%ROWTYPE;
    ind number;
  BEGIN
    
   
    nueva_lesion (n_dni , n_tipo , n_fechainicio, n_fechafin, null);
    ind:=sec_lesion.currval;
    
    SELECT * INTO n_lesion FROM lesion WHERE idlesion=ind;
    IF (n_lesion.dni<>n_dni or n_lesion.tipo<>n_tipo or 
        n_lesion.fechainicio<>n_fechainicio or n_lesion.fechainicio<>n_fechainicio) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2,  n_fechafin date, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_lesion lesion%ROWTYPE;
    ind number;
  BEGIN
    ind:=sec_lesion.currval;
   
    UPDATE lesion SET fechafin=n_fechafin WHERE idlesion=ind;
    
   
    SELECT * INTO n_lesion FROM lesion WHERE idlesion=ind;
    IF (n_lesion.fechafin<>n_fechafin) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END actualizar;



  PROCEDURE eliminar (nombre_prueba VARCHAR2, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_lesion INTEGER;
    ind number;
  BEGIN
    ind:=sec_lesion.currval;
    
    DELETE FROM lesion WHERE idlesion=ind;
    
    
    SELECT COUNT(*) INTO n_lesion FROM lesion WHERE idlesion=ind;
    IF (n_lesion <> 0) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END eliminar;

END pruebas_lesion;