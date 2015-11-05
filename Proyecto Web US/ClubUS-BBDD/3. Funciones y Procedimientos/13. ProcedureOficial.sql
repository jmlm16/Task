create or replace procedure Nuevo_Oficial(
    p_DNI in Persona.DNI%type,
    p_Nombre in Persona.Nombre%type,
    p_Apellidos in Persona.Apellidos%type,
    P_DIRECCION in PERSONA.DIRECCION%type,
    p_fechanacimiento in PERSONA.FECHANACIMIENTO %type,
    o_Sueldo in Oficial.Sueldo%type,
    o_Titulacion in Oficial.Titulacion%type,
    o_Categoria in Oficial.Categoria%type)
is
begin
    insert into PERSONA(DNI, NOMBRE, APELLIDOS, DIRECCION, FECHANACIMIENTO)
          values(p_DNI, p_Nombre, p_Apellidos, p_Direccion, p_fechanacimiento);
    insert into Oficial(DNI, Sueldo, Titulacion, Categoria)
          values(p_DNI, o_Sueldo, o_Titulacion, o_Categoria);
commit work;
end;
    
    