# 二、小数
/*
    浮点数类型                   字节          范围
    float                       4           ±1.75494351E-38 ~ ±3.402823466E+38
    double                      8           ±2.2250738585072014E-308 ~ ±1.7976931348623157E+308
    定点数类型                   字节          范围
    DEC(M,D)/DECIMAL(M,D)       M+2          最大取值范围与 double 相同，给定 decimal 的有效范围由 M 和 D 决定

    分类
    1. 浮点型
        float(M,D)
        double(M,D)
    2. 定点型
        dec(M,D)
        decimal(M,D)

    特点
    (1) M 和 D
        M：整数部位 + 小数部位
        D：小数部位
        如果超过范围，则插入临界值（严格模式报错）
    (2) M 和 D 都可以省略
        如果是 decimal，则 M 默认为 10，D 默认为 0
        如果是 float 和 double，则会根据插入数值的精度来决定精度
    (3) 定点型的精确度较高。如果要求插入数值的精度较高则考虑使用， 如 货币运算等

*/

# 测试 M 和 D
DROP TABLE IF EXISTS tab_float;

CREATE TABLE tab_float (
    f1 FLOAT(5, 2),
    f2 FLOAT(5, 2),
    f3 DECIMAL(5, 2)
);

CREATE TABLE tab_float (
    f1 FLOAT,
    f2 FLOAT,
    f3 DECIMAL
);

SELECT * FROM tab_float;
DESC tab_float;

INSERT INTO tab_float VALUES (123.4523, 123.4235, 123.4523);
INSERT INTO tab_float VALUES (123.456, 123.456, 123.456);
INSERT INTO tab_float VALUES (123.4, 123.4, 123.4);
INSERT INTO tab_float VALUES (1523.4, 1523.4, 1523.4);

# 原则
/*
    所选择的类型越简单越好，能保存数值的类型越小越好
*/

