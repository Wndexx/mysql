/*
    - 使用 ifnull 判断是否为空

        - SELECT IFNULL(字段, 替换数据);

            - 功能：判断某字段或表达式是否为 null,如果为 null 返回指定的值，否则返回原本的值
*/


SELECT 
  IFNULL(commission_pct, 0) AS 奖金率,
  commission_pct 
FROM
  employees ;


# 案例：显示出表 employees 的全部列，各个列之间用逗号连接，列头显示成 OUT_PUT

SELECT 
  CONCAT(
    `employee_id`,
    ',',
    `first_name`,
    ',',
    `last_name`,
    ',',
    `email`,
    ',',
    `phone_number`,
    ',',
    `job_id`,
    ',',
    `salary`,
    ',',
    IFNULL(commission_pct,0),
    ',',
    IFNULL(manager_id,0),
    ',',
    IFNULL(`department_id`,0),
    ',',
    `hiredate`
  ) AS "OUT_PUT" 
FROM
  employees ;
