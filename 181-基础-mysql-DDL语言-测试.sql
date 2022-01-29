# 1. 向表 emp2 的 id 列中添加 primary key 约束（my_emp_id_pk）
# alter table emp2 modify column id int primary key;
# 或
# alter table emp2 add constraint my_emp_id_pk primary key(id); # 主键起名字也没有效果，主键的名字就是 primary

# 2. 向表 dept2 的 id 列中添加 primary key 约束（my_dep_id_pk）
# alter table dept2 modify column id int primary key;
# 或
# alter table emp2 add constraint my_dep_id_pk primary key(id);

# 3. 向表 emp2 中添加列 dept_id，并在其中定义 foreign key 约束，与之相关联的列是 dept2 表中的 id 列
# alter table emp2 add column dept_id int;
# alter table emp2 add constraint fk_emp2_dept2 foreign key(dept_id) references dept2(id);

/*
                    位置              支持的约束类型                 是否可以起约束名
    列级约束        列的后面           语法都支持，但外键没有效果       不可以
    表级约束        所有列的下面        默认和非空不支持，其他支持       可以（主键没有效果）
*/