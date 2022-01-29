# 查询部门编号不是在 90 到 110 之间，或者工资高于 15000 的员工信息

SELECT *
FROM
    myemployees.employees
WHERE
    NOT (department_id >= 90 AND department_id <= 110) OR
    salary > 15000;
