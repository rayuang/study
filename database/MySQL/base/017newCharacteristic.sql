/*
 mysql8.0中，InnoDB表的DDL支持事务完整性，即DDL操作要不成功，要不回滚
 DDL操作回滚日志写入到data dictionary数据字典表mysql.innodb_ddl_log(隐藏表)中，用于回滚操作
 */

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