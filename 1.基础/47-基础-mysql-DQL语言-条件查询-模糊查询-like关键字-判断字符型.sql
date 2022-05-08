/*
    - 模糊查询

        - like

        - between and

        - in

        - is null | is not null


    - like

        - 一般和通配符搭配使用

            - 通配符

                - %：任意多个字符，包含  0 个字符

                - _：任意单个字符

            - 如果查询数据中包含通配符，需要进行转义

                - \ + 通配符

                - 转义字符（$，a，b，... 等） + 通配符 escape 转义字符 （推荐）

            - '字符%' 以该字符开头

            - '%字符' 以该字符结尾

*/


# 案例1：查询员工名中包含字符 a 的员工信息

SELECT *
FROM
    myemployees.employees
WHERE
    last_name LIKE '%a%';


# 案例2：查询员工名中第三个字符为 e，第五个字符为 a 的员工名和工资

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    last_name LIKE '__n_l%';


# 案例3：查询员工名中第二个字符为_的员工名

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '_\_%';

SELECT
    last_name
FROM
    employees
WHERE
        last_name LIKE '_$_%' ESCAPE '$';

