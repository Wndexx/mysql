# 2. case 结构
/*
    情况1：类似于 java 中的 switch 语句，一般用于实现 等值 判断
    语法：
        case 变量|表达式|字段
        when 要判断的值 then 返回的值1或语句 1;
        when 要判断的值 then 返回的值2或语句 2;
        ...
        else 要返回的值 n 或语句 n;
        end case;

    情况2：类似于 java 中的多重 if 语句，一般用于实现 区间 判断
    语法：
        case
        when 要判断的条件1 then 返回的值1或语句1
        when 要判断的条件2 then 返回的值2或语句2
        ...
        else 要返回的值 n 或语句 n
        end case;

    特点：
    （1）可以作为表达式，嵌套在其他语句中使用，可以放在任何地方，begin end 中或 begin end 的外面
        可以作为独立的语句去使用，只能放在 begin end 中

    （2）如果 when 中的值满足或条件成立，则执行对应的 then 后面的语句，并结束 case
        如果都不满足，则执行 else 中的语句或值

    （3）else 可以省略，如果 else 省略了，并且所有 when 条件都不满足，则返回 null
*/
# 案例：创建存储过程，根据传入的成绩，来显示等级。比如传入的成绩在 90 ~ 100 之间，显示 A；80 ~ 90，显示 B；60 ~ 80 ，显示 C；否则，显示 D
DROP PROCEDURE test_case;
CREATE PROCEDURE test_case(IN score INT, OUT score_level CHAR(1))
BEGIN
    CASE
        WHEN score BETWEEN 90 AND 100 THEN SET score_level = 'A';
        WHEN score BETWEEN 80 AND 90 THEN SET score_level = 'B';
        WHEN score BETWEEN 60 AND 80 THEN SET score_level = 'C';
        ELSE SET score_level = 'D';
    END CASE;
END;
CALL test_case(90, @score_level);
SELECT @score_level;

DROP PROCEDURE test_case2;
CREATE PROCEDURE test_case2(IN score INT)
BEGIN
    CASE
        WHEN score >= 90 AND score <= 100 THEN SELECT 'A' 等级;
        WHEN score >= 80 THEN SELECT 'B' 等级;
        WHEN score >= 60 THEN SELECT 'C' 等级;
        ELSE SELECT 'D' 等级;
    END CASE;
END;
CALL test_case2(90);


