# 常见约束
/*
    CREATE TABLE 表名(
        字段名 字段类型 列级约束,
        字段名 字段类型 列级约束,
        表级约束
    )

    含义：一种限制，用于限制表中的数据，为了保证表中的数据的准确和可靠性（一致性）

    分类：六大约束
            NOT NULL        非空，用于保证该字段的值不能为空。比如姓名、学号等
            DEFAULT         默认，用于保证该字段有默认值。比如性别
            PRIMARY KEY     主键，用于保证该字段的值具有唯一性，并且非空。比如学号、员工编号等
            UNIQUE          唯一，用于保证该字段的值具有唯一性，可以为空。比如座位号等
            CHECK           检查约束【mysql 中不支持】，限制数据范围，比如年龄、性别
            FOREIGN KEY     外键，用于限制两个表的关系，用于保证该字段值必须来自于主表的关联列的值。(从表添加外键约束，引用主表某字段的值)。比如 学生表的专业编号、员工表的部门编号、员工表的工种编号

    添加约束的时机：
        1. 创建表时
        2. 修改表时（数据添加之前）

    约束的添加分类
        列级约束：
            六大约束语法上都支持，但外键约束没有效果
        表级约束：
            除了非空、默认，其他的都支持
*/