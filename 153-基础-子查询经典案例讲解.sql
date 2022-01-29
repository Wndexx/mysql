# 1. 查询最低工资的员工信息：last_name，salary
# (1) 查询最低的工资
SELECT
    MIN(salary)
FROM
    employees;
# (2) 查询员工信息，要求 salary = (1)
SELECT
    last_name,
    salary
FROM
    employees
WHERE
        salary = (
                     SELECT
                         MIN(salary)
                     FROM
                         employees
                 );

# 2. 查询平均工资最低的部门信息
# 方式一
# (1) 查询各部门的平均工资
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id;
# (2) 查询最低的平均工资
SELECT
    MIN(a.avg_sal)
FROM
    (
        SELECT
            department_id,
            AVG(salary) avg_sal
        FROM
            employees
        GROUP BY
            department_id
    ) a;
# (3) 查询工资信息，要求 avg(salary) = min(salary)
SELECT
    d.*
FROM
    departments d
        JOIN (
                 SELECT
                     department_id,
                     AVG(salary) avg_sal
                 FROM
                     employees
                 GROUP BY
                     department_id
             )  a ON d.department_id = a.department_id
WHERE
        a.avg_sal = (
                        SELECT
                            MIN(a.avg_sal)
                        FROM
                            (
                                SELECT
                                    department_id,
                                    AVG(salary) avg_sal
                                FROM
                                    employees
                                GROUP BY
                                    department_id
                            ) a
                    );

# 方式二
# (1) 查询各部门的平均工资
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id;
# (2) 查询最低的平均工资
SELECT
    MIN(a.avg_sal)
FROM
    (
        SELECT
            department_id,
            AVG(salary) avg_sal
        FROM
            employees
        GROUP BY
            department_id
    ) a;
# (3) 查询那个部门的平均工资 = (2)
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id
HAVING
        avg_sal = (
                      SELECT
                          MIN(a.avg_sal)
                      FROM
                          (
                              SELECT
                                  department_id,
                                  AVG(salary) avg_sal
                              FROM
                                  employees
                              GROUP BY
                                  department_id
                          ) a
                  );
# (4) 查询部门信息
SELECT
    *
FROM
    departments
WHERE
        department_id = (
                            SELECT
                                department_id
                            FROM
                                employees
                            GROUP BY
                                department_id
                            HAVING
                                    AVG(salary) = (
                                                      SELECT
                                                          MIN(a.avg_sal)
                                                      FROM
                                                          (
                                                              SELECT
                                                                  department_id,
                                                                  AVG(salary) avg_sal
                                                              FROM
                                                                  employees
                                                              GROUP BY
                                                                  department_id
                                                          ) a
                                                  )
                        );

# 方式三
# (1) 查询各部门的平均工资
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id;
# (2) 求出最低平均工资的部门编号
SELECT
    department_id
FROM
    employees
GROUP BY
    department_id
ORDER BY
    AVG(salary)
LIMIT 1;
# (3) 查询部门信息
SELECT
    *
FROM
    departments
WHERE
        department_id = (
                            SELECT
                                department_id
                            FROM
                                employees
                            GROUP BY
                                department_id
                            ORDER BY
                                AVG(salary)
                            LIMIT 1
                        );

# 3. 查询平均工资最低的部门信息和该部门的平均工资
# 方式一
SELECT
    d.*,
    a.avg_sal
FROM
    departments d
        JOIN (
                 SELECT
                     department_id,
                     AVG(salary) avg_sal
                 FROM
                     employees
                 GROUP BY
                     department_id
             )  a ON d.department_id = a.department_id
WHERE
        a.avg_sal = (
                        SELECT
                            MIN(a.avg_sal)
                        FROM
                            departments d
                                JOIN (
                                         SELECT
                                             department_id,
                                             AVG(salary) avg_sal
                                         FROM
                                             employees
                                         GROUP BY
                                             department_id
                                     )  a ON d.department_id = a.department_id
                    );
# 方式二
# (1) 查询各部门的平均工资
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id;
# (2) 求出最低平均工资的部门编号
SELECT
    AVG(salary),
    department_id
FROM
    employees
GROUP BY
    department_id
ORDER BY
    AVG(salary)
LIMIT 1;
# (3) 查询部门信息
SELECT
    d.*,
    a.avg_sal
FROM
    departments d
        JOIN (
                 SELECT
                     AVG(salary) avg_sal,
                     department_id
                 FROM
                     employees
                 GROUP BY
                     department_id
                 ORDER BY
                     AVG(salary)
                 LIMIT 1
             )  a ON d.department_id = a.department_id;
# 或
SELECT
    d.*,
    (
        SELECT
            AVG(salary) avg_sal
        FROM
            employees e
        WHERE
            e.department_id = d.department_id
        GROUP BY
            department_id
        ORDER BY
            AVG(salary)
        LIMIT 1
    ) a
FROM
    departments d
WHERE
        d.department_id = (
                              SELECT
                                  e.department_id
                              FROM
                                  employees e
                              GROUP BY
                                  department_id
                              ORDER BY
                                  AVG(salary)
                              LIMIT 1
                          );


# 4. 查询平均工资最高的 job 信息
# 方式一
# (1) 查询每个 job 的平均工资
SELECT
    job_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    job_id;
# (2) 查询最高的平均工资
SELECT
    MAX(a.avg_sal)
FROM
    (
        SELECT
            job_id,
            AVG(salary) avg_sal
        FROM
            employees
        GROUP BY
            job_id
    ) a;
# (3) 查询 job 信息，要求 avg_sal = max(a.avg_sal)
SELECT
    j.*
FROM
    jobs       j
        JOIN (
                 SELECT
                     job_id,
                     AVG(salary) avg_sal
                 FROM
                     employees
                 GROUP BY
                     job_id
             ) a ON j.job_id = a.job_id
WHERE
        a.avg_sal = (
                        SELECT
                            MAX(a.avg_sal)
                        FROM
                            (
                                SELECT
                                    job_id,
                                    AVG(salary) avg_sal
                                FROM
                                    employees
                                GROUP BY
                                    job_id
                            ) a
                    );
# 方式二
# (1) 查询每个 job 的平均工资
SELECT
    job_id,
    AVG(salary)
FROM
    employees
GROUP BY
    job_id;
# (2) 查询最高工资对应的 job_id
SELECT
    job_id
FROM
    employees
GROUP BY
    job_id
ORDER BY
    AVG(salary) DESC
LIMIT 1;
# (3) 查询最高工资对应的 job 信息
SELECT
    *
FROM
    jobs
WHERE
        job_id = (
                     SELECT
                         job_id
                     FROM
                         employees
                     GROUP BY
                         job_id
                     ORDER BY
                         AVG(salary) DESC
                     LIMIT 1
                 );

# 5. 查询平均工资高于公司平均工资的部门有哪些
# (1) 查询公司平均工资
SELECT
    AVG(salary) a
FROM
    employees;
# (2) 查询每个部门的平均工资
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id;
# (3) 查询部门，要求  avg_sal > a
SELECT
    d.department_id,
    department_name
FROM
    departments d
        JOIN (
                 SELECT
                     department_id,
                     AVG(salary) avg_sal
                 FROM
                     employees
                 GROUP BY
                     department_id
             )  a ON d.department_id = a.department_id
WHERE
        a.avg_sal > (
                        SELECT
                            AVG(salary) a
                        FROM
                            employees
                    );
# 方式二
# (1) 查询公司平均工资
SELECT
    AVG(salary) a
FROM
    employees;
# (2) 查询每个部门的平均工资
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id;
# (3) 查询部门，要求  avg_sal > a
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id
HAVING
        avg_sal > (
                      SELECT
                          AVG(salary) a
                      FROM
                          employees
                  );


# 6. 查询公司中所有 manager 的详细信息
# (1) 查询公司中的所有 manager 的 employee_id
SELECT DISTINCT
    manager_id
FROM
    employees;
# (2) 查询 manager 的信息
SELECT
    *
FROM
    employees
WHERE
        employee_id IN (
                           SELECT DISTINCT
                               manager_id
                           FROM
                               employees
                       );

# 7. 各个部门中，最高工资中最低的那个部门的最低工资是多少
# (1) 查询各个部门的最高工资
SELECT
    department_id,
    MAX(salary) max_sal
FROM
    employees
GROUP BY
    department_id;
# (2) 查询最高工资中最低的工资以及对应的 department_id
SELECT
    department_id,
    MAX(salary)
FROM
    employees
GROUP BY
    department_id
ORDER BY
    MAX(salary)
LIMIT 1;
# (3) 查询最低工资，部门编号 = (1)
SELECT
    MIN(salary)
FROM
    employees
WHERE
        department_id = (
                            SELECT
                                department_id
                            FROM
                                employees
                            GROUP BY
                                department_id
                            ORDER BY
                                MAX(salary)
                            LIMIT 1
                        )
GROUP BY
    department_id;

# 8. 查询平均工资最高部门的 manager 的详细信息：last_name，department_id，email，salary
# 方式一
# (1) 查询各部门的平均工资
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id;
# (2) 查询最高的平均工资
SELECT
    MAX(a.avg_sal)
FROM
    (
        SELECT
            department_id,
            AVG(salary) avg_sal
        FROM
            employees
        GROUP BY
            department_id
    ) a;
# (3) 查询最高的平均工资的部门的 manager_id
SELECT
    d.manager_id
FROM
    departments d
        JOIN (
                 SELECT
                     department_id,
                     AVG(salary) avg_sal
                 FROM
                     employees
                 GROUP BY
                     department_id
             )  a ON d.department_id = a.department_id
WHERE
        a.avg_sal = (
                        SELECT
                            MAX(a.avg_sal)
                        FROM
                            (
                                SELECT
                                    department_id,
                                    AVG(salary) avg_sal
                                FROM
                                    employees
                                GROUP BY
                                    department_id
                            ) a
                    );
# (4) 查询 manager 的详细信息，要求 employee_id = (3)
SELECT
    last_name,
    department_id,
    email,
    salary
FROM
    employees
WHERE
        employee_id = (
                          SELECT
                              d.manager_id
                          FROM
                              departments d
                                  JOIN (
                                           SELECT
                                               department_id,
                                               AVG(salary) avg_sal
                                           FROM
                                               employees
                                           GROUP BY
                                               department_id
                                       )  a ON d.department_id = a.department_id
                          WHERE
                                  a.avg_sal = (
                                                  SELECT
                                                      MAX(a.avg_sal)
                                                  FROM
                                                      (
                                                          SELECT
                                                              department_id,
                                                              AVG(salary) avg_sal
                                                          FROM
                                                              employees
                                                          GROUP BY
                                                              department_id
                                                      ) a
                                              )
                      );
# 方式二
# (1) 查询各部门的平均工资
SELECT
    department_id,
    AVG(salary) avg_sal
FROM
    employees
GROUP BY
    department_id;
# (2) 查询平均工资最高的部门对应的 department_id
SELECT
    department_id
FROM
    employees
GROUP BY
    department_id
ORDER BY
    AVG(salary) DESC
LIMIT 1;
# (3) 查询 (2) 对应的 manager_id
SELECT
    manager_id
FROM
    departments
WHERE
        department_id = (
                            SELECT
                                department_id
                            FROM
                                employees
                            GROUP BY
                                department_id
                            ORDER BY
                                AVG(salary) DESC
                            LIMIT 1
                        );
# (4) 查询 (3) 对应的 last_name，department_id，email，salary
SELECT
    last_name,
    department_id,
    email,
    salary
FROM
    employees
WHERE
        employee_id = (
                          SELECT
                              manager_id
                          FROM
                              departments
                          WHERE
                                  department_id = (
                                                      SELECT
                                                          department_id
                                                      FROM
                                                          employees
                                                      GROUP BY
                                                          department_id
                                                      ORDER BY
                                                          AVG(salary) DESC
                                                      LIMIT 1
                                                  )
                      );
# 或
SELECT DISTINCT
    m.last_name,
    m.department_id,
    m.email,
    m.salary
FROM
    employees          e
        JOIN employees m ON e.manager_id = m.employee_id
WHERE
        e.manager_id = (
                           SELECT
                               manager_id
                           FROM
                               departments
                           WHERE
                                   department_id = (
                                                       SELECT
                                                           department_id
                                                       FROM
                                                           employees
                                                       GROUP BY
                                                           department_id
                                                       ORDER BY
                                                           AVG(salary) DESC
                                                       LIMIT 1
                                                   )
                       );
# 或
SELECT
    last_name,
    d.department_id,
    email,
    salary
FROM
    employees            e
        JOIN departments d ON e.employee_id = d.manager_id
WHERE
        d.department_id = (
                              SELECT
                                  department_id
                              FROM
                                  employees
                              GROUP BY
                                  department_id
                              ORDER BY
                                  AVG(salary) DESC
                              LIMIT 1
                          );
