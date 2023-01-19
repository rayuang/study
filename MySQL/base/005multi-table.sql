-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
-- 多表查询（关联查询）
-- 如果有n个表参与多表查询，则必须有n-1个连接条件
SELECT
    *
FROM
    db_people_management.t_student;

SELECT
    *
FROM
    db_people_management.t_teacher;

SELECT
    *
FROM
    db_people_management.t_major;

/*
 笛卡尔积（或交叉连接） 的错误（指错误方式，笛卡尔积并非错误）
 每个stu_id和每个tea_name都匹配了一遍
 产生了stu_id * tea_name条记录
 错误的原因：缺少了多表的连接条件
 */
SELECT
    stu_id,
    tea_name
FROM
    t_student,
    t_teacher;

-- 查询id为2的学生的班主任信息
SELECT
    *
FROM
    db_people_management.t_teacher
WHERE
    db_people_management.t_teacher.tea_id = (
        SELECT
            db_people_management.t_student.stu_headteacher_id
        FROM
            db_people_management.t_student
        WHERE
            stu_id = 2
    );

-- 如果查询语句中出现了多个表中都存在的字段，则必须指明字段出自那个表
-- 从SQL优化的角度，每个字段前都指明其所在的表
-- 指明其所在表会造成SQL语句过长，需要给表起别名，在FROM语句中
-- 一旦给表起了别名，则必须全局使用别名，而不能使用原名
SELECT
    *
FROM
    db_people_management.t_teacher tea
WHERE
    tea.tea_id = (
        SELECT
            stu.stu_headteacher_id
        FROM
            db_people_management.t_student stu
        WHERE
            stu.stu_id = 2
    );

-- 多表查询的分类
/*
 1.等值连接和非等值连接
 */
/*
 一个用户查询请求涉及到多个表的时候，连接两个表的条件为=时，
 就是等值连接查询；其他的运算符连接的就是非等值查询。
 注意：连接条件中的各连接字段类型必须是可比的，但不必是相同的，
 整型和实型是可比的，但是字符型和整型就不可比。
 */
-- 等值连接
SELECT
    *
FROM
    db_people_management.t_teacher tea
WHERE
    tea.tea_id = (
        SELECT
            stu.stu_headteacher_id
        FROM
            db_people_management.t_student stu
        WHERE
            stu.stu_id = 2
    );

-- 非等值连接
SELECT
    t.tea_id,
    t.tea_name,
    t.tea_age,
    s.stu_age,
    s.stu_headteacher_id
FROM
    db_people_management.t_teacher t,
    db_people_management.t_student s
WHERE
    t.tea_id BETWEEN s.stu_id
    AND s.stu_headteacher_id;

/*
 2.自连接和非自连接
 */
-- 自连接（自己和自己连接查询或同一张表中的连接查询）
-- 如：查询某教师和与其部门id相同的教师id的教师id和name
SELECT
    t.tea_id,
    t.tea_name,
    t.tea_age,
    t.tea_sex,
    a.tea_id AID,
    a.tea_name ANAME
FROM
    t_teacher t,
    t_teacher a
WHERE
    a.tea_id = (
        SELECT
            t.tea_department_id
        FROM
            t_teacher t
        WHERE
            t.tea_id = 2
    )
    AND t.tea_id = 2;

-- 非自连接
SELECT
    *
FROM
    db_people_management.t_teacher tea
WHERE
    tea.tea_id = (
        SELECT
            stu.stu_headteacher_id
        FROM
            db_people_management.t_student stu
        WHERE
            stu.stu_id = 2
    );

/*
 3.内连接和外连接
 */
--内连接
/*
 多表查询表中的满足条件的数据全查询出来了，多的数据都没有要
 即：合并具有同一列的两个以上的表的行，
 结果集中不包含一个表与另一个表中不匹配的行
 */
-- SQL92 实现内连接
SELECT
    *
FROM
    t_student s,
    t_major m
WHERE
    s.stu_major_id = m.maj_id;

-- SQL99 实现内连接
SELECT
    *
FROM
    t_student s
    JOIN t_major m ON s.stu_major_id = m.maj_id
    JOIN t_teacher t ON m.maj_id = t.tea_id;

-- 或
SELECT
    *
FROM
    t_student s
    INNER JOIN t_major m ON s.stu_major_id = m.maj_id
    INNER JOIN t_teacher t ON m.maj_id = t.tea_id;

--外连接 (MySQL不支持SQL92语法)
/*
 合并具有同一列的两个以上的表的行，
 结果集中包含一个表与另一个表中匹配的行之外，
 还查询到了左表或右表中不匹配的行
 */
-- 左外连接
-- 查询teacher 和 student信息,需要查出全部的teacher
-- SQL92 语法 SQL -2  使用(+)
-- SELECT * FROM student s, major m WHERE s.stu_major_id(+) = m.maj_id;(MySQL不支持)
-- SQL99 语法 SQL -3 使用JOIN ... ON的方式
-- OUTER可以省略
SELECT
    *
FROM
    t_student s
    LEFT OUTER JOIN t_major m ON s.stu_major_id = m.maj_id;

-- 右外连接 OUTER可以省略
SELECT
    *
FROM
    t_major m
    RIGHT OUTER JOIN t_student s ON m.maj_id = s.stu_major_id;

-- 满外连接 SQL99 满外连接 FULL OUTER JOIN MySQL不支持
-- SELECT * FROM student s FULL OUTER JOIN major m ON s.stu_major_id = m.maj_id;不支持
/*
 UNION关键字 - 合并查询结果
 UNION 返回结果集并集并去重 - 去重效率低
 UNION ALL 返回结果集并集不去重 - 不去重效率高
 */
SELECT
    *
FROM
    t_student s
    LEFT OUTER JOIN t_major m ON s.stu_major_id = m.maj_id
UNION
SELECT
    *
FROM
    t_major m
    RIGHT OUTER JOIN t_student s ON m.maj_id = s.stu_major_id;

-- 左外连接去除满足条件部分
SELECT
    *
FROM
    t_student s
    LEFT OUTER JOIN t_major m ON s.stu_major_id = m.maj_id
WHERE
    m.maj_id IS NULL;

-- 右外连接去除满足条件部分
SELECT
    *
FROM
    t_major m
    RIGHT OUTER JOIN t_student s ON m.maj_id = s.stu_major_id
WHERE
    m.maj_id IS NULL;

-- 满外连接去除满足条件部分
SELECT
    *
FROM
    t_student s 
    LEFT OUTER JOIN t_major m ON s.stu_major_id = m.maj_id
WHERE
    m.maj_id IS NULL
UNION
SELECT
    *
FROM
    t_major m
    RIGHT OUTER JOIN t_student s ON m.maj_id = s.stu_major_id
WHERE
    m.maj_id IS NULL;

-- SQL99 新特性
/*
 自然连接 NATURAL JOIN
 返回连接的两张表中同名字段的数据相等的数据（同名字段进行等值连接）
 不够灵活
 语法如下：
 */
SELECT
    *
FROM
    t_major NATURAL
    JOIN t_student;

-- 没有结果，因为两张表没有同名字段
/*
 USING 连接
 连接条件中判断不同表同名字段相等的写法直接USING
 如下：
 原方式：
 SELECT * FROM a JOIN b ON a.c = b.c;
 使用UNING后
 SELECT * FROM a JOIN b ON USING (c);
 不适用于自连接
 */



