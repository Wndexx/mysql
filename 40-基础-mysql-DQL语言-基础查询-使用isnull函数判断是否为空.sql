/*
    - isnull 函数

        - 功能：判断某字段或表达式是否为 null，如果是，则返回1，否则返回 0
        
*/

SELECT
    ISNULL(commission_pct),
    commission_pct
FROM
    employees;