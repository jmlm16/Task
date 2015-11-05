CREATE OR REPLACE PROCEDURE nuevo_asistencia(
      
      a_dni               IN asistencia.dni%TYPE,
      a_tipo              IN asistencia.tipoevento%TYPE,
      a_fecha             IN asistencia.fechaevento%TYPE,
      a_falta             IN asistencia.falta%type)
IS BEGIN
  
  
  INSERT INTO asistencia VALUES(a_dni,a_tipo,a_fecha,a_falta);
  
  
  commit work;
end;