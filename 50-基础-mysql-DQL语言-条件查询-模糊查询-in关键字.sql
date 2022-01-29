/*
    - in 关键字

        - 含义：判断某字段的值是否属于 in 列表中的某一项

        - 特点：

            - 使用 in 提高语句简洁度

            - in 列表的值类型必须统一或者兼容（隐式转换）

            - 不支持通配符 % _
*/


# 案例：查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES 中的一个的员工名和工种编号

SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    job_id = 'IT_PROG' OR
    job_id = 'AD_VP' OR
    job_id = 'AD_PRES';

SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    job_id IN ('IT_PROG', 'AD_VP', 'AD_PRES');