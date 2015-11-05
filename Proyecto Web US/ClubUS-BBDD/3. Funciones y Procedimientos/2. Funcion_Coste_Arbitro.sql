create or replace function ARBITRO ( L_LUGAR in LUGARPARTIDO.LUGAR%type, l_desplazamiento in LUGARPARTIDO.DESPLAZAMIENTO%type )
RETURN float IS W_cost LUGARPARTIDO.COSTEARBITRAJE%type;
begin 
  SELECT ((l_desplazamiento*0.2)+15) INTO W_cost FROM lugarpartido WHERE lugar = l_lugar;
  return W_COST;
end ARBITRO;
