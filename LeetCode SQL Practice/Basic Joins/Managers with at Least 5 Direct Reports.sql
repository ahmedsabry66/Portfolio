-- This query retrieves the names of employees who are managers and have at least 5 direct reports.

-- Common Table Expression (CTE) to count the number of direct reports for each manager
WITH id_count AS (
    SELECT managerID, COUNT(managerID) AS count -- Counts the number of direct reports for each manager
    FROM Employee
    GROUP BY managerID -- Groups the results by managerID
)

-- Main query to select names of employees who are managers and have at least 5 direct reports
SELECT Employee.name -- Selects the name of employees
FROM id_count -- Uses the result of the CTE id_count
JOIN Employee ON id_count.managerID = Employee.id -- Joins with Employee table to get the names of managers
WHERE id_count.count >= 5 -- Filters managers who have at least 5 direct reports
