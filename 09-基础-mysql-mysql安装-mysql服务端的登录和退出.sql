/*
    - mysql 服务端的登录和退出

        - 方法一：mysql 自带的客户端 MySQL 5.5 Command Line Client（只适合 root 用户）

            - 启动，打开客户端，输入密码即可

            - 退出，输入 exit 命令 或 ctrl + c

        - 方法二：命令行

            - 启动：mysql [-h主机名 -P端口号] -u用户名 -p密码

                - mysql -h localhost -P 3306 -u root -p123

                - mysql 代表 mysql 命令，不是服务名

                - -h 主机名  -h 和主机名之间可以加空格，也可以不加

                - -P 端口号  -P 和端口号之间可以加空格，也可以不加

                - -u 用户名  -h 和用户名之间可以加空格，也可以不加

                - -p 密码  密码回车后再输入，如果在 -p 后面加，不能加空格

                - 如果是本机且端口号为 3306，可以简写成 mysql -uroot -p123

            - 退出，输入 exit 命令 或 ctrl + c
*/