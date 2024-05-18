-- 5) Which nation has participated in all of the olympic games?
-- Query:

-- From 1) we know that has been 51 games

select region, count(*)
from 
(
	select distinct games, noc
	from events
) t
join noc n
on n.noc = t.noc
group by region
having count(*) = 51
