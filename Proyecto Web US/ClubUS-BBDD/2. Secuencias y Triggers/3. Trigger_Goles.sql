--trigger7
CREATE OR REPLACE TRIGGER  Goles
  BEFORE
  INSERT or update ON Partido
  FOR EACH ROW

BEGIN
  IF (:new.GolesFavor < 0 or :new.GolesContra < 0)
  THEN raise_application_error
  (-20100,'los goles no pueden ser negativos');
  END IF;
END;
