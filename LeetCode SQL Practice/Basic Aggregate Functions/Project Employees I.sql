-- This query calculates the average experience years of employees assigned to each project.

SELECT pro.project_id, ROUND(AVG(emp.experience_years * 1.0), 2) AS average_years -- Selects project_id and calculates the average experience years, rounding to 2 decimal places
FROM Project pro -- Specifies the Project table as pro
JOIN Employee emp ON pro.employee_id = emp.employee_id -- Joins with the Employee table based on employee_id
GROUP BY pro.project_id; -- Groups the results by project_id
