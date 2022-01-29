# 1. 创建表 Book，字段如下
/*
    create table book (
        bid     int primary key,
        bname   varchar(20) unique not null,
        price   float default 10,
        btypeid int,
        constraint fk_book_booktype foreign key(btypeid) references booktype(id)
    );
*/

# 2. 开启事务，向表中插入一行数据，并结束
/*
    set autocommit = 0;
    #  start transaction;
    insert into book values(null,'西游记',24.2,1);
    commit;
    # rollback;
*/

# 3. 创建视图，实现查询价格大于 100 的书名和类型
/*
   create or replace view mv1
   as
   select bname, name
   from book b join booktype bt on b.btypeid = bt.id
   where b.price > 100;
*/

# 4. 修改视图，实现查询价格在 90 ~ 120 之间的书名和价格
/*
    (1) create or replace view mv1 as select bname, price from book where price between 90 and 120;
    (2) alter view mv1 as select bname, price from book where price between 90 and 120
*/

# 5. 删除刚才建的视图
/*
    drop view mv1;
*/
