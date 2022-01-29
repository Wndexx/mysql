# 4、可以加筛选
#    and 连接，顺序可以颠倒
# 案例：查询有奖金的员工名、部门名
SELECT
    last_name,
    department_name,
    commission_pct
FROM
    employees e,
    departments d
WHERE
    e.department_id = d.department_id AND
    commission_pct IS NOT NULL;

# 案例2：查询城市名中第二个字符为 o 的部门名和城市名
SELECT
    city,
    department_name
FROM
    locations l,
    departments d
WHERE
    l.location_id = d.location_id AND
    city LIKE '_o%';

