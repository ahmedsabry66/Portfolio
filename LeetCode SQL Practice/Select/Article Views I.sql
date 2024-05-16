-- This query selects distinct author IDs from the Views table
-- where the author ID matches the viewer ID

SELECT DISTINCT author_id AS id -- Selects distinct author IDs and aliases them as 'id'
FROM Views -- Specifies the Views table
WHERE author_id = viewer_id -- Filters rows where the author ID matches the viewer ID
ORDER BY author_id; -- Orders the result set by author ID in ascending order

