-- This query retrieves customer IDs that have purchased all products.

-- Selects the customer IDs
SELECT customer_id
FROM Customer
-- Groups the results by customer_id
GROUP BY customer_id
-- Filters out customers who have purchased all products
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(*) FROM Product);
