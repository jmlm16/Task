create or replace PACKAGE Pruebas_partido AS 
  
   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, P_EQUIPO number,
   p_competicion number, p_fecha date ,p_rival varchar2,p_emplazamiento varchar2,
   p_categoria varchar2,p_gf number,p_gc number,p_lugar varchar2,p_tipopartido varchar2,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2,  p_equipo number, p_fecha date, p_gf number,p_gc number , salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, p_equipo number, p_fecha date,salidaEsperada BOOLEAN);

END pruebas_partido;
/

create or replace PACKAGE BODY Pruebas_partido AS
  /* INICIALIZACIÓN */
  PROCEDURE inicializar AS
  BEGIN
    /* Borrar contenido de la tabla */
     DELETE FROM partido;
    NULL;
  END inicializar;

  PROCEDURE insertar (nombre_prueba VARCHAR2, P_EQUIPO number, p_competicion number, p_fecha date ,p_rival varchar2,p_emplazamiento varchar2,
    p_categoria varchar2,p_gf number,p_gc number,p_lugar varchar2,p_tipopartido varchar2,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_partido partido%ROWTYPE;
  BEGIN
    
    
    nuevo_partido (P_EQUIPO, p_competicion, p_fecha,p_rival,p_emplazamiento,p_categoria,p_gf,p_gc,p_lugar,p_tipopartido);
   
    SELECT * INTO n_partido FROM partido WHERE idequipo=p_equipo and fecha=p_fecha;
    IF (n_partido.idequipo<>p_equipo or n_partido.idcompeticion<>p_competicion or 
        n_partido.fecha<>p_fecha or n_partido.equiporival<>p_rival or n_partido.emplazamiento<>p_emplazamiento or
        n_partido.categoria<>p_categoria or n_partido.golesfavor<>p_gf or n_partido.golescontra<>p_gc or n_partido.tipopartido<>p_tipopartido) THEN
      salida := false;
    END IF;
    COMMIT WORK;
    
    DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(salida,salidaEsperada));
    
    EXCEPTION
    WHEN OTHERS THEN
          DBMS_OUTPUT.put_line(nombre_prueba || ':' || ASSERT_EQUALS(false,salidaEsperada));
          ROLLBACK;
  END insertar;


  PROCEDURE actualizar (nombre_prueba VARCHAR2,  p_equipo number, p_fecha date, p_gf number,p_gc number , salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_partido partido%ROWTYPE;
  BEGIN
    
    UPDATE partido SET golesfavor=p_gf ,golescontra=p_gc WHERE idequipo=p_equipo and fecha=p_fecha;
    
   
    SELECT * INTO n_partido FROM partido WHERE idequipo=p_equipo and fecha=p_fecha;
    IF ( n_partido.golesfavor<>p_gf or n_partido.golescontra<>p_gc) THEN
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



  PROCEDURE eliminar (nombre_prueba VARCHAR2, p_equipo number, p_fecha date,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    n_partido INTEGER;
  BEGIN
    
    DELETE FROM partido WHERE idequipo=p_equipo and fecha=p_fecha;
    
   
    SELECT COUNT(*) INTO n_partido FROM partido WHERE idequipo=p_equipo and fecha=p_fecha;
    IF (n_partido <> 0) THEN
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

END pruebas_partido;