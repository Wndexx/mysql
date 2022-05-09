/*
        - monthname 返回月份 英文名称
*/

# January
SELECT MONTHNAME(NOW()) 月;

# January
SELECT MONTHNAME('1998-1-1') 月;

SELECT
    MONTHNAME(hiredate) 月
FROM
    employees;