-- All vendors and invoices but only those who have vendors
/* SELECT *
FROM vendors AS v
JOIN invoices AS i
ON v.vendor_id = i.vendor_id; */

-- All vendors regardless of invoices
/* SELECT *
FROM vendors AS v
LEFT JOIN invoices AS i
ON v.vendor_id = i.vendor_id; */

-- All vendors regarless of invoices equals null
/* SELECT *
FROM vendors AS v
LEFT JOIN invoices AS i
ON v.vendor_id = i.vendor_id
WHERE i.vendor_id IS NULL; */

-- All invoices regardless of vendors (same as inner join result)
SELECT *
FROM vendors AS v
RIGHT JOIN invoices AS i
ON v.vendor_id = i.vendor_id
WHERE v.vendor_id IS NULL;