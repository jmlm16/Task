create or replace procedure nueva_reserva(
      n_DNI         in reservas.dni%type,
      n_HoraInicio  in reservas.horainicio%type,
      N_HORAFIN     in RESERVAS.HORAFIN%type,
      N_IDPISTA     in RESERVAS.IDPISTA%type,
      n_idmaterial  in reservas.idmaterial%type)
is 
begin

    insert into Reservas values(sec_reserva.nextval,n_dni,n_horainicio,n_horafin,N_IDPISTA,n_idmaterial);

commit work;
end;