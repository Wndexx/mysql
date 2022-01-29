/*
    - my.ini

        - [mysql] 客户端的配置

        - [mysqld] 服务端的配置

            - port=3306 端口号 3306

            - basedir="C:/Program Files (x86)/MySQL/MySQL Server 5.5/" 安装目录

            - datadir="C:/ProgramData/MySQL/MySQL Server 5.5/Data/" 数据文件目录

            - character-set-server=utf8 字符集

            - default-storage-engine=INNODB 存储引擎，用来执行 SQL 语句

            - sql-mode="STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION" 语法模式

            - max_connections=100 最大连接数

    - 更改配置文件相关配置后，需要重新启动数据库的服务
*/