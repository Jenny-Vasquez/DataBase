CREATE DATABASE PUBS;

CREATE TABLE LOCALIDAD (
	COD_LOCALIDAD NUMERIC NOT NULL,
	NOMBRE VARCHAR (20) NOT NULL,
	CONSTRAINT COD_LOCALIDAD PRIMARY KEY (COD_LOCALIDAD)
);

CREATE TABLE PUB(
	COD_PUB VARCHAR (5) NOT NULL,
	NOMBRE VARCHAR (20)NOT NULL,
	lICENCIA_FISCAL VARCHAR (25)NOT NULL,
	DOMICILIO VARCHAR (25),
	FECHA_APERTURA DATE NOT NULL,
	HORARIO VARCHAR (20)NOT NULL,
	COD_LOCALIDAD NUMERIC,
	CONSTRAINT COD_PUB PRIMARY KEY (COD_PUB),
	CONSTRAINT FK_PUB_LOCALIDAD FOREIGN KEY (COD_LOCALIDAD) REFERENCES  LOCALIDAD (COD_LOCALIDAD),
	CONSTRAINT PUB_HORARIO_CK CHECK(HORARIO IN('HOR1', 'HOR2', 'HOR3')) --Los valores del campo horario s�lo pueden ser HOR1, HOR2 y HOR3
);
CREATE TABLE TITULAR(
	DNI_TITULAR VARCHAR (9)NOT NULL,
	NOMBRE VARCHAR (20)NOT NULL,
	DOMICILIO VARCHAR (25)NOT NULL,
	COD_PUB VARCHAR (5)NOT NULL,
	CONSTRAINT DNI_TITULAR PRIMARY KEY (DNI_TITULAR),
	CONSTRAINT FK_TITULAR_PUB FOREIGN KEY (COD_PUB) REFERENCES PUB (COD_PUB)
);
CREATE TABLE EMPLEADO(
	DNI_EMPLEADO VARCHAR (9),
	NOMBRE VARCHAR (20),
	DOMICILIO VARCHAR (25),
	CONSTRAINT DNI_EMPLEADO PRIMARY KEY (DNI_EMPLEADO)
	
);
CREATE TABLE EXISTENCIAS (
	COD_ARTICULO VARCHAR (5),
	NOMBRE VARCHAR (20),
	CANTIDAD NUMERIC,
	PRECIO NUMERIC,
	COD_PUB VARCHAR (5),
	CONSTRAINT COD_ARTICULO PRIMARY KEY (COD_ARTICULO),
	CONSTRAINT FK_EXISTENCIAS_PUB FOREIGN KEY (COD_PUB) REFERENCES PUB (COD_PUB),
	CONSTRAINT PRECIO_CK CHECK (PRECIO!=0) --No es posible dar de alta EXISTENCIAS a precio 0.
);

CREATE TABLE PUB_EMPLEADO(
	COD_PUB VARCHAR (5),
	DNI_EMPLEADO VARCHAR (9),
	FUNCION VARCHAR (30)
	CONSTRAINT PK_PE PRIMARY KEY (COD_PUB,DNI_EMPLEADO,FUNCION),
	CONSTRAINT FK_PE_PUB FOREIGN KEY (COD_PUB) REFERENCES PUB (COD_PUB),
	CONSTRAINT FK_PE_EMPLEADO FOREIGN KEY (DNI_EMPLEADO) REFERENCES EMPLEADO (DNI_EMPLEADO),
	CONSTRAINT FUNCION_CK CHECK (FUNCION in('CAMARERO', 'SEGURIDAD', 'LIMPIEZA'))--El campo funci�n de la tabla PUB_EMPLEADO s�lo puede tener los valores CAMARERO, SEGURIDAD, LIMPIEZA.
);
