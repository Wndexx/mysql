/*
    - 起别名

        - 特殊情况 别名中含有空格、#等，建议加双引号 ""（反引号，单引号也行，建议是双引号）
*/

# 案例：查询 salary，显示结果为 out put

# SELECT salary AS out put FROM employees;

SELECT
    salary AS "out put"
FROM
    employees;


