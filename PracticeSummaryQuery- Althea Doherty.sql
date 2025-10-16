-- PRACTICE QUERY QUESTIONS - ALTHEA DOHERTY
-- Question 1A
SELECT COUNT(*)
FROM customers;

-- Question 1B
SELECT COUNT(*), status
FROM orders
GROUP BY status;

-- Question 1C
SELECT COUNT(*)
FROM orderdetails;

-- Question 2A
SELECT quantityOrdered*priceEach AS TotalOrder
FROM orderdetails;

-- Question 2B
SELECT SUM(quantityOrdered*priceEach) AS TotalOrder
FROM orderdetails;

-- Question 2C
SELECT CONCAT("$", FORMAT(SUM(quantityOrdered*priceEach),2)) AS TotalOrder
FROM orderdetails;

-- Question 3
SELECT CONCAT("$", FORMAT(SUM(quantityOrdered*priceEach),2)) AS TotalOrder,
CONCAT("$", FORMAT(AVG(quantityOrdered*priceEach),2)) AS AvgTotalOrder
FROM orderdetails;

-- Question 4
SELECT p.productLine,
CONCAT("$", FORMAT(SUM(quantityOrdered*priceEach),2)) AS TotalOrder,
CONCAT("$", FORMAT(AVG(od.quantityOrdered * od.priceEach), 2)) AS AvgTotalOrder
FROM orderdetails AS od
JOIN products AS p 
	ON od.productCode = p.productCode
GROUP BY p.productLine;

-- Question 5
SELECT pl.productLine, CONCAT("$", FORMAT(AVG(p.buyPrice),2)) AS AvgProductCost
FROM products AS p
JOIN productlines AS pl
	ON p.productLine = pl.productLine
GROUP BY pl.productLine;

-- Question 6
SELECT od.orderNumber,
CONCAT("$", FORMAT(SUM(quantityOrdered*priceEach),2)) AS TotalOrder,
CONCAT("$", FORMAT(AVG(od.quantityOrdered * od.priceEach), 2)) AS AvgTotalOrder
FROM orderdetails AS od
GROUP BY od.orderNumber
ORDER BY od.orderNumber DESC;

-- Question 7
SELECT od.orderNumber,
SUM(quantityOrdered*priceEach) AS TotalOrder,
CONCAT("$", FORMAT(AVG(od.quantityOrdered * od.priceEach), 2)) AS AvgTotalOrder
FROM orderdetails AS od
GROUP BY od.orderNumber
HAVING TotalOrder > 10000
ORDER BY od.orderNumber DESC;