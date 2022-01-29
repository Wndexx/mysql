/*
    - 流程控制函数

        - if 函数：if else 的效果
*/

# 类似于 三元表达式
SELECT IF('10>5', '大', '小');

SELECT
    last_name,
    commission_pct,
    IF(commission_pct IS NULL, '没奖金，呵呵', '有奖金，嘻嘻') 备注
FROM
    employees;
