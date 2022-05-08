/*
    - 自连接
*/

# 3. 自连接
# 案例：查询姓名中包含字符 k 的员工的名字、上级的名字
SELECT
    e.last_name,
    m.last_name
FROM
    employees          e
        JOIN employees m ON e.manager_id = m.employee_id
WHERE
    e.last_name LIKE '%k%';