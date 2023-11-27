--1
--SELECT count(nombre)
--FROM producto;
--2
--SELECT count(*)
--FROM fabricante
--3
--SELECT count(distinct(codigo_fabricante))
--from producto
--group by codigo_fabricante
--4
--SELECT AVG(precio)
--FROM producto;
--5
--SELECT min(precio)
--FROM producto;
--6
--SELECT max(precio)
--FROM producto;
--7
--SELECT nombre, min(precio)
--FROM producto
--GROUP BY nombre;
--8
--SELECT nombre, max(precio)
--FROM producto
--GROUP BY nombre;
--9
--SELECT sum(precio)
--FROM producto;
--10
--SELECT count(*)
--FROM producto p
--INNER JOIN fabricante f
--ON p.codigo_fabricante = f.codigo
--WHERE f.nombre = 'Asus'
--16
--SELECT f.nombre, count(*)
--FROM producto p
--RIGHT JOIN fabricante f
--ON p.codigo_fabricante = f.codigo
--GROUP BY f.nombre
--ORDER BY count(*) DESC;
--18
--SELECT max(precio),min(precio),avg(precio),count(*)
--FROM producto p
--INNER JOIN fabricante f
--ON p.codigo_fabricante = f.codigo
--GROUP BY f.nombre
--HAVING f.nombre < 200
--27 
SELECT f.nombre, count(p.codigo)
FROM fabricante f
LEFT JOIN producto p ON f.codigo = p.codigo_fabricante
WHERE p.precio <= 220
GROUP BY f.nombre 
ORDER BY p.precio 