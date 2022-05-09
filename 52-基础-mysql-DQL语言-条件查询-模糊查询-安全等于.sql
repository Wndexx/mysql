/*
    - 安全等于 <=>

        - 可以判断 是否为 null

        - 可以判断 是否等于普通值

        - 可读性差

    - is null 与 <=>

        - is null 仅仅可以判断 null 值，可读性较高，建议使用

        - <=> 既可以判断 null 值，又可以判断普通的数值，可读性较低
*/


# 案例1：查询没有奖金的员工名和奖金率

SELECT
    last_name,
    commission_pct
FROM
    employees
WHERE
    commission_pct <=> NULL;

# 案例2：查询工资为 12000 的员工信息

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary <=> 12000;