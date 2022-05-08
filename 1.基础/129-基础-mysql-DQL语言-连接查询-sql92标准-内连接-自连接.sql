/*
    - 自连接

        - 相当于等值连接，但连接的表是自己
*/

# 案例：查询员工名和上级的名称
SELECT
    e.employee_id,
    e.last_name,
    m.employee_id,
    m.last_name
FROM
    employees e,
    employees m
WHERE
    e.manager_id = m.employee_id;