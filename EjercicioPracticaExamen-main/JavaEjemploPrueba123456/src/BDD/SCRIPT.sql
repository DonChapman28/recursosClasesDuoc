CREATE TABLE Cliente
(
	idPersona		INT 			PRIMARY KEY AUTO_INCREMENT,
	rut			INT			NOT NULL,
	dv			VARCHAR(1)		NOT NULL,
	nombre			VARCHAR(50)		NOT NULL,
	direccion		VARCHAR(50)		NOT NULL,
	comuna			VARCHAR(50)		NOT NULL,
	esEmpresa		TINYINT			NOT NULL,
	UNIQUE(rut)
);


CREATE TABLE Mecanico
(
	idMecanico		INT 		PRIMARY KEY AUTO_INCREMENT,
	rut			INT		NOT NULL,
	dv			VARCHAR(1)	NOT NULL,
	nombre			VARCHAR(50)	NOT NULL,
	titulo			VARCHAR(50)	NOT NULL,
	direccion		VARCHAR(50)	NOT NULL,
	comuna			VARCHAR(50)	NOT NULL,
	UNIQUE(rut)
);


CREATE TABLE Vehiculo
(
	idVehiculo		INT 		PRIMARY KEY AUTO_INCREMENT,
	patente			VARCHAR(6)	NOT NULL,
	marca			VARCHAR(50)	NOT NULL,
	modelo			VARCHAR(50)	NOT NULL,
	color			VARCHAR(50)	NOT NULL,
	rutCliente		INT		NOT NULL,
	UNIQUE(patente)
);

CREATE TABLE Reparacion
(
	idReparacion            INT 		PRIMARY KEY AUTO_INCREMENT,
	patente			VARCHAR(6)	NOT NULL,
	rutCliente		INT		NOT NULL,
	rutMecanico		INT		NOT NULL,
	reparacion		VARCHAR(900)	NOT NULL,
	observacion		VARCHAR(900)	NOT NULL,
	valor			INT		NOT NULL
);
