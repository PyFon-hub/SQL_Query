-- 18) Which countries have never won gold medal but have won silver/bronze medals?
-- Query:

with t as
(
	select
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
	group by split_part(games_and_country, ' - ', 2)
	order by country
)

select * from t
where gold = 0 and (silver > 0 or bronze > 0)
order by silver asc, bronze desc