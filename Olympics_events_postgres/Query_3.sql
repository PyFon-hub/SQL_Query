
-- 3) Mention the total no of nations who participated in each olympics game?
-- Query:
select games, count(*) as total_countries
from 
(
	select distinct games, noc
	from events
)
group by games
order by games
