-- This query selects users whose email addresses match specific patterns for the domain "leetcode.com".

SELECT *
FROM Users
WHERE
    mail LIKE '[A-Za-z]%@leetcode.com' -- Filters email addresses that start with a letter followed by '@leetcode.com'
    AND PATINDEX('%[^A-Za-z0-9_.-]%@leetcode.com', mail) = 0 -- Ensures that the email address contains only letters, digits, dots, underscores, or hyphens before '@leetcode.com'
