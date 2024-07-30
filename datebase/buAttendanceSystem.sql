CREATE DATABASE IF NOT EXISTS `attendance_system`;
USE `attendance_system`;

-- User Table
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `username` VARCHAR(32) NOT NULL COMMENT '用户名',
    `email_address` VARCHAR(254) NOT NULL COMMENT '邮箱' UNIQUE,
    `password` VARCHAR(64) NOT NULL COMMENT '密码',
    `picture` VARCHAR(255) DEFAULT NULL COMMENT '头像路径',
    `type` ENUM('Professor', 'Assistant') NOT NULL COMMENT '账号类型',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='用户表';

-- Course Table
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `year` YEAR NOT NULL COMMENT '学年',
    `semester` ENUM('Fall', 'Spring', 'Summer', 'Summer1', 'Summer2') NOT NULL COMMENT '学期',
    `department_name` VARCHAR(32) NOT NULL COMMENT '系名称',
    `course_id` VARCHAR(32) NOT NULL UNIQUE COMMENT '课程ID',
    `section_id` VARCHAR(32) NOT NULL COMMENT '课程Section ID',
    `course_name` VARCHAR(255) NOT NULL COMMENT '课程名称',
    `begin_time` DATE NOT NULL COMMENT '课程开始时间',
    `end_time` DATE NOT NULL COMMENT '课程结束时间',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='课程表';

-- Course Management Table
DROP TABLE IF EXISTS `course_management`;
CREATE TABLE `course_management` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id` BIGINT NOT NULL COMMENT '课程ID',
    `professor_id` BIGINT NOT NULL COMMENT '教授ID',
    `allocation_date` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '分配日期',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`course_id`) REFERENCES `course`(`id`),
    FOREIGN KEY (`professor_id`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='课程管理表';

-- Course Assist Table
DROP TABLE IF EXISTS `course_assist`;
CREATE TABLE `course_assist` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id` BIGINT NOT NULL COMMENT '课程ID',
    `assist_id` BIGINT NOT NULL COMMENT '助教ID',
    `professor_id` BIGINT NOT NULL COMMENT '教授ID',
    `allocation_date` DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '分配日期',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`course_id`) REFERENCES `course`(`id`),
    FOREIGN KEY (`assist_id`) REFERENCES `user`(`id`),
    FOREIGN KEY (`professor_id`) REFERENCES `user`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='课程协助表';

-- Student Table
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `student_last_name` VARCHAR(32) NOT NULL COMMENT '学生姓',
    `student_first_name` VARCHAR(32) NOT NULL COMMENT '学生名',
    `student_id` CHAR(9) NOT NULL UNIQUE COMMENT '学生号',
    `email` VARCHAR(100) DEFAULT NULL COMMENT '邮箱',
    PRIMARY KEY (`id`),
    CONSTRAINT chk_student_id CHECK (student_id REGEXP '^U[0-9]{8}$')
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='学生表';

-- Course Enrollment Table
DROP TABLE IF EXISTS `course_enrollment`;
CREATE TABLE `course_enrollment` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `course_id` BIGINT NOT NULL COMMENT '课程ID',
    `student_id` CHAR(9) NOT NULL COMMENT '学生号',
    `student_last_name` VARCHAR(32) NOT NULL COMMENT '学生姓',
    `student_first_name` VARCHAR(32) NOT NULL COMMENT '学生名',
    `enrollment_date` DATETIME NOT NULL COMMENT '加入时间',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`course_id`) REFERENCES `course`(`id`),
    FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='课程注册表';

-- Attendance Table
DROP TABLE IF EXISTS `attendance`;
CREATE TABLE `attendance` (
    `id` BIGINT NOT NULL AUTO_INCREMENT COMMENT '主键',
    `student_id` CHAR(9) NOT NULL COMMENT '学生ID',
    `course_id` BIGINT NOT NULL COMMENT '课程ID',
    `attendance_time` DATETIME NOT NULL COMMENT '签到时间',
    PRIMARY KEY (`id`),
    FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`),
    FOREIGN KEY (`course_id`) REFERENCES `course`(`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='签到记录表';

-- 插入用户数据
INSERT INTO `user` (`username`, `email_address`, `password`, `picture`, `type`, `create_time`, `update_time`)
VALUES
('profjohn', 'john.doe@example.com', 'password123', 'path/to/picture1.jpg', 'Professor', NOW(), NOW()),
('assistjane', 'jane.smith@example.com', 'password123', 'path/to/picture2.jpg', 'Assistant', NOW(), NOW());

-- 插入课程数据
INSERT INTO `course` (`year`, `semester`, `department_name`, `course_id`, `section_id`, `course_name`, `begin_time`, `end_time`, `create_time`, `update_time`)
VALUES
(2024, 'Fall', 'Computer Science', 'CS101', '001', 'Introduction to Programming', '2024-09-01', '2024-12-15', NOW(), NOW()),
(2024, 'Spring', 'Computer Science', 'CS102', '001', 'Data Structures', '2024-01-15', '2024-05-15', NOW(), NOW());

-- 插入课程管理数据
INSERT INTO `course_management` (`course_id`, `professor_id`, `allocation_date`)
VALUES
(1, 1, NOW());

-- 插入课程协助数据
INSERT INTO `course_assist` (`course_id`, `assist_id`, `professor_id`, `allocation_date`)
VALUES
(1, 2, 1, NOW());

-- 插入学生数据
INSERT INTO `student` (`student_last_name`, `student_first_name`, `student_id`, `email`)
VALUES
('Doe', 'Alice', 'U00000001', 'alice.doe@example.com'),
('Smith', 'Bob', 'U00000002', 'bob.smith@example.com');

-- 插入课程注册数据
INSERT INTO `course_enrollment` (`course_id`, `student_id`, `student_last_name`, `student_first_name`, `enrollment_date`)
VALUES
(1, 'U00000001', 'Doe', 'Alice', NOW()),
(1, 'U00000002', 'Smith', 'Bob', NOW());

-- 插入签到记录数据
INSERT INTO `attendance` (`student_id`, `course_id`, `attendance_time`)
VALUES
('U00000001', 1, '2024-09-01 10:00:00'),
('U00000002', 1, '2024-09-01 10:00:00'),
('U00000001', 1, '2024-09-02 10:00:00'),
('U00000002', 1, '2024-09-02 10:00:00');