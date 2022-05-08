# 三、删除语句
/*
    方式一：delete (删除整行)
    语法：
        1. 单表的删除
            delete from 表名 where 筛选条件
        2. 多表的删除（级联删除）
        sql92语法
            delete 表1的别名, 表2的别名     （删除哪个表的信息，delete 后面加哪个表的别名；如果都删，都加）
            from 表1 别名,表2
            where 连接条件
            and 筛选条件;
        sql99语法
            delete 表1的别名, 表2的别名
            from 表1 别名
            inner|left|right join 表2 别名 on 连接条件
            where 筛选条件;


    方式二：truncate
    语法：
        truncate table 表名;
*/

# 方式一：delete
# 1. 单表的删除
# 案例1：删除手机号以 9 结尾的女神信息
DELETE
FROM
    beauty
WHERE
    phone LIKE '%9';

# 2. 多表的删除
# 案例1：删除张无忌的女朋友的信息
DELETE b
FROM
    beauty        b
        JOIN boys bo ON b.boyfriend_id = bo.id
WHERE
    bo.boyName = '张无忌';

# 案例2：黄晓明的信息以及他女朋友的信息
DELETE bo,b
FROM
    boys            bo
        JOIN beauty b ON bo.id = b.boyfriend_id
WHERE
    bo.boyName = '黄晓明';


# 方式二：truncate 语句（清空数据）
# 不能添加筛选条件和多表连接
# 案例：将魅力值 > 100 的男神信息删除
TRUNCATE TABLE boys;

# delete 和 truncate 的比较【面试题】
# 1. delete 可以加 where 条件，truncate 不能加
# 2. truncate 删除，效率较高
# 3. 假如要删除的表中有自增长列，
#    如果用 delete 删除后，再插入数据，自增长列的值从断点开始
#    而 truncate 删除后，再插入数据，自增长列的值从 1 开始
# 4. truncate 删除没有返回值，delete 删除有返回值
# 5. truncate 删除不能回滚，delete 删除可以回滚

SELECT
    *
FROM
    boys;

DELETE
FROM
    boys;

TRUNCATE TABLE boys;

INSERT
INTO
    boys(boyname, usercp)
VALUES
    ('张飞', 100),
    ('刘备', 100),
    ('关云长', 100);