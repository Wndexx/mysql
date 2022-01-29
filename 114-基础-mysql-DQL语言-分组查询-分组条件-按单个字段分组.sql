/*
    - 按单个字段分组
*/

# 案例1：查询每个工种的最高工资
SELECT
    job_id,
    MAX(salary)
FROM
    employees
GROUP BY
    job_id;

# 案例2：查询每个位置上的部门个数
SELECT
    location_id,
    COUNT(*)
FROM
    departments
GROUP BY
    location_id;