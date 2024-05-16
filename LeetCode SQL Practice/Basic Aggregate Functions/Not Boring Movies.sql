-- This query retrieves data from the Cinema table for odd numbered ids and descriptions that are not 'boring', ordered by rating in descending order.

SELECT *
FROM Cinema -- Specifies the Cinema table
WHERE id % 2 = 1 -- Filters rows where the id is odd
  AND description <> 'boring' -- Filters rows where the description is not 'boring'
ORDER BY rating DESC; -- Orders the result by rating in descending order
