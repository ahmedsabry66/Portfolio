-- This query retrieves the top three highest-paid employees within each department along with their respective department names and salaries.

SELECT
    Department, -- Selects the department name
    Employee, -- Selects the employee name
    Salary -- Selects the salary
FROM
(
    SELECT
        DISTINCT emp.salary Salary, -- Selects the salary and removes duplicates
        dep.name Department, -- Selects the department name
        emp.name Employee, -- Selects the employee name
        DENSE_RANK() OVER (PARTITION BY dep.id ORDER BY emp.salary DESC) D_R -- Assigns dense ranks to employees within each department based on salary in descending order
    FROM
        Employee emp -- Specifies the Employee table alias as 'emp'
    JOIN
        Department dep ON emp.departmentId = dep.id -- Joins the Employee and Department tables based on departmentId
) subquery -- Specifies the subquery
WHERE
    D_R <= 3 -- Filters rows where the dense rank is less than or equal to 3, representing the top three highest-paid employees within each department
