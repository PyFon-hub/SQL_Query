--4) Write a query to count the number of products in each category.

select c.category_name,  t.number_of_products_in_category
from categories as c
join
(
	select category_id, count(1) as number_of_products_in_category
	from products
	group by category_id
) as t
on t.category_id = c.category_id