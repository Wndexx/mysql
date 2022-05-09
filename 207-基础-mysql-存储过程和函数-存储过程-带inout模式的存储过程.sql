# 4. 带 inout 模式的存储过程
# 案例1：传入 a 和 b 两个值，要求 a 和 b 都翻倍并返回
CREATE PROCEDURE myp6(INOUT a INT, INOUT b INT)
BEGIN
    SET a = a * 2;
    SET b = b * 2;
END;
# 调用
SET @m = 10;
SET @n = 20;
CALL myp6(@m, @n);
SELECT @m, @n;