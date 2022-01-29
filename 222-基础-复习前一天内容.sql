/*
    变量
    一、系统变量
        说明：变量由系统提供的，不用自定义
        语法：
            (1) 查看系统变量
                show 【global|session】 variables like ''; 如果没有显式声明 global 还是 session，则默认是 session
            (2) 查看指定的系统变量的值
                select @@【global|session】.变量名。如果没有显式声明 global 还是 session，则默认是 session
            (3) 为系统变量赋值
                方式一：
                    set 【global|session】 变量名 = 值; 如果没有显式声明 global 还是 session，则默认是 session
                方式二：
                    set @@【global|session.】变量名 = 值; 如果没有显式声明 global 还是 session，则默认是 session
        1. 全局变量
            服务器层面上的，必须拥有 super 权限才能为系统变量赋值，作用域为整个服务器，也就是针对于所有连接（会话）有效
        2. 会话变量
            服务器为每一个连接的客户端都提供了系统变量，作用域为当前的连接（会话）


    二、自定义变量
        说明：
        1. 用户变量
            作用域：针对于当前连接（会话）生效
            位置：begin end 里面或外面
            使用：
                (1) 声明并赋值:
                    set @变量名 = 值;
                    set @变量名 := 值;
                    select @变量名 := 值;
                (2) 更新值
                    方式一：
                        set @变量名 = 值;
                        set @变量名 := 值;
                        select @变量名 := 值;
                    方式二：
                        select xx into @变量名【 from 表】;
                (3) 使用
                    select @变量名;
    2. 局部变量
        作用域：仅仅在定义它的 begin end 中有效
        位置：只能放在 begin end 中，而且只能放在第一句
        使用：
            (1) 声明
                declare 变量名 类型 【default 值】;
            (2) 赋值或更新
                方式一：
                    set 变量名 = 值;
                    set 变量名 := 值;
                    select @变量名 := 值;
                方式二：
                    select xx into 变量名【 from 表】;
            (3) 使用
                select 变量名;

    存储过程和函数
        说明：都类似于 java 中的方法，将一组完成特定功能的逻辑语句包装起来，对外暴露名字
        好处
            1. 提高了重用性
            2. sql 语句简单
            3. 减少了编译次数和与数据库连接的次数，提高了效率

    存储过程
        一、创建 ★
            create procedure 存储过程名(参数模式 参数名 参数类型,...)
            begin
                存储过程体
            end
            注意:
                1. 参数模式：in、out、inout，其中 in 可以省略
                2. 存储过程体的每一条 sql 语句都需要用分号结尾

        二、调用
            call 存储过程名(实参列表)
            举例：
            调用 in 模式的参数       call sp1('值');
            调用 out 模式的参数      set @name = 初始值; call sp1(@name); select @name;
            调用 inout 模式的参数    set @name = 值;    call sp1(@name); select @name;

        三、查看
            show create procedure 存储过程名;

        四、删除
            drop procedure 存储过程名;

    函数
    一、创建
        create function 函数名(参数名 参数类型,...) returns 返回类型
        begin
            函数体
        end
        注意：函数体肯定需要由 return 语句，有且只有一个返回值

    二、调用
        select 函数名(实参列表);

    三、查看
        show create function 函数名;

    四、删除
        drop function 函数名;

    流程控制结构
        说明：
        顺序结构：程序从上往下依次执行
        分支结构：程序按条件进行选择执行，从两条或者多条路径中选择一条执行
        循环结构：程序在满足一定条件下，重复执行一组语句

    分支结构
        1. if 函数
            功能：实现简单双分支
            语法
                if(条件, 值1, 值2)
            位置：可以作为表达式放在任何位置

        2. case 结构
            功能：实现多分支
            语法1：
                case 表达式或字段
                when 值1 then 语句1;
                when 值2 then 语句2;
                ...
                else 语句 n;
                end 【case】;
            语法2：
                case
                when 条件1 then 语句1;
                when 条件2 then 语句2;
                ...
                else 语句 n;
                end 【case】;
            位置：
                可以放在任何位置
                如果放在 begin end 外面，作为表达式结合着其他语句使用
                如果放在 begin end 里面，一般作为独立的语句使用

        3. if 结构
            功能：实现多分支
            语法：
                if 条件 1 then 语句1;
                elseif 条件2 then 语句2;
                ...
                else 语句 n;
                end if;
            位置：只能放在 begin end 中

    循环结构
        位置：只能放在 begin end 中
        特点：都能实现循环结构
        对比：
            (1) 这三种循环都可以省略名称，但如果循环中添加了循环控制语句（iterate 或 leave），则必须添加名称
            (2)
                loop 一般用于实现简单的死循环
                while 先判断，后执行
                repeat 先执行，后判断，无条件至少执行一次

        1. while
            语法：
            【名称:】while 循环条件 do
                循环体
            end while 【名称】;

        2. loop
            语法：
            【名称:】loop
                循环体
            end loop 【名称】;

        3. repeat
            【名称:】repeat
                循环体
            until 结束条件 end repeat 【名称】;

        循环控制语句

        leave：类似于 break，用于跳出所在的循环
        iterate：类似于 continue，用于结束本次循环，继续下一次

*/


