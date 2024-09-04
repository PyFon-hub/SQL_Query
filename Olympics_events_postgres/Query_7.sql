-- 7) Which Sports were just played only once in the olympics?
-- Query:

select t.*, e.games
from 
(
	select sport, count(*) as no_of_games
	from 
	(
		select distinct sport, games
		from events
	)
	group by  sport
) t
join 
(
	select distinct sport, games
	from events
) e
on e.sport = t.sport
where t.no_of_games = 1
order by t.sport