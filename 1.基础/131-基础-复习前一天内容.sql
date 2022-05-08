/*
    排序查询
        一、语法
            select 查询列表
            from 表
            where 筛选条件
            order by 排序列表 【asc desc】

        二、特点
            1. asc：升序，如果不写默认升序
               desc：降序
            2. 排序列表 支持 单个字段、多个字段、函数、表达式、别名
            3. order by 的位置一般放在查询语句的最后（除 limit 语句之外）

    常见函数
        一、概述
            功能：类似与 Java 中的方法
            好处：提高重用性，隐藏实现细节
            调用：select 函数名(实参列表)

        二、单行函数
            1. 字符函数
                length
                concat：连接
                substr：截取子串
                upper：变大写
                lower：变小写
                replace：替换
                length：获取字节长度
                trim：去前后空格
                lpad：左填充
                rpad：右填充
                instr：获取子串第一次出现的索引
            2. 数学函数
                ceil：向上取整
                round：四舍五入
                mod：取模
                floor：向下取整
                truncate：截断
                rand：获取随机数，返回 0 - 1 之间的小数，不能取到1
            3. 日期函数
                now：返回当前日期 + 时间
                year：返回年
                month：返回月
                day：返回日
                dante_format：将日期转换成字符
                curdate：返回当前日期
                str_to_date：将字符转换成日期
                curtime：返回当前时间
                hour：小时
                minute：分钟
                second：秒
                datediff：返回两个日期相差的天数
                monthname：以英文形式返回月
            4. 其他函数
                version 当前数据库服务器的版本
                database 当前打开的数据库
                user 当前用户
                password('字符')：返回该字符的密码形式，自动加密  mysql 8.0已将该方法弃用
                md59('字符')：返回该字符的 md5 加密形式
            5. 流程控制函数
                (1) if(条件表达式，表达式1，表达式2) 如果条件表达式成立，返回表达式1，否则返回表达式2
                (2) case 情况1
                case 变量或表达式或字段
                when 常量 1 then 值1
                when 常量 2 then 值2
                ...
                else 值 n
                end
                    case 情况2
                case 变量或表达式或字段
                when 条件 1 then 值1
                when 条件 2 then 值2
                ...
                else 值 n
                end

        三、分组函数
            1. 分类
                max 最大值
                min 最小值
                sum 求和
                avg 平均值
                count 计算个数
            2. 特点
                (1) 语法
                    select max(字段) from 表名
                (2) 支持的类型
                    sum 和 avg 一般用于处理数值型
                    max min count 可以处理任何数据类型
                (3) 以上分组函数都忽略 null 值
                (4) 都可以搭配 distinct 使用，实现去重统计
                    select max(distinct 字段) from 表
                (5) count 函数
                    count(字段)   统计该字段非空值的个数
                    count(*)    统计结果集的行数
                        案例：查询每个部门的员工个数
                        1 xx  10
                        2 dd  20
                        3 mm  20
                        4 aa  40
                        5 hh  40
                    count(1) 统计结果集的行数
                    效率上：
                    MyISAM 存储引擎，count(*) 最高
                    InnoDB 存储引擎，count(*) 和 count(1) > count(字段)
                (6) 和分组函数一同查询的字段，要求是 group by 后出现的字段

    分组查询
        一、语法
                select 分组函数，分组后的字段
                from 表
               【where 筛选条件】
                group by 分组的字段
               【having 分组后的筛选】
               【order by 排序列表】
            执行顺序：from -> where -> group by -> having -> select -> order by
            别名：order by 支持；having、group by 支持，但不建议（保证通用性，oracle 不支持）； where 不支持

        二、特点

                            使用关键字       筛选的表        位置
            分组前筛选        where          原始表          group by 的前面
            分组后筛选        having         分组后的结果     group by 的后面

    连接查询
        一、含义
            当查询中涉及到多个表的字段，需要使用多表连接
                select 字段1,字段2
                from 表1,表2...;

            笛卡尔乘积：当查询多个表时，没有添加有效的连接条件，导致多个表所有行实现完全连接
            如何解决：添加有效的连接条件

        二、分类

            按年代分类
                sql92
                    等值连接
                    非等值连接
                    自连接

                    也支持一部分外连接（用于 oracle、sqlserver，mysql 不支持）
                sql99【推荐使用】
                    内连接
                        等值连接
                        非等值连接
                        自连接
                    外连接
                        左外
                        右外
                        全外（mysql 不支持）
                    交叉连接

        三、SQL92 语法
            1. 等值连接
                语法：
                    select 查询列表
                    from 表1 别名,表2 别名
                    where 表1.key = 表2.key
                    【and 筛选条件】
                    【group by 分组字段】
                    【having 分组后的筛选】
                    【order by 排序字段】
                特点：
                    (1) 一般为表起别名
                    (2) 多表的顺序可以调换
                    (3) n 表连接至少需要 n-1 个连接条件
                    (4) 等值连接的结果是多表的交集部分
            2. 非等值连接
                语法：
                    select 查询列表
                    from 表1 别名,表2 别名
                    where 非等值的连接条件
                    【and 筛选条件】
                    【group by 分组字段】
                    【having 分组后的筛选】
                    【order by 排序字段】
            3. 自连接
                 语法：
                    select 查询列表
                    from 表 别名1,表 别名2
                    where 表1.key = 表2.key
                    【and 筛选条件】
                    【group by 分组字段】
                    【having 分组后的筛选】
                    【order by 排序字段】

*/

SELECT MD5('123');
