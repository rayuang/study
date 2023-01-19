-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
--排序与分页

-- ORDER BY 排序

-- 没有使用排序，默认按照添加数据时的时间返回数据

/*
 升序 ASC
 降序 DESC
 */

-- 默认按照从低到高排序

SELECT * FROM db_people_management.t_student ORDER BY stu_headteacher_id;

-- 升序

SELECT *
FROM
    db_people_management.t_student
ORDER BY
    stu_headteacher_id ASC;

-- 降序

SELECT *
FROM
    db_people_management.t_student
ORDER BY
    stu_headteacher_id DESC;

-- 列的别名只能在ORDER BY中使用，不能在WHERE中使用

-- WHERE 在FROM后面，ORDER往后放

SELECT
    stu_headteacher_id * 12 headteacher
FROM
    db_people_management.t_student
ORDER BY headteacher DESC;

/*
 二级排序
 多级排序中，排序第一列必须有相同的列值，才能对第二列进行排序
 如果第一列数据唯一，将不再对第二列排序
 */

SELECT
    stu_id id,
    stu_headteacher_id * 12 headteacher
FROM
    db_people_management.t_student
ORDER BY
    headteacher DESC,
    stu_id ASC;

--  LIMIT    分页    MySQL

/*
 不同数据库中的分页关键字可能不同，如SQL server中的TOP
 DB2中的FETCH FIRST A ROWS BEFORE
 Oracle中的ROWNUM等
 */

/*
 LIMIT a,b  a为偏移量，即从下标为a的行开始，b为所要查询的数量
 LIMIT a,b  即从下标为a的行开始，查b条记录
 LIMIT 第一个参数可以省略，省略即从0行位置开始查询b行
 */

SELECT * FROM db_people_management.t_student LIMIT 0,1;

SELECT * FROM db_people_management.t_student LIMIT 0,2;

SELECT * FROM db_people_management.t_student LIMIT 1,2;

-- WHERE  ORDER BY  LIMIT 声明顺序

SELECT *
FROM
    db_people_management.t_student
WHERE stu_id > 1
ORDER BY
    stu_headteacher_id DESC
LIMIT 0, 1;

/*
 MySQL8.0后，可以使用LIMIT 3 OFFSET 4 
 表示返回从第5条记录开始的连续3条记录
 等同于LIMIT4,3
 LIMIT可以使用在MySQL、PGSQL、MariaDB、SQLite等中
 */

SELECT *
FROM
    db_people_management.t_student
WHERE stu_id > 1
ORDER BY
    stu_headteacher_id DESC
LIMIT 1
OFFSET 0;