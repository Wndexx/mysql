# 二、 修改表时追加约束
/*
    1. 添加列级约束
    alter table 表名 modify column 字段名 字段类型 新约束;
    2. 添加表级约束
    alter table 表名 add【constraint 约束名】约束类型(字段名)【外键的引用】;
*/
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo (
    id      INT,
    stuname VARCHAR(20),
    gerder  CHAR(1),
    seat    INT,
    age     INT,
    majorid INT
);
# 1. 添加非空约束
ALTER TABLE stuinfo MODIFY stuname VARCHAR(20) NOT NULL;
DESC stuinfo;

# 2. 添加默认约束
ALTER TABLE stuinfo MODIFY COLUMN age INT DEFAULT 18;

# 3. 添加主键
# (1) 列级约束
ALTER TABLE stuinfo MODIFY COLUMN id INT PRIMARY KEY;
# (2) 表级约束
ALTER TABLE stuinfo ADD PRIMARY KEY (id);

# 4. 添加唯一键
# (1) 列级约束
ALTER TABLE stuinfo MODIFY COLUMN seat INT UNIQUE;
# (2) 表级约束
ALTER TABLE stuinfo ADD UNIQUE (seat);

# 5. 添加外键
ALTER TABLE stuinfo ADD CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorid) REFERENCES major (id);
SHOW INDEX FROM stuinfo;