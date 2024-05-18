-- 4) Identify the paintings whose asking price is less than 50% of its regular price
SELECT 
    *
FROM 
    product_size
WHERE 
    sale_price < 0.5*regular_price

-- THIS /\
-- OR
-- THIS \/
SELECT 
    work.work_id,
    work.name,
    work.style,
    COUNT(*) AS work_quantity
FROM 
    work
INNER JOIN (
    SELECT 
        *
    FROM 
        product_size
    WHERE 
        sale_price < 0.5*regular_price
    ) AS low_sale_table 
    ON work.work_id = low_sale_table.work_id
GROUP BY
    work.work_id,
    work.name,
    work.style
