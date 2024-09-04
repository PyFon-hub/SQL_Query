-- 12) Fetch the top 5 athletes who have won the most medals (gold/silver/bronze).
-- Query:

select name, count(*) as no_of_medals
from events
where medal is not NULL
group by name
order by no_of_medals DESC

