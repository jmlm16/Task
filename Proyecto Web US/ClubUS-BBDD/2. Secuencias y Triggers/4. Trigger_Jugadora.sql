--trigger3
CREATE OR REPLACE TRIGGER Atributos 
  BEFORE
  INSERT or update ON Jugadora
  FOR EACH ROW

BEGIN
  IF (:new.Dorsal < 1)
  THEN raise_application_error
  (-20800,'el dorsal debe ser positivo');
  END IF;
  IF (:new.Peso < 1)
  THEN raise_application_error
  (-20800,'el peso debe ser positivo');
  END IF;
END;
