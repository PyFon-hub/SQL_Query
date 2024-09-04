-- 16) Which museum has the most no of most popular painting style?
with top_muesum_style as(
    select
    work.style,
    rank() over(order by count(*) DESC) as rnk
    from work
    join museum
    on work.museum_id = museum.museum_id
    group by work.style
    having work.style is not NULL
)

select museum.museum_id, museum.name, work.style,
count(*) as num
from work
join museum
on work.museum_id = museum.museum_id
join top_muesum_style
on top_muesum_style.style = work.style
where top_muesum_style.rnk = 1
group by museum.museum_id, museum.name, work.style
order by num DESC
limit 1;