-- This query retrieves the second-highest salary from the Employee table.

SELECT
    MAX(salary) AS SecondHighestSalary -- Selects the maximum salary as SecondHighestSalary
FROM
    Employee -- Specifies the Employee table
WHERE
    salary < (SELECT MAX(salary) FROM Employee); -- Filters salaries that are less than the maximum salary
