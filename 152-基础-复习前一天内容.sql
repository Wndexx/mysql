/*
    四、sql99 语法
        1、内连接
            语法：
                select 查询列表
                from 表1 别名
                【inner】 join 表2 on 连接条件
                where 筛选条件
                group by 分组列表
                having 分组后的筛选
                order by 排序列表
                limit 子句;
            特点：
                (1) 表的顺序可以调换
                (2) 内连接的结果 = 多表的交集
                (3) n 表连接至少需要 n-1 个连接条件
            分类：
                等值连接
                非等值连接
                自连接

        2、外连接
            语法：
                select 查询列表
                from 表1 别名
                left|right|full【outer】 join 表2 on 连接条件
                where 筛选条件
                group by 分组列表
                having 分组后的筛选
                order by 排序列表
                limit 子句;
            特点：
                (1) 查询的结果 >= 主表中所有的行，如果从表和它匹配的将显示匹配行，如果从表没有匹配的则显示 null
                (2) left join 左边的就是主表，right join 右边的就是主表，full join 两边都是主表
                (3) 一般用于查询除了交集部分的剩余的不匹配的行

        3、交叉连接
            语法：
                select 查询列表
                from 表1 别名
                cross join 表2 别名;
            特点：
                类似于笛卡尔乘积

    子查询
    一、含义
        嵌套在其他语句内部的 select 语句称为 子查询 或 内查询
        外面的语句可以是 insert、update、delete、select等，一般 select 作为外面语句较多
        外面如果为 select 语句，则此语句称为外查询或主查询

    二、分类
        1、按出现位置
            select 后面：
                仅仅支持标量子查询
            from 后面
                表子查询
            where/having 后面
                标量子查询
                列子查询
                行子查询
            exists 后面
                标量子查询、列子查询、行子查询、表子查询

        2、按结果集的行列
            标量子查询（单行子查询）：结果集为一行一列
            列子查询（多行子查询）：结果集为一列多行
            行子查询：结果集为多行多列
            表子查询（嵌套子查询）：结果集为任意行列

    三、示例
    where 或 having 后面
        1、标量子查询
            案例：查询最低工资的员工姓名和工资
            (1) 最低工资
                select min(salary) from employees
            (2) 查询员工的姓名和工资，要求工资 = (1)
                select last_name, salary from employees where salary = (select min(salary) from employees);

        2、列子查询
            案例：查询所有是领导的员工的姓名
            (1) 查询所有员工的 manage_id
                select distinct manage_id from employees
            (2) 查询姓名，要求 employee_id 属于 (1) 列表中的一个
                select last_name from employees where employee_id in(select distinct manage_id from employees);

    分页查询
    一、应用场景
        当要查询的条目数太多，一页显示不全
    二、语法
        select 查询列表
        from 表
        limit 【offset,】size;
    注意：
        offset 代表的是起始的条目索引，默认从 0 开始
        size 代表的是显示的条目数
    公式：
        假如要显示的页数为 page，每一页的条目数为 size
        select 查询列表
        from 表
        limit (page-1)*size, size;


*/
