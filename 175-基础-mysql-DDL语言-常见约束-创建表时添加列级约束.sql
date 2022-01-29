# 一、创建表时添加约束
# 1. 添加列级约束
/*
    语法：
    直接在字段名和类型后面追加 约束类型 即可。
    只支持：默认、非空、主键、唯一

*/
CREATE DATABASE students;
USE students;
CREATE TABLE stuinfo (
    id       INT PRIMARY KEY,                               # 主键
    stu_name VARCHAR(20) NOT NULL,                          # 非空
    gender   CHAR(1) CHECK ( gender = '男' OR gender = '女'), # 检查约束
    seat     INT UNIQUE,                                    # 唯一约束
    age      INT DEFAULT 18,                                # 默认约束
    majorId  INT REFERENCES major (id)                      # 外键约束
);

CREATE TABLE major (
    id         INT PRIMARY KEY,
    major_name VARCHAR(20)
);

DESC stuinfo;
# 查看表中所有的索引。主键、外键、唯一自动生成索引
SHOW INDEX FROM stuinfo;