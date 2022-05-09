# 5、可以加分组
# 案例1：查询每个城市的部门个数
SELECT
    city,
    COUNT(*) 个数
FROM
    locations l,
    departments d
WHERE
    l.location_id = d.location_id
GROUP BY
    city;

# 案例2：查询出有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT
    department_name,
    d.manager_id,
    MIN(salary)
FROM
    departments d,
    employees e
WHERE
    d.department_id = e.department_id AND
    commission_pct IS NOT NULL
GROUP BY
    department_name,
    d.manager_id;

