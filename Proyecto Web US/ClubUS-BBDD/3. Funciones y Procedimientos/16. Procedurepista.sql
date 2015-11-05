create or replace procedure NUEVO_PISTA(     
      p_Lugar               IN pista.lugar%TYPE
      )
IS BEGIN
  
  INSERT INTO pista VALUES(sec_pista.nextval,p_lugar);  
  
  commit work;
end;
    /*cambios: 
      se elimina idreserva
    */