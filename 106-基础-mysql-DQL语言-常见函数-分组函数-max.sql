/*
    - max

        - 最大值。可以处理任何类型

        - 可以和 distinct 搭配实现去重求平均值

        - 忽略 null

        - 和 max 一同查询的字段要求是 group by 后的字段
*/

# 1. 最大值。可以处理任何类型
# （1） 数值型
SELECT
    MAX(salary)
FROM
    employees;

# （2） 字符型
SELECT
    MAX(last_name)
FROM
    employees;

# （3）日期型
SELECT
    MAX(hiredate)
FROM
    employees;

# 2. 可以和 distinct 搭配实现去重求最大值
SELECT
    MAX(DISTINCT salary)
FROM
    employees;

# 3. 忽略 null
SELECT
    MAX(commission_pct)
FROM
    employees;

# 4. 和 max 一同查询的字段要求是 group by 后的字段


