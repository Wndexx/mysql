/*
    - 内连接

        - 语法

            select 查询列表
            from 表1 别名
            inner join 表2 别名
            on 连接条件;

        - 分类

            - 等值

                - 可以添加排序、分组、筛选

                - inner 可省略

                - 筛选条件放在 where 后面，连接条件放在 on 后面，提高分离性，便于阅读

                - inner join 连接和 sql92 语法中的等值连接效果是一样的，都是查询交集部分

            - 非等值

            - 自连接


*/

# 1. 等值连接
# sql92 和 sql99 执行原理和执行结果完全一样
# 连接条件 关联列的类型尽量一样，或者可以隐式转换，字段长度不一样也没关系。
# 案例1：查询员工名、部门名（调换位置）
SELECT
    last_name,
    department_name
FROM
    employees                  e
        INNER JOIN departments d ON e.department_id = d.department_id;

# 案例2：查询名字中包含 e 的员工名和工种名（筛选）
SELECT
    last_name,
    job_title
FROM
    employees           e
        INNER JOIN jobs j ON e.job_id = j.job_id
WHERE
    last_name LIKE '%e%';

# 案例3：查询部门个数 > 3 的城市名和部门个数（分组 + 筛选）
SELECT
    city,
    COUNT(*) 部门个数
FROM
    locations
        INNER JOIN departments d ON locations.location_id = d.location_id
GROUP BY
    city
HAVING
    COUNT(*) > 3;

# 案例4：查询哪个部门的部门员工个数 > 3 的部门名和员工个数，并按个数降序（排序）
SELECT
    department_name,
    COUNT(*) 员工个数
FROM
    departments              d
        INNER JOIN employees e ON d.department_id = e.department_id
GROUP BY
    department_name
HAVING
    COUNT(*) > 3
ORDER BY
    员工个数 DESC;

# 案例5：查询员工名、部门名、工种名，并按部门名降序（添加三表连接）
# 连接的表和前面的表必须有连接条件，如果先写 jobs，第一个 inner join 后跟 departments ，则无法连接
SELECT
    last_name,
    department_name,
    job_title
FROM
    employees                  e
        INNER JOIN departments d ON e.department_id = d.department_id
        INNER JOIN jobs        j ON e.job_id = j.job_id
ORDER BY
    department_name DESC;
