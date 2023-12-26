/* 1.	Mostra el salari més alt, el més baix, la suma i la mitjana per tots els empleats. Anomena les columnes com a “Salari màxim”,  “Salari mínim”, Suma i Mitjana respectivament. Arrodoneix els resultats a l’enter més pròxim.
SELECT TRUNC(MAX(e.salary), 0) AS "Salari maxim", 
TRUNC(MIN(e.salary), 0) AS "Salari minim", 
TRUNC(SUM(e.salary), 0) AS "Suma", 
TRUNC(AVG(e.salary),0) AS "Mitjana"
FROM employees e
*/

/*
2.	Mostra la mitjana dels salaris i el número d’empleats que tenim. Arrodoneix la mitjana al número enter més pròxim i anomena les columnes com a “Salari mig” i “Num. Empleats” respectivament. (0,5 punts)
SELECT TRUNC(AVG(salary), 0) AS "Salari mig", COUNT(*) AS "Num.Empleats"
FROM employees

*/
/* 3.	Mostra per cada treball (JOB_ID), la mitjana dels salaris. Mostra el nom del treball (JOB_TITLE) i ordena la informació per aquesta columna. (1 punt)
SELECT job_title, TRUNC(AVG(e.salary), 0) AS "Salari mig" 
FROM employees e
NATURAL JOIN jobs j
GROUP BY job_title
ORDER BY job_title
*/
/* 4.	Fes una consulta per calcular la diferència que hi  ha entre el salari major i el menor dels empleats (tots). Anomena la columna com a Diferencia. 
SELECT (MAX(salary)-MIN(salary)) AS DIFFERENCE 
FROM employees
*/

/* 5.	Mostra, per cada departament, el codi del departament i el salari de l’empleat pitjor pagat en aquest departament. Exclou els empleats  que no tinguin assignat departament i els departaments on l’empleat pitjor pagat cobri menys de 6000 € 
SELECT department_id, MIN(salary) AS "Salari Minim"
FROM employees 
GROUP BY department_id
HAVING MIN(salary) > 6000
ORDER BY department_id
*/

/* 6.	Quants clients te assignats cada encarregat (staff)? Ordena la informació per número de clients. 
SELECT s.staff_id, s.last_name, COUNT(customer_id)
FROM staff s
JOIN store st ON s.store_id = st.store_id
JOIN customer c ON c.store_id = st.store_id
GROUP BY s.staff_id
ORDER BY COUNT(customer_id) ASC

*/

/* 7.	Obté el número de lloguers realitzats cada mes. El mes ha de sortir amb el següent format: mm/yyyy (ex: 05/2005). Ordena la informació per mes/any. Haureu d’agafar el camp rental_period que es un interval. Per agafar el primer valor de l'interval, la data en que va ser llogada, podeu fer servir la funció lower(rental_period)(
SELECT TO_CHAR(lower(rental_period), 'MM/YYYY') AS "Mes i Any", 
COUNT(*) AS "Lloguers"
FROM rental
GROUP BY TO_CHAR(lower(rental_period), 'MM/YYYY')
ORDER BY TO_DATE(TO_CHAR(lower(rental_period), 'MM/YYYY'), 'MM/YYYY') ASC

*/

/* 8.	Quants actors diferents (ACTOR_ID) de la taula FILM_ACTOR tenim? Anomena la columna com a “Num d’actors”. 
SELECT COUNT(actor_id) AS "Num d'actors"
FROM actor

*/
/* 9.	Escriu una consulta per mostrar el nom de cada client,  la ciutat on viu el client, el  número de lloguers i el cost mig per tots els lloguers del client. Anomena les columnes com Nom, Ciutat, Num_Lloguers i Cost_Mig respectivament. Arrodoneix el cost mig a dos decimals. Ordena la informació per ciutat i nom de client. 
SELECT CONCAT(c.first_name,' ' ,c.last_name) AS Nom, ci.city AS Ciutat, TRUNC(AVG(p.amount), 2) AS "Cost Mig", COUNT(r.rental_id) AS "Nom Lloguers"
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN rental r ON c.customer_id = r.customer_id
JOIN payment p ON r.rental_id = p.rental_id
GROUP BY city, c.first_name, c.last_name
ORDER BY city, c.first_name

*/
/* 10.	Volem saber les pel·lícules que s’han llogat més de 30 vegades. Volem saber el títol de la pel·lícula, l’any de llançament, el cost de reposició (replacement_cost) expressat en un valor entre 0 i 1 amb un decimal (els possibles null s’han de mostrar com a 0), i el número de vegades que s’ha llogat. Ordena la informació per número de vegades que s’ha llogat de major a menor. 
SELECT f.title, f.release_year,
TRUNC(COALESCE(replacement_cost, 0) / MAX(COALESCE(replacement_cost, 0)) OVER (), 1), 
COUNT(rental_rate)
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title, f.release_year, replacement_cost
HAVING COUNT(rental_rate) > 30
ORDER BY COUNT(rental_rate) DESC

*/
/*
11.	Obtenir el codi d’empleat, nom i salari dels empleats que tenen el mateix salari que l'empleat 104. 
SELECT employee_id, first_name, salary
FROM employees
WHERE salary =
(SELECT salary
FROM employees
WHERE employee_id = 104)

*/

/* 12.	Obtenir el codi d’empleat, nom i salari dels empleats que tenen el mateix salari que l'empleat 104. Exclou l'empleat 104 del llistat. 
SELECT employee_id, first_name, salary
FROM employees
WHERE salary =
    (SELECT salary
    FROM employees
    WHERE employee_id = 104)
AND employee_id != 104

*/

/* 13.	Obté el codi empleat, nom i salari dels empleats que guanyen més que la mitjana del salari dels empleats. Ordena la informació per salari. 
SELECT employee_id, first_name, salary
FROM employees
WHERE salary >
    (SELECT AVG(salary)
    FROM employees)

*/
/* 14.	Tinc empleats del departament 9 que van ser contractat abans QUE TOTS els empleat del departament 6? Mostra els cognoms i la data de contractació. 
SELECT e.last_name, e.hire_date
FROM employees e
JOIN departments d 
ON e.department_id = d.department_id
WHERE e.department_id = 9 AND e.hire_date > 
    (SELECT MIN(hire_date)
    FROM employees
    WHERE department_id = 6)

*/

/* 15.	Obtenir l’identificador de pel·lícula, el títol i la durada del lloguer, de les pel·lícules que tenen el preu de lloguer més alt
*/
SELECT f.film_id, f.title, f.rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN (
    SELECT rental_id
    FROM rental
    WHERE rental_rate = (
        SELECT MAX(rental_rate)
        FROM rental
    )
) subquery ON r.rental_id = subquery.rental_id

SELECT emp.employee_id, emp.first_name, emp.salary
FROM employees emp
WHERE emp.salary = ANY(
    SELECT emp.salary FROM employees emp WHERE emp.employee_id = 104
)



SELECT employee_id, first_name, salary
FROM employees
WHERE salary = (
    SELECT salary
    FROM employees
    WHERE employee_id = 104
)
AND employee_id != 104

SELECT employee_id, first_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
)

SELECT e.last_name, e.hire_date
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id = 9 AND e.hire_date < (
    SELECT MIN(hire_date)
    FROM employees
    WHERE department_id = 6
)


SELECT f.film_id, f.title, f.rental_duration
FROM film f
JOIN inventory i ON f.film_id = i.film_id
JOIN rental r ON i.inventory_id = r.inventory_id
JOIN (
    SELECT rental_id
    FROM rental
    WHERE pay.amount = (
        SELECT MAX(payment.amount)
        FROM payment
    )
) subquery ON r.rental_id = subquery.rental_id

SELECT st.staff_id, st.last_name, COUNT(c.customer_id)
AS "Num. Clients"
FROM staff st
JOIN store s ON st.store_id = s.store_id
JOIN customer c ON c.store_id = s.store_id
GROUP BY st.staff_id, st.last_name
ORDER BY COUNT(c.customer_id) ASC;
-- 15
SELECT film_id, title, rental_duration
FROM film 
WHERE rental_rate = (SELECT MAX(rental_rate) FROM film)


-- 16
SELECT 
    CASE 
        WHEN EXTRACT(QUARTER FROM lower(rental_period)) = 1 THEN '1st Quarter'
        WHEN EXTRACT(QUARTER FROM lower(rental_period)) = 2 THEN '2nd Quarter'
        WHEN EXTRACT(QUARTER FROM lower(rental_period)) = 3 THEN '3rd Quarter'
        WHEN EXTRACT(QUARTER FROM lower(rental_period)) = 4 THEN '4th Quarter'
    END AS Quarter,
    COUNT(*) AS Total_Rentals
FROM rental
WHERE EXTRACT(YEAR FROM upper(rental_period)) = 2005
GROUP BY Quarter
UNION ALL
SELECT 'Total' AS Quarter, COUNT(*) AS Total_Rentals
FROM rental
WHERE EXTRACT(YEAR FROM upper(rental_period)) = 2005
GROUP BY Quarter
ORDER BY Quarter;

select rental_period
from rental
where EXTRACT(YEAR FROM lower(rental_period)) = 2005


--16.	Volem saber les pel·lícules (títol i nom de la categoria) de la categoria Drama que tenen un cost de substitució (replacement_cost) menor que alguna de les pel·lícules de la categoria “Classics”. (Utilitza l’operador ANY) 
SELECT mov.title, cat.name
FROM film mov
JOIN film_category fc ON mov.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Drama' AND mov.replacement_cost < ANY(
    SELECT mov2.replacement_cost
    FROM film mov2
    JOIN film_category fc2 ON mov2.film_id = fc2.film_id
    JOIN category cat2 ON fc2.category_id = cat2.category_id
    WHERE cat2.name = 'Classics'
)


SELECT mov.title, cat.name
FROM film mov
JOIN film_category fc ON mov.film_id = fc.film_id
JOIN category cat ON fc.category_id = cat.category_id
WHERE cat.name = 'Drama' 
AND NOT EXISTS (
    SELECT 1
    FROM film mov2
    JOIN film_category fc2 ON mov2.film_id = fc2.film_id
    JOIN category cat2 ON fc2.category_id = cat2.category_id
    WHERE cat2.name = 'Classics' AND mov2.replacement_cost <= mov.replacement_cost
)



SELECT i.inventory_id, f.title
FROM inventory i
JOIN film f ON i.film_id = f.film_id
WHERE i.inventory_id NOT IN (
    SELECT r.inventory_id
    FROM rental r
)

SELECT DISTINCT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS full_name
FROM actor a
JOIN film_actor fa ON a.actor_id = fa.actor_id
JOIN film f ON fa.film_id = f.film_id
WHERE f.replacement_cost = 9.99


SELECT f.title, c.name, f.replacement_cost
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
WHERE c.name = 'Drama' AND 
f.replacement_cost < ANY (
    SELECT f.replacement_cost
    FROM film f
    JOIN film_category fc ON f.film_id = fc.film_id
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = 'Classics'
    );

SELECT * FROM crosstab(
  'SELECT EXTRACT(QUARTER FROM rental_date)::integer, COUNT(*)
   FROM rental
   WHERE EXTRACT(YEAR FROM rental_date) = 2005
   GROUP BY 1
   ORDER BY 1',
  'SELECT generate_series(1,4)'
) AS ct ("Quarter" integer, "1st Quarter" integer, "2nd Quarter" integer, "3rd Quarter" integer, "4th Quarter" integer);

SELECT COUNT(*) AS "Total Rentals"
FROM rental
WHERE EXTRACT(YEAR FROM lower(rental_period)) = 2005;