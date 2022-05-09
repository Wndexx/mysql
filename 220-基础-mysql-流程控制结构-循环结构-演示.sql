# 1. 没有添加循环控制语句
# 案例：批量插入，根据次数插入到 admin 表中多条记录
CREATE PROCEDURE pro_while1(IN ins_count INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    a:WHILE i <= ins_count  DO
        INSERT INTO admin(username, password) VALUES(CONCAT('Rose', i), '666');
        SET i = i + 1;
    END WHILE a;
END;
CALL pro_while1(100);
SELECT * FROM admin;
/*
    int i = 1;
    while(i <= insertCount){
        // 插入
        i++;
    }
*/

# 2. 添加 leave 语句
# 案例：批量插入，根据次数插入到 admin 表中多条记录，如果次数 > 20 则停止
TRUNCATE TABLE admin;
DROP PROCEDURE pro_while1;
CREATE PROCEDURE pro_while1(IN ins_count INT)
BEGIN
    DECLARE i INT DEFAULT 1;
    a:WHILE i <= ins_count DO
        INSERT INTO admin(username, password) VALUES (concat('xiaohua',i),'000');
        IF i >= 20 THEN LEAVE a;
        END IF;
        SET i = i + 1;
    END WHILE a;
END;
CALL pro_while1(100);
SELECT * FROM admin;

# 3. 添加 iterate 语句
# 案例：批量插入，根据次数插入到 admin 表中多条记录，只插入偶数次
TRUNCATE TABLE admin;
DROP PROCEDURE pro_while1;
CREATE PROCEDURE pro_while1(IN ins_count INT)
BEGIN
    DECLARE i INT DEFAULT 0;
    a:WHILE i <= ins_count DO
        SET i = i + 1;
        IF MOD(i, 2) <> 0 THEN ITERATE a;
        END IF;
        INSERT INTO admin(username, password) VALUES (concat('xiaohua',i),'000');
    END WHILE a;

END;
CALL pro_while1(100);
SELECT * FROM admin;

/*
   int i = 0;
   while(i <= insertCount){
        i++;
        if(i % 2 != 0) continue;
        // insert
   }
*/




















