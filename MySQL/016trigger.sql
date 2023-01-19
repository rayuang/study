-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
-- 触发器 MySQL5.0.2开始支持
/*
 缺点：
 可读性差：由事件驱动，可能不受应用层控制，对维护非常有挑战
 相关数据变更，可能导致触发器出错
 */
/*
 子表定义了外键约束，并外键指定了ON UPDATE/DELETE CASCADE/SET NULL子句，
 此时修改父表引用的键值或删除父表被引用的记录行时，也会引起子表的修改和删除操作，
 此时基于子表UPDATE和DELETE语句定义的触发器并不会被激活
 */
USE db_people_management;

/*
 要确保事务的原子操作，要么全部执行，要么全不执行，
 如果手动维护，很容易忘记其中一步，导致数据缺失
 可以用触发器解决
 */
/*
 触发器由事件触发某个操作，包括 INSERT UPDATE DELETE 事件
 当执行这些语句，触发器就会被自动触发执行一些操作
 触发器的名称，触发器在当前数据库中必须具有唯一的名称。
 如果要在某个特定数据库中创建，名称前面应该加上数据库的名称。
 */
/*
 CREATE <触发器名> 
 < BEFORE | AFTER >
 <INSERT | UPDATE | DELETE >
 ON <表名> FOR EACH Row<触发器执行的语句块>;
 BEFORE 表示在事件之前触发，AFTER表示在事件之后触发
 INSERT | UPDATE | DELETE 表示触发事件
 触发器执行的语句块 可以是SQL语句，也可以放在BEGIN END之中
 */
--新建触发器
SELECT
	*
FROM
	t_major_log;

CREATE TRIGGER select_insert_major_tri
AFTER
INSERT
	ON db_people_management.t_major FOR EACH ROW
INSERT INTO
	db_people_management.t_major_log(
		maj_log_name,
		maj_log_information,
		gmt_create
	)
VALUES
	('insert', 'insertSuccessful', now());

DELIMITER / / -- 使用//结束语句
DELIMITER;

-- 使用;结束语句
-- 查看当前数据库中所有触发器定义
SHOW TRIGGERS;

-- 查看当前数据库中某个触发器定义
SHOW CREATE TRIGGER select_insert_major_tri;

-- 从系统库information_schema的TRIGGERS表中查询salary_check_trigger触发器信息
SELECT
	*
FROM
	information_schema.`TRIGGERS`;

--删除触发器
DROP TRIGGER select_insert_major_tri;