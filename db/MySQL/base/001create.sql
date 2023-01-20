-- Active: 1665375285637@@127.0.0.1@3306@db_people_management
CREATE DATABASE test;

DROP DATABASE db_people_management;

CREATE DATABASE db_people_management;

CREATE DATABASE IF NOT EXISTS db_people_management;

SHOW CREATE DATABASE db_people_management;

USE db_people_management;

DROP TABLE db_people_management.t_student;

CREATE Table t_student(
    stu_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'studentId',
    stu_name VARCHAR(30) NOT NULL COMMENT 'studentName',
    stu_sex CHAR(6) NOT NULL DEFAULT '0' COMMENT 'studentSex',
    stu_age INT NOT NULL DEFAULT '0' COMMENT 'studentAge',
    stu_major_id INT NOT NULL DEFAULT '0' COMMENT 'studentMajorId',
    stu_department_id INT NOT NULL DEFAULT '0' COMMENT 'studentDepartmentId',
    stu_dorm_id INT NOT NULL DEFAULT '0' COMMENT 'studentDorm',
    stu_headteacher_id BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'headteacherId',
    stu_main_class_id BIGINT UNSIGNED NOT NULL DEFAULT '0' COMMENT 'mainClassId',
    stu_hobby VARCHAR(100) NOT NULL DEFAULT 'no' COMMENT 'studentHobby',
    stu_address VARCHAR(100) NOT NULL DEFAULT 'shannxi of china' COMMENT 'studentAddress',
    gmt_create DATETIME NOT NULL COMMENT 'createTime',
    gmt_modified DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'updateTime',
    is_deleted TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'isDeleted'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

SHOW CREATE TABLE t_student;

INSERT INTO
    t_student
VALUES
    (
        0000000000000000001,
        'abc',
        'man',
        18,
        1,
        0,
        1111,
        0000000000000000001,
        0000000000000000001,
        'ball and run',
        'Shannxi of China',
        now(),
        now(),
        0
    );

INSERT INTO
    t_student
VALUES
    (
        0000000000000000002,
        'abc',
        'man',
        18,
        2,
        1,
        1111,
        0000000000000000002,
        0000000000000000001,
        'ball and run',
        'Shannxi of China',
        now(),
        now(),
        0
    );

INSERT INTO
    t_student
VALUES
    (
        0000000000000000003,
        'abc',
        'man',
        18,
        3,
        0,
        1111,
        0000000000000000001,
        0000000000000000001,
        'ball and run',
        'Shannxi of China',
        now(),
        now(),
        0
    );

SELECT
    *
FROM
    t_student;

UPDATE
    t_student
set
    stu_name = '203ce'
WHERE
    stu_id = 1;

DROP TABLE db_people_management.t_teacher;

CREATE Table t_teacher(
    tea_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'teacherId',
    tea_name VARCHAR(30) NOT NULL COMMENT 'teacherName',
    tea_sex CHAR(6) NOT NULL DEFAULT '0' COMMENT 'teacherSex',
    tea_age INT NOT NULL DEFAULT '0' COMMENT 'teacherAge',
    tea_job_title_id INT NOT NULL DEFAULT '0' COMMENT 'teacherJobTitleId',
    tea_department_id INT NOT NULL DEFAULT '0' COMMENT 'teacherDepartmentId',
    tea_graduate_school VARCHAR(100) NOT NULL DEFAULT 'university' COMMENT 'teacherGraduateSchool',
    tea_dorm_id INT NOT NULL DEFAULT '0' COMMENT 'teacherDorm',
    tea_office_id INT NOT NULL DEFAULT '0' COMMENT 'teacherOfficeId',
    tea_hobby VARCHAR(100) NOT NULL DEFAULT 'no' COMMENT 'teacherHobby',
    tea_address VARCHAR(100) NOT NULL DEFAULT 'shannxi of china' COMMENT 'teacherAddress',
    is_headteacher TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'isHeadteacher',
    gmt_create DATETIME NOT NULL COMMENT 'createTime',
    gmt_modified DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'updateTime',
    is_deleted TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'isDeleted'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

SELECT
    *
FROM
    db_people_management.t_teacher;

INSERT INTO
    db_people_management.t_teacher
VALUES
    (
        1,
        'namesds',
        'man',
        29,
        0,
        1,
        'university',
        5555,
        0,
        'run and read',
        'China',
        0,
        now(),
        now(),
        0
    );

INSERT INTO
    db_people_management.t_teacher
VALUES
    (
        2,
        'gsfdghs',
        'man',
        24,
        0,
        1,
        'university',
        5555,
        0,
        'read',
        'China',
        0,
        now(),
        now(),
        0
    );

INSERT INTO
    db_people_management.t_teacher
VALUES
    (
        3,
        'rhegfv',
        'man',
        29,
        0,
        0,
        'university',
        5555,
        0,
        'run and read',
        'China',
        0,
        now(),
        now(),
        0
    );

SELECT
    *
FROM
    db_people_management.t_teacher;

DROP TABLE db_people_management.t_major;

CREATE Table t_major(
    maj_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'majorId',
    maj_name VARCHAR(100) NOT NULL DEFAULT 'majorName' COMMENT 'majorName',
    maj_department_id INT NOT NULL DEFAULT '0' COMMENT 'majorDepartmentId',
    gmt_create DATETIME NOT NULL COMMENT 'createTime',
    gmt_modified DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'updateTime',
    is_deleted TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'isDeleted'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

SELECT
    *
FROM
    db_people_management.t_major;

INSERT INTO
    db_people_management.t_major
VALUES
    (1, 'mpacc', 1, now(), now(), 0);

CREATE Table t_major_log(
    maj_log_id BIGINT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'majorLogId',
    maj_log_name VARCHAR(50) NOT NULL DEFAULT '-1' COMMENT 'majorLogName',
    maj_log_information VARCHAR(200) NOT NULL DEFAULT 'insertSuccessful' COMMENT 'majorLogInformation',
    gmt_create DATETIME NOT NULL COMMENT 'createTime',
    gmt_modified DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'updateTime',
    is_deleted TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'isDeleted'
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;