-- This query selects tweet IDs from the Tweets table
-- where the length of the tweet content is greater than 15 characters.

SELECT tweet_id -- Selects the tweet_id column from the Tweets table
FROM Tweets -- Specifies the Tweets table
WHERE LENGTH(content) > 15; -- Filters rows where the length of content is greater than 15 characters
