-- This query selects the name of the person whose combined weight in the queue does not exceed 1000, starting from the last turn.

SELECT TOP 1 person_name -- Selects the name of the person
FROM (
    SELECT
        person_name, -- Selects the person_name column
        turn, -- Selects the turn column
        SUM(weight) OVER (ORDER BY Turn) AS total_weight -- Calculates the cumulative sum of weight up to each turn
    FROM
        Queue -- Specifies the Queue table
) AS Subquery -- Aliases the subquery as "Subquery"
WHERE
    total_weight <= 1000 -- Filters the rows where the total_weight is less than or equal to 1000
ORDER BY
    turn DESC; -- Orders the result by turn in descending order
