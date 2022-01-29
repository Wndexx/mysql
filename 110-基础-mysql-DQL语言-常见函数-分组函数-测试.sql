# 1. 查询公司员工工资的最大值，最小值，平均值，总和
SELECT
    MAX(salary)           mx_sal,
    MIN(salary)           mi_sal,
    ROUND(AVG(salary), 2) ag_sal,
    SUM(salary)           sm_sal
FROM
    employees;

# 2. 查询员工表中的最大入职时间和最小入职时间的相差天数（DIFFERENCE）
/*
     datediff(date1, date2);

        - 返回 date2 与 date1 的天数差
*/
SELECT
    DATEDIFF(MAX(hiredate), MIN(hiredate)) AS DIFFERENCE
FROM
    employees;

# 3. 查询部门编号为 90 的员工个数
SELECT
    COUNT(*)
FROM
    employees
WHERE
    department_id = 90;