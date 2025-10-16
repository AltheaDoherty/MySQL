SELECT product_name, list_price, catergory_name
FROM products INNER JOIN catergory
ON category.categoryID = products.categoryID
