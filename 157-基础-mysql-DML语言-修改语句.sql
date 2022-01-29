# 二、修改语句
/*
    1. 修改单表的记录
    语法
        update 表名
        set 列 = 新值,列 = 新值,...
        where 筛选条件;
        （新值的类型要与列的类型一致或兼容 字符型用单引号<双引号也行，但不推荐>隔开，日期型用单引号隔开且要符合日期格式）
    执行顺序：update -> where -> set

    2. 修改多表的记录（级联更新）
    语法
    sql92语法
        update 表1 别名, 表2 别名
        set 列 = 值,...
        where 连接条件
        and 筛选条件;
    sql99语法
        update 表1 别名
        inner|left|right join 表2 别名
        on 连接条件
        set 列 = 值,...
        where 筛选条件
*/
SELECT
    *
FROM
    beauty;
# 1. 修改单表的记录
# 案例1：修改 beauty 表中姓 '唐' 的女神的电话为 13899888899
UPDATE beauty
SET
    phone = '13899888899'
WHERE
    name LIKE '唐%';

# 案例2：修改 boys 表中 id 为 2 的名称为 '张飞'，魅力值为 10
UPDATE boys
SET
    boyName = '张飞',
    userCP  = 10
WHERE
    id = 2;

SELECT
    *
FROM
    boys;

# 2. 修改多表的记录(级联更新)
# 案例1：修改张无忌的女朋友的手机号为 114
UPDATE
    boys bo
        INNER JOIN beauty b ON bo.id = b.boyfriend_id
SET
    b.phone='114'
WHERE
    bo.boyName = '张无忌';

# 案例2：修改没有男朋友的女神的男朋友编号都为 2
UPDATE
    beauty b
        LEFT JOIN boys bo ON b.boyfriend_id = bo.id
SET
    b.boyfriend_id = 2
WHERE
    bo.id IS NULL;