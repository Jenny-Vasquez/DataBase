CREATE DATABASE Asignatura1;
USE Asignatura1;

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
  CodAsignatura VARCHAR (30) PRIMARY KEY,
  Nombre VARCHAR(30) NOT NULL,
  IdProfesor INT NOT NULL,
  CONSTRAINT FKAsignatura_profesor FOREIGN KEY (IdProfesor) REFERENCES Profesor(IdProfesor),
);

CREATE TABLE Recibe (
  NumMatricula INT not null,
  CodAsignatura VARCHAR (30) not null,
  CursoEscolar Varchar (15) Primary Key,
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
  