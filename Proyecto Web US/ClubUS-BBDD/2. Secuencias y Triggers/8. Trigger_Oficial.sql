--trigger4
CREATE OR REPLACE TRIGGER sueldos 
  BEFORE
  INSERT or update ON Oficial
  FOR EACH ROW

BEGIN
  IF (:new.Sueldo < 0)
  THEN raise_application_error
  (-20900,'el sueldo no puede ser negativo');
  END IF;
END;
