-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
-- 单行函数 
/*
 接受参数返回一个结构，只对一行进行变换，每行返回一个结果
 ，可嵌套，参数可以是一列或一个值
 */
SELECT
    *
FROM
    t_major;

-- 数值类型函数
/*
 ABS(x)返回x绝对值
 SIGN(X)X取符号，负数返回-1，正数返回1
 PI()取圆周率 小数点后6位
 CEIL(x),CEILING(x),x向上取整，返回大于x的最小整数
 FLOOR(X),x向下取整，返回小于x的最大整数
 MOD(a,b),取余 同 a%b
 */
SELECT
    ABS(-152),
    ABS(23),
    SIGN(12),
    SIGN(-12),
    PI(),
    CEIL(32.23),
    CEILING(-12.23),
    FLOOR(12.26),
    FLOOR(-12.35),
    MOD(12, 5),
    12 MOD 5,
    12 % 5
FROM
    DUAL;

/*
 随机数
 RAND()返回0~1的随机数
 RAND(x)返回0~1的随机数，其中x的值用作种子，相同的x值会产生相同的随机数
 如果两个RAND(x)中的种子x的值相同，则得到的随机数值相同
 */
SELECT
    RAND(),
    RAND(),
    CEILING(RAND() * 100),
    RAND(10),
    RAND(10),
    RAND(-1),
    RAND(-1)
FROM
    DUAL;

/*
 四舍五入，截断操作
 ROUND(X)对X四舍五入
 ROUND(X,Y)对X四舍五入,保留Y位小数
 TRUNCATE(X,Y)对X保留Y位小数,直接截断不四舍五入
 */
SELECT
    ROUND(123.5461),
    ROUND(123.125),
    ROUND(123.564, 1),
    ROUND(123.564, -1)
FROM
    DUAL;

SELECT
    TRUNCATE(123.264, 0),
    TRUNCATE(123.264, 1),
    TRUNCATE(123.264, -1)
FROM
    DUAL;

/*
 三角函数
 SIN(X)返回X的正弦值，其中参数X为弧度值
 ASIN(X)反正弦，如果X不在-1~1之间则返回NULL
 COS(X)余弦
 ACOS(X)反余弦，如果X不在-1~1之间则返回NULL
 TAN(X)正切值
 ATAN(X)反正切值，返回正切值为X的值
 ATAN2(M,N)返回两个参数的反正切值
 COT(X)返回X的余切值，X为弧度值
 */
SELECT
    SIN(1),
    ASIN(2),
    ASIN(0.2)
FROM
    DUAL;

/*
 角度与弧度互换函数
 RADIANS(X)将角度转换为弧度，其中，参数X为角度值
 DEGREES(X)将弧度转换为角度，其中，参数X为弧度值
 */
/*
 指数和对数
 POW(X,Y),POWER(X,Y),返回X的Y次方
 EXP(X)返回e的X次方
 LN(X),LOG(X)返回以e为底的X的对数，当X<=0时，返回结果为NULL
 LOG10(X)返回以10为底的X的对数，X<= 0时，结果为NULL
 LOG2(X)返回以2为底的X的对数，X<= 0时，返回NULL
 */
SELECT
    POW(2, 5),
    POWER(2, 5),
    EXP(5),
    LN(5),
    LOG(5),
    LN(-1),
    LOG10(2),
    LOG10(-1),
    LOG2(2),
    LOG2(-1)
FROM
    DUAL;

/*
 进制转换
 BIN(X)返回X的二进制编码
 HEX(X)返回X的十六进制编码
 OCT(X)返回X的八进制编码
 CONV(X,F1,F2)返回F1进制数变为F2进制数
 */
SELECT
    BIN(3),
    HEX(3),
    OCT(3),
    CONV(3, 10, 2),
    CONV(3, 10, 8),
    CONV(3, 10, 16)
FROM
    DUAL;

-- 字符串类型函数
/*
 ASCII(S)返回S中第一个字符的的ASCLL编码
 CHAR_LENGTH(S)返回S的字符数，作用与CHARACTER_LENGTH(S)相同
 LENGTH(S)返回字符串S的字节数，和字符集有关
 CONCAT(S1,S2,S3,SN)连接字符串
 CONCAT_WS(X,S1,S2,S3,SN)连接字符串并使用X分割
 INSERT(A,B,C,D)将字符串A从B索引开始，取C个替换成D，SQL索引从1开始计算
 REPLACE(A,B,C)将字符串A中的所有B替换为C，替换失败返回原字符串
 UPPER(x)将x中的所有小写转为大写，同UCASE(x)
 LOWER(X)将X中的所有大写转换为小写,同LCASE(X)
 */
SELECT
    ASCII('abc'),
    CHAR_LENGTH('hello'),
    CHAR_LENGTH('我们'),
    LENGTH('hello'),
    LENGTH('我们'),
    CONCAT('ABC', 'WANGRUIJIE', 'HELLO'),
    CONCAT_WS('-', 'ABC', 'WANGRUIJIE', 'HELLO'),
INSERT
    ('HELLOWORD', 2, 3, 'ABCDE'),
    REPLACE('hellowordll', 'll', 'mm'),
    UPPER('hello'),
    LOWER('HEllO')
FROM
    DUAL;

/*
 LEFT(S,N)返回字符串S从左开始的N个数
 RIGHT(S,N)返回字符串S从右开始的N个数
 LPAD(A,B,C)字符串A实现右对齐效果，不足B位左边补C
 RPAD(A,B,C)字符串A实现左对齐效果，不足B位右边补C
 LTRIM(S)去除字符串S左边的空格
 RTRIM(S)去除字符串S右边的空格
 TRIM(S)去除字符串S两侧的空格
 TRIM(S1 FROM S)去除字符串S开始与结尾的S1
 TRIM(LEADING S1 FROM S)去除字符串S左侧的S1
 TRIM(TRAILING S1 FROM S)去除字符串S右侧的S1
 */
SELECT
    LEFT('hello', 2),
    RIGHT('hello', 2),
    LPAD('HRAF', 10, '*'),
    RPAD('ASED', 8, '_'),
    LTRIM('   ASD'),
    RTRIM('ASD   '),
    TRIM(' A SD '),
    TRIM(
        'a'
        FROM
            'adsfdsaca'
    ),
    TRIM(
        LEADING 'a'
        FROM
            'adsfdsaca'
    ),
    TRIM(
        TRAILING 'a'
        FROM
            'adsfdsaca'
    )
FROM
    DUAL;

/*
 REPEAT(S,N)返回重复N次S的字符串
 SPACE(N)返回N个空格
 STRCMP(S1,S2)比较两个字符串ASCII码值的大小,
 返回正数则前面大，0一样大，否则后面大
 SUBSTR(A,B,C)字符串A从B开始取C个字符
 LOCATE(A,B)返回A在B中首次出现的位置，没有返回0
 ELT(m,s1,s2,...,sn)返回指定位置的字符串，
 如果m=1则返回s1，m=2则返回s2，m=n则返回sn
 FIELD(S,S1,S2,...,SN)返回字符串S在字符串中第一次出现的位置
 FIND_IN(S1,S2)返回S1在S2中出现的位置，其中S2是一个以逗号分隔的字符串
 */
SELECT
    REPEAT('HELLO', 3),
    SPACE(10),
    STRCMP('AC', 'SA'),
    SUBSTR('ABCDEFGH', 2, 3),
    LOCATE('e', 'hello')
FROM
    DUAL;

-- 日期时间类型函数
/*
 CURDATE()返回当前日期，只包含年月日,同CURRENT_DATE()
 CURTIME()返回当前时间，只包含时分秒，同CURRENT_TIME()
 NOW()返回当前系统日期时间
 UTC_DATE()返回UTC（世界标准时间）日期
 UTC_TIME()返回UTC（世界标准时间）时间
 */
SELECT
    CURDATE(),
    CURRENT_DATE(),
    CURTIME(),
    CURRENT_TIME(),
    NOW(),
    UTC_DATE(),
    UTC_TIME()
FROM
    DUAL;

/*
 
 年月日时分秒
 YEAR()
 MONTH()
 DAY()
 HOUR()
 MINUTE()
 SECOND()
 */
SELECT
    NOW(),
    YEAR(NOW()),
    MONTH(NOW()),
    DAY(NOW()),
    HOUR(NOW()),
    MINUTE(NOW()),
    SECOND(NOW())
FROM
    DUAL;

/*
 时间，时间戳转换
 UNIX_TIMESTAMP()以UNIX时间戳方式返回当前时间
 UNIX_TIMESTAMP(date)将时间date以UNIX时间戳的形式返回
 FROM_UNIXTIME(timestamp)将UNIX时间戳的时间转换为普通格式时间
 */
SELECT
    UNIX_TIMESTAMP(),
    FROM_UNIXTIME(UNIX_TIMESTAMP()),
    UNIX_TIMESTAMP(FROM_UNIXTIME(UNIX_TIMESTAMP()))
FROM
    DUAL;

-- 流程控制函数
/*
 IF(A,B,C)如果A为true则返回B，否则返回C
 IFNULL(A,B)如果A不为NULL则返回A，否则返回B
 */
SELECT
    IF(true, 'abc', 'def'),
    IF(false, 'abc', 'def'),
    IFNULL(NULL, 'ABCD'),
    IFNULL('SDFG', 'ABCD')
FROM
    DUAL;

/*
 CASE WHEN 条件1 THEN 结果1 ... END 相当于if{}else if{}
 */
SELECT
    CASE
        WHEN 1 > 0 THEN '1>0'
        WHEN 2 < 1 THEN '2 < 1'
        WHEN 5 > 2 THEN '5 > 2'
    END
FROM
    DUAL;

/*
 CASE expr WHEN 条件1 THEN 结果1 ... END 相当于switch...case....
 */
SELECT
    CASE
        5
        WHEN 1 THEN '1>0'
        WHEN 2 THEN '2 < 1'
        WHEN 5 THEN '5 > 2'
    END
FROM
    DUAL;

-- 加密解密_MySQL信息函数
/*
 PASSWORD(str)返回字符串str的加密版本，41位长的字符串。
 加密结果不可逆，常用于用户的密码加密(MYSQL8.0弃用)
 MD5(str)返回字符串str的md5加密后的值，若参数为NULL则会返回NULL,不可逆
 SHA(str)从明文密码str计算并返回加密后的密码字符串，
 当参数为null时，返回null，比md5更安全，不可逆
 ENCODE(VALUE,PASSWORD_SEED)返回使用PASSWORD_SEED作为加密密码加密VALUE
 DECODE(VALUE,PASSWORD_SEED)返回使用PASSWORD_SEED作为解密密码解密VALUE
 */
SELECT
    PASSWORD('asfgdgw42')
FROM
    DUAL;

-- PASSWORD(str)MySQL8.0弃用，无法使用
SELECT
    MD5('asfgdgw42'),
    SHA('asfgdgw42')
FROM
    DUAL;

SELECT
    ENCODE('asfgdgw42', 'mysql'),
    DECODE('asfgdgw42', 'mysql')
FROM
    DUAL;

-- ENCODE和DECODE MySQL8.0弃用，不可用
SELECT
    FORMAT(1556.118, 2);

-- 对参数1（数字）进行格式化，参数2为四舍五入后保留小数点后n位
SELECT
    CONV(4, 10, 2);

-- 将参数1（数字）从参数2进制转换为参数3进制
SELECT
    INET_ATON('127.0.0.1'),
    INET_NTOA(INET_ATON('127.0.0.1'));

-- 第一个函数为将以点分割的IP转换为数字方式IP，第二个函数为将数字形式IP转换为以点分割的IP
SELECT
    BENCHMARK(100, FORMAT(1556.118, 2));

-- 将第二个参数的表达式执行第一个参数次，用于测试MySQL处理exrp表达式所耗费的时间
SELECT
    CHARSET('ABC'),
    CHARSET(CONVERT('ABC' USING 'utf8mb3'));

-- 参数1所使用的字符编码修改为新的字符集