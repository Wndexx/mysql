/*
    - sql92 标准

        - 等值连接

            - 原理：将表1中的每一行匹配表2中的每一行，匹配时通过筛选条件进行判断，如果满足筛选条件就显示出来，否则过滤掉

            - 连接条件：意义一样的两个字段

            - 特点

                - 多表等值连接的结果为多表的交集部分

                - n 表连接，至少需要 n-1 个连接条件

                - 多表的顺序没有要求

                - 一般需要为表起别名

                - 可以搭配前面介绍的所有子句使用，比如 排序、分组、筛选

*/

# 1、等值连接
# 案例1：查询女神名和对应的男神名
SELECT
    name,
    boyName
FROM
    beauty,
    boys
WHERE
    beauty.boyfriend_id = boys.id;

# 案例2：查询员工名和对应的部门名
SELECT
    last_name,
    department_name
FROM
    employees,
    departments
WHERE
    employees.department_id = departments.department_id;

