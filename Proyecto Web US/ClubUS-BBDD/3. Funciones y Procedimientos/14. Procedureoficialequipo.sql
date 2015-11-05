CREATE OR REPLACE PROCEDURE nuevo_oficialequipo(
      
      oe_dni                  IN oficialequipo.dni%TYPE,
      oe_equipo               IN oficialequipo.idequipo%TYPE
      )
      
IS BEGIN
  
  
  INSERT INTO oficialequipo VALUES(oe_dni,oe_equipo);
  
  
  commit work;
end;