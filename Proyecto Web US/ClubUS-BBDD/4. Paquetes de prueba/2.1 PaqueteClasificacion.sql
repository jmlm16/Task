CREATE OR REPLACE PACKAGE Pruebas_clasificacion AS 
  
   PROCEDURE INICIALIZAR;
   PROCEDURE INSERTAR (NOMBRE_PRUEBA VARCHAR2,n_idequipo varchar2,n_idcompeticion varchar2, N_PUNTOS NUMBER, SALIDAESPERADA BOOLEAN);
   PROCEDURE ACTUALIZAR (NOMBRE_PRUEBA VARCHAR2,n_idequipo varchar2,n_idcompeticion varchar2,n_puntos number, SALIDAESPERADA BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2,n_idequipo varchar2,n_idcompeticion varchar2, salidaEsperada BOOLEAN);

END pruebas_clasificacion;
/

CREATE OR REPLACE PACKAGE BODY Pruebas_clasificacion AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM clasificacion;
    NULL;
  END inicializar;

  PROCEDURE insertar (nombre_prueba VARCHAR2,n_idequipo varchar2,n_idcompeticion varchar2,n_puntos number, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    N_CLASIFICACION CLASIFICACION%ROWTYPE;
    N_IDEQ VARCHAR2;
    n_idclas varchar2;
  BEGIN
    
    
    nueva_clasificacion(n_puntos);
    
    
    N_IDEQ := N_IDEQUIPO;
    N_IDCLAS := N_IDCOMPETICION;
    SELECT * INTO N_CLASIFICACION FROM CLASIFICACION WHERE IDEQUIPO=N_IDEQ AND IDCOMPETICION=N_IDCLAS;
    IF (n_clasificacion.idequipo <> n_idequipo or n_clasificacion.idcompeticion <> n_idcompeticion or n_clasificacion.puntos <> n_puntos) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2,n_idequipo varchar2,n_idcompeticion varchar2,n_puntos number, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_clasificacion clasificacion%ROWTYPE;
  BEGIN
    
    /
    UPDATE clasificacion SET  puntos=n_puntos WHERE idequipo=n_idequipo and idcompeticion=n_idcompeticion;
    
    
    SELECT * INTO N_CLASIFICACION FROM CLASIFICACION WHERE IDEQUIPO=N_IDEQUIPO AND IDCOMPETICION=N_IDCOMPETICION;
    IF (n_clasificacion.puntos<>n_puntos) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END ACTUALIZAR;



  PROCEDURE eliminar (nombre_prueba VARCHAR2, n_idequipo varchar2,n_idcompeticion varchar2, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_dn number;
  BEGIN
    
    
    DELETE FROM clasificacion WHERE (idequipo=n_idequipo) and (idcompeticion_idcompeticion);
    
    
    SELECT COUNT(*) INTO n_dn FROM clasificacion WHERE idequipo=n_idequipo and idcompeticion=n_idcompeticion;
    IF (n_dn <> 0) THEN
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

END PRUEBAS_clasificacion;