# 三、删除视图
/*
    语法：drop view 视图名, 视图名, ...;
*/
DROP VIEW my_v1, my_v2, my_v3;

# 四、查看视图
DESC my_v3;
# 查看视图创建过程
SHOW CREATE VIEW my_v3;
# SHOW CREATE VIEW my_v3\G; cmd 中更换显示格式