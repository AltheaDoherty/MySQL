-- Althea Doherty -- Subquery Quiz -- 11/15

-- 1
SELECT productLine, textDescription
FROM productlines AS pl
WHERE productLine NOT IN (
    SELECT productLine
    FROM products
);
-- 0 ROWS RETURNED

-- 2
SELECT pl.productLine, pl.textDescription
FROM productlines AS pl
WHERE pl.productLine IN 
	(SELECT p.productLine
    FROM products AS p
    GROUP BY p.productLine
    HAVING SUM(p.quantityInStock) < 400);
-- 0 ROWS RETURNED

-- 3
SELECT pl.productLine, pl.textDescription
FROM productlines AS pl
WHERE pl.productLine IN 
	(SELECT p.productLine
    FROM products AS p
    WHERE p.buyPrice > 
		(SELECT AVG(buyPrice)
		FROM products));
-- 7 ROWS RETURNED

-- 4
SELECT p.productLine, pl.textDescription, p.productName
FROM products AS p
JOIN productLines AS pl 
	ON p.productLine = pl.productLine
WHERE p.productVendor IN (
    SELECT productVendor
    FROM products
    GROUP BY productVendor
    HAVING COUNT(*) > 2
);
-- 110 ROWS RETURNED

-- 5
SELECT o.orderNumber, o.orderDate, o.requiredDate
FROM orders AS o
WHERE o.orderNumber IN (
    SELECT od.orderNumber
    FROM orderDetails AS od
    GROUP BY od.orderNumber
    HAVING COUNT(od.orderLineNumber) > 3
);
-- 273 ROWS RETURNED