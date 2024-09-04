-- 8) Museum_Hours table has 1 invalid entry. Identify it and remove it.
    
-- Start with removing duplicate
Delete FROM museum_hours
WHERE ctid NOT IN (
    SELECT
        MIN(ctid)
    FROM
        museum_hours
    GROUP BY
        museum_id, day
)

-- Then look for errors in writing
SELECT *
FROM museum_hours
WHERE
    close::text NOT SIMILAR TO '__:__:(AM|PM)' OR
    open::text  NOT SIMILAR TO '__:__:(AM|PM)' OR
    day NOT IN ('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday')

-- Correcting mispell of Thusday to Thursday
UPDATE museum_hours
SET day = 'Thursday'
WHERE day LIKE 'Thu%'

-- Removing extra sapces
UPDATE museum_hours
SET close = REPLACE(close, ' ', '')
WHERE close::text NOT SIMILAR TO '__:__:(AM|PM)'