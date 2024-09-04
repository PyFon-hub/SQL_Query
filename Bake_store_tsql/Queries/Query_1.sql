--1) Write a query to retrieve all product names and their corresponding brand names.
select p.product_name, b.brand_name 
from products as p
join brands as b
on b.brand_id = p.brand_id
