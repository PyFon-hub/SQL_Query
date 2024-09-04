-- 10) Find the Ratio of male and female athletes participated in all olympic games.
-- Query:

with f as 
(
	select games, count(*) as no_females
	from 
	(
		select distinct sportman_id, sex, games
		from events
	)
	where sex = 'F'
	group by games
),
m as 
(
	select games, count(*) as no_males
	from 
	(
		select distinct sportman_id, sex, games
		from events
	)
	where sex = 'M'
	group by games
)

select f.*, m.no_males, concat('1:',cast(round(m.no_males::numeric / f.no_females::numeric , 2) as text)) as female_male_ratio
from f
left join m
on m.games = f.games
