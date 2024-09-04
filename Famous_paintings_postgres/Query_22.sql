-- 22) Which artist has the most no of Portraits paintings outside USA?. Display artist name, no of paintings and the artist nationality.

select *
from 
(
    select a.full_name, a.nationality, count(1) as no_of_paintings, rank() over(order by count(1) DESC) as rnk
    from work w
    join museum m
    on w.museum_id = m.museum_id
    join subject s
    on s.work_id = w.work_id
    join artist a 
    on a.artist_id = w.artist_id
    where 
        s.subject = 'Portraits'
        and m.country <> 'USA'
    group by
        a.full_name, a.nationality
)
where rnk = 1

