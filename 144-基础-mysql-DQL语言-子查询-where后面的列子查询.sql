/*
    多行子查询（列子查询）
    1. 返回多行
    2. 使用多行比较操作符
        操作符           含义
        in/not in       等于列表中的任意一个
        any|some        和子查询返回的某一个值比较
        all             和子查询返回的所有值比较


*/
# 2. 列子查询（多行子查询）
# 案例1：返回 location_id 是 1400 或 1700 的部门的所有员工姓名（in）
# (1) 返回 location_id 是 1400 或 1700 的部门编号
SELECT DISTINCT
    department_id
FROM
    departments
WHERE
    location_id IN (1400, 1700);
# (2) 查询员工姓名，要求部门号是（1）列表中的某一个
SELECT
    last_name
FROM
    employees
WHERE
        department_id IN (
                             SELECT DISTINCT
                                 department_id
                             FROM
                                 departments
                             WHERE
                                 location_id IN (1400, 1700)
                         );
# 或
SELECT
    last_name
FROM
    employees
WHERE
        department_id = ANY (
                                SELECT DISTINCT
                                    department_id
                                FROM
                                    departments
                                WHERE
                                    location_id IN (1400, 1700)
                            );

SELECT
    last_name
FROM
    employees
WHERE
        department_id NOT IN (
                                 SELECT DISTINCT
                                     department_id
                                 FROM
                                     departments
                                 WHERE
                                     location_id IN (1400, 1700)
                             );
# 或
SELECT
    last_name
FROM
    employees
WHERE
        department_id <> ALL (
                                 SELECT DISTINCT
                                     department_id
                                 FROM
                                     departments
                                 WHERE
                                     location_id IN (1400, 1700)
                             );

# 案例2：返回其他工种中比 job_id 为 'IT_PROG' 工种任一（不是任意）工资低的员工的员工号，姓名，job_id 以及 salary
# (1) 查询job_id 为 'IT_PROG' 部门的员工工资
SELECT DISTINCT
    salary
FROM
    employees
WHERE
    job_id = 'IT_PROG';
# (2) 查询员工号，姓名，job_id 以及 salary，要求 salary < (1)中某一个工资
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
        salary < ANY (
                         SELECT DISTINCT
                             salary
                         FROM
                             employees
                         WHERE
                             job_id = 'IT_PROG'
                     ) AND
        job_id <> 'IT_PROG';
# 或
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
        salary < (
                     SELECT
                         MAX(salary)
                     FROM
                         employees
                     WHERE
                         job_id = 'IT_PROG'
                 ) AND
        job_id <> 'IT_PROG';

# 案例3：返回其他工种中比 job_id 为 'IT_PROG' 工种所有工资都低的员工的员工号，姓名，job_id 以及 salary
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
        salary < ALL (
                         SELECT DISTINCT
                             salary
                         FROM
                             employees
                         WHERE
                             job_id = 'IT_PROG'
                     ) AND
        job_id <> 'IT_PROG';
# 或
SELECT
    employee_id,
    last_name,
    job_id,
    salary
FROM
    employees
WHERE
        salary < (
                     SELECT
                         MIN(salary)

                     FROM
                         employees
                     WHERE
                         job_id = 'IT_PROG'
                 ) AND
        job_id <> 'IT_PROG';