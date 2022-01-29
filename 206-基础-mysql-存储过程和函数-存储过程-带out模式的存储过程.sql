# 3. 创建带 out 模式的存储过程
# 案例1：根据女神名，返回对应的男神名
DELIMITER $
CREATE PROCEDURE myp4(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20))
BEGIN
    SELECT
        bo.boyName
    INTO boyName
    FROM
        boys                  bo
            RIGHT JOIN beauty b ON b.boyfriend_id = bo.id
    WHERE
        b.name = beautyName;
END $
# 调用
SET @boyName = ''; # 也可以不定义
CALL myp4('小昭', @boyName);
SELECT @boyName;

# 案例2：根据女神名，返回对应的男神名和男神魅力值
CREATE PROCEDURE myp5(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20), OUT userCP INT)
BEGIN
    SELECT
        bo.boyName,
        bo.userCP
    INTO
        boyName,
        userCP
    FROM
        boys                  bo
            RIGHT JOIN beauty b ON b.boyfriend_id = bo.id
    WHERE
        b.name = beautyName;
END;
# 调用
CALL myp5('小昭', @bName, @usercp);
SELECT @bName, @usercp;
