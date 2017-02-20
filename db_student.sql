/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.6.24 : Database - db_student
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_student` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_student`;

/*Table structure for table `tb_admin` */

DROP TABLE IF EXISTS `tb_admin`;

CREATE TABLE `tb_admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `privilege` varchar(100) DEFAULT 'admin',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

/*Data for the table `tb_admin` */

insert  into `tb_admin`(`id`,`user`,`password`,`admin`,`name`,`privilege`) values (1,'admin','admin','admin','是路名','admin'),(2,'XXOO1','123456','admin','测试管理员1','admin'),(3,'XXOO2','123456','admin','测试管理员2','admin'),(4,'XXOO3','123456','admin','测试管理员3','admin'),(5,'XXOO4','123456','admin','测试管理员4','admin'),(6,'XXOO5','123456','admin','测试管理员5','admin'),(7,'XXOO6','123456','admin','测试管理员6','admin'),(8,'XXOO7','123456','admin','测试管理员7','admin'),(9,'XXOO8','123456','admin','测试管理员8','admin'),(10,'XXOO9','123456','admin','测试管理员9','admin'),(11,'XXOO10','123456','admin','测试管理员10','admin'),(12,'XXOO11','123456','admin','测试管理员11','admin'),(13,'XXOO12','123456','admin','测试管理员12','admin'),(14,'XXOO13','123456','admin','测试管理员13','admin'),(15,'XXOO14','123456','admin','测试管理员14','admin'),(16,'XXOO15','123456','admin','测试管理员15','admin'),(17,'XXOO16','123456','admin','测试管理员16','admin'),(18,'XXOO17','123456','admin','测试管理员17','admin'),(19,'XXOO18','123456','admin','测试管理员18','admin'),(20,'XXOO19','123456','admin','测试管理员19','admin'),(21,'XXOO20','123456','admin','测试管理员20','admin'),(22,'XXOO21','123456','admin','测试管理员21','admin'),(23,'XXOO22','123456','admin','测试管理员22','admin'),(24,'XXOO23','123456','admin','测试管理员23','admin'),(25,'XXOO24','123456','admin','测试管理员24','admin'),(26,'XXOO25','123456','admin','测试管理员25','admin'),(27,'XXOO26','123456','admin','测试管理员26','admin'),(28,'XXOO27','123456','admin','测试管理员27','admin'),(29,'XXOO28','123456','admin','测试管理员28','admin'),(30,'XXOO29','123456','admin','测试管理员29','admin'),(31,'XXOO30','123456','admin','测试管理员30','admin'),(32,'XXOO31','123456','admin','测试管理员31','admin'),(33,'XXOO32','123456','admin','测试管理员32','admin'),(34,'XXOO33','123456','admin','测试管理员33','admin'),(35,'XXOO34','123456','admin','测试管理员34','admin'),(36,'XXOO35','123456','admin','测试管理员35','admin'),(37,'XXOO36','123456','admin','测试管理员36','admin'),(38,'XXOO37','123456','admin','测试管理员37','admin'),(39,'XXOO38','123456','admin','测试管理员38','admin'),(40,'XXOO39','123456','admin','测试管理员39','admin'),(41,'XXOO40','123456','admin','测试管理员40','admin'),(42,'XXOO41','123456','admin','测试管理员41','admin'),(43,'XXOO42','123456','admin','测试管理员42','admin'),(44,'XXOO43','123456','admin','测试管理员43','admin'),(45,'XXOO44','123456','admin','测试管理员44','admin'),(46,'XXOO45','123456','admin','测试管理员45','admin'),(47,'XXOO46','123456','admin','测试管理员46','admin'),(48,'XXOO47','123456','admin','测试管理员47','admin'),(49,'XXOO48','123456','admin','测试管理员48','admin'),(50,'XXOO49','123456','admin','测试管理员49','admin'),(51,'XXOO50','123456','admin','测试管理员50','admin'),(52,'XXOO51','123456','admin','测试管理员51','admin'),(53,'XXOO52','123456','admin','测试管理员52','admin'),(54,'XXOO53','123456','admin','测试管理员53','admin'),(55,'XXOO54','123456','admin','测试管理员54','admin'),(56,'XXOO55','123456','admin','测试管理员55','admin'),(57,'XXOO56','123456','admin','测试管理员56','admin'),(58,'XXOO57','123456','admin','测试管理员57','admin'),(59,'XXOO58','123456','admin','测试管理员58','admin'),(60,'XXOO59','123456','admin','测试管理员59','admin'),(61,'XXOO60','123456','admin','测试管理员60','admin'),(62,'XXOO61','123456','admin','测试管理员61','admin'),(63,'XXOO62','123456','admin','测试管理员62','admin'),(64,'XXOO63','123456','admin','测试管理员63','admin'),(65,'XXOO64','123456','admin','测试管理员64','admin'),(66,'XXOO65','123456','admin','测试管理员65','admin'),(67,'XXOO66','123456','admin','测试管理员66','admin'),(68,'XXOO67','123456','admin','测试管理员67','admin'),(69,'XXOO68','123456','admin','测试管理员68','admin'),(70,'XXOO69','123456','admin','测试管理员69','admin'),(71,'XXOO70','123456','admin','测试管理员70','admin'),(72,'XXOO71','123456','admin','测试管理员71','admin'),(73,'XXOO72','123456','admin','测试管理员72','admin'),(74,'XXOO73','123456','admin','测试管理员73','admin'),(75,'XXOO74','123456','admin','测试管理员74','admin'),(76,'XXOO75','123456','admin','测试管理员75','admin'),(77,'XXOO76','123456','admin','测试管理员76','admin'),(78,'XXOO77','123456','admin','测试管理员77','admin'),(79,'XXOO78','123456','admin','测试管理员78','admin'),(80,'XXOO79','123456','admin','测试管理员79','admin'),(81,'XXOO80','123456','admin','测试管理员80','admin'),(82,'XXOO81','123456','admin','测试管理员81','admin'),(83,'XXOO82','123456','admin','测试管理员82','admin'),(84,'XXOO83','123456','admin','测试管理员83','admin'),(85,'XXOO84','123456','admin','测试管理员84','admin'),(86,'XXOO85','123456','admin','测试管理员85','admin'),(87,'XXOO86','123456','admin','测试管理员86','admin'),(88,'XXOO87','123456','admin','测试管理员87','admin'),(89,'XXOO88','123456','admin','测试管理员88','admin'),(90,'XXOO89','123456','admin','测试管理员89','admin'),(91,'XXOO90','123456','admin','测试管理员90','admin'),(92,'XXOO91','123456','admin','测试管理员91','admin'),(93,'XXOO92','123456','admin','测试管理员92','admin'),(94,'XXOO93','123456','admin','测试管理员93','admin'),(95,'XXOO94','123456','admin','测试管理员94','admin'),(96,'XXOO95','123456','admin','测试管理员95','admin'),(97,'XXOO96','123456','admin','测试管理员96','admin'),(98,'XXOO97','123456','admin','测试管理员97','admin'),(99,'XXOO98','123456','admin','测试管理员98','admin'),(100,'XXOO99','123456','admin','测试管理员99','admin'),(101,'XXOOsdfsdfsdfsdfsdf','123456','admin','测试管理员11sdfsdfsdfsdfs',NULL),(102,'XXOOsdfsdfsdfsdfsdf','123456','admin','测试管理员11sdfsdfsdfsdfs',NULL);

/*Table structure for table `tb_class` */

DROP TABLE IF EXISTS `tb_class`;

CREATE TABLE `tb_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grade` varchar(100) DEFAULT NULL,
  `gradeName` varchar(200) DEFAULT NULL,
  `teacher` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

/*Data for the table `tb_class` */

insert  into `tb_class`(`id`,`grade`,`gradeName`,`teacher`) values (1,'13级web开发','web一班',1),(5,'15级','web开发(1)班',NULL),(6,'15级','web开发(2)班',NULL),(7,'15级','web开发(3)班',NULL),(8,'15级','web开发(4)班',NULL),(9,'15级','web开发(5)班',NULL),(10,'15级','物联网开发(1)班',NULL),(11,'15级','物联网开发(2)班',NULL),(12,'15级','物联网开发(3)班',NULL),(15,'15级','计算机科学与技术(1)班',NULL),(16,'15级','计算机科学与技术(2)班',NULL),(17,'15级','计算机科学与技术(3)班',NULL),(18,'15级','计算机科学与技术(4)班',NULL),(19,'15级','计算机科学与技术(5)班',NULL),(22,'2016-09级','web软件开发001',1);

/*Table structure for table `tb_student` */

DROP TABLE IF EXISTS `tb_student`;

CREATE TABLE `tb_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL COMMENT '学号',
  `password` varchar(100) DEFAULT NULL,
  `joinTime` datetime DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `masterTeacher` int(11) DEFAULT NULL COMMENT '负责老师',
  `sex` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `tell` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL COMMENT '审核状态：通过，未通过，待审核',
  `privilege` varchar(100) DEFAULT 'student',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8;

/*Data for the table `tb_student` */

insert  into `tb_student`(`id`,`code`,`password`,`joinTime`,`name`,`masterTeacher`,`sex`,`age`,`address`,`tell`,`email`,`grade`,`status`,`privilege`) values (1,'13401','123456','2017-01-08 17:25:38','华软计算机系学生 1',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,'13407','123456','2017-01-08 17:25:38','华软计算机系学生 7',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,'13408','123456','2017-01-08 17:25:38','华软计算机系学生 8',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(9,'13409','123456','2017-01-08 17:25:38','华软计算机系学生 9',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(10,'134010','123456','2017-01-08 17:25:38','华软计算机系学生 10',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'134011','123456','2017-01-08 17:25:38','华软计算机系学生 11',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'134012','123456','2017-01-08 17:25:38','华软计算机系学生 12',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(13,'134013','123456','2017-01-08 17:25:38','华软计算机系学生 13',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(14,'134014','123456','2017-01-08 17:25:38','华软计算机系学生 14',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,'134016','123456','2017-01-08 17:25:38','华软计算机系学生 16',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(17,'134017','123456','2017-01-08 17:25:38','华软计算机系学生 17',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(18,'134018','123456','2017-01-08 17:25:38','华软计算机系学生 18',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,'134019','123456','2017-01-08 17:25:38','华软计算机系学生 19',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(20,'134020','123456','2017-01-08 17:25:38','华软计算机系学生 20',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(21,'134021','123456','2017-01-08 17:25:38','华软计算机系学生 21',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(22,'134022','123456','2017-01-08 17:25:38','华软计算机系学生 22',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(23,'134023','123456','2017-01-08 17:25:38','华软计算机系学生 23',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(24,'134024','123456','2017-01-08 17:25:38','华软计算机系学生 24',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(25,'134025','123456','2017-01-08 17:25:38','华软计算机系学生 25',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(26,'134026','123456','2017-01-08 17:25:38','华软计算机系学生 26',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(27,'134027','123456','2017-01-08 17:25:38','华软计算机系学生 27',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(28,'134028','123456','2017-01-08 17:25:38','华软计算机系学生 28',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(29,'134029','123456','2017-01-08 17:25:38','华软计算机系学生 29',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(30,'134030','123456','2017-01-08 17:25:38','华软计算机系学生 30',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(31,'134031','123456','2017-01-08 17:25:38','华软计算机系学生 31',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(32,'134032','123456','2017-01-08 17:25:38','华软计算机系学生 32',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,'134033','123456','2017-01-08 17:25:38','华软计算机系学生 33',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(34,'134034','123456','2017-01-08 17:25:38','华软计算机系学生 34',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,'134035','123456','2017-01-08 17:25:38','华软计算机系学生 35',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(36,'134036','123456','2017-01-08 17:25:38','华软计算机系学生 36',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(37,'134037','123456','2017-01-08 17:25:38','华软计算机系学生 37',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(38,'134038','123456','2017-01-08 17:25:38','华软计算机系学生 38',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(39,'134039','123456','2017-01-08 17:25:38','华软计算机系学生 39',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(40,'134040','123456','2017-01-08 17:25:38','华软计算机系学生 40',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(41,'134041','123456','2017-01-08 17:25:38','华软计算机系学生 41',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(42,'134042','123456','2017-01-08 17:25:38','华软计算机系学生 42',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,'134043','123456','2017-01-08 17:25:38','华软计算机系学生 43',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,'134044','123456','2017-01-08 17:25:38','华软计算机系学生 44',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,'134045','123456','2017-01-08 17:25:38','华软计算机系学生 45',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,'134046','123456','2017-01-08 17:25:38','华软计算机系学生 46',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,'134047','123456','2017-01-08 17:25:38','华软计算机系学生 47',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,'134048','123456','2017-01-08 17:25:38','华软计算机系学生 48',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,'134049','123456','2017-01-08 17:25:38','华软计算机系学生 49',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(50,'134050','123456','2017-01-08 17:25:38','华软计算机系学生 50',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(51,'134051','123456','2017-01-08 17:25:38','华软计算机系学生 51',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(52,'134052','123456','2017-01-08 17:25:38','华软计算机系学生 52',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(53,'134053','123456','2017-01-08 17:25:38','华软计算机系学生 53',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(54,'134054','123456','2017-01-08 17:25:38','华软计算机系学生 54',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(55,'134055','123456','2017-01-08 17:25:38','华软计算机系学生 55',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(56,'134056','123456','2017-01-08 17:25:38','华软计算机系学生 56',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(57,'134057','123456','2017-01-08 17:25:38','华软计算机系学生 57',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(58,'134058','123456','2017-01-08 17:25:38','华软计算机系学生 58',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(59,'134059','123456','2017-01-08 17:25:38','华软计算机系学生 59',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(60,'134060','123456','2017-01-08 17:25:38','华软计算机系学生 60',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(61,'134061','123456','2017-01-08 17:25:38','华软计算机系学生 61',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(62,'134062','123456','2017-01-08 17:25:38','华软计算机系学生 62',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,'134063','123456','2017-01-08 17:25:38','华软计算机系学生 63',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(64,'134064','123456','2017-01-08 17:25:38','华软计算机系学生 64',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(65,'134065','123456','2017-01-08 17:25:38','华软计算机系学生 65',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,'134066','123456','2017-01-08 17:25:38','华软计算机系学生 66',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(67,'134067','123456','2017-01-08 17:25:38','华软计算机系学生 67',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(68,'134068','123456','2017-01-08 17:25:38','华软计算机系学生 68',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(69,'134069','123456','2017-01-08 17:25:38','华软计算机系学生 69',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,'134070','123456','2017-01-08 17:25:38','华软计算机系学生 70',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(71,'134071','123456','2017-01-08 17:25:38','华软计算机系学生 71',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(72,'134072','123456','2017-01-08 17:25:38','华软计算机系学生 72',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(73,'134073','123456','2017-01-08 17:25:38','华软计算机系学生 73',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(74,'134074','123456','2017-01-08 17:25:38','华软计算机系学生 74',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(75,'134075','123456','2017-01-08 17:25:38','华软计算机系学生 75',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(76,'134076','123456','2017-01-08 17:25:38','华软计算机系学生 76',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(77,'134077','123456','2017-01-08 17:25:38','华软计算机系学生 77',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(78,'134078','123456','2017-01-08 17:25:38','华软计算机系学生 78',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(79,'134079','123456','2017-01-08 17:25:38','华软计算机系学生 79',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(80,'134080','123456','2017-01-08 17:25:38','华软计算机系学生 80',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(81,'134081','123456','2017-01-08 17:25:38','华软计算机系学生 81',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(82,'134082','123456','2017-01-08 17:25:38','华软计算机系学生 82',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(83,'134083','123456','2017-01-08 17:25:38','华软计算机系学生 83',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(84,'134084','123456','2017-01-08 17:25:38','华软计算机系学生 84',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(85,'134085','123456','2017-01-08 17:25:38','华软计算机系学生 85',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(86,'134086','123456','2017-01-08 17:25:38','华软计算机系学生 86',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(87,'134087','123456','2017-01-08 17:25:38','华软计算机系学生 87',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(88,'134088','123456','2017-01-08 17:25:38','华软计算机系学生 88',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(89,'134089','123456','2017-01-08 17:25:38','华软计算机系学生 89',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(90,'134090','123456','2017-01-08 17:25:38','华软计算机系学生 90',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(91,'134091','123456','2017-01-08 17:25:38','华软计算机系学生 91',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(92,'134092','123456','2017-01-08 17:25:38','华软计算机系学生 92',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(93,'134093','123456','2017-01-08 17:25:38','华软计算机系学生 93',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(94,'134094','123456','2017-01-08 17:25:38','华软计算机系学生 94',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(95,'134095','123456','2017-01-08 17:25:38','华软计算机系学生 95',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(96,'134096','123456','2017-01-08 17:25:38','华软计算机系学生 96',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,'134097','123456','2017-01-08 17:25:38','华软计算机系学生 97',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,'134098','123456','2017-01-08 17:25:38','华软计算机系学生 98',NULL,'男',NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `tb_teacher` */

DROP TABLE IF EXISTS `tb_teacher`;

CREATE TABLE `tb_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL COMMENT '教师工号',
  `password` varchar(100) DEFAULT NULL,
  `joinTime` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sex` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `tell` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `privilege` varchar(100) DEFAULT 'teacher',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

/*Data for the table `tb_teacher` */

insert  into `tb_teacher`(`id`,`code`,`password`,`joinTime`,`name`,`sex`,`age`,`address`,`tell`,`email`,`privilege`) values (1,'A1000000','123456','2016-12-18 11:54:32','是路名','男',NULL,NULL,NULL,NULL,'teacher'),(2,'A1000001','123456','2016-12-18 11:54:33','华软计算机系老师 1','男',NULL,NULL,NULL,NULL,'teacher'),(3,'A1000002','123456','2016-12-18 11:54:33','华软计算机系老师 2','男',NULL,NULL,NULL,NULL,'teacher'),(4,'A1000003','123456','2016-12-18 11:54:33','华软计算机系老师 3','男',NULL,NULL,NULL,NULL,'teacher'),(5,'A1000004','123456','2016-12-18 11:54:33','华软计算机系老师 4','男',NULL,NULL,NULL,NULL,'teacher'),(6,'A1000005','123456','2016-12-18 11:54:33','华软计算机系老师 5','男',NULL,NULL,NULL,NULL,'teacher'),(7,'A1000006','123456','2016-12-18 11:54:33','华软计算机系老师 6','男',NULL,NULL,NULL,NULL,'teacher'),(8,'A1000007','123456','2016-12-18 11:54:33','华软计算机系老师 7','男',NULL,NULL,NULL,NULL,'teacher'),(9,'A1000008','123456','2016-12-18 11:54:33','华软计算机系老师 8','男',NULL,NULL,NULL,NULL,'teacher'),(13,'A10000012','123456','2016-12-18 11:54:33','华软计算机系老师 12','男',NULL,NULL,NULL,NULL,'teacher'),(14,'A10000013','123456','2016-12-18 11:54:33','华软计算机系老师 13','男',NULL,NULL,NULL,NULL,'teacher'),(15,'A10000014','123456','2016-12-18 11:54:33','华软计算机系老师 14','男',NULL,NULL,NULL,NULL,'teacher'),(16,'A10000015','123456','2016-12-18 11:54:33','华软计算机系老师 15','男',NULL,NULL,NULL,NULL,'teacher'),(17,'A10000016','123456','2016-12-18 11:54:33','华软计算机系老师 16','男',NULL,NULL,NULL,NULL,'teacher'),(18,'A10000017','123456','2016-12-18 11:54:33','华软计算机系老师 17','男',NULL,NULL,NULL,NULL,'teacher'),(19,'A10000018','123456','2016-12-18 11:54:33','华软计算机系老师 18','男',NULL,NULL,NULL,NULL,'teacher'),(20,'A10000019','123456','2016-12-18 11:54:33','华软计算机系老师 19','男',NULL,NULL,NULL,NULL,'teacher'),(21,'A10000020','123456','2016-12-18 11:54:33','华软计算机系老师 20','男',NULL,NULL,NULL,NULL,'teacher'),(22,'A10000021','123456','2016-12-18 11:54:33','华软计算机系老师 21','男',NULL,NULL,NULL,NULL,'teacher'),(23,'A10000022','123456','2016-12-18 11:54:33','华软计算机系老师 22','男',NULL,NULL,NULL,NULL,'teacher'),(24,'A10000023','123456','2016-12-18 11:54:33','华软计算机系老师 23','男',NULL,NULL,NULL,NULL,'teacher'),(25,'A10000024','123456','2016-12-18 11:54:33','华软计算机系老师 24','男',NULL,NULL,NULL,NULL,'teacher'),(26,'A10000025','123456','2016-12-18 11:54:33','华软计算机系老师 25','男',NULL,NULL,NULL,NULL,'teacher'),(27,'A10000026','123456','2016-12-18 11:54:33','华软计算机系老师 26','男',NULL,NULL,NULL,NULL,'teacher'),(28,'A10000027','123456','2016-12-18 11:54:33','华软计算机系老师 27','男',NULL,NULL,NULL,NULL,'teacher'),(29,'A10000028','123456','2016-12-18 11:54:33','华软计算机系老师 28','男',NULL,NULL,NULL,NULL,'teacher'),(30,'A10000029','123456','2016-12-18 11:54:33','华软计算机系老师 29','男',NULL,NULL,NULL,NULL,'teacher'),(31,'A10000030','123456','2016-12-18 11:54:33','华软计算机系老师 30','男',NULL,NULL,NULL,NULL,'teacher'),(32,'A10000031','123456','2016-12-18 11:54:33','华软计算机系老师 31','男',NULL,NULL,NULL,NULL,'teacher'),(33,'A10000032','123456','2016-12-18 11:54:33','华软计算机系老师 32','男',NULL,NULL,NULL,NULL,'teacher'),(34,'A10000033','123456','2016-12-18 11:54:33','华软计算机系老师 33','男',NULL,NULL,NULL,NULL,'teacher'),(35,'A10000034','123456','2016-12-18 11:54:33','华软计算机系老师 34','男',NULL,NULL,NULL,NULL,'teacher'),(36,'A10000035','123456','2016-12-18 11:54:33','华软计算机系老师 35','男',NULL,NULL,NULL,NULL,'teacher'),(37,'A10000036','123456','2016-12-18 11:54:33','华软计算机系老师 36','男',NULL,NULL,NULL,NULL,'teacher'),(38,'A10000037','123456','2016-12-18 11:54:33','华软计算机系老师 37','男',NULL,NULL,NULL,NULL,'teacher'),(39,'A10000038','123456','2016-12-18 11:54:33','华软计算机系老师 38','男',NULL,NULL,NULL,NULL,'teacher'),(40,'A10000039','123456','2016-12-18 11:54:33','华软计算机系老师 39','男',NULL,NULL,NULL,NULL,'teacher'),(41,'A10000040','123456','2016-12-18 11:54:33','华软计算机系老师 40','男',NULL,NULL,NULL,NULL,'teacher'),(42,'A10000041','123456','2016-12-18 11:54:33','华软计算机系老师 41','男',NULL,NULL,NULL,NULL,'teacher'),(43,'A10000042','123456','2016-12-18 11:54:33','华软计算机系老师 42','男',NULL,NULL,NULL,NULL,'teacher'),(44,'A10000043','123456','2016-12-18 11:54:33','华软计算机系老师 43','男',NULL,NULL,NULL,NULL,'teacher'),(45,'A10000044','123456','2016-12-18 11:54:33','华软计算机系老师 44','男',NULL,NULL,NULL,NULL,'teacher'),(46,'A10000045','123456','2016-12-18 11:54:33','华软计算机系老师 45','男',NULL,NULL,NULL,NULL,'teacher'),(47,'A10000046','123456','2016-12-18 11:54:33','华软计算机系老师 46','男',NULL,NULL,NULL,NULL,'teacher'),(48,'A10000047','123456','2016-12-18 11:54:33','华软计算机系老师 47','男',NULL,NULL,NULL,NULL,'teacher'),(49,'A10000048','123456','2016-12-18 11:54:33','华软计算机系老师 48','男',NULL,NULL,NULL,NULL,'teacher'),(50,'A10000049','123456','2016-12-18 11:54:33','华软计算机系老师 49','男',NULL,NULL,NULL,NULL,'teacher'),(51,'A10000050','123456','2016-12-18 11:54:33','华软计算机系老师 50','男',NULL,NULL,NULL,NULL,'teacher'),(52,'A10000051','123456','2016-12-18 11:54:33','华软计算机系老师 51','男',NULL,NULL,NULL,NULL,'teacher'),(53,'A10000052','123456','2016-12-18 11:54:33','华软计算机系老师 52','男',NULL,NULL,NULL,NULL,'teacher'),(54,'A10000053','123456','2016-12-18 11:54:33','华软计算机系老师 53','男',NULL,NULL,NULL,NULL,'teacher'),(55,'A10000054','123456','2016-12-18 11:54:33','华软计算机系老师 54','男',NULL,NULL,NULL,NULL,'teacher'),(56,'A10000055','123456','2016-12-18 11:54:33','华软计算机系老师 55','男',NULL,NULL,NULL,NULL,'teacher'),(57,'A10000056','123456','2016-12-18 11:54:33','华软计算机系老师 56','男',NULL,NULL,NULL,NULL,'teacher'),(58,'A10000057','123456','2016-12-18 11:54:33','华软计算机系老师 57','男',NULL,NULL,NULL,NULL,'teacher'),(59,'A10000058','123456','2016-12-18 11:54:33','华软计算机系老师 58','男',NULL,NULL,NULL,NULL,'teacher'),(60,'A10000059','123456','2016-12-18 11:54:33','华软计算机系老师 59','男',NULL,NULL,NULL,NULL,'teacher'),(61,'A10000060','123456','2016-12-18 11:54:33','华软计算机系老师 60','男',NULL,NULL,NULL,NULL,'teacher'),(62,'A10000061','123456','2016-12-18 11:54:33','华软计算机系老师 61','男',NULL,NULL,NULL,NULL,'teacher'),(63,'A10000062','123456','2016-12-18 11:54:33','华软计算机系老师 62','男',NULL,NULL,NULL,NULL,'teacher'),(64,'A10000063','123456','2016-12-18 11:54:33','华软计算机系老师 63','男',NULL,NULL,NULL,NULL,'teacher'),(65,'A10000064','123456','2016-12-18 11:54:33','华软计算机系老师 64','男',NULL,NULL,NULL,NULL,'teacher'),(66,'A10000065','123456','2016-12-18 11:54:33','华软计算机系老师 65','男',NULL,NULL,NULL,NULL,'teacher'),(67,'A10000066','123456','2016-12-18 11:54:33','华软计算机系老师 66','男',NULL,NULL,NULL,NULL,'teacher'),(68,'A10000067','123456','2016-12-18 11:54:33','华软计算机系老师 67','男',NULL,NULL,NULL,NULL,'teacher'),(69,'A10000068','123456','2016-12-18 11:54:33','华软计算机系老师 68','男',NULL,NULL,NULL,NULL,'teacher'),(70,'A10000069','123456','2016-12-18 11:54:33','华软计算机系老师 69','男',NULL,NULL,NULL,NULL,'teacher'),(71,'A10000070','123456','2016-12-18 11:54:33','华软计算机系老师 70','男',NULL,NULL,NULL,NULL,'teacher'),(72,'A10000071','123456','2016-12-18 11:54:33','华软计算机系老师 71','男',NULL,NULL,NULL,NULL,'teacher'),(73,'A10000072','123456','2016-12-18 11:54:33','华软计算机系老师 72','男',NULL,NULL,NULL,NULL,'teacher'),(74,'A10000073','123456','2016-12-18 11:54:33','华软计算机系老师 73','男',NULL,NULL,NULL,NULL,'teacher'),(75,'A10000074','123456','2016-12-18 11:54:33','华软计算机系老师 74','男',NULL,NULL,NULL,NULL,'teacher'),(76,'A10000075','123456','2016-12-18 11:54:33','华软计算机系老师 75','男',NULL,NULL,NULL,NULL,'teacher'),(77,'A10000076','123456','2016-12-18 11:54:33','华软计算机系老师 76','男',NULL,NULL,NULL,NULL,'teacher'),(78,'A10000077','123456','2016-12-18 11:54:33','华软计算机系老师 77','男',NULL,NULL,NULL,NULL,'teacher'),(79,'A10000078','123456','2016-12-18 11:54:33','华软计算机系老师 78','男',NULL,NULL,NULL,NULL,'teacher'),(80,'A10000079','123456','2016-12-18 11:54:33','华软计算机系老师 79','男',NULL,NULL,NULL,NULL,'teacher'),(81,'A10000080','123456','2016-12-18 11:54:33','华软计算机系老师 80','男',NULL,NULL,NULL,NULL,'teacher'),(82,'A10000081','123456','2016-12-18 11:54:33','华软计算机系老师 81','男',NULL,NULL,NULL,NULL,'teacher'),(83,'A10000082','123456','2016-12-18 11:54:33','华软计算机系老师 82','男',NULL,NULL,NULL,NULL,'teacher'),(84,'A10000083','123456','2016-12-18 11:54:33','华软计算机系老师 83','男',NULL,NULL,NULL,NULL,'teacher'),(85,'A10000084','123456','2016-12-18 11:54:33','华软计算机系老师 84','男',NULL,NULL,NULL,NULL,'teacher'),(86,'A10000085','123456','2016-12-18 11:54:33','华软计算机系老师 85','男',NULL,NULL,NULL,NULL,'teacher'),(87,'A10000086','123456','2016-12-18 11:54:33','华软计算机系老师 86','男',NULL,NULL,NULL,NULL,'teacher'),(88,'A10000087','123456','2016-12-18 11:54:33','华软计算机系老师 87','男',NULL,NULL,NULL,NULL,'teacher'),(89,'A10000088','123456','2016-12-18 11:54:33','华软计算机系老师 88','男',NULL,NULL,NULL,NULL,'teacher'),(90,'A10000089','123456','2016-12-18 11:54:33','华软计算机系老师 89','男',NULL,NULL,NULL,NULL,'teacher'),(91,'A10000090','123456','2016-12-18 11:54:33','华软计算机系老师 90','男',NULL,NULL,NULL,NULL,'teacher'),(92,'A10000091','123456','2016-12-18 11:54:33','华软计算机系老师 91','男',NULL,NULL,NULL,NULL,'teacher'),(93,'A10000092','123456','2016-12-18 11:54:33','华软计算机系老师 92','男',NULL,NULL,NULL,NULL,'teacher'),(94,'A10000093','123456','2016-12-18 11:54:33','华软计算机系老师 93','男',NULL,NULL,NULL,NULL,'teacher'),(95,'A10000094','123456','2016-12-18 11:54:33','华软计算机系老师 94','男',NULL,NULL,NULL,NULL,'teacher'),(96,'A10000095','123456','2016-12-18 11:54:33','华软计算机系老师 95','男',NULL,NULL,NULL,NULL,'teacher'),(97,'A10000096','123456','2016-12-18 11:54:33','华软计算机系老师 96','男',NULL,NULL,NULL,NULL,'teacher'),(98,'A10000097','123456','2016-12-18 11:54:33','华软计算机系老师 97','男',NULL,NULL,NULL,NULL,'teacher'),(99,'A10000098','123456','2016-12-18 11:54:33','华软计算机系老师 98','男',NULL,NULL,NULL,NULL,'teacher');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;