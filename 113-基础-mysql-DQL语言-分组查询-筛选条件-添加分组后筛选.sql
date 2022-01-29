# 添加分组后的筛选 having

# 案例1：查询哪个部门的员工个数 > 2
# （1） 查询每个部门的员工个数
SELECT
    COUNT(*),
    department_id
FROM
    employees
GROUP BY
    department_id;

# （2） 根据（1） 的结果进行筛选，查询哪个部门的员工个数 > 2
SELECT
    COUNT(*),
    department_id
FROM
    employees
GROUP BY
    department_id
HAVING
    COUNT(*) > 2;

# 案例2：查询每个工种有奖金的员工的最高工资 > 12000的工种编号和其最高工资
# （1） 查询每个工种有奖金的员工的最高工资
SELECT
    job_id,
    MAX(salary)
FROM
    employees
WHERE
    commission_pct IS NOT NULL
GROUP BY
    job_id;

# （2）根据（1）的结果继续筛选，最高工资 > 12000
SELECT
    job_id,
    MAX(salary)
FROM
    employees
WHERE
    commission_pct IS NOT NULL
GROUP BY
    job_id
HAVING
    MAX(salary) > 2000;

# 案例3：查询领导编号 > 102 的每个领导手下的最低工资 > 5000 的员工的领导编号是哪个，以及其最低工资
# （1）查询每个领导手下的员工的最低工资
SELECT
    manager_id,
    MIN(salary)
FROM
    employees
GROUP BY
    manager_id;

# （2）添加筛选条件：领导编号 > 102
SELECT
    manager_id,
    MIN(salary)
FROM
    employees
WHERE
    manager_id > 102
GROUP BY
    manager_id

# （3）添加筛选条件：最低工资 > 5000
SELECT
    manager_id,
    MIN(salary)
FROM
    employees
WHERE
    manager_id > 102
GROUP BY
    manager_id
HAVING
    MIN(salary) > 5000;