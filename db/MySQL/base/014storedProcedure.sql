-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
-- 存储过程与存储函数 - 阿里开发规范【强制】禁止使用存储过程，存储过程难以调试和扩展，更没有移植性
/*
 含义： 存储过程是一组经过预先编译的SQL语句的封装
 执行过程：存储过程预先存储在服务器上，需要执行的时候，
 客户端只需要向服务器发送调用存储过程的命令，服务器就可以将预先存储好的这一些列SQL全部执行
 好处：1. 简化操作，提高SQL语句的重用性
 2. 减少操作过程中的失误
 3. 减少网络传输量（客户端不需要将所有SQL语句通过网络发送给服务器）
 4. 减少SQL语句暴露在网上的风险，提高数据查询安全性
 与视图不同点：
 视图可以看作虚拟表，存储过程为程序化SQL，可以直接操作底层数据表
 一旦存储过程被创建起来，使用就像函数一样，直接调用存储过程名即可，但存储过程没有返回值
 */
/*
 存储过程可以是IN\OUT\INOUT
 没带参数（无参数无返回）
 仅仅带IN类型（有参数无返回）
 仅仅带OUT参数（无参数有返回）
 即带IN又带OUT（有参数有返回）
 带INOUT（有参数有返回）
 *：IN\OUT\INOUT都可以在一个存储过程中带多个
 */
CREATE PROCEDURE 存储过程名(IN | OUT | INOUT 参数名 参数类型......) [characteristics...] BEGIN 存储过程体
END;

CREATE PROCEDURE proc_select_all_major() BEGIN
SELECT
    *
FROM
    t_major;

END;

CREATE PROCEDURE proc_select_all_student() BEGIN
SELECT
    *
FROM
    t_student;

END;

/*
 形参类型可以是MySQL中的任意类型
 characteristics 表示创建存储过程时指定的对存储过程的约束条件
 */
/*
 LANGUAGE SQL	说明存储过程由SQL语句组成
 [NOT] DETERMINISTIC	指明存储过程执行的结果是否确定，默认为：NOT DETERMINISTIC
 {CONTAINS SQL / NO SQL / READS SQL DATA / MODIFIES SQL DATA }	指明子程序使用SQL语句的限制， 默认为：CONTAINS SQL
 SQL SECURITY { DEFINER / INVOKER }	指明执行当前存储过程的权限，默认为：DEFINER
 COMMENT 'string'	注释信息
 */
/*
 存储过程中的SQL语句需要放在 BEGIN … END 中
 BEGIN…END：BEGIN…END 中间包含了多个语句，每个语句都以（;）号为结束符
 DECLARE：DECLARE 用来声明变量，使用的位置在于 BEGIN…END 语句中间，而且需要在其他语句使用之前进行变量的声明
 SET：赋值语句，用于对变量进行赋值
 SELECT… INTO：把从数据表中查询的结果存放到变量中，也就是为变量赋值
 需要设置新的结束标记 DELIMITER 新的结束标记
 示例：
 DELIMITER //
 CREATE PROCEDURE 存储过程名(IN|OUT|INOUT 参数名 数据类型, …)
 [characteristics …]
 BEGIN
 sql语句1;
 sql语句2;
 END //
 DELIMITER ;
 */