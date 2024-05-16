-- Selects the teacher_id and counts the number of distinct subject_ids associated with each teacher.
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt
FROM Teacher -- Specifies the Teacher table
GROUP BY teacher_id; -- Groups the results by teacher_id
