CREATE OR REPLACE PACKAGE Prueba_LugarPartido AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, pr_lugar VARCHAR2, pr_desplazamiento integer,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2, pr_lugar VARCHAR2, pr_desplazamiento integer,salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_lugar VARCHAR2,salidaEsperada BOOLEAN);

END Prueba_LugarPartido;
/

 CREATE OR REPLACE PACKAGE BODY Prueba_LugarPartido AS

  --inicializacion
  PROCEDURE inicializar AS
  BEGIN

    
     DELETE FROM LugarPartido;
     
    NULL;
  END inicializar;

  --insercion
  PROCEDURE insertar (nombre_prueba VARCHAR2, pr_lugar VARCHAR2, pr_desplazamiento integer,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    lugpar LugarPartido%ROWTYPE;
  BEGIN
    
    
    nuevo_lugarpartido(pr_lugar, pr_desplazamiento);
    
    
    
    SELECT * INTO lugpar FROM LugarPartido WHERE Lugar=pr_lugar;
    IF (lugpar.desplazamiento<>pr_desplazamiento or lugpar.costearbitraje<>(pr_desplazamiento*0.2+15)) THEN
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
  PROCEDURE actualizar (nombre_prueba VARCHAR2, pr_lugar VARCHAR2, pr_desplazamiento integer,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    lugpar LugarPartido%ROWTYPE;
    
  BEGIN
    
    
    UPDATE LugarPartido SET desplazamiento=pr_desplazamiento WHERE lugar=pr_lugar;
    
    -- Seleccionar departamento y comprobar que los campos se actualizaron correctamente 
    SELECT * INTO lugpar FROM LugarPartido WHERE lugar=pr_lugar;
    IF (lugpar.desplazamiento<>pr_desplazamiento or lugpar.costearbitraje<>(pr_desplazamiento*0.2+15)) THEN
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
  PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_lugar VARCHAR2,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
     n_lugar INTEGER;
  BEGIN
    
   
    DELETE FROM LugarPartido WHERE lugar=pr_lugar;
    
   
    SELECT COUNT(*) INTO n_lugar FROM LugarPartido WHERE lugar=pr_lugar;
    IF (n_lugar <> 0) THEN
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

END Prueba_LugarPartido;