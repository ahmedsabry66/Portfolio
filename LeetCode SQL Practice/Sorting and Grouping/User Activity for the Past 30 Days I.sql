-- This query calculates the number of active users for each day within a 30-day period ending on '2019-07-27'.

SELECT
    activity_date AS day, -- Selects the activity_date as day
    COUNT(DISTINCT user_id) AS active_users -- Counts the distinct user_ids as active_users
FROM
    Activity
WHERE
    activity_date <= '2019-07-27' -- Filters activity dates that are on or before '2019-07-27'
    AND activity_date > DATEADD(DAY, -30, '2019-07-27') -- Filters activity dates that are after 30 days before '2019-07-27'
GROUP BY
    activity_date; -- Groups the results by activity_date
