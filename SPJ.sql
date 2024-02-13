CREATE DATABASE SPJ;
CREATE TABLE PROVEEDORES(
IdS VARCHAR (3),	
nombre VARCHAR (20),
status VARCHAR (25),
ciudad VARCHAR (25),
CONSTRAINT IdS PRIMARY KEY (IdS)
);

CREATE TABLE PIEZAS(
IdP VARCHAR (3),
nombre VARCHAR (25),
color VARCHAR (15),
CONSTRAINT IdP PRIMARY KEY (IdP)
);

CREATE TABLE PROYECTOS(
IdJ VARCHAR (3),
nombre VARCHAR (25),
ciudad VARCHAR (25)
CONSTRAINT IDJ PRIMARY KEY (IdJ)
);

CREATE TABLE SUMINISTROS(
IdS VARCHAR (3) not null,	
IdP VARCHAR (3) not null,
IdJ VARCHAR (3)	not null,
cantidad numeric (4,0),
CONSTRAINT pk_spj PRIMARY KEY (IdS, IdP, IdJ),
CONSTRAINT fk_s  FOREIGN KEY (IdS) REFERENCES PROVEEDORES (IdS),
CONSTRAINT fk_p  FOREIGN KEY (IdP) REFERENCES PIEZAS (IdP),
CONSTRAINT fk_j  FOREIGN KEY (IdJ) REFERENCES PROYECTOS (IdJ)
);

/*
Modificar la columna
*/
------------------------------------------------------1
ALTER TABLE SUMINISTROS
	DROP CONSTRAINT fk_s,pk_spj;
------------------------------------------------------2
ALTER TABLE PROVEEDORES
	DROP CONSTRAINT IdS;
------------------------------------------------------3
ALTER TABLE PROVEEDORES
	ALTER COLUMN IdS VARCHAR(4) not null
------------------------------------------------------4
ALTER TABLE SUMINISTROS
	ALTER COLUMN IdS VARCHAR(4) not null
------------------------------------------------------5

ALTER TABLE SUMINISTROS
	ADD FECHA DATE

ALTER TABLE SUMINISTROS
	ADD HORA TIME

ALTER TABLE SUMINISTROS
	ADD CONSTRAINT CH_CANTIDAD CHECK(cantidad < 5000)

CREATE INDEX INDICE_PROV
	ON PROVEEDORES (NOMBRE);

CREATE INDEX INDICE_PIEZ
	ON PIEZAS (NOMBRE);

CREATE INDEX INDICE_PROY
	ON PROYECTOS (NOMBRE);

------------------------------------PORFOLIO TEMA 5--------------------------------------
-------------------------------------ACTIVIDAD 1-----------------------------------------
------------------------------PROVEEDORES
INSERT INTO PROVEEDORES(IdS, NOMBRE, STATUS,CIUDAD) VALUES ('S1','José Fernandez','2','Granada');
INSERT INTO PROVEEDORES (IdS, NOMBRE, STATUS,CIUDAD) VALUES ('S2','Juan Martinez','3','Londres');
INSERT INTO PROVEEDORES (IdS, NOMBRE, STATUS,CIUDAD) VALUES ('S3','José López','3','Sevilla');
INSERT INTO PROVEEDORES (IdS, NOMBRE, STATUS,CIUDAD) VALUES ('S4','Luis Gómez','4','Madrid');
INSERT INTO PROVEEDORES (IdS, NOMBRE, STATUS,CIUDAD) VALUES ('S5','Carlos Ruiz ','3','Paris');
INSERT INTO PROVEEDORES (IdS, NOMBRE, STATUS,CIUDAD) VALUES ('S6','Javier Casado','5','Granada');

SELECT * FROM PROVEEDORES;

----------------------------------PIEZAS

ALTER TABLE PIEZAS
ADD PESO FLOAT
ALTER TABLE PIEZAS
ADD CIUDAD  VARCHAR(25)

INSERT INTO PIEZAS(IdP, NOMBRE, color,PESO, CIUDAD) VALUES ('P1','Papel','Blanco','0.03','Madrid');
INSERT INTO PIEZAS(IdP, NOMBRE, color,PESO, CIUDAD) VALUES ('P2','Impresora','Gris','4.55','Londres');
INSERT INTO PIEZAS(IdP, NOMBRE, color,PESO, CIUDAD) VALUES ('P3','Teclado','Blanco','1.5','Lisboa');
INSERT INTO PIEZAS(IdP, NOMBRE, color,PESO, CIUDAD) VALUES ('P4','Carpeta','Rojo','0.54','Londres');
INSERT INTO PIEZAS(IdP, NOMBRE, color,PESO, CIUDAD) VALUES ('P5','Estuche','Negro','0.89','Sevilla');
INSERT INTO PIEZAS(IdP, NOMBRE, color,PESO, CIUDAD) VALUES ('P6','Lapiz','Amarillo','0.06','Granada');

SELECT * FROM PIEZAS;

----------------------------PROYECTOS

INSERT INTO PROYECTOS(IdJ,nombre,ciudad) VALUES ('J1','Pino','Granada');
INSERT INTO PROYECTOS(IdJ,nombre,ciudad) VALUES ('J2','Abeto','Madrid');
INSERT INTO PROYECTOS(IdJ,nombre,ciudad) VALUES ('J3','Sauce','Sevilla');
INSERT INTO PROYECTOS(IdJ,nombre,ciudad) VALUES ('J4','Higuera','Londres');
INSERT INTO PROYECTOS(IdJ,nombre,ciudad) VALUES ('J5','Peral','Granada');
INSERT INTO PROYECTOS(IdJ,nombre,ciudad) VALUES ('J6','Encina','Londres');

SELECT * FROM PROYECTOS;

-----------------------------------------SUMINISTROS

INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S1','P2','J1','20');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S2','P4','J3','155');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S3','P6','J5','1010');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S4','P5','J6','45');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S5','P3','J2','23');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S6','P1','J4','2000');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S2','P1','J1','1050');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S5','P2','J2','11');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S3','P6','J6','500');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S1','P5','J4','14');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S3','P3','J3','22');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S6','P4','J2','248');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S4','P2','J1','9');
INSERT INTO SUMINISTROS (IdS,IdP,IdJ,cantidad) VALUES ('S3','P1','J2','500');

SELECT IdS,IdP,IdJ,Cantidad FROM Suministros;

--5. Borrar todos los suministros asociados a S3

SELECT * FROM SUMINISTROS
DELETE SUMINISTROS WHERE IdS='S3'
SELECT * FROM SUMINISTROS

--6 . Modificar la ciudad de S1 a Madrid 
UPDATE PROVEEDORES
SET ciudad = 'Madrid'
WHERE IdS='S1'

--7 . Modifica todos los suministros de J2 para que la cantidad de piezas suministradas sea 1300 .
UPDATE SUMINISTROS
SET cantidad  = '1300'
WHERE IdJ='J2'
--8 . Modifica todos los proveedores que sean de Londres para que ahora estén en Cádiz . 
UPDATE PROVEEDORES
SET ciudad = 'Cadiz'
WHERE ciudad= 'Londres'
--9 . Borra todos los datos de la tabla suministros cuya cantidad de piezas suministradas sea 1300 . 
SELECT * FROM SUMINISTROS
DELETE SUMINISTROS WHERE cantidad='1300'
SELECT * FROM SUMINISTROS
--10 . Modifica el color Negro para que aparezca Azul . 
UPDATE PIEZAS
SET color = 'Azul'
WHERE color= 'Negro'
--11 . Cambia los suministros de P4 para que la cantidad sea 200 . 
UPDATE SUMINISTROS
SET cantidad = '200'
WHERE IdP= 'P4'
--12 . Cambia a Lugo todos los proveedores que estén en Sevilla . 
UPDATE PROVEEDORES
SET ciudad = 'Lugo'
WHERE ciudad= 'Sevilla'
--Realizamos los siguientes pasos para ver cómo funcionan las transacciones:
--1. Abrir dos Management Studio, uno con el usuario sa y otro con prueba, en ambos situaros en la BD SPJ 
--2. Con el usuario prueba realizamos una selección de los suministros de S1: select * from suministros WHERE Ids='S1’
 select * from suministros WHERE Ids='S1'
--3. Con el usuario sa ejecutamos por el siguiente código:
Begin tran Update suministros SET Cantidad=Cantidad*2 WHERE Ids='S1'; 
select * from suministros WHERE Ids='S1'; 
--4. Volvemos al usuario prueba y ejecutamos de nuevo la consulta, ¿Qué pasa? 


