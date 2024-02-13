--UD6. RELACIÓN DE EJERCICIOS 1
----------------------------------1. TIENDA INFORMÁTICA-----------------------------------------
--Consultas
--1. Lista el nombre de todos los productos que hay en la tabla producto.
SELECT nombre FROM producto
--2. Lista los nombres y los precios de todos los productos de la tabla producto.
SELECT nombre, precio FROM producto
--3. Lista todas las columnas de la tabla producto.
SELECT*FROM producto
--4. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses 
--(USD).
SELECT nombre,
precio AS precio_euros,
precio*1.09 AS precio_dolar
FROM producto
--5. Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses 
--(USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
SELECT nombre,
precio AS precio_euros,
precio*1.09 AS precio_dolar
FROM producto
--6. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los 
--nombres a mayúscula.
SELECT UPPER(nombre), precio FROM producto
--7. Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los 
--nombres a minúscula.
SELECT LOWER (nombre),precio FROM producto
--8. Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas 
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

--11. Lista el código de los fabricantes que tienen productos en la tabla producto.
SELECT codigo FROM fabricante WHERE EXISTS (select codigo FROM fabricante)

--12. Lista el código de los fabricantes que tienen productos en la tabla producto, eliminando los 
--códigos que aparecen repetidos.
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


--17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
SELECT TOP 2* FROM
(SELECT TOP 5 * FROM fabricante ORDER BY codigo ASC ) A
ORDER BY codigo DESC

--18. Lista el nombre y el precio del producto más barato. 
SELECT TOP 1 nombre FROM producto ORDER BY precio
--19. Lista el nombre y el precio del producto más caro. 
SELECT TOP 1 nombre FROM producto ORDER BY precio DESC
--20. Lista el nombre de todos los productos del fabricante cuyo código de fabricante es igual a 2.
SELECT nombre FROM producto WHERE codigo_fabricante=2

--21. Lista el nombre de los productos que tienen un precio menor o igual a 120€.
SELECT nombre, PRECIO FROM producto WHERE precio<=120

--22. Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
SELECT nombre, PRECIO FROM producto WHERE precio>=400

--23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400€.
SELECT nombre FROM producto WHERE NOT precio >= 400
--24. Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.

SELECT *FROM producto WHERE precio >=80 AND precio<= 300
--25. Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.

SELECT *FROM producto WHERE precio BETWEEN 60 AND 300
--26. Lista todos los productos que tengan un precio mayor que 200€ y que el código de fabricante 
--sea igual a 6.
SELECT *FROM producto WHERE precio  >200 AND codigo_fabricante=6

--27. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * from  producto where codigo_fabricante=1 or codigo_fabricante=3 or codigo_fabricante=5
--28. Lista todos los productos donde el código de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from  producto where codigo_fabricante in(1,2,3)
--29. Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). 
--Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre, precio*100 as centimos from producto
--30. Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante where nombre like 'S%'
--31. Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante where nombre like '%e'
--32. Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante where nombre like '%w%'
--33. Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante where nombre like '____'
--34. Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en 
--el nombre.
select nombre from producto where nombre like '%Portatil%'
--35. Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en 
--el nombre y tienen un precio inferior a 215 €.
select nombre from producto where nombre like '%Monitor%' and precio <=215
--36. Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. 
--Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar 
--por el nombre (en orden ascendente)
select nombre, precio from producto where precio >=180 order by nombre asc, precio desc

-- Consultas resumen

--37. Calcula el número total de productos que hay en la tabla productos.
select COUNT(*)  as total_productos from producto
--38. Calcula el número total de fabricantes que hay en la tabla fabricante.
select COUNT(*)  as total_fabricantes from fabricante
--39. Calcula la media del precio de todos los productos.
select  AVG(precio) AS precio_medio from producto
--40. Calcula el precio más barato de todos los productos.
select MIN(precio) from producto
--41. Calcula el precio más caro de todos los productos.
select max(precio) from producto
--42. Lista el nombre y el precio del producto más barato.
select nombre from producto
where precio= (select min(precio) from producto)

select top 1 nombre, precio from producto order by precio asc

--43. Lista el nombre y el precio del producto más caro.
select nombre from producto
where precio= (select max(precio) from producto)

select top 1 nombre, precio from producto order by precio desc
--44. Calcula la suma de los precios de todos los productos.
select SUM(precio) from producto
--45. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los 
--fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre 
--del fabricante, con el código del fabricante es suficiente.

select codigo_fabricante,
	MAX(precio) as precio_max,
	MIN(precio) as precio_min,
	AVG(precio) as precio_medio,
	COUNT(*) as Total_prod 
from producto 
group by codigo_fabricante
having avg(precio) >200

--46. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio 
--medio y el número total de productos de los fabricantes que tienen un precio medio superior 
--a 200€

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


--47. Calcula el número de productos que tienen un precio mayor o igual a 180€.
select COUNT(*) as Precio_mayor_180 from producto where precio >=180

--48. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
select codigo_fabricante,
COUNT(*) as Precio_mayor_180 
from producto 
where precio >=180 
group by  codigo_fabricante
--49. Lista el precio medio los productos de cada fabricante, mostrando solamente el código del fabricante.
select codigo_fabricante, 
	avg(precio) as Precio_medio 
from producto 
where precio >=180
group by  codigo_fabricante


---------------------------------------2. GESTIÓN DE VENTAS.......................................
--Consultas
--1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar or-
--denados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
select * from pedido
order by fecha desc
--2. Devuelve todos los datos de los dos pedidos de mayor valor.
select * from pedido
order by total desc

--3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido.
--Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
select  distinct id_cliente from pedido

--4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad
--total sea superior a 500€.
select * from pedido
where fecha between '2017-01-01' and '2017-12-31' and total>500
--5. Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión
--entre 0.05 y 0.11.
select nombre, apellido1, apellido2 from comercial
where comisión between 0.05  and 0.11
--6. Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
select top 1 comisión from comercial
order by comisión desc
select * from comercial
--7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo segundo apelli-
--do no es NULL. El listado deberá estar ordenado alfabéticamente por apellidos y nombre.
select id, nombre, apellido1 from cliente
where apellido2 is null
order by nombre, apellido1 asc
--8. Devuelve un listado de los nombres de los clientes que empiezan por A y terminan por n y
--también los nombres que empiezan por P. El listado deberá estar ordenado alfabéticamente.
select nombre from cliente
where nombre like 'A%'  or nombre like '%n'or nombre like 'P%' 
order by nombre asc
--9. Devuelve un listado de los nombres de los clientes que no empiezan por A. El listado deberá
--estar ordenado alfabéticamente.
select nombre from cliente
where nombre not like 'A%'
order by nombre asc
--10. Devuelve un listado con los nombres de los comerciales que terminan por el o o. Tenga en
--cuenta que se deberán eliminar los nombres repetidos.
select distinct nombre from comercial
where nombre like '%el' or nombre like '%o'
--Consultas resumen:

--11. Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select* from pedido
select sum(total) as suma_Total_pedido from pedido
--12. Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select AVG(total) as media_total_pedido from pedido
--13. Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select count(distinct id_comercial ) as comerciales from pedido
--14. Calcula el número total de clientes que aparecen en la tabla cliente.
select count (*)as total_cliente from cliente
--15. Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select total from pedido
where total= (select max(total) from pedido)
--16. Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select total from pedido
where total = (select min(total) from pedido)
--17. Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la
--tabla cliente.
select categoría, ciudad from cliente
where categoría= (select max (categoría) from cliente)
--18. Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select max (total) as maximo_valor, year (fecha) as año from pedido
group by year(fecha)

--19. Devuelve el número total de pedidos que se han realizado cada año.
select count(*) as pedidos, year (fecha) as año from pedido
group by year(fecha)
-----------------------------------------------3. LIGA BALONCESTO---------------------------------------
--1. Datos de los jugadores del equipo 3 ordenados por apellidos
select * from JUGADOR
where num_equipo = 3 
order by apellido asc
--2. Datos de los jugadores que sean pívot ordenados por su identificador
select * from JUGADOR
where puesto = 'Pivot'
order by id_jugador asc
--3. Datos de los jugadores de más de dos metros y que ganen menos de 40.000 euros.
select * from JUGADOR
where altura >2 and salario <40000 
--4. Datos de los partidos jugados en febrero
select * from PARTIDO
where MONTH(fecha) = 2
--5. Nombre y apellido de los capitanes de los equipos
select nombre, apellido from JUGADOR 
where id_capitan=id_jugador

--6. Datos de los jugadores de los equipos 1 y 2 que ganen más de 80.000 euros al mes.
select * from JUGADOR

--7. Número de partidos jugados en marzo

--8. Id del equipo y suma de las alturas de sus jugadores
--9. Id del equipo y salario total de cada equipo para equipos con más de 4 jugadores registrados,
--10. Número de ciudades distintas
--11. Datos del jugador más alto