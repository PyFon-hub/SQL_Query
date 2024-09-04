-- 17) Identify which country won the most gold, most silver, most bronze medals and the most medals in each olympic games.
-- Query:

with t1 as
(
	select split_part(games_and_country, ' - ', 1) as games,
		split_part(games_and_country, ' - ', 2) as country,
		sum(coalesce(gold, 0)) as gold,
		sum(coalesce(silver, 0)) as silver,
		sum(coalesce(bronze, 0)) as bronze
	from crosstab
	(
		'select concat(e.games, '' - '', n.region) as games_and_country, e.medal as medal, count(*) as no_of_medals
		from events e
		join noc n
		on n.noc = e.noc
		where e.medal is not null
		group by e.games, n.region, e.medal
		order by e.games, medal',
		'values (''Gold''), (''Silver''), (''Bronze'')'
	)as results(games_and_country text, gold bigint, silver bigint, bronze bigint)
	group by split_part(games_and_country, ' - ', 1), split_part(games_and_country, ' - ', 2)
),
t2 as
(
	select *, gold+silver+bronze as max_medals
	from t1
)

select distinct games, 
	concat(
		first_value(country) over(partition by games order by gold desc), ' - ',
		first_value(gold) over(partition by games order by gold desc)
		) as max_gold,
	concat(
		first_value(country) over(partition by games order by silver desc), ' - ',
		first_value(silver) over(partition by games order by silver desc)
		) as max_silver,
	concat(
		first_value(country) over(partition by games order by bronze desc), ' - ',
		first_value(bronze) over(partition by games order by bronze desc) 
		) as max_bronze,
	concat(
		first_value(country) over(partition by games order by max_medals desc), ' - ',
		first_value(max_medals) over(partition by games order by max_medals desc) 
		) as max_medals
from t2
order by games