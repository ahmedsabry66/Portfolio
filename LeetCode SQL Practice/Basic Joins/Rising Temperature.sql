-- This query identifies the ids where the temperature increased compared to the previous day and the records are consecutive.

-- Common Table Expression (CTE) to identify records where temperature increased compared to the previous day and records are consecutive
WITH t1 AS (
  SELECT
    CASE
      -- Checks if the temperature increased compared to the previous day and if the records are consecutive
      WHEN LAG(temperature) OVER (ORDER BY recordDate) < temperature
           AND DATEDIFF(day, recordDate, LAG(recordDate) OVER (ORDER BY recordDate)) = -1 THEN id
    END AS id
  FROM Weather
)

-- Main query to select the ids where the conditions are met
SELECT id FROM t1
WHERE id IS NOT NULL; -- Filters out NULL ids, keeping only the ids where the conditions are met
