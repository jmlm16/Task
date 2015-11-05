 CREATE OR REPLACE PACKAGE PRUEBAS_EQUIPO AS 

   PROCEDURE INICIALIZAR;
   PROCEDURE INSERTAR (NOMBRE_PRUEBA VARCHAR2, W_CATEGORIA VARCHAR2,W_LIGA VARCHAR2,SALIDAESPERADA BOOLEAN);
   PROCEDURE ACTUALIZAR (NOMBRE_PRUEBA VARCHAR2,W_IDEQUIPO integer, W_CATEGORIA VARCHAR2,W_LIGA varchar2, SALIDAESPERADA BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2,w_idequipo INTEGER, salidaEsperada BOOLEAN);

END PRUEBAS_EQUIPO;
/

 CREATE OR REPLACE PACKAGE BODY PRUEBAS_equipo AS

  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN

    /* Borrar contenido de la tabla */
     DELETE FROM equipo;
     
    NULL;
  END inicializar;


  PROCEDURE insertar (NOMBRE_PRUEBA VARCHAR2, W_CATEGORIA VARCHAR2,W_LIGA varchar2,SALIDAESPERADA BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_equipo equipo%ROWTYPE;
    w_idequipo INTEGER;
  BEGIN
    
   
    nuevo_equipo(W_CATEGORIA,W_liga);
    
    W_IDEQUIPO := SEC_EQUIPO.CURRVAL;
    SELECT * INTO N_EQUIPO FROM EQUIPO WHERE IDEQUIPO=W_IDEQUIPO;
    IF (n_equipo.categoria <> w_categoria or n_equipo.liga <> w_liga) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    /* Mostrar resultado de la prueba */
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2,w_idequipo integer,W_CATEGORIA VARCHAR2,W_LIGA varchar2, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    equipos equipo%ROWTYPE;
  BEGIN
    
    
    UPDATE equipo SET categoria=W_CATEGORIA, liga=w_liga WHERE idequipo=w_idequipo;
    
    
    SELECT * INTO EQUIPOS FROM EQUIPO WHERE IDEQUIPO=W_IDEQUIPO;
    IF (equipos.categoria <> w_categoria or equipos.liga <> w_liga) THEN
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



  PROCEDURE eliminar (nombre_prueba VARCHAR2,w_idequipo INTEGER, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_equipo INTEGER;
  BEGIN
    
  
    DELETE FROM equipo WHERE idequipo=w_idequipo;
    
   
    SELECT COUNT(*) INTO N_EQUIPO FROM EQUIPO WHERE IDEQUIPO=W_IDEQUIPO;
    IF (n_equipo <> 0) THEN
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

END PRUEBAS_equipo;
/


