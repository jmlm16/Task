create or replace procedure nueva_cuota(
          c_dni in Cuotas.DNI%type,
          c_pagocuota in Cuotas.PagoCuota%type,
          c_fechapago in Cuotas.FechaPago%type)
is begin
    insert into Cuotas values(sec_cuota.nextval, c_dni, c_pagocuota, c_fechapago);
    commit work;
end;    