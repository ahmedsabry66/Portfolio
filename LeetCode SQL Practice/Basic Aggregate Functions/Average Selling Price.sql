-- This query calculates the average price per unit for each product based on sales data and prices.

-- Common Table Expression (CTE) to combine sales data and prices, and calculate total price per unit
WITH t1 AS (
    SELECT pr.product_id, pr.price, us.units, us.purchase_date,
           SUM(us.units) OVER (PARTITION BY pr.product_id) AS sum_units, -- Calculates the total units sold for each product
           pr.price * us.units AS total_price -- Calculates the total price for each sale
    FROM UnitsSold us
    RIGHT JOIN Prices pr ON pr.product_id = us.product_id -- Right join to include all prices, even if there are no sales
    WHERE us.purchase_date BETWEEN pr.start_date AND pr.end_date OR us.purchase_date IS NULL -- Filters sales data based on purchase date falling within the price validity period or where purchase date is missing
)

-- Main query to calculate the average price per unit for each product
SELECT product_id, COALESCE(ROUND((SUM(total_price) * 1.0 / sum_units), 2), 0) AS average_price -- Calculates the average price per unit and handles division by zero by returning 0
FROM t1
GROUP BY product_id, sum_units; -- Groups the results by product_id and sum_units

