-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
SELECT
    1 + 1,
    2 * 2;

--相当于
SELECT
    1 + 1,
    2 * 2
FROM
    DUAL;

--DUAL伪表
USE db_people_management;

SELECT
    *
FROM
    db_people_management.t_student;

SELECT
    stu_id,
    stu_name
from
    db_people_management.t_student;

-- 特殊查询
SELECT
    id
FROM
    (
        SELECT
            MIN(maj_id) as id
        FROM
            t_major
        GROUP BY
            maj_department_id
    ) new_table;

-- 列的别名
SELECT
    stu_id id,
    stu_name sname
FROM
    db_people_management.t_student;

-- 同下
-- 别名中有空格需要+"",不然会挂，不要使用''
SELECT
    stu_id AS id,
    stu_name AS "s name"
FROM
    db_people_management.t_student;

-- 去除重复行-查询所有的stu_headteacher_id（不重复）去重-DISTINCT关键字 给DISTINCT后面所有的字段综合去重
SELECT
    c stu_headteacher_id
FROM
    db_people_management.t_student;

--空值参与运算
/*
 空值：NULL != 0 or '' or 'NULL'
 空值参与运算结果为空值(NULL)
 函数IFNULL(a,b) -- 如果a为NULL就用b替换a
 */
SELECT
    DISTINCT IFNULL(stu_headteacher_id, 0) stu_headteacher_id
FROM
    db_people_management.t_student;

-- 着重号 `` -- 字段等不能和保留字、关键字等冲突，如果必须冲突，则需要为字段加``(着重号)
SELECT
    `stu_id`
FROM
    `t_student`;

-- 查询常数
/*
 查询常数
 为查询的结果每行添加一个不存在与原表中的字段
 */
SELECT
    'wangruijie',
    stu_id,
    stu_name
FROM
    t_student;

/*
 WHERE过滤数据
 */
SELECT
    *
FROM
    t_student
WHERE
    t_student.stu_headteacher_id = 1;