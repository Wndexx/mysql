
# 3、 两个表的顺序可以调换
SELECT
    last_name,
    e.job_id,
    job_title
FROM
    jobs      j,
    employees e

WHERE
    e.job_id = j.job_id;

