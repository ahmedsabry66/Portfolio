-- This query calculates the sum and average amount of customer transactions for a rolling 7-day period.

SELECT
    * -- Selects all columns
FROM
(
    SELECT
        visited_on, -- Selects the visited_on date
        CASE
            WHEN ROW_NUMBER() OVER (ORDER BY visited_on) >= 7 -- Checks if the row number is greater than or equal to 7
                THEN SUM(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW) -- Calculates the sum of amounts for the rolling 7-day period
            ELSE NULL -- Returns NULL if the condition is not met
        END AS amount, -- Assigns the calculated sum to the 'amount' column
        CASE
            WHEN ROW_NUMBER() OVER (ORDER BY visited_on) >= 7 -- Checks if the row number is greater than or equal to 7
                THEN ROUND(AVG(amount) OVER (ORDER BY visited_on RANGE BETWEEN INTERVAL '6' DAY PRECEDING AND CURRENT ROW), 2) -- Calculates the average of amounts for the rolling 7-day period and rounds it to 2 decimal places
            ELSE NULL -- Returns NULL if the condition is not met
        END AS average_amount -- Assigns the calculated average to the 'average_amount' column
    FROM
    (
        SELECT
            visited_on, -- Selects the visited_on date
            SUM(amount) AS amount -- Calculates the sum of amounts for each visited_on date
        FROM
            Customer -- Specifies the Customer table
        GROUP BY
            visited_on -- Groups the results by visited_on date
    ) AS t1 -- Specifies the subquery alias as 't1'
    ORDER BY
        visited_on DESC -- Orders the results by visited_on date in descending order
) AS t2 -- Specifies the outer subquery alias as 't2'
WHERE
    amount IS NOT NULL -- Filters out NULL values in the 'amount' column
ORDER BY
    visited_on; -- Orders the final results by visited_on date
