/*
    - 非等值连接

        - 连接条件不是等于的任意连接条件

        - 也可以搭配前面介绍的所有子句使用，比如 排序、分组、筛选
*/


# 案例：查询出员工的工资和工资级别

SELECT
    salary,
    grade_level
FROM
    employees e,
    job_grades g
WHERE
    e.salary BETWEEN g.lowest_sal AND g.highest_sal AND
    grade_level = 'A';
