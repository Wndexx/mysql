# 二、修改视图

#方式一
/*
    create or replace view 视图名
    as
    查询语句;
*/
SELECT
    *
FROM
    my_v3;

CREATE OR REPLACE VIEW my_v3
AS
    SELECT
        job_id,
        AVG(salary)
    FROM
        employees
    GROUP BY
        job_id;

# 方式二
/*
    语法：
    alter view 视图名
    as
    查询语句;
*/
ALTER VIEW my_v3
AS
    SELECT
        *
    FROM
        employees;