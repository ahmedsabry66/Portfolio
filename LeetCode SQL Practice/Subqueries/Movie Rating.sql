-- This query calculates the user with the highest count of movie ratings and the movie with the highest average rating in February 2020.

WITH t1 AS (
    SELECT
        Users.name, -- Selects the user's name
        COUNT(MovieRating.user_id) AS cnt, -- Counts the number of movie ratings for each user
        ROW_NUMBER() OVER (ORDER BY COUNT(MovieRating.user_id) DESC) AS rn -- Assigns a row number based on the descending count of movie ratings
    FROM
        MovieRating -- Specifies the MovieRating table
    JOIN
        Users ON MovieRating.user_id = Users.user_id -- Joins the MovieRating and Users tables based on the user_id
    GROUP BY
        Users.name -- Groups the results by the user's name
),
t2 AS (
    SELECT
        Movies.title, -- Selects the movie title
        ROUND(AVG(CAST(MovieRating.rating AS DECIMAL)), 1) AS avg_rating, -- Calculates the average rating for each movie and rounds it to one decimal place
        ROW_NUMBER() OVER (ORDER BY ROUND(AVG(CAST(MovieRating.rating AS DECIMAL)), 1) DESC) AS rn -- Assigns a row number based on the descending average rating
    FROM
        MovieRating -- Specifies the MovieRating table
    JOIN
        Movies ON Movies.movie_id = MovieRating.movie_id -- Joins the MovieRating and Movies tables based on the movie_id
    WHERE
        MovieRating.created_at BETWEEN '2020-02-01' AND '2020-02-29' -- Filters movie ratings created in February 2020
    GROUP BY
        Movies.title -- Groups the results by the movie title
)
-- Selects the user with the highest count of movie ratings and the movie with the highest average rating in February 2020
SELECT
    name AS results -- Selects the user's name as results from the first subquery
FROM
    t1 -- Specifies the first subquery alias as 't1'
WHERE
    rn = 1 -- Filters rows where the row number is 1, indicating the highest count of movie ratings
UNION ALL -- Combines the results with the UNION ALL operator (including duplicate rows)
SELECT
    title AS results -- Selects the movie title as results from the second subquery
FROM
    t2 -- Specifies the second subquery alias as 't2'
WHERE
    rn = 1; -- Filters rows where the row number is 1, indicating the highest average rating

