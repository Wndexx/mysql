/*
    - 按逻辑表达式查询

         - && 和 and ：两个条件都为 true，结果为true；反之为 false

         - || 和 or ：只要有一个条件为 true ，结果为 true ，反之为 false

         - ! 和 not ：如果连接的条件本身为 false，结果为true，反之为 false
*/


# 案例1：查询 工资在 10000 到 20000 之间的员工名、工资以及奖金

SELECT
    last_name,
    salary,
    salary * 12 * IFNULL(commission_pct, 0)
FROM
    myemployees.employees
WHERE
    salary >= 10000 AND
    salary <= 20000;


