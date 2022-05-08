# 三、from 后面
/*
    将子查询结果充当一张表，要求必须起别名
*/
# 案例：查询每个部门的平均工资的工资等级
# (1) 查询每个部门的平均工资
SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id;
# (2) 连接 (1) 的结果集和 job_grades 表，筛选条件 平均工资 between lowest_sal and highest_sal
#     (1) 的结果集必须起别名，否则找不到，将其当作一张普通表使用
SELECT
    ag_dep.*,
    grade_level
FROM
    (
        SELECT
            department_id,
            AVG(salary) ag

        FROM
            employees
        GROUP BY
            department_id
    )                   ag_dep
        JOIN job_grades g ON ag_dep.ag BETWEEN g.lowest_sal AND g.highest_sal;



