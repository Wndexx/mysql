/*
    一、已知表 stringcontent ，其中字段：id 自增长、content varchar(20)。
    向该表插入指定个数的，随机的字符串
*/
/*
    drop table if exists stringcontent;
    create table stringcontent(
        id int primary key auto_increment,
        content varchar(20)
    );

    create procedure randstr_insert(in ins_count int)
    begin
        declare i int default 1; # 定义一个循环变量，表时插入的次数
        declare str varchar(26) default 'abcdefghijklmnopqrstuvwxyz';
        declare startIndex int default 1; # 代表起始索引
        declare len int default 1; # 代表截取的字符的长度
        while i <= ins_count do
            set startIndex = floor(rand() * 26 + 1) # 产生一个随机的整数，代表起始索引 1 ~ 26
            set len = floor(rand() * (20 - startIndex) + 1) # 产生一个随机的整数，代表 截取长度 ，1 ~ （26 - startIndex + 1)
            insert into stringcontent(content) values(substr(str,startIndex,len));
            set i = i + 1; # 循环变量更新
        end while;
    end;

    call randstr_insert(2);
*/

/*
    drop table if exists stringcontent;
    create table stringcontent(
        id int primary key auto_increment,
        content varchar(20)
    );

    truncate table stringcontent;
    drop procedure if exists randstr_insert;
    create procedure randstr_insert(in ins_count int)
    begin
        declare i int default 1;
        declare j int default 1;
        declare len int default 1;
        declare str varchar(26) default '';
        declare s int default 1;
        while i <= ins_count do
            set str = '';
            set len = floor(rand() * 20 + 1);
            set j = 1;
            while j <= len do
                set s = floor(rand() * 26 + 1);
                case s
                    when 1 then set str = concat(str,'a');
                    when 2 then set str = concat(str,'b');
                    when 3 then set str = concat(str,'c');
                    when 4 then set str = concat(str,'d');
                    when 5 then set str = concat(str,'e');
                    when 6 then set str = concat(str,'f');
                    when 7 then set str = concat(str,'g');
                    when 8 then set str = concat(str,'h');
                    when 9 then set str = concat(str,'i');
                    when 10 then set str =  concat(str,'j');
                    when 11 then set str =  concat(str,'k');
                    when 12 then set str =  concat(str,'l');
                    when 13 then set str =  concat(str,'m');
                    when 14 then set str =  concat(str,'n');
                    when 15 then set str =  concat(str,'o');
                    when 16 then set str =  concat(str,'p');
                    when 17 then set str =  concat(str,'q');
                    when 18 then set str =  concat(str,'r');
                    when 19 then set str =  concat(str,'s');
                    when 20 then set str =  concat(str,'t');
                    when 21 then set str =  concat(str,'u');
                    when 22 then set str =  concat(str,'v');
                    when 23 then set str =  concat(str,'w');
                    when 24 then set str =  concat(str,'x');
                    when 25 then set str =  concat(str,'y');
                    when 26 then set str =  concat(str,'z');
                end case;
            set j = j + 1;
            end while;
            insert into stringcontent(content) values(str);
            set i = i + 1;
        end while;
    end;
    call randstr_insert(20);
    select * from stringcontent;
*/

