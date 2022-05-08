/*
    - 按条件表达式筛选

        - > < = <>(建议) != >= <= <=>安全等于

        - 不等于

            - 支持 != 的书写格式，但是建议用 <>
*/

# 案例2：查询 部门编号不等于90号 的员工名和部门编号

SELECT
    last_name ,
    department_id
FROM
    employees
WHERE
    department_id <> 90;

SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id != 90;
