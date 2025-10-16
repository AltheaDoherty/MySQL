/*-- Question 1
SELECT *
FROM privileges;
-- returns 1 row  */
/*-- Question 2
SELECT *
FROM employees AS emp
JOIN privileges AS p
ON emp.id = p.employeeID; */

-- Question 3
SELECT *
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.id IS NULL;
-- 48

-- Question 4
SELECT DISTINCT c.id, c.company, c.last_name
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id
WHERE o.id IS NOT NULL;
-- 15

-- Question 5
SELECT DISTINCT c.id, c.company, c.last_name
FROM customers AS c
LEFT JOIN orders AS o
ON c.id = o.customer_id;
-- 29

-- Question 6
SELECT DISTINCT c.id, c.company, c.last_name
FROM customers AS c
LEFT JOIN orders AS o
	ON c.id = o.customer_id
WHERE o.id IS NULL;

-- Question 7
SELECT DISTINCT c.id, c.company, c.first_name, c.last_name, p.category
FROM customers AS c
LEFT JOIN orders AS o 
	ON c.id = o.customer_id
LEFT JOIN products AS p 
	ON o.id = p.id
WHERE p.category = 'Pasta' OR p.category = 'Sauces';
-- 4

-- Question 8
SELECT order_date, shipped_date
FROM orders;

-- Question 9
SELECT order_date, shipped_date
FROM orders
WHERE order_date BETWEEN '2006-04-01' AND '2006-04-30';

-- Question 10
SELECT o.order_date, o.shipped_date, o.paid_date
FROM orders AS o
LEFT JOIN orders_status AS os
	ON o.id = os.id
WHERE o.paid_date IS NULL;

-- Question 11
SELECT DISTINCT p.id, p.product_name, p.category
FROM products AS p
LEFT JOIN orders AS o
ON o.customer_ID = p.id
