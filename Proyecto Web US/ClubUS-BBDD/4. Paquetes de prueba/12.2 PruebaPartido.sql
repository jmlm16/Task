SET SERVEROUTPUT ON;

BEGIN
  pruebas_partido.INICIALIZAR;
  pruebas_partido.INSERTAR('Prueba 1 - Inserción partido',1,2,'23/03/2014','Lora del Rio','Polideportivo Local','senior',3,3,'Lora del Rio','local',true);
  pruebas_partido.INSERTAR('Prueba 2 - Inserción partido con categoria null',1,2,'23/03/2014','Lora del Rio','Polideportivo Local',null,3,3,'Lora del Rio','local',false);
  pruebas_partido.ACTUALIZAR('Prueba 3 - Actualización de goles',1,'23/03/2014',5,5,true);
  pruebas_partido.ACTUALIZAR('Prueba 4 - Disparador, goles a favor negativo',1,'23/03/2014',-2,2,false);
  pruebas_partido.ACTUALIZAR('Prueba 5 - Disparador, goles en contra negativo',1,'23/03/2014',2,-2,false);
  pruebas_partido.ELIMINAR('Prueba 6 - Eliminar partido',1,'23/03/2014',true);
END;