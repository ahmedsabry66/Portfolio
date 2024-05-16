-- This query attempts to create a subtable where each employee's department is identified.

WITH subtable AS (
    SELECT
        employee_id,
        CASE
            WHEN primary_flag = 'Y' THEN department_id
            WHEN COUNT(employee_id) OVER (PARTITION BY employee_id) = 1 THEN department_id
        END AS department_id -- Identifies the department_id based on conditions
    FROM
        Employee
)
SELECT
    * -- Selects all columns
FROM
    subtable -- Specifies the subtable
WHERE
    department_id IS NOT NULL; -- Filters out rows where department_id is not identified
