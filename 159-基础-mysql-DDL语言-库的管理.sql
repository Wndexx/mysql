# DDL
/*
    数据定义语言(Data Definition Language)
    库和表的管理

    一、库的管理
        创建、修改、删除
    二、表的管理
        创建、修改、删除

    创建：create
    修改：alter
    删除：drop
*/

# 一、库的管理
# 1. 库的创建
/*
    语法
    create database【if not exists】库名【character set 字符集】;

*/
# 案例：创建库 Books（不区分大小写）
CREATE DATABASE books;
# 容错性处理 if not exists
CREATE DATABASE IF NOT EXISTS books;

# 2. 库的修改
# 一般不修改，容易导致数据丢失
# (1)库名也不修改
# RENAME DATABASE books TO 新库名;（5.1.x 后已弃用）
# (2) 更改库的字符集
ALTER DATABASE books CHARACTER SET gbk;

# 3. 库的删除
# 容错性处理 if exists
DROP DATABASE IF EXISTS books;