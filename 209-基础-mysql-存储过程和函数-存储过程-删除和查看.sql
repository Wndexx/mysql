# 二、删除存储过程
/*
    语法：drop procedure 存储过程名; (只能依次删除一个)
*/
DROP PROCEDURE myp1;
# DROP PROCEDURE myp2，myp3; # 错误

# 三、查看存储过程的信息
# DESC myp2; # 不能用 desc，desc 只能查看 表 和 视图
SHOW CREATE PROCEDURE myp2;

# 对存储过程的修改不能修改里面的逻辑语句，只能修改存储过程本身的一些特点