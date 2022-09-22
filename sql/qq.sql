/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.21 : Database - qq
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `anam` */

DROP TABLE IF EXISTS `anam`;

CREATE TABLE `anam` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `qq` int(11) NOT NULL,
  `pwd` varchar(50) DEFAULT NULL,
  `Staid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `anam` */

insert  into `anam`(`id`,`qq`,`pwd`,`Staid`) values (1,10001,'520520',1),(2,10000,'813813',1);

/*Table structure for table `animalyearinfo` */

DROP TABLE IF EXISTS `animalyearinfo`;

CREATE TABLE `animalyearinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `animalyear` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `animalyearinfo` */

insert  into `animalyearinfo`(`id`,`animalyear`) values (1,'龙'),(2,'虎'),(3,'兔'),(4,'鼠'),(5,'狗'),(6,'牛'),(7,'马'),(8,'蛇'),(9,'猪'),(10,'猴'),(11,'鸡'),(12,'羊');

/*Table structure for table `bloodtypeinfo` */

DROP TABLE IF EXISTS `bloodtypeinfo`;

CREATE TABLE `bloodtypeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bloodtype` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `bloodtypeinfo` */

insert  into `bloodtypeinfo`(`id`,`bloodtype`) values (1,'A型'),(2,'B型'),(3,'AB型'),(4,'O型');

/*Table structure for table `friendshippolicyinfo` */

DROP TABLE IF EXISTS `friendshippolicyinfo`;

CREATE TABLE `friendshippolicyinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friendshippolicy` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `friendshippolicyinfo` */

insert  into `friendshippolicyinfo`(`id`,`friendshippolicy`) values (1,'允许任何人加我为好友'),(2,'需要身份验证才能把我加为好友'),(3,'不允许任何人加我为好友');

/*Table structure for table `friendsinfo` */

DROP TABLE IF EXISTS `friendsinfo`;

CREATE TABLE `friendsinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostid` int(11) NOT NULL,
  `friendid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `friendsinfo` */

insert  into `friendsinfo`(`id`,`hostid`,`friendid`) values (4,10001,10000),(5,10000,10001);

/*Table structure for table `messagesinfo` */

DROP TABLE IF EXISTS `messagesinfo`;

CREATE TABLE `messagesinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fromuserid` int(11) NOT NULL,
  `touserid` int(11) NOT NULL,
  `message` varchar(200) DEFAULT NULL,
  `messagetypeid` int(11) NOT NULL,
  `messagestate` int(11) NOT NULL,
  `messagedate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `messagetypeid` (`messagetypeid`),
  CONSTRAINT `messagesinfo_ibfk_1` FOREIGN KEY (`messagetypeid`) REFERENCES `messagetypeinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `messagesinfo` */

insert  into `messagesinfo`(`id`,`fromuserid`,`touserid`,`message`,`messagetypeid`,`messagestate`,`messagedate`) values (1,10001,10000,'你好啊',1,2,'2021-10-11 10:02:41'),(2,10001,10000,'在干嘛',1,2,'2021-10-11 10:03:04'),(3,10000,10001,'在跟你聊天啊',1,2,'2021-10-11 10:03:13'),(4,10001,10000,'呵呵',1,2,'2021-10-11 10:03:20'),(5,10000,10001,'呵呵',1,2,'2021-10-11 10:21:49'),(6,10000,10001,'你好',1,2,'2021-10-11 12:45:38'),(7,10000,10001,'吃饭了没？',1,2,'2021-10-11 12:49:56'),(8,10001,10000,'我吃过了',1,2,'2021-10-11 12:50:15'),(9,10001,10000,'你好',1,2,'2021-10-11 12:54:43');

/*Table structure for table `messagetypeinfo` */

DROP TABLE IF EXISTS `messagetypeinfo`;

CREATE TABLE `messagetypeinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messagetype` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `messagetypeinfo` */

insert  into `messagetypeinfo`(`id`,`messagetype`) values (1,'聊天消息'),(2,'抖动窗口消息'),(3,'系统消息');

/*Table structure for table `questioninfo` */

DROP TABLE IF EXISTS `questioninfo`;

CREATE TABLE `questioninfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(60) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `questioninfo` */

insert  into `questioninfo`(`id`,`question`) values (1,'你母亲的姓名是什么？'),(2,'你父亲的姓名是什么？'),(3,'你高中的班主任姓什么？'),(4,'你的男(女)朋友是谁？'),(5,'你尔今的配偶是谁？'),(6,'你高三的数学老师是谁？'),(7,'你母亲的生日是多少？'),(8,'你父亲的生日是多少？'),(9,'你最讨厌什么样的人？'),(10,'你最喜欢做的事是什么？');

/*Table structure for table `starinfo` */

DROP TABLE IF EXISTS `starinfo`;

CREATE TABLE `starinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `star` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `starinfo` */

insert  into `starinfo`(`id`,`star`) values (1,'白羊座'),(2,'双鱼座'),(3,'双子座'),(4,'金牛座'),(5,'天蝎座'),(6,'处女座'),(7,'射手座'),(8,'狮子座'),(9,'巨蝎座'),(10,'天秤座'),(11,'水瓶座'),(12,'魔羯座');

/*Table structure for table `stateinfo` */

DROP TABLE IF EXISTS `stateinfo`;

CREATE TABLE `stateinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `stateinfo` */

insert  into `stateinfo`(`id`,`state`) values (1,'下线'),(2,'在线'),(3,'聊天状态');

/*Table structure for table `userinfo` */

DROP TABLE IF EXISTS `userinfo`;

CREATE TABLE `userinfo` (
  `id` int(11) NOT NULL,
  `loginpwd` varchar(50) NOT NULL,
  `friendshippolicyid` int(11) DEFAULT '1',
  `nickname` varchar(40) NOT NULL,
  `faceid` int(11) NOT NULL DEFAULT '0',
  `sex` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `bloodtypeid` int(11) DEFAULT '1',
  `starid` int(11) DEFAULT '1',
  `animalyearid` int(11) DEFAULT '1',
  `address` varchar(60) DEFAULT NULL,
  `stateid` int(11) DEFAULT '1',
  `questionid` int(11) DEFAULT NULL,
  `answer` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `friendshippolicyid` (`friendshippolicyid`),
  KEY `bloodtypeid` (`bloodtypeid`),
  KEY `starid` (`starid`),
  KEY `animalyearid` (`animalyearid`),
  KEY `stateid` (`stateid`),
  KEY `questionid` (`questionid`),
  CONSTRAINT `userinfo_ibfk_1` FOREIGN KEY (`friendshippolicyid`) REFERENCES `friendshippolicyinfo` (`id`),
  CONSTRAINT `userinfo_ibfk_2` FOREIGN KEY (`bloodtypeid`) REFERENCES `bloodtypeinfo` (`id`),
  CONSTRAINT `userinfo_ibfk_3` FOREIGN KEY (`starid`) REFERENCES `starinfo` (`id`),
  CONSTRAINT `userinfo_ibfk_4` FOREIGN KEY (`animalyearid`) REFERENCES `animalyearinfo` (`id`),
  CONSTRAINT `userinfo_ibfk_5` FOREIGN KEY (`stateid`) REFERENCES `stateinfo` (`id`),
  CONSTRAINT `userinfo_ibfk_6` FOREIGN KEY (`questionid`) REFERENCES `questioninfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `userinfo` */

insert  into `userinfo`(`id`,`loginpwd`,`friendshippolicyid`,`nickname`,`faceid`,`sex`,`age`,`name`,`bloodtypeid`,`starid`,`animalyearid`,`address`,`stateid`,`questionid`,`answer`) values (10000,'813813',1,'蝶恋花',49,'男',15,'董',1,3,1,'六里坪',1,3,'813'),(10001,'520520',1,'蝶之舞',1,'女',17,'郑',2,1,6,'中南海',1,5,'王');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
