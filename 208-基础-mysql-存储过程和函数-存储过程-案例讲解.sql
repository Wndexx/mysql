# 1. 创建存储过程或函数实现传入用户和密码，插入到 admin 表中
# 存储过程
CREATE PROCEDURE myp7(IN username VARCHAR(20), IN password VARCHAR(20))
BEGIN
    INSERT
    INTO
        admin
    VALUES
        (NULL, username, password);
END;
CALL myp7('张三', '123');
SELECT
    *
FROM
    admin;

# 创建函数
CREATE FUNCTION myf1(username VARCHAR(20), password VARCHAR(20)) RETURNS INT
BEGIN
    DECLARE m INT DEFAULT 0;
    INSERT
    INTO
        admin
    VALUES
        (NULL, username, password);
    RETURN m;
END;
SELECT myf1('李四', '123');

# 2. 创建存储过程或函数实现传入女神编号，返回女神名称和女神电话
CREATE PROCEDURE myp8(IN id INT, OUT beautyName VARCHAR(20), OUT telephone VARCHAR(20))
BEGIN
    SELECT
        b.name,
        b.phone
    INTO beautyName,telephone
    FROM
        beauty b
    WHERE
        b.id = id;
END;
SET @bName = '';
SET @tel = '';
CALL myp8(2, @bName, @tel);
SELECT @bName 女神名称, @tel 女神电话;

# 3. 创建存储过程或函数实现传入两个女神生日，返回大小
CREATE PROCEDURE myp9(IN birth1 DATETIME, IN birth2 DATETIME, OUT result INT)
BEGIN
    SELECT
        DATEDIFF(birth1, birth2)
    INTO result;
END;
CALL myp9('2012-1-1','2013-1-1',@result);
SELECT @result;

# 4. 创建存储过程或函数实现传入一个日期，格式化称 xx年xx月xx日 并返回
# 存储过程
CREATE PROCEDURE myp10 (IN date DATETIME,OUT dateF VARCHAR(20))
BEGIN
    SELECT date_format(date,'%y年%m月%d日') INTO dateF;
END;
CALL myp10('2012-1-1',@date);
SELECT @date;

# 函数
CREATE FUNCTION myf2(date DATETIME) RETURNS VARCHAR(20)
BEGIN
    DECLARE dateF VARCHAR(20) DEFAULT '';
    SELECT date_format(date,'%y年%m月%d日') INTO dateF;
    RETURN dateF;
END;
SELECT myf2('2011-3-15');

# 5. 创建存储过程或函数实现传入女神名称，返回：女神 AND 男神 格式的字符串。如：传入：小昭，返回 小昭 AND 张无忌
# 存储过程
DROP PROCEDURE myp11;
CREATE PROCEDURE myp11(IN beautyName VARCHAR(20), OUT str VARCHAR(20))
BEGIN
    SELECT
        CONCAT(beautyName, ' AND ', IFNULL(boyName, 'null'))
    INTO str
    FROM
        beauty             b
            LEFT JOIN boys bo ON b.boyfriend_id = bo.id
    WHERE
        b.name = beautyName;
END;
CALL myp11('小昭', @str);
SELECT @str;
CALL myp11('柳岩', @str);
SELECT @str;

# 函数
CREATE FUNCTION myf3(beautyName VARCHAR(20)) RETURNS VARCHAR(20)
BEGIN
    SET @s ='';
    SELECT
        CONCAT(beautyName,' AND ', boyName)
    INTO @s
    FROM
        beauty        b
            JOIN boys bo ON b.boyfriend_id = bo.id
    WHERE
            b.name = beautyName;
    RETURN @s;
END;
SELECT myf3('赵敏');

# 6. 创建存储过程或函数，根据传入的条目数和起始索引，查询 beauty 表的记录
CREATE PROCEDURE myp12(IN offset INT,IN size INT)
BEGIN
    SELECT * FROM beauty LIMIT offset, size;
END;

CALL myp12(1,10);














































































































