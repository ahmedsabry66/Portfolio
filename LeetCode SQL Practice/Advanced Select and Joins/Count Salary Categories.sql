-- This query categorizes accounts based on income into three categories: 'Low Salary', 'Average Salary', and 'High Salary', and counts the number of accounts in each category.

-- Retrieves the count of accounts with income less than 20000 and labels them as 'Low Salary'
SELECT
    'Low Salary' AS category, -- Assigns the category label 'Low Salary'
    COUNT(*) AS accounts_count -- Counts the number of accounts in the 'Low Salary' category
FROM
    Accounts
WHERE
    income < 20000 -- Filters accounts with income less than 20000

-- Combines the results of the first query with the results of the next query
UNION

-- Retrieves the count of accounts with income between 20000 and 50000 and labels them as 'Average Salary'
SELECT
    'Average Salary' AS category, -- Assigns the category label 'Average Salary'
    COUNT(*) AS accounts_count -- Counts the number of accounts in the 'Average Salary' category
FROM
    Accounts
WHERE
    income BETWEEN 20000 AND 50000 -- Filters accounts with income between 20000 and 50000

-- Combines the results of the first two queries with the results of the last query
UNION

-- Retrieves the count of accounts with income greater than 50000 and labels them as 'High Salary'
SELECT
    'High Salary' AS category, -- Assigns the category label 'High Salary'
    COUNT(*) AS accounts_count -- Counts the number of accounts in the 'High Salary' category
FROM
    Accounts
WHERE
    income > 50000; -- Filters accounts with income greater than 50000









