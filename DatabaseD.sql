CREATE DATABASE DracolP;
USE DracolP;

CREATE TABLE Rol (
IdRol int unsigned auto_increment primary key,
NombreRol varchar(45) not null,
Descripcion varchar(255) not null );

CREATE TABLE TipoIdentificacion(
Id_Tipo int unsigned auto_increment primary key,
TipoIdentificacion varchar(45) not null );

CREATE TABLE EstadoCivil(
IdEstadoCivil int unsigned auto_increment primary key,
EstadoCivil varchar(45) not null 
);

CREATE TABLE LugarNacimiento(
IdLugar int unsigned auto_increment primary key,
LugarNacimientoU varchar(45) not null
);

CREATE TABLE Usuario(
IdUsuario int unsigned auto_increment primary key,
NombresUsuario varchar(45) not null,
ApellidosUsuario varchar(45) not null,
NumeroDocumento int unsigned unique not null,
NumeCelular int unsigned unique not null,
NumTelefono int unsigned not null,
FechaNacimientoU date not null,
CorreoUsuario varchar(20) not null,
GeneroUsuario enum('Femenino','Masculino') not null,
FotoUsuario longblob,
DireccionUsuario varchar(30) not null,
EdadU tinyint unsigned not null,
Contraseña varchar(12) not null, 
Disponibilidad enum('Ocupado','No disponible','Disponible') default 'Disponible',
EstadoUsuario enum('Activo','Inhabilitado') default 'Activo',
IdRol int unsigned not null,
Id_Tipo int unsigned not null,
IdEstadoCivil int unsigned not null,
IdLugar int unsigned not null,
foreign key (IdRol) REFERENCES Rol(IdRol),
foreign key (Id_Tipo) REFERENCES TipoIdentificacion(Id_Tipo),
foreign key (IdEstadoCivil) REFERENCES EstadoCivil(IdEstadoCivil),
foreign key (IdLugar) REFERENCES LugarNacimiento(IdLugar)
);

CREATE TABLE Afiliacion(
idAfiliacion int unsigned auto_increment primary key,
ArchivoPlantilla longblob not null,
fechaSubida datetime not null,
fechaExpiracion datetime not null,
EstadoAfiliacion enum ('Vigente', 'Expirada')
);

CREATE TABLE TipoCliente(
IdTipoC int unsigned auto_increment primary key,
nombreTipoC varchar(45) not null,
DescripcionCl varchar(255) not null
);

CREATE TABLE Cliente(
IdCliente int unsigned auto_increment primary key,
NombreCliente varchar (70) not null,
UserCliente varchar (10) not null,
NumIdentificacion int unsigned unique not null,
ContraseñaC varchar(12) not null,
CorreoCliente varchar(20) not null,
NumCelular int unsigned unique not null,
NumTelefono int unsigned not null,
TipoCliente int unsigned not null,
IdTipoDocum int unsigned not null,
foreign key (IdTipoDocum) REFERENCES TipoIdentificacion(Id_Tipo),
foreign key(TipoCliente) references TipoCliente(IdTipoC)
);

CREATE TABLE Obra(
IdObra int unsigned auto_increment primary key,
NombreObra varchar(50) not null,
MedidaArea double,
MedidaPerimetro double,
CondicionDesnivel double,
TipoMaterialSuelo enum ('Cemento', 'Asfalto'),
DetalleCondicionPiso varchar(300),
EstadoVerificacion boolean,
DireccionObra varchar(40) not null,
DatosAdicionales varchar(255),
EstadoObra enum('Activa','Terminada','Sin Iniciar','Cancelada'),
IdCliente int unsigned not null,
foreign key(IdCliente) references Cliente(IdCliente)
 );

CREATE TABLE FaseTarea(
idFase int unsigned auto_increment primary key,
NombreFase varchar(45) not null,
DescripcionFase varchar(255) not null
);

CREATE TABLE EstadoActividad(
idEstadoA int unsigned auto_increment primary key,
NombreEstado varchar(45) not null
);

CREATE TABLE Actividad (
idActividad int unsigned auto_increment primary key,
NombreActividad varchar(60) not null,
DescripcionActividad varchar(255) not null,
FechaInicioA datetime not null,
FechaFinA datetime not null,
CantidadDias tinyint,
idEstadoA int unsigned not null,
idFase int unsigned not null,
foreign key(idFase) references FaseTarea(idFase),
foreign key(idEstadoA) references EstadoActividad(idEstadoA)
);

CREATE TABLE TipoNovedad(
idTipoN int unsigned auto_increment primary key,
NombreTipoN varchar(30) not null,
DescripcionTipo varchar(255) not null);

CREATE TABLE Novedad(
idNovedad int unsigned auto_increment primary key,
EstadoNovedad enum('Sin atender','Atendida') not null,
FechaNovedad date not null,
DescripcionN varchar(255) not null,
idTipoN int unsigned not null,
foreign key(idTipoN) references TipoNovedad(idTipoN));


