/*
    外键
        1. 要求在从表设置外键关系
        2. 从表的外键列的类型和主表的关联列的类型要求一致或兼容，名称无要求
        3. 主表中的关联列必须是一个 key（一般是主键或唯一，外键也可以，但无意义）
        4. 插入数据时，先插入主表，再插入从表
        5. 删除数据时，先删除从表，再删除主表
*/
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo (
    id      INT PRIMARY KEY,
    stuName VARCHAR(20) NOT NULL,
    gender  CHAR(1),
    seat    INT UNIQUE,
    seat2   INT UNIQUE,
    age     INT DEFAULT 18,
    majorid INT,
    CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorid) REFERENCES major (id)
);

DROP TABLE IF EXISTS major;
CREATE TABLE major (
    id        INT UNIQUE ,
    majorname VARCHAR(20)
);

# 每个列可以添加多个列级约束，中间用空格隔开即可