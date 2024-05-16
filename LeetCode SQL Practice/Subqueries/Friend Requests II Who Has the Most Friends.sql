-- This query retrieves the ID with the highest count of occurrences in the combined list of requester IDs and accepter IDs from the RequestAccepted table.

SELECT TOP 1
    id, -- Selects the ID
    MAX(cnt) num -- Selects the maximum count of occurrences as 'num'
FROM
(
    SELECT
        id, -- Selects the ID
        COUNT(id) OVER (PARTITION BY id) cnt -- Counts the occurrences of each ID
    FROM
    (
        SELECT
            requester_id id -- Selects the requester_id and aliases it as 'id' in the subquery
        FROM
            RequestAccepted
        UNION ALL
        SELECT
            accepter_id id -- Selects the accepter_id and aliases it as 'id' in the subquery
        FROM
            RequestAccepted
    ) subquery -- Specifies the subquery
) t1 -- Specifies the outer query alias as 't1'
GROUP BY
    id -- Groups the results by ID
ORDER BY
    num DESC; -- Orders the results by the count of occurrences in descending order and selects the top 1 row



