
CREATE OR REPLACE TRIGGER FechasReservas
BEFORE INSERT OR UPDATE ON Reservas for each row
begin
  if( :new.HoraInicio > :OLD.HoraFin) then raise_application_error(-20600,'Hora de inicio posterior a la hora final');
  end if;
  
  if( :new.HoraFin < :OLD.HoraInicio) then raise_application_error(-20600,'Hora final anterior a la hora de inicio');
  end if;
  
  if( :new.HoraFin < :NEW.HoraInicio) then raise_application_error(-20600,'Error con las horas');
  end if;
  
  if( :NEW.HoraInicio > :new.HoraFin) then raise_application_error(-20600,'Error con las horas');
  end if;
end;
