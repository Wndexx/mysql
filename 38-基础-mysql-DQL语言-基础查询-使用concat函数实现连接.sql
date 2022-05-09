/*
    - 使用 concat 实现连接

        - select concat(字符1,字符2,...);

            - 功能：拼接字符

            - 除字段外的字符不能用着重号（反引号） ``

            - null 与任何数据拼接均为 null

            - 数值型会自动转换成字符型
*/


SELECT CONCAT('a', 'b', 'c') AS "result";


# SELECT CONCAT(`a`, `b`);

-- 错误，不能用 反引号 ``

SELECT CONCAT("a", "b");


SELECT CONCAT('a', NULL);

SELECT
    CONCAT(last_name, first_name) AS "name"
FROM
    employees;

