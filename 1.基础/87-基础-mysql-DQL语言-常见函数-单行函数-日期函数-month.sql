/*
        - month 返回月份 int
*/

# 1
SELECT MONTH(NOW()) 月;

SELECT MONTH('1998-1-1') 月;

SELECT
    MONTH(hiredate) 月
FROM
    employees;