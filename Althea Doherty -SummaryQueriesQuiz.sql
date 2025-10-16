-- Summary Query Quiz - Althea Doherty

-- 1A
SELECT COUNT(*) AS TotalCustomers
FROM customers;
-- 1B
SELECT COUNT(*) AS TotalOrders
FROM orders;
-- 1C
SELECT COUNT(*) AS TotalOrderDetails
FROM orderdetails;

-- 1 ---------------------------
SELECT 
    (SELECT COUNT(*) FROM customers) AS TotalCustomers,
    (SELECT COUNT(*) FROM orders) AS TotalOrders,
    (SELECT COUNT(*) FROM orderdetails) AS TotalOrderDetails;

-- 2A
SELECT quantityOrdered * priceEach AS TotalOrder
FROM orderdetails;
-- 2B
SELECT SUM(priceEach*quantityOrdered) AS TotalOrder
FROM orderdetails AS od;
-- 2C
SELECT CONCAT("$",FORMAT(SUM(priceEach*quantityOrdered),2)) AS TotalOrder
FROM orderdetails AS od;

-- 3
SELECT CONCAT("$",FORMAT(SUM(priceEach*quantityOrdered),2)) AS TotalOrder, 
CONCAT("$",FORMAT(AVG(priceEach*quantityOrdered),2)) AS AverageOrder
FROM orderdetails AS od;

-- 4
SELECT p.productline, CONCAT("$",FORMAT(AVG(priceEach*quantityOrdered),2)) AS AverageOrder
FROM orderdetails AS od
JOIN products AS p
	ON od.productCode = p.productCode
GROUP BY p.productLine;

-- 5
SELECT p.productLine,
    CONCAT('$', FORMAT(AVG(p.buyPrice), 2)) AS AverageProductCost
FROM products AS p
GROUP BY p.productLine;

-- 6
SELECT od.orderNumber,
CONCAT('$', FORMAT(SUM(od.priceEach * od.quantityOrdered), 2)) AS TotalOrder,
CONCAT('$', FORMAT(AVG(od.priceEach * od.quantityOrdered), 2)) AS AverageOrder
FROM orderdetails AS od
GROUP BY od.orderNumber
ORDER BY od.orderNumber DESC;

-- 7
SELECT od.orderNumber, SUM(od.priceEach * od.quantityOrdered) AS TotalOrder,
 CONCAT('$', FORMAT(AVG(od.priceEach * od.quantityOrdered), 2)) AS AverageOrder
FROM orderdetails AS od
GROUP BY od.orderNumber
HAVING TotalOrder > 10000
ORDER BY od.orderNumber DESC;
