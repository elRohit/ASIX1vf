-- 1.1.3 Consultes sobre una taula

-- 1:
SELECT nombre FROM producto;

-- 2:
SELECT nombre, precio FROM producto;

-- 3:
SELECT * FROM producto;

-- 4:
SELECT nombre AS "nom de producte", precio AS euros, precio * 1.18 AS dólares FROM producto;

-- 5:
SELECT upper(nombre), precio FROM producto;

-- 6:
SELECT lower(nombre), precio FROM producto;

-- 7:
SELECT nombre AS "nom de fabricant", UPPER(SUBSTRING(nombre, 1, 2)) AS "primers dos caràcters" FROM fabricante;

-- 8:
SELECT nombre, round(precio,2) FROM producto; 

-- 9:
