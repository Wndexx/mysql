# 1. 空参列表
# 案例：插入到 admin 表中五条记录
SELECT * FROM admin;

DELIMITER $
CREATE PROCEDURE myp1()
BEGIN
    INSERT INTO admin(username, password) VALUES ('john','000'),('lily','0000'),('rose','0000'),('jack','0000'),('tom','0000');
END $

# 调用
CALL myp1();

SELECT * FROM admin;

# 在 cmd 中， delimiter $ 后面的分隔符都要用 $
# CALL myp1()$
