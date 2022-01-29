# 已经表 stuinfo，id 学号，name 姓名，email 邮箱 john@126.com，gradeId 年级编号，sex 性别 男 女，age 年龄
# 已知表 grade，id 年级编号，gradeName 年纪名称

# 1. 查询所有学员的邮箱的用户名（注：邮箱中 @ 前面的字符）
# select substr(email, 1, instr(email,'@')-1) 用户名 from stuinfo;
# select trim('@126.com' from email) 用户名 from stuinfo;
# SELECT TRIM('@126.com' FROM 'john@126.com');

# 2. 查询男生和女生的个数
# select sex, count(*) 个数 group by sex;

# 3. 查询年龄 > 18 岁的所有学生的姓名和年纪名称
# select s.name, g.gradeName from stuinfo s join grade g on s.gradeId = g.id where s.age > 18;
# select g.gradeName, (select s.name from stuinfo s where s.gradeId = g.id) from grade g where g.id in (select s.gradeId from stuinfo s where s.age > 18);

# 4. 查询哪个年级的学生的最小年龄 > 20 岁
# select gradeName from grade where id in(select gradeId from stuinfo group by gradeId having min(age) > 20);
# select gradeName from grade g join (select gradeId, min(age) from stuinfo group by gradeId) mi on g.graId = mi.gradeId where mi.age > 20;

# 5. 试说出查询语句中设计到的所有关键字,以及执行先后顺序
/*
    select 查询列表
    from 表
    连接类型 join 表2
    on 连接条件
    where 筛选条件
    group by 分组列表
    having 分组后的筛选
    order by 排序列表
    limit 偏移(起始的索引),条目数;

*/
# 执行顺序 from -> join -> on -> where -> group by -> having -> select -> order by -> limit 每一步都会生成一张虚拟表
SELECT salary FROM employees ORDER BY length(last_name);
