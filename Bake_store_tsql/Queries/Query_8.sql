--8) Write a query to list all customers who have placed at least one order, including their full name and total number of orders.

select c.first_name + ' ' + c.last_name as full_name, t.no_orders
from customers as c
join 
(
	select customer_id, count(1) as no_orders 
	from orders
	group by customer_id
	having count(1) > 1
) t
on t.customer_id = c.customer_id
order by t.no_orders desc


