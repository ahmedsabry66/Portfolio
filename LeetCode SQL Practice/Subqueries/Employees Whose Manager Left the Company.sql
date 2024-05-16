-- This query selects the employee IDs of employees who earn less than $30,000 and whose manager is not an employee in the company.

SELECT
    employee_id -- Selects the employee_id column
FROM
    Employees -- Specifies the Employees table
WHERE
    salary < 30000 -- Filters employees whose salary is less than $30,000
    AND manager_id NOT IN (SELECT employee_id FROM Employees) -- Filters employees whose manager_id is not present in the set of employee_ids
ORDER BY
    employee_id; -- Orders the result by employee_id
