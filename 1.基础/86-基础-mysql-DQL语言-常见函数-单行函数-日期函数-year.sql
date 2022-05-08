/*
        - year 返回年份
*/


SELECT YEAR(NOW()) 年;

SELECT YEAR('1998-1-1') 年;

SELECT YEAR('1998/1/1') 年;

SELECT
    YEAR(hiredate) 年
FROM
    employees;