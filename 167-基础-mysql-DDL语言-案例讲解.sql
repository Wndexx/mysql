CREATE DATABASE IF NOT EXISTS test;
USE test;
# 1. 创建表 dept1
CREATE TABLE dept1 (
    id   INT(7),
    name VARCHAR(25)
);
DESC dept1;

# 2. 将表 departments 中的数据插入到新表 dept2 中
CREATE TABLE dept2
SELECT
    *
FROM
    myemployees.departments;

SELECT
    *
FROM
    dept2;

# 3. 创建表 emp5
CREATE TABLE emp5 (
    id         INT(7),
    first_name VARCHAR(25),
    last_name  VARCHAR(25),
    dept_id    INT(7)
);

# 4. 将列 last_name 的长度增加到 50
ALTER TABLE emp5
    MODIFY COLUMN last_name VARCHAR(50);
DESC emp5;

# 5. 根据表 employees 创建 employees2
CREATE TABLE employees2 LIKE myemployees.employees;
SELECT
    *
FROM
    employees2;

# 6. 删除表 emp5
DROP TABLE IF EXISTS emp5;

# 7. 将表 employees2 重命名为 emp5
ALTER TABLE employees2 RENAME TO emp5;

# 8. 在表 dept 和 emp5 中添加新列 test_column，并检查所做的操作
ALTER TABLE emp5
    ADD COLUMN test_column INT;
DESC emp5;

# 9. 直接删除表 emp5 中的列 test_column
ALTER TABLE emp5
    DROP COLUMN test_column;