SELECT count(f_a.actor_id) AS "Num d'actors"
FROM film_actor as f_a
JOIN actor act ON act.actor_id = f_a.actor_id;


SELECT count(DISTINCT f_a.actor_id) AS "Num d'actors"
FROM film_actor as f_a;

SELECT cust.first_name, city.city, 


SELECT TO_CHAR(lower(rental_period), 'MM/YYYY') AS "Mes i Any", 
COUNT(*) AS "Lloguers"
FROM rental
GROUP BY TO_CHAR(lower(rental_period), 'MM/YYYY')
ORDER BY TO_DATE(TO_CHAR(lower(rental_period), 'MM/YYYY'), 'MM/YYYY') ASC




select count(film_id), film.title, film.release_year, film.replacement_cost



SELECT film.title, film.release_year, 
    CASE 
        WHEN TRUNC(film.replacement_cost,1) IS NULL THEN 0
        ELSE TRUNC(COALESCE(replacement_cost, 0) / MAX(COALESCE(replacement_cost, 0)) OVER (), 1)
    END AS replacement_cost,
    COUNT(*) AS "Num vegades llogat"
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.film_id
HAVING COUNT(*) > 30
ORDER BY COUNT(*) DESC;

SELECT f.title, f.release_year,
TRUNC(COALESCE(replacement_cost, 0) / MAX(COALESCE(replacement_cost, 0)) OVER (), 1), 
COUNT(rental_rate)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title, f.release_year, replacement_cost
HAVING COUNT(rental_rate) > 30
ORDER BY COUNT(rental_rate) DESC


-- 9
SELECT cust.first_name AS "Nom", city.city AS "Ciutat", 
    COUNT(rental.rental_id) AS "Num_Lloguers", 
    TRUNC(AVG(payment.amount), 2) AS "Cost_Mig"
FROM customer AS cust
JOIN address AS addr ON cust.address_id = addr.address_id
JOIN city ON addr.city_id = city.city_id
JOIN rental ON cust.customer_id = rental.customer_id
JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY cust.first_name, city.city
ORDER BY city.city, cust.first_name;
--Isma
SELECT CONCAT(c.first_name,' ' ,c.last_name) AS Nom, ci.city AS Ciutat, TRUNC(AVG(p.amount), 2) AS "Cost Mig", COUNT(r.rental_id) AS "Nom Lloguers"
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY city, c.first_name, c.last_name
ORDER BY city, c.first_name

SELECT emp.employee_id, emp.first_name, emp.salary
FROM employees emp
WHERE emp.salary = (SELECT salary FROM employees WHERE employee_id = 104); 

select 'gEIS' from employees

-- Retorna tots els productes del fabricant Lenovo
SELECT *
FROM producto
WHERE codigo_fabricante = (SELECT codigo_fabricante FROM fabricante WHERE nombre = 'Lenovo');

SELECT *
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto WHERE codigo_fabricante = (SELECT codigo_fabricante FROM fabricante WHERE nombre = 'Hewlett-Packard'));
--Retorna el producte més car que hi ha a la taula producte sense MAX,ORDER BY, LIMIT
SELECT nombre
FROM PRODUCTO
WHERE precio >= ALL (SELECT precio FROM PRODUCTO);
--fi
SELECT nombre
FROM PRODUCTO p1
WHERE NOT EXISTS (
    SELECT 1
    FROM PRODUCTO p2
    WHERE p2.precio < p1.precio
);
