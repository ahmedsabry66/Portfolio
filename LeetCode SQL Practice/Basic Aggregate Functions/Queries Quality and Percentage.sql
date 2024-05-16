-- This query calculates the quality and percentage of poor queries for each query name.

-- Common Table Expression (CTE) to calculate the ratio of rating to position and count of poor queries for each query name
WITH t1 AS (
  SELECT query_name,
         (rating * 1.0 / position) AS ratio, -- Calculates the ratio of rating to position
         (SELECT COUNT(*) FROM Queries q2 WHERE rating < 3 AND q2.query_name = Queries.query_name) AS poor_count, -- Counts the number of poor queries for each query name
         COUNT(query_name) OVER (PARTITION BY query_name) AS total_count -- Calculates the total count of queries for each query name
  FROM Queries
)

-- Main query to calculate the quality and percentage of poor queries for each query name
SELECT query_name,
       ROUND(SUM(ratio / total_count), 2) AS quality, -- Calculates the average quality for each query name
       ROUND(poor_count * 1.0 / total_count * 100, 2) AS poor_query_percentage -- Calculates the percentage of poor queries for each query name
FROM t1
GROUP BY query_name, poor_count, total_count; -- Groups the results by query_name, poor_count, and total_count
