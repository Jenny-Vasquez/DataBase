--1. Dar de alta con fecha actual al empleado Jose Escriche Barrera como programador
--perteneciente al departamento de informática. Tendrá un salario base de 70000 y no
--cobrará comisión, ¿qué dificultad plantea el alta de este empleado? ¿Cómo podría
--solucionarse?
select * from Dept
insert into Dept values (60,'INFORMÁTICA', 'GRANADA' )

select* from Emp
insert into Emp values(7983, 'Escriche', 'PROGRAMADOR',7302, GETDATE(),70000,0,60);

--2. Se quiere dar de alta un departamento de informática situado en Fuenlabrada (Madrid).

SELECT * FROM Dept

INSERT INTO Dept VALUES( 50,'INFORMÁTICA', 'FUENLABRADA')
--3. El departamento de ventas se traslada a Lerida, realizar dicha modificación.
select * from Dept
UPDATE Dept
SET Loc='Lerida'
WHERE DNombre='VENTAS';


--4. En el departamento anterior se dan de alta dos empleados: Julián Romeral y Luis Alonso.
--Su salario base es de 80000 y cobrarán una comisión del 15% de su salario.

INSERT INTO Emp (Emp_No, Apellido, Salario, Comision, Dept_No, Oficio, Fecha_Alt)
VALUES 
  ((SELECT MAX(Emp_No) + 1 FROM Emp), 'Romeral', 80000, 80000 * 0.15, (SELECT Dept_No FROM Dept WHERE DNombre = 'Ventas'), 'Empleado', GETDATE()),
  ((SELECT MAX(Emp_No) + 2 FROM Emp), 'Alonso', 80000, 80000 * 0.15, (SELECT Dept_No FROM Dept WHERE DNombre = 'Ventas'), 'Empleado', GETDATE());

--5. Modificar la comisión de los empleados de la empresa, de forma que todos tengan un
--incremento del 10% del salario.
select * from Emp

update Emp 
set Comision= Salario *0.10 + Comision

--6. Incrementar un 5% el salario de los interinos de la plantilla que trabajen en el turno de
--noche.
select * from Plantilla

update Plantilla
set Salario= salario *0.05
where Funcion ='Interino' and T='N';
--7. Incrementar en 5000 el salario de los empleados del departamento de ventas y del
--presidente, tomando en cuenta los que se dieron de alta antes que el presidente de la
--empresa.

select * from Emp

update Emp
set salario= salario + 5000
where Oficio='Ventas'or Oficio= 'Presidente' 
and Fecha_Alt < (select Fecha_Alt from Emp where Oficio='Presidente')

--8. Se tienen que desplazar cien camas del Hospital SAN CARLOS otro hospital de la ciudad.
--Actualizar el número de camas del Hospital SAN CARLOS.
select * from Hospital
update Hospital
set Num_Cama= Num_Cama-100
Where Nombre= 'San Carlos'
--9. Crear una tabla llamada Mujeres e insertar los enfermos con este sexo.

CREATE TABLE MUJERES(
	Inscripcion		INT			PRIMARY KEY	NOT NULL,
	Apellido		VARCHAR(50)		NULL,
	Direccion		VARCHAR(50)		NULL,
	Fecha_Nac		VARCHAR(50)		NULL,
	S				VARCHAR(2)		NULL,
	NSS				INT				NULL
);

INSERT INTO Mujeres
SELECT * FROM Enfermo WHERE S = 'F';


--10. Crear una tabla llamada Empleados e introducir todos los datos de la tabla EMP en ella.
SELECT * INTO Empleados FROM Emp;

SELECT * FROM Empleados
--11. Utilizar la tabla anterior. Subir el salario y la comisión en un millón y doscientas
--veinticinco mil respectivamente a los empleados que se dieron de alta en este año.

update Empleados
set Salario = Salario + 1000000 , Comision= Comision + 1225000 
where YEAR(Fecha_Alt)= year(getdate())

--12. Borrar de la tabla mujer al enfermo con número de inscripción igual a 64823.
 SELECT * FROM MUJERES
 DELETE MUJERES
 WHERE Inscripcion ='64823'
--13. Borrar todos los registros de la tabla Mujeres de la forma más rápida.
TRUNCATE TABLE MUJERES
--14. Utilizar la tabla Empleados. Borrar todos los empleados dados de alta entre las fechas
--01/01/80 y 31/12/82.
DELETE Empleados
WHERE Fecha_Alt BETWEEN '01/01/80'AND '31/12/82' 
--15. Modificar el salario de los empleados trabajen en La Paz y estén destinados a Psiquiatría.
--Subirles el sueldo 20000 más que al señor Amigo R.
select * from Emp


UPDATE Emp
SET Salario = Salario + 20000
WHERE Dir = (SELECT Dir FROM Emp WHERE Apellido = 'Amigo R') AND Dept_No = (SELECT Dept_No FROM Dept WHERE Loc = 'La Paz') AND Oficio = 'Psiquiatra';

--16. Borrar los empleados cuyo nombre de departamento sea producción.
 select * from Empleados
delete Empleados
where Oficio= 'Produccion'