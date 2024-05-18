-- 6) Identify the sport which was played in all summer olympics.
-- Query:

select *
from
(
	select t1.sport, count(t1.*) as no_of_games
	from 
	(
		select distinct games, sport
		from events
		where games ilike '%Summer'
	) t1
	group by t1.sport
) t11
cross join 
(
	select count(distinct games) as total_games
	from events
	where games ilike '%Summer'
) t2
where
t2.total_games = t11.no_of_games