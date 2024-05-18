-- 13) Who are the top 5 most popular artist? (Popularity is defined based on most no of paintings done by an artist)
select a.full_name, a.nationality, pm.work_num, rank() over(order by pm.work_num DESC) as rnk
from artist a
join (select artist_id, count(*) as work_num
            from work
            group by artist_id) as pm
on pm.artist_id = a.artist_id
limit 5
