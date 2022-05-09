# 案例讲解

# 下面的语句是否可以执行成功

SELECT
    last_name,
    job_id,
    salary AS sal
FROM
    employees;

# 可以执行成功


SELECT *
FROM
    employees;

# 可以执行成功


# SELECT
#     employee_id,
#     last_name，salary * 12 “ANNUAL SALARY”
# FROM
#     employees;

# 逗号 和 双引号 不能用中文

SELECT
    employee_id,
    last_name,
    salary * 12 "ANNUAL SALARY"
FROM
    employees;


# 显示表 departments 的结构，并查询其中的全部数据

DESC departments;

SELECT *
FROM
    departments;


# 显示出表 employess 中的全部 job_id （不能重复）

SELECT DISTINCT
    job_id
FROM
    employees;


# 显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成 OUT_PUT

SELECT
    CONCAT(
            `employee_id`,
            ',',
            `first_name`,
            ',',
            `last_name`,
            ',',
            `email`,
            ',',
            `phone_number`,
            ',',
            `job_id`,
            ',',
            `salary`,
            ',',
            IFNULL(commission_pct, 0),
            ',',
            IFNULL(manager_id, 0),
            ',',
            IFNULL(`department_id`, 0),
            ',',
            `hiredate`
        ) AS "OUT_PUT"
FROM
    employees;


