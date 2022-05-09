/*
    - 子查询

        - 含义

            - 出现在其他语句（增删改查）中的 select 语句，称为子查询或内查询

        - 内部嵌套其他 select 语句的查询，称为主查询或外查询

        - 示例：select first_name from employees where department_id in(select department_id from departments where location_id = 1700);

        - 分类

            - 按子查询出现的位置：

                - select 后面：

                        - 仅仅支持标量子查询

                - from 后面：

                        - 支持表子查询

                - where 或 having 后面 （重点）

                        - 标量子查询（重点）

                        - 列子查询（重点）

                        - 行子查询（用的较少）

                - exists 后面（相关子查询）

                        - 表子查询

            - 按结果集的行列数不同：

                - 标量子查询（结果集只有一行一列，也叫单行子查询）

                - 列子查询（结果集只有一列多行，也叫多行子查询）

                - 行子查询（结果集有一行多列，也可以为多行多列）

                - 表子查询（结果集无所谓，一般为多行多列）

*/