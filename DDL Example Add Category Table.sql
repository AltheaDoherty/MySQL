create table category
(
categoryID INT primary key auto_increment,
categoryName varchar(50) not null
);

select distinct category from products;

-- get this list of categories into our new table. Need Insert statement
insert into category (categoryName) 
(select distinct category from products);

-- verify
select * from category;

-- rename your column
alter table products rename column category to categoryID;

-- verify
select * from products;

-- column name is changed, but I need it to be INT to make the foreign key connection
-- can't do that yet because we still have words in that field. 
-- So, we have to update the products tables to the new categoryID from the category table
update products p set p.categoryID = (select c.categoryID from category c where c.categoryName = p.categoryID);

-- verify
select * from products;

-- Now we see that our categories have been updated. Next, reset the categoryID field in products to an INT data type
alter table products modify column categoryID INT;

-- now that the data type will match that of the primary key in the category table, we can create the foreign key constraint
alter table products
ADD CONSTRAINT fk_category
  FOREIGN KEY (categoryID) REFERENCES category (categoryid);


