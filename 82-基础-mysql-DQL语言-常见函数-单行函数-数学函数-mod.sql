/*
    - mod 取余

        - Mod(a,b) : a-a/b*b
*/

# 1
SELECT MOD(10, 3);

# 等价于

# 1
SELECT 10 % 3;

# 与 Java 一样，被除数如果为正，结果为正；被除数如果为负，结果为负
# -1
SELECT MOD(-10, 3);
# 1
SELECT MOD(10, -3);
# -1
SELECT MOD(-10, -3);


