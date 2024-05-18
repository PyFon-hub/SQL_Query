-- 13) Fetch the top 5 most successful countries in olympics. Success is defined by no of medals won.
-- Query:

select *
from
(
	select region, count(*) as no_of_medals, rank() over(order by count(*) DESC) as rnk
	from events
	join noc
	on noc.noc = events.noc
	where medal is not NULL
	group by region
	order by no_of_medals DESC
)
where rnk <= 5
