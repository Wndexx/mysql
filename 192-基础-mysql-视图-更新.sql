# 五、视图的更新
/*
    视图的可更新性和视图中查询的定义有关系，以下类型的视图是不能更新的
        包含以下关键字的 sql 语句：分组函数、distinct、group by、having、union 或 union all
        常量视图
        select 中包含子查询
        join
        from 一个不能更新的视图
        where 子句的子查询引用了 from 子句中的表
*/
CREATE OR REPLACE VIEW myv1
AS
    SELECT
        last_name,
        email,
        salary * 12 * (1 + IFNULL(commission_pct, 0)) "annual salary"
    FROM
        employees;

CREATE OR REPLACE VIEW myv1
AS
    SELECT
        last_name,
        email
    FROM
        employees;

SELECT
    *
FROM
    myv1;
SELECT
    *
FROM
    employees;

# 对视图的增删改会更改原始表，不安全，所以需要给视图增加只读权限
# 1. 插入
INSERT
INTO
    myv1
VALUES
    ('张飞', 'zf@qq.com');

# 2. 修改
UPDATE myv1
SET
    last_name = '张无忌'
WHERE
    last_name = '张飞';

# 3. 删除
DELETE
FROM
    myv1
WHERE
    last_name = '张无忌';

# 添加只读权限

# 具备以下特点的视图不允许更新
# (1) 包含以下关键字的 sql 语句：分组函数、distinct、group by、having、union 或 union all
CREATE OR REPLACE VIEW myv1
AS
    SELECT
        MAX(salary) max_sal,
        department_id
    FROM
        employees
    GROUP BY
        department_id;
SELECT
    *
FROM
    myv1;
#更新
UPDATE myv1
SET
    max_sal = 9000
WHERE
    department_id = 10;

# (2) 常量视图
CREATE OR REPLACE VIEW myv2
AS
    SELECT 'john' name;
SELECT
    *
FROM
    myv2;
# 更新
UPDATE myv2
SET
    name = 'lucy';

# (3) select 中包含子查询
CREATE OR REPLACE VIEW myv3
AS
    SELECT
        (
            SELECT
                MAX(salary)
            FROM
                employees
        ) 最高工资;
SELECT
    *
FROM
    myv3;
# 更新
UPDATE my_v3
SET
    最高工资 = 10000;

# (4) join(sql 92 语法也不行)
CREATE OR REPLACE VIEW myv4
AS
    SELECT
        last_name,
        department_name
    FROM
        employees            e
            JOIN departments d ON d.department_id = e.department_id;
# 更新
SELECT * FROM myv4;
UPDATE myv4 SET last_name = '张飞' WHERE last_name ='Whalen'; # 可以
INSERT INTO myv4 VALUES ('陈真','xxxx');

# (5) from 一个不能更新的视图
CREATE OR REPLACE VIEW myv5
AS
    SELECT * FROM  myv3;
# 更新
SELECT * FROM myv5;
UPDATE myv5 SET 最高工资 =10000;

# (6) where 子句的子查询引用了 from 子句中的表（主要还是出于自连接的考虑）
CREATE OR REPLACE VIEW myv6
AS
    SELECT
        last_name,
        email,
        salary
    FROM
        employees
    WHERE
            employee_id IN (
                               SELECT
                                   manager_id
                               FROM
                                   employees
                               WHERE
                                   manager_id IS NOT NULL
                           );

SELECT * FROM myv6;
# 更新
UPDATE myv6 SET salary = 10000 WHERE last_name = 'k_ing';
