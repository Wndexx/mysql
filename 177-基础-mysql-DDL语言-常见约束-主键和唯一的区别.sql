/*
    主键和唯一的区别
                            保证唯一性       是否允许为空      一个表中可以有多少个      是否允许组合
                主键            是               否             至多有一个             是，但不推荐
                唯一            是               是             可以有多个             是，但不推荐
*/

DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo(
  id INT PRIMARY KEY,
  stuName VARCHAR(20) NOT NULL ,
  gender CHAR(1),
  seat INT UNIQUE ,
  seat2 INT UNIQUE ,
  age INT DEFAULT 18,
  majorid INT,
  CONSTRAINT fk_stuinfo_major FOREIGN KEY (majorid) REFERENCES major(id)
);

DROP TABLE IF EXISTS major;
CREATE TABLE major(
  id INT PRIMARY KEY ,
  majorname VARCHAR(20) NOT NULL
);

DESC stuinfo;
SHOW INDEX FROM stuinfo;

SELECT * FROM stuinfo;
SELECT * FROM major;

# mysql 允许在唯一索引字段中添加多个 null 值
INSERT INTO major VALUES (1,'java'),(2,'h5');
INSERT INTO stuinfo VALUES (1,'john','男',NULL,19,1,1);
INSERT INTO stuinfo VALUES (2,'lily','男',NULL,19,2,2);

# 允许两个列或多个列组合成一个主键或唯一键
DROP TABLE IF EXISTS stuinfo;
CREATE TABLE stuinfo (
    id      INT,
    stuname VARCHAR(20),
    gerder  CHAR(1),
    seat    INT,
    age     INT,
    majorid INT,
    seat2 INT,
    PRIMARY KEY (id,stuname),# 主键
    UNIQUE (seat,seat2), # 唯一键
    CHECK (gerder = '男' OR gerder = '女'),# 检查
    FOREIGN KEY (majorid) REFERENCES major (id) # 外键
);
INSERT INTO stuinfo VALUES (1,'john','男',NULL,19,1,1);
INSERT INTO stuinfo VALUES (1,'lily','男',NULL,19,2,2);
