create or replace procedure nueva_jugadora(
      n_dni             in persona.dni%type,
      n_nombre          in persona.nombre%type,
      n_apellidos       in persona.apellidos%type,
      n_direccion       in persona.direccion%type,
      n_fechanacimiento in persona.fechanacimiento%type,
      n_dorsal          in jugadora.dorsal%type,
      n_peso            in jugadora.peso%type,
      n_posicion        in jugadora.posicion%type,
      n_manohabil       in jugadora.manohabil%type,
      n_idequipo        in jugadora.idequipo%type)
IS

BEGIN

  insert into persona values(n_dni,n_nombre,n_apellidos,n_direccion,n_fechanacimiento);
 
  if(to_number(to_char(n_fechanacimiento,'yy'))-to_number(to_char(sysdate,'yy')) > 17) then insert into jugadora values(n_dni,n_dorsal,n_peso,n_posicion,n_manohabil,'senior',n_idequipo);
  else 
      if(to_number(to_char(n_fechanacimiento,'yy'))-to_number(to_char(sysdate,'yy')) > 15) then insert into jugadora values(n_dni,n_dorsal,n_peso,n_posicion,n_manohabil,'juvenil',n_idequipo);
      else if(to_number(to_char(n_fechanacimiento,'yy'))-to_number(to_char(sysdate,'yy')) > 13) then insert into jugadora values(n_dni,n_dorsal,n_peso,n_posicion,n_manohabil,'cadete',n_idequipo);
           else if(to_number(to_char(n_fechanacimiento,'yy'))-to_number(to_char(sysdate,'yy')) > 11) then insert into jugadora values(n_dni,n_dorsal,n_peso,n_posicion,n_manohabil,'infantil',n_idequipo);
                else if(to_number(to_char(n_fechanacimiento,'yy'))-to_number(to_char(sysdate,'yy')) > 9) then insert into jugadora values(n_dni,n_dorsal,n_peso,n_posicion,n_manohabil,'alevin',n_idequipo);
                     else insert into jugadora values(n_dni,n_dorsal,n_peso,n_posicion,n_manohabil,'benjamin',n_idequipo);
                     end if;
                end if;
           end if;
      end if;
  end if;
  
  commit work;

END;