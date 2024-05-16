-- This query calculates the average processing time for each machine based on start and end activities.

-- Common Table Expressions (CTEs) to filter start and end activities
WITH start_table AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'start'
),
end_table AS (
    SELECT *
    FROM Activity
    WHERE activity_type = 'end'
)

-- Main query to calculate processing time for each machine
SELECT start_table.machine_id, ROUND(AVG(end_table.timestamp - start_table.timestamp), 3) AS processing_time
FROM start_table
JOIN end_table ON end_table.machine_id = start_table.machine_id
GROUP BY start_table.machine_id;

