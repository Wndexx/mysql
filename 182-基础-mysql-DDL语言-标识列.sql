# 标识列
/*
    又称为自增长列
    含义：可以不用手动的插入值，系统提供默认的序列值。（默认从 1 开始，每次自增长 1）

    特点
    1. 标识列必须和主键搭配吗？ 不一定，但要求是一个 key      there can be only one auto column and it must be defined as a key
    2. 一个表中可以有几个标识列？至多一个
    3. 标识列的类型只能是数值型
    4. 标识列可以通过 set auto_increment_increment = 3 设置步长；
       也可以通过 手动插入值，设置起始值

*/
# 一、创建表时设置标识列
# 定义：又称 自增长列，默认从 1 开始，每次自增长 1
DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity (
    id   INT PRIMARY KEY AUTO_INCREMENT,
    name FLOAT,
    seat INT
);
DESC tab_identity;

# (1) 标识列可以不插入值，但对应的字段也不可以写
INSERT INTO tab_identity(name) VALUES ('lucy');
# (2) 如果写了标识列的字段，对应的值可以写 null 进而实现其自增长的效果
INSERT INTO tab_identity(id, name) VALUES (NULL,'john');

# 特点
# 1. 标识列不一定和主键搭配，但必须是一个 key。（主键、唯一、外键都是一个 key，也可以自定义 key）
DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity (
    id   INT UNIQUE AUTO_INCREMENT,
    name FLOAT,
    seat INT
);
DESC tab_identity;


# 2. 一个表中可以至多有一个标识列
# there can be only one auto column and it must be defined as a key
DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity (
    id   INT UNIQUE AUTO_INCREMENT,
    name FLOAT UNIQUE AUTO_INCREMENT,
    seat INT
);
DESC tab_identity;

# 3. 标识列的类型只能是数值型
# Incorrect column specifier for column 'name'
DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity (
    id   INT,
    name VARCHAR(20) UNIQUE AUTO_INCREMENT,
    seat INT
);
DESC tab_identity;

# 4. 标识列可以通过 set auto_increment_increment = 3 设置步长；也可以通过 手动插入值，设置起始值
#   auto_increment_increment 1 每次自增1；auto_increment_offset 1 起始值是 1
#   mysql 支持设置 auto_increment_increment 步长；设置 auto_increment_offset 1 没有效果
SHOW VARIABLES LIKE '%auto_increment%';

DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity (
    id   INT UNIQUE AUTO_INCREMENT,
    name VARCHAR(20),
    seat INT
);
DESC tab_identity;
TRUNCATE TABLE tab_identity;
SELECT * FROM tab_identity;
# (1) 更改步长
SET AUTO_INCREMENT_INCREMENT = 1;
# (2) 更改起始值
INSERT INTO tab_identity(id, name) VALUES (10,'john');
INSERT INTO tab_identity(id, name) VALUES (NULL,'john');

# 二、修改表时设置标识列
DROP TABLE IF EXISTS tab_identity;
CREATE TABLE tab_identity (
    id   INT,
    name FLOAT,
    seat INT
);
ALTER TABLE tab_identity MODIFY COLUMN id INT PRIMARY KEY AUTO_INCREMENT;
DESC tab_identity;

# 三、修改表时删除标识列
ALTER TABLE tab_identity MODIFY COLUMN id INT;


