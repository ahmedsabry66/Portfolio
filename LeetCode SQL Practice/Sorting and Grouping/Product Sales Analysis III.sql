-- This query selects the first year, quantity, and price for each product.

-- Common Table Expression (CTE) to select the first year, quantity, and price for each product
WITH subtable AS (
    SELECT
        CASE WHEN year = MIN(year) OVER (PARTITION BY product_id) THEN product_id END AS product_id, -- Selects the product_id if it matches the minimum year for the product_id
        year AS first_year, -- Selects the year as the first_year
        quantity, -- Selects the quantity
        price -- Selects the price
    FROM Sales
    GROUP BY product_id, year, quantity, price -- Groups the results by product_id, year, quantity, and price
)

-- Main query to select data from the subtable where product_id is not NULL
SELECT * FROM subtable
WHERE product_id IS NOT NULL; -- Filters out NULL product_ids
