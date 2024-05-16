-- This query evaluates whether the given set of three sides (x, y, z) form a valid triangle.

SELECT
    x, -- Selects the x column from the Triangle table
    y, -- Selects the y column from the Triangle table
    z, -- Selects the z column from the Triangle table
    CASE
        WHEN (x+y) > z AND (x+z) > y AND (y+z) > x THEN 'Yes' -- Checks if the sum of any two sides is greater than the third side for all combinations
        ELSE 'No' -- If the conditions for a valid triangle are not met, assigns 'No'
    END AS triangle -- Assigns the result of the CASE statement to the alias 'triangle'
FROM
    Triangle; -- Specifies the Triangle table
