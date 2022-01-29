# 三、字符型
/*
    较短的文本
    char
    varchar

    其他
    binary 和 varbinary 用于保存较短的二进制
    enum 用于保存枚举（不区分大小写）
    set 用于保存集合（不区分大小写）

        字符串类型   最多字符数       描述及存储需求
        char(M)         M           M 为 0 ~ 255 之间的整数
        varchar(M)      M           M 为 0 ~ 65535 之间的整数

    较长的文本
    text
    blob(较大的二进制)

    特点：
                写法        M 的意思                         特点                                                  空间的耗费       效率
    char      char(M)      最大的字符数(可以省略，默认为 1)    固定长度的字符  （字符数 < M，仍会开辟 M 个字符空间）      比较耗费         高
    varchar   varchar(M)   最大的字符数 (不可以省略)          可变长度的字符  （字符数 < M，按照字符数开辟空间）         比较节省         低

    当长度确定是固定长度时，如性别 男 或 女 只有一个字符，使用 char ，提高效率
    当长度确定是不定长度时，如姓名 使用 varchar ，节省空间
*/

CREATE TABLE tab_char (
    c1 ENUM('a','b','c')
);
INSERT INTO tab_char VALUES ('a');
INSERT INTO tab_char VALUES ('b');
INSERT INTO tab_char VALUES ('b');
INSERT INTO tab_char VALUES ('M');
INSERT INTO tab_char VALUES ('A');

SELECT * FROM tab_char;

CREATE TABLE tab_set(
    s1 SET('a','b','c','d')
);
INSERT INTO tab_set VALUES ('a');
INSERT INTO tab_set VALUES ('a,b');
INSERT INTO tab_set VALUES ('a,c,d');
INSERT INTO tab_set VALUES ('A,c,d');
SELECT * FROM tab_set;
