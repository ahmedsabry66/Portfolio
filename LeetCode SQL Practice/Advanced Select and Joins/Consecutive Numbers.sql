-- This query identifies consecutive numbers in the "num" column of the "Logs" table.

-- Common Table Expression (CTE) to generate consecutive groups of numbers
WITH consecutive_groups AS (
  SELECT
    num,
    LAG(num) OVER (ORDER BY id) AS prev_num, -- Retrieves the previous number in the sequence
    LEAD(num) OVER (ORDER BY id) AS next_num  -- Retrieves the next number in the sequence
  FROM Logs -- Specifies the Logs table
)

-- Main query to select consecutive numbers
SELECT num AS ConsecutiveNums
FROM consecutive_groups -- Selects from the consecutive_groups CTE
WHERE num = prev_num AND num = next_num -- Filters rows where the number is equal to the previous and next number
GROUP BY num -- Groups the results by the consecutive numbers

