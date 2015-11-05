create or replace procedure nueva_lesion(
          l_DNI in Lesion.DNI%type,
          l_Tipo in Lesion.Tipo%type,
          l_FechaInicio in Lesion.FechaInicio%type,
          l_FechaFin in Lesion.FechaFin%type,
          l_Recaida in Lesion.Recaida%type)
          
is
begin
  insert into LESION(IDLESION,DNI, TIPO, FECHAINICIO, FECHAFIN, RECAIDA)
          values(sec_lesion.nextval,l_DNI, l_Tipo, l_FechaInicio, l_FechaFin, l_Recaida);
commit work;
end;