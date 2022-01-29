/*
    - 交叉连接

        - 就是两表进行笛卡尔乘积得到的数据
*/

SELECT
    b.*,
    bo.*
FROM
    beauty              b
        CROSS JOIN boys bo;