-- This query selects the names of customers from the Customer table
-- where the referee_id is not equal to 2 or is NULL.

SELECT name -- Selects the name column from the Customer table
FROM Customer -- Specifies the Customer table
WHERE referee_id <> 2 OR referee_id IS NULL; -- Filters rows where referee_id is not equal to 2 or is NULL
