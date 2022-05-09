/*
    - 非等值连接
*/

# 2. 非等值连接
# 案例1：查询员工的工资级别
SELECT
    salary,
    grade_level
FROM
    employees           e
        JOIN job_grades g ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;

# 案例2：查询每个工资级别的员工个数 > 20 的工资级别和员工个数，并且按工资级别降序
SELECT
    grade_level,
    COUNT(*) 员工个数
FROM
    job_grades         g
        JOIN employees e ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
GROUP BY
    grade_level
HAVING
    COUNT(*) > 20
ORDER BY
    grade_level DESC;