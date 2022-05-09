# 案例
# 1. 创建函数，实现传入两个 float，返回二者之和
DROP FUNCTION test_sum;
CREATE FUNCTION test_sum(num1 FLOAT, num2 FLOAT) RETURNS FLOAT
BEGIN
    DECLARE s FLOAT DEFAULT 0;
    # SET s = num1 + num2;
    SELECT
        num1 + num2
    INTO s;
    RETURN s;
END;
SELECT test_sum(1.1, 1.2);
