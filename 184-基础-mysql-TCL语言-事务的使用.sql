/*
    事务的创建
    隐式事务：事务没有明显的开启和结束的标记。比如 insert、update、delete 语句
    autocommit ON 默认自动提交的功能是开启的
    delete from 表 where id = 1;

    显式事务：事务具有明显的开启和结束的标记
    前提：必须先设置自动提交功能为禁用

    set autocommit = 0;

    步骤1：开启事务
        set autocommit = 0;
        start transaction; 可选的
    步骤2：编写事务中的 sql 语句(select insert update delete)（create alter drop 等 DDL 语言没有事务之说）
        语句1;
        语句2;
        ...
    步骤3：结束事务
    （之前的 sql 语句结果只保存在内存，并没有提交到磁盘文件。只有有了结束的标记 commit 或 rollback 才决定是撤销还是写到磁盘文件）
        commit; 提交事务
        rollback; 回滚事务

        savepoint 节点名; 设置保存点

    开启事务的语句：
    update 表 set 张三丰的余额 = 500 where name = '张三丰';
    update 表 set 郭襄的余额 = 500 where name = '郭襄';
    结束事务的语句：
*/
# autocommit ON 默认自动提交的功能是开启的
SHOW VARIABLES LIKE 'autocommit';

SET AUTOCOMMIT = 0;

# 1. 演示事务的使用步骤
DROP TABLE IF EXISTS account;
CREATE TABLE account (
    id       INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(20),
    balance  DOUBLE
);
INSERT INTO account(username, balance) VALUES ('张无忌',1000),('赵敏',1000);

# 开启事务
SET AUTOCOMMIT = 0;
START TRANSACTION;
# 编写一组事务的语句
UPDATE account SET balance = 500 WHERE username = '张无忌';
UPDATE account SET balance = 1500 WHERE username = '赵敏';
# 结束事务(成功提交)
COMMIT;

SELECT * FROM account;

# 开启事务
SET AUTOCOMMIT = 0;
START TRANSACTION;
# 编写一组事务的语句
UPDATE account SET balance = 1000 WHERE username = '张无忌';
UPDATE account SET balance = 1000 WHERE username = '赵敏';
# 结束事务(回滚)
ROLLBACK;

# 2. 演示事务对于 delete 和 truncate 的处理的区别
SET AUTOCOMMIT = 0;
DELETE FROM account;
ROLLBACK;

# truncate 无法回滚
SET AUTOCOMMIT = 0;
TRUNCATE account;
ROLLBACK;

# 3. 演示 savepoint 的使用
SET AUTOCOMMIT = 0;
START TRANSACTION;
DELETE FROM account WHERE  id = 3;
DELETE FROM account WHERE  id = 4;
SAVEPOINT a; # 设置保存点
DELETE FROM account WHERE  id = 2;
ROLLBACK TO a; # 回滚到保存点

