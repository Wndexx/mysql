# 案例演示
# 1. 无参有返回
# 案例：返回公司的员工个数
CREATE FUNCTION myf4() RETURNS INT
BEGIN
    DECLARE c INT DEFAULT 0; # 定义变量
    SELECT
        COUNT(*)
    INTO c                   # 赋值
    FROM
        employees;
    RETURN c;
END;
SELECT myf4();

# 2. 有参有返回
# 案例1：根据员工名，返回工资
DROP FUNCTION myf5;
CREATE FUNCTION myf5(emp_name VARCHAR(20)) RETURNS DOUBLE
BEGIN
    SET @sal = 0; # 定义用户变量
    SELECT
        salary
    INTO @sal     # 赋值
    FROM
        employees
    WHERE
        last_name = emp_name;
    RETURN @sal;
END;
SELECT myf5('Kochhar');

# 案例2：根据部门名，返回该部门的平均工资
DROP FUNCTION myp6;
CREATE FUNCTION myp6(dept_name VARCHAR(20)) RETURNS DOUBLE
BEGIN
    DECLARE avg_sal DOUBLE;
    SELECT
        AVG(salary)
    INTO avg_sal
    FROM
        employees                  e
            RIGHT JOIN departments d ON e.department_id = d.department_id
    WHERE
        d.department_name = dept_name;
    RETURN avg_sal;
END;

SELECT myp6('Adm') 平均工资;
