-- 20) Break down all olympic games where india won medal for Hockey and how many medals in each olympic games.
-- Query:

select e.sport, e.games, count(*) as total_medals
from events e
join noc n on n.noc = e.noc
where e.medal is not null and n.region = 'India' and e.sport = 'Hockey'
group by  e.sport, e.games
order by total_medals desc