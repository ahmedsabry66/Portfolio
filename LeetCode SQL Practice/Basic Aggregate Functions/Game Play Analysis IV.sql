-- This query calculates the fraction of players who logged in on consecutive days.

-- Common Table Expression (CTE) to calculate the difference in days between consecutive log events for each player
WITH t1 AS (
    SELECT DATEDIFF(day, MIN(event_date) OVER (PARTITION BY player_id ORDER BY event_date), event_date) AS logs_diff -- Calculates the difference in days between consecutive log events for each player
    , (SELECT COUNT(DISTINCT player_id) FROM Activity) AS players_count -- Subquery to count the total number of players
    FROM Activity
)

-- Main query to calculate the fraction of players who logged in on consecutive days
SELECT ROUND(COUNT(CASE WHEN logs_diff = 1 THEN 1 END) * 1.0 / players_count, 2) AS fraction -- Calculates the fraction of players who logged in on consecutive days, handling division by zero by returning 0
FROM t1
GROUP BY players_count; -- Groups the results by players_count
