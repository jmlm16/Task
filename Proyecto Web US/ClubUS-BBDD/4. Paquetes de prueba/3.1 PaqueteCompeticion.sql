CREATE OR REPLACE PACKAGE Pruebas_Competicion AS 
  
   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, n_tipocompeticion VARCHAR2, n_categoria VARCHAR2, n_fechainicio date, n_fechafin date, salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2, n_idcompeticion number, n_tipocompeticion VARCHAR2, n_categoria VARCHAR2, n_fechainicio date, n_fechafin date, salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, n_idcompeticion number, salidaEsperada BOOLEAN);

END pruebas_competicion;
/

CREATE OR REPLACE PACKAGE BODY Pruebas_Competicion AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM competicion;
    NULL;
  END inicializar;

  PROCEDURE insertar (nombre_prueba VARCHAR2, n_tipocompeticion VARCHAR2, n_categoria VARCHAR2, n_fechainicio date, n_fechafin date, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_competicion competicion%ROWTYPE;
    n_idcom number(38);
  BEGIN
    
  
    nueva_competicion(n_tipocompeticion, n_categoria, n_fechainicio, n_fechafin);
    
  
    n_idcom := sec_competicion.currval;
    SELECT * INTO n_competicion FROM competicion WHERE idcompeticion=n_idcom;
    IF (n_competicion.tipocompeticion<>n_tipocompeticion or n_competicion.categoria<>n_categoria or 
        n_competicion.fechainicio<>n_fechainicio or n_competicion.fechafin<>n_fechafin) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2, n_idcompeticion number, n_tipocompeticion VARCHAR2, n_categoria VARCHAR2, n_fechainicio date, n_fechafin date, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_competicion competicion%ROWTYPE;
  BEGIN
    
   
    UPDATE competicion SET tipocompeticion=n_tipocompeticion WHERE idcompeticion=n_idcompeticion;
    
  
    SELECT * INTO n_competicion FROM competicion WHERE idcompeticion=n_idcompeticion;
    IF (n_competicion.tipocompeticion<>n_tipocompeticion) THEN
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



  PROCEDURE eliminar (nombre_prueba VARCHAR2, n_idcompeticion number, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_competicion INTEGER;
  BEGIN
    
   
    DELETE FROM competicion WHERE idcompeticion=n_idcompeticion;
    
    
    SELECT COUNT(*) INTO n_competicion FROM competicion WHERE idcompeticion=n_idcompeticion;
    IF (n_competicion <> 0) THEN
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

END PRUEBAS_competicion;