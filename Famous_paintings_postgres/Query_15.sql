--15) Which museum is open for the longest during a day. Dispay museum name, state and hours open and which day?

with mh2 as (
select mh1.museum_id, max(mh1.duration) as longest_day
from (select museum_id, day,
        to_timestamp(open,'HH:MI AM') ::time as open
	    , to_timestamp(close,'HH:MI PM')::time as close
		, to_timestamp(close,'HH:MI PM') - to_timestamp(open,'HH:MI AM') as duration
        from museum_hours) as mh1
group by mh1.museum_id
)


select museum.name, mh.*,to_timestamp(mh.close,'HH:MI PM') - to_timestamp(mh.open,'HH:MI AM') as duration from museum_hours mh
join mh2 on mh2.museum_id = mh.museum_id
join museum on mh.museum_id = museum.museum_id
where mh2.longest_day = to_timestamp(mh.close,'HH:MI PM') - to_timestamp(mh.open,'HH:MI AM')
order by to_timestamp(mh.close,'HH:MI PM') - to_timestamp(mh.open,'HH:MI AM') DESC