/*
    - 分组查询

        - 可以使用 group by 子句将表中的数据分为若干组

        - 语法

            select column, group_function(column)
            from   table
            [where  condition]
            [group by group_by_expression]
            [order by column];

            select 分组函数,列（要求出现在 group by 的后面）
            from 表明
           【where 筛选条件】
            group by 分组的列表
           【order by 子句】

        - 注意

            - 查询列表比较特殊，要求分组函数和 group by 后出现的字段

        - 特点

            - 分组查询中的筛选条件分为两类

                                    数据源                 位置                      关键字

                  分组前筛选         原始表                 group by 子句的前面        where

                  分组后筛选         分组后的结果集          group by 子句的后面        having

                - 分组函数做条件肯定是放在 having 子句中

                - 能用分组前筛选的，就优先考虑分组前筛选
                  group by 后的字段既可以使用分组前筛选，又可以使用分组后筛选，建议使用分组前筛选

            - mysql 的 group by 和 having 后面支持别名，where 后面不支持别名
                oracle 的 group by 、 having、 where 后面不支持别名
                一般 group by having where 后面不用别名

            - group by 子句支持单个字段分组，多个字段分组（多个字段之间用逗号隔开，没有顺序要求），表达式或函数（用的较少）

            - 也可以添加排序（排序放在整个分组查询的最后）
*/

# 引入：查询每个部门的平均工资
SELECT
    department_id,
    AVG(salary)
FROM
    employees
GROUP BY
    department_id;