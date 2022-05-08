# 4. 表的复制
INSERT
INTO
    author
VALUES
    (1, '村上春树', '日本'),
    (2, '莫言', '中国'),
    (3, '冯唐', '中国'),
    (4, '金庸', '中国');

SELECT
    *
FROM
    author;

SELECT
    *
FROM
    author_copy;

SELECT
    *
FROM
    author_copy2;

# (1). 仅仅复制表的结构
CREATE TABLE author_copy LIKE author;

# (2). 复制表的结构外加数据
CREATE TABLE author_copy2
SELECT
    *
FROM
    author;

# (3). 复制表的部分结构和部分数据
CREATE TABLE author_copy3
SELECT
    id,
    au_name
FROM
    author
WHERE
    nation = '中国';

# (4). 仅仅复制表的部分结构，没有数据
CREATE TABLE author_copy4
SELECT
    id,
    au_name
FROM
    author
WHERE
    1=2;
# 或 where 0; 0 代表 false，1 代表 true