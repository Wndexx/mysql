# 1. 查询没有奖金，且工资小于 18000 的 salary，last_name
SELECT
    salary,
    last_name
FROM
    employees
WHERE
    commission_pct IS NULL AND
    salary < 18000;

# 2. 查询 employee 表中，job_id 不为 'IT' 或者 工资为 12000 的员工信息
SELECT *
FROM
    employees
WHERE
    job_id NOT LIKE '%IT%' OR
    salary = 12000;


# 3. 查看部门 departments 表的结构
DESC departments;

# 4. 查询部门 departments 表中涉及到哪些位置编号
SELECT DISTINCT
    location_id
FROM
    departments;

# 5. 经典面试题
#    试问：select * from employees; 和
#         select * from employees where commission_pct like '%%' and last_name like '%%';
#    结果是否一样？并说明原因

# 如果判断的字段有 null 值，不一样。  like '%%' 获取所有非空数据

SELECT *
FROM
    employees
WHERE
    commission_pct LIKE '%%' AND
    last_name LIKE '%%';