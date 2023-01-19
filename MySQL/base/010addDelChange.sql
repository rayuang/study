-- Active: 1665375285637@@127.0.0.1@3306@db_people_management

-- DML增删改

-- DML操作默认执行完自动提交数据，如果不想自动提交，则需要SET autocommit = FALSE

SELECT * FROM t_major;

-- 一条一条添加

INSERT INTO t_major VALUES( 2,'计算机科学与技术',2,now(),now(),0 );

-- 没有指定的为NULL或default值（推荐）

INSERT INTO
    t_major(
        maj_name,
        maj_department_id,
        gmt_create
    )
VALUES('土木工程', 3, now());

-- 同时添加多组数据（推荐）

INSERT INTO
    t_major(
        maj_name,
        maj_department_id,
        gmt_create
    )
VALUES ('软件工程', 2, now()), ('人工智能', 2, now()), ('化学', 4, now());

-- 查询结果插入到表中 - 如果需要添加进去的字段长度大于表字段长度会失败

-- 将查询到的a b ...字段的数据全部依次添加到表名1中字段1 字段2 ...中

INSERT INTO 表名1(字段1,字段2,...) SELECT a,b,... FROM 表名2 WHERE [...];

-- 更新数据（可能存在不成功的情况，可能是因为约束造成的）

UPDATE 表名 SET 字段 WHERE 更新条件;

-- 删除数据(也有可能受到约束影响删除失败)

DELETE FROM 表名 WHERE 删除条件;


/*
 mysql8.0新特性：计算列
 某一列是计算得来的，a列为1，b列为2，则c列不需手动插入或默认值，为定义的a+b的值，则c列为计算列
 8.0中 CREATE TABLE 和 ALTER TABLE都支持增加计算列
 */

CREATE TABLE
    a(
        a INT,
        b INT,
        c INT GENERATED ALWAYS AS (a + b) VIRTUAL -- c为计算列
    );

INSERT INTO a(a,b) VALUES (1,3);

INSERT INTO a(a,b) VALUES (4,9);

UPDATE a SET a = 100;

SELECT * FROM a;

DROP TABLE a;