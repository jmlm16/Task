--trigger5
CREATE OR REPLACE TRIGGER materiales 
  BEFORE
  INSERT or update ON Material
  FOR EACH ROW

BEGIN
  IF (:new.Stock < 0)
  THEN raise_application_error
  (-20900,'el stock no puede ser negativo');
  END IF;
END;
