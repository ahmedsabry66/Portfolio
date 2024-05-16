-- This query selects records from the Patients table where the conditions column starts with 'DIAB1' or contains ' DIAB1'.

SELECT *
FROM Patients -- Selects all columns from the Patients table
WHERE
    CHARINDEX('DIAB1', conditions) = 1 -- Checks if 'DIAB1' is at the beginning of the conditions column
    OR CHARINDEX(' DIAB1', conditions) > 0 ; -- Checks if ' DIAB1' appears anywhere within the conditions column (with space before 'DIAB1')
