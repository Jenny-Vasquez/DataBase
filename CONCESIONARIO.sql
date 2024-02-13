CREATE DATABASE CONCESIONARIO;

CREATE TABLE MARCA (
	IdMarca INT NOT NULL, 
	Nombre VARCHAR (50) NOT NULL,
	CONSTRAINT IdMarca Primary Key (IdMarca),
);
CREATE TABLE MODELO (
	IdModelo INT NOT NULL, 
	Nombre VARCHAR (50) NOT NULL, 
	IdMarca INT NOT NULL,
	CONSTRAINT IdModelo PRIMARY KEY (IdModelo),
	CONSTRAINT FK_Modelo_Marca FOREIGN KEY (IdMarca) References MARCA (IdMarca)
);
CREATE TABLE VERSIONES (
	IdVersion INT NOT NULL, 
	Nombre VARCHAR (50) NOT NULL,
	Potencia VARCHAR (10) NOT NULL,
	TipoCombustible VARCHAR (10) NOT NULL, 
	Precio CHAR (5) NOT NULL, 
	IdModelo INT NOT NULL,
	CONSTRAINT IdVersion PRIMARY KEY (IdVersion),
	CONSTRAINT FK_VERSIONES_MODELO FOREIGN KEY (IdModelo) References modelo (IdModelo)
	);
CREATE TABLE EXTRA (
	IdExtra INT NOT NULL, 
	Nombre VARCHAR (50) NOT NULL,
	Descripción  VARCHAR (80) NOT NULL,
	IncrementoPrecio CHAR (5)NOT NULL,
	CONSTRAINT IdExtra PRIMARY KEY (IdExtra),
	);

CREATE TABLE POSEE (
	IdVersion INT NOT NULL, 
	IdExtra INT NOT NULL, 
	CONSTRAINT PK_POSEE pRIMARY KEY (IdVersion, IdExtra),
	CONSTRAINT FK_POSEE_VERSION FOREIGN KEY (IdVersion) REFERENCES VERSIONES (IdVersion),
	CONSTRAINT FK_POSEE_EXTRA FOREIGN KEY (IdExtra) REFERENCES EXTRA(IdExtra),
);
CREATE TABLE CLIENTE (
	NIF VARCHAR (9) NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	Apellidos VARCHAR (20) NOT NULL, 
	Direccion VARCHAR (50) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	CONSTRAINT PK_NIF_CLIENTE PRIMARY KEY (NIF) 
);
CREATE TABLE VENDEDOR(
	NIF VARCHAR (9) NOT NULL,
	Nombre VARCHAR (20) NOT NULL,
	Apellidos VARCHAR (20) NOT NULL, 
	Direccion VARCHAR (50) NOT NULL,
	Telefono VARCHAR(15) NOT NULL,
	CONSTRAINT PK_NIF_VENDEDOR PRIMARY KEY (NIF) 
	);
CREATE TABLE VENDE (
	CodCliente VARCHAR (9) NOT NULL,
	CodVendedor VARCHAR (9) NOT NULL, 
	IdVersion  INT NOT NULL, 
	IdExtra INT NOT NULL, 
	Fecha DATE NOT NULL, 
	Matricula VARCHAR (8) NOT NULL,
	VehiculoCedido VARCHAR (20) NOT NULL,
	CONSTRAINT PK_VENDE PRIMARY KEY (CodCliente, CodVendedor, IdVersion, IdExtra),
	CONSTRAINT FK_VENDE_CLIENTE FOREIGN KEY (CodCliente) REFERENCES CLIENTE (NIF),
	CONSTRAINT FK_VENDE_VENDEDOR FOREIGN KEY (CodVendedor) REFERENCES VENDEDOR (NIF),
	CONSTRAINT FK_VENDE_VERSION FOREIGN KEY (IdVersion) REFERENCES VERSIONES (IdVersion),
	CONSTRAINT FK_VENDE_EXTRA FOREIGN KEY (IdExtra) REFERENCES EXTRA (IdExtra),
	);
-------------------------------------------------------------------------------------------------
 CREATE TABLE COCHE_USADO (
	Matricula VARCHAR (8) NOT NULL,
	Marca VARCHAR (9) NOT NULL,
	Modelo VARCHAR (9)NOT NULL,
	CONSTRAINT	Matricula PRIMARY KEY (Matricula)
	);
--------------------------------------------------------------------------------------------------
--Después de crear las tablas ten en cuenta:
--• En la tabla VERSIONES el tipo de combustible será: Diésel o Gasolina
ALTER TABLE VERSIONES
 ADD CONSTRAINT TipoCombustible CHECK(TipoCombustible IN ('Diésel', 'Gasolina'));
--• En la tabla EXTRA el incremento de precio por defecto será 0
--• En la tabla VENDE el vehículo cedido no es obligatorio y por defecto será la cadena vacía.