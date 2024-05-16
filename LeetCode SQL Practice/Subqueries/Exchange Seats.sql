-- This query assigns seats to students based on certain conditions.

SELECT
    id, -- Selects the id column
    CASE
        WHEN id = (SELECT MAX(id) FROM seat) AND (id % 2) != 0 THEN student -- Checks if it's the last seat and if it's odd, then assigns the student to this seat
        WHEN (id % 2) != 0 THEN LEAD(student) OVER (ORDER BY id) -- For odd seat numbers, assigns the next student in order
        WHEN (id % 2) = 0 THEN LAG(student) OVER (ORDER BY id) -- For even seat numbers, assigns the previous student in order
    END AS student -- Assigns the result to the column 'student'
FROM
    Seat; -- Specifies the Seat table
