CREATE DATABASE MATERIAL_INFORMATICO

CREATE TABLE PRODUCTO(
	CodP NUMERIC IDENTITY NOT NULL,
	Descripcion VARCHAR (50),
	Precio MONEY NOT NULL,
	Stock INT,
	Tipo VARCHAR (10),
	CONSTRAINT CodP PRIMARY KEY (CodP)
);
CREATE TABLE TIENE (
	CodEquipo INT NOT NULL,
	CodComponente INT NOT NULL,
	Cantidad NUMERIC,
	CONSTRAINT PK_TIENE PRIMARY KEY (CodEquipo,CodComponente)
	
);
CREATE TABLE CLIENTE(
	NIF VARCHAR (9) UNIQUE NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR (30)  NOT NULL,
	Domicilio VARCHAR (30), 
	Ciudad VARCHAR (20), 
	Provincia VARCHAR (20),
	Telefono VARCHAR (9),
	CONSTRAINT NIF PRIMARY KEY (NIF),
);
CREATE TABLE SECCION(
	IdSeccion NUMERIC UNIQUE NOT NULL,
	Nombre VARCHAR (20),
	CONSTRAINT IdSeccion PRIMARY KEY (IdSeccion)
);
CREATE TABLE EMPLEADO(
	DNI VARCHAR(9) UNIQUE NOT NULL,
	Nombre VARCHAR(20) NOT NULL,
	Apellidos VARCHAR (30)  NOT NULL,
	IdSeccion NUMERIC UNIQUE NOT NULL,
	CONSTRAINT DNI PRIMARY KEY (DNI),

);
CREATE TABLE COMPRA(
	CodP NUMERIC IDENTITY NOT NULL,
	NIF VARCHAR (9) UNIQUE NOT NULL,
	Fecha DATE,
	Cantidad NUMERIC,
	Empleado VARCHAR(9) UNIQUE NOT NULL,
	CONSTRAINT PK_CodP_NIF PRIMARY KEY (CodP,NIF),
	CONSTRAINT FK_cliente_compra FOREIGN KEY (NIF) REFERENCES CLIENTE (NIF)
);

--Después de crear las tablas ten en cuenta:
--• El tipo de PRODUCTO sólo admite los valores: C (componente), E (Equipo)
ALTER TABLE PRODUCTO 
	ADD CONSTRAINT Tipo CHECK (Tipo in('C (Componente)','E (Equipo'));
--• En la tabla TIENE el CodEquipo debe ser de tipo E y el CodComponente de tipo C
--ALTER TABLE TIENE

--• En la tabla SECCION código de sección no podrá ser superior a 20
ALTER TABLE SECCION
	ADD CONSTRAINT IdSeccion CHECK (IdSeccion <=20);
--• Ninguna cantidad podrá ser inferior a 0.
ALTER TABLE COMPRA
	ADD CONSTRAINT Cantidad CHECK (Cantidad >=0);