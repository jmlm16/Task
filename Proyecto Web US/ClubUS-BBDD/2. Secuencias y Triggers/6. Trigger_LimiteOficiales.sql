create or replace 
trigger MAXoficiales 
  before
  INSERT or update ON oficialequipo
  for each row
declare OFICIALES integer;
begin
  select COUNT(*) into OFICIALES from OFICIALequipo where IDEQUIPO = :new.idequipo group by  IDEQUIPO; 
   
  IF (inserting and OFICIALES > 3)
  then RAISE_APPLICATION_ERROR
  (-20800,'un equipo no puede estar compuesto por mas de 4 oficiales');
  END IF;
  
END;