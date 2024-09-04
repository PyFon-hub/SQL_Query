-- 9) Write a query to find the total quantity of each product available in all stores.

select product_id, count(*) as total_quantity 
from stocks
group by product_id



