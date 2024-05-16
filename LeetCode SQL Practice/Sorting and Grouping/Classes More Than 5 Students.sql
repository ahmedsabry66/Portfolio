-- This query retrieves the classes with at least 5 courses.

-- Selects the class column
SELECT class
FROM Courses
-- Groups the results by class
GROUP BY class
-- Filters out classes with less than 5 courses
HAVING COUNT(class) >= 5;
