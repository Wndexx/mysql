/*
    - sum

        - 求和。一般用来处理数值型

        - 可以和 distinct 搭配实现去重求和

        - 忽略 null

        - 和 sum 一同查询的字段要求是 group by 后的字段
*/


# 1. 求和。一般用来处理数值型
# 691400
SELECT
    SUM(salary)
FROM
    employees;

# sum，avg 参数必须是 数值型
# 参数是 字符型，不会报错，但结果为 0，没有逻辑意义
SELECT
    SUM(last_name)
FROM
    employees;

# 参数是日期型，不会报错，但也没有逻辑意义
SELECT
    SUM(hiredate)
FROM
    employees;


# 2. 可以和 distinct 搭配实现去重的运算
# 397900 691400
SELECT
    SUM(DISTINCT salary),
    SUM(salary)
FROM
    employees;


# 3. 忽略 null
# 7.8 如果不忽略 null，和 null 相加结果为 null
SELECT
    SUM(commission_pct)
FROM
    employees;


# 4. 和 sum 一同查询的字段要求是 group by 后的字段
# 和不同字段连接后，不能组成一个规则的表格
SELECT
    SUM(salary),
    salary
FROM
    employees;


