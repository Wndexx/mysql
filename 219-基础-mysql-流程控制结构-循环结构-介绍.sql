# 二、循环结构
/*
    分类：
        while、loop、repeat

    循环控制：
        iterate 类似于 continue，继续，结束本次循环，继续下一次

        leave 类似于 break，跳出，结束当前所在的循环
*/

# 1. while
/*
    语法：
        【标签:】while 循环条件 do
            循环体;
        end while【 标签】;
    如果有循环控制，必须加 标签

    联想：
        while(循环条件){
            循环体;
        }
*/

# 2. loop
/*
    语法：
        【标签:】loop
            循环体;
        end loop 【标签】;
    可以用来模拟简单的死循环
*/

# 3. repeat
/*
    语法：
        【标签：】repeat
            循环体;
        until 结束循环的条件;
        end repeat 【标签】;
*/