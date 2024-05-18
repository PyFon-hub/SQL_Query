-- 9) Fetch the top 10 most famous painting subject --
SELECT 
    *
FROM (
    SELECT
        subject.subject, 
        count(*),
        rank() over(ORDER BY count(*) DESC) AS rnk
    FROM work
    LEFT JOIN subject
        ON work.work_id = subject.work_id
    WHERE
        subject.subject IS NOT NULL
    GROUP BY
        subject.subject
) 
WHERE rnk <= 10



