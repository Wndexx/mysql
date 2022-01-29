# 二、表的管理
# 1. 表的创建（重点）
/*
    语法
    create table 【if not exists】 表名(
        列名 列的类型【(长度) 列的约束】,
        列名 列的类型【(长度) 列的约束】,
        列名 列的类型【(长度) 列的约束】,
        ...
        列名 列的类型【(长度) 列的约束】
    );
*/
# 案例：创建表 Book
# varchar 长度必须写
CREATE TABLE  book (
    id          INT,        # 编号
    bName       VARCHAR(20),# 图书名
    price       DOUBLE,     # 价格
    authorId    INT,        # 作者编号
    publishDate DATETIME    # 出版日期

);
DESC book;

CREATE TABLE author (
    id      INT,
    au_name VARCHAR(20),
    nation  VARCHAR(10)
);
DESC author;