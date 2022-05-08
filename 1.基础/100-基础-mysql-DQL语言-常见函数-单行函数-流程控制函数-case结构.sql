/*
    - 流程控制函数

        - case 函数（结构）

             - case 函数的使用一：switch case 的效果

                    Java
                        switch(变量或表达式){
                            case 常量1: 语句1; break;
                            case 常量2: 语句2; break;
                            ...
                            default: 语句n; break;
                        }

                    mysql
                        case 要判断的字段或表达式
                            when 常量1 then 要显示的值1 或语句1;（值不需要加分号，语句要加分号）
                            when 常量2 then 要显示的值2 或语句2;（值不需要加分号，语句要加分号）
                            ...
                            else 要显示的值 n 或语句n;
                            end

            - case 函数的使用二：类似于 多重 if

                    Java
                        if(条件1){
                            语句1;
                        }else if(条件2){
                            语句2;
                        }
                        ...
                        else {
                            语句n;
                        }

                  mysql
                        case
                            when 条件1 then 要显示的值1 或语句1;（值不需要加分号，语句要加分号）
                            when 条件2 then 要显示的值2 或语句2;（值不需要加分号，语句要加分号）
                            ...
                            else 要显示的值 n 或语句 n ;
                            end
*/

# 案例：查询员工的工资，要求
#      部门号=30，显示的工资为 1.1 倍
#      部门号=40，显示的工资为 1.2 倍
#      部门号=50，显示的工资为 1.3 倍
#      其他部门，显示的工资为 原工资

# 这里 case 语句充当一个表达式，then 后只能跟值，且不加分号
SELECT
    salary 原始工资,
    department_id,
    CASE department_id
        WHEN 30 THEN salary * 1.1
        WHEN 40 THEN salary * 1.2
        WHEN 50 THEN salary * 1.3
        ELSE salary
    END AS 新工资
FROM
    employees;


# 案例：查询员工的工资,
#       如果工资 > 20000，显示 A 级别
#       如果工资 > 15000，显示 B 级别
#       如果工资 > 10000，显示 C 级别
#       否则，显示 D 级别

SELECT
    salary,
    CASE
        WHEN salary > 20000 THEN 'A'
        WHEN salary > 15000 THEN 'B'
        WHEN salary > 10000 THEN 'C'
        ELSE 'D'
    END AS 工资级别
FROM
    employees;


