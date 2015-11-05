create or replace PACKAGE Pruebas_material AS 
  
   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2,n_stock number, n_proveedor varchar2, n_tipo varchar2 ,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2, n_stock VARCHAR2, salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, salidaEsperada BOOLEAN);

END pruebas_material;
/
create or replace PACKAGE BODY Pruebas_material AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM material;
    NULL;
  END inicializar;

  PROCEDURE insertar (nombre_prueba VARCHAR2,n_stock number, n_proveedor varchar2, n_tipo varchar2 ,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_material material%ROWTYPE;
    ind number;
  BEGIN
    
  
    nuevo_material(n_stock,n_proveedor,n_tipo);
    ind :=sec_material.currval;
 
    SELECT * INTO n_material FROM material WHERE idmaterial=ind;
    IF (n_material.stock<>n_stock or n_material.proveedor<>n_proveedor or 
        n_material.tipo<>n_tipo) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2, n_stock VARCHAR2, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_material material%ROWTYPE;
    ind number;
  BEGIN
    
    ind:= sec_material.currval;
  
    UPDATE material SET stock=n_stock WHERE idmaterial=ind;
    
  
    SELECT * INTO n_material FROM material WHERE idmaterial=ind;
    IF (n_material.stock<>n_stock) THEN
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
    n_material INTEGER;
    ind number;
  BEGIN
    
    ind:= sec_material.currval;
  
    DELETE FROM material WHERE idmaterial=ind;
    
  
    SELECT COUNT(*) INTO n_material FROM material WHERE idmaterial=ind;
    IF (n_material <> 0) THEN
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

END pruebas_material;