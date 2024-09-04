-- 7) Identify the museums with invalid city information in the given dataset --
SELECT 
    DISTINCT city as cities
FROM museum
WHERE
    city ~'.[0-9]'
ORDER BY 
    cities
