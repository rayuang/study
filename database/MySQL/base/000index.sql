-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
SELECT
    VERSION();

--查看版本
SELECT
    CONNECTION_ID();

-- 返回当前MYSQL服务器的连接数
SELECT
    DATABASE(),
    SCHEMA();

-- 返回MySQL命令行当前所在数据库
SELECT
    USER(),
    CURRENT_USER(),
    SYSTEM_USER(),
    SESSION_USER();

-- 返回当前连接MySQL的用户名，返回结果格式为用户名@IP
SELECT
    CHARSET('ASD');

-- 返回字符串自变量的字符集
SELECT
    COLLATION('asfas');

-- 返回字符串的比较规则
SHOW DATABASES;

--查看所有数据库
SHOW CREATE TABLE t_student;

--查看创建表时的命令
DESC t_student;

-- 查询表结构(创建表时的字段信息)
-- 同下
DESCRIBE t_student;

/*
 DDL:数据定义语言    CREATE、ALTER、DROP、RENAME、TRUNCATE
 DML:数据操作语言    INSERT、DELETE、UPDATE、SELECT
 DCL:数据控制语言    COMMIT、ROLLBACK、SAVEPOINT、GRANT、REVOKE
 */
--  字符串、时间日期类型变量需要在''中
-- 列的别名推荐使用""，并且不建议使用as
-- 　　在MySQL的sql语句后加上\g，效果等同于加上定界符，一般默认的定界符是分号;
-- 在MySQL的sql语句后加上\G，表示将查询结果进行按列打印，可以使每个字段打印到单独的行。即将查到的结构旋转90度变成纵向；
/*
 windows系统默认大小写不敏感 ，但是linux系统是大小写敏感的。
 linux下{
 数据库名、表名、表别名、变量名严格区分大小写
 关键字、函数名、列名（或字段名）、列别名是忽略大小写
 }
 统一格式{
 库名、表名、表别名、字段名、字段别名都小写
 SQL关键字、函数名、绑定变量都大写
 }
 */
-- 注释{
--     #注释（MySQL特有）
--     --注释（--后必须要空格 通用）
--     /*注释*/  /* （多行）
-- }
/*
 导入现有数据表、数据{
 1.source 文件全路径
 2.基于图形化界面操作
 }
 */