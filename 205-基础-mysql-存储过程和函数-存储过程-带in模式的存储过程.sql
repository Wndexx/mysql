# 2. 创建带 in 模式参数的存储过程（in 可以省略，默认就是 in）
# 案例1：创建存储过程实现根据女神名，查询对应的男神信息
DELIMITER $
CREATE PROCEDURE myp2(IN beautyName VARCHAR(20))
BEGIN
    SELECT
        bo.*
    FROM
        boys                  bo
            RIGHT JOIN beauty b ON bo.id = b.boyfriend_id
    WHERE
        b.name = beautyName;
END $

# 调用
CALL myp2('柳岩');
CALL myp2('小昭');

# 案例2：创建存储过程实现用户是否登录成功
# 如果直接写 username = username ，根据就近原则，都是局部变量 username ，恒成立
DELIMITER $
CREATE PROCEDURE myp3(IN username VARCHAR(20), IN password VARCHAR(20))
BEGIN
    DECLARE result INT DEFAULT 0; # 声明并初始化
    SELECT
        COUNT(*)
    INTO result # 赋值
    FROM
        admin
    WHERE
        admin.username = username AND
        admin.password = password;
    SELECT IF(result > 0, '成功', '失败'); # 使用
END $

CALL myp3('张飞', '8888');


/*
    create procedure myp3(in username varchar(20),in password varchar(20))
    begin
        declare result int default 0;
        select count(*) into result from admin a where a.username = username and a.password = password;
        select if(result > 0,'成功','失败');
    end

    public void myp3(string username,string password){
        int result = 0;
        result = 'select count(*) from admin a where a.username = username and a.password = password';
        System.out.println(result >0?'成功':'失败');
    }
*/