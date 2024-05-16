-- This query aggregates transaction data by month and country, including counts and totals.

SELECT
    FORMAT(trans_date, 'yyyy-MM') AS month, -- Formats the transaction date to display year and month
    country, -- Selects the country column
    COUNT(*) AS trans_count, -- Counts the total number of transactions
    COUNT(CASE WHEN state= 'approved' THEN 1 END) AS approved_count, -- Counts the number of approved transactions
    SUM(amount) AS trans_total_amount, -- Calculates the total amount of transactions
    ISNULL(SUM(CASE WHEN state= 'approved' THEN amount END), 0) AS approved_total_amount -- Calculates the total amount of approved transactions, handling NULL values
FROM Transactions -- Specifies the Transactions table
GROUP BY FORMAT(trans_date, 'yyyy-MM'), country; -- Groups the results by month and country
