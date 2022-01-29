/*
    - 多字段排序

        - 除字段外，也可以是字段，表达式，别名，函数等的相互组合
*/

# 案例：查询员工信息，要求先按工资降序，再按员工编号升序【按多个字段排序】

SELECT
    *
FROM
    employees
ORDER BY
    salary DESC,
    employee_id;