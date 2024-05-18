-- 11) Fetch the top 5 athletes who have won the most gold medals.
-- Query:

select distinct e.name, e.team, m.medals_num
from events e
join 
(
	select sportman_id, count(*) as medals_num
	from events
	where medal = 'Gold'
	group by sportman_id
) as m
on e.sportman_id = m.sportman_id
order by m.medals_num DESC
limit 5