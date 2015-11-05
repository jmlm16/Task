create or replace 
trigger MAXJUGADORAS 
  BEFORE
  INSERT or update ON Jugadora
  for each row
declare jugadoras integer;
begin
  select COUNT(*) into JUGADORAS from JUGADORA where IDEQUIPO = :new.IDEQUIPO group by IDEQUIPO; 
  IF (jugadoras > 17)
  then RAISE_APPLICATION_ERROR
  (-20800,'un equipo no puede estar compuesto por mas de 18 jugadoras');
  END IF;
  
END;