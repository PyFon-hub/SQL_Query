-- 10) Identify the museums which are open on both Sunday and Monday. Display museum name, city. --
select m.name, m.city, m.state, m.country
from museum m
    join (
        select mh.museum_id
        from museum_hours mh
        inner join (select museum_id from museum_hours where day = 'Monday') as mh2
        on mh.museum_id = mh2.museum_id
        where day = 'Sunday'
    ) mh3
    on m.museum_id = mh3.museum_id

