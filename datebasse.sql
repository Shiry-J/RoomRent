/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.25 : Database - roomrentmanage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`roomrentmanage` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `roomrentmanage`;

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `room_id` bigint NOT NULL COMMENT '房屋ID',
  `question_id` bigint NOT NULL COMMENT '问题ID',
  `answer_id` bigint DEFAULT NULL COMMENT '回答者ID',
  `answer_content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '回答内容',
  `answer_time` datetime DEFAULT NULL COMMENT '回答时间',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;

/*Data for the table `answer` */

insert  into `answer`(`id`,`room_id`,`question_id`,`answer_id`,`answer_content`,`answer_time`,`gmt_create`,`gmt_modified`) values 
(2,1,1,5,'基础设施不太好','2021-10-05 14:35:45','2021-10-05 14:35:47','2021-10-05 14:35:49'),
(3,1,2,6,'不方便','2021-10-05 14:36:08','2021-10-05 14:36:09','2021-10-05 14:36:11'),
(4,1,2,7,'还行','2021-10-05 14:36:20','2021-10-05 14:36:25','2021-10-05 14:36:27'),
(7,5,12,6,'好很不错的','2021-10-06 11:16:12','2021-10-06 11:16:12','2021-10-06 11:16:12'),
(8,1,1,4,'房主快快更新','2021-11-06 10:02:15','2021-11-06 10:02:15','2021-11-06 10:02:15'),
(9,1,1,4,'房主快快更新','2021-11-06 10:02:22','2021-11-06 10:02:22','2021-11-06 10:02:22'),
(10,1,3,4,'房主快快更新','2021-11-06 10:02:29','2021-11-06 10:02:29','2021-11-06 10:02:29'),
(11,1,1,2,'11111','2021-11-06 10:05:47','2021-11-06 10:05:47','2021-11-06 10:05:47'),
(13,1,3,7,'方便啊','2022-04-24 17:38:38','2022-04-24 17:38:38','2022-04-24 17:38:38'),
(14,1,1,7,'123123','2022-04-25 05:31:44','2022-04-25 05:31:44','2022-04-25 05:31:44');

/*Table structure for table `dialogue` */

DROP TABLE IF EXISTS `dialogue`;

CREATE TABLE `dialogue` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `room_id` bigint NOT NULL COMMENT '房屋ID',
  `question_id` bigint NOT NULL COMMENT '提问者ID',
  `question_content` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '提问内容',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3;

/*Data for the table `dialogue` */

insert  into `dialogue`(`id`,`room_id`,`question_id`,`question_content`,`gmt_create`,`gmt_modified`) values 
(1,1,1,'该位置附近有什么基础设施？','2021-09-16 14:13:32','2021-09-16 14:13:34'),
(2,1,2,'附近交通方不方便？','2021-10-05 14:32:04','2021-10-05 14:32:06'),
(3,1,3,'老人小孩上楼方便吗？','2021-10-05 14:32:31','2021-10-05 14:32:32'),
(10,1,4,'可不可以再便宜点','2021-10-05 07:44:02','2021-10-05 07:44:02'),
(12,5,6,'附近基础设施怎么样？','2021-10-06 11:15:57','2021-10-06 11:15:57'),
(14,1,4,'该位置附近还嗨嗨有什么基础设施？','2021-11-06 10:01:59','2021-11-06 10:01:59'),
(15,1,4,'该位置附近还嗨嗨有什么基础设施？','2021-11-06 10:02:02','2021-11-06 10:02:02'),
(16,1,7,'阿松大阿松大','2022-04-20 07:07:31','2022-04-20 07:07:31'),
(17,1,7,'123123123','2022-04-25 05:32:07','2022-04-25 05:32:07');

/*Table structure for table `forrent` */

DROP TABLE IF EXISTS `forrent`;

CREATE TABLE `forrent` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '发布者ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '描述',
  `price` decimal(10,0) NOT NULL COMMENT '意向金',
  `address` varchar(50) NOT NULL COMMENT '位置',
  `contacts` varchar(15) NOT NULL COMMENT '联系人',
  `phone` varchar(15) NOT NULL COMMENT '联系电话',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `forrent` */

/*Table structure for table `report` */

DROP TABLE IF EXISTS `report`;

CREATE TABLE `report` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '举报者ID',
  `room_id` bigint NOT NULL COMMENT '举报房屋ID',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '举报信息',
  `is_successful` tinyint DEFAULT NULL COMMENT '举报是/否成功',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

/*Data for the table `report` */

/*Table structure for table `roominfo` */

DROP TABLE IF EXISTS `roominfo`;

CREATE TABLE `roominfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `rent_id` bigint NOT NULL COMMENT '出租人ID',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '标题',
  `rent_type` tinyint NOT NULL COMMENT '出租类型',
  `house_type` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '户型',
  `orientation` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '朝向',
  `area` smallint NOT NULL COMMENT '面积',
  `region` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '地区',
  `community` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '小区名',
  `floor` tinyint NOT NULL COMMENT '楼层',
  `price` decimal(10,0) NOT NULL COMMENT '租金',
  `content` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '描述',
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '图片',
  `contacts` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '联系人',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '联系电话',
  `is_on` tinyint NOT NULL COMMENT '是/否上架',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb3;

/*Data for the table `roominfo` */

insert  into `roominfo`(`id`,`rent_id`,`title`,`rent_type`,`house_type`,`orientation`,`area`,`region`,`community`,`floor`,`price`,`content`,`image`,`contacts`,`phone`,`is_on`,`gmt_create`,`gmt_modified`) values 
(1,3,'四面环山私人别墅',1,'8室4厅3卫','东南',500,'苏州吴江','长安华府',1,5000,'欢迎入住','123.png','张三','12312312312',1,'2021-09-16 14:18:20','2021-09-16 14:18:22'),
(5,4,'海景房无敌啊',1,'7室3厅1卫','东南',200,'江苏省南京市江宁区','无敌小区',7,123123,'位置好环境好基础设施齐全','55d0de84-f48f-4d04-a9f9-da14feade0031.jpeg','神仙水','12312312312',1,'2021-10-06 11:09:08','2021-10-06 11:09:08'),
(6,4,'别致小屋手慢无',0,'7室3厅1卫','东',200,'江苏省苏州市吴江区','无名小区',3,1200,'位置好环境好基础设施齐全','3f2481e1-c51c-4b45-b7cc-c0df92cc452b9.jpeg','神仙水','12312312312',1,'2021-10-06 11:10:21','2021-10-06 11:10:37'),
(7,4,'靠地铁小学便宜出售',1,'7室3厅1卫','西南',200,'江苏省苏州市吴中区','无名小区',7,123123,'位置好环境好基础设施齐全','2c6b7da9-c47e-496c-9c22-3d30296349a04.jpeg','神仙水','12312312312',1,'2021-10-06 11:11:32','2021-10-06 11:11:32'),
(8,4,'超级豪华设施',0,'7室3厅1卫','北',200,'江苏省苏州市吴中区','无名小区',3,1230,'位置好环境好基础设施齐全','f0cfe196-1710-4dbb-b656-95f1f15803186.jpeg','神仙水','12345678978',1,'2021-10-06 11:12:39','2021-10-06 11:12:39'),
(9,4,'123123',0,'7室3厅1卫','东',200,'江苏省南京市建邺区','无敌小区',7,123123,'位置好环境好基础设施齐全','63f7e20e-11a7-41ec-96ec-4d9e9135b1267.jpeg','神仙水','12312312312',1,'2021-10-06 11:13:32','2021-10-06 11:13:41'),
(10,6,'豪华别墅领包入住附近基础设施完善',0,'5室3厅1卫','东北',120,'江苏省南京市江宁区','超级小区',10,1300,'位置好环境好基础设施齐全','0162717d-f747-45d0-81aa-2a44d62001c81.jpeg','神仙水','12312312312',1,'2021-10-06 11:17:28','2021-10-06 11:18:21'),
(12,4,'海景房无敌啊',0,'7室3厅1卫','东',200,'江苏省南京市江宁区','无敌小区',7,123123,'位置好环境好基础设施齐全','95324742-919a-42b4-9297-ac0f74421a82123.png','神仙水','12312312312',0,'2021-11-04 11:41:41','2021-11-04 11:41:41'),
(13,4,'海景房无敌啊',0,'7室3厅1卫','东',200,'江苏省南京市江宁区','无敌小区',7,123123,'位置好环境好基础设施齐全','7ef54c09-f4ef-495e-847b-62f51d149c18123.png','神仙水','12312312312',1,'2021-11-04 11:41:55','2021-11-04 11:41:55'),
(14,4,'海景房无敌啊',0,'7室3厅1卫','东',200,'江苏省南京市江宁区','无敌小区',7,123123,'位置好环境好基础设施齐全','82a6d092-bc1f-4572-97cc-9a7bdea2b118123.png','神仙水','12312312312',1,'2021-11-04 11:42:09','2021-11-04 11:42:09'),
(15,4,'海景房无敌啊',0,'7室3厅1卫','东',200,'江苏省南京市江宁区','无敌小区',7,123123,'位置好环境好基础设施齐全','bfe35274-93cb-44f7-9e0f-37fd18e6bee0123.png','神仙水','12312312312',0,'2021-11-04 11:42:28','2021-11-04 11:42:28'),
(17,7,'撒大大阿松大',0,'1室3厅','东',120,'啊实打实的','啊实打实',12,300,'啊实打实的啊实打实的','87109dd6-80b3-490f-b2c2-ed85d73248082c6b7da9-c47e-496c-9c22-3d30296349a04.jpeg','123','12312312312',0,'2022-04-20 07:03:40','2022-04-20 07:03:40'),
(18,7,'撒旦撒大苏打',0,'1室3厅','东',999,'啊实打实的','啊实打实',12,400,'啊实打实的啊实打实的','73e6f2ab-e3f4-48a2-81ec-90000f73759b3c5b05ba-b40b-48d3-b446-5d5d3827210463f7e20e-11a7-41ec-96ec-4d9e9135b1267.jpeg','123','12312312312',1,'2022-04-20 07:15:40','2022-04-20 07:15:40');

/*Table structure for table `usercollection` */

DROP TABLE IF EXISTS `usercollection`;

CREATE TABLE `usercollection` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` bigint NOT NULL COMMENT '收藏账号ID',
  `room_id` bigint NOT NULL COMMENT '房屋ID',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb3;

/*Data for the table `usercollection` */

insert  into `usercollection`(`id`,`user_id`,`room_id`,`gmt_create`,`gmt_modified`) values 
(1,2,1,'2021-09-16 14:12:33','2021-09-16 14:12:38'),
(8,4,2,'2021-10-05 15:44:31','2021-10-05 15:44:31'),
(9,4,3,'2021-10-06 09:45:03','2021-10-06 09:45:03'),
(10,6,1,'2021-10-06 11:15:23','2021-10-06 11:15:23'),
(12,6,5,'2021-10-06 11:15:35','2021-10-06 11:15:35'),
(16,4,1,'2021-11-04 08:04:43','2021-11-04 08:04:43'),
(17,4,5,'2021-11-06 07:23:12','2021-11-06 07:23:12'),
(18,4,6,'2021-11-06 07:23:15','2021-11-06 07:23:15'),
(19,4,8,'2021-11-06 07:23:18','2021-11-06 07:23:18');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '账号',
  `nickname` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '昵称',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '密码',
  `phone` varchar(15) NOT NULL COMMENT '联系电话',
  `email` varchar(20) NOT NULL COMMENT '邮箱',
  `type` tinyint NOT NULL COMMENT '用户类型',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

/*Data for the table `userinfo` */

insert  into `userinfo`(`id`,`username`,`nickname`,`password`,`phone`,`email`,`type`,`gmt_create`,`gmt_modified`) values 
(1,'admin','管理员','admin','12312312312','123123@qq.com',1,'2021-09-13 20:23:35','2021-09-13 20:23:38'),
(2,'user','普通用户','user','12312312312','123123@qq.com',0,'2021-09-16 14:10:56','2021-09-16 14:11:01'),
(3,'roommaster','出租用户','roommaster','12312312312','123123@qq.com',0,'2021-09-16 14:11:31','2021-09-16 14:11:33'),
(4,'test','测试测试','123123','12345678933','12312@qq.com',0,'2021-09-16 07:10:05','2021-09-16 07:10:05'),
(6,'usertest','测试用户啊','123123','12312312312','123123123@qq.com',0,'2021-10-06 11:15:00','2021-10-06 11:15:00'),
(7,'777777','123','777777','12312312312','123123@123.com',0,'2022-04-20 06:55:48','2022-04-20 06:55:48');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
