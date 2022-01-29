/*
    - 字符函数

        - length 获取参数值的字节个数

            - utf8：一个字母占一个字节，一个汉字占三个字节

            - gbk：一个字母占一个字节，一个汉字占两个字节
*/

SELECT LENGTH('john');

SELECT LENGTH('张三丰hahaha');

# 查看字符集
SHOW VARIABLES LIKE '%char%';

