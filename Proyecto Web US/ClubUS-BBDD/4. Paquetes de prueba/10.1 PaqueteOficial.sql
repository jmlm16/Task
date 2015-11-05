CREATE OR REPLACE PACKAGE Prueba_Oficial AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, pr_DNI char,pr_Nombre varchar2,pr_Apellidos varchar2,pr_Direccion varchar2,pr_fechanacimiento date,pr_Sueldo number,pr_Titulacion varchar2, pr_Categoria varchar2,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2, pr_DNI char,pr_Nombre varchar2,pr_Apellidos varchar2,pr_Direccion varchar2,pr_fechanacimiento date,pr_Sueldo number,pr_Titulacion varchar2, pr_Categoria varchar2,salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_DNI CHAR,salidaEsperada BOOLEAN);

END Prueba_Oficial;
/
    
 CREATE OR REPLACE PACKAGE BODY Prueba_Oficial AS

  --inicializacion
  PROCEDURE inicializar AS
  BEGIN

    
     DELETE FROM Oficial;
     
    NULL;
  END inicializar;

  --insercion
  PROCEDURE insertar (nombre_prueba VARCHAR2, pr_DNI char,pr_Nombre varchar2,pr_Apellidos varchar2,pr_Direccion varchar2,pr_fechanacimiento date,pr_Sueldo number,pr_Titulacion varchar2, pr_Categoria varchar2,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    ofi Oficial%ROWTYPE;
    pers Persona%ROWTYPE;
  BEGIN
    
    nuevo_oficial(pr_DNI,pr_Nombre,pr_Apellidos, pr_Direccion,pr_fechanacimiento, pr_Sueldo, pr_Titulacion, pr_Categoria);
    
    select * into pers from Persona where dni=pr_dni;
    SELECT * INTO ofi FROM oficial WHERE dni=pr_dni;

    IF (pers.nombre<>pr_nombre or pers.apellidos<>pr_apellidos or pers.direccion<>pr_direccion 
                          or pers.fechanacimiento<>pr_fechanacimiento or ofi.sueldo<>pr_sueldo or ofi.titulacion<>pr_titulacion 
                          or ofi.categoria<>pr_categoria) THEN
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
  PROCEDURE actualizar (nombre_prueba VARCHAR2, pr_DNI char,pr_Nombre varchar2,pr_Apellidos varchar2,pr_Direccion varchar2,pr_fechanacimiento date,pr_Sueldo number,pr_Titulacion varchar2, pr_Categoria varchar2,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    ofi Oficial%ROWTYPE;
    pers Persona%ROWTYPE;
  BEGIN
    
    --actualizar persona y oficial
    UPDATE Persona SET nombre=pr_nombre,apellidos=pr_apellidos,direccion=pr_direccion,fechanacimiento=pr_fechanacimiento WHERE DNI=pr_DNI;
    UPDATE Oficial SET sueldo=pr_sueldo, titulacion=pr_titulacion, categoria=pr_categoria WHERE DNI=pr_DNI;
    -- Seleccionar oficial y persona y comprobar que los campos se actualizaron correctamente 
    SELECT * INTO pers FROM Persona WHERE DNI=pr_DNI;
    SELECT * INTO ofi FROM Oficial WHERE DNI=pr_DNI;
    IF (pers.nombre<>pr_nombre or pers.apellidos<>pr_apellidos or pers.direccion<>pr_direccion 
                          or pers.fechanacimiento<>pr_fechanacimiento or ofi.sueldo<>pr_sueldo or ofi.titulacion<>pr_titulacion 
                          or ofi.categoria<>pr_categoria) THEN
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
  PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_DNI CHAR,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
     n_DNIO INTEGER;
     n_DNIP INTEGER;
  BEGIN
    
  
    DELETE FROM Persona WHERE DNI=pr_DNI;
    DELETE FROM Oficial WHERE DNI=pr_DNI;
   
    SELECT COUNT(*) INTO n_DNIO FROM Oficial WHERE DNI=pr_DNI;
    SELECT COUNT(*) INTO n_DNIP FROM Persona WHERE DNI=pr_DNI;
    IF (n_DNIO <> 0 and n_DNIP<>0) THEN
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

END Prueba_Oficial;