# 2. 表的修改
/*
    alter table 表名 add|drop|modify|change column 列名 【列类型 约束】
*/

# (1) 修改列名
/*
    语法
    alter table 表名 change 【column】 旧列名 新列名 新列的类型;
    column 可以省略
*/
# 新列名后面必须跟类型
ALTER TABLE book
    CHANGE COLUMN publishDate pubDate DATETIME;
DESC book;

# (2) 修改列的类型或约束
/*
    语法
    alter table 表名 modify column 列名 新的类型或约束;
    column 不可以省略
*/
ALTER TABLE book
    MODIFY COLUMN pubDate TIMESTAMP;

# (3) 添加新列
/*
    语法
    alter table 表名 add column 新列的列名 新列的类型;
    column 不可以省略
*/
ALTER TABLE author
    ADD COLUMN  annual DOUBLE;
DESC author;

# (4) 删除列
/*
    语法
    alter table 表名 drop column 列名;
    column 不可以省略
    drop column 后面 不能加 if exists
*/
ALTER TABLE book
    DROP COLUMN annual;

# (5) 修改表名
/*
    语法
    alter table 表名 rename to 新表名;
*/
ALTER TABLE author RENAME TO book_author;