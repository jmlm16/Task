--trigger1
CREATE OR REPLACE TRIGGER CostesPartido 
  BEFORE
  INSERT or update ON LugarPartido
  FOR EACH ROW

BEGIN
  IF (:new.Desplazamiento < 0 or :new.CosteArbitraje < 0)
  THEN raise_application_error
  (-20800,'el desplazamiento y el coste de arbitraje debe ser mayor o igual a 0');
  END IF;
END;
