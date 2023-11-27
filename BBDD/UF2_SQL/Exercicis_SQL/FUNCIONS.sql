-- AVG(sal)   //retorna la mitjana de salaris
--SUM(sal)    //retorna la suma de salaris
--COUNT(*)    //retorna el nombre de files
--COUNT(sal)  //retorna el nombre de files amb salari no nul
--MAX(sal)    //retorna el salari més alt
--MIN(sal)    //retorna el salari més baix

--ACTIVITAT 5

--1. 1.	Mostra el salari més alt, el més baix, la suma i la mitjana per tots els empleats. Anomena les columnes com a “Salari màxim”,  “Salari mínim”, Suma i Mitjana respectivament. Arrodoneix els resultats a l’enter més pròxim. 

SELECT MAX(salary) AS "Salari màxim", 
MIN(salary) AS "Salari mínim", 
SUM(salary) AS "Suma", 
ROUND(AVG(salary),0) AS "Mitjana" 
FROM employees;

--2 2.	Mostra la mitjana dels salaris i el número d’empleats que tenim. Arrodoneix la mitjana al número enter més pròxim i anomena les columnes com a “Salari mig” i “Num. Empleats” respectivament. 

SELECT ROUND(AVG(salary),0) AS "Salari mig", COUNT(*) AS "Num. Empleats" 
FROM employees;

--3 3.	Mostra per cada treball (JOB_ID), la mitjana dels salaris. Mostra el nom del treball (JOB_TITLE) i ordena la informació per aquesta columna. 

SELECT job_title, ROUND(AVG(salary),0) AS "Salari mig" 
FROM employees 
INNER JOIN jobs ON employees.job_id = jobs.job_id 
GROUP BY job_title 
ORDER BY job_title;

--4 4.	Fes una consulta per calcular la diferència que hi  ha entre el salari major i el menor dels empleats (tots). Anomena la columna com a Diferencia. 

SELECT MAX(salary) - MIN(salary) AS "Diferencia" 
FROM employees;

--5 5.	Mostra, per cada departament, el codi del departament i el salari de l’empleat pitjor pagat en aquest departament. Exclou els empleats  que no tinguin assignat departament i els departaments on l’empleat pitjor pagat cobri menys de 6000 € 

SELECT department_id, MIN(salary) AS "Salari mínim" 
FROM employees 
WHERE department_id IS NOT NULL 
GROUP BY department_id 
HAVING MIN(salary) >= 6000
ORDER BY department_id;

--6 6.	Quants clients te assignats cada encarregat (staff)? Ordena la informació per número de clients. 


SELECT st.staff_id, st.last_name, COUNT(cu.customer_id) AS "Num. Clients"
FROM staff st
INNER JOIN store s ON st.store_id = s.store_id
INNER JOIN customer cu ON s.store_id = cu.store_id
GROUP BY st.staff_id, st.last_name
ORDER BY COUNT(cu.customer_id) ASC;

--7 7.	Obté el número de lloguers realitzats cada mes. El mes ha de sortir amb el següent format: mm/yyyy (ex: 05/2005). Ordena la informació per mes/any. Haureu d’agafar el camp rental_period que es un interval. Per agafar el primer valor de l'interval, la data en que va ser llogada, podeu fer servir la funció lower(rental_period)

SELECT TO_CHAR(lower(rental_period), 'MM/YYYY') AS "Mes/Any", COUNT(*) AS "Nº Rental"
FROM rental
GROUP BY TO_CHAR(lower(rental_period), 'MM/YYYY')
ORDER BY TO_DATE(TO_CHAR(lower(rental_period), 'MM/YYYY'), 'MM/YYYY') ASC;

--8 
