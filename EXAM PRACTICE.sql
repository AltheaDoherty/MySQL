
-- exam database - classic models

SELECT e.employeeNumber AS "empID", e.lastName AS "EMPLast", e.firstName AS "EMPFirst", e.jobTitle AS "EMPTitle",
m.employeeNumber AS "mgrID", m.lastName "MGRLast", m.firstName AS "MGRFirst", m.jobTitle AS "MGRTitle"
FROM employees AS e -- employee
LEFT JOIN employees AS m -- manager (see all people whether or not they report to someone)
	ON e.reportsto = m.employeeNumber; -- setting the reportsto to the employee number


SELECT *
FROM employees AS e
INNER JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
INNER JOIN orders AS o
	ON c.customerNumber = o.customerNumber;
    
    
SELECT o.orderDate, pm.amount, pm.paymentDate, o.status
FROM orders AS o 
JOIN customers AS c
	ON o.customerNumber = c.customerNumber
JOIN payments AS pm
	ON c.customerNumber = pm.customerNumber
WHERE pm.paymentDate BETWEEN "2003-01-06" AND "2003-01-31";


SELECT c.customerName AS "Store Name", CONCAT(e.firstName, " ", e.lastName) AS "Employee Name", o.orderDate
FROM employees AS e
INNER JOIN customers AS c
	ON e.employeeNumber = c.salesRepEmployeeNumber
INNER JOIN orders AS o
	ON c.customerNumber = o.customerNumber
INNER JOIN orderdetails AS od
	ON o.orderNumber = od.orderNumber
WHERE o.orderDate BETWEEN "2004-08-06" AND "2004-11-29";
-

-- view empty offices
SELECT e.employeeNumber, e.jobTitle, e.reportsTo
FROM offices AS off
RIGHT JOIN employees AS e
	ON off.officeCode = e.officeCode;

-- view empty offices
SELECT e.firstName, e.lastName, e.jobTitle, m.firstName, m.lastName, m.jobTitle
FROM employees AS e
JOIN employees AS m
	ON e.reportsto = m.employeeNumber;

-- left all employees regarless of manager -- 23 rows
-- right all managers regarless of employees - 39 rows
-- inner employees which have managers - 22 rows

SELECT o.orderDate, o.orderNumber, c.customerName, c.salesRepEmployeeNumber
FROM orders AS o
INNER JOIN customers AS c
	ON o.customerNumber = c.customerNumber
INNER JOIN employees AS e
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE c.salesRepEmployeeNumber = 1166;
-- 14

-- obtain all employees and offices including empty office/ office w/out employees
SELECT 
    e.firstName, e.lastName, off.officeCode
FROM
    employees AS e
        RIGHT JOIN
    offices AS off ON e.officeCode = off.officeCode;
-- 23

-- obtain list of all employees and customers by name, id, their role in the company
SELECT CONCAT(e.firstName, ' ', e.lastName) AS "Name", 'Employee' AS "Role", e.employeeNumber AS "ID"
FROM employees AS e
UNION
SELECT CONCAT(c.contactFirstName, ' ', c.contactLastName) AS "Name", 'Customer' AS "Role", c.customerNumber AS "ID"
FROM customers AS c;
-- 23

-- Employees with no orders
-- left join bc want all employees who have no fufilled an order
SELECT e.firstName, e.lastName, o.orderNumber
FROM employees AS e
LEFT JOIN customers AS c 
	ON e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders AS o 
ON c.customerNumber = o.customerNumber
WHERE o.orderNumber IS NULL;
-- 

-- Customers without a sales rep
-- left join bc all customers where they do not have a sales rep
SELECT c.customerName, c.contactFirstName, c.contactLastName, e.employeeNumber
FROM customers AS c
LEFT JOIN employees AS e 
	ON c.salesRepEmployeeNumber = e.employeeNumber
WHERE e.employeeNumber IS NULL;

SELECT o.orderNumber, o.status, c.customerName
FROM orders AS o
INNER JOIN customers AS c ON o.customerNumber = c.customerNumber
WHERE o.status = 'Shipped'
UNION
SELECT o.orderNumber, o.status, c.customerName
FROM orders AS o
INNER JOIN customers AS c ON o.customerNumber = c.customerNumber
WHERE o.status = 'On Hold';
-- all orders sorted by status

SELECT c.customerName, o.orderNumber, o.orderDate
FROM customers AS c
LEFT JOIN orders AS o 
	ON c.customerNumber = o.customerNumber;
-- all customers who have placed an order

SELECT CONCAT(e.firstName, ' ', e.lastName) AS "EmployeeName", p.productName
FROM employees AS e
RIGHT JOIN orderdetails AS od ON e.employeeNumber = od.salesRepEmployeeNumber
RIGHT JOIN products AS p ON od.productCode = p.productCode;
-- all products regardless if an employee has sold them
