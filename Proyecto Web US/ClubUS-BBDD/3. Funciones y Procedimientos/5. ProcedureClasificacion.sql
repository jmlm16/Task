create or replace procedure nueva_clasificacion
        (c_IDEquipo in clasificacion.IDEquipo%type,
        c_IDCompeticion in clasificacion.IDCompeticion%type,
        c_Puntos in clasificacion.puntos%type)
is
begin
insert into clasificacion values(c_idequipo,c_IDCompeticion,c_puntos);
commit work;
end;