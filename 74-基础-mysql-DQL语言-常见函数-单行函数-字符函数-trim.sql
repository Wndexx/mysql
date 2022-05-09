/*
    - trim

*/


# 去掉前后空格
SELECT LENGTH(TRIM('           张翠山               ')) AS out_put;

# 去掉前后 'a'
SELECT TRIM('a' FROM 'aaaaaaaaa张aaaaaaa翠山aaaaaaa') AS out_put;