# 二、select 后面
# 仅仅支持标量子查询

# 案例1：查询每个部门的员工个数
SELECT
    d.*,
    (
        SELECT
            COUNT(*)
        FROM
            employees e
        WHERE
            e.department_id = d.department_id
    ) 个数
FROM
    departments d;
# 或
SELECT
    d.*,
    COUNT(employee_id)
FROM
    departments             d
        LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY
    d.department_id;

# 案例2：查询员工号 = 102 的部门名
# select 后面的子查询
SELECT
    (
        SELECT
            department_name
        FROM
            departments d
        WHERE
            e.department_id = d.department_id
    ) 部门名
FROM
    employees e
WHERE
    employee_id = 102;
# 或 连接查询
SELECT
    department_name
FROM
    departments        d
        JOIN employees e ON d.department_id = e.department_id
WHERE
    employee_id = 102;
# 或 where 后面的子查询
SELECT
    department_name
FROM
    departments
WHERE
        department_id = (
                            SELECT department_id
                            FROM employees
                            WHERE employee_id = 102
                        );
