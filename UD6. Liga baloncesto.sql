CREATE DATABASE LIGA_BALONCESTO;
USE LIGA_BALONCESTO;

CREATE TABLE EQUIPO(
	id_equipo INT PRIMARY KEY,
	nombre_equipo VARCHAR(50),
	ciudad VARCHAR(30),
	web_oficial VARCHAR(100),
	puntos INT
);

CREATE TABLE JUGADOR(
	id_jugador INT PRIMARY KEY,
	nombre VARCHAR(30),
	apellido VARCHAR(50),
	puesto VARCHAR(30),
	id_capitan INT,
	fecha_alta DATE,
	salario NUMERIC(10,2),
	num_equipo INT, 
	altura NUMERIC(4,2)
	CONSTRAINT FKJugadorEquipo FOREIGN KEY (num_equipo) REFERENCES EQUIPO(id_equipo)
);

CREATE TABLE PARTIDO(
	elocal INT,
	evisitante INT,
	resultado VARCHAR(10),
	fecha DATE,
	arbitro INT,
	CONSTRAINT PKPartido PRIMARY KEY (elocal, evisitante),
	CONSTRAINT FKPartidoEquipo1 FOREIGN KEY (elocal) REFERENCES EQUIPO(id_equipo),
	CONSTRAINT FKPartidoEquipo2 FOREIGN KEY (evisitante) REFERENCES EQUIPO(id_equipo),
);

--EQUIPOS
INSERT INTO EQUIPO 
	VALUES (1, 'Regal Barcelona', 'Barcelona', 'http://www.fcbarcelona.com/wev/index_idiomes.html',10);
INSERT INTO EQUIPO 
	VALUES (2, 'Real Madrid', 'Madrid', 'http://www.realmadrid.com/cs/Satellite/es/1193040472450/SubhomeEquipo/Baloncesto/htm',9);
INSERT INTO EQUIPO 
	VALUES (3, 'P.E. Valencia', 'Valencia', 'http://www.valenciabasket.com',11);
INSERT INTO EQUIPO 
	VALUES (4, 'Caja Laboral', 'Victoria', 'http://www.baskonia.com/prehomes/prehomes.asp?id_prehome=69',22);
INSERT INTO EQUIPO 
	VALUES (5, 'Gran Canaria', 'Las Palmas', 'http://www.acb.com/club.php?id=CLA',14);
INSERT INTO EQUIPO 
	VALUES (6, 'CAI Zaragoza', 'Zaragoza', 'http://basketzaragoza.net',23);

--JUGADORES
INSERT INTO JUGADOR 
	VALUES (1, 'Juan Carlos', 'Navarro', 'Escolta',1,'2010/01/01',130000,1,null);
INSERT INTO JUGADOR 
	VALUES (2, 'Felipe', 'Reyes', 'Pivot',2,'2009/09/20',120000,2,2.04);
INSERT INTO JUGADOR 
	VALUES (3, 'Víctor', 'Claver', 'Alero',3,'2009/03/08',90000,3,2.08);
INSERT INTO JUGADOR 
	VALUES (4, 'Rafa', 'Martínez', 'Escolta',4,'2010/11/11',51000,3,1.91);
INSERT INTO JUGADOR 
	VALUES (5, 'Fernando', 'San Emeterio', 'Alero',6,'2008/09/22',60000,4,1.99);
INSERT INTO JUGADOR 
	VALUES (6, 'Mirza', 'Teletovic', 'Pivot',6,'2010/05/13',70000,4,2.06);
INSERT INTO JUGADOR 
	VALUES (7, 'Sergio', 'Lull', 'Escolta',2,'2011/10/29',100000,2,1.90);
INSERT INTO JUGADOR 
	VALUES (8, 'Víctor', 'Sada', 'Base',1,'2012/01/01',80000,1,1.92);
INSERT INTO JUGADOR 
	VALUES (9, 'Carlos', 'Suárez', 'Alero',2,'2011/02/19',60000,2,2.03);
INSERT INTO JUGADOR 
	VALUES (10, 'Xavi', 'Rey', 'Pivot',14,'2008/10/12',95000,5,2.09);
INSERT INTO JUGADOR 
	VALUES (11, 'Carlos', 'Cabezas', 'Base',13,'2012/01/21',105000,6,1.86);
INSERT INTO JUGADOR 
	VALUES (12, 'Pablo', 'Aguilar', 'Alero',13,'2011/06/14',47000,6,2.08);
INSERT INTO JUGADOR 
	VALUES (13, 'Rafa', 'Hettsheimeir', 'Pivot',13,'2008/04/15',53000,6,2.08);
INSERT INTO JUGADOR 
	VALUES (14, 'Sitapha', 'Savané', 'Pivot',14,'2011/07/27',6000,5,2.01);

--PARTIDOS
INSERT INTO PARTIDO 
	VALUES (1, 2, '100-100', '2011/10/10',4);
INSERT INTO PARTIDO 
	VALUES (2, 3, '90-91', '2011/11/17',5);
INSERT INTO PARTIDO 
	VALUES (3, 4, '88-77', '2011/11/23',6);
INSERT INTO PARTIDO 
	VALUES (1, 6, '66-78', '2011/11/30',6);
INSERT INTO PARTIDO 
	VALUES (2, 4, '90-90', '2012/01/12',7);
INSERT INTO PARTIDO 
	VALUES (4, 5, '79-83', '2012/01/19',3);
INSERT INTO PARTIDO 
	VALUES (3, 6, '91-88', '2012/02/22',3);
INSERT INTO PARTIDO 
	VALUES (5, 4, '90-66', '2012/04/27',2);
INSERT INTO PARTIDO 
	VALUES (6, 5, '110-70', '2012/05/30',1);