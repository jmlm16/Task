CREATE OR REPLACE PACKAGE Pruebas_asistencia AS 
  
   PROCEDURE INICIALIZAR;
   PROCEDURE insertar (nombre_prueba VARCHAR2, n_dni char, n_tipoevento VARCHAR2, n_fechaevento date, n_falta char, salidaEsperada BOOLEAN);
   PROCEDURE ACTUALIZAR (NOMBRE_PRUEBA VARCHAR2, N_DNI CHAR, N_TIPOEVENTO VARCHAR2, N_FECHAEVENTO DATE, N_FALTA CHAR, SALIDAESPERADA BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2,n_dni char, salidaEsperada BOOLEAN);

END pruebas_asistencia;
/

CREATE OR REPLACE PACKAGE BODY Pruebas_asistencia AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM asistencia;
    NULL;
  END inicializar;
/* PRUEBA PARA LA INSERCIÓN DE DEPARTAMENTOS */
  PROCEDURE insertar (nombre_prueba VARCHAR2,n_dni char, n_tipoevento VARCHAR2, n_fechaevento date, n_falta char, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    N_ASISTENCIA ASISTENCIA%ROWTYPE;
    n_dnival char;
  BEGIN
    
    /* Insertar departamento */
    nuevo_asistencia(n_dni, n_tipoevento, n_fechaevento, n_falta);
    
    /* Seleccionar departamento y comprobar que los datos se insertaron correctamente */
    N_DNIVAL := N_DNI;
    SELECT * INTO N_ASISTENCIA FROM ASISTENCIA WHERE DNI=N_DNIVAL;
    IF (n_asistencia.dni <> n_dni or n_asistencia.tipoevento <> n_tipoevento or n_asistencia.fechaevento <> n_fechaevento or n_asistencia.falta <> n_falta) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;

/* PRUEBA PARA LA ACTUALIZACIÓN DE DEPARTAMENTOS */
  PROCEDURE actualizar (nombre_prueba VARCHAR2, N_DNI CHAR, N_TIPOEVENTO VARCHAR2, N_FECHAEVENTO DATE, N_FALTA CHAR, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_asistencia asistencia%ROWTYPE;
  BEGIN
    
    /* Actualizar empleado */
    UPDATE asistencia SET tipoevento=n_tipoevento, fechaevento=n_fechaevento, FALTA=n_falta WHERE dni=n_dni;
    
    /* Seleccionar departamento y comprobar que los campos se actualizaron correctamente */
    SELECT * INTO N_ASISTENCIA FROM ASISTENCIA WHERE DNI=N_DNI;
    IF (n_asistencia.tipoevento<>n_tipoevento or n_asistencia.fechaevento<>n_fechaevento or n_asistencia.falta <> n_falta) THEN
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


/* PRUEBA PARA LA ELIMINACIÓN DE DEPARTAMENTOS */
  PROCEDURE eliminar (nombre_prueba VARCHAR2, n_dni char, salidaEsperada BOOLEAN) AS
    SALIDA BOOLEAN := TRUE;
    n_dn char;
  BEGIN
    
    /* Eliminar empleado */
    DELETE FROM asistencia WHERE dni=n_dni;
    
    /* Verificar que el departamento no se encuentra en la BD */
    SELECT COUNT(*) INTO n_dn FROM asistencia WHERE dni=n_dni;
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

END PRUEBAS_asistencia;