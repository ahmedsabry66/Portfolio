-- This query calculates the percentage of immediate deliveries for customers, based on their first order and preferred delivery date.

-- Common Table Expression (CTE) to find the first order date for each customer
WITH t1 AS (
    SELECT customer_id, MIN(order_date) AS 'first_order' -- Finds the minimum order date for each customer
    FROM Delivery
    GROUP BY customer_id
)

-- Main query to calculate the percentage of immediate deliveries
SELECT ROUND(COUNT(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 END) * 1.0 / COUNT(*) * 100, 2) AS immediate_percentage -- Calculates the percentage of immediate deliveries
FROM t1
JOIN Delivery d ON t1.customer_id = d.customer_id AND t1.first_order = d.order_date; -- Joins with Delivery table based on customer_id and first_order date
