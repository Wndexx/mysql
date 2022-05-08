# 2. 会话变量
/*
    作用域：仅仅针对于当前的会话（连接）有效
*/
# (1) 查看所有的会话变量
SHOW SESSION VARIABLES;
SHOW VARIABLES;

# (2) 查看部分的会话变量
SHOW VARIABLES LIKE '%char%';
SHOW SESSION VARIABLES LIKE '%char%';

# (3) 查看指定的会话变量的值
SELECT @@tx_isolation;
SELECT @@session.tx_isolation;

# (4) 为某个指定的会话变量赋值
# 方式一:
SET @@tx_isolation = 'read-uncommitted';
SET @@session.tx_isolation = 'read-uncommitted';
# 方式二:
SET TX_ISOLATION = 'repeatable-read';
SET SESSION TX_ISOLATION = 'read-committed';
