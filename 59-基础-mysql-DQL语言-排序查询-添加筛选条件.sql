# 案例：查询 部门编号 >= 90 的员工信息，按入职时间的先后进行排序【添加筛选条件】

SELECT
    *
FROM
    employees
WHERE
        department_id >= 90
ORDER BY
    hiredate;