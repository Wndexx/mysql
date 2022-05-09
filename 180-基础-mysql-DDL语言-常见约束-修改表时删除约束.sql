# 三、修改表时删除约束
# 1. 删除非空约束(null 可以不写，默认就是 null)
ALTER TABLE stuinfo MODIFY COLUMN stuname VARCHAR(20) NULL;

# 2. 删除默认约束
ALTER TABLE stuinfo MODIFY COLUMN age INT;

# 3. 删除主键
# ALTER TABLE stuinfo MODIFY COLUMN id INT;  这种方法不能删除主键
DESC stuinfo;
# 列名不用写，因为一个表只有一个主键
ALTER TABLE stuinfo DROP PRIMARY KEY;

# 4. 删除唯一
SHOW INDEX FROM stuinfo;
# ALTER TABLE stuinfo MODIFY COLUMN seat INT; 这种方法不能删除唯一
ALTER TABLE stuinfo DROP INDEX seat;

# 5. 删除外键
ALTER TABLE stuinfo DROP FOREIGN KEY fk_stuinfo_major;