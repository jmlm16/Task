CREATE OR REPLACE TRIGGER FechasCompeticion
BEFORE INSERT OR UPDATE ON Competicion for each row
begin
  if( :new.FechaInicio > :OLD.FechaFin) then raise_application_error(-20600,'Fecha de inicio posterior a la fecha final');
  end if;
  
  if( :new.FechaFin < :OLD.FechaInicio) then raise_application_error(-20600,'Fecha final anterior a la fecha de inicio');
  end if;
  
  if( :new.FechaFin < :NEW.FechaInicio) then raise_application_error(-20600,'Error con las fechas');
  end if;
  
  if( :NEW.FechaInicio > :new.FechaFin) then raise_application_error(-20600,'Error con las fechas');
  end if;
END;
