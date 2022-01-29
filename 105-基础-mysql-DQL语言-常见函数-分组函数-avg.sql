/*
    - avg

        - 平均值。一般用于处理数值型

        - 可以和 distinct 搭配实现去重求平均值

        - 忽略 null

        - 和 avg 一同查询的字段要求是 group by 后的字段
*/


# 1. 平均值。一般用于处理数值型
# 6461.682243
SELECT
    AVG(salary)
FROM
    employees;

# sum，avg 参数必须是 数值型
# 参数是 字符型，不会报错，但结果为 0，没有逻辑意义
SELECT
    AVG(last_name)
FROM
    employees;

# 参数是日期型，不会报错，但也没有逻辑意义
SELECT
    AVG(hiredate)
FROM
    employees;


# 2. 可以和 distinct 搭配实现去重求平均值
SELECT
    AVG(DISTINCT salary),
    AVG(salary)
FROM
    employees;


# 3. 忽略 null
SELECT
    AVG(commission_pct),
    SUM(commission_pct) / COUNT(commission_pct),
    SUM(commission_pct) / 107
FROM
    employees;


# 4. 和 avg 一同查询的字段要求是 group by 后的字段

