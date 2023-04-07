-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- 主机： localhost
-- 生成日期： 2023-04-07 14:01:12
-- 服务器版本： 5.7.26
-- PHP 版本： 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `db_sdms`
--

-- --------------------------------------------------------

--
-- 表的结构 `t_category`
--

CREATE TABLE `t_category` (
  `id` bigint(20) NOT NULL COMMENT '寝室类型的主键',
  `max_size` bigint(20) NOT NULL COMMENT '寝室可容纳学生人数的最大值',
  `name` varchar(255) NOT NULL COMMENT '寝室类型的名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `t_category`
--

INSERT INTO `t_category` (`id`, `max_size`, `name`) VALUES
(13, 4, '四人寝'),
(14, 6, '六人寝'),
(15, 10, '八人寝');

-- --------------------------------------------------------

--
-- 表的结构 `t_class`
--

CREATE TABLE `t_class` (
  `id` bigint(20) NOT NULL COMMENT '教学班级的主键',
  `name` varchar(255) NOT NULL COMMENT '教学班级的名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `t_class`
--

INSERT INTO `t_class` (`id`, `name`) VALUES
(1, '软件工程2004'),
(2, '软件工程2004'),
(3, '软件工程2004'),
(4, '软件工程2004'),
(5, '软件工程2004');

-- --------------------------------------------------------

--
-- 表的结构 `t_permission`
--

CREATE TABLE `t_permission` (
  `id` bigint(20) NOT NULL COMMENT '权限的主键',
  `code` varchar(255) NOT NULL COMMENT '权限码',
  `description` varchar(255) NOT NULL COMMENT '权限的描述',
  `name` varchar(255) NOT NULL COMMENT '权限的名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `t_role`
--

CREATE TABLE `t_role` (
  `id` bigint(20) NOT NULL COMMENT '角色的主键',
  `name` varchar(255) NOT NULL COMMENT '角色的名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `t_role`
--

INSERT INTO `t_role` (`id`, `name`) VALUES
(1, '学生'),
(2, '管理员');

-- --------------------------------------------------------

--
-- 表的结构 `t_role_permission`
--

CREATE TABLE `t_role_permission` (
  `role_id` bigint(20) NOT NULL COMMENT '角色的主键',
  `permission_id` bigint(20) NOT NULL COMMENT '权限的主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- 表的结构 `t_room`
--

CREATE TABLE `t_room` (
  `id` bigint(20) NOT NULL COMMENT '寝室的主键',
  `address` varchar(255) NOT NULL COMMENT '寝室的地址',
  `name` varchar(255) NOT NULL COMMENT '寝室的名称',
  `picture` varchar(255) NOT NULL COMMENT '寝室的照片',
  `category_id` bigint(20) DEFAULT NULL COMMENT '寝室类型的主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `t_room`
--

INSERT INTO `t_room` (`id`, `address`, `name`, `picture`, `category_id`) VALUES
(1, '北校区14号楼', '310', '/sdms-images/room-1.jpg', 13),
(2, '北校区14号楼', '312', '/sdms-images/room-2.jpg', 13),
(3, '北校区14号楼', '313', '', 13);

-- --------------------------------------------------------

--
-- 表的结构 `t_room_request`
--

CREATE TABLE `t_room_request` (
  `id` bigint(20) NOT NULL COMMENT '住宿申请的主键',
  `status` varchar(255) NOT NULL DEFAULT 'NO_HANDLE' COMMENT '住宿申请的状态',
  `room_id` bigint(20) DEFAULT NULL COMMENT '寝室的主键',
  `student_id` varchar(255) DEFAULT NULL COMMENT '学号,即学生的主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `t_room_request`
--

INSERT INTO `t_room_request` (`id`, `status`, `room_id`, `student_id`) VALUES
(6, 'SUCCESS', 1, '01217'),
(7, 'FAILURE', 2, '01218'),
(8, 'SUCCESS', 3, '01218'),
(9, 'SUCCESS', 1, '01219'),
(10, 'FAILURE', 2, '01219'),
(11, 'NO_HANDLE', 2, '09999');

-- --------------------------------------------------------

--
-- 表的结构 `t_student`
--

CREATE TABLE `t_student` (
  `id` varchar(255) NOT NULL COMMENT '学号,即学生的主键',
  `name` varchar(255) NOT NULL COMMENT '学生的姓名',
  `room_id` bigint(20) DEFAULT NULL COMMENT '寝室的主键',
  `teaching_class_id` bigint(20) DEFAULT NULL COMMENT '教学班级的主键',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户的主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `t_student`
--

INSERT INTO `t_student` (`id`, `name`, `room_id`, `teaching_class_id`, `user_id`) VALUES
('01217', '张三', 1, 1, 9),
('01218', '李四', 3, 1, 10),
('01219', '王五', NULL, 2, 11),
('09999', '小黑', NULL, 2, 12);

-- --------------------------------------------------------

--
-- 表的结构 `t_user`
--

CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL COMMENT '用户的主键',
  `address` varchar(255) DEFAULT NULL COMMENT '用户的地址',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户的头像,数据库中仅存储文件路径',
  `gender` varchar(255) DEFAULT 'MALE' COMMENT '用户的性别',
  `password` varchar(255) NOT NULL COMMENT '数据库中存储的密码',
  `phone` varchar(255) DEFAULT NULL COMMENT '用户的联系方式',
  `username` varchar(255) NOT NULL COMMENT '用于登录的账号',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色的主键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- 转存表中的数据 `t_user`
--

INSERT INTO `t_user` (`id`, `address`, `avatar`, `gender`, `password`, `phone`, `username`, `role_id`) VALUES
(1, '河南省郑州市', '/sdms-images/avatar-3.jpg', 'MALE', '0192023a7bbd73250516f069df18b500', '15566667777', 'admin', 2),
(9, '河南省郑州市', '/sdms-images/avatar-2.jpg', 'MALE', 'b5b6e0fc8e3ae07753dbf8793275881e', '15512341234', '01217', 1),
(10, '河南省郑州市', '/sdms-images/avatar-3.jpg', 'FEMALE', '783011afda4fee11b6ee2cff303da8cb', '18812341234', '01218', 1),
(11, '河南省郑州市', '/sdms-images/avatar-4.jpg', 'FEMALE', 'eaa6a59c9212e6c319c6701991a38509', '17712341234', '01219', 1),
(12, NULL, NULL, NULL, '0908fba1949e44d7584101b868d8474c', NULL, '09999', 1);

--
-- 转储表的索引
--

--
-- 表的索引 `t_category`
--
ALTER TABLE `t_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `t_class`
--
ALTER TABLE `t_class`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `t_permission`
--
ALTER TABLE `t_permission`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- 表的索引 `t_role`
--
ALTER TABLE `t_role`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `UK_bkpm7njy2ort1yoiddc7jg8gj` (`name`) USING BTREE;

--
-- 表的索引 `t_role_permission`
--
ALTER TABLE `t_role_permission`
  ADD PRIMARY KEY (`role_id`,`permission_id`) USING BTREE,
  ADD KEY `FKjobmrl6dorhlfite4u34hciik` (`permission_id`) USING BTREE;

--
-- 表的索引 `t_room`
--
ALTER TABLE `t_room`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FKtr387rfoo7r0y0aymvnqb9gso` (`category_id`) USING BTREE;

--
-- 表的索引 `t_room_request`
--
ALTER TABLE `t_room_request`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FKj02ld97dsteo49cacmpe23tb7` (`room_id`) USING BTREE,
  ADD KEY `FKhi32lfryi65nboj3uk1nlseec` (`student_id`) USING BTREE;

--
-- 表的索引 `t_student`
--
ALTER TABLE `t_student`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `FKeq2uq5830o85jo7xg036j471c` (`room_id`) USING BTREE,
  ADD KEY `FKt7sym0pjqh22ky0n4jsduj90u` (`teaching_class_id`) USING BTREE,
  ADD KEY `FKpyiblhnxi2vmb6bgpdwqqombu` (`user_id`) USING BTREE;

--
-- 表的索引 `t_user`
--
ALTER TABLE `t_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `UK_jhib4legehrm4yscx9t3lirqi` (`username`) USING BTREE,
  ADD KEY `FK76cs7cu4h4y8vc1vd4qyw36rt` (`role_id`) USING BTREE;

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `t_category`
--
ALTER TABLE `t_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '寝室类型的主键', AUTO_INCREMENT=16;

--
-- 使用表AUTO_INCREMENT `t_class`
--
ALTER TABLE `t_class`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '教学班级的主键', AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `t_permission`
--
ALTER TABLE `t_permission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限的主键';

--
-- 使用表AUTO_INCREMENT `t_role`
--
ALTER TABLE `t_role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色的主键', AUTO_INCREMENT=3;

--
-- 使用表AUTO_INCREMENT `t_room`
--
ALTER TABLE `t_room`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '寝室的主键', AUTO_INCREMENT=4;

--
-- 使用表AUTO_INCREMENT `t_room_request`
--
ALTER TABLE `t_room_request`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '住宿申请的主键', AUTO_INCREMENT=12;

--
-- 使用表AUTO_INCREMENT `t_user`
--
ALTER TABLE `t_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户的主键', AUTO_INCREMENT=13;

--
-- 限制导出的表
--

--
-- 限制表 `t_role_permission`
--
ALTER TABLE `t_role_permission`
  ADD CONSTRAINT `FK90j038mnbnthgkc17mqnoilu9` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  ADD CONSTRAINT `FKjobmrl6dorhlfite4u34hciik` FOREIGN KEY (`permission_id`) REFERENCES `t_permission` (`id`);

--
-- 限制表 `t_room`
--
ALTER TABLE `t_room`
  ADD CONSTRAINT `FKtr387rfoo7r0y0aymvnqb9gso` FOREIGN KEY (`category_id`) REFERENCES `t_category` (`id`);

--
-- 限制表 `t_room_request`
--
ALTER TABLE `t_room_request`
  ADD CONSTRAINT `FKhi32lfryi65nboj3uk1nlseec` FOREIGN KEY (`student_id`) REFERENCES `t_student` (`id`),
  ADD CONSTRAINT `FKj02ld97dsteo49cacmpe23tb7` FOREIGN KEY (`room_id`) REFERENCES `t_room` (`id`);

--
-- 限制表 `t_student`
--
ALTER TABLE `t_student`
  ADD CONSTRAINT `FKeq2uq5830o85jo7xg036j471c` FOREIGN KEY (`room_id`) REFERENCES `t_room` (`id`),
  ADD CONSTRAINT `FKpyiblhnxi2vmb6bgpdwqqombu` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`),
  ADD CONSTRAINT `FKt7sym0pjqh22ky0n4jsduj90u` FOREIGN KEY (`teaching_class_id`) REFERENCES `t_class` (`id`);

--
-- 限制表 `t_user`
--
ALTER TABLE `t_user`
  ADD CONSTRAINT `FK76cs7cu4h4y8vc1vd4qyw36rt` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
