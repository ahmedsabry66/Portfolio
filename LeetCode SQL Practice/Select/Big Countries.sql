-- This query selects specific columns from the World table
-- where either the area is greater than or equal to 3,000,000 (sq km)
-- or the population is greater than or equal to 25,000,000.

SELECT name, population, area -- Selects columns for country name, population, and area
FROM World -- Specifies the World table
WHERE area >= 3000000 OR population >= 25000000; -- Filters rows where area is >= 3,000,000 sq km OR population is >= 25,000,000
