CREATE OR REPLACE PACKAGE Prueba_Cuotas AS 

   PROCEDURE inicializar;
   PROCEDURE insertar (nombre_prueba VARCHAR2, pr_dni varchar2, pr_pagocuota char, pr_fechapago date, salidaEsperada BOOLEAN);
   PROCEDURE actualizar (nombre_prueba VARCHAR2,pr_idcuota integer, pr_dni varchar2, pr_pagocuota char, pr_fechapago date, salidaEsperada BOOLEAN);
   PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_idcuota integer,salidaEsperada BOOLEAN);

END Prueba_Cuotas;
/

 CREATE OR REPLACE PACKAGE BODY Prueba_Cuotas AS

  --inicializacion
  PROCEDURE inicializar AS
  BEGIN

    
     DELETE FROM Cuotas;
     
    NULL;
  END inicializar;

  --insercion
  PROCEDURE insertar (nombre_prueba VARCHAR2, pr_dni varchar2, pr_pagocuota char, pr_fechapago date, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    cuo Cuotas%ROWTYPE;
    pr_idcuota integer;
  BEGIN
    
    
    nueva_cuota(pr_dni, pr_pagocuota, pr_fechapago);
    
    
    pr_idcuota:=sec_cuota.currval;
    SELECT * INTO cuo FROM Cuotas WHERE idcuota=pr_idcuota;
    IF (cuo.dni<>pr_dni or cuo.pagocuota<>pr_pagocuota or cuo.fechapago<>pr_fechapago) THEN
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
  PROCEDURE actualizar (nombre_prueba VARCHAR2,pr_idcuota integer, pr_dni varchar2, pr_pagocuota char, pr_fechapago date, salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
    cuo Cuotas%ROWTYPE;
    
  BEGIN
    
   
    UPDATE Cuotas SET dni=pr_dni, pagocuota=pr_pagocuota, fechapago=pr_fechapago WHERE idcuota=pr_idcuota;
    

    SELECT * INTO cuo FROM Cuotas WHERE idcuota=pr_idcuota;
    IF (cuo.dni<>pr_dni or cuo.pagocuota<>pr_pagocuota or cuo.fechapago<>pr_fechapago) THEN
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
  PROCEDURE eliminar (nombre_prueba VARCHAR2, pr_idcuota integer,salidaEsperada BOOLEAN) AS
    salida BOOLEAN := true;
     n_cuotas INTEGER;
  BEGIN
    
   
    DELETE FROM Cuotas WHERE idcuota=pr_idcuota;
    
    
    SELECT COUNT(*) INTO n_cuotas FROM Cuotas WHERE idcuota=pr_idcuota;
    IF (n_cuotas <> 0) THEN
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

END Prueba_Cuotas;