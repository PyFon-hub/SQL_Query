-- 17) Identify the artists whose paintings are displayed in multiple countries
with a as(
    select distinct artist.full_name, work.artist_id, museum.country
    from work
    join museum
    on museum.museum_id = work.museum_id
    join artist
    on work.artist_id = artist.artist_id
)

select full_name, count(1) as how_many_countries_artist
from a
group by full_name
having count(1) > 1
order by how_many_countries_artist DESC

