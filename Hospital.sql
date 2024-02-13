--Creación de la base de datos Hospital
--
USE MASTER
GO

CREATE DATABASE Hospital;
GO

USE Hospital
GO

CREATE TABLE Dept
(
	Dept_No			INT				NOT NULL,
	DNombre			VARCHAR(50)		NULL,
	Loc				VARCHAR(50)		NULL,
	CONSTRAINT PK_Dept PRIMARY KEY(Dept_No)
)

CREATE TABLE Emp
(
	Emp_No			INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Oficio			VARCHAR(50)		NULL,
	Dir				INT				NULL,
	Fecha_Alt		SMALLDATETIME	NULL,
	Salario			NUMERIC(9,2)	NULL,
	Comision		NUMERIC(9,2)	NULL,
	Dept_No			INT				NULL
	CONSTRAINT PK_Emp PRIMARY KEY(Emp_No),
	CONSTRAINT FK_Emp FOREIGN KEY (Dept_No) REFERENCES Dept(Dept_No)
)

CREATE TABLE Hospital
(
	Hospital_Cod	INT				NOT NULL,
	Nombre			VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Telefono		VARCHAR(50)		NULL,
	Num_Cama		INT				NULL,
	CONSTRAINT PK_Hospital PRIMARY KEY(Hospital_Cod)
)

CREATE TABLE Doctor
(
	Doctor_No		INT				NOT NULL,
	Hospital_Cod	INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Especialidad	VARCHAR(50)		NULL
	CONSTRAINT PK_Doctor PRIMARY KEY(Doctor_No),
	CONSTRAINT FK_Doctor FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod)
)

CREATE TABLE Sala
(
	Sala_Cod		INT				NOT NULL,	
	Hospital_Cod	INT				NOT NULL,
	Nombre			VARCHAR(50)		NULL,
	Num_Cama		INT				NULL
	CONSTRAINT PK_Sala PRIMARY KEY(Sala_Cod,Hospital_Cod),
	CONSTRAINT FK_Sala FOREIGN KEY (Hospital_Cod) REFERENCES Hospital(Hospital_Cod)
)

CREATE TABLE Plantilla
(
	Empleado_No		INT				NOT NULL,
	Sala_Cod		INT				NOT NULL,	
	Hospital_Cod	INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Funcion			VARCHAR(50)		NULL,
	T				VARCHAR(15)		NULL,
	Salario			NUMERIC(9,2)	NULL
	CONSTRAINT PK_Plantilla PRIMARY KEY(Empleado_No),
	CONSTRAINT FK_Plantilla FOREIGN KEY (Sala_Cod,Hospital_Cod) REFERENCES Sala(Sala_Cod,Hospital_Cod)
)

CREATE TABLE Enfermo
(
	Inscripcion		INT				NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Fecha_Nac		VARCHAR(50)		NULL,
	S				VARCHAR(2)		NULL,
	NSS				INT				NULL
)	