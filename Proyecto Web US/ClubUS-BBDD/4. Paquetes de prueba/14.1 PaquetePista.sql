CREATE OR REPLACE PACKAGE Pruebas_pista AS 
  
   PROCEDURE INICIALIZAR;
   PROCEDURE INSERTAR (NOMBRE_PRUEBA VARCHAR2, N_LUGAR VARCHAR2, SALIDAESPERADA BOOLEAN);
   PROCEDURE ACTUALIZAR (NOMBRE_PRUEBA VARCHAR2, N_IDPISTA NUMBER, N_LUGAR VARCHAR2, SALIDAESPERADA BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, n_idpista number, salidaEsperada BOOLEAN);

END pruebas_pista;
/

CREATE OR REPLACE PACKAGE BODY Pruebas_pista AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM pista;
    NULL;
  END inicializar;
  
  PROCEDURE insertar (nombre_prueba VARCHAR2, N_LUGAR VARCHAR2, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    N_PISTA PISTA%ROWTYPE;
    n_idpist number;
  BEGIN
    
  
    INSERT INTO pista VALUES(sec_pista.nextval,n_lugar);
    
  
    N_IDPIST := SEC_COMPETICION.CURRVAL;
    SELECT * INTO N_PISTA FROM PISTA WHERE IDPISTA=N_IDPIST;
    IF (n_pista.lugar<>n_lugar) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2,N_IDPISTA number, N_LUGAR VARCHAR2, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_pista pista%ROWTYPE;
  BEGIN
    
   
    UPDATE pista SET lugar=n_lugar WHERE idpista=n_idpista;
    
   
    SELECT * INTO N_PISTA FROM PISTA WHERE IDPISTA=N_IDPISTA;
    IF (n_pista.lugar<>n_lugar) THEN
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



  PROCEDURE eliminar (nombre_prueba VARCHAR2, n_idpista number, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_pista number;
  BEGIN
    
  
    DELETE FROM pista WHERE idpista=n_idpista;
    
    /* Verificar que el departamento no se encuentra en la BD */
    SELECT COUNT(*) INTO N_PISTA FROM PISTA WHERE IDPISTA=N_IDPISTA;
    IF (n_idpista <> 0) THEN
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

END PRUEBAS_pista;