/*
-- Selecciona el nom de la pel·lícula més llogada. (Taules implicades: film, inventory, rental):
SELECT film.title
FROM film
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
GROUP BY film.title
ORDER BY COUNT(inventory.inventory_id) DESC
LIMIT 1;

-- Selecciona el nom de les pelicules que siguin de ciencia i ficció
SELECT f.title
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-Fi';

-- Selecciona el nom de les pelicules que siguin de ciencia i ficció
-- + Si el release_year es < 2000 esuma "Classica " o sino "Moderna "
SELECT f.title, 
       CASE
           WHEN f.release_year < 2000 THEN 'Clasica'
           ELSE 'Moderna'
       END AS Tipus_Clase
FROM film f 
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-Fi';
*/
--Selecciona el titol de totes les pel·licules de Sci-Fi anteriors i canvia a la 1a i la ultima lletra a minúscules

SELECT LOWER(LEFT(title, 1)) || SUBSTR(title, 2, LENGTH(title) - 2) || LOWER(RIGHT(title, 1)) AS title, 
       CASE
           WHEN f.release_year < 2000 THEN 'Clasica'
           ELSE 'Moderna'
       END AS Tipus_Clase
FROM film f 
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-Fi';

-- Los actores que han paritcipado en las peliculas de Sci-Fi 
SELECT a.first_name, a.last_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Sci-Fi';

-- Las películas que no tienen copias 
SELECT f.title
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
WHERE i.film_id IS NULL;


--Dame los idiomas que no tienen películas
SELECT lang.name
FROM language lang
LEFT JOIN film fi ON lang.language_id = fi.language_id
WHERE fi.language_id IS NULL;
--Correct
SELECT lang.name
FROM film fi
RIGHT JOIN language lang ON lang.language_id = fi.language_id
WHERE fi.language_id IS NULL;

--Todos los idiomas que no tienen películas y películas que no tienen idiomas


SELECT lang.name, fi.title
FROM film fi
FULL JOIN language lang ON lang.language_id = fi.language_id

WHERE fi.language_id IS NULL OR lang.language_id IS NULL;

--Todas las películas que se han alquilado en el 1er trimestre 
SELECT f.title, r.rental_period as trimestre, TO_CHAR(LOWER(r.rental_period), 'MM') as mes
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
WHERE EXTRACT(MONTH FROM lower(r.rental_period)) IN (1, 2, 3);








