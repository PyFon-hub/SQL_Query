-- 20) Which country has the 5th highest no of paintings?
select *
from (
    select country, count(*) as no_of_paintings, rank() over(order by count(*) DESC) as rnk
    from museum
    join work
    on museum.museum_id = work.museum_id
    group by country
)
where rnk = 5
