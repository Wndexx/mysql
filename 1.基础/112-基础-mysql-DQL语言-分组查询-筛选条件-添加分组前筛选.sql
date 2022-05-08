# 添加分组前的筛选 where

# 案例1：查询邮箱中包含 a 字符的，每个部门的平均工资
SELECT
    department_id,
    AVG(salary)
FROM
    employees
WHERE
    email LIKE '%a%'
GROUP BY
    department_id;

# 案例2：查询每个领导手下有奖金的员工的最高工资
SELECT
    manager_id,
    MAX(salary)
FROM
    employees
WHERE
    commission_pct IS NOT NULL
GROUP BY
    manager_id;

