-- This query calculates the percentage of registered users for each contest relative to the total number of users.

-- Common Table Expression (CTE) to count the number of users registered for each contest
WITH usr_count_table AS (
  SELECT reg.contest_id, COUNT(usr.user_id) AS usr_count
  FROM Users usr
  RIGHT JOIN Register reg
    ON usr.user_id = reg.user_id
  GROUP BY reg.contest_id
),

-- CTE to calculate the total number of users
total_users_table AS (
  SELECT COUNT(user_id) AS total_users FROM Users
)

-- Main query to calculate the percentage of registered users for each contest relative to the total number of users
SELECT contest_id, ROUND(((usr_count * 1.0 / total_users) * 100), 2) AS percentage
FROM usr_count_table
CROSS JOIN total_users_table -- Cross join to get the total_users value for each row
ORDER BY percentage DESC, contest_id; -- Orders the result by percentage in descending order and contest_id
