-- 21) Which are the 3 most popular and 3 least popular painting styles?
select *,
    case
        when most_popular <= 3 then 'most popular'
        else 'least popular'
    end as popularity
from 
(
    select style, 
        count(style),
        rank() over(order by count(style) DESC) as most_popular,
        rank() over(order by count(style) ASC) as least_popular
    from work
    where style is not NULL
    group by style
)
where most_popular <= 3 or least_popular <= 3
