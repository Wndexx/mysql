# 函数
/*
    含义：一组预先编译好的 SQL 语句的集合，理解成 批处理语句
    好处：
        1. 提高代码的重用性
        2. 简化操作
        3. 减少了编译次数并且减少了和数据库服务器的连接次数，提高了效率
    区别：
        存储过程   可以有 0 个返回，也可以有多个返回。适合做批量插入、批量更新
        函数       有且只有 1 个返回。适合做处理数据后返回一个结果
*/