# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.36)
# Base de datos: sheduler
# Tiempo de Generación: 2017-06-21 06:21:11 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `created_at`, `updated_at`)
VALUES
	(2,0,2,'Admin','fa-tasks','',NULL,NULL),
	(3,2,3,'Users','fa-users','auth/users',NULL,NULL),
	(4,2,4,'Roles','fa-user','auth/roles',NULL,NULL),
	(5,2,5,'Permission','fa-user','auth/permissions',NULL,NULL),
	(6,2,6,'Menu','fa-bars','auth/menu',NULL,NULL),
	(7,2,7,'Operation log','fa-history','auth/logs',NULL,NULL),
	(8,0,8,'Helpers','fa-gears','',NULL,NULL),
	(9,8,9,'Scaffold','fa-keyboard-o','helpers/scaffold',NULL,NULL),
	(10,8,10,'Database terminal','fa-database','helpers/terminal/database',NULL,NULL),
	(11,8,11,'Laravel artisan','fa-terminal','helpers/terminal/artisan',NULL,NULL),
	(12,0,1,'Usuarios App','fa-users','admin-users','2017-06-20 01:17:13','2017-06-20 06:01:36');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin','GET','127.0.0.1','[]','2017-06-20 01:01:06','2017-06-20 01:01:06'),
	(2,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:23','2017-06-20 01:01:23'),
	(3,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:30','2017-06-20 01:01:30'),
	(4,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:31','2017-06-20 01:01:31'),
	(5,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:32','2017-06-20 01:01:32'),
	(6,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:33','2017-06-20 01:01:33'),
	(7,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:41','2017-06-20 01:01:41'),
	(8,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:42','2017-06-20 01:01:42'),
	(9,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:44','2017-06-20 01:01:44'),
	(10,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:46','2017-06-20 01:01:46'),
	(11,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:01:49','2017-06-20 01:01:49'),
	(12,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:04','2017-06-20 01:02:04'),
	(13,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:08','2017-06-20 01:02:08'),
	(14,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:09','2017-06-20 01:02:09'),
	(15,1,'admin/auth/permissions/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:17','2017-06-20 01:02:17'),
	(16,1,'admin/auth/permissions','POST','127.0.0.1','{\"slug\":null,\"name\":null,\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/permissions\"}','2017-06-20 01:02:21','2017-06-20 01:02:21'),
	(17,1,'admin/auth/permissions/create','GET','127.0.0.1','[]','2017-06-20 01:02:21','2017-06-20 01:02:21'),
	(18,1,'admin/auth/permissions/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:24','2017-06-20 01:02:24'),
	(19,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:30','2017-06-20 01:02:30'),
	(20,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:36','2017-06-20 01:02:36'),
	(21,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:42','2017-06-20 01:02:42'),
	(22,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:02:49','2017-06-20 01:02:49'),
	(23,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:03:07','2017-06-20 01:03:07'),
	(24,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:03:09','2017-06-20 01:03:09'),
	(25,1,'admin','GET','127.0.0.1','[]','2017-06-20 01:05:18','2017-06-20 01:05:18'),
	(26,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:05:23','2017-06-20 01:05:23'),
	(27,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:05:27','2017-06-20 01:05:27'),
	(28,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:05:29','2017-06-20 01:05:29'),
	(29,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:05:30','2017-06-20 01:05:30'),
	(30,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:05:31','2017-06-20 01:05:31'),
	(31,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:05:50','2017-06-20 01:05:50'),
	(32,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 01:05:58','2017-06-20 01:05:58'),
	(33,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:06:21','2017-06-20 01:06:21'),
	(34,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:06:59','2017-06-20 01:06:59'),
	(35,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:07:03','2017-06-20 01:07:03'),
	(36,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:07:07','2017-06-20 01:07:07'),
	(37,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 01:08:47','2017-06-20 01:08:47'),
	(38,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 01:09:11','2017-06-20 01:09:11'),
	(39,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 01:09:25','2017-06-20 01:09:25'),
	(40,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 01:09:38','2017-06-20 01:09:38'),
	(41,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 01:09:50','2017-06-20 01:09:50'),
	(42,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}','2017-06-20 01:09:52','2017-06-20 01:09:52'),
	(43,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}','2017-06-20 01:09:53','2017-06-20 01:09:53'),
	(44,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}','2017-06-20 01:09:53','2017-06-20 01:09:53'),
	(45,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}','2017-06-20 01:09:54','2017-06-20 01:09:54'),
	(46,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"id\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}','2017-06-20 01:09:54','2017-06-20 01:09:54'),
	(47,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"id\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}','2017-06-20 01:09:55','2017-06-20 01:09:55'),
	(48,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"desc\"},\"_pjax\":\"#pjax-container\"}','2017-06-20 01:09:56','2017-06-20 01:09:56'),
	(49,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"},\"_pjax\":\"#pjax-container\"}','2017-06-20 01:09:57','2017-06-20 01:09:57'),
	(50,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:10:19','2017-06-20 01:10:19'),
	(51,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:10:31','2017-06-20 01:10:31'),
	(52,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:10:42','2017-06-20 01:10:42'),
	(53,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:11:22','2017-06-20 01:11:22'),
	(54,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:11:55','2017-06-20 01:11:55'),
	(55,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:12:10','2017-06-20 01:12:10'),
	(56,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:13:22','2017-06-20 01:13:22'),
	(57,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:13:48','2017-06-20 01:13:48'),
	(58,1,'admin/users','GET','127.0.0.1','{\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 01:13:59','2017-06-20 01:13:59'),
	(59,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:14:05','2017-06-20 01:14:05'),
	(60,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:14:08','2017-06-20 01:14:08'),
	(61,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:16:00','2017-06-20 01:16:00'),
	(62,1,'admin/auth/menu/9/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:16:12','2017-06-20 01:16:12'),
	(63,1,'admin/auth/menu/9','PUT','127.0.0.1','{\"parent_id\":\"8\",\"title\":\"Scaffold\",\"icon\":\"fa-keyboard-o\",\"uri\":\"helpers\\/scaffold\",\"roles\":[null],\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2017-06-20 01:16:17','2017-06-20 01:16:17'),
	(64,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:16:17','2017-06-20 01:16:17'),
	(65,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Usuarios App\",\"icon\":\"fa-users\",\"uri\":\"admin\\/users\",\"roles\":[null],\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\"}','2017-06-20 01:17:13','2017-06-20 01:17:13'),
	(66,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:17:13','2017-06-20 01:17:13'),
	(67,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:17:18','2017-06-20 01:17:18'),
	(68,1,'admin/auth/users','GET','127.0.0.1','[]','2017-06-20 01:17:30','2017-06-20 01:17:30'),
	(69,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:17:36','2017-06-20 01:17:36'),
	(70,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:17:39','2017-06-20 01:17:39'),
	(71,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Usuarios App\",\"icon\":\"fa-users\",\"uri\":\"admin\\/auth\\/users\",\"roles\":[null],\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2017-06-20 01:17:44','2017-06-20 01:17:44'),
	(72,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:17:44','2017-06-20 01:17:44'),
	(73,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:18:09','2017-06-20 01:18:09'),
	(74,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:18:11','2017-06-20 01:18:11'),
	(75,1,'admin','GET','127.0.0.1','[]','2017-06-20 01:18:12','2017-06-20 01:18:12'),
	(76,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:18:14','2017-06-20 01:18:14'),
	(77,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:18:22','2017-06-20 01:18:22'),
	(78,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:18:31','2017-06-20 01:18:31'),
	(79,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Usuarios App\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2017-06-20 01:18:36','2017-06-20 01:18:36'),
	(80,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:18:36','2017-06-20 01:18:36'),
	(81,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:18:40','2017-06-20 01:18:40'),
	(82,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:18:44','2017-06-20 01:18:44'),
	(83,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 01:19:16','2017-06-20 01:19:16'),
	(84,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:19:22','2017-06-20 01:19:22'),
	(85,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:19:25','2017-06-20 01:19:25'),
	(86,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Usuarios App\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2017-06-20 01:19:29','2017-06-20 01:19:29'),
	(87,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:19:30','2017-06-20 01:19:30'),
	(88,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:19:33','2017-06-20 01:19:33'),
	(89,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:19:37','2017-06-20 01:19:37'),
	(90,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 01:19:40','2017-06-20 01:19:40'),
	(91,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 01:19:42','2017-06-20 01:19:42'),
	(92,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}','2017-06-20 01:19:47','2017-06-20 01:19:47'),
	(93,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"page\":\"2\"}','2017-06-20 01:19:52','2017-06-20 01:19:52'),
	(94,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"page\":\"1\"}','2017-06-20 01:19:53','2017-06-20 01:19:53'),
	(95,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"page\":\"1\",\"id\":null}','2017-06-20 01:19:56','2017-06-20 01:19:56'),
	(96,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"page\":\"1\",\"_export_\":\"1\"}','2017-06-20 01:19:59','2017-06-20 01:19:59'),
	(97,1,'admin/users','GET','127.0.0.1','{\"per_page\":\"10\",\"page\":\"1\",\"id\":null}','2017-06-20 01:24:29','2017-06-20 01:24:29'),
	(98,1,'admin/users','GET','127.0.0.1','{\"per_page\":\"10\",\"page\":\"1\",\"id\":null}','2017-06-20 01:31:16','2017-06-20 01:31:16'),
	(99,1,'admin/users','GET','127.0.0.1','{\"per_page\":\"10\",\"page\":\"1\",\"id\":null}','2017-06-20 01:31:19','2017-06-20 01:31:19'),
	(100,1,'admin/users','GET','127.0.0.1','{\"per_page\":\"10\",\"page\":\"1\",\"id\":null}','2017-06-20 01:31:30','2017-06-20 01:31:30'),
	(101,1,'admin/users','GET','127.0.0.1','{\"per_page\":\"10\",\"page\":\"1\",\"id\":null}','2017-06-20 02:26:48','2017-06-20 02:26:48'),
	(102,1,'admin/users','GET','127.0.0.1','{\"per_page\":\"10\",\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2017-06-20 02:26:53','2017-06-20 02:26:53'),
	(103,1,'admin/users','GET','127.0.0.1','{\"per_page\":\"10\",\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2017-06-20 02:26:54','2017-06-20 02:26:54'),
	(104,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:26:56','2017-06-20 02:26:56'),
	(105,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:27:22','2017-06-20 02:27:22'),
	(106,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:27:25','2017-06-20 02:27:25'),
	(107,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:27:29','2017-06-20 02:27:29'),
	(108,1,'admin/auth/setting','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:27:50','2017-06-20 02:27:50'),
	(109,1,'admin/auth/setting','GET','127.0.0.1','[]','2017-06-20 02:32:44','2017-06-20 02:32:44'),
	(110,1,'admin/auth/setting','GET','127.0.0.1','[]','2017-06-20 02:33:01','2017-06-20 02:33:01'),
	(111,1,'admin/auth/setting','PUT','127.0.0.1','{\"name\":\"Administrator\",\"password\":\"$2y$10$gkcaKfYmMHPhMBteIAFSFeNh50estDA\\/v3UFHTdbcX07vJq7FbDDi\",\"password_confirmation\":\"$2y$10$gkcaKfYmMHPhMBteIAFSFeNh50estDA\\/v3UFHTdbcX07vJq7FbDDi\",\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_method\":\"PUT\"}','2017-06-20 02:33:08','2017-06-20 02:33:08'),
	(112,1,'admin/auth/setting','GET','127.0.0.1','[]','2017-06-20 02:33:08','2017-06-20 02:33:08'),
	(113,1,'admin/auth/setting','GET','127.0.0.1','[]','2017-06-20 02:33:12','2017-06-20 02:33:12'),
	(114,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:35:05','2017-06-20 02:35:05'),
	(115,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:35:07','2017-06-20 02:35:07'),
	(116,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:35:20','2017-06-20 02:35:20'),
	(117,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:35:21','2017-06-20 02:35:21'),
	(118,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:35:32','2017-06-20 02:35:32'),
	(119,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:35:33','2017-06-20 02:35:33'),
	(120,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:35:37','2017-06-20 02:35:37'),
	(121,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:35:40','2017-06-20 02:35:40'),
	(122,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:36:00','2017-06-20 02:36:00'),
	(123,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:36:09','2017-06-20 02:36:09'),
	(124,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:36:12','2017-06-20 02:36:12'),
	(125,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:36:14','2017-06-20 02:36:14'),
	(126,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Usuarios App\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[\"1\",null],\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2017-06-20 02:36:24','2017-06-20 02:36:24'),
	(127,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 02:36:24','2017-06-20 02:36:24'),
	(128,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:36:29','2017-06-20 02:36:29'),
	(129,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:36:31','2017-06-20 02:36:31'),
	(130,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 02:36:33','2017-06-20 02:36:33'),
	(131,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:38:26','2017-06-20 02:38:26'),
	(132,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:53:14','2017-06-20 02:53:14'),
	(133,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:54:53','2017-06-20 02:54:53'),
	(134,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:55:26','2017-06-20 02:55:26'),
	(135,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:57:05','2017-06-20 02:57:05'),
	(136,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:57:39','2017-06-20 02:57:39'),
	(137,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:59:02','2017-06-20 02:59:02'),
	(138,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 02:59:26','2017-06-20 02:59:26'),
	(139,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:00:40','2017-06-20 03:00:40'),
	(140,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:00:59','2017-06-20 03:00:59'),
	(141,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:01:05','2017-06-20 03:01:05'),
	(142,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:01:08','2017-06-20 03:01:08'),
	(143,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:02:13','2017-06-20 03:02:13'),
	(144,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:02:30','2017-06-20 03:02:30'),
	(145,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:02:42','2017-06-20 03:02:42'),
	(146,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:03:13','2017-06-20 03:03:13'),
	(147,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:04:19','2017-06-20 03:04:19'),
	(148,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:04:40','2017-06-20 03:04:40'),
	(149,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:04:52','2017-06-20 03:04:52'),
	(150,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:05:10','2017-06-20 03:05:10'),
	(151,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:06:14','2017-06-20 03:06:14'),
	(152,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:06:21','2017-06-20 03:06:21'),
	(153,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:06:28','2017-06-20 03:06:28'),
	(154,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:06:34','2017-06-20 03:06:34'),
	(155,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:07:32','2017-06-20 03:07:32'),
	(156,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:08:52','2017-06-20 03:08:52'),
	(157,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:11:09','2017-06-20 03:11:09'),
	(158,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:12:07','2017-06-20 03:12:07'),
	(159,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:12:43','2017-06-20 03:12:43'),
	(160,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:13:12','2017-06-20 03:13:12'),
	(161,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:14:51','2017-06-20 03:14:51'),
	(162,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:16:22','2017-06-20 03:16:22'),
	(163,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:16:26','2017-06-20 03:16:26'),
	(164,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:16:28','2017-06-20 03:16:28'),
	(165,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:16:37','2017-06-20 03:16:37'),
	(166,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:16:38','2017-06-20 03:16:38'),
	(167,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:18:08','2017-06-20 03:18:08'),
	(168,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 03:18:57','2017-06-20 03:18:57'),
	(169,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:19:04','2017-06-20 03:19:04'),
	(170,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:19:06','2017-06-20 03:19:06'),
	(171,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:19:07','2017-06-20 03:19:07'),
	(172,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:19:08','2017-06-20 03:19:08'),
	(173,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:19:09','2017-06-20 03:19:09'),
	(174,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:19:11','2017-06-20 03:19:11'),
	(175,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:19:44','2017-06-20 03:19:44'),
	(176,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:20:00','2017-06-20 03:20:00'),
	(177,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:20:22','2017-06-20 03:20:22'),
	(178,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:24','2017-06-20 03:20:24'),
	(179,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:26','2017-06-20 03:20:26'),
	(180,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:28','2017-06-20 03:20:28'),
	(181,1,'admin/auth/users/1','PUT','127.0.0.1','{\"username\":\"admin\",\"name\":\"Administrator\",\"password\":\"$2y$10$gkcaKfYmMHPhMBteIAFSFeNh50estDA\\/v3UFHTdbcX07vJq7FbDDi\",\"password_confirmation\":\"$2y$10$gkcaKfYmMHPhMBteIAFSFeNh50estDA\\/v3UFHTdbcX07vJq7FbDDi\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/users\"}','2017-06-20 03:20:31','2017-06-20 03:20:31'),
	(182,1,'admin/auth/users','GET','127.0.0.1','[]','2017-06-20 03:20:31','2017-06-20 03:20:31'),
	(183,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:33','2017-06-20 03:20:33'),
	(184,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:34','2017-06-20 03:20:34'),
	(185,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:37','2017-06-20 03:20:37'),
	(186,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:38','2017-06-20 03:20:38'),
	(187,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:40','2017-06-20 03:20:40'),
	(188,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:42','2017-06-20 03:20:42'),
	(189,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:44','2017-06-20 03:20:44'),
	(190,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:57','2017-06-20 03:20:57'),
	(191,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:58','2017-06-20 03:20:58'),
	(192,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:20:59','2017-06-20 03:20:59'),
	(193,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:21:00','2017-06-20 03:21:00'),
	(194,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:22:48','2017-06-20 03:22:48'),
	(195,1,'admin/users','GET','127.0.0.1','[]','2017-06-20 03:25:28','2017-06-20 03:25:28'),
	(196,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:25:46','2017-06-20 03:25:46'),
	(197,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:25:48','2017-06-20 03:25:48'),
	(198,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:25:49','2017-06-20 03:25:49'),
	(199,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:25:50','2017-06-20 03:25:50'),
	(200,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:25:52','2017-06-20 03:25:52'),
	(201,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:26:13','2017-06-20 03:26:13'),
	(202,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:27:11','2017-06-20 03:27:11'),
	(203,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:28:34','2017-06-20 03:28:34'),
	(204,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:28:44','2017-06-20 03:28:44'),
	(205,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:28:53','2017-06-20 03:28:53'),
	(206,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:29:01','2017-06-20 03:29:01'),
	(207,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:29:10','2017-06-20 03:29:10'),
	(208,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:29:14','2017-06-20 03:29:14'),
	(209,1,'admin/auth/logs','GET','127.0.0.1','[]','2017-06-20 03:29:54','2017-06-20 03:29:54'),
	(210,1,'admin','GET','127.0.0.1','[]','2017-06-20 03:32:10','2017-06-20 03:32:10'),
	(211,1,'admin','GET','127.0.0.1','[]','2017-06-20 03:32:16','2017-06-20 03:32:16'),
	(212,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:32:23','2017-06-20 03:32:23'),
	(213,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:32:26','2017-06-20 03:32:26'),
	(214,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:32:27','2017-06-20 03:32:27'),
	(215,1,'admin/auth/roles','GET','127.0.0.1','[]','2017-06-20 03:33:10','2017-06-20 03:33:10'),
	(216,1,'admin/auth/roles','GET','127.0.0.1','[]','2017-06-20 03:33:27','2017-06-20 03:33:27'),
	(217,1,'admin/auth/roles','GET','127.0.0.1','[]','2017-06-20 03:33:58','2017-06-20 03:33:58'),
	(218,1,'admin/auth/setting','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:34:00','2017-06-20 03:34:00'),
	(219,1,'admin/auth/setting','GET','127.0.0.1','[]','2017-06-20 03:34:46','2017-06-20 03:34:46'),
	(220,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:34:49','2017-06-20 03:34:49'),
	(221,1,'admin/auth/roles','GET','127.0.0.1','[]','2017-06-20 03:35:38','2017-06-20 03:35:38'),
	(222,1,'admin/auth/roles','GET','127.0.0.1','[]','2017-06-20 03:35:48','2017-06-20 03:35:48'),
	(223,1,'admin/auth/roles/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:35:57','2017-06-20 03:35:57'),
	(224,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:05','2017-06-20 03:36:05'),
	(225,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:07','2017-06-20 03:36:07'),
	(226,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:08','2017-06-20 03:36:08'),
	(227,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:08','2017-06-20 03:36:08'),
	(228,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null}','2017-06-20 03:36:14','2017-06-20 03:36:14'),
	(229,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"id\":null}','2017-06-20 03:36:15','2017-06-20 03:36:15'),
	(230,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:22','2017-06-20 03:36:22'),
	(231,1,'admin/users','GET','127.0.0.1','{\"id\":null,\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:27','2017-06-20 03:36:27'),
	(232,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:32','2017-06-20 03:36:32'),
	(233,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:34','2017-06-20 03:36:34'),
	(234,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:35','2017-06-20 03:36:35'),
	(235,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:37','2017-06-20 03:36:37'),
	(236,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:36:45','2017-06-20 03:36:45'),
	(237,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:37:05','2017-06-20 03:37:05'),
	(238,1,'admin/auth/setting','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:37:14','2017-06-20 03:37:14'),
	(239,1,'admin/auth/logout','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:37:16','2017-06-20 03:37:16'),
	(240,1,'admin','GET','127.0.0.1','[]','2017-06-20 03:37:26','2017-06-20 03:37:26'),
	(241,1,'admin','GET','127.0.0.1','[]','2017-06-20 03:55:53','2017-06-20 03:55:53'),
	(242,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:56:13','2017-06-20 03:56:13'),
	(243,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:56:14','2017-06-20 03:56:14'),
	(244,1,'admin','GET','127.0.0.1','[]','2017-06-20 03:57:24','2017-06-20 03:57:24'),
	(245,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:57:27','2017-06-20 03:57:27'),
	(246,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:57:34','2017-06-20 03:57:34'),
	(247,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:57:37','2017-06-20 03:57:37'),
	(248,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Usuarios App\",\"icon\":\"fa-users\",\"uri\":\"users\",\"roles\":[null],\"_token\":\"NjImjIA1XqgNENCxZUELTfK5Macmfobohjx9MsmS\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2017-06-20 03:57:44','2017-06-20 03:57:44'),
	(249,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 03:57:45','2017-06-20 03:57:45'),
	(250,1,'admin','GET','127.0.0.1','[]','2017-06-20 03:58:47','2017-06-20 03:58:47'),
	(251,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:58:53','2017-06-20 03:58:53'),
	(252,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:58:54','2017-06-20 03:58:54'),
	(253,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:58:59','2017-06-20 03:58:59'),
	(254,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:59:01','2017-06-20 03:59:01'),
	(255,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 03:59:15','2017-06-20 03:59:15'),
	(256,1,'admin','GET','127.0.0.1','[]','2017-06-20 04:01:53','2017-06-20 04:01:53'),
	(257,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 04:01:59','2017-06-20 04:01:59'),
	(258,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 04:02:01','2017-06-20 04:02:01'),
	(259,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"Usuarios App\",\"icon\":\"fa-users\",\"uri\":\"admin-users\",\"roles\":[null],\"_token\":\"tf4Gl5NsU01MChmFKTceuZLR2bL54MXjUJRHIjhP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/auth\\/menu\"}','2017-06-20 04:02:10','2017-06-20 04:02:10'),
	(260,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 04:02:10','2017-06-20 04:02:10'),
	(261,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 04:02:19','2017-06-20 04:02:19'),
	(262,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 04:02:20','2017-06-20 04:02:20'),
	(263,1,'admin','GET','127.0.0.1','[]','2017-06-20 04:23:14','2017-06-20 04:23:14'),
	(264,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 04:23:16','2017-06-20 04:23:16'),
	(265,1,'admin/admin-users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 04:23:20','2017-06-20 04:23:20'),
	(266,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 04:23:23','2017-06-20 04:23:23'),
	(267,1,'admin/auth/logout','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 04:23:27','2017-06-20 04:23:27'),
	(268,1,'admin','GET','127.0.0.1','[]','2017-06-20 05:59:01','2017-06-20 05:59:01'),
	(269,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 05:59:03','2017-06-20 05:59:03'),
	(270,1,'admin/admin-users/12','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"riJtgRRvc37hF8L2pFb54cLzy8d6LSick3AVRo9O\"}','2017-06-20 05:59:10','2017-06-20 05:59:10'),
	(271,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 05:59:10','2017-06-20 05:59:10'),
	(272,1,'admin/admin-users','GET','127.0.0.1','[]','2017-06-20 05:59:17','2017-06-20 05:59:17'),
	(273,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 05:59:19','2017-06-20 05:59:19'),
	(274,1,'admin/admin-users','GET','127.0.0.1','[]','2017-06-20 06:00:01','2017-06-20 06:00:01'),
	(275,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:00:03','2017-06-20 06:00:03'),
	(276,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:00:06','2017-06-20 06:00:06'),
	(277,1,'admin','GET','127.0.0.1','[]','2017-06-20 06:00:20','2017-06-20 06:00:20'),
	(278,1,'admin','GET','127.0.0.1','[]','2017-06-20 06:01:02','2017-06-20 06:01:02'),
	(279,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:05','2017-06-20 06:01:05'),
	(280,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:06','2017-06-20 06:01:06'),
	(281,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:07','2017-06-20 06:01:07'),
	(282,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:07','2017-06-20 06:01:07'),
	(283,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:09','2017-06-20 06:01:09'),
	(284,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:10','2017-06-20 06:01:10'),
	(285,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:14','2017-06-20 06:01:14'),
	(286,1,'admin/auth/menu/1','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"riJtgRRvc37hF8L2pFb54cLzy8d6LSick3AVRo9O\"}','2017-06-20 06:01:18','2017-06-20 06:01:18'),
	(287,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:18','2017-06-20 06:01:18'),
	(288,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 06:01:21','2017-06-20 06:01:21'),
	(289,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 06:01:28','2017-06-20 06:01:28'),
	(290,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"riJtgRRvc37hF8L2pFb54cLzy8d6LSick3AVRo9O\",\"_order\":\"[{\\\"id\\\":12},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":8,\\\"children\\\":[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":11}]}]\"}','2017-06-20 06:01:36','2017-06-20 06:01:36'),
	(291,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:36','2017-06-20 06:01:36'),
	(292,1,'admin/auth/menu','GET','127.0.0.1','[]','2017-06-20 06:01:38','2017-06-20 06:01:38'),
	(293,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:40','2017-06-20 06:01:40'),
	(294,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:42','2017-06-20 06:01:42'),
	(295,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:43','2017-06-20 06:01:43'),
	(296,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:43','2017-06-20 06:01:43'),
	(297,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:44','2017-06-20 06:01:44'),
	(298,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:44','2017-06-20 06:01:44'),
	(299,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:46','2017-06-20 06:01:46'),
	(300,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:49','2017-06-20 06:01:49'),
	(301,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:50','2017-06-20 06:01:50'),
	(302,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 06:01:55','2017-06-20 06:01:55'),
	(303,1,'admin/helpers/terminal/database','POST','127.0.0.1','{\"c\":\"db:mysql\",\"q\":null,\"_token\":\"riJtgRRvc37hF8L2pFb54cLzy8d6LSick3AVRo9O\"}','2017-06-20 06:01:59','2017-06-20 06:01:59'),
	(304,1,'admin/helpers/terminal/database','POST','127.0.0.1','{\"c\":\"db:mysql\",\"q\":null,\"_token\":\"riJtgRRvc37hF8L2pFb54cLzy8d6LSick3AVRo9O\"}','2017-06-20 06:02:00','2017-06-20 06:02:00'),
	(305,1,'admin','GET','127.0.0.1','[]','2017-06-20 17:09:43','2017-06-20 17:09:43'),
	(306,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 17:09:47','2017-06-20 17:09:47'),
	(307,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"rut\",\"type\":\"desc\"}}','2017-06-20 17:09:53','2017-06-20 17:09:53'),
	(308,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_sort\":{\"column\":\"rut\",\"type\":\"asc\"}}','2017-06-20 17:09:53','2017-06-20 17:09:53'),
	(309,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 17:09:59','2017-06-20 17:09:59'),
	(310,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 17:10:00','2017-06-20 17:10:00'),
	(311,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 17:10:01','2017-06-20 17:10:01'),
	(312,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 17:10:01','2017-06-20 17:10:01'),
	(313,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 17:10:02','2017-06-20 17:10:02'),
	(314,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 17:10:03','2017-06-20 17:10:03'),
	(315,1,'admin','GET','127.0.0.1','[]','2017-06-20 23:52:27','2017-06-20 23:52:27'),
	(316,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:52:41','2017-06-20 23:52:41'),
	(317,1,'admin/admin-users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:52:53','2017-06-20 23:52:53'),
	(318,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:52:56','2017-06-20 23:52:56'),
	(319,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}','2017-06-20 23:53:00','2017-06-20 23:53:00'),
	(320,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}','2017-06-20 23:53:00','2017-06-20 23:53:00'),
	(321,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"_sort\":{\"column\":\"email\",\"type\":\"desc\"}}','2017-06-20 23:53:02','2017-06-20 23:53:02'),
	(322,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"_sort\":{\"column\":\"name\",\"type\":\"desc\"}}','2017-06-20 23:53:03','2017-06-20 23:53:03'),
	(323,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"_sort\":{\"column\":\"name\",\"type\":\"asc\"}}','2017-06-20 23:53:04','2017-06-20 23:53:04'),
	(324,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:53:08','2017-06-20 23:53:08'),
	(325,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:53:09','2017-06-20 23:53:09'),
	(326,1,'admin/helpers/scaffold','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:53:12','2017-06-20 23:53:12'),
	(327,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:53:16','2017-06-20 23:53:16'),
	(328,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:53:20','2017-06-20 23:53:20'),
	(329,1,'admin/auth/setting','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:53:26','2017-06-20 23:53:26'),
	(330,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:53:33','2017-06-20 23:53:33'),
	(331,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-20 23:53:36','2017-06-20 23:53:36'),
	(332,1,'admin','GET','127.0.0.1','[]','2017-06-21 00:16:52','2017-06-21 00:16:52'),
	(333,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 00:16:54','2017-06-21 00:16:54'),
	(334,1,'admin/admin-users/13','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"6e8tSbSTxoCO1wnJRQPBy8TjamWuVkeitGvTxpUG\"}','2017-06-21 00:16:58','2017-06-21 00:16:58'),
	(335,1,'admin/admin-users/13','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"6e8tSbSTxoCO1wnJRQPBy8TjamWuVkeitGvTxpUG\"}','2017-06-21 00:17:02','2017-06-21 00:17:02'),
	(336,1,'admin/admin-users/10','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"6e8tSbSTxoCO1wnJRQPBy8TjamWuVkeitGvTxpUG\"}','2017-06-21 00:17:07','2017-06-21 00:17:07'),
	(337,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 00:17:07','2017-06-21 00:17:07'),
	(338,1,'admin/admin-users/13','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"6e8tSbSTxoCO1wnJRQPBy8TjamWuVkeitGvTxpUG\"}','2017-06-21 00:17:12','2017-06-21 00:17:12'),
	(339,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 00:18:46','2017-06-21 00:18:46'),
	(340,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 00:18:53','2017-06-21 00:18:53'),
	(341,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 00:18:59','2017-06-21 00:18:59'),
	(342,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"page\":\"6\"}','2017-06-21 00:19:35','2017-06-21 00:19:35'),
	(343,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"page\":\"6\",\"id\":null,\"user_id\":null,\"method\":\"DELETE\",\"path\":null,\"ip\":null}','2017-06-21 00:19:51','2017-06-21 00:19:51'),
	(344,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"page\":\"1\",\"method\":\"DELETE\"}','2017-06-21 00:19:51','2017-06-21 00:19:51'),
	(345,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 00:20:04','2017-06-21 00:20:04'),
	(346,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 00:20:05','2017-06-21 00:20:05'),
	(347,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 00:20:12','2017-06-21 00:20:12'),
	(348,1,'admin','GET','127.0.0.1','[]','2017-06-21 05:55:39','2017-06-21 05:55:39'),
	(349,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 05:55:43','2017-06-21 05:55:43'),
	(350,1,'admin/admin-users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 05:55:45','2017-06-21 05:55:45'),
	(351,1,'admin/admin-users/1/edit','GET','127.0.0.1','[]','2017-06-21 05:58:33','2017-06-21 05:58:33'),
	(352,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 05:58:40','2017-06-21 05:58:40'),
	(353,1,'admin/admin-users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 05:58:43','2017-06-21 05:58:43'),
	(354,1,'admin/admin-users/1/edit','GET','127.0.0.1','[]','2017-06-21 05:59:46','2017-06-21 05:59:46'),
	(355,1,'admin/admin-users/1/edit','GET','127.0.0.1','[]','2017-06-21 06:00:02','2017-06-21 06:00:02'),
	(356,1,'admin/admin-users/1','PUT','127.0.0.1','{\"name\":\"Claudio Rojas\",\"email\":\"claudio@github.com\",\"_token\":\"bZ1g1FKDEYS2yMJA0i7AUBCSSOER1nf4srZIu4sY\",\"_method\":\"PUT\"}','2017-06-21 06:00:20','2017-06-21 06:00:20'),
	(357,1,'admin/admin-users','GET','127.0.0.1','[]','2017-06-21 06:00:20','2017-06-21 06:00:20'),
	(358,1,'admin/admin-users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:00:22','2017-06-21 06:00:22'),
	(359,1,'admin/admin-users/1','PUT','127.0.0.1','{\"name\":\"Claudio Rojas Rodriguez\",\"email\":\"claudio@github.com\",\"_token\":\"bZ1g1FKDEYS2yMJA0i7AUBCSSOER1nf4srZIu4sY\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/localhost:8000\\/admin\\/admin-users\"}','2017-06-21 06:00:35','2017-06-21 06:00:35'),
	(360,1,'admin/admin-users','GET','127.0.0.1','[]','2017-06-21 06:00:35','2017-06-21 06:00:35'),
	(361,1,'admin/admin-users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:00:37','2017-06-21 06:00:37'),
	(362,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:01:03','2017-06-21 06:01:03'),
	(363,1,'admin/admin-users','GET','127.0.0.1','[]','2017-06-21 06:01:20','2017-06-21 06:01:20'),
	(364,1,'admin/admin-users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:01:23','2017-06-21 06:01:23'),
	(365,1,'admin/admin-users/1/edit','GET','127.0.0.1','[]','2017-06-21 06:02:40','2017-06-21 06:02:40'),
	(366,1,'admin/admin-users/1','PUT','127.0.0.1','{\"rut\":\"16751256-9\",\"hh_value\":\"1250\",\"name\":\"Claudio Rojas Rodriguez\",\"email\":\"claudio@github.com\",\"_token\":\"bZ1g1FKDEYS2yMJA0i7AUBCSSOER1nf4srZIu4sY\",\"_method\":\"PUT\"}','2017-06-21 06:03:04','2017-06-21 06:03:04'),
	(367,1,'admin/admin-users','GET','127.0.0.1','[]','2017-06-21 06:03:04','2017-06-21 06:03:04'),
	(368,1,'admin/admin-users','GET','127.0.0.1','[]','2017-06-21 06:03:36','2017-06-21 06:03:36'),
	(369,1,'admin/admin-users','GET','127.0.0.1','[]','2017-06-21 06:04:57','2017-06-21 06:04:57'),
	(370,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:05:02','2017-06-21 06:05:02'),
	(371,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"30\"}','2017-06-21 06:05:17','2017-06-21 06:05:17'),
	(372,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\"}','2017-06-21 06:05:20','2017-06-21 06:05:20'),
	(373,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"per_page\":\"10\",\"page\":\"2\"}','2017-06-21 06:05:22','2017-06-21 06:05:22'),
	(374,1,'admin/admin-users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:18:35','2017-06-21 06:18:35'),
	(375,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:18:37','2017-06-21 06:18:37'),
	(376,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:18:37','2017-06-21 06:18:37'),
	(377,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:18:38','2017-06-21 06:18:38'),
	(378,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:18:39','2017-06-21 06:18:39'),
	(379,1,'admin/auth/logs','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:18:40','2017-06-21 06:18:40'),
	(380,1,'admin/helpers/terminal/database','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:19:02','2017-06-21 06:19:02'),
	(381,1,'admin/helpers/terminal/artisan','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2017-06-21 06:19:07','2017-06-21 06:19:07');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL),
	(1,8,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','administrator','2017-06-20 01:00:19','2017-06-20 01:00:19');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$gkcaKfYmMHPhMBteIAFSFeNh50estDA/v3UFHTdbcX07vJq7FbDDi','Administrator','image/logo.png','DI4rn2xvZ0OZGYw4SbPm6Tj3YTUTfkSRdxRPMSmolalgaqVMb0QgewoOKDaH','2017-06-20 01:00:19','2017-06-20 02:33:08');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla events
# ------------------------------------------------------------

DROP TABLE IF EXISTS `events`;

CREATE TABLE `events` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned DEFAULT NULL,
  `medspec_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `events_status_id_foreign` (`status_id`),
  KEY `events_user_id_foreign` (`user_id`),
  KEY `events_client_id_foreign` (`client_id`),
  KEY `events_medspec_id_foreign` (`medspec_id`),
  CONSTRAINT `events_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `users` (`id`),
  CONSTRAINT `events_medspec_id_foreign` FOREIGN KEY (`medspec_id`) REFERENCES `medicalspecialties` (`id`),
  CONSTRAINT `events_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `status` (`id`),
  CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;

INSERT INTO `events` (`id`, `status_id`, `user_id`, `client_id`, `medspec_id`, `title`, `description`, `is_active`, `start`, `end`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(9,1,3,NULL,5,'Nuevo Evento','...',1,'2017-06-22 08:15:00','2017-06-22 09:00:00','2017-06-20 04:46:53','2017-06-20 04:49:08',NULL),
	(10,1,3,NULL,5,'Nuevo Evento','...',1,'2017-06-22 09:00:00','2017-06-22 10:00:00','2017-06-20 04:46:55','2017-06-20 04:48:36',NULL),
	(11,1,3,NULL,5,'Nuevo Evento','...',1,'2017-06-22 10:00:00','2017-06-22 10:45:00','2017-06-20 04:48:24','2017-06-20 04:48:24',NULL),
	(12,1,3,NULL,5,'Nuevo Evento','...',1,'2017-06-22 10:45:00','2017-06-22 11:45:00','2017-06-20 04:48:25','2017-06-20 04:48:25',NULL),
	(13,3,3,4,4,'Nuevo Evento','ok hecho, otorrino',1,'2017-06-23 09:00:00','2017-06-23 09:15:00','2017-06-20 04:49:32','2017-06-21 04:21:34',NULL),
	(14,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-22 11:45:00','2017-06-22 10:45:00','2017-06-20 04:49:40','2017-06-20 04:49:40',NULL),
	(15,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-23 10:00:00','2017-06-23 10:15:00','2017-06-20 04:49:44','2017-06-21 04:22:05',NULL),
	(16,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-22 12:45:00','2017-06-22 11:45:00','2017-06-20 04:50:24','2017-06-20 04:50:24',NULL),
	(17,2,3,4,4,'Nuevo Evento','...',1,'2017-06-23 09:15:00','2017-06-23 09:30:00','2017-06-20 04:50:25','2017-06-21 04:21:37',NULL),
	(18,2,3,4,4,'Nuevo Evento','...',1,'2017-06-23 09:30:00','2017-06-23 09:45:00','2017-06-20 04:50:36','2017-06-21 04:21:41',NULL),
	(19,2,3,4,4,'Nuevo Evento','...',1,'2017-06-23 09:45:00','2017-06-23 10:00:00','2017-06-20 04:50:40','2017-06-21 04:21:44',NULL),
	(20,2,3,4,1,'Nuevo Evento','...',1,'2017-06-23 08:15:00','2017-06-23 08:30:00','2017-06-20 04:52:37','2017-06-21 04:19:36',NULL),
	(21,3,3,4,1,'Nuevo Evento','listo Pediatra',1,'2017-06-23 08:30:00','2017-06-23 08:45:00','2017-06-20 04:57:13','2017-06-21 04:19:39',NULL),
	(22,3,3,4,1,'Nuevo Evento','esta ok',1,'2017-06-24 08:30:00','2017-06-24 08:45:00','2017-06-20 04:57:16','2017-06-21 05:29:25',NULL),
	(23,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-24 08:45:00','2017-06-24 09:00:00','2017-06-20 04:57:17','2017-06-21 04:19:53',NULL),
	(24,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-24 10:15:00','2017-06-24 10:30:00','2017-06-20 04:57:18','2017-06-21 04:20:22',NULL),
	(25,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-24 10:30:00','2017-06-24 10:45:00','2017-06-20 04:57:22','2017-06-21 04:20:25',NULL),
	(26,2,3,4,1,'Nuevo Evento','...',1,'2017-06-23 08:45:00','2017-06-23 09:00:00','2017-06-20 04:57:29','2017-06-21 05:28:17',NULL),
	(27,2,3,4,1,'Nuevo Evento','...',1,'2017-06-24 09:00:00','2017-06-24 09:15:00','2017-06-20 05:39:45','2017-06-21 05:28:25',NULL),
	(28,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-24 09:15:00','2017-06-24 09:30:00','2017-06-20 05:39:46','2017-06-21 04:20:00',NULL),
	(29,2,3,4,1,'Nuevo Evento','...',1,'2017-06-24 09:30:00','2017-06-24 09:45:00','2017-06-20 05:39:47','2017-06-21 05:28:28',NULL),
	(30,2,3,4,1,'Nuevo Evento','...',1,'2017-06-24 09:45:00','2017-06-24 10:00:00','2017-06-20 05:39:48','2017-06-21 05:28:33',NULL),
	(31,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-24 10:00:00','2017-06-24 10:15:00','2017-06-20 05:39:49','2017-06-21 04:20:11',NULL),
	(32,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-20 05:56:46','2017-06-20 05:56:46','2017-06-20 05:45:14','2017-06-20 05:56:46',NULL),
	(33,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-24 11:00:00','2017-06-24 11:15:00','2017-06-20 05:58:30','2017-06-21 04:21:00',NULL),
	(34,1,3,NULL,5,'Nuevo Evento','...',1,'2017-06-23 12:30:00','2017-06-23 12:00:00','2017-06-20 17:10:40','2017-06-20 17:10:40',NULL),
	(35,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-21 08:30:00','2017-06-21 08:45:00','2017-06-20 23:48:23','2017-06-21 04:19:05',NULL),
	(36,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-21 08:45:00','2017-06-21 09:00:00','2017-06-20 23:55:08','2017-06-21 04:19:13',NULL),
	(37,1,13,NULL,5,'Nuevo Evento','...',1,'2017-06-21 09:00:00','2017-06-21 09:30:00','2017-06-21 00:06:03','2017-06-21 05:20:50','2017-06-21 05:20:50'),
	(38,1,13,NULL,5,'Nuevo Evento','...',1,'2017-06-21 00:06:40','2017-06-21 00:06:40','2017-06-21 00:06:08','2017-06-21 00:06:40',NULL),
	(39,1,13,NULL,5,'Nuevo Evento','...',1,'2017-06-23 11:45:00','2017-06-23 12:00:00','2017-06-21 00:06:50','2017-06-21 05:26:47',NULL),
	(40,3,13,4,5,'oftalmologia!!!','control ok',1,'2017-06-23 09:30:00','2017-06-23 08:15:00','2017-06-21 00:07:00','2017-06-21 04:42:29',NULL),
	(41,1,13,NULL,5,'Nuevo Evento','...',1,'2017-06-22 10:30:00','2017-06-22 11:00:00','2017-06-21 00:07:01','2017-06-21 05:24:12','2017-06-21 05:24:12'),
	(42,1,13,NULL,5,'Nuevo Evento','...',1,'2017-06-23 11:00:00','2017-06-23 11:15:00','2017-06-21 00:07:03','2017-06-21 05:24:20',NULL),
	(43,1,13,NULL,5,'Nuevo Evento','...',1,'2017-06-23 11:15:00','2017-06-23 11:30:00','2017-06-21 00:07:05','2017-06-21 05:24:23',NULL),
	(44,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-24 10:45:00','2017-06-24 11:00:00','2017-06-21 03:47:27','2017-06-21 04:20:53',NULL),
	(45,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-21 08:15:00','2017-06-21 08:30:00','2017-06-21 03:55:01','2017-06-21 04:19:03',NULL),
	(46,1,3,NULL,1,'Nuevo Evento','...',1,'2017-06-21 09:00:00','2017-06-21 09:15:00','2017-06-21 04:19:24','2017-06-21 04:19:28',NULL),
	(47,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-28 09:00:00','2017-06-28 09:15:00','2017-06-21 04:22:17','2017-06-21 04:22:17',NULL),
	(48,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-27 09:00:00','2017-06-27 09:15:00','2017-06-21 04:22:18','2017-06-21 04:22:19',NULL),
	(49,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-29 09:00:00','2017-06-29 09:15:00','2017-06-21 04:22:21','2017-06-21 04:22:21',NULL),
	(50,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-28 09:15:00','2017-06-28 09:30:00','2017-06-21 04:22:23','2017-06-21 04:22:23',NULL),
	(51,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-28 09:30:00','2017-06-28 09:45:00','2017-06-21 04:22:24','2017-06-21 04:22:24',NULL),
	(52,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-28 09:45:00','2017-06-28 10:00:00','2017-06-21 04:22:25','2017-06-21 04:22:25',NULL),
	(53,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-28 10:00:00','2017-06-28 10:15:00','2017-06-21 04:22:26','2017-06-21 04:22:26',NULL),
	(54,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-28 10:15:00','2017-06-28 10:30:00','2017-06-21 04:22:27','2017-06-21 04:22:27',NULL),
	(55,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-27 09:15:00','2017-06-27 09:30:00','2017-06-21 04:22:29','2017-06-21 04:22:29',NULL),
	(56,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-26 09:30:00','2017-06-26 09:45:00','2017-06-21 04:22:30','2017-06-21 04:22:30',NULL),
	(57,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-26 09:45:00','2017-06-26 10:00:00','2017-06-21 04:22:31','2017-06-21 04:22:31',NULL),
	(58,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-20 09:00:00','2017-06-20 09:15:00','2017-06-21 04:22:35','2017-06-21 04:22:35',NULL),
	(59,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-21 11:00:00','2017-06-21 11:15:00','2017-06-21 04:22:36','2017-06-21 04:22:36',NULL),
	(60,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-23 10:15:00','2017-06-23 10:30:00','2017-06-21 04:22:38','2017-06-21 04:22:41',NULL),
	(61,1,3,NULL,4,'Nuevo Evento','...',1,'2017-06-23 10:45:00','2017-06-23 11:00:00','2017-06-21 04:23:09','2017-06-21 04:23:24',NULL),
	(62,1,13,NULL,5,'Nuevo Evento','asi',1,'2017-06-22 09:00:00','2017-06-22 10:00:00','2017-06-21 04:33:46','2017-06-21 05:22:55','2017-06-21 05:22:55');

/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla medicalspecialties
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medicalspecialties`;

CREATE TABLE `medicalspecialties` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `medicalspecialties_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `medicalspecialties` WRITE;
/*!40000 ALTER TABLE `medicalspecialties` DISABLE KEYS */;

INSERT INTO `medicalspecialties` (`id`, `name`, `slug`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'Pediatra','pediatra',NULL,NULL,NULL),
	(2,'Cirujano','cirujano',NULL,NULL,NULL),
	(3,'Obstetra','obstetra',NULL,NULL,NULL),
	(4,'Otorrino','otorrino',NULL,NULL,NULL),
	(5,'Oftalmologo','oftamologo',NULL,NULL,NULL);

/*!40000 ALTER TABLE `medicalspecialties` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla medicalspecialty_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `medicalspecialty_user`;

CREATE TABLE `medicalspecialty_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `medicalspecialty_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medicalspecialty_user_user_id_foreign` (`user_id`),
  KEY `medicalspecialty_user_medicalspecialty_id_foreign` (`medicalspecialty_id`),
  CONSTRAINT `medicalspecialty_user_medicalspecialty_id_foreign` FOREIGN KEY (`medicalspecialty_id`) REFERENCES `medicalspecialties` (`id`),
  CONSTRAINT `medicalspecialty_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `medicalspecialty_user` WRITE;
/*!40000 ALTER TABLE `medicalspecialty_user` DISABLE KEYS */;

INSERT INTO `medicalspecialty_user` (`id`, `user_id`, `medicalspecialty_id`, `created_at`, `updated_at`)
VALUES
	(1,3,5,NULL,NULL),
	(2,3,4,NULL,NULL),
	(3,3,1,NULL,NULL),
	(6,13,2,NULL,NULL),
	(7,13,5,NULL,NULL);

/*!40000 ALTER TABLE `medicalspecialty_user` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_000001_create_status_table',1),
	(3,'2014_10_12_100000_create_password_resets_table',1),
	(4,'2016_09_04_000000_create_roles_table',1),
	(5,'2016_09_04_100000_create_role_user_table',1),
	(6,'2017_05_23_053330_create_medicalspecialties_table',1),
	(7,'2017_05_23_053340_create_medicalspecialty_user_table',1),
	(8,'2017_05_24_194800_create_events_table',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Volcado de tabla role_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `role_user_role_id_index` (`role_id`),
  KEY `role_user_user_id_index` (`user_id`),
  CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `role_user` WRITE;
/*!40000 ALTER TABLE `role_user` DISABLE KEYS */;

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(3,4,4,'2017-06-20 04:33:21','2017-06-20 04:33:21'),
	(4,4,5,'2017-06-20 04:33:21','2017-06-20 04:33:21'),
	(5,4,6,'2017-06-20 04:33:21','2017-06-20 04:33:21'),
	(6,4,7,'2017-06-20 04:33:21','2017-06-20 04:33:21'),
	(7,4,8,'2017-06-20 04:33:21','2017-06-20 04:33:21'),
	(8,4,9,'2017-06-20 04:33:21','2017-06-20 04:33:21'),
	(10,4,11,'2017-06-20 04:33:21','2017-06-20 04:33:21'),
	(13,5,3,'2017-06-20 04:35:28','2017-06-20 04:35:28'),
	(14,5,13,'2017-06-21 00:04:34','2017-06-21 00:04:34'),
	(15,4,2,'2017-06-21 05:27:16','2017-06-21 05:27:16');

/*!40000 ALTER TABLE `role_user` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'default',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;

INSERT INTO `roles` (`id`, `name`, `slug`, `description`, `group`, `created_at`, `updated_at`)
VALUES
	(1,'Administrador','admin','tiene acceso a todas las opciones.','business','2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(2,'Reservación','reservation','sólo puede tomar reservas y actualizar datos de clientes.','business','2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(3,'Recepción','reception','sólo puede tomar reservas y actualizar datos de clientes, pero además puede anular reservas, bloquear algunas horas de atención, etc.','business','2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(4,'Cliente','client','puede solicitar horas','public','2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(5,'Medico','medic','se asignar hora, sol puede ver sus hora asignadas','public','2017-06-20 04:33:20','2017-06-20 04:33:20');

/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla status
# ------------------------------------------------------------

DROP TABLE IF EXISTS `status`;

CREATE TABLE `status` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;

INSERT INTO `status` (`id`, `code`, `name`, `created_at`, `updated_at`)
VALUES
	(1,'client','Cliente',NULL,NULL),
	(2,'medic','Medico',NULL,NULL),
	(3,'admin','Administrador',NULL,NULL);

/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rut` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hh_value` int(10) unsigned NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_rut_unique` (`rut`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `rut`, `hh_value`, `email`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'Claudio Rojas Rodriguez','16751256-9',1250,'claudio@github.com','$2y$10$UcCwQFwltbY7mODe92cSe.KkiXzni805CPkHhavYM8EvqL5CHbZv.','XlIuVxbR4pWxF2Pexu8ACxYCrdoql0hC3AeURZRY3N8uiYEx1IDIYGcoSecn','2017-06-20 04:33:20','2017-06-21 06:03:04'),
	(2,'Juan','116354756-1',20000,'john@github.com','$2y$10$OGO7w1gNZ7YckbvzdjvcE.2Ch.7gCZIik/6ew2pPgDWMOylfdHsuO',NULL,'2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(3,'Alicia','9442167-5',1233,'alicia@business.com','$2y$10$AYSL7p3u4tBW7BzlhnYqbOPENcfz1XUKQIHFE9x.OUBl8fwmlqrOq','D4U6QZaixMyCVnr3D8mBd05YhSP9snzHWqFk1Cu8PKQToccyKtYnrRvFFoj6','2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(4,'Sofia','11111111-1',1233,'sofi@gmail.com','$2y$10$t4DPzlKsqxc.l2ih7iE1WeFysv1snKnB9LOtRlhc.R1adcnxzMRsS','9f3hr5s5JeMPQrWWpUViNoR1sz49lgVvKo09VlzlZzhHalj8zIHvHDAzrDgw','2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(5,'Pedro','12345678-9',1233,'pedro@gmail.com','$2y$10$xXOSmZF0XGj29xPvRrn13O7GDnq0raT4LZ05NSSVEW11OGAeDjfp2',NULL,'2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(6,'Pablo Jara','98765432-5',24000,'p.jara@gmail.com','$2y$10$ZBq8/M07R8FdKKg4e7NaeeJFIXXx/Zg2EcMh.HXMAUT4MVN3ClfkC',NULL,'2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(7,'Alejandro','14566421-7',24000,'alejo@gmail.com','$2y$10$aYpP4bE2WGnc/jS1OcPG7OrPGFAZa9RFhBqsoyyU07Fg10np6Oop6',NULL,'2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(8,'Jorge','98765422-5',24000,'jru@gmail.com','$2y$10$049E4alv3bb0BbbNZM7/EeJoutaaNBuFgXlq0pcZ3fX0bKGCpctzG',NULL,'2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(9,'Maria','97765432-5',24000,'m.riquelme@gmail.com','$2y$10$et32YtzrZ.1BfJrYMwPlN.mxw1YA2ujbl0FrrmuGbkIqUTk/buDiG',NULL,'2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(11,'Veronica Arancibia','95765432-5',24000,'vero@gmail.com','$2y$10$4tUJftQvhBYitCgCgfbQr.RgrJk.LHm.7H7dw5/2K4x2LQZQFbGbe',NULL,'2017-06-20 04:33:20','2017-06-20 04:33:20'),
	(13,'Pepe','11022809-9',35000,'pepe@pepe.cl','$2y$10$PmzeTco8ewhtPtJZ.KtPtOob8af1YyUgYLsvLGvKDUb0o4gq/lkHq','WE4L2WyXrjJ1x6RAZJfaVfcQkKYc8PVvvUGKN75oczxwEV1dyBYhQxYMKD1o','2017-06-21 00:04:34','2017-06-21 00:04:34');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
