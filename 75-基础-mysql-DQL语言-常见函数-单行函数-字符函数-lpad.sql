/*
    - lpad

        - 用指定字符左填充指定长度
*/

# *******殷素素
SELECT LPAD('殷素素', 10, '*') AS out_put;

# 殷素
SELECT LPAD('殷素素', 2, '*') AS out_put;

# ababababa殷素素
SELECT LPAD('殷素素', 12, 'ab') AS out_put;