--6) Write a query to calculate the total sales amount for each product (considering quantity, list price, and discount).
select * 
from
(
	select product_id, round(sum(quantity * list_price * (1 - discount)), 2) as sales
	from order_items
	group by product_id
) t
order by sales desc

