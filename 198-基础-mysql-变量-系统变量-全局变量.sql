# 1. 全局变量
/*
    作用域：服务器每次启动将为所有的全局变量赋初识值，针对于所有的会话（连接）有效。但是不能跨重启，(重启服务会恢复默认值)
*/
# (1) 查看所有的全局变量
SHOW GLOBAL VARIABLES;

# (2) 查看部分的全局变量
SHOW GLOBAL VARIABLES LIKE '%char%';

# (3) 查看指定的全局变量的值
SELECT @@global.autocommit;
SELECT @@global.tx_isolation;


# (4) 为某个指定的全局变量赋值
SET @@global.autocommit = 0;
SET GLOBAL AUTOCOMMIT = 0;
