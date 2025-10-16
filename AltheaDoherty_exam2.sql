-- Althea Doherty -- Exam #2

-- Question 1
SELECT c.customerNumber, c.customerName, CONCAT(c.contactFirstName, " " ,c.contactLastName) AS "Contact Name", 
CONCAT("$", FORMAT(c.creditLimit, 2)) AS "Credit Limit", pay.paymentDate, CONCAT("$", FORMAT(pay.amount, 2)) AS "Payment Amount"
FROM customers AS c
JOIN payments AS pay
	ON c.customerNumber = pay.customerNumber
WHERE pay.paymentDate BETWEEN "2004-01-01" AND "2004-12-31"
ORDER BY pay.paymentDate DESC;
-- 136 Rows Returned

-- Question 2
SELECT c.customerName, CONCAT(c.contactFirstName, " " ,c.contactLastName) AS "Contact Name", 
c.addressLine1, c.addressLine2,  c.city, c.state, c.postalCode, c.country,
o.orderDate, o.requiredDate, o.shippedDate, o.status
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customerNumber = o.customerNumber;
-- 350 Rows Returned

-- Question 3
SELECT c.customerName, CONCAT(c.contactFirstName, " " ,c.contactLastName) AS "Contact Name", 
c.addressLine1, c.addressLine2,  c.city, c.state, c.postalCode, c.country,
o.orderDate, o.requiredDate, o.shippedDate, o.status
FROM customers AS c
LEFT JOIN orders AS o
	ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;
-- 24 Rows Returned

-- Question 4
SELECT CONCAT("$", FORMAT(od.priceEach * od.quantityOrdered, 2)) AS "Total Order",
p.productCode, p.productName, p.productVendor, pl.productLine, p.quantityInStock, p.buyPrice
FROM orders AS o
JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
JOIN products AS p
	ON od.productCode = p.productCode
JOIN productlines AS pl
	ON p.productLine = pl.productLine
ORDER BY od.priceEach * od.quantityOrdered DESC
LIMIT 1;
-- The 2003 HarleyDavisdon Eagle Drag Bike in the Product Line Motorcycles is the most popular!

-- Question 5
SELECT o.orderDate, CONCAT("$", FORMAT(od.priceEach * od.quantityOrdered, 2)) AS "Total Order",
CONCAT('$', FORMAT((od.priceEach - p.buyPrice) * od.quantityOrdered, 2)) AS "Profit",
p.productCode, p.productName, p.productVendor, pl.productLine, p.quantityInStock, p.buyPrice
FROM orders AS o
JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
JOIN products AS p
	ON od.productCode = p.productCode
JOIN productlines AS pl
	ON p.productLine = pl.productLine
ORDER BY od.priceEach * od.quantityOrdered DESC
LIMIT 25;
-- 25 Rows Returned

-- Question 6
SELECT CONCAT(e.firstName, " ", e.lastName) AS "Employee Name", c.customerName AS "Company Name", off.city
FROM employees AS e
LEFT JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN offices AS off
	ON e.officeCode = off.officeCode
WHERE off.city = "Paris";
-- 30 employees assigned in the Paris Office.
-- Only 1 employee has not been assigned to a customer/company.

-- Question 7
SELECT pl.productLine, COUNT(p.productCode) AS "Number of Products"
FROM products AS p
JOIN productlines AS pl 
	ON p.productLine = pl.productLine
GROUP BY pl.productLine
ORDER BY pl.productLine;
-- Trains has the least number of products being 3.

-- Question 8
SELECT e.lastName AS "EMPLast", e.firstName AS "EMPFirst", e.jobTitle AS "EMPTitle", m.lastName "MGRLast", m.firstName AS "MGRFirst", m.jobTitle AS "MGRTitle"
FROM employees AS e -- employee
JOIN employees AS m -- manager
	ON e.reportsto = m.employeeNumber;
-- 22 Rows Returned
    
-- Question 9
SELECT CONCAT(e.firstName, " ", e.lastName) AS "Employee Name", c.customerName AS "Company Name", CONCAT(m.firstName, " ", m.lastName) AS "Manager Name", off.city
FROM employees AS e -- employee
LEFT JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN offices AS off
	ON e.officeCode = off.officeCode
JOIN employees AS m -- manager
	ON e.reportsto = m.employeeNumber
WHERE off.city = "Paris";
-- 30 Rows Returned

-- Question 10
SELECT CONCAT(e.firstName, " ", e.lastName) AS "Name",
NULL AS "AdressLine 1",
NULL AS "AddressLine 2",
NULL AS "City",
NULL AS "State",
NULL AS "Zip Code",
NULL AS "Country",
e.email AS "Email"
FROM employees AS e
UNION
SELECT CONCAT(c.contactFirstName, " ", c.contactLastName) AS "Name",
c.addressLine1,
c.addressLine2,
c.city,
c.state,
c.postalCode,
c.country,
NULL AS "email"
FROM customers AS c;
-- 145 Rows Returned