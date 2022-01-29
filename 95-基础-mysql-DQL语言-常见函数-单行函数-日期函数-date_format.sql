/*
    - date_format 将日期转换成字符
*/


# 将 NOW() 日期转换成 %y年%m月%d日 格式的字符
SELECT DATE_FORMAT(NOW(), '%y年%m月%d日') AS out_put;

SELECT DATE_FORMAT('2019/1/1', '%Y年%m月%d日');

# 查询有奖金的员工名和入职日期（xx月/xx日 xx年）
SELECT
    last_name,
    DATE_FORMAT(hiredate, '%m月/%d日 %Y年') AS 入职日期
FROM
    employees
WHERE
    commission_pct IS NOT NULL;