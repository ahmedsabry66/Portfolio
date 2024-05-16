-- This query retrieves the count of distinct products sold on each sell_date along with a comma-separated list of the products.

SELECT
    sell_date, -- Selects the sell_date column
    COUNT(DISTINCT product) AS num_sold, -- Counts the distinct products sold on each sell_date
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products -- Concatenates the distinct products into a comma-separated list
FROM
    (SELECT DISTINCT sell_date, product FROM Activities) AS Subquery -- Subquery to select distinct sell_date and product pairs
GROUP BY
    sell_date -- Groups the results by sell_date
ORDER BY
    sell_date; -- Orders the results by sell_date

