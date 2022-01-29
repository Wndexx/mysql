/*
    - mysql 常见命令

        - 显示数据库

            - show databases

                - 默认数据库

                    - information_schema  数据库元数据的信息  保存了MySQL服务所有数据库的信息  不能随意修改

                        - 元数据：数据的数据 ，如数据库名、表名、列的数据类型、访问权限等。具体MySQL服务有多少个数据库，各个数据库有哪些表，各个表中的字段是什么数据类型，各个表中有哪些索引，各个数据库要什么权限才能访问

                    - mysql 保存 MySQL 的权限、参数、对象和状态信息。如哪些用户可以访问这个数据、DB 参数、插件、主从   不能随意修改

                    - performance_schema   不能随意修改

                        - 主要用于收集数据库服务器性能参数

                        - 提供进程等待的详细信息，包括锁、互斥变量、文件信息；

                        - 保存历史的事件汇总信息，为提供 MySQL 服务器性能做出详细的判断；

                        - 对于新增和删除监控事件点都非常容易，并可以随意改变 MySQL 服务器的监控周期，例如（CYCLE、MICROSECOND）

                    - test 测试数据库，没有东西 可以修改
*/

SHOW DATABASES;

