/*
    sql92 和 sql 99
    功能：sql99 支持的较多
    可读性：sql99 实现连接条件和筛选条件的分离，可读性较高

    假如有 A 和 B 两张表
    1. 内连接                    A ∩ B
        select <select_list> from A inner join B on A.key = B.key';
    2. A 做主表，B 做从表         A（包含 A ∩ B 的部分）
        (1) 左外连接  select <select_list> from A left join B on A.key = B.key;
        (2) 右外连接  select <select_list> from B right join A on A.key = B.key;
    3. B 做主表，A 做从表         B（包含 A ∩ B 的部分）
        (1) 左外连接  select <select_list> from A right join B on A.key = B.key;
        (2) 右外连接  select <select_list> from B left join B on A.key = B.key;
    4. A 中不包含 B 的部分        A - A ∩ B
        select <select_list> from A left join B on A.key = B.key where B.key = null;
        select <select_list> from B right join A on A.key = B.key where B.key = null;
    5. B 中不包含 A 的部分        B - A ∩ B
        select <select_list> from B left join A on A.key = B.key where A.key = null;
        select <select_list> from A right join B on A.key = B.key where A.key = null;
    6. 全外连接                   A ∪ B
        select <select_list> from A full join B on A.key = B.key;
    7. 全外连接不包含内连接        A ∪ B - A ∩ B
        select <select_list> from A full join B on A.key = B.key where B.jey is null or A.key is null;
*/