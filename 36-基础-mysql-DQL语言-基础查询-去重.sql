/*
    - 去重

        - select distinct 字段名 from 表名;

            - select distinct a,b from 表名;   不能这样写，逻辑不通

*/


# 案例：查询员工表中涉及到的所有部门编号

SELECT DISTINCT
    department_id
FROM
    employees;


