-- QUESTION 5 --
SELECT first_name, last_name, CONCAT(SUBSTRING(first_name, 1, 1), SUBSTRING(last_name, 1, 1)) AS initials
FROM employees;

-- QUESTION 6 --
SELECT id, last_name, first_name, job_title
FROM suppliers
WHERE job_title =! "Marketing Manager";

-- QUESTION 7 --
SELECT *
FROM suppliers
WHERE country_region IS NOT NULL;

-- QUESTION 8 --
SELECT * 
FROM orders
WHERE ship_country_region = 'France' OR 'Belgium';

-- QUESTION 9 --
SELECT *
FROM orders
WHERE ship_country_region IN ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

-- QUESTION 10 --
SELECT CONCAT(last_name, ', ', first_name) AS "Full Name",
job_title
FROM employees