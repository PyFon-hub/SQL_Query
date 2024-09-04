-- 19) In which Sport/event, India has won highest medals.
-- Query:

with t as
(
	select e.sport, n.region, count(*)
	from events e
	join noc n on n.noc = e.noc
	where e.medal is not null and region = 'India'
	group by e.sport, n.region
	order by e.sport
)

select sport, count
from t
order by count desc
limit 1