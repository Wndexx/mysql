# 6、 可以加排序
# 案例：查询每个工种的工种名和员工的个数，并且按员工个数降序
SELECT
    job_title,
    COUNT(*)
FROM
    jobs j,
    employees e
WHERE
    j.job_id = e.job_id
GROUP BY
    job_title
ORDER BY
    COUNT(*) DESC;

