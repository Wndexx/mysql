/*
    - 全外连接

        - mysql 语法不支持

        - 全外连接 = 内连接的结果 + 表1中有但表2中没有的 + 表2中有但表1没有的

*/

/*
SELECT
    b.*,
    bo.*
FROM
    beauty b
     FULL OUTER JOIN boys bo ON b.boyfriend_id = bo.id;
*/