
-- 4) Which year saw the highest and lowest no of countries participating in olympics?
-- Query:
with t as
(
	select year, count(*) as total_countries, 
	rank() over(order by count(*) DESC) as high_rank, rank() over(order by count(*) ASC) as low_rank
	from 
	(
		select distinct year, noc
		from events
	)
	group by year
)

select distinct
concat('In ', first_value(year) over(order by total_countries)
      , ' attended '
      , first_value(total_countries) over(order by total_countries)) as Lowest_Countries,
      concat('In ', first_value(year) over(order by total_countries desc)
      , ' attended '
      , first_value(total_countries) over(order by total_countries desc)) as Highest_Countries
from t
