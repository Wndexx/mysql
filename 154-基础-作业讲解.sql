# 1. 查询每个专业的学生人数
SELECT
    majorid,
    COUNT(*) 学生人数
FROM
    student
GROUP BY
    majorid;

# 2. 查询参加考试的学生中，每个学生的平均分、最高分
SELECT
    studentno,
    ROUND(AVG(score), 2) 平均分,
    MAX(score)           最高分
FROM
    result
GROUP BY
    studentno;

# 3. 查询姓张的每个学生的最低分大于 60 的学号、姓名
SELECT
    s.studentno,
    studentname,
    MIN(score)
FROM
    student         s
        JOIN result r ON s.studentno = r.studentno
WHERE
    s.studentname LIKE '张%'
GROUP BY
    s.studentno
HAVING
    MIN(score) > 60;

# 4. 查询专业生日在 '1988-1-1' 后的学生姓名、专业名称
SELECT
    studentname,
    majorname,
    s.borndate
FROM
    student        s
        JOIN major m ON s.majorid = m.majorid
WHERE
    DATEDIFF(borndate, '1988-1-1');
#     s.borndate > '1988-1-1';

# 5. 查询每个专业的男生人数和女生人数分别是多少
SELECT
    majorid,
    sex,
    COUNT(*) 个数
FROM
    student
GROUP BY
    majorid,
    sex
ORDER BY
    majorid;
# 或
SELECT
    majorid,
    (
        SELECT
            COUNT(*)
        FROM
            student s
        WHERE
            s.majorid = m.majorid AND
            s.sex = '男'
    ) 男,
    (
        SELECT
            COUNT(*)
        FROM
            student s
        WHERE
            s.majorid = m.majorid AND
            s.sex = '女'
    ) 女
FROM
    major m;

# 6. 查询专业和张翠山一样的学生的最低分
# (1) 查询张翠山的专业
SELECT
    majorid
FROM
    student
WHERE
    student.student.studentname = '张翠山';
# (2) 查询学生id，marjorid = (1)
SELECT
    studentno
FROM
    student
WHERE
        majorid = (
                      SELECT
                          majorid
                      FROM
                          student
                      WHERE
                          student.student.studentname = '张翠山'
                  );
# (3) 查询学生的最低分
SELECT
    MIN(score)
FROM
    result
WHERE
        studentno IN (
                         SELECT
                             studentno
                         FROM
                             student
                         WHERE
                                 majorid = (
                                               SELECT
                                                   majorid
                                               FROM
                                                   student
                                               WHERE
                                                   student.student.studentname = '张翠山'
                                           )
                     );
# 或

SELECT
    MIN(score)
FROM
    student         s
        JOIN result r ON s.studentno = r.studentno
WHERE
        majorid = (
                      SELECT
                          majorid
                      FROM
                          student
                      WHERE
                          studentname = '张翠山'
                  )
GROUP BY
    majorid;

# 或

SELECT
    MIN(score)
FROM
    student          s
        JOIN result  r ON s.studentno = r.studentno
        JOIN student stu ON stu.majorid = s.majorid
WHERE
    s.studentname = '张翠山';

# 7. 查询大于60分的学生的姓名、密码、专业名
SELECT
    studentname,
    loginpwd,
    majorname,
    score
FROM
    student         s
        JOIN major  m ON s.majorid = m.majorid
        JOIN result r ON s.studentno = r.studentno
WHERE
    score > 60;
# 或
SELECT
    studentname,
    loginpwd,
    majorname
FROM
    student        s
        JOIN major m ON s.majorid = m.majorid
WHERE
        studentno IN (
                         SELECT
                             studentno
                         FROM
                             result
                         WHERE
                             score > 60
                     );

# 8. 按邮箱位数分组，查询每组的学生人数
SELECT
    COUNT(*)      学生人数,
    LENGTH(email) 邮箱位数
FROM
    student
GROUP BY
    LENGTH(email);

# 9. 查询学生名、专业名、分数
SELECT
    studentname,
    majorname,
    IFNULL(r.score, 0)
FROM
    student              s
        JOIN      major  m ON s.majorid = m.majorid
        LEFT JOIN result r ON s.studentno = r.studentno;

# 10. 查询哪个专业没有学生
SELECT
    majorname
FROM
    major                 m
        LEFT JOIN student s ON m.majorid = s.majorid
WHERE
    s.studentno IS NULL;
# 或
SELECT
    majorname
FROM
    student              s
        RIGHT JOIN major m ON s.majorid = m.majorid
WHERE
    s.studentno IS NULL;

# 11. 查询没有成绩的学生人数
SELECT
    COUNT(*)
FROM
    student
        LEFT JOIN result r ON student.studentno = r.studentno
WHERE
    score IS NULL;
