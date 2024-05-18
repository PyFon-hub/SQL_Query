-- 5) Which canva size costs the most? --

SELECT 
    canvas_size.size_id,
    canvas_size.label,
    ranking.regular_price,
    ranking.sale_price
FROM canvas_size
JOIN (
    SELECT 
        *,
        rank() over(ORDER BY regular_price DESC) rnk
    FROM product_size
    ) AS ranking
    ON ranking.size_id::text = canvas_size.size_id::text
ORDER BY 
    ranking.rnk ASC
LIMIT 1

    
    