# 3. 表的删除
# drop table【if exists】表名;
# if not exists/if exists 只能在数据库的创建和删除或表的创建和删除中使用，新增列和删除列的时候不能用
DROP TABLE IF EXISTS book_author;

SHOW TABLES;

# 通用的写法
# drop database if exists 旧库名;
# create database 新库名;

# drop table if exists 旧表名;
# create table 新表名(...);