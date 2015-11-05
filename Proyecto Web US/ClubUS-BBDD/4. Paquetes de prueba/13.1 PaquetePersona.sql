create or replace PACKAGE Pruebas_Persona AS 
  
   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, n_dni VARCHAR2, n_nombre VARCHAR2, n_apellidos date, n_direccion date, n_fechanacimiento date ,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2, n_dni number, n_nombre VARCHAR2, salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, n_dni number, salidaEsperada BOOLEAN);

END pruebas_persona;
/

create or replace PACKAGE BODY Pruebas_persona AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM persona;
    NULL;
  END inicializar;

  PROCEDURE insertar (nombre_prueba VARCHAR2, n_dni VARCHAR2, n_nombre VARCHAR2, n_apellidos date, n_direccion date, n_fechanacimiento date ,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_persona persona%ROWTYPE;
  BEGIN
    
   
    INSERT INTO persona VALUES(n_dni , n_nombre , n_apellidos , n_direccion , n_fechanacimiento);
    
   
    SELECT * INTO n_persona FROM persona WHERE dni=n_dni;
    IF (n_persona.dni<>n_dni or n_persona.nombre<>n_nombre or 
        n_persona.apellidos<>n_apellidos or n_persona.direccion<>n_direccion or n_persona.fechanacimiento<>n_fechanacimiento) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2, n_dni number, n_nombre VARCHAR2, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_persona persona%ROWTYPE;
  BEGIN
    

    UPDATE persona SET nombre=n_nombre WHERE dni=n_dni;
    
   
    SELECT * INTO n_persona FROM persona WHERE dni=n_dni;
    IF (n_persona.nombre<>n_nombre) THEN
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



  PROCEDURE eliminar (nombre_prueba VARCHAR2, n_dni number, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_persona INTEGER;
  BEGIN
    
  
    DELETE FROM persona WHERE dni=n_dni;
    
   
    SELECT COUNT(*) INTO n_persona FROM persona WHERE dni=n_dni;
    IF (n_persona <> 0) THEN
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

END pruebas_persona;