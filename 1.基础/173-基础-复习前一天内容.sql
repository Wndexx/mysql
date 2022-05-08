/*
    联合查询
    一、含义
        union：合并、联合，将多次查询结果合并成一个结果

    二、语法
        查询语句1
        union【all】
        查询语句2
        union【all】
        ...

    三、意义
        1. 将一条比较复杂的查询语句拆分成多条语句
        2. 适用于查询多个表的时候，查询的列基本一致

    四、特点
        1. 要求多条查询语句的查询列数必须一致
        2. 要求多条查询语句的查询的各列类型、顺序最好一致
        3. union 去重，union all 包含重复项

    查询总结
    一、语法：
        select 查询列表
        from 表1 别名
        连接类型 join 表2 别名
        on 连接条件
        where 筛选
        group by 分组列表
        having 筛选
        order by 排序列表
        limit 起始索引,条目数

        执行顺序：from -> join -> on -> where -> group by -> having -> select -> order by -> limit
        插叙列表最好不要用 * ，提高可读性和性能

    DML 语言
    插入
    一、方式一
        语法
            insert into 表名(字段名,...) values(值,...);
        特点：
            1. 要求值的类型和字段的类型要一致或兼容(隐式转换)
            2. 字段的个数和顺序不一定与原始表中的字段个数和顺序一致；但必须保证值和字段一一对应
            3. 假如表中有可以为 null 的字段，注意可以通过以下两种方式插入 null 值
                (1) 字段和值都省略
                (2) 字段写上，值使用 null
            4. 字段和值的个数必须一致
            5. 字段名可以省略，默认所有列

    二、方式二
        语法
        insert into 表名 set 字段 = 值,字段 = 值,...;

        两种方式的区别：
        1. 方式一支持依次插入多行，语法如下：
            insert into 表名【(字段名,...)】values(值,...),(值,...),...;
        2. 方式一支持子查询，语法如下：
            insert into 表名 查询语句

    修改
    一、修改单表的记录
        语法：update 表名 set 字段 = 值,字段 = 值,...【where 筛选条件】;

    二、修改多表的记录(级联更新)
     语法：
        update 表1 别名
        left|right|inner join 表2 别名
        on 连接条件
        set 字段 = 值,字段 = 值,...
        【where 筛选条件】;

    删除
    方式一：使用 delete
    一、删除单表的记录
        语法：delete from 表名【where 筛选条件】【limit 条目数】
#         DELETE FROM beauty LIMIT 1;

    二、删除多表的记录(级联删除)
        语法
        delete 别名1,别名2 from 表1 别名
        inner|left|right join 表2 别名
        on 连接条件
        【where 筛选条件】;

    方式二：使用 truncate
        语法：truncate table 表名

    两种方式的区别【面试题】
        1. truncate s删除后，如果再插入，标识列(自增长列)从 1 开始
           delete 删除后，如果再插入，标识列从端点开始
        2. delete 可以添加筛选条件
           truncate 不可以添加筛选条件
        3. truncate 效率较高
        4. truncate 没有返回值
           delete 可以返回受影响的行数
        5. truncate 不可以回滚
           delete 可以回滚

    DDL语言
    库的管理
    一、创建库
        create database【if not exists】库名【character set 字符集】;

    二、修改库
        alter database 库名 character set 字符集;

    三、删除库
        drop database 【if exists】 库名;

    表的管理
    一、创建表
        create table 【if not exists】 表名(
            字段名  字段类型 【约束】,
            字段名  字段类型 【约束】,
            ...
            字段名  字段类型 【约束】
        )

    二、修改表
        1. 添加列
            alter table 表名 add column 列名 类型 【约束】【first| after 字段名】;（没有 last）

            create table test_add_column (t1 int, t2 int, t3 int);
            alter table test_add_column add column newT int first;
            alter table test_add_column add column newT2 int after t2;
        2. 修改列的类型或约束
            alter table 表名 modify column 新列名 类型 【约束】;
        3. 修改列名
            alter table 表名 change 【column】 旧列名 新列名 类型;
        4. 删除列
            alter table 表名 drop column 列名;
        5. 修改表名
            alter table 表名 rename 【to】 新表名;

    三、删除表
        drop table【if exists】 表名;

    四、复制表
        1. 复制表的结构
            create table 表名 like 旧表
        2. 复制表的结构 + 数据
            create table 表名
            select 查询列表 from 旧表 【where 筛选】;
    数据类型
    一、数值型
    1. 整型
        tinyint、smallint、mediumint、int/integer、bigint
            1       2           3          4        8
        特点：
            (1) 都可以设置无符号和有符号，默认有符号，通过 unsigned 设置无符号
            (2) 如果超出了范围，会报 out of range 异常，插入临界值（严格模式直接报错）
            (3) 长度可以不指定，默认会有一个长度。长度代表显示的最大宽度，如果不够则左边用 0 填充，但需要搭配 zerofill，并且变为无符号整型
    2. 浮点型
        定点数：decimal(M,D)
        浮点数：
            float(M,D)      4
            double(M,D)     8
        特点：
            (1) M 代表整部位位数 + 小数部位位数，D 代表小数部位位数
            (2) 如果超出范围，则报 out of range 异常，并且插入临界值(严格模式直接报错)
            (3) M 和 D 都可以省略。但对于定点数，M 默认为 10，D 默认为 0；float 和 double 根据插入数值的精度来决定精度
            (4) 如果精度要求较高，则优先考虑使用定点数

    二、字符型
        char、varchar、binary、varbinary、enum、set、text、blob

        char：固定长度的字符，写法为 char(M)，最大长度不能超过 M，其中 M 可以省略，默认为 1
        varchar：可变长度的字符，写法为 varchar(M)，最大长度不能超过 M，其中 M 不可以省略

    三、日期型
        year 年
        date 日期
        time 时间
        datetime 日期 + 时间    8
        timestamp 日期 + 时间   4   比较容易收时区，语法模式、版本的影响，更能反映当前时区的真实时间

    常见的约束



*/