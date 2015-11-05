CREATE OR REPLACE PROCEDURE actualiza_lugarpartido(
      
      P_LUGAR               in LUGARPARTIDO.LUGAR%type,
      P_DESPLAZAMIENTO      in LUGARPARTIDO.DESPLAZAMIENTO%type)

IS BEGIN
  
  
  update lugarpartido set costearbitraje = arbitro(p_lugar,p_desplazamiento) where lugar = P_LUGAR;
  
  
  commit work;
end;