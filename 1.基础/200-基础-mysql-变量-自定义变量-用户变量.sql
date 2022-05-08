# 二、自定义变量
/*
    说明：变量时用户自定义的，不是由系统提供的
    使用步骤：
    声明
    赋值
    使用（查看、比较、运算等）
*/
# 1. 用户变量
/*
    作用域：针对于当前会话（连接）有效，同于会话变量的作用域
    应用在任何地方，也就是 begin end 里面或 begin end 外面
*/
# （1）声明并初始化（声明必须初始化）
# 赋值的操作符：= 或 :=
#   set @用户变量名 = 值;
#   set @用户变量名 := 值;
#   select @用户变量名 := 值;
#   select @用户变量名 = 值; # 不能这样写！！！

# （2）赋值（更新用户变量的值）
# 方式一：通过 set 或 select
#   set @用户变量名 = 值;
#   set @用户变量名 := 值;
#   select @用户变量名 := 值;
#   select @用户变量名 = 值; # 不能这样写！！！
# 案例：
SET @name = 'john';
SET @name = 100;

# 方式二：通过 select into
#   select 字段 into @变量名 from 表;
# 案例：
SET @count = 1;
SELECT
    COUNT(*)
INTO @count
FROM
    employees;

# (3) 使用（查看用户变量的值）
#   select @用户变量名;
SELECT @count;