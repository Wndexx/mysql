# 一、整型
/*
        整数类型        字节          范围
        tinyint         1           有符号：-128 ~ 127                                  无符号：0 ~ 255
        smallint        2           有符号：-32768 ~ 32767                              无符号：0 ~ 65535
        mediumint       3           有符号：-8233608 ~ 8388607                          无符号：0 ~ 16177215
        int、integer    4           有符号：-2147483648 ~ 2147483647                    无符号：0 ~ 4294967295
        bigint          8           有符号：-9223372036854775808 ~ 9223372036854775807  无符号：0 ~ 9223372036854775807 * 2 +1

        分类：
        tinyint、smallint、mediumint、int/integer、bigint
            1       2           3           4       8

        特点：
        (1) 如果不设置无符号还是有符号，默认是有符号；如果想设置无符号，需要添加 unsigned 关键字
        (2) 如果插入的数值超出了整型的范围，会报 out of range 异常，并且插入的是临界值（严格模式下会直接报错）
        (3) 如果不设置长度，会有默认的长度。 (整型的范围只由整型的类型决定)
            这里长度表示显示结果的长度，如果小于这个长度，左边会用 0 进行填充，但必须搭配 zerofill 关键字使用。
            但是使用 zerofill 后，数据类型只能是无符号的，即不能插入负值




*/
# 1. 如何设置无符号和有符号
DROP TABLE IF EXISTS tab_int;
CREATE TABLE tab_int (
    t1 INT(7) ZEROFILL,             # 有符号
    t2 INT(7) UNSIGNED     # 无符号
);

DESC tab_int;

INSERT INTO tab_int VALUES (-123456);
INSERT INTO tab_int VALUES (-123456, -123456);
INSERT INTO tab_int VALUES (2147483648, 4294967296);
INSERT INTO tab_int VALUES (123, 123);
SELECT * FROM tab_int;
