-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2013 年 05 月 14 日 09:23
-- 服务器版本: 5.5.27
-- PHP 版本: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `test`
--

DELIMITER $$
--
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `test_multi_sets`()
    DETERMINISTIC
begin
        select user() as first_col;
        select user() as first_col, now() as second_col;
        select user() as first_col, now() as second_col, now() as third_col;
        end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `current_user`
--

CREATE TABLE IF NOT EXISTS `current_user` (
  `stu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `current_user`
--

INSERT INTO `current_user` (`stu_id`) VALUES
(20112291);

-- --------------------------------------------------------

--
-- 表的结构 `optional_courses`
--

CREATE TABLE IF NOT EXISTS `optional_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course` text NOT NULL,
  `teacher` text NOT NULL,
  `classroom` text NOT NULL,
  `time` text NOT NULL,
  `day` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `optional_courses`
--

INSERT INTO `optional_courses` (`id`, `course`, `teacher`, `classroom`, `time`, `day`) VALUES
(1, 'art', 'li', '1#', '9-10', 'Tuesday'),
(2, 'swimming', 'li', 'pool', '1-2', 'Sunday'),
(3, 'handwrting', 'zhu', '1#', '1-2', 'Saturday'),
(4, 'dance', 'zhao', 'gym', '3-4', 'Friday');

-- --------------------------------------------------------

--
-- 表的结构 `required_courses`
--

CREATE TABLE IF NOT EXISTS `required_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) NOT NULL,
  `course` text NOT NULL,
  `teacher` text NOT NULL,
  `classroom` text NOT NULL,
  `time` text NOT NULL,
  `day` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `required_courses`
--

INSERT INTO `required_courses` (`id`, `stu_id`, `course`, `teacher`, `classroom`, `time`, `day`) VALUES
(1, 0, 'Practice Course', 'Liu', '1# 109', '9-10', 'Monday'),
(2, 0, 'English', 'Gong', '1# 113', '7-8', 'Monday'),
(3, 0, 'Math', 'zhang', '1#201', '1-2', 'Wednesday');

-- --------------------------------------------------------

--
-- 表的结构 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `password` text NOT NULL,
  `name` text NOT NULL,
  `major` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `users`
--

INSERT INTO `users` (`id`, `student_id`, `password`, `name`, `major`) VALUES
(1, 20112291, '123', 'sqrl', 'software'),
(2, 20112264, '1234', 'wang', 'software'),
(3, 20112222, '1', 'w', '1'),
(4, 20112322, 'slx', 'slx', 'software'),
(8, 1, '1', '1', '1'),
(9, 1, '1', '1', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
