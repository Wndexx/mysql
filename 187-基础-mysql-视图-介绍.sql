# 视图
/*
    含义：虚拟表，和普通表一样使用
        mysql 5.1 版本出现的新特性，是通过普通表动态生成的数据
        行和列的数据来自定义视图的查询中使用的表，并且是在使用视图时动态生成的，只保存了 sql 逻辑，不保存查询结果

    应用场景：
    1. 多个地方用到同样的查询结果
    2. 该查询结果使用的 sql 语句较复杂

    示例：
        create view my_v1 as
        select studentname, majorname
        from students s inner join major m on s.majorid = m.majorid
        where s.major = 1;
*/

# 案例：查询姓张的学生名和专业名
SELECT stuname, majorname
FROM stuinfo s
         JOIN major m ON m.id = s.majorid
WHERE s.stuname LIKE '张%';

CREATE VIEW v1 AS
SELECT stuname, majorname
FROM stuinfo s
         JOIN major m ON m.id = s.majorid;
SELECT stuname, majorname FROM v1;
