-- This query calculates the sum of the 2016 Total Insured Value (tiv_2016) for insurance policies meeting certain conditions.

SELECT
    ROUND(SUM(tiv_2016), 2) AS tiv_2016 -- Calculates the rounded sum of the 2016 Total Insured Value
FROM
(
    SELECT
        pid, -- Selects the policy ID
        tiv_2016, -- Selects the 2016 Total Insured Value
        CASE WHEN COUNT(lat_lon) OVER (PARTITION BY lat_lon) = 1 THEN lat_lon END AS lat_lon, -- Checks if there is only one distinct latitude-longitude pair
        CASE WHEN COUNT(tiv_2015) OVER (PARTITION BY tiv_2015) > 1 THEN tiv_2015 END AS tiv_2015 -- Checks if the 2015 Total Insured Value occurs more than once
    FROM
    (
        SELECT
            pid, -- Selects the policy ID
            tiv_2015, -- Selects the 2015 Total Insured Value
            tiv_2016, -- Selects the 2016 Total Insured Value
            CONCAT(lat, ', ', lon) AS lat_lon -- Combines latitude and longitude into a single column
        FROM
            Insurance ins -- Specifies the Insurance table alias as 'ins'
    ) ins1 -- Specifies the first level subquery alias as 'ins1'
) ins2 -- Specifies the second level subquery alias as 'ins2'
WHERE
    lat_lon IS NOT NULL -- Filters out rows where lat_lon is not available
    AND tiv_2015 IS NOT NULL; -- Filters out rows where tiv_2015 is not available
