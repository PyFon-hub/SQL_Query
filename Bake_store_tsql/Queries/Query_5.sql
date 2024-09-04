-- 5) Write a query to list the total number of orders placed by each customer.

select customer_id, isnull(count(1) , 0) as number_of_orders
from orders
group by customer_id