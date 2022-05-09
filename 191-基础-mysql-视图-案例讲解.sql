# 1. 创建视图 emp_v1，要求查询电话号码以 '011' 开头的员工姓名和工资、邮箱
CREATE OR REPLACE VIEW emp1_v1
AS
    SELECT
        last_name,
        salary,
        email,
        phone_number
    FROM
        employees
    WHERE
        phone_number LIKE '011%';

SELECT
    *
FROM
    emp1_v1;

# 2. 创建视图 emp_v2，要求查询部门的最高工资高于 12000 的部门信息
# (1) 查询部门的最高工资
CREATE OR REPLACE VIEW emp_v2
AS
    SELECT
        department_id,
        MAX(salary) max_sal
    FROM
        employees
    GROUP BY
        department_id;

# (2) 查询部门信息，要求 (1) > 12000
CREATE OR REPLACE VIEW emp_v3
AS
    SELECT
        d.*,
        e.max_sal
    FROM
        departments     d
            JOIN emp_v2 e ON d.department_id = e.department_id
    WHERE
        e.max_sal > 12000;

# 或
CREATE OR REPLACE VIEW emp_v4
AS
    SELECT
        MAX(salary) max_sal,
        department_id
    FROM
        employees
    GROUP BY department_id
    HAVING
        MAX(salary) > 12000;



SELECT
    d.*,
    e.max_sal
FROM
    departments     d
        JOIN emp_v4 e ON d.department_id = e.department_id;

SELECT
    *
FROM
    emp_v3;
