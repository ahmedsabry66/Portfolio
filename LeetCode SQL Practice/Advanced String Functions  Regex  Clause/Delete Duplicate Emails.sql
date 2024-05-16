-- This query deletes duplicate records from the Person table based on the email column.

DELETE P1 FROM Person P1 -- Specifies the Person table with an alias P1 for the rows to be deleted
JOIN Person P2 ON P1.email = P2.email -- Joins the Person table to itself based on the email column
    AND P1.id > P2.id; -- Ensures that only the record with the higher id is kept (avoiding self-join)

