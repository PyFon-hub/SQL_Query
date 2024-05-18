-- 6) Delete duplicate records from work, product_size, subject and image_link tables

/*
ctid: This is a system column in PostgreSQL that contains a unique row identifier in a given data file.
This allows us to identify specific rows, regardless of the contents of the data columns.
*/
	delete from work 
	where ctid not in (select min(ctid)
						from work
						group by work_id );

	delete from product_size 
	where ctid not in (select min(ctid)
						from product_size
						group by work_id, size_id );

	delete from subject 
	where ctid not in (select min(ctid)
						from subject
						group by work_id, subject );

	delete from image_link 
	where ctid not in (select min(ctid)
						from image_link
						group by work_id );