/*
    - between and

        - 使用 between and 可以提高语句的简洁度

        - 包含临界值

        - 两个临界值不要调换顺序

        - 完全等价于 >= 左边的值 and <= 右边的值

*/


# 案例1：查询员工编号在100到120之间的员工信息

SELECT *
FROM
    employees
WHERE
    employee_id >= 100 AND
    employee_id <= 120;

SELECT *
FROM
    employees
WHERE
    employee_id BETWEEN 100 AND 120;
