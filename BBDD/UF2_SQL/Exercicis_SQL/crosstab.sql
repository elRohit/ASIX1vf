SELECT 
    COUNT(CASE WHEN EXTRACT(MONTH FROM lower(rental_period)) BETWEEN 1 AND 3 THEN rental_id END) AS "1r_trimestre",
    COUNT(CASE WHEN EXTRACT(MONTH FROM lower(rental_period)) BETWEEN 4 AND 6 THEN rental_id END) AS "2n_trimestre",
    COUNT(CASE WHEN EXTRACT(MONTH FROM lower(rental_period)) BETWEEN 7 AND 9 THEN rental_id END) AS "3r_trimestre",
    COUNT(CASE WHEN EXTRACT(MONTH FROM lower(rental_period)) BETWEEN 10 AND 12 THEN rental_id END) AS "4t_trimestre",
    COUNT(rental_id) AS "Total de lloguers"
FROM rental
WHERE EXTRACT(YEAR FROM lower(rental_period)) = 2005
LIMIT 1;




