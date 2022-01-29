/*
    - 分组函数

        - 功能：用作统计使用，又称为聚合函数或统计函数或组函数

        - 分类：sum 求和、avg 平均值、max 最大值、min 最小值、count 计算个数

        - 特点

            - sum、avg  一般用于处理数值型

              max、min、count 可以处理任何类型

            - 以上分组函数都忽略 null 值

            - 可以和 distinct 搭配实现去重的运算

            - count 函数的单独介绍

                - 一般使用 count(*) 用作统计行数

            - 和分组函数一同查询的字段要求是 group by 后的字段
*/

# 多个分组函数可以一起使用
SELECT
    SUM(salary)   和,
    AVG(salary)   平均,
    MAX(salary)   最高,
    MIN(salary)   最低,
    COUNT(salary) 个数
FROM
    employees;

# 分组函数可以搭配其他函数一起使用
SELECT
    SUM(salary)           和,
    ROUND(AVG(salary), 2) 平均,
    MAX(salary)           最高,
    MIN(salary)           最低,
    COUNT(salary)         个数
FROM
    employees