# 1. 查询编号 > 3 的女神的男朋友信息，如果有则列出详细，如果没有，用 null 填充
USE girls;
SELECT
    b.id,
    b.name,
    bo.*
FROM
    beauty             b
        LEFT JOIN boys bo ON b.boyfriend_id = bo.id
WHERE
    b.id > 3;

# 2. 查询哪个城市没有部门
# 左外连接
USE myemployees;
SELECT
    city
FROM
    locations                 l
        LEFT JOIN departments d ON l.location_id = d.location_id
WHERE
    d.department_id IS NULL;
# 右外连接
SELECT
    city
FROM
    departments              d
        RIGHT JOIN locations l ON l.location_id = d.location_id
WHERE
    d.department_id IS NULL;

# 3. 查询部门名为 SAL 或 IT 的员工信息
# where 可以用表的别名
SELECT
    d.department_id,
    d.department_name,
    e.*
FROM
    departments             d
        LEFT JOIN employees e ON d.department_id = e.department_id
WHERE
    d.department_name IN ('SAL', 'IT');

# 因为可能有部门没有员工，所以用内连接不准确
SELECT
    d.department_id,
    d.department_name,
    e.*
FROM
    departments          d
        JOIN employees e ON d.department_id = e.department_id
WHERE
    d.department_name IN ('SAL', 'IT');