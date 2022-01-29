/*
    分页查询（重点）
    应用场景：当要显示的数据，一页显示不全，需要分页提交 sql 请求
    语法：
        select  查询列表
        from    表1
        【连接类型  join 表2 on 连接条件】
        【where 筛选条件】
        【group by 分组字段】
        【having  分组后的筛选】
        【order by 排序的字段】
        limit 【offset,】 size;

        offset 要显示条目的起始索引(起始索引从 0 开始)
        size   要显示的条目个数
    特点：
        1. limit 语句放在查询语句的最后
        2. 执行顺序：from -> join -> on -> where -> group by -> having -> select -> order by -> limit
        3. 公式
            要显示的页数 page，每页的条目数 size
            select 查询列表
            from 表
            limit (page-1)*size,size;

*/

# 案例1：查询前五条员工信息
SELECT
    *
FROM
    employees
LIMIT 0,5;
# offset 的值是从第一条数据开始（索引是0），可以省略
SELECT
    *
FROM
    employees
LIMIT 5;

# 案例2：查询第 11 条到第 25 条
SELECT
    *
FROM
    employees
LIMIT 10,15;

# 案例3：有奖金的员工信息，并且工资较高的前 10 名显示出来
SELECT
    *
FROM
    employees
WHERE
    commission_pct IS NOT NULL
ORDER BY
    salary DESC
LIMIT 10;