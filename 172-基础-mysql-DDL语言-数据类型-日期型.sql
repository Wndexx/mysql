# 四、日期型
/*
    日期和时间类型     字节          最小值                 最大值
    date              4          1000-01-01             9999-12-31
    datetime          8          1000-01-01 00:00:00    9999-12-31 23:59:59
    timestamp         4          19700101080001         2038年的某个时刻
    time              3          -838:59:59             838:59:59
    year              1          1901                   2155

    datetime 和 timestamp 的区别
    1. timestamp 支持的时间范围较小，取值范围：19700101080001 - 2038年的某个时间
       datetime 的取值范围：1000-1-1 - 9999-12-31
    2. timestamp 和实际时区有关，更能反应实际的日期，而 datetime 则只能反映插入时的当地时区
    3. timestamp 的属性收 mysql 版本和 sqlMode 的影响很大

    分类：
    date 只保存日期
    time 只保存时间
    year 只保存年

    datetime 保存 日期 + 时间
    timestamp 保存 日期 + 时间

    特点
                        字节             范围          时区等的影响
    datetime             8             1000-9999          不受
    timestamp            4             1970-2048           受

*/
DROP TABLE IF EXISTS tab_date;
CREATE TABLE tab_date (
    t1 DATETIME,
    t2 TIMESTAMP
);

INSERT INTO tab_date VALUES (now(),now());

SELECT * FROM tab_date;

# 显示时区
SHOW VARIABLES LIKE 'time_zone';

# 更改时区
SET TIME_ZONE ='+8:00';