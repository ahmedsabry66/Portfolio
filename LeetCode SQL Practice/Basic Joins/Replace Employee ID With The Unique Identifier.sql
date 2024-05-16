-- This query retrieves the unique ID and name of employees from the Employees table, including those who have corresponding entries in the EmployeeUNI table.

SELECT emp_u.unique_id AS unique_id, emp.name -- Selects unique ID and name
FROM EmployeeUNI emp_u
RIGHT JOIN Employees emp ON emp.id = emp_u.id; -- Right join to include all employees from the Employees table, even if they don't have a matching entry in the EmployeeUNI table
