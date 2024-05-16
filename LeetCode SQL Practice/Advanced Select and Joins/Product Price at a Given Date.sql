-- This query retrieves the latest price change for each product before or on a specified date.

WITH CTE AS (
    SELECT
        RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rank_col, -- Assigns a rank to each row within the partition based on the change_date in descending order
        p.product_id, -- Selects the product_id column
        p.new_price -- Selects the new_price column
    FROM
        Products p -- Specifies the Products table alias as 'p'
    WHERE
        p.change_date <= '2019-08-16' -- Filters rows where the change_date is before or on '2019-08-16'
)
SELECT DISTINCT
    ISNULL(CTE.product_id, p.product_id) AS product_id, -- Retrieves the product_id from the CTE or Products table
    ISNULL(CTE.new_price, 10) AS price -- Retrieves the new_price from the CTE or sets it to 10 if NULL
FROM
    CTE -- Specifies the CTE
RIGHT JOIN
    Products p ON p.product_id = CTE.product_id -- Performs a right join between the CTE and Products table based on product_id
WHERE
    rank_col = 1 OR rank_col IS NULL; -- Filters rows where the rank is 1 or NULL
