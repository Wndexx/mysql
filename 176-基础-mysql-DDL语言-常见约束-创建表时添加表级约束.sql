# 2. 添加表级约束
/*
    语法：在各个字段的最下面
        【constraint 约束名】约束类型(字段名)
*/
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo (
    id      INT,
    stuname VARCHAR(20),
    gerder  CHAR(1),
    seat    INT,
    age     INT,
    majorid INT,
    CONSTRAINT pk PRIMARY KEY (id),# 主键
    CONSTRAINT uq UNIQUE (seat), # 唯一键
    CONSTRAINT ck CHECK (gerder = '男' OR gerder = '女'),# 检查
    CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorid) REFERENCES major (id) # 外键
);

DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo (
    id      INT,
    stuname VARCHAR(20),
    gerder  CHAR(1),
    seat    INT,
    age     INT,
    majorid INT,
    PRIMARY KEY (id),# 主键
    UNIQUE (seat), # 唯一键
    CHECK (gerder = '男' OR gerder = '女'),# 检查
    FOREIGN KEY (majorid) REFERENCES major (id) # 外键
);

SHOW INDEX FROM stuinfo;

# 通用的写法
CREATE TABLE IF NOT EXISTS stuinfo (
    id      INT PRIMARY KEY,
    stuname VARCHAR(20) NOT NULL,
    gender  CHAR(1),
    age     INT DEFAULT 18,
    seat    INT UNIQUE,
    majorid INT,
    CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorid) REFERENCES major (id)
);