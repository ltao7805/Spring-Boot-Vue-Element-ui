/*
SQLyog Ultimate v12.2.6 (64 bit)
MySQL - 5.7.27-log : Database - text02
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`text02` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `text02`;

/*Table structure for table `auction` */

DROP TABLE IF EXISTS `auction`;

CREATE TABLE `auction` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `aname` varchar(20) DEFAULT NULL,
  `describe` varchar(20) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

/*Data for the table `auction` */

insert  into `auction`(`aid`,`aname`,`describe`,`startTime`,`endTime`,`price`,`img`) values 
(49,'国书','明国藏书','2020-03-07 00:00:00','2020-03-14 09:31:06',2000,'ss'),
(50,'国书','明国藏书','2020-03-07 00:00:00','2020-03-10 00:00:00',2010,'ss'),
(51,'国书','明国藏书','2020-03-07 00:00:00','2020-03-10 00:00:00',2020,'ss'),
(52,'国书','明国藏书','2020-03-07 00:00:00','2020-03-10 00:00:00',2030,'ss'),
(53,'国书','明国藏书','2020-03-06 00:00:00','2020-03-10 00:00:00',2040,'ss'),
(54,'国书','明国藏书','2020-03-06 00:00:00','2020-03-10 00:00:00',2050,'ss'),
(55,'国书','明国藏书','2020-03-06 00:00:00','2020-03-10 00:00:00',2060,'ss'),
(56,'国书','明国藏书','2020-03-05 00:00:00','2020-03-10 00:00:00',2070,'ss'),
(57,'国书','明国藏书','2020-03-05 00:00:00','2020-03-10 00:00:00',2080,'ss'),
(58,'国书','明国藏书','2020-03-05 00:00:00','2020-03-10 00:00:00',2090,'ss'),
(59,'国书','明国藏书','2020-03-04 00:00:00','2020-03-10 00:00:00',2100,'ss'),
(60,'国书','明国藏书','2020-03-04 00:00:00','2020-03-10 00:00:00',2200,'ss'),
(61,'国书','明国藏书','2020-03-20 00:00:00','2020-03-26 00:00:00',2300,'timg.jpg'),
(62,'国书','明国藏书','2020-03-03 00:00:00','2020-03-10 00:00:00',2400,'ss'),
(63,'国书','明国藏书','2020-03-03 00:00:00','2020-03-10 00:00:00',2500,'ss'),
(64,'国书','明国藏书','2020-03-03 00:00:00','2020-03-10 00:00:00',2600,'ss'),
(65,'国书','明国藏书','2020-03-02 00:00:00','2020-03-10 00:00:00',2700,'ss'),
(66,'国书','明国藏书','2020-03-02 00:00:00','2020-03-10 00:00:00',2800,'ss'),
(67,'国书','明国藏书','2020-03-02 00:00:00','2020-03-10 00:00:00',2900,'ss'),
(68,'国书','明国藏书','2020-03-01 00:00:00','2020-03-10 00:00:00',2000,'ss'),
(69,'国书','明国藏书','2020-03-01 00:00:00','2020-03-10 00:00:00',2001,'ss'),
(70,'国书','明国藏书','2020-03-01 00:00:00','2020-03-10 00:00:00',2002,'ss'),
(71,'国书','明国藏书','2020-03-01 00:00:00','2020-03-10 00:00:00',2003,'ss'),
(72,'进口和泉屋黄金鱼','距今已有800多年的历史，非常罕见','2020-03-18 12:38:17','2020-03-21 16:38:30',2004,'QQ截图20200306081110.png'),
(83,'机械公司一般废旧物资处置及工业杂物','距今已有800多年的历史，非常罕见','2020-03-15 18:03:00','2020-03-17 22:00:00',2000,'QQ截图20200113232448.png');

/*Table structure for table `record` */

DROP TABLE IF EXISTS `record`;

CREATE TABLE `record` (
  `raid` int(4) DEFAULT NULL,
  `pricer` int(10) DEFAULT NULL,
  `ruser` varchar(20) DEFAULT NULL,
  `timer` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `record` */

insert  into `record`(`raid`,`pricer`,`ruser`,`timer`) values 
(83,2200,'sssss','2020-03-16 11:00:02'),
(83,4500,'wwwww','2020-03-19 09:40:35'),
(83,6000,'aaaaa','2020-03-19 09:59:37'),
(72,3000,'sss','2020-03-19 11:02:27'),
(72,4000,'www','2020-03-19 17:26:16'),
(72,5000,'aaa','2020-03-19 17:30:23');

/*Table structure for table `role` */

DROP TABLE IF EXISTS `role`;

CREATE TABLE `role` (
  `roid` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`roid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `role` */

insert  into `role`(`roid`,`rname`) values 
(1,'系统管理员'),
(2,'普通用户');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `pwd` varchar(10) DEFAULT NULL,
  `rid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`pwd`,`rid`) values 
(1,'ltao','7805',1),
(2,'lxm','123456',2),
(10,'www','www',2),
(11,'aaa','123',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
