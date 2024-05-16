-- This query retrieves the names of employees and their bonuses, including those with bonuses less than 1000 or no bonus.

SELECT emp.name, bns.bonus -- Selects employee names and their bonuses
FROM Employee emp
FULL OUTER JOIN Bonus bns ON emp.empID = bns.empID -- Full outer join to include all employees and their bonuses, even if they don't have a matching entry in the Bonus table
WHERE bns.bonus < 1000 OR bns.bonus IS NULL; -- Filters rows where the bonus is less than 1000 or is NULL (employee has no bonus)
