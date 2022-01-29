/*
    - min

        - 最小值。可以处理任何类型

        - 可以和 distinct 搭配实现去重求平均值

        - 忽略 null

        - 和 min 一同查询的字段要求是 group by 后的字段
*/

# 1. 最小值。可以处理任何类型
# （1） 数值型
SELECT
    MIN(salary)
FROM
    employees;

# （2） 字符型
SELECT
    MIN(last_name)
FROM
    employees;

# （3）日期型
SELECT
    MIN(hiredate)
FROM
    employees;

# 2. 可以和 distinct 搭配实现去重求最小值
SELECT
    MIN(DISTINCT salary)
FROM
    employees;

# 3. 忽略 null
SELECT
    MIN(commission_pct)
FROM
    employees;

# 4. 和 min 一同查询的字段要求是 group by 后的字段



