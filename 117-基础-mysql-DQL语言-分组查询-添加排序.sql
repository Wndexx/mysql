/*
    - 添加排序
*/

# 查询每个部门每个工种的员工的平均工资，并且按平均工资的高低显示
SELECT
    department_id,
    job_id,
    AVG(salary) a
FROM
    employees
WHERE
    department_id IS NOT NULL
GROUP BY
    department_id,
    job_id
HAVING
    a > 10000
ORDER BY
    a DESC;