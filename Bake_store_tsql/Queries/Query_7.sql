--7) Write a query to count the number of orders for each order status.

select order_status, count(*) as number_of_orders
from orders
group by order_status