-- This query calculates the confirmation rate for each user based on signups and confirmations.

-- Common Table Expression (CTE) to calculate counts of total actions and confirmed actions for each user
WITH t1 AS (
    SELECT sgn.user_id,
           COUNT(con.action) AS total_count, -- Counts total actions for each user
           COUNT(CASE WHEN con.action = 'confirmed' THEN 1 ELSE NULL END) AS confirmed_requests -- Counts confirmed actions for each user
    FROM Signups sgn
    LEFT JOIN Confirmations con ON sgn.user_id = con.user_id -- Left join to include all signups even if they don't have confirmations
    GROUP BY sgn.user_id -- Groups the results by user_id
)

-- Main query to calculate confirmation rate for each user
SELECT user_id,
       ROUND(COALESCE(confirmed_requests * 1.0 / NULLIF(total_count, 0), 0), 2) AS confirmation_rate
       -- Calculates confirmation rate as confirmed_requests divided by total_count, handles division by zero by returning 0
FROM t1 -- Uses the result of the CTE t1
