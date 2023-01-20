-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
-- 聚合函数（分组函数）- 聚合函数作用于一组数据，并对一组数据返回一个值
/*
 常见聚合函数
 NULL值不参与运算
 AVG() 求平均数 = SUM()/COUNT()
 SUM() 求和 - 字符串求和为0，Oracle中直接报错
 MAX() 求最大值 ,可参与字符串运算
 MIN()  求最小值 ，可参与字符串运算
 COUNT() 求指定字段在查询结构中出现的个数
 COUNT() 计算的字段不包含NULL值的
 
 */
SELECT
    *
FROM
    t_major;

SELECT
    AVG(maj_id),
    SUM(maj_id),
    MAX(maj_id),
    MIN(maj_id),
    COUNT(maj_id),
    COUNT(NULL)
FROM
    t_major;

SELECT
    COUNT(1)
FROM
    DUAL;

-- 1
/*
 GROUP BY 分组
 */
SELECT
    CASE
        maj_department_id
        WHEN 1 THEN '财经学院'
        WHEN 2 THEN '计算机学院'
        WHEN 3 THEN '建筑学院'
        WHEN 4 THEN '理学院'
    END '二级学院',
    COUNT(maj_id) '专业个数'
FROM
    t_major
GROUP BY
    maj_department_id;

-- 多列分组 - 二级分组
/*
 结论：SELECT中出现的非组函数的字段必须声明在GROUP BY中。
 反之，GROUP BY 中声明的字段可以不出现在SELECT中。
 
 GROUP BY 声明在FROM、WHERE后面，ORDER BY 前面、LIMIT前面
 
 WITH ROLLUP 查询完对GROUP BY字段进行整体计算一个新的行
 */
SELECT
    CASE
        maj_department_id
        WHEN 1 THEN '财经学院'
        WHEN 2 THEN '计算机学院'
        WHEN 3 THEN '建筑学院'
        WHEN 4 THEN '理学院'
    END '二级学院',
    COUNT(maj_id) '专业个数'
FROM
    t_major
GROUP BY
    maj_department_id WITH ROLLUP;

SELECT
    *
FROM
    t_major;

/*
 HAVING - 用来过滤数据的
 组函数不能在WHERE中使用，
 如果需要在过滤条件中使用组函数，则需要用HAVING替换掉WHERE
 
 SQL中我们使用HAVING的前提是SQL中使用的GROUP BY
 如果需要通过连接从关联表中获取需要的数据，WHERE是先筛选后连接，HAVING是先连接后筛选
 */
SELECT
    *
FROM
    t_major
GROUP BY
    maj_department_id
HAVING
    AVG(maj_department_id) > maj_department_id;

/*
 SQL底层执行原理
 SQL语法的执行过程
 FROM -> ON -> (LEFT/RIGHT/ JOIN) -> WHERE -> GROUP BY -> HAVING -> 
 SELECT -> DISTINCT -> ORDER BY -> LIMIT
 */