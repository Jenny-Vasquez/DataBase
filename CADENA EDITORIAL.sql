CREATE DATABASE EDITORIAL;

CREATE TABLE SUCURSAL(
	CodSucursal NUMERIC NOT NULL,
	domicilio VARCHAR (50) NOT NULL,
	telefono VARCHAR (15) NOT NULL,
	
	CONSTRAINT CodSucursal PRIMARY KEY (CodSucursal)
);

CREATE TABLE EMPLEADO (
	NIF VARCHAR (9) NOT NULL,
	Nombre VARCHAR (20) NOT NULL, 
	Apellidos VARCHAR (20) NOT NULL,
	Telefono VARCHAR (15) NOT NULL,
	CodSucursal NUMERIC NOT NULL,

	CONSTRAINT NIF PRIMARY KEY (NIF),
	CONSTRAINT FK_SUCURSAL_EMPLEADO FOREIGN KEY (CodSucursal) REFERENCES SUCURSAL (CodSucursal)
);

CREATE TABLE REVISTA (
	CodRevista NUMERIC NOT NULL,
	titulo VARCHAR (50) NOT NULL,
	NumRegistro NUMERIC NOT NULL, 
	Periodicidad VARCHAR (20) NOT NULL, 
	Tipo VARCHAR (20) NOT NULL, 

	CONSTRAINT CodRevista PRIMARY KEY (CodRevista),
);

CREATE TABLE PUBLICA(
	CodSucursal NUMERIC NOT NULL,
	CodRevista NUMERIC NOT NULL,

	CONSTRAINT FK_SUCURSAL_PUBLICA FOREIGN KEY (CodSucursal) REFERENCES SUCURSAL (CodSucursal),
	CONSTRAINT FK_REVISTA_PUBLICA FOREIGN KEY (CodRevista) REFERENCES REVISTA(CodRevista)
);

CREATE TABLE SECCIONES_FIJAS (
	CodSeccion NUMERIC NOT NULL,
	Extension NUMERIC NOT NULL,
	Titulo VARCHAR (50) NOT NULL,
	CodRevista NUMERIC NOT NULL,

	CONSTRAINT CodSeccion PRIMARY KEY (CodSeccion),
	CONSTRAINT FK_REVISTA_SFIJA FOREIGN KEY (CodRevista) REFERENCES REVISTA (CodRevista),

);
CREATE TABLE EJEMPLAR (
	CodEjemplar NUMERIC NOT NULL , 
	Fecha DATE NOT NULL, 
	NPaginas  VARCHAR (10) NOT NULL, 
	EjemplaresVendidos NUMERIC NOT NULL, 
	CodRevista NUMERIC NOT NULL

	CONSTRAINT CodEjemplar PRIMARY KEY (CodEjemplar)
	CONSTRAINT FK_REVISTA_EJEMPLAR FOREIGN KEY (CodRevista) REFERENCES REVISTA (CodRevista),

);

CREATE TABLE PERIODISTA (
	CodPeriodista NUMERIC NOT NULL, 
	NIF VARCHAR (9) NOT NULL, 
	Nombre VARCHAR (25) NOT NULL, 
	Apellidos VARCHAR (25) NOT NULL,

	CONSTRAINT CodPeriodista PRIMARY KEY (CodPeriodista),
);

CREATE TABLE ARTICULO (
	CodArticulo NUMERIC NOT NULL,
	Nombre VARCHAR (50) NOT NULL,
	CodEjemplar NUMERIC NOT NULL,
	CodPeriodista NUMERIC NOT NULL, 
	
	CONSTRAINT CodArticulo PRIMARY KEY (CodArticulo),
	CONSTRAINT FK_EJEMPLAR_ARTICULO FOREIGN KEY (CodEjemplar) REFERENCES EJEMPLAR (CodEjemplar),
	CONSTRAINT FK_PERIODISTA_ARTICULO FOREIGN KEY (CodPeriodista) REFERENCES PERIODISTA (CodPeriodista),
);
-----------------------------------------------------------------------------------------------------------------
                                     --Después de crear las tablas:
-----------------------------------------------------------------------------------------------------------------
--• Añade el campo CIF a la SUCURSAL que será único y obligatorio
ALTER TABLE SUCURSAL 
	ADD CIF VARCHAR (9) NOT NULL;
ALTER TABLE SUCURSAL
	ADD CONSTRAINT CIF_UNIQ UNIQUE (CIF);

--• Borra de SECCIONES_FIJAS la columna CodRevista
ALTER TABLE SECCIONES_FIJAS
	DROP CONSTRAINT  FK_REVISTA_SFIJA;
ALTER TABLE SECCIONES_FIJAS
	DROP COLUMN CodRevista;

--• Crea una nueva tabla que se llame GUARDA y que tenga el código de revista y el código de sección fija, ambos forman la clave primaria.
CREATE TABLE GUARDA (
	CodSeccion NUMERIC NOT NULL,
	CodRevista NUMERIC NOT NULL,

	CONSTRAINT PK_GUARDA PRIMARY KEY (CodSeccion,CodRevista),
	CONSTRAINT FK_GUARDA_SECCION FOREIGN KEY (CodSeccion) REFERENCES SECCIONES_FIJAS (CodSeccion),
	CONSTRAINT FK_GUARDA_REVISTA FOREIGN KEY (CodRevista) REFERENCES REVISTA (CodRevista),
);

--• En la tabla de Ejemplar convierte el CodRevista y parte de la clave primaria y revisa las referencias a esta tabla a través de claves externas.
-- Borrar la PK DE EJEMPLAR
-- CREAR LA NUEVA PK DE EJEMPLAR CON REVISTA
-- BORRAR LA FK DE EJMEPLAR EN ARTICULO 
-- AÑADIR LA COLUMNA CODIGO REVISTA EN ARTICULO 
-- CREAR LA FK EN ARTICULO REFERENCIANDO A EJEMPLAR CON LOS DOS CAMPOS


ALTER TABLE EJEMPLAR
	ADD CONSTRAINT PK_EJEMPLAR PRIMARY KEY (CodEjemplar)
--• El código de ejemplar no podrá ser mayor de 100
ALTER TABLE EJEMPLAR
	ADD CONSTRAINT CodEjemplar CHECK (CodEjemplar<=100); 
	
	-- SE ESTA AÑADIENDO UNA RESTRICCIÓN POR ESO SE USA EL ADD CONSTRAINT Y NO EL ALTER COLUMN

--• La periodicidad tendrá los valores: Semanal, Quincenal, Mensual

ALTER TABLE REVISTA
	ADD CONSTRAINT periodicidad CHECK (periodicidad IN ('Semanal', 'Quincenal', 'Mensual'));