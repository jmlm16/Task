create or replace procedure nuevo_equipo(
      n_categoria in equipo.categoria%type,
      n_liga      in equipo.liga%type)
is
begin

  insert into equipo values (sec_equipo.nextval,n_categoria,n_liga);

commit work;
end;
