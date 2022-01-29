/*
    约束
    一、常见的约束
        not null        非空，该字段的值必填
        unique          唯一，代表该字段的值不可重复
        default         默认，该字段的值不用手动插入有默认值
        check           检查，mysql 不支持
        primary key     主键，该字段的值不可重复并且非空 unique + not null
        foreign key     外键，该字段的值引用了另外的表的字段

        主键和唯一
        1. 区别
            (1) 一个表至多有一个主键，但可以有多个唯一键
            (2) 主键不允许为空，唯一可以为空
        2. 相同点
            (1) 都具有唯一性
            (2) 都支持组合键，但不推荐

    外键：
        1. 用于限制两个表的关系，从表的字段值（外键列）引用了主表的某字段值（被引用列，关联列）
        2. 外键列和主表的被引用列要求类型一致，意义一样，名称不要求
        3. 主表的被引用列要求是一个 key （一般就是主键）
        4. 插入数据，先插入主表；先有主表，再有从表外键连接
           删除数据，先删除从表；先删除从表，再删除主表

        可以通过以下两种方式删除主表的记录
            # 方式一：级联删除
                alter table stuinfo add constraint fk_stuinfo_major foreign key(majorid) references major(id) on delete cascade; # 级联删除
            # 方式二：级联置空
                alter table stuinfo add constraint fk_stuinfo_major foreign key(majorid) references major(id) on delete set null; # 级联置空

        删除主表关联列：
            传统的方式添加外键
            alter table stuinfo add constraint fk_stuinfo_major foreign key(majorid) references major(id);
            select * from major;
            insert into major values(1,'java'),(2,'h5'),(3,'大数据');
            select * from stuinfo;
            insert into stuinfo
            select 1,'john1','女',null,null,1 union all
            select 2,'john2','女',null,null,1 union all
            select 3,'john3','女',null,null,2 union all
            select 4,'john4','女',null,null,2 union all
            select 5,'john5','女',null,null,1 union all
            select 6,'john6','女',null,null,3 union all
            select 7,'john7','女',null,null,3 union all
            select 8,'john8','女',null,null,1

            # 删除专业表的3号专业
            delete from major where id = 3;

            # 方式一：级联删除
            show index from stuinfo;
            alter table stuinfo drop foreign key fk_stuinfo_major;
            alter table stuinfo add constraint fk_stuinfo_major foreign key(majorid) references major(id) on delete cascade; # 级联删除
            delete from major where id = 3;

            # 方式二：级联置空
            alter table stuinfo add constraint fk_stuinfo_major foreign key(majorid) references major(id) on delete set null; # 级联置空
            delete from major where id = 2;

    二、创建表时添加约束
        create table 表名(
            字段名 字段类型 primary,  # 主键
            字段名 字段类型 not null, # 非空
            字段名 字段类型 unique,   # 唯一
            字段名 字段类型 default,  # 默认
            constraint 约束名 foreign key(字段名) references 主表(被引用列)
        );
        注意：
                        支持类型            是否可以起约束名
            列级约束     除了外键            不可以
            表级约束     除了非空和默认       可以，但对主键无效

            列级约束可以在一个字段上追加多个，中间按空格隔开，没有顺序要求，但要符合逻辑（比如 default 和 unique 不能一起用<default 为 null 时可以>）

    三、修改表时添加或删除约束
        1. 非空
            (1)添加非空
                alter table 表名 modify column 字段名 字段类型 not null;
            (2)删除非空
                alter table 表名 modify column 字段名 字段类型;
        2. 默认
            (1)添加默认
                alter table 表名 modify column 字段名 字段类型 default;
            (2)删除默认
                alter table 表名 modify column 字段名 字段类型;
        3. 主键
            (1)添加主键
                alter table 表名 add【constraint 约束名】 primary key(字段名);
                alter table 表名 modify column 字段名 字段类型 primary key;
            (2)删除主键
                alter table 表名 drop primary key;
        4. 唯一
            (1)添加主键
                alter table 表名 add【constraint 索引名】 unique(字段名);
                alter table 表名 modify column 字段名 字段类型 unique;
            (2)删除主键
                alter table 表名 drop index 索引名;
        5. 外键
            (1)添加主键
                alter table 表名 add【constraint 外键名】 foreign key(字段名) references 主表(被引用列);
            (2)删除主键
                alter table 表名 drop foreign key 外键名;

    四、自增长列（标识列）
        特点：
            1. 不用手动插入值，可以自动提供序列值，默认从 1 开始，步长为 1
                如果要更改起始值：手动插入值
                如果要更改步长：更改系统变量 set auto_increment_increment = 步长;
            2. 一个表至多有一个自增长列
            3. 自增行列只能支持数值型
            4. 自增长列必须为一个 key (mysql 是这样，其他数据库普通列也行)

        一、创建表时设置自增长列
            create table 表(
                字段名 字段类型 约束 auto_increment
            )
        二、修改表时设置自增长列
            alter table 表 modify column 字段名 字段类型 约束 auto_increment;
        三、删除自增长列
            alter table 表 modify column 字段名 字段类型 约束;

    事务
    一、含义
        事务：一条或多条 sql 语句组成一个执行单位，一组 sql 要么都执行，要么都不执行

    二、特点（ACID）
        A 原子性：一个事务是不可再分隔的整体，要么都执行，要么都不执行
        C 一致性：一个事务可以使数据一个一致状态切换到另外一个一致的状态（数据是准确的、完整的、可靠的）
        I 隔离性：一个事务不受其他事务的干扰，多个事务相互隔离
        D 持久性：一个事务一旦提交，则永久的持久化到本地

    三、事务的使用步骤
        了解：
        隐式（自动）事务：没有明显的开启和结束，本身就是一条事务可以自动提交，比如 select、insert、update、delete
        显示事务：具有明显的开启和结束

        使用显式事务:
        (1) 开启事务
            set autocommit = 0;
            start transaction;【可以省略】
        (2) 编写一组逻辑 sql 语句
            注意：事务中的 sql 语句 insert、update、delete、select
            设置回滚点
            savepoint 回滚点名;
        (3) 结束事务
            提交：commit
            回滚：rollback
            回滚到指定的地方：rollback to 回滚点名;

    四、并发事务
    1. 事务的并发问题是如何发生的
        多个事务同时操作同一个数据库的相同数据时
    2. 并发问题都有哪些
        脏读：对于两个事务 T1、T2，T1 读取了已经被 T2 更新但还没有被提交的字段，之后，若 T2 回回滚，T1 读取的内容就是临时且无效的
        不可重复读：对于两个事务 T1、T2，T1 读取了了一个字段，然后 T2 更新了该字段，之后，T1 再次读取同一字段，值就不同了
        幻读：对于两个事务 T1、T2，T1 从一个表中读取了一个字段，然后 T2 在该表中插入了一些新的行。之后 T1 再次读取同一个表，就会多出几行
    3. 如何解决并发问题
        通过设置隔离级别来解决并发问题
    4. 隔离级别
                                            脏读       不可重复读       幻读
        read uncommitted    读未提交          ×             ×            ×
        read committed      读已提交          √             ×            ×          （oracle 默认）
        repeatable read     可重复读          √             √            √          （mysql 默认）
        serializable        串行化            √             √            √

         √：可以解决  ×：不可以解决


    视图
    一、含义
        mysql 5.1 版本出现的新特性，本身是一个虚拟表（结果集），它的数据来自于表，通过执行时动态生成
        好处：
            1. 简化 sql 语句
            2. 提高 sql 的重用性
            3. 保护基表的数据，提高了安全性
    二、创建
        create view 视图名
        as
        查询语句;
    三、修改
        方式一：
            create or replace view 视图名  as  查询语句;
        方式二：
            alter view 视图名 as 查询语句;
    四、删除
        drop view 视图1, 视图2,...;
    五、查看
        desc 视图名;
        show create view 视图名;
    六、使用
        1. 插入 insert
        2. 修改 update
        3. 删除 delete
        4. 查看 select
        注意：视图一般用于查询的，而不是更新的，所以具备以下特点的视图都不允许更新：
            (1) 包含分组函数、group by、distinct、having、union
            (2) join
            (3) 常量视图
            (4) where 后面的子查询用到了 from 中的表
            (5) 用到了不可更新的视图
            (6) select 后面的子查询
    七、视图和表的对比
                    关键字     是否占用物理空间               使用
        视图        view     占用较小，只保存 sql 逻辑        一般用于查询
        表          table    保存实际的数据                  增删改查
*/
