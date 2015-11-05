CREATE OR REPLACE PACKAGE Pruebas_jugadora AS 
  
   PROCEDURE INICIALIZAR;
   PROCEDURE INSERTAR (NOMBRE_PRUEBA VARCHAR2, N_DNI CHAR,N_DORSAL NUMBER,N_PESO NUMBER,N_POSICION VARCHAR2,N_MANOHABIL VARCHAR2,N_CATEGORIA VARCHAR2,IDEQUIPO INTEGER, SALIDAESPERADA BOOLEAN);
   PROCEDURE ACTUALIZAR (NOMBRE_PRUEBA VARCHAR2, n_dni char,n_dorsaL number,n_peso number,n_posicion varchar2,n_manohabil varchar2,n_categoria varchar2,idequipo integer, SALIDAESPERADA BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, n_dni char, salidaEsperada BOOLEAN);

END pruebas_jugadora;
/

CREATE OR REPLACE PACKAGE BODY Pruebas_jugadora AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM jugadora;
    NULL;
  END inicializar;

  PROCEDURE insertar (nombre_prueba VARCHAR2,n_dni char,n_dorsal number,n_peso number,n_posicion varchar2,n_manohabil varchar2,n_categoria varchar2,idequipo integer, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    N_JUGADORA JUGADORA%ROWTYPE;
    n_dn char;
  BEGIN
    
    
    INSERT INTO JUGADORA VALUES(N_DNI CHAR,N_DORSAL NUMBER,N_PESO NUMBER,N_POSICION VARCHAR2,N_MANOHABIL VARCHAR2,N_CATEGORIA VARCHAR2,IDEQUIPO INTEGER);
    
    
    N_DN := JUGADORA.DNI;
    SELECT * INTO N_JUGADORA FROM JUGADORA WHERE DNI=N_DN;
    IF (n_jugadora.dni <> n_dni or N_JUGADORA.DORSAL <> N_DORSAL OR n_jugadora.peso <> n_peso OR n_jugadora.POSICION <> n_POSICION OR n_jugadora.MANOHABIL <> n_MANOHABIL OR n_jugadora.CATEGORIA <> n_CATEGORIA OR n_jugadora.IDEQUIPO <> n_IDEQUIPO) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2, n_dni char,n_dorsaL number,n_peso number,n_posicion varchar2,n_manohabil varchar2,n_categoria varchar2,idequipo integer, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_JUGADORA JUGADORA%ROWTYPE;
  BEGIN
    
    
    UPDATE JUGADORA SET DORSAL=n_DORSAL,PESO=n_PESO,POSICION=N_POSICION,MANOHABIL=n_MANOHABIL,CATEGORIA=N_CATEGORIA,IDEQUIPO=n_IDEQUIPO WHERE idpista=n_idpista;
    
   
    SELECT * INTO N_JUGADORA FROM JUGADORA WHERE DNI=N_DNI;
    IF (N_JUGADORA.DORSAL <> n_DORSAL OR N_JUGADORA.PESO <> n_PESO OR N_JUGADORA.POSICION <> N_POSICION OR N_JUGADORA.MANOHABIL <> n_MANOHABIL OR N_JUGADORA.CATEGORIA <> N_CATEGORIA OR N_JUGADORA.IDEQUIPO <> n_IDEQUIPO) THEN
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



  PROCEDURE eliminar (nombre_prueba VARCHAR2, n_DNI number, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    N_DN CHAR;
  BEGIN
    
    /* Eliminar empleado */
    DELETE FROM JUGADORA WHERE DNI=n_DNI;
    
   
    SELECT COUNT(*) INTO N_DN FROM JUGADORA WHERE DNI=N_DNI;
    IF (n_DN <> 0) THEN
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

END PRUEBAS_JUGADORA;