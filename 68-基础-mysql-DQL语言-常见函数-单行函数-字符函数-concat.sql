/*
    - concat 拼接字符

        - null 与任何字符拼接均为 null

        - 数值型会自动转换成字符型
*/

SELECT
    CONCAT(last_name, '_', first_name) 姓名
FROM
    employees;