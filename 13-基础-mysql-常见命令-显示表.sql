/*
    - 显示表

        - show tables;

            - Empty set 没有表

            - 需要先打开相应的数据库

            - 如果此时需要显示其他数据库中的表

                - 方法一

                    - use 数据库名;

                    - show tables;

                - 方法二

                    - show tables from 数据库名;

                        - 注意：目前仍位于上一个打开的数据库中，只是显示了外部的一个数据库的表
*/

USE myemployees;

SHOW TABLES;

SHOW TABLES FROM mysql; # 此时仍在 test 数据库中，只是查看了一下 mysql 中的表


