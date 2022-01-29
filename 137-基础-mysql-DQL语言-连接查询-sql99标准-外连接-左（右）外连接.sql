/*
    外连接

        - 应用场景：用于查询一个表有，另一个表没有的记录

        - 特点

            - 外连接的查询结果为主表中的所有记录
              如果从表中有和它匹配的，则显示匹配的值
              如果从表中没有和它匹配的，则显示 null

              外连接查询结果 = 内连接结果 + 主表中有而从表没有的记录

            - 左外连接，left  join 左边的是主表
              右外连接，right join 右边的是主表

            - 一般来说，要查询的信息来自哪个表，哪个表作为主表w

            - 左外和右外交换两个表的顺序，可以实现同样的效果



*/

# 引入：查询男朋友不在男神表的女神名

# 左外连接
SELECT
    b.name
FROM
    beauty             b
        LEFT JOIN boys bo ON b.boyfriend_id = bo.id
WHERE
    bo.id IS NULL;

# 右外连接
SELECT
    b.name
FROM
    boys                  bo
        RIGHT JOIN beauty b ON bo.id = b.boyfriend_id
WHERE
    bo.id IS NULL;

SELECT
    bo.*,
    b.*
FROM
    boys                 bo
        LEFT JOIN beauty b ON b.boyfriend_id = bo.id
WHERE
    bo.id IS NULL;

# 案例1：查询哪个部门没有员工
# 左外
SELECT
    d.*,
    e.employee_id,
    e.department_id
FROM
    departments             d
        LEFT JOIN employees e ON d.department_id = e.department_id
WHERE
    e.employee_id IS NULL;

# 右外
SELECT
    d.*,
    e.employee_id,
    e.department_id
FROM
    employees                  e
        RIGHT JOIN departments d ON d.department_id = e.department_id
WHERE
    e.employee_id IS NULL;