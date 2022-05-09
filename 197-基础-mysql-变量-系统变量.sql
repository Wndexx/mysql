# 一、系统变量
/*
    分类：
        全局变量
        会话变量

    说明：变量由系统提供，不是用户定义，属于服务器层面

    语法：
        1. 查看所有的系统变量
            show global|【session】variables;
        2. 查看满足条件的部分系统变量
            show global|【session】variables like '%character%';
        3. 查看指定的某个系统变量的值
            select  @@global|【session】.系统变量名;
        4. 为某个系统变量赋值
            方式一：
                set global|【session】 系统变量名 = 值;.
            方式二：
                set @@global|【session】.系统变量名 = 值;

    注意：如果是全局级别，则需要加 global；如果是会话级别，则需要加 session；如果不写，则默认 session
*/
# 1. 查看所有的系统变量
# 查看全局变量
SHOW GLOBAL VARIABLES;
# 查看会话变量
SHOW SESSION VARIABLES;