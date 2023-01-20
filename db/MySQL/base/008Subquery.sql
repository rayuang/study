-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
-- 子查询 - 将一个查询嵌套在一个查询内部
SELECT
    *
FROM
    t_major;

SELECT
    *
FROM
    t_student;

-- 称谓规范：外查询（主查询）和内查询（子查询）
/*
 子查询分类{
 单行子查询（内查询查出一行） * 多行子查询（内查询查出多行）
 相关子查询（子查询执行多次） * 不相关子查询（子查询执行一次）
 }
 */
-- 单行子查询
SELECT
    maj_name
FROM
    t_major
WHERE
    maj_id = (
        SELECT
            stu_major_id
        FROM
            t_student
        WHERE
            stu_name = '203ce'
    );

SELECT
    maj_name
FROM
    t_major
WHERE
    (
        t_major.maj_id,
        t_major.is_deleted
    ) = (
        SELECT
            t_student.stu_major_id,
            t_student.is_deleted
        FROM
            t_student
        WHERE
            stu_name = '203ce'
    );

-- 多行子查询
/*
 多行子查询常见操作符
 IN 任意一个
 ANY 和单行比较操作符使用，和子查询返回的某一个值比较
 ALL 和SOME 和单行比较操作符一起使用，和子查询返回的所有值比较，SOME同ANY，一般用ANY
 */
SELECT
    maj_name
FROM
    t_major
WHERE
    maj_id IN (
        SELECT
            stu_major_id
        FROM
            t_student
        WHERE
            stu_name = 'abc'
    );

-- ANY
SELECT
    maj_name
FROM
    t_major
WHERE
    maj_id < ANY (
        SELECT
            stu_major_id
        FROM
            t_student
        WHERE
            stu_id = 3
    );

-- ALL
SELECT
    maj_name
FROM
    t_major
WHERE
    maj_id < ALL (
        SELECT
            stu_major_id
        FROM
            t_student
        WHERE
            stu_name = 'abc'
    );

/*
 HAVING中的子查询
 1. 首先执行子查询
 2. 向主查询中的HAVING子句返回结果
 */
-- 不相关子查询
SELECT
    maj_name
FROM
    t_major
WHERE
    maj_id = (
        SELECT
            stu_major_id
        FROM
            t_student
        WHERE
            stu_name = '203ce'
    );

-- 相关子查询
/*
 子查询依赖外部查询，通常是因为子查询中的表用到了外部的表，
 并进行了条件关联，因此每执行一条外部查询，子查询都要重新计算一次，
 即关联子查询
 */
/*
 SELECT
 col1,
 col2,... 
 FROM tab1 outer
 WHERE col1 operator (
 SELECT col1, col2
 FROM tab2
 WHERE
 expr1 = outer.expr2
 );
 */
/*
 关联子查询通常和EXISTS操作符使用，检查子查询中是否存在满足条件的行
 如果在子查询不存在满足条件的行
 1. 条件返回false
 2. 继续在子查询中查找
 如果子查询中存在满足条件的行
 1. 不在子查询中继续查找
 2. 条件返回true
 NOT EXISTS 关键字表示不存在某种条件，则返回true，否则返回false
 */
-- 相关更新
-- 使用相关子查询依据一个表中的数据更新另一个表中的数据
-- 相关删除
-- 使用相关子查询依据一个表中的数据删除另一个表中的数据