-- Exam 3 Subqueries and Summary Queries - Althea Doherty

-- USE AP DATABASE
-- 1 
SELECT vendor_name, COUNT(*) AS "Invoice Count", 
SUM(invoice_total) AS "Total Invoice"
FROM vendors AS v
INNER JOIN invoices AS i 
ON v.vendor_id = i.vendor_id
GROUP BY vendor_name;
-- 34 ROWS RETURNED

-- 2
SELECT gl.account_description, COUNT(li.invoice_id) AS "Item Count", 
SUM(li.line_item_amount) AS "Total Item Amount"
FROM general_ledger_accounts AS gl
INNER JOIN invoice_line_items AS li 
ON gl.account_number = li.account_number
GROUP BY gl.account_description
HAVING COUNT(li.invoice_id) > 1
ORDER BY SUM(li.line_item_amount) DESC;
-- 10 ROWS RETURNED

-- 3
SELECT v.vendor_name
FROM vendors AS v
WHERE vendor_id IN 
	(SELECT DISTINCT vendor_id
	FROM invoices)
ORDER BY vendor_name;
-- 34 ROWS RETURNED

-- 4
SELECT invoice_id, payment_total
FROM invoices
WHERE payment_total > 
	(SELECT AVG(payment_total)
    FROM invoices
    WHERE payment_total > 0);
-- 20 ROWS RETURNED

-- 5
SELECT gl.account_number, gl.account_description
FROM general_ledger_accounts AS gl
WHERE NOT EXISTS 
	(SELECT *
	FROM invoice_line_items AS li
	WHERE li.account_number = gl.account_number)
ORDER BY gl.account_number;
-- 54 ROWS RETURNED

---------------------------------------------------------------------------------
-- USE ClassicModels Database
-- 6 A
SELECT pl.productline, pl.textDescription
FROM productlines AS pl
LEFT OUTER JOIN products AS p 
ON pl.productline = p.productline
WHERE pl.productline IS NULL;
-- 0 ROWS RETURNED

-- 6 B
SELECT productline, textDescription
FROM productlines
WHERE productline NOT IN 
	(SELECT DISTINCT productline
	FROM products);
-- 0 ROWS RETURNED
-- 7
SELECT productName, CONCAT(FORMAT(MSRP/buyprice * 100,0), '%') AS "Mark Up"
FROM products
WHERE MSRP/buyprice * 100 >= 200
ORDER BY MSRP/buyprice;
-- 41 ROWS RETURNED

-- 8
SELECT pl.productline, pl.textDescription
FROM productlines AS pl
INNER JOIN products AS p
	ON pl.productline = p.productline
GROUP BY pl.productline, pl.textDescription
HAVING SUM(p.quantityInStock) < 20000;
-- TRAINS RETURNED

-- 9
SELECT pl.productline, pl.textDescription
FROM productlines AS pl
JOIN products AS p 
	ON pl.productline = p.productline
GROUP BY pl.productline, pl.textDescription
HAVING COUNT(p.productVendor) > 10;
-- 5 ROWS RETURNED

-- 10
SELECT c.customerName, c.contactLastName, c.contactFirstName, c.phone, py.checkNumber, py.paymentDate
FROM customers AS c
JOIN payments AS py 
ON c.customerNumber = py.customerNumber
WHERE py.amount > 
	(SELECT AVG(amount)
	FROM payments);
-- 134 ROWS RETURNED
