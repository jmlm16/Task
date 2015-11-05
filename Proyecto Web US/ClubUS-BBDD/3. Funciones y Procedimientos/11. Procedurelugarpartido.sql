CREATE OR REPLACE PROCEDURE nuevo_lugarpartido(
      
      P_LUGAR               in LUGARPARTIDO.LUGAR%type,
      P_DESPLAZAMIENTO      in LUGARPARTIDO.DESPLAZAMIENTO%type)

IS BEGIN
  
  
  insert into LUGARPARTIDO values(P_LUGAR,P_DESPLAZAMIENTO,(P_desplazamiento*0.2+15));
  
  
  commit work;
end;