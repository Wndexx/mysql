/*
    - 按多个字段分组

        - 可以颠倒顺序
*/

# 查询每个部门每个工种的员工的平均工资
SELECT
    department_id,
    job_id,
    AVG(salary)
FROM
    employees
GROUP BY
#     可以颠倒顺序
    department_id,
    job_id;