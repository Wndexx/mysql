/*
    - 安装程序

        - 点击安装即可

    - 配置 MySQL Server Instance Configuration Wizard

        - Detailed Configuration 精确配置

        - Developer Machine 开发者机器 占用内存小

        - Multifunctional Database 多功能数据库  事务型数据库 和 非事务型数据库速度都比较快

        - Decision Support (DSS)/OLAP 允许20个并发连接

        - Enable TCP/IP Networking 配置端口 默认 3306

            - Enable Strict Mode 启用严格模式

        - Manual Selected Default Character Set / Collation 自定义字符集

            - 选择 utf8 mysql 字符集是 utf8，不是 utf_8

        - Install As Windows Service   启用 MySQL 服务，默认名 MySQL

            - Launch this MySQL Server automatically  开机自启

            - Include Bin Directory in Windows PATH 将 MySQL bin 目录添加到环境变量，需要勾选

        - Modify Security Settings  用户名：root 密码：123

            - Enable root access from remote machines 允许远程机访问 勾选
*/