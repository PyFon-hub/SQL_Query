-- 8) Fetch the total no of sports played in each olympic games.
-- Query:

select games, count(*) as no_of_sports
from
(
	select distinct games, sport
	from events
)
group by games
order by no_of_sports DESC