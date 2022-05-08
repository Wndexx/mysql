/*
    - is null / is not null

        - = 或 <> 运算符不能判断 null 值

*/


# 案例1：查询没有奖金的员工名和奖金率

SELECT
    last_name,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NULL;

# 案例2：查询有奖金的员工名和奖金率

SELECT
    last_name,
    commission_pct
FROM
    employees
WHERE
    commission_pct IS NOT NULL;

