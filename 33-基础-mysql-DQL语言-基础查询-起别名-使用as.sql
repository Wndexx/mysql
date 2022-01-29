/*
    - 起别名

        - 优点

            - 便于理解

            - 如果要查询的字段有重名的情况，使用别名可以区分开来

        - 方式一

            - SELECT 字段名 AS 别名;
*/

SELECT 100 % 98 AS 结果;

SELECT
    last_name  AS `ln`,
    first_name AS `fn`
FROM
    employees;





