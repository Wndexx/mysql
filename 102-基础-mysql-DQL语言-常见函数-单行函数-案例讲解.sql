# 1. 显示系统时间（注：日期 + 时间）
SELECT NOW();

# 2. 查询员工号，姓名，工资，以及工资提高 20% 之后的结果（new salary）
#    不能使用 (1 + 20%)
SELECT
    employee_id,
    last_name,
    salary,
    salary * 1.2 AS "new salary"
FROM
    employees;

# 3. 将员工的姓名按首字母排序，并写出姓名的长度（length）
SELECT
    last_name,
    LENGTH(last_name)       长度,
    SUBSTR(last_name, 1, 1) 首字符
FROM
    employees
ORDER BY
    首字符;

# 4. 做一个查询，产生下面的结果
#    <last_name> earns <salary> monthly but wants <salary * 3>  （Dream Salary）
SELECT
    CONCAT(last_name, ' earns ', TRUNCATE(salary, 0), ' monthly but wants ', TRUNCATE(salary * 3, 0)) AS 'Dream Salary'
FROM
    employees;

# 5. 使用 case_when ，按照下面的条件
#       job         grade
#       AD_PRES     A
#       ST_MAN      B
#       IT_PROG     C
#       SA_REP      D
#       ST_CLERK    E
SELECT
    last_name 'Last_name',
    job_id    'Job_id',
    CASE job_id
        WHEN 'AD_PRES'  THEN 'A'
        WHEN 'ST_MAN'   THEN 'B'
        WHEN 'IT_PROG'  THEN 'C'
        WHEN 'SA_REP'   THEN 'D'
        WHEN 'ST_CLERK' THEN 'E'
#  这里 ELSE 可以省略
    END       'Grade'
FROM
    employees;

