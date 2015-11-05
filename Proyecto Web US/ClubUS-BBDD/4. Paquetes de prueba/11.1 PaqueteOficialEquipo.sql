CREATE OR REPLACE PACKAGE Prueba_OficialEquipo AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, pr_DNI char,pr_equipo integer,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2, pr_DNI char,pr_equipo integer,salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_DNI char,salidaEsperada BOOLEAN);

END Prueba_OficialEquipo;
/

 CREATE OR REPLACE PACKAGE BODY Prueba_OficialEquipo AS

  --inicializacion
  PROCEDURE inicializar AS
  BEGIN

    
     DELETE FROM OficialEquipo;
     
    NULL;
  END inicializar;

  --insercion
  PROCEDURE insertar (nombre_prueba VARCHAR2, pr_DNI char,pr_equipo integer,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    ofiequ OficialEquipo%ROWTYPE;
  BEGIN
    
    
    nuevo_oficialequipo(pr_DNI,pr_equipo);
    
    
    
    SELECT * INTO ofiequ FROM OficialEquipo WHERE DNI=pr_DNI;
    IF (ofiequ.idequipo<>pr_equipo) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;

  --actualizacion
  PROCEDURE actualizar (nombre_prueba VARCHAR2, pr_DNI char,pr_equipo integer,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    ofiequ OficialEquipo%ROWTYPE;
    
  BEGIN
    
   
    UPDATE OficialEquipo SET idequipo=pr_equipo WHERE DNI=pr_DNI;
    
   
    SELECT * INTO ofiequ FROM OficialEquipo WHERE DNI=pr_DNI;
    IF (ofiequ.idequipo<>pr_equipo) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    COMMIT WORK;
    
    -- Mostrar resultado de la prueba 
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END actualizar;


  --ELIMINACIÓN
  PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_DNI char,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
     n_oficialequipo INTEGER;
  BEGIN
    
   
    DELETE FROM OficialEquipo WHERE DNI=pr_DNI;
    
   
    SELECT COUNT(*) INTO n_oficialequipo FROM oficialequipo WHERE DNI=pr_DNI;
    IF (n_oficialequipo <> 0) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    -- Mostrar resultado de la prueba 
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END eliminar;

END Prueba_OficialEquipo;