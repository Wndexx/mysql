# 7、可以实现三表连接
#  多表连接也可以
# 案例：查询员工名、部门名和所在的城市
SELECT
    last_name,
    department_name,
    city
FROM
    employees e,
    departments d,
    locations l
WHERE
    e.department_id = d.department_id AND
    d.location_id = l.location_id AND
    city LIKE 's%'
ORDER BY
    department_name DESC;
