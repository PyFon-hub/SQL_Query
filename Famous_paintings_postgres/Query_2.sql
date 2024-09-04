-- 2) Are there museuems without any paintings? --
SELECT 
    COUNT(*),
    museum.museum_id
FROM museum 
LEFT JOIN work 
    ON work.museum_id = museum.museum_id
GROUP BY
    museum.museum_id
HAVING
    COUNT(*) = 0
