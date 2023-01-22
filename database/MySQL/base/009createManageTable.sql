-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
-- 创建管理表
-- 创建数据库
CREATE DATABASE 数据库名;

-- 创建数据库并指明字符集
CREATE DATABASE 数据库名 CHARACTER SET 字符集;

--  判断数据库是否存在，不存在则创建
CREATE DATABASE IF NOT EXISTS 数据库名;

-- 查看所有数据库
SHOW DATABASES;

-- 查看创建数据库结构
SHOW CREATE DATABASE 数据库名;

-- 切换数据库
USE 数据库名;

-- 查看当前数据库中保存的数据表
SHOW TABLES;

-- 查看当前使用的数据库
SELECT
    DATABASE();

SELECT
    DATABASE()
FROM
    DUAL;

-- 查看指定数据库下的表
SHOW TABLES
FROM
    表名;

SHOW TABLES
FROM
    test;

-- 更改数据库字符集
ALTER DATABASE 数据库名 CHARACTER SET 字符集;

-- 数据库不能改名，一些可视化工具是先创建新库，再复制到新库删除旧库实现的
-- 删除数据库
DROP DATABASE 数据库名;

-- 推荐：如果数据库存在则删除，不存在则执行结束(推荐)
DROP DATABASE IF EXISTS 数据库名;

/*
 创建表
 库名、表名不能超过30个字符，变量名限制为29个
 只能包含A-Z a-z 0-9 _ 共63个字符
 库名、表名、字段名等对象名中不能有空格
 同级不可重复，不使用保留字或其他冲突字符，坚持使用必须``
 字段名和类型一致性
 */
CREATE TABLE 表名(字段1, 字段2,......);

/*
 整数： tinyint\smallint\mediumint\int(integer)\bigint
 浮点： float\double
 定点数类型： decimal
 位类型： bit
 日期时间： year\time\date\datetime\timestamp
 文本字符串类型： char\varchar\tinytext\text\mediumtext\longtext
 枚举类型: enum
 集合类型： set
 二进制字符串类型： binary\varbinary\tinyblob\blob\mediumblob\longblob
 json类型: json对象\json数组
 空间数据类型： {
 单值： geometry\point\linestring\polygon
 集合：multipoint\multilinestring\multipolygon\geometrycollection
 }
 */
-- 查看表结构
DESC 表名;

-- 查看创建表语句结构
SHOW CREATE TABLE 表名;

-- 如果创建表没有指明字符集则使用数据库的，数据库没指明看配置文件默认的
-- 基于现有表创建新表,并导入数据，如果不想导入数据，则where一个 1 = 2 的false结果即可
CREATE TABLE db_people_management.t_student2 AS
SELECT
    stu_id,
    stu_name
FROM
    db_people_management.t_student;

SELECT
    *
FROM
    t_student2;

DROP TABLE t_student2;

-- 基于现有表创建新表,并导入数据时，如果查询导入数据时使用的别名，新表中的字段为别名
CREATE TABLE db_people_management.t_student3 AS
SELECT
    stu_id id,
    stu_name names
FROM
    db_people_management.t_student;

SELECT
    *
FROM
    t_student3;

DROP TABLE t_student3;

/*
 修改表
 */
-- 添加字段（默认最后一个位置）
ALTER TABLE
    表名
ADD
    字段名 数据类型 [...];

-- 添加字段在第一个位置
ALTER TABLE
    表名
ADD
    字段名 数据类型 [...] FIRST;

-- 添加字段在某个字段之前
ALTER TABLE
    表名
ADD
    字段名 数据类型 [...]
AFTER
    字段名;

-- 修改字段：数据类型 长度 默认值
ALTER TABLE
    表名
MODIFY
    字段名 数据类型 DEFAULT '' [...];

-- 重命名字段
ALTER TABLE
    表名 CHANGE 原字段名 新字段名 数据类型;

-- 删除字段
ALTER TABLE
    表名 DROP COLUMN 字段名;

-- 重命名表
RENAME TABLE 原表名 TO 新表名;

ALTER TABLE
    原表名 RENAME TO 新表名;

-- 删除表 -- 删除后无法回滚
DROP Table [IF EXISTS] 数据表1 [,数据表2,...];

-- 清空表 -- 删除数据，保留表结构
TRUNCATE TABLE 表名;

/*
 DCL  COMMIT 和 ROLLBACK
 一旦执行COMMIT，数据将被永久保存在数据库中，不可以回滚
 ROLLBACK 数据回滚到最近的一次COMMIT之后
 */
COMMIT;

ROLLBACK;

/*
 TRUNCATE TABLE 和 DELETE FROM
 都可以实现对表中所有数据的删除，同时保留表结构
 不同点{
 TRUNCATE TABLE：清空表数据，一旦执行，表数据全部清除，不可回滚
 DELETE FROM：一旦执行，表数据可以全部清除，也可以where过滤删除，可以回滚，也可以不能回滚
 }
 */
/*
 DDL 和 DML
 DDL一旦执行不可回滚:TRUNCATE TABLE
 DML默认不可回滚，但执行DML之前执行了SET autocommit = false即可回滚：DELETE FROM
 */
SET
    autocommit = FALSE;

DELETE FROM
    表名;

SET
    autocommit = TRUE;

/*
 TRUNCATE TABLE 比 DELETE FROM快，且使用的系统和事务日志资源少，
 但无事务且不触发TRIGGER，有可能造成事故，故不推荐
 TRUNCATE TABLE 功能上和不带WHERE的 DELETE FROM相同
 */
/*
 mysql8.0中，InnoDB表的DDL支持事务完整性，即DDL操作要不成功，要不回滚
 DDL操作回滚日志写入到data dictionary数据字典表mysql.innodb_ddl_log(隐藏表)中，用于回滚操作
 */