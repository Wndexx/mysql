# 四、exists 后面（相关子查询）
/*
    语法：
        exists(完整的查询语句)
    结果：
        1：存在
        0：不存在
    能使用相关子查询的都可以用 in
*/
USE myemployees;
SELECT EXISTS(SELECT employee_id FROM employees WHERE salary = 30000);

# 案例1：查询有员工名的部门名
SELECT
    department_name
FROM
    departments d
WHERE
    EXISTS(
            SELECT
                *
            FROM
                employees e
            WHERE
                d.department_id = e.department_id
        );
# 或 where 后面的多行子查询 in
SELECT
    department_name
FROM
    departments d
WHERE
        department_id IN (
                             SELECT DISTINCT
                                 e.department_id
                             FROM
                                 employees e
                         );
# 或 等值连接
SELECT DISTINCT
    d.department_name
FROM
    employees            e
        JOIN departments d ON d.department_id = e.department_id;

# 案例2：查询没有女朋友的男神信息
# exists
USE girls;
SELECT
    bo.*
FROM
    boys bo
WHERE
    NOT EXISTS(
            SELECT
                b.boyfriend_id
            FROM
                beauty b
            WHERE
                b.boyfriend_id = bo.id
        );
# 或 in
SELECT
    bo.*
FROM
    boys bo
WHERE
        bo.id NOT IN (
                         SELECT
                             boyfriend_id
                         FROM
                             beauty b
                     );
# 或
SELECT
    bo.*
FROM
    boys                 bo
        LEFT JOIN beauty b ON bo.id = b.boyfriend_id
WHERE
    b.id IS NULL;
