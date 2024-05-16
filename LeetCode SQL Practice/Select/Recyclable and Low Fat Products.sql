-- This query selects product IDs from the Products table
-- where the product is labeled as low fat and recyclable.

SELECT product_id -- Selects the product_id column from the Products table
FROM Products -- Specifies the Products table
WHERE low_fats = "Y" -- Filters rows where low_fats column has value "Y"
AND recyclable = "Y"; -- Filters rows where recyclable column has value "Y"
