-- This query retrieves information about employees who have subordinates, including the number of reports each employee has and the average age of their subordinates.

SELECT
    e1.employee_id, -- Selects the employee_id column from the first employee table
    e1.name, -- Selects the name column from the first employee table
    COUNT(e2.reports_to) AS reports_count, -- Counts the number of reports each employee has by counting non-null values of reports_to in the second employee table
    ROUND(AVG(e2.age)) AS average_age -- Calculates the average age of subordinates in the second employee table
FROM
    Employees e1 -- Specifies the first instance of the Employees table alias as 'e1'
JOIN
    Employees e2 ON e1.employee_id = e2.reports_to -- Joins the first and second instances of the Employees table based on the employee_id and reports_to relationship
GROUP BY
    e1.employee_id -- Groups the results by the employee_id of the first employee
ORDER BY
    e1.employee_id; -- Orders the results by the employee_id of the first employee
