/*
    每启动一个 mysql 程序，就会获得一个单独的数据库连接，每个数据库连接都有一个全局变量 @@tx_isolation，表示当前的事务隔离级别

    查看隔离级别
    select @@tx_isolation

    设置当前 mysql 连接的隔离级别
    set session transaction isolation level 隔离级别;

    设置数据库系统的全局的隔离级别
    set global transaction isolation level 隔离级别;

    事务的隔离级别

             事务的隔离级别          脏读          不可重复读       幻读
            read uncommitted         √               √             √
            read committed           ×               √             √
            repeatable read          ×               ×             √
            serializable             ×               ×             ×

        mysql  中默认第三个隔离级别 repeatable read
        oracle 中默认第二个隔离级别 read committed

*/