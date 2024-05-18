-- 18) Display the country and the city with most no of museums. Output 2 seperate columns to mention the city and country. 
-- If there are multiple value, seperate them with comma.

with country as(
    select country, count(museum_id) as num_of_museums, rank() over(order by count(museum_id) DESC) as rnk
    from museum
    group by country
),
city as (
    select city, count(museum_id) as num_of_museums, rank() over(order by count(museum_id) DESC) as rnk
    from museum
    group by city
)
select string_agg(distinct country.country, ', '), string_agg(distinct city.city, ', ')
from country
cross join city
where country.rnk = 1
and city.rnk = 1;
