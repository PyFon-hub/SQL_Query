-- 2) Write a query to find all active staff members and their store names.
select staffs.staff_id as staff_id, staffs.first_name + ' ' + staffs.last_name as staff_name, stores.store_name as store_name
from staffs
join stores
on staffs.store_id = stores.store_id