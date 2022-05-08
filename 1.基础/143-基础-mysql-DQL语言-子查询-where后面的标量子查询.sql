/*
    where 或 having 后面的子查询
    1. 标量子查询（单行子查询
    2. 列子查询（多行子查询）
    3. 行子查询（多列多行）

    特点：
    1. 子查询都会放在小括号内
    2. 子查询一般放在条件的右侧
    3. 标量子查询，一般搭配着单行操作符使用 > < >= <= = <>
       列子查询，一般搭配着多行操作符使用 in、any(some)、all
    4. 子查询的执行优先于主查询，主查询的条件用到了子查询的结果

*/

# 一、 where 或 having 后面
# 1. 标量子查询
# 案例1：谁的工资比 Abel 高
# (1) 查询 Abel 的工资
SELECT
    salary
FROM
    employees
WHERE
    last_name = 'Abel';
# (2) 查询员工的信息，满足 salary > (1)的结果
SELECT
    *
FROM
    employees
WHERE
        salary > (
                     SELECT
                         salary
                     FROM
                         employees
                     WHERE
                         last_name = 'Abel'
                 );

# 或 自连接
SELECT
    e.last_name
FROM
    employees                e
        INNER JOIN employees em ON e.salary > em.salary
WHERE
    em.last_name = 'Abel';

# 案例2：返回 job_id 与 141 号员工相同，salary 比 143 号员工多的员工姓名、job_id 和 工资（多个子查询）
# (1) 查询 141 号员工的 job_id
SELECT
    job_id
FROM
    employees
WHERE
    employee_id = 141;
# (2) 查询 143 号员工的工资
SELECT
    salary
FROM
    employees
WHERE
    employee_id = 143;
# (3) 查询员工的员工姓名、job_id 和 工资，要求 job_id = (1) 并且 salary > (2)
SELECT
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
        job_id = (
                     SELECT
                         job_id
                     FROM
                         employees
                     WHERE
                         employee_id = 141
                 ) AND
        salary > (
                     SELECT
                         salary
                     FROM
                         employees
                     WHERE
                         employee_id = 143
                 );

# 案例3：返回公司工资最少的员工的last_name，job_id 和 salary（子查询中使用函数）
# (1) 查询公司的最低工资
SELECT
    MIN(salary)
FROM
    employees;
# (2) 查询员工的 last_name，job_id 和 salary，要求 salary = (1)
SELECT
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
        salary = (
                     SELECT
                         MIN(salary)
                     FROM
                         employees
                 );

# 案例4：查询最低工资大于 50 号部门最低工资的部门 id 和其最低工资（having 子句）
# (1) 查询 50 号部门的最低工资
SELECT
    MIN(salary)
FROM
    employees
WHERE
    department_id = 50;
# (2) 查询每个部门的最低工资
SELECT
    department_id,
    MIN(salary)
FROM
    employees
GROUP BY
    department_id;
# (3) 在 (2)基础上筛选，满足 min(salary) > (1)
SELECT
    department_id,
    MIN(salary)
FROM
    employees
GROUP BY
    department_id
HAVING
        MIN(salary) > (
                          SELECT
                              MIN(salary)
                          FROM
                              employees
                          WHERE
                              department_id = 50
                      );

# 非法使用标量子查询（错误）
# 1. 单行操作符 > < >= <= = <> 搭配多行子查询
# 2. 子查询不返回任何行
SELECT
    department_id,
    MIN(salary)
FROM
    employees
GROUP BY
    department_id
HAVING
        MIN(salary) > (
                          SELECT
                              salary
                          FROM
                              employees
                          WHERE
                              department_id = 250
                      );