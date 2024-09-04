-- 14) Display the 3 least popular canva sizes
-- product_size, canvas_size

select * from (
select cs.size_id, cs.label, pr.num_size, dense_rank() over(order by pr.num_size ASC) as rnk
from canvas_size cs
join (select size_id, count(*) as num_size
      from product_size
      group by size_id
      ) pr
on pr.size_id::text = cs.size_id::text
)
where rnk <= 3
