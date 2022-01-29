/*
    - count

        - count 计算的是非空的数据的个数。可以处理任何类型

        - count 可以和 distinct 搭配使用，表示不同数据的种类之和

        - count 可以用来计算总行数

            - 方法1 count(*) （推荐）

                - 原理：只要该行存在非空值（一般一行中肯定存在非空值），就会被统计

            - 方法2 count(常量值)

                - 原理：新添加了一列 常量值，然后统计 常量值 的个数

            - 效率对比

                - MYISAM（5.5之前的默认的存储引擎）存储引擎下，count(*) 的效率最高。
                  因为该存储引擎内部有计数器，直接返回了个数

                - INNODB 存储引擎下，count(*) 和 count（1） 的效率差不多
                  比count(字段) 要高一些，因为 count(字段) 需要判断该字段值是否为 null

        - 和 count 一同查询的字段要求是 group by 后的字段

*/


# 1. count 计算的是非空的数据的个数 35
SELECT
    COUNT(commission_pct)
FROM
    employees;

# 2. count 可以和 distinct 搭配使用  57 107
SELECT
    COUNT(DISTINCT salary),
    COUNT(salary)
FROM
    employees;

# 3. count 统计总行数

# count(*) 一般用来统计总行数。只要该行存在非空值（一般一行中肯定存在非空值），就会被统计
SELECT
    COUNT(*)
FROM
    employees;

# count(常量值) 也可以用来统计总行数。相当于新添加了一列 常量值，然后统计 常量值 的个数
SELECT
    COUNT(1)
FROM
    employees;

# 效率：
# MYISAM（5.5之前的默认的存储引擎）存储引擎下，count(*) 的效率最高。
#     因为该存储引擎内部有计数器，直接返回了个数
# INNODB 存储引擎下，count(*) 和 count（1） 的效率差不多，比count(字段) 要高一些
#     因为 count(字段) 需要判断该字段值是否为 null
