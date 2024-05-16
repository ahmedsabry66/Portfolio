-- This query retrieves the number of exams attended by each student for each subject.

SELECT std.student_id, std.student_name, sub.subject_name, COUNT(exm.subject_name) AS attended_exams -- Selects student_id, student_name, subject_name, and counts the number of attended exams
FROM Students std -- Specifies the Students table as std
CROSS JOIN Subjects sub -- Performs a cross join with the Subjects table to generate all combinations of students and subjects
LEFT JOIN Examinations exm -- Left join with the Examinations table to count the attended exams for each student and subject
    ON sub.subject_name = exm.subject_name AND std.student_id = exm.student_id -- Joins based on subject_name and student_id
GROUP BY std.student_id, std.student_name, sub.subject_name -- Groups the result by student_id, student_name, and subject_name
ORDER BY std.student_id, sub.subject_name; -- Orders the result by student_id and subject_name
