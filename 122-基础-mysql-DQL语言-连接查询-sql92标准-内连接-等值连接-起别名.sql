/*
    为表起别名

        - 和字段起别名一样

        - where 可以使用表的别名

        - 如果为表起了别名，则查询的字段不能再使用原来的表名去限定

        - 优点

            - （1）提高语句的简洁度

            - （2）区分多个重名的字段
*/

# 2、为表起别名
# 案例3：查询员工名、工种号、工种名
SELECT
    last_name,
    e.job_id,
    job_title
FROM
    employees e,
    jobs j
WHERE
    e.job_id = j.job_id;