-- This query counts the number of visits without transactions for each customer.

SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans -- Selects customer_id and counts the number of visits without transactions
FROM Transactions t
RIGHT JOIN Visits v ON v.visit_id = t.visit_id -- Right join to include all visits, even those without transactions
WHERE t.transaction_id IS NULL -- Filters rows where there is no transaction (NULL transaction_id)
GROUP BY 1 -- Groups the results by customer_id
ORDER BY 2 DESC; -- Orders the result by count_no_trans in descending order
