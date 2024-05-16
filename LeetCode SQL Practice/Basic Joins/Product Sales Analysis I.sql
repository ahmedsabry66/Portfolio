-- This query retrieves the product name, year, and price from the Sales table along with the corresponding product information.

SELECT p.product_name, s.year, s.price -- Selects product name, year, and price
FROM Sales s -- Specifies the Sales table as s
JOIN Product p ON p.product_id = s.product_id; -- Joins with the Product table to get the product name based on product_id
