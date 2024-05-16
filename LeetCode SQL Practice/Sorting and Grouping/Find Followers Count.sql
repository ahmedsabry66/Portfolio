-- Selects the user_id and counts the number of followers for each user, ordered by user_id.
SELECT user_id, COUNT(follower_id) AS followers_count
FROM Followers -- Specifies the Followers table
GROUP BY user_id -- Groups the results by user_id
ORDER BY user_id; -- Orders the results by user_id
