# 3. if 结构
/*
    功能：实现多重分支
    语法：
        if     条件1 then 语句1;
        elseif 条件2 then 语句2;
        elseif 条件2 then 语句2;
        ...
       【else 语句 n;】
        end if;

    应用：只能在 begin end 中
*/

# 案例：创建函数，根据传入的成绩，来显示等级。比如传入的成绩在 90 ~ 100 之间，返回 A；80 ~ 90，返回 B；60 ~ 80 ，返回 C；否则，返回 D
CREATE FUNCTION test_if(score INT) RETURNS CHAR
BEGIN
    IF score >= 90 AND score <= 100 THEN RETURN 'A';
    ELSEIF score >= 80 THEN  RETURN 'B';
    ELSEIF score >= 60 THEN RETURN 'C';
    ELSE RETURN 'D';
    END IF;
END;
SELECT test_if(96);