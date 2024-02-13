CREATE DATABASE Asignatura;
USE Asignatura;

CREATE TABLE Alumno (
  NumMatricula INT PRIMARY KEY,
  Nombre VARCHAR(30) NOT NULL,
  FechaNacimiento DATE NOT NULL,
  Telefono VARCHAR (15) NOT NULL,
);
CREATE TABLE Profesor (
  IdProfesor INT PRIMARY KEY,
  NIF_P VARCHAR (9) UNIQUE,
  Nombre VARCHAR(30) NOT NULL,
  Especialidad VARCHAR (30) NOT NULL,
  Telefono VARCHAR (15) NOT NULL,
);
CREATE TABLE Asignatura(
  CodAsignatura VARCHAR (6) PRIMARY KEY,
  Nombre VARCHAR(30) NOT NULL,
  IdProfesor INT NOT NULL,
  CONSTRAINT FKAsignatura_profesor FOREIGN KEY (IdProfesor) REFERENCES Profesor(IdProfesor),
);

CREATE TABLE Recibe (
  NumMatricula INT not null,
  CodAsignatura VARCHAR (6) not null,
  CursoEscolar Varchar (15),
  CONSTRAINT PKRecibe PRIMARY KEY (NumMatricula,CodAsignatura,CursoEscolar),
  CONSTRAINT FKRecibe_matricula FOREIGN KEY (NumMatricula) REFERENCES Alumno(NumMatricula),
  CONSTRAINT FKRecibe_asignatura FOREIGN KEY (CodAsignatura) REFERENCES Asignatura(CodAsignatura)
  );
  -------------------------------PROFESOR------------------------
  INSERT INTO Profesor VALUES (1,'12453645M','LUCIA','MATEMATICAS','935210487')
  INSERT INTO Profesor VALUES (2,'12453645N','PACO','LENGUAJE','998210487')

  SELECT* FROM Profesor
  
  ------------------------------ASIGNATURA-------------------------

  INSERT INTO Asignatura VALUES ('MATEMA', 'MATEMATICAS',1)
  INSERT INTO Asignatura VALUES ('LENGUA', 'LENGUA', 2)
  INSERT INTO Asignatura VALUES ('BIOLOG', 'BIOLOGIA', 1)
  INSERT INTO Asignatura VALUES ('QUIMIC','QUIMICA',2)

  SELECT* FROM Asignatura

  --------------------------ALUMNO------------------------------
  INSERT INTO Alumno VALUES (100,'ANA','08/12/1993','658171701')
  INSERT INTO Alumno VALUES(102, 'PEPE', '09/12/1993','659271789')
  INSERT INTO Alumno VALUES (103, 'JUAN','09/12/1992','660771709')
  INSERT INTO Alumno VALUES (104, 'DANIEL','08/11/1990','689271708')
  INSERT INTO Alumno VALUES (105,'ANGUSTIAS','09/11/1993','698191707')
  INSERT INTO Alumno VALUES (106,'MARIA','10/11/1993','695171706')
  INSERT INTO Alumno VALUES (107,'ANTONIO', '12/03/1992','620771705')
  INSERT INTO Alumno VALUES  (108, 'SOFIA','25/05/1991', '641171703')
  INSERT INTO Alumno VALUES (109,'JULIA', '25/05/1991','641171703')
  INSERT INTO Alumno VALUES (110,'ALFONSO','27/06/1993', '689171702')

  SELECT * FROM Alumno

  ----------------------------RECIBE------------------------------

  INSERT INTO Recibe VALUES (100, 'MATEMA', '2016/2017')
  INSERT INTO Recibe VALUES (100, 'LENGUA', '2016/2017')
  INSERT INTO Recibe VALUES (102, 'MATEMA', '2016/2017')  
  INSERT INTO Recibe VALUES (102, 'LENGUA', '2016/2017')  
  INSERT INTO Recibe VALUES (103, 'MATEMA', '2016/2017')
  INSERT INTO Recibe VALUES (103, 'LENGUA', '2016/2017')
  INSERT INTO Recibe VALUES (104, 'MATEMA', '2016/2017')
  INSERT INTO Recibe VALUES (105, 'BIOLOG', '2016/2017')  
  INSERT INTO Recibe VALUES (105, 'QUIMIC', '2016/2017')
  
  select * from Recibe 

  ----------------------actividad 2 portfolio tema 5-----------
--2. Introduce 2 profesores con el mismo NIF. ¿Qué sucede? ¿Por qué?
select* from Profesor
insert into Profesor values (3, '75574927D', 'Maria','Lenguaje', '601305797')
insert into Profesor values (4, '75574927D', 'Ana', 'Matematicas', '664596732')

--3. Introduce 2 alumnos con el mismo NumMatrícula. ¿Qué sucede? ¿Por qué?
select * from Alumno
insert into Alumno values ( 111, 'Maria', '09-03-1991','958378036')
insert into Alumno values ( 111, 'Juan', '15-12-1993', '601305797')

--4. Introduce 3 alumnos para los cuales no conocemos el número de teléfono.
select * from Alumno

insert into Alumno values ( 112, 'Juan', '15-12-1993','')
insert into Alumno values ( 113, 'Joaquin', '01-12-1993','')
insert into Alumno values ( 114, 'Maria', '09-03-1991','')

--5. Modifica los datos de los 3 alumnos anteriores para establecer un número de teléfono.
select * from Alumno
update Alumno
set Telefono='685935789'
where NumMatricula= 112 and Telefono = ''

update Alumno
set Telefono='685935456'
where NumMatricula= 113 and Telefono = ''

update Alumno
set Telefono='958935789'
where NumMatricula= 114 and Telefono = ''

-- 6. Para todos los alumnos, poner 2000 como año de nacimiento. 
select * from Alumno

update Alumno
set FechaNacimiento = dateadd(yyyy,(2000-year(FechaNacimiento)),FechaNacimiento )
where Year(FechaNacimiento)<2000;


--7. Para los profesores que tienen número de teléfono y NIF no comience por 9, poner ‘Informática’ como especialidad. 
select * from Profesor

UPDATE PROFESOR 
SET ESPECIALIDAD='INFORMATICA' 
WHERE TELEFONO IS NOT NULL AND NIF_P NOT LIKE '9%'

--8. Cambia la asignación de asignaturas para los profesores. 
--Es decir, las asignaturas impartidas por un profesor las dará el otro profesor y viceversa 

select*from Profesor

/*UPDATE Asignatura
SET IdProfesor 
	WHEN I*/
--Para poder hacer el intercambio necesitamos un valor intermedio.
UPDATE PROFESOR SET ESPECIALIDAD='TEMP' WHERE ESPECIALIDAD = 'MATEMÁTICAS';
UPDATE PROFESOR SET ESPECIALIDAD='MATEMÁTICAS' WHERE ESPECIALIDAD = 'LENGUAJE';
UPDATE PROFESOR SET ESPECIALIDAD='LENGUAJE' WHERE ESPECIALIDAD = 'TEMP';

--9. En la tabla Recibe borra todos los registros que pertenecen a una de las asignaturas. 

DELETE RECIBE WHERE CodAsignatura = 'LENGUA'

--10. En la tabla Asignatura borra dicha asignatura. 

DELETE ASIGNATURA WHERE CodAsignatura = 'LENGUA'

--11. Borra el resto de asignaturas. ¿Qué sucede? ¿Por qué? ¿Como lo solucionarías?
--¿Podría haberse evitado el problema con otro diseño físico?¿Cómo?
	DELETE Asignatura
	--No nos permite borrar directamente los registros de la tabla ASIGNATURA
	--ya que esos registros participan en una relación.
	--No tendríamos esta limitación si en el diseño físico hubiesemos definido
	--a clave foránea que apunta a  CodAsignatura con la cláusula ON DELETE CASCADE.

--12. Borra todos los profesores. ¿Qué sucede? ¿Por qué? ¿Como lo solucionarías? ¿Podría haberse evitado el problema con otro diseño físico?¿Cómo? 
	DELETE Profesor
	-- No nos permite borrar directamente los registros de la tabla PROFESOR
	-- ya que dichos registros participan en una relación.
	-- No tendríamos esta limitación si en el diseño físico hubiesemos definido
	-- la clave foránea que apunta a IdProfesor con la cláusula ON DELETE CASCADE.

--13. Borra todos los alumnos. ¿Qué sucede? ¿Por qué? ¿Como lo solucionarías? ¿Podría haberse evitado el problema con otro diseño físico?¿Cómo? 
	DELETE Alumno
	-- No nos permite borrar directamente los registros de la tabla PROFESOR
	-- ya que dichos registros participan en una relación.
	-- No tendríamos esta limitación si en el diseño físico hubiesemos definido
	-- la clave foránea que apunta a IdAlumno con la cláusula ON DELETE CASCADE.