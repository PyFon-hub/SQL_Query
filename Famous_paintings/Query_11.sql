-- 11) How many museums are open every single day?
select count(*), num as days_open
from (select museum_id, count(*) as num
      from museum_hours
      group by museum_id
      )
group by
num
