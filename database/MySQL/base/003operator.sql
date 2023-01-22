-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
/*
 运算符
 */
-- 算术运算符 + - * / div % mod  除数为零时结果为NULL
SELECT
    1 + 1,
    2 - 2,
    3 * 3,
    4 / 4,
    5 % 5
FROM
    DUAL;

/*
 在Java等语言中为51，因为+字符串起连接作用，
 但在SQL中，+没有连接作用，它会将数值字符串转换为数值（隐式转换）
 非数值字符串会看作0处理
 */
SELECT
    5 + '1',
    71 + 'a';

-- 6,71
-- DIV除法 除数为零时结果为NULL   MOD 取模，被模数 MOD 模数 最后的符号与被模数相同
SELECT
    100 DIV 0,
    72 MOD 5,
    72 MOD -5,
    -72 MOD 5;

-- 比较运算符  有NULL参与结果就为NULL <=>除外
/*
 =等于 只要 <=>安全等于 <>或!=不等于 <小于 <=小于等于 >大于 >=大于等于
 <=>安全等于可以对NULL进行判断，两者都为NULL时返回值为1，一个为NULL时返回0，而不是NULL
 */
-- IS NULL为NULL、 IS NOT NULL不为NULL、 ISNULL(参数)参数为NULL
-- LEAST(a,b,c,……)最小 AND GREATEST(a,b,c,……)最大
SELECT
    LEAST('a', 'g', 'j', 'f', 'u', 'y'),
    GREATEST('a', 'g', 'j', 'f', 'u', 'y');

-- a,y
-- BETWEEN a AND b   [a,b]之间的（闭区间）
-- 查询10~18岁之间的
SELECT
    *
FROM
    db_people_management.t_student
WHERE
    stu_age BETWEEN 10
    AND 18;

-- NOT BETWEEN a AND b   不在[a,b]之间的（闭区间）
SELECT
    *
FROM
    db_people_management.t_student
WHERE
    stu_age NOT BETWEEN 10
    AND 18;

-- IN(set)在set中 AND NOT IN(set)不在set中
--查询id为2和3和4的
SELECT
    *
FROM
    db_people_management.t_student
WHERE
    stu_id IN(2, 3);

-- 查询id不为2和3和4的
SELECT
    *
FROM
    db_people_management.t_student
WHERE
    stu_id NOT IN(2, 3, 4);

-- LIKE 模糊查询
/*
 % 代表不确定个数的字符
 */
-- 查询stu_name中包含字符b的
SELECT
    *
FROM
    db_people_management.t_student
WHERE
    stu_name LIKE '%b%';

-- 查询stu_name第二个字符是b的
SELECT
    *
FROM
    db_people_management.t_student
WHERE
    stu_name LIKE '_b%';

-- 正则表达式 REGEXP  AND  RLIKE
/*
 REGEXP 运算符：
 ^ 匹配该字符后面的字符开头的字符串
 $ 匹配该字符前面的字符结尾的字符串
 . 匹配任何一个字符串
 [...]匹配在方括号内的任何字符，
 例如[a,b,c]匹配a,b或c，为了命名字符的范围，
 使用一个-，[a-z]匹配任何字母[0-9]匹配任何数字
 * 匹配任意个在它前面的字符
 例： X* 匹配任意数量的X ，[0-9]* 匹配任意个数的数字，而*匹配任何数量的任意字符
 */
SELECT
    'njfdgnekg' REGEXP '^n',
    'njfdgnekg' REGEXP '^g',
    'njfdgnekg' REGEXP 'g$',
    'njfdgnekg' REGEXP 'o$'
FROM
    DUAL;

-- 1 0 1 0
SELECT
    'njfdgnekg' RLIKE '^n',
    'njfdgnekg' RLIKE '^g',
    'njfdgnekg' RLIKE 'g$',
    'njfdgnekg' RLIKE 'o$'
FROM
    DUAL;

-- 逻辑运算符  返回0，1或NULL
/*
 NOT或 !  逻辑非
 AND或 && 逻辑与
 OR或 ||  逻辑或
 XOR      逻辑异或   a 和 b只能满足一个  a XOR b
 
 AND 优先级高于 OR
 */
-- 位运算符
/*
 &   按位与
 |   按位或
 ^   按位异或
 ~   按位取反
 >>  按位右移
 <<  按位左移
 */