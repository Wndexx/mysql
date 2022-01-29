# 2. 局部变量
/*
    作用域：仅仅在定义它的 begin end 中有效
    应用在 begin end 中的第一句话 ！！！
*/
# (1) 声明（可以只声明不赋初始值）
#   declare 变量名 类型;
#   declare 变量名 类型 default 值;

# (2) 赋值
# 方式一：通过 set 或 select
#   set 局部变量名 = 值;
#   set 局部变量名 := 值;
#   select @局部变量名 := 值; （select 必须加 @）

# 方式二：通过 select into
#   select 字段 into 局部变量名 from 表;

# (3) 使用
# select 局部变量名;

/*
    对比用户变量和局部变量

                作用域             定义和使用的位置                    语法
    用户变量     当前的会话         会话中的任何地方                    必须加 @ 符号，不用限定类型
    局部变量     begin end 中      只能在 begin end 中，且为第一句      一般不用加 @ 符号，需要限定类型

*/

# 案例：声明两个变量并赋初始值，求和，并打印
# 1. 用户变量
SET @m = 1;
SET @n = 2;
SET @sum = @m + @n;
SELECT @sum;

# 2. 局部变量
# DECLARE m INT DEFAULT 1;
# DECLARE n INT DEFAULT 2;
# DECLARE sum INT;
# SET sum = m + n;
# SELECT sum;
