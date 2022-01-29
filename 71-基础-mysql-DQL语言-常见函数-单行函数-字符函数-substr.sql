/*
    - substr / substring

        - 截取字符

        - 注意：索引从 1 开始

*/

# 截取从指定索引处开始后面所有字符

SELECT SUBSTR('李莫愁爱上了陆展元', 7) out_put;

# 截取从指定索引处指定字符长度的字符

SELECT SUBSTR('李莫愁爱上了陆展元', 1, 3) out_put;

# 案例：姓名中首字符大写，其他字符小写，然后用下划线拼接，显示

SELECT
    CONCAT(UPPER(SUBSTR(last_name, 1, 1)), '_', LOWER(SUBSTR(last_name, 2))) AS 姓名
FROM
    employees;