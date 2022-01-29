/*
    - lower

        - 将参数值变为小写
*/

SELECT LOWER('joHn');

# 案例：将姓变大写，名变小写，然后拼接
#       函数可以嵌套，某个函数的返回值可以充当另一个函数的参数
SELECT
    CONCAT(UPPER(last_name), LOWER(first_name))
FROM
    employees;