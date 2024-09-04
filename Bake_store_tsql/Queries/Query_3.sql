--3) Write a query to list all customers with their full names, email, and phone number.
select isnull(first_name, '') + ' ' + isnull(last_name, '') as customer_name, email, phone from customers