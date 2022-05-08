/*
    连接查询

        - 含义：又称多表查询，多表连接。当查询的字段来自于多个表表时，就会用到连接查询

        - 笛卡尔乘积现象

            - 表1有 m 行，表2有 n 行，结果 = m * n 行

            - select name, boyName from beauty, boys; 输出 12 *4 = 48 行

            - 发生原因：没有有效的连接条件

            - 如何避免：添加有效的连接条件


*/

SELECT
    *
FROM
    beauty;

SELECT
    *
FROM
    boys;

SELECT
    name,
    boyName
FROM
    boys,
    beauty
WHERE
#     连接条件
    beauty.boyfriend_id = boys.id;

