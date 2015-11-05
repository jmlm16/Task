CREATE OR REPLACE PROCEDURE nuevo_partido(
      P_EQUIPO              in PARTIDO.IDEQUIPO%type,
      p_competicion         in partido.idcompeticion%type,
      p_fecha               IN partido.fecha%TYPE,
      p_rival               IN partido.equiporival%TYPE,
      p_emplazamiento       IN partido.emplazamiento%TYPE,
      p_gf                  IN partido.golesfavor%TYPE,
      p_categoria           IN partido.categoria%TYPE,
      p_gc                  IN partido.golescontra%TYPE,
      p_lugar               IN partido.lugar%TYPE,
      p_tipopartido         IN partido.tipopartido%type)
is begin
  
  insert into PARTIDO values(P_EQUIPO,
  p_competicion, p_fecha,p_rival,p_emplazamiento,p_categoria,p_gf,p_gc,p_lugar,p_tipopartido );
  
  COMMIT WORK;
  
end;