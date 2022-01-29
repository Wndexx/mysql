/*
    DML 语言（Data Manipulation Language 数据操纵语言）
    插入：insert
    修改：update
    删除：delete

*/

# 一、插入语句
# 方式一：经典的插入
/*
    语法：
    insert into 表名(列名,...) values (值1,...);

*/
SELECT *
FROM beauty;
# 1. 插入的值的类型要与列的类型一致或兼容
# （字符型用单引号<双引号也行，但不推荐>隔开，日期型用单引号隔开且要符合日期格式）
#  (values 后面不用加空格<加了也不报错>)
INSERT
INTO beauty(id, name, sex, borndate, phone, photo, boyfriend_id)
VALUES (13, '唐艺昕', '女', '1990-4-23', '18988888888', NULL, 2);

# 2. 不可以为 null 的列必须插入值，可以为 null 的列如何插入值
# 方式一：列名写，值用 null 填充
INSERT
INTO beauty(id, name, sex, borndate, phone, photo, boyfriend_id)
VALUES (13, '唐艺昕', '女', '1990-4-23', '18988888888', NULL, 2);
# 方式二：列名和值都省略
INSERT
INTO beauty(id, name, sex, borndate, phone, boyfriend_id)
VALUES (14, '金星', '女', '1990-4-23', '13888888888', 9);
#
DESC beauty;
INSERT
INTO beauty(id, name, sex, phone)
VALUES (15, '娜扎', '女', '13888888888');

# 3. 列的顺序可以调换
INSERT
INTO beauty(name, sex, id, phone)
VALUES ('蒋欣', '女', 16, '110');

# 4. 列数和值的个数必须一致
INSERT
INTO beauty(name, sex, id, phone)
VALUES ('关晓彤', '女', 17, '110');

# 5. 可以省略列名,默认所有列，列的顺序和表中列的顺序一致
INSERT
INTO beauty
VALUES (18, '张飞', '男', NULL, '119', NULL, NULL);

# 方式二
/*
    语法
    insert into 表名
    set 列名 = 值,列名 = 值,...

*/
INSERT
INTO beauty
SET id   = 19,
    name='刘涛',
    phone='999';

# 两种插入语句的比较
# 1. 方式一 支持插入多行，方式二不支持
INSERT
INTO beauty
VALUES (23, '唐艺昕1', '女', '1990-4-23', '18988888888', NULL, 2),
       (24, '唐艺昕2', '女', '1990-4-23', '18988888888', NULL, 2),
       (25, '唐艺昕3', '女', '1990-4-23', '18988888888', NULL, 2);

# 2. 方式一支持子查询，方式二不支持
INSERT
INTO beauty(id, name, phone)
SELECT 26,
       '宋茜',
       '118';

INSERT
INTO beauty(id, name, phone)
SELECT id,
       boyName,
       '118222'
FROM boys
WHERE id < 3;
SELECT *
FROM boys;


