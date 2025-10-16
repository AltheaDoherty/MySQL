-- Question 1
SELECT CONCAT(c.first_name, ' ', c.last_name) AS FullName, c.email_address, c.home_phone, c.mobile_phone, 
o.notes, o.order_date, o.shipped_date, o.paid_date
FROM customers AS c
JOIN orders AS o 
ON c.id = o.customer_id
WHERE o.order_date BETWEEN '2006-05-01' AND '2006-05-31' AND o.shipped_date IS NULL;

-- Question 2
SELECT p.product_code, p.product_name, p.standard_cost, p.list_price, p.categoryID, od.quantity, od.unit_price
FROM products AS p
JOIN order_details AS od 
ON p.id = od.product_id
JOIN category AS cat 
ON p.categoryID = cat.categoryID
WHERE p.list_price > 20;

-- Question 3
SELECT p.product_code, p.product_name, p.standard_cost, p.list_price, cat.categoryID, od.quantity, od.unit_price, 
	FORMAT(od.quantity * od.unit_price, 2, 'en_US') AS "Total Price", 
	FORMAT((od.quantity * (od.unit_price - p.standard_cost)), 2, 'en_US') AS "Profit"
FROM products AS p
JOIN order_details AS od 
	ON p.id = od.product_id
JOIN category AS cat 
	ON p.categoryID = cat.categoryID
WHERE p.list_price > 20;

-- Question 4
SELECT p.product_code, p.product_name, p.standard_cost, p.list_price, cat.categoryID, 
od.quantity, od.unit_price, o.order_date, o.payment_type, o.paid_date,
	CONCAT('$', FORMAT(od.quantity * od.unit_price, 2, 'en_US')) AS "Total Price", 
	CONCAT('$', FORMAT((od.quantity * (od.unit_price - p.standard_cost)), 2, 'en_US')) AS "Profit"
FROM products AS p
JOIN order_details AS od 
	ON p.id = od.product_id
JOIN category AS cat 
	ON p.categoryID = cat.categoryID
JOIN orders AS o
	ON o.id = od.order_id
WHERE p.list_price > 20;

-- Question 5
SELECT CONCAT(cus.first_name, ' ', cus.last_name) AS CustomerName,
p.product_code, p.product_name, p.standard_cost, p.list_price, cat.categoryID, 
od.quantity, od.unit_price, o.order_date, o.payment_type, o.paid_date,
	CONCAT('$', FORMAT(od.quantity * od.unit_price, 2, 'en_US')) AS "Total Price", 
	CONCAT('$', FORMAT((od.quantity * (od.unit_price - p.standard_cost)), 2, 'en_US')) AS "Profit"
FROM products AS p
JOIN order_details AS od 
	ON p.id = od.product_id
JOIN category AS cat 
	ON p.categoryID = cat.categoryID
JOIN orders AS o
	ON o.id = od.order_id
JOIN customers AS cus 
	ON o.id = cus.id
WHERE p.list_price > 20;

-- Question 6
SELECT CONCAT(cus.first_name, ' ', cus.last_name) AS CustomerName,
CONCAT(emp.first_name, ' ', emp.last_name) AS EmployeeName,
p.product_code, p.product_name, p.standard_cost, p.list_price, cat.categoryID, 
od.quantity, od.unit_price, o.order_date, o.payment_type, o.paid_date,
	CONCAT('$', FORMAT(od.quantity * od.unit_price, 2, 'en_US')) AS "Total Price", 
	CONCAT('$', FORMAT((od.quantity * (od.unit_price - p.standard_cost)), 2, 'en_US')) AS "Profit"
FROM products AS p
JOIN order_details AS od 
	ON p.id = od.product_id
JOIN category AS cat 
	ON p.categoryID = cat.categoryID
JOIN orders AS o
	ON o.id = od.order_id
JOIN customers AS cus 
	ON o.id = cus.id
JOIN employees AS emp 
	ON o.id = emp.id
WHERE p.list_price > 20;