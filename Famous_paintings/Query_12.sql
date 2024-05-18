-- 12) Which are the top 5 most popular museum? (Popularity is defined based on most no of paintings in a museum)
select m.museum_id, m.name, m.country, rank() over(order by pm.work_num DESC) as rnk, m.url
from museum m
left join (select museum_id, count(*) as work_num
            from work
            group by museum_id) as pm
on pm.museum_id = m.museum_id
limit 5