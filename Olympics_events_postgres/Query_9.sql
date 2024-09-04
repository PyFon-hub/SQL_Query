-- 9) Fetch details of the oldest athletes to win a gold medal.
-- Query:

select *
from events
where age in 
(
	select max(age)
	from events
	where medal = 'Gold'
)
and medal = 'Gold'