-- 19) Identify the artist and the museum where the most expensive and least expensive painting is placed. 
-- Display the artist name, sale_price, painting name, museum name, museum city and canvas label 
with high_low_prices as 
(
    select *
    from (
        select distinct work_id, sale_price, rank() over(order by sale_price DESC) as high_price, rank() over(order by sale_price ASC) as low_price, size_id
        from product_size
    )
    where high_price = 1 or
    low_price = 1
)

-- work -> name, canvas_size -> label, artist -> name, high_low_prices -> sale_price, museum -> name, city

select distinct artist.full_name as artist_name, hlp.sale_price, work.name as work_name, museum.name as museum_name, museum.city, canvas_size.label,
case
    when low_price = 1 then 'Least expensive'
    when high_price = 1 then 'Most expensive'
    end as expensiness
from work
join artist
on work.artist_id = artist.artist_id
join high_low_prices hlp
on work.work_id = hlp.work_id
join museum
on work.museum_id = museum.museum_id
join canvas_size
on canvas_size.size_id::text = hlp.size_id

