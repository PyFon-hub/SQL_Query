-- 14) List down total gold, silver and broze medals won by each country.
-- Query:

select country,
	coalesce(gold, 0) as gold,
	coalesce(silver, 0) as silver,
	coalesce(bronze, 0) as bronze
from crosstab
(
	'select n.region as country, e.medal as medal, count(*) as no_of_medals
	from events e
	join noc n
	on n.noc = e.noc
	where e.medal is not null
	group by n.region, e.medal',
	'VALUES (''Gold''), (''Silver''), (''Bronze'')'
)as results(country text, gold bigint, silver bigint, bronze bigint)
order by gold desc, silver desc, bronze desc