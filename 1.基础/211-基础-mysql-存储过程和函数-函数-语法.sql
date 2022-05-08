# 一、创建语法
/*
    语法：
        create function 函数名(参数列表) returns 返回类型
        begin
            函数体
        end

    注意：
        1. 参数列表 包含两部分：参数名 参数类型
        2. 函数体：肯定会有 return 语句，如果没有会报错；如果 return 语句没有放在函数体的最后也不报错，但不建议
            return 值;
        3. 函数体中仅有一句话，则可以省略 begin end
        4. 使用 delimiter 语句设置结束标记
*/

# 二、调用语法
# select 函数名(参数列表)