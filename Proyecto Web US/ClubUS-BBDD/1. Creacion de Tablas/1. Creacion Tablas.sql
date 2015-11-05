drop table Persona cascade constraints;
drop table Jugadora cascade constraints;
drop table Equipo cascade constraints;
drop table Competicion cascade constraints;
drop table LugarPartido cascade constraints;
drop table OficialEquipo cascade constraints;
drop table Reservas;
drop table Oficial cascade constraints;
drop table Lesion;
drop table Asistencia;
drop table Pista cascade constraints;
drop table Material;
drop table Clasificacion;
drop table PARTIDO;
drop table cuotas cascade constraints;



create table Competicion(
  IDCOMPETICION integer,
  TipoCompeticion varchar2(8) not null check(Tipocompeticion = 'amistoso' or Tipocompeticion = 'liga' or Tipocompeticion ='copa' ),
  Categoria varchar2(8) not null check(Categoria = 'benjamin' or Categoria = 'alevin' or Categoria = 'infantil' 
                                or Categoria = 'cadete' or Categoria = 'juvenil' or Categoria = 'senior'),
  FechaInicio date,
  FechaFin date,
  primary key (IDCompeticion)
);

create table LugarPartido(
  Lugar varchar2(50) not null,
  Desplazamiento integer, 
  CosteArbitraje float,
  primary key (Lugar)
);

--Equipo: Hecha
create table Equipo(
  IDEquipo integer,
  Categoria varchar2(8) not null
                         check(Categoria = 'benjamin' or Categoria = 'alevin' or Categoria = 'infantil' 
                                or Categoria = 'cadete' or Categoria = 'juvenil' or Categoria = 'senior'),
  Liga varchar2(11) not null check (Liga in ('provincial','local','territorial','1ªnacional','honor b','superliga')),
  primary key (IDEquipo)
);

create table Persona( 
    DNI char(9),
    Nombre varchar2(50) not null, 
    Apellidos varchar2(50) not null, 
    DIRECCION varchar2(50), 
    fechanacimiento date not null,
    primary key(DNI)
    );
    
CREATE TABLE Jugadora (DNI CHAR(9),
                  Dorsal NUMBER,--triger aqui, debe ser positivo
                  Peso NUMBER,--idem dorsal
                  POSICION varchar2(7) check (POSICION in ('central','lateral','pivote','portero','extremo')),
                  Manohabil varchar2(1) check (Manohabil in ('D','Z','A')), 
                  Categoria varchar2(8) not null check(Categoria = 'benjamin' or Categoria = 'alevin' or Categoria = 'infantil' 
                                or Categoria = 'cadete' or Categoria = 'juvenil' or Categoria = 'senior'),
                  IDEquipo integer,
                  PRIMARY KEY (DNI),
                  foreign key(IDEquipo) references Equipo,
                  foreign key(DNI) references Persona
);
                

CREATE TABLE Oficial (DNI CHAR(9),
                  Sueldo NUMBER,--triger mayor o igual que 0
                  Titulacion varchar2(11) not null check( Titulacion in ('Nacional','Territorial','Provincial','Monitor')),
                  Categoria varchar2(8) not null check(Categoria = 'benjamin' or Categoria = 'alevin' or Categoria = 'infantil' 
                                or Categoria = 'cadete' or Categoria = 'juvenil' or Categoria = 'senior'),
                  PRIMARY KEY (DNI),
                  foreign key(DNI) references Persona
                );
create table LESION(
                  idlesion integer,
                  DNI CHAR(9),
                  Tipo varchar2(50) not null,
                  FechaInicio date,
                  FechaFin date,--triger aqui
                  RECAIDA char(2) check ( RECAIDA in ('si','no')),
                  PRIMARY KEY (idlesion),
                  foreign key(DNI) references Jugadora
                );
CREATE TABLE Asistencia 
                  (DNI CHAR(9),
                  TipoEvento varchar2(50) not null,
                  FechaEvento date,
                  Falta char(2) not null check (Falta in ('si','no')),
                  PRIMARY KEY (DNI,FechaEvento),
                  foreign key(DNI) references Jugadora
);
create table PISTA 
                  (IDpista integer,
                  LUGAR varchar2(50) not null,
                  PRIMARY KEY (IDpista)
                );
create table MATERIAL 
                  (IDmaterial integer,
                  Stock number,--triguer debe ser mayor o igual a 0
                  Proveedor varchar2(50),
                  TIPO varchar2(50) not null,
                  PRIMARY KEY (IDmaterial)
                );
CREATE TABLE Clasificacion 
                  (IDEquipo integer,
                  IDCOMPETICION integer,
                  Puntos number default 0,
                  PRIMARY KEY (IDEquipo,IDCompeticion),
                  foreign key(IDEquipo) references Equipo,
                  foreign key(IDCompeticion) references Competicion
                );
CREATE TABLE Partido 
                  (IDEquipo integer,
                  IDCompeticion integer,
                  Fecha date,
                  EquipoRival varchar2(50) not null,
                  Emplazamiento varchar2(50),
                  Categoria varchar2(8) not null check(Categoria = 'benjamin' or Categoria = 'alevin' or Categoria = 'infantil' 
                                or Categoria = 'cadete' or Categoria = 'juvenil' or Categoria = 'senior'),
                  GolesFavor number,--triger mayor a 0
                  GolesContra number,--idem arriba
                  Lugar varchar2(50) not null,
                  TipoPartido varchar2(8) not null check(TipoPartido = 'amistoso' or TipoPartido = 'liga' or TipoPartido ='copa' ),
                  PRIMARY KEY (Fecha,IDEquipo),
                  foreign key(IDEquipo) references Equipo,
                  foreign key(IDCompeticion) references Competicion,
                  foreign key(Lugar) references LugarPartido
                );
    
create table OficialEquipo(
  DNI char(9),
  IDEquipo integer,
  primary key(DNI),
  foreign key(DNI) references Oficial,
  foreign key(IDEquipo) references Equipo
  );
  
  --Pista
  
create table Reservas(
  IDReserva integer,
  DNI char(9),
  HoraInicio date,
  HORAFIN date,--triger aqui
  IDPISTA integer,
  idmaterial integer,
  primary key(IDRESERVA),
  foreign key(IDPISTA) references PISTA,
  foreign key(IDMATERIAL) references MATERIAL,
  foreign key(DNI) references Persona
  );
  
  create table CUOTAS(
                  idcuota integer,
                  dni char(9),
                  PAGOCUOTA char(2) not null check (PAGOCUOTA in ('si','no')),
                  FECHAPAGO date,
                  primary key(IDCUOTA),
                  foreign key (DNI) references PERSONA
);