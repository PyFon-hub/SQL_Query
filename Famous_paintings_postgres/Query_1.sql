-- Fetch all the paintings which are not displayed on any museums?

SELECT 
    * 
FROM 
    work
WHERE
    museum_id IS NOT NULL
-- DONE CORRECT