-- This query retrieves the sum of units sold for each product in February 2020 and filters the results to include only those products where the sum of units sold is greater than or equal to 100.

-- Common Table Expression (CTE) to calculate the sum of units sold for each product in February 2020
WITH CTE AS (
    SELECT
        pro.product_name, -- Selects the product_name column
        SUM(ord.unit) AS unit -- Calculates the sum of units sold for each product
    FROM
        Products pro -- Specifies the Products table
    JOIN
        Orders ord ON pro.product_id = ord.product_id -- Joins with the Orders table based on product_id
                  AND ord.order_date LIKE '%2020-02%' -- Filters orders made in February 2020
    GROUP BY
        pro.product_name -- Groups the results by product_name
)

-- Main query to select data from the CTE where the sum of units sold is greater than or equal to 100
SELECT
    * -- Selects all columns
FROM
    CTE -- Specifies the CTE
WHERE
    unit >= 100; -- Filters out rows where the sum of units sold is less than 100
