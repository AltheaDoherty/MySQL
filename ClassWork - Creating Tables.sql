-- creating the catergory table (2 field table)
CREATE TABLE Category
(
categoryID INT PRIMARY KEY auto_increment,
categoryName varchar(50) NOT NULL
);

-- list of product catergories
SELECT DISTINCT category FROM products;

-- insert catergories into new table
INSERT INTO category (categoryName)
(SELECT DISTINCT category FROM products);

-- verifying table output
SELECT * FROM category;
DESCRIBE category;

-- rename the columns
ALTER TABLE products RENAME COLUMN category TO categoryID;

-- update products with category product keys
UPDATE products p SET p.categoryID =
(SELECT c.categoryID FROM category c
WHERE c.categoryName = p.categoryID);

-- verifying
SELECT * FROM products;

-- change data type of catergory ID in products
ALTER TABLE products modify column categoryID INT;

-- create foreign key constraint from catergory to products
ALTER TABLE products
ADD constraint fk_category
foreign key (categoryID) references category (categoryID);

