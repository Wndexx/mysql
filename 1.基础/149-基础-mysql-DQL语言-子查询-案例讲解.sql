# 1. 查询和 Zlotkey 相同部门的员工姓名和工资
# where后面的标量子查询
# (1) 查询 Zlotkey 的部门
SELECT
    department_id
FROM
    employees
WHERE
    last_name = 'Zlotkey';
# (2) 查询员工姓名和工资，要求部门 = (1)
SELECT
    last_name,
    salary,
    department_id
FROM
    employees
WHERE
        department_id = (
                            SELECT
                                department_id
                            FROM
                                employees
                            WHERE
                                last_name = 'Zlotkey'
                        );
# 内连接
SELECT
    e.last_name,
    e.salary,
    e.department_id
FROM
    employees                e
        INNER JOIN employees em ON e.department_id = em.department_id
WHERE
    em.last_name = 'Zlotkey';

# 2. 查询工资比公司平均工资高的员工的员工号，姓名和工资
# where 后面的标量子查询
# (1) 查询公司的平均工资
SELECT
    AVG(salary) avg_sal
FROM
    employees;
# (2) 查询员工号，姓名和工资，要求工资 > (1)
SELECT
    employee_id,
    last_name,
    salary
FROM
    employees
WHERE
        salary > (
                     SELECT
                         AVG(salary) avg_sal
                     FROM
                         employees
                 );
# 交叉连接 （这里太繁琐）
SELECT
    employee_id,
    last_name,
    salary
FROM
    employees        e
        INNER JOIN (
                       SELECT
                           AVG(salary) avg_sal
                       FROM
                           employees
                   ) av ON e.salary > av.avg_sal;

# 3. 查询各部门中工资比本部门平均工资高的员工的员工号，姓名和工资
# (1) 查询各部门的平均工资
SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id;
# (2) 连接 (1) 的结果集和 employees 表，再进行筛选
SELECT
    employee_id,
    last_name,
    salary,
    e.department_id,
    avg_sal
FROM
    employees        e
        INNER JOIN (
                       SELECT
                           department_id,
                           AVG(salary) avg_sal
                       FROM
                           employees
                       GROUP BY
                           department_id
                   ) ag_dep ON e.department_id = ag_dep.department_id
WHERE
    e.salary > ag_dep.avg_sal
ORDER BY
    department_id,
    salary,
    employee_id;

# 4. 查询和姓名中包含字母 u 的员工在相同部门的员工的员工号和姓名
# (1) 查询姓名中包含 u 的员工所在的部门
SELECT DISTINCT
    department_id
FROM
    employees
WHERE
    last_name LIKE '%u%';
# (2) 查询员工号和姓名，要求 部门号 in (1)
SELECT
    employee_id,
    last_name,
    department_id
FROM
    employees
WHERE
        department_id IN (
                             SELECT DISTINCT
                                 department_id
                             FROM
                                 employees
                             WHERE
                                 last_name LIKE '%u%'
                         );
# exists
SELECT
    employee_id,
    last_name,
    department_id
FROM
    employees e
WHERE
    EXISTS(SELECT DISTINCT
               department_id
           FROM
               employees em
           WHERE
               last_name LIKE '%u%' AND
               e.department_id = em.department_id);

# 5. 查询在部门的 location_id 为 1700 的部门工作的员工的员工号
# (1) 查询 location_id 为 1700 的部门
SELECT
    department_id
FROM
    departments
WHERE
    location_id = 1700;
# (2) 查询员工号，要求 部门号 in (1)
SELECT
    employee_id
FROM
    employees
WHERE
        department_id IN (
                             SELECT
                                 department_id
                             FROM
                                 departments
                             WHERE
                                 location_id = 1700
                         );

# 6. 查询管理者是 King 的员工姓名和工资
SELECT
    last_name,
    salary,
    manager_id
FROM
    employees
WHERE
        manager_id IN (
                          SELECT
                              employee_id
                          FROM
                              employees
                          WHERE
                              last_name = 'K_ing'
                      );
# 自连接
SELECT
    e.last_name,
    e.salary,
    e.manager_id
FROM
    employees                e
        INNER JOIN employees m ON e.manager_id = m.employee_id
WHERE
    m.last_name = 'K_ing';

# 7. 查询工资最高的员工的姓名，要求 first_name 和 last_name 显示为一列，列名为姓.名
SELECT
    CONCAT(first_name, '.', last_name) "列.名"
FROM
    employees
WHERE
        salary = (
                     SELECT
                         MAX(salary)
                     FROM
                         employees
                 );



