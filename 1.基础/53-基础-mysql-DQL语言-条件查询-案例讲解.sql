# 案例1：查询员工号为 176 的员工的姓名和部门号和年薪

SELECT
    last_name,
    department_id,
    salary * 12 * (1 + IFNULL(commission_pct, 0)) AS 年薪
FROM
    employees
WHERE
    employee_id = 176;

# 案例2：查询工资大于 12000 的员工姓名和工资

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary > 12000;

# 案例3：选择工资不在 5000 到 12000 的员工的姓名和工资

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 5000 AND 12000;

# 案例4：选择在 20 或 50 号部门工作的员工姓名和部门号

SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN (20, 50);

# 案例5：选择公司中没有管理者的员工姓名及工种编号
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;

# 案例6：选择公司中有奖金的员工姓名，工资和奖金级别

SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

# 案例7：选择员工姓名的第三个字母是 a 的员工姓名

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '__a%';

# 案例8：选择姓名中有字母 a 和 e 的员工姓名

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%' OR
    last_name LIKE '%e%a%';

# 案例9：显示出表 employees 表中 first_name 以 e 结尾的员工信息

SELECT *
FROM
    employees
WHERE
    first_name LIKE '%e';

# 案例10：显示出表 employees 部门编号在 80 - 100 之间的姓名、职位

SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    department_id BETWEEN 80 AND 100;

# 案例11：显示出表 employees 的 manager_id 是 100、101、102 的员工的姓名、职位
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IN (100, 101, 102);