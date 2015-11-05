create or replace procedure nueva_competicion
        (
        c_Tipocompeticion in Competicion.Tipocompeticion%type,
        c_Categoria in Competicion.Categoria%type,
        c_FechaInicio in Competicion.FechaInicio%type,
        c_FechaFin in Competicion.FechaFin%type)
is
begin
insert into COMPETICION(IDCOMPETICION, TIPOCOMPETICION, CATEGORIA, FECHAINICIO, FECHAFIN)
        values(sec_competicion.nextval, c_Tipocompeticion, c_Categoria, c_FechaInicio, c_FechaFin);
commit work;
end;