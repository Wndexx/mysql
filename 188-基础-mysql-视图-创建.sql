# 一、创建视图
/*
    语法：
        create view 视图名
        as
        查询语句;
    好处：
        1. 重用 sql 语句
        2. 简化复杂的 sql 操作，不必知道它的查询细节
        3. 保护数据，提高安全性 （视图和原始基表相分离）
*/

# 案例1：查询姓名中包含 a 字符的员工名、部门名和工种信息
SELECT
    last_name,
    department_name,
    j.*,
    email
FROM
    employees            e
        JOIN departments d ON d.department_id = e.department_id
        JOIN jobs        j ON j.job_id = e.job_id
WHERE
    last_name LIKE '%a%';
# (1) 创建
CREATE VIEW my_v1
AS
    SELECT
        last_name,
        department_name,
        job_title
    FROM
        employees            e
            JOIN departments d ON d.department_id = e.department_id
            JOIN jobs        j ON j.job_id = e.job_id;
# (2) 使用
SELECT
    *
FROM
    my_v1
WHERE
    last_name LIKE '%a%';

# 案例2：查询各部门的平均工资级别
SELECT
    grade_level
FROM
    job_grades g
        JOIN (
                 SELECT
                     AVG(salary) avg_sal
                 FROM
                     employees
                 GROUP BY
                     department_id
             ) a
             ON a.avg_sal BETWEEN g.lowest_sal AND g.highest_sal;
# (1) 创建视图查看每个部门的平均工资
CREATE VIEW my_v2
AS
    SELECT
        department_id,
        AVG(salary) avg_sal
    FROM
        employees
    GROUP BY
        department_id;

SELECT
    *
FROM
    my_v2;
# (2) 使用
SELECT
    department_id,
    grade_level
FROM
    job_grades     g
        JOIN my_v2 m ON m.avg_sal BETWEEN g.lowest_sal AND g.highest_sal;

# 3. 查询平均工资最低的部门信息
SELECT
    d.*,
    m.avg_sal
FROM
    departments    d
        JOIN my_v2 m ON d.department_id = m.department_id
ORDER BY
    m.avg_sal
LIMIT 1;

# 4. 查询平均工资最低的部门名和工资
SELECT
    department_name,
    avg_sal
FROM
    departments    d
        JOIN my_v2 m ON d.department_id = m.department_id
ORDER BY
    m.avg_sal
LIMIT 1;
# 或
# 利用视图创建新的视图
CREATE VIEW my_v3
AS
    SELECT
        *
    FROM
        my_v2
    ORDER BY
        avg_sal
    LIMIT 1;

SELECT
    department_name,
    avg_sal
FROM
    my_v3                m
        JOIN departments d ON m.department_id = d.department_id;