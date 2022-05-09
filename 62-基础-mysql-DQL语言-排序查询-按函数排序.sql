/*
    - 按函数排序

*/


# 案例：按姓名的长度降序显示员工的姓名和工资【按函数排序】
/*
     函数 length()

        - 功能：计算字符的长度
*/


SELECT LENGTH('john');

SELECT
    LENGTH(last_name) AS 字节长度,
    last_name,
    salary
FROM
    employees
ORDER BY
    字节长度 DESC;