/*
    - 按表达式排序
*/


# 案例： 按年新的高低显示员工的信息和年薪【按表达式排序】

SELECT
    *,
    salary * 12 * (1 + IFNULL(commission_pct, 0)) AS 年薪
FROM
    employees
ORDER BY
    salary * 12 * (1 + IFNULL(commission_pct, 0)) DESC ;