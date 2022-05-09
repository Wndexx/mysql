/*
    - 排序查询

        - 语法

            select 查询列表
            from 表
            【where 筛选条件】
            order by 排序列表 【asc | desc】

        - 特点

            - asc 代表的是升序，desc 代表的是降序；如果不写，默认是升序

            - order by 子句中可以支持单个字段、多个字段、表达式、函数、别名

            - order by 子句一般放在查询语句的最后面，但 limit 子句除外

            - 执行顺序： from -> where -> select -> order by
*/


# 案例：查询员工信息，要求工资从高到低排序

SELECT
    *
FROM
    employees
ORDER BY
    salary DESC;

SELECT
    *
FROM
    employees
ORDER BY
    salary ASC;

SELECT
    *
FROM
    employees
ORDER BY
    salary;

