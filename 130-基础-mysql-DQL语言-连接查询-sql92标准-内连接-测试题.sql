# 1. 显示员工表的最大工资、工资平均值
SELECT
    MAX(salary),
    ROUND(AVG(salary), 2)
FROM
    employees;

# 2. 查询员工表的 employee_id，job_id，last_name，按 department_id 降序，salary 升序
SELECT
    department_id,
    salary,
    employee_id,
    job_id,
    last_name
FROM
    employees
ORDER BY
    department_id DESC,
    salary;

# 3. 查询员工表的 job_id 中包含 a 和 e 的，并且 a 在 e 的前面
SELECT
    *
FROM
    employees
WHERE
    job_id LIKE '%a%e%';

# 4. 已知表 student，里面有 id（学号），name，gradeId（年级编号）
#    已知表 grade， 里面有 id（年级编号），name（年级名）
#    已知表 result，里面有 id，score，studentNo（学号）
#  要求查询姓名，年级名。成绩
# select s.name, g.name, r.score from student s, grade g, result r where s.gradeId = g.id and s.id = r.studentNo;

# 5. 显示当前日期，以及去前后空格，截取子字符串的函数
#  select now();
#  select trim(字符 from '');
#  select substr(str,startIndex)
#  select substr(str,startIndex,length)