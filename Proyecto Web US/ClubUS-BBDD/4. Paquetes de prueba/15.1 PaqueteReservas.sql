CREATE OR REPLACE PACKAGE Prueba_Reservas AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, pr_dni CHAR, pr_horaInicio date, pr_horaFin date, pr_idpista integer, pr_idmaterial integer,salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2,pr_idreserva integer, pr_dni CHAR, pr_horaInicio date, pr_horaFin date, pr_idpista integer, pr_idmaterial integer,salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_idreserva integer,salidaEsperada BOOLEAN);

END Prueba_Reservas;
/

 CREATE OR REPLACE PACKAGE BODY Prueba_Reservas AS

  --inicializacion
  PROCEDURE inicializar AS
  BEGIN

    
     DELETE FROM Reservas;
     
    NULL;
  END inicializar;

  --insercion
  PROCEDURE insertar (nombre_prueba VARCHAR2, pr_dni CHAR, pr_horaInicio date, pr_horaFin date, pr_idpista integer, pr_idmaterial integer,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    res Reservas%ROWTYPE;
    pr_idreserva integer;
  BEGIN
    
    
    nueva_reserva(pr_dni,pr_horainicio,pr_horafin,pr_idpista,pr_idmaterial);
    
    
    pr_idreserva:=sec_reserva.currval;
    SELECT * INTO res FROM Reservas WHERE idreserva=pr_idreserva;
    IF (res.dni<>pr_dni or res.horainicio<>pr_horainicio or res.horafin<>pr_horafin or res.idpista<>pr_idpista or res.idmaterial<>pr_idmaterial) THEN
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
  PROCEDURE actualizar (nombre_prueba VARCHAR2,pr_idreserva integer, pr_dni CHAR, pr_horaInicio date, pr_horaFin date, pr_idpista integer, pr_idmaterial integer,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    res Reservas%ROWTYPE;
    
  BEGIN
    
   
    UPDATE Reservas SET dni=pr_dni, horainicio=pr_horainicio, horafin=pr_horafin, idpista=pr_idpista, idmaterial=pr_idmaterial WHERE idreserva=pr_idreserva;
    
    
    SELECT * INTO res FROM Reservas WHERE idpista=pr_idpista;
    IF (res.dni<>pr_dni or res.horainicio<>pr_horainicio or res.horafin<>pr_horafin or res.idpista<>pr_idpista or res.idmaterial<>pr_idmaterial) THEN
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
  PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_idreserva integer,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
     n_reservas INTEGER;
  BEGIN
    
  
    DELETE FROM Reservas WHERE idreserva=pr_idreserva;
    
    
    SELECT COUNT(*) INTO n_reservas FROM Reservas WHERE idreserva=pr_idreserva;
    IF (n_reservas <> 0) THEN
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

END Prueba_Reservas;