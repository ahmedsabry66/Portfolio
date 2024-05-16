-- This query retrieves the maximum value among numbers that appear only once in the MyNumbers table.

-- Main query to find the maximum value from the subquery result
SELECT MAX(num) AS num
FROM (
    -- Subquery to select numbers that appear only once
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(num) = 1
) AS subquery;
