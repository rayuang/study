-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
-- 视图 - 数据库对象
/*
 CREATE [OR REPLACE]
 [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
 VIEW view_name [(字段1,字段2,...)]
 AS 查询语句
 [WITH [CASCADED | LOCAL] CHECK OPTION];
 OR REPLACE 如果没有此名字视图则创建，如果有则替换掉
 
 */
/*
 一个或者多个数据表中的数据的逻辑显示，视图并不存储数据
 即：视图是一个虚拟表，本身不具有数据，占内存很少
 视图建立在已有表的基础上，被视图依赖的表成为基表
 视图创建、删除只会影响视图本身，不会影响基表，但对视图增删改时，基表会被改变，反之亦然
 优点：简单查询；控制数据访问
 */
-- 创建视图
-- 针对单表
CREATE VIEW vu_stu_name AS
SELECT
    s.stu_id,
    s.stu_name
FROM
    t_student s;

-- 查询视图
SELECT
    *
FROM
    vu_stu_name;

-- 创建视图，并自定义视图中字段名1
CREATE VIEW vu_maj_name(id, name) AS
SELECT
    t_major.maj_id,
    t_major.maj_name
FROM
    t_major;

SELECT
    *
FROM
    vu_maj_name;

-- 创建视图，并自定义视图中字段名2
CREATE VIEW vu_tea_name AS
SELECT
    t_teacher.tea_id id,
    t_teacher.tea_name name
FROM
    t_teacher;

SELECT
    *
FROM
    vu_tea_name;

-- 针对多表
CREATE VIEW vu_maj_for_stuname_a AS
SELECT
    *
FROM
    t_major
WHERE
    maj_id IN (
        SELECT
            stu_major_id
        FROM
            t_student
        WHERE
            stu_name LIKE '%a%'
    );

SELECT
    *
FROM
    vu_maj_for_stuname_a;

-- 基于视图创建视图
CREATE VIEW vu_majname_for_stuname_a AS
SELECT
    maj_id id,
    maj_name name
FROM
    vu_maj_for_stuname_a;

SELECT
    *
FROM
    vu_majname_for_stuname_a;

-- 查看所有视图和表
SHOW TABLES;

-- 查看某个视图结构
DESC vu_maj_name;

-- 查看视图的属性信息
SHOW TABLE STATUS LIKE 'vu_maj_name';

-- 查看视图定义详细信息
SHOW CREATE VIEW vu_maj_name;

-- 更新视图中数据
-- 改
UPDATE
    vu_stu_name
SET
    stu_name = 'dhabc'
WHERE
    stu_id = 3;

-- 表的数据会被更改,反之亦然
SELECT
    *
FROM
    t_student;

-- 删除视图数据，基表中数据也会被删除
-- 删除视图数据方式和删除表数据一样
-- 不能更新和删除的数据——
-- 如：由函数创建的平均值等字段数据或视图基于一个不可更新的视图等；
-- 修改视图
ALTER VIEW 视图名 AS 查询语句;

-- 删除视图
DROP VIEW 视图名1 [,视图名2,...];