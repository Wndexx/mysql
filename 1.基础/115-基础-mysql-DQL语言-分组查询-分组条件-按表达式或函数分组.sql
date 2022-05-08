/*
    - 按表达式或函数分组
*/

# 案例：按员工姓名的长度分组，查询每一个的员工个数，筛选员工个数 > 5 的有哪些
# （1）查询每个长度的员工个数
SELECT
    LENGTH(last_name) AS len_name,
    COUNT(*)          AS count
FROM
    employees
GROUP BY
    len_name;

# （2）添加筛选条件
SELECT
    LENGTH(last_name) AS len_name,
    COUNT(*)          AS count
FROM
    employees
GROUP BY
    len_name
HAVING
    count > 5;
