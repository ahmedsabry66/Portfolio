-- This query selects user IDs and modifies the name column to capitalize the first letter while keeping the rest in lowercase.

SELECT
    user_id, -- Selects the user_id column
    CONCAT( -- Concatenates strings to form the modified name
        UPPER(SUBSTRING(name, 1, 1)), -- Converts the first letter of the name to uppercase
        LOWER(SUBSTRING(name, 2, LEN(name))) -- Converts the rest of the name to lowercase
    ) AS name -- Aliases the modified name as "name"
FROM
    Users -- Specifies the Users table
ORDER BY
    user_id; -- Orders the results by user_id
