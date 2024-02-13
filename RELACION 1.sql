--UD6. RELACI�N DE EJERCICIOS 1
----------------------------------1. TIENDA INFORM�TICA-----------------------------------------
--Consultas
--1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto
--2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto
--3. Lista todas las columnas de la tabla producto.
SELECT*FROM producto
--4. Lista el nombre de los productos, el precio en euros y el precio en d�lares estadounidenses 
--(USD).
SELECT nombre,
precio AS precio_euros,
precio*1.09 AS precio_dolar
FROM producto
--5. Lista el nombre de los productos, el precio en euros y el precio en d�lares estadounidenses 
--(USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, d�lares.
SELECT nombre,
precio AS precio_euros,
precio*1.09 AS precio_dolar
FROM producto
--6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los 
--nombres a may�scula.
SELECT UPPER(nombre), precio FROM producto
--7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los 
--nombres a min�scula.
SELECT LOWER (nombre),precio FROM producto
--8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en may�sculas 
--los dos primeros caracteres del nombre del fabricante.

SELECT nombre, 
       UPPER(LEFT(nombre, 2)) AS may_dos_primeros_caracteres
FROM fabricante;

SELECT nombre, 
       UPPER(SUBSTRING(nombre, 1, 2)) AS May_dos_primeros_caracteres
FROM fabricante;

--9. Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el 
--valor del precio.
SELECT nombre, ROUND(precio,0) as precioProducucto FROM producto

SELECT ROUND (precio,0) as precio, nombre FROM producto
--10. Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor 
--del precio para mostrarlo sin ninguna cifra decimal.

SELECT nombre,precio, CONVERT (int, precio) FROM producto

--11. Lista el c�digo de los fabricantes que tienen productos en la tabla producto.
SELECT codigo FROM fabricante WHERE EXISTS (select codigo FROM fabricante)

--12. Lista el c�digo de los fabricantes que tienen productos en la tabla producto, eliminando los 
--c�digos que aparecen repetidos.
SELECT DISTINCT codigo FROM fabricante

--13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre FROM fabricante ORDER BY nombre ASC

--14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre FROM fabricante ORDER BY nombre DESC

--15. Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente
--y en segundo lugar por el precio de forma descendente.
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC

--16. Devuelve una lista con las 5 primeras filas de la tabla fabricante.
SELECT TOP 5 * FROM fabricante 


--17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila tambi�n se debe incluir en la respuesta.
SELECT TOP 2* FROM
(SELECT TOP 5 * FROM fabricante ORDER BY codigo ASC ) A
ORDER BY codigo DESC

--18. Lista el nombre y el precio del producto m�s barato. 
SELECT TOP 1 nombre FROM producto ORDER BY precio
--19. Lista el nombre y el precio del producto m�s caro. 
SELECT TOP 1 nombre FROM producto ORDER BY precio DESC
--20. Lista el nombre de todos los productos del fabricante cuyo c�digo de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante=2

--21. Lista el nombre de los productos que tienen un precio menor o igual a 120�.
SELECT nombre, PRECIO FROM producto WHERE precio<=120

--22. Lista el nombre de los productos que tienen un precio mayor o igual a 400�.
SELECT nombre, PRECIO FROM producto WHERE precio>=400

--23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400�.
SELECT nombre FROM producto WHERE NOT precio >= 400
--24. Lista todos los productos que tengan un precio entre 80� y 300�. Sin utilizar el operador BETWEEN.

SELECT *FROM producto WHERE precio >=80 AND precio<= 300
--25. Lista todos los productos que tengan un precio entre 60� y 200�. Utilizando el operador BETWEEN.

SELECT *FROM producto WHERE precio BETWEEN 60 AND 300
--26. Lista todos los productos que tengan un precio mayor que 200� y que el c�digo de fabricante 
--sea igual a 6.
SELECT *FROM producto WHERE precio  >200 AND codigo_fabricante=6

--27. Lista todos los productos donde el c�digo de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * from  producto where codigo_fabricante=1 or codigo_fabricante=3 or codigo_fabricante=5
--28. Lista todos los productos donde el c�digo de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from  producto where codigo_fabricante in(1,2,3)
--29. Lista el nombre y el precio de los productos en c�ntimos (Habr� que multiplicar por 100 el valor del precio). 
--Cree un alias para la columna que contiene el precio que se llame c�ntimos.
select nombre, precio*100 as centimos from producto
--30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante where nombre like 'S%'
--31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante where nombre like '%e'
--32. Lista los nombres de los fabricantes cuyo nombre contenga el car�cter w.
select nombre from fabricante where nombre like '%w%'
--33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where nombre like '____'
--34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Port�til en 
--el nombre.
select nombre from producto where nombre like '%Portatil%'
--35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en 
--el nombre y tienen un precio inferior a 215 �.
select nombre from producto where nombre like '%Monitor%' and precio <=215
--36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180�. 
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar 
--por el nombre (en orden ascendente)
select nombre, precio from producto where precio >=180 order by nombre asc, precio desc

-- Consultas resumen

--37. Calcula el n�mero total de productos que hay en la tabla productos.
select COUNT(*)  as total_productos from producto
--38. Calcula el n�mero total de fabricantes que hay en la tabla fabricante.
select COUNT(*)  as total_fabricantes from fabricante
--39. Calcula la media del precio de todos los productos.
select  AVG(precio) AS precio_medio from producto
--40. Calcula el precio m�s barato de todos los productos.
select MIN(precio) from producto
--41. Calcula el precio m�s caro de todos los productos.
select max(precio) from producto
--42. Lista el nombre y el precio del producto m�s barato.
select nombre from producto
where precio= (select min(precio) from producto)

select top 1 nombre, precio from producto order by precio asc

--43. Lista el nombre y el precio del producto m�s caro.
select nombre from producto
where precio= (select max(precio) from producto)

select top 1 nombre, precio from producto order by precio desc
--44. Calcula la suma de los precios de todos los productos.
select SUM(precio) from producto
--45. Muestra el precio m�ximo, precio m�nimo, precio medio y el n�mero total de productos de los 
--fabricantes que tienen un precio medio superior a 200�. No es necesario mostrar el nombre 
--del fabricante, con el c�digo del fabricante es suficiente.

select codigo_fabricante,
	MAX(precio) as precio_max,
	MIN(precio) as precio_min,
	AVG(precio) as precio_medio,
	COUNT(*) as Total_prod 
from producto 
group by codigo_fabricante
having avg(precio) >200

--46. Muestra el nombre de cada fabricante, junto con el precio m�ximo, precio m�nimo, precio 
--medio y el n�mero total de productos de los fabricantes que tienen un precio medio superior 
--a 200�

select
	(select nombre from fabricante F where F.codigo = codigo_fabricante)as codigo_fabricante,

	MAX(precio) as precio_max,
	MIN(precio) as precio_min,
	AVG(precio) as precio_medio,
	COUNT(*) as Total_prod 
from producto 
group by codigo_fabricante
having avg(precio) >200



SELECT  f.nombre AS fabricante,
       MAX(p.precio) AS precio_maximo,
       MIN(p.precio) AS precio_minimo,
       AVG(p.precio) AS precio_medio,
       COUNT(p.codigo) AS numero_productos
FROM fabricante f
JOIN producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.nombre
HAVING avg (precio)> 200


--47. Calcula el n�mero de productos que tienen un precio mayor o igual a 180�.
select COUNT(*) as Precio_mayor_180 from producto where precio >=180

--48. Calcula el n�mero de productos que tiene cada fabricante con un precio mayor o igual a 180�.
select codigo_fabricante,
COUNT(*) as Precio_mayor_180 
from producto 
where precio >=180 
group by  codigo_fabricante
--49. Lista el precio medio los productos de cada fabricante, mostrando solamente el c�digo del fabricante.
select codigo_fabricante, 
	avg(precio) as Precio_medio 
from producto 
where precio >=180
group by  codigo_fabricante


---------------------------------------2. GESTI�N DE VENTAS.......................................
--Consultas
--1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar or-
--denados por la fecha de realizaci�n, mostrando en primer lugar los pedidos m�s recientes.
select * from pedido
order by fecha desc
--2. Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido
order by total desc

--3. Devuelve un listado con los identificadores de los clientes que han realizado alg�n pedido.
--Tenga en cuenta que no debe mostrar identificadores que est�n repetidos.
select  distinct id_cliente from pedido

--4. Devuelve un listado de todos los pedidos que se realizaron durante el a�o 2017, cuya cantidad
--total sea superior a 500�.
select * from pedido
where fecha between '2017-01-01' and '2017-12-31' and total>500
--5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisi�n
--entre 0.05 y 0.11.
select nombre, apellido1, apellido2 from comercial
where comisi�n between 0.05  and 0.11
--6. Devuelve el valor de la comisi�n de mayor valor que existe en la tabla comercial.
select top 1 comisi�n from comercial
order by comisi�n desc
select * from comercial
--7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apelli-
--do no es NULL. El listado deber� estar ordenado alfab�ticamente por apellidos y nombre.
select id, nombre, apellido1 from cliente
where apellido2 is null
order by nombre, apellido1 asc
--8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y
--tambi�n los nombres que empiezan por P. El listado deber� estar ordenado alfab�ticamente.
select nombre from cliente
where nombre like 'A%'  or nombre like '%n'or nombre like 'P%' 
order by nombre asc
--9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deber�
--estar ordenado alfab�ticamente.
select nombre from cliente
where nombre not like 'A%'
order by nombre asc
--10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en
--cuenta que se deber�n eliminar los nombres repetidos.
select distinct nombre from comercial
where nombre like '%el' or nombre like '%o'
--Consultas resumen:

--11. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select* from pedido
select sum(total) as suma_Total_pedido from pedido
--12. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select AVG(total) as media_total_pedido from pedido
--13. Calcula el n�mero total de comerciales distintos que aparecen en la tabla pedido.
select count(distinct id_comercial ) as comerciales from pedido
--14. Calcula el n�mero total de clientes que aparecen en la tabla cliente.
select count (*)as total_cliente from cliente
--15. Calcula cu�l es la mayor cantidad que aparece en la tabla pedido.
select total from pedido
where total= (select max(total) from pedido)
--16. Calcula cu�l es la menor cantidad que aparece en la tabla pedido.
select total from pedido
where total = (select min(total) from pedido)
--17. Calcula cu�l es el valor m�ximo de categor�a para cada una de las ciudades que aparece en la
--tabla cliente.
select categor�a, ciudad from cliente
where categor�a= (select max (categor�a) from cliente)
--18. Devuelve cu�l ha sido el pedido de m�ximo valor que se ha realizado cada a�o.
select max (total) as maximo_valor, year (fecha) as a�o from pedido
group by year(fecha)

--19. Devuelve el n�mero total de pedidos que se han realizado cada a�o.
select count(*) as pedidos, year (fecha) as a�o from pedido
group by year(fecha)
-----------------------------------------------3. LIGA BALONCESTO---------------------------------------
--1. Datos de los jugadores del equipo 3 ordenados por apellidos
select * from JUGADOR
where num_equipo = 3 
order by apellido asc
--2. Datos de los jugadores que sean p�vot ordenados por su identificador
select * from JUGADOR
where puesto = 'Pivot'
order by id_jugador asc
--3. Datos de los jugadores de m�s de dos metros y que ganen menos de 40.000 euros.
select * from JUGADOR
where altura >2 and salario <40000 
--4. Datos de los partidos jugados en febrero
select * from PARTIDO
where MONTH(fecha) = 2
--5. Nombre y apellido de los capitanes de los equipos
select nombre, apellido from JUGADOR 
where id_capitan=id_jugador

--6. Datos de los jugadores de los equipos 1 y 2 que ganen m�s de 80.000 euros al mes.
select * from JUGADOR

--7. N�mero de partidos jugados en marzo

--8. Id del equipo y suma de las alturas de sus jugadores
--9. Id del equipo y salario total de cada equipo para equipos con m�s de 4 jugadores registrados,
--10. N�mero de ciudades distintas
--11. Datos del jugador m�s alto