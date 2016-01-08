-- MySQL dump 10.13  Distrib 5.7.10, for osx10.11 (x86_64)
--
-- Host: localhost    Database: fastcourses
-- ------------------------------------------------------
-- Server version	5.7.10

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add 타입',6,'add_type'),(17,'Can change 타입',6,'change_type'),(18,'Can delete 타입',6,'delete_type'),(19,'Can add 수강신청',7,'add_enrollment'),(20,'Can change 수강신청',7,'change_enrollment'),(21,'Can delete 수강신청',7,'delete_enrollment'),(22,'Can add 코스',8,'add_course'),(23,'Can change 코스',8,'change_course'),(24,'Can delete 코스',8,'delete_course'),(25,'Can add 유저',9,'add_user'),(26,'Can change 유저',9,'change_user'),(27,'Can delete 유저',9,'delete_user');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_course`
--

DROP TABLE IF EXISTS `courses_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(50) NOT NULL,
  `price` int(10) unsigned DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`),
  KEY `courses_course_94757cae` (`type_id`),
  CONSTRAINT `courses_course_type_id_a7bfde75_fk_courses_type_id` FOREIGN KEY (`type_id`) REFERENCES `courses_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_course`
--

LOCK TABLES `courses_course` WRITE;
/*!40000 ALTER TABLE `courses_course` DISABLE KEYS */;
INSERT INTO `courses_course` VALUES (1,'업무자동화를 위한 파이썬 입문 CAMP','dev_camp_python4auto',90,1),(2,'파이썬을 활용한 데이터분석 CAMP','data_camp_pda',150,1),(3,'데이터 사이언스 SCHOOL','data_school_ds',240,2),(4,'웹 프로그래밍 SCHOOL','dev_school_wp',240,2),(5,'디지털 마케팅 SCHOOL','mktg_school_dmktg',240,2),(6,'피키캐스트와 함께하는 \"탈우주적 데이터 분석 꿀팁\" 무료 세미나','pikicast_seminar_160115',0,3),(7,'프로그래밍 입문자들을 위한 \"불금의 코딩 TALK\"','dev_event_bkt_151030_behind',0,3);
/*!40000 ALTER TABLE `courses_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_enrollment`
--

DROP TABLE IF EXISTS `courses_enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_enrollment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_enrollment_course_id_2631503e_fk_courses_course_id` (`course_id`),
  KEY `courses_enrollment_user_id_da3de16f_fk_users_user_id` (`user_id`),
  CONSTRAINT `courses_enrollment_course_id_2631503e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `courses_enrollment_user_id_da3de16f_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_enrollment`
--

LOCK TABLES `courses_enrollment` WRITE;
/*!40000 ALTER TABLE `courses_enrollment` DISABLE KEYS */;
INSERT INTO `courses_enrollment` VALUES (1,1,61),(2,1,44),(3,1,68),(4,1,19),(5,1,77),(6,1,29),(7,1,84),(8,1,47),(9,1,85),(10,1,54),(11,1,6),(12,1,14),(13,1,41),(14,1,75),(15,1,98),(16,1,87),(17,1,100),(18,1,93),(19,1,24),(20,1,82),(21,2,64),(22,2,61),(23,2,74),(24,2,10),(25,2,4),(26,2,19),(27,2,55),(28,2,79),(29,2,93),(30,2,44),(31,2,28),(32,2,14),(33,2,1),(34,2,2),(35,2,57),(36,2,63),(37,2,85),(38,2,51),(39,2,75),(40,2,78),(41,2,18),(42,2,62),(43,3,69),(44,3,42),(45,3,88),(46,3,72),(47,3,18),(48,3,66),(49,3,75),(50,3,50),(51,3,28),(52,3,9),(53,3,15),(54,3,32),(55,3,40),(56,3,55),(57,3,30),(58,3,34),(59,3,70),(60,3,77),(61,3,22),(62,3,96),(63,3,23),(64,4,34),(65,4,14),(66,4,33),(67,4,93),(68,4,41),(69,4,62),(70,4,20),(71,4,15),(72,4,44),(73,4,38),(74,4,91),(75,4,4),(76,4,30),(77,4,53),(78,4,69),(79,4,51),(80,4,100),(81,4,49),(82,4,79),(83,4,48),(84,4,64),(85,4,81),(86,4,27),(87,5,94),(88,5,91),(89,5,18),(90,5,42),(91,5,24),(92,5,43),(93,5,45),(94,5,76),(95,5,77),(96,5,29),(97,5,97),(98,5,59),(99,5,27),(100,5,11),(101,5,5),(102,5,57),(103,5,7),(104,5,89),(105,5,96),(106,5,2),(107,6,25),(108,6,85),(109,6,82),(110,6,65),(111,6,49),(112,6,29),(113,6,45),(114,6,3),(115,6,37),(116,6,11),(117,6,67),(118,6,34),(119,6,86),(120,6,97),(121,6,89),(122,6,18),(123,6,61),(124,6,23),(125,6,58),(126,6,19),(127,6,35),(128,6,14),(129,6,60),(130,6,10),(131,6,17),(132,7,90),(133,7,16),(134,7,67),(135,7,58),(136,7,42),(137,7,21),(138,7,73),(139,7,57),(140,7,37),(141,7,3),(142,7,9),(143,7,34),(144,7,43),(145,7,35),(146,7,23),(147,7,93),(148,7,89),(149,7,79),(150,7,40),(151,7,64),(152,7,26),(153,7,68),(154,7,19),(155,7,54);
/*!40000 ALTER TABLE `courses_enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `courses_type`
--

DROP TABLE IF EXISTS `courses_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(8) NOT NULL,
  `slug` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses_type`
--

LOCK TABLES `courses_type` WRITE;
/*!40000 ALTER TABLE `courses_type` DISABLE KEYS */;
INSERT INTO `courses_type` VALUES (1,'코스','course'),(2,'스쿨','school'),(3,'특강','special');
/*!40000 ALTER TABLE `courses_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'courses','course'),(7,'courses','enrollment'),(6,'courses','type'),(5,'sessions','session'),(9,'users','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-01-08 08:19:31.539258'),(2,'contenttypes','0002_remove_content_type_name','2016-01-08 08:19:31.579878'),(3,'auth','0001_initial','2016-01-08 08:19:31.720459'),(4,'auth','0002_alter_permission_name_max_length','2016-01-08 08:19:31.745302'),(5,'auth','0003_alter_user_email_max_length','2016-01-08 08:19:31.751656'),(6,'auth','0004_alter_user_username_opts','2016-01-08 08:19:31.757907'),(7,'auth','0005_alter_user_last_login_null','2016-01-08 08:19:31.765342'),(8,'auth','0006_require_contenttypes_0002','2016-01-08 08:19:31.767493'),(9,'auth','0007_alter_validators_add_error_messages','2016-01-08 08:19:31.773351'),(10,'users','0001_initial','2016-01-08 08:19:31.926816'),(11,'admin','0001_initial','2016-01-08 08:19:31.989735'),(12,'admin','0002_logentry_remove_auto_add','2016-01-08 08:19:32.025635'),(13,'courses','0001_initial','2016-01-08 08:19:32.130813'),(14,'courses','0002_enrollment','2016-01-08 08:19:32.194212'),(15,'courses','0003_course_users','2016-01-08 08:19:32.204077'),(16,'courses','0004_auto_20160108_0747','2016-01-08 08:19:32.238773'),(17,'sessions','0001_initial','2016-01-08 08:19:32.273241'),(18,'users','0002_auto_20160107_1255','2016-01-08 08:19:32.369253'),(19,'users','0003_auto_20160107_1329','2016-01-08 08:19:32.472112');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user`
--

DROP TABLE IF EXISTS `users_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `address` varchar(256),
  `name` varchar(8) NOT NULL,
  `phonenumber` varchar(32),
  `phonenumber_preprocessed` varchar(16),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user`
--

LOCK TABLES `users_user` WRITE;
/*!40000 ALTER TABLE `users_user` DISABLE KEYS */;
INSERT INTO `users_user` VALUES (1,'',NULL,0,'fastcampus_001','','','',0,1,'2016-01-08 08:31:55.317694','충청북도 염미건군 서덕찬동 6 317동 264호 081-201','사공명','010-2558-1147','01025581147'),(2,'',NULL,0,'fastcampus_002','','','',0,1,'2016-01-08 08:31:55.321081','대구광역시 교솔연시 병범성군 4369 (817-448)','장곡빈안','01099097805','01099097805'),(3,'',NULL,0,'fastcampus_003','','','',0,1,'2016-01-08 08:31:55.322623','광주광역시 정명구 보온로 1838 008동 669호 996-986','선한민','01073043451','01073043451'),(4,'',NULL,0,'fastcampus_004','','','',0,1,'2016-01-08 08:31:55.324005','세종특별자치시 양주구 슬무두구 834 (293-194)','신찬','01029310404','01029310404'),(5,'',NULL,0,'fastcampus_005','','','',0,1,'2016-01-08 08:31:55.325508','경상북도 리경시 노협안로 8597 398동 525호 176-478','망절석','010-8480-4119','01084804119'),(6,'',NULL,0,'fastcampus_006','','','',0,1,'2016-01-08 08:31:55.326958','인천광역시 하은구 혜진연마을 412 (402-930)','우람','010-0400-1504','01004001504'),(7,'',NULL,0,'fastcampus_007','','','',0,1,'2016-01-08 08:31:55.328434','제주특별자치도 주의구 아은원동 6 (411-921)','정욱억','01089045859','01089045859'),(8,'',NULL,0,'fastcampus_008','','','',0,1,'2016-01-08 08:31:55.329832','제주특별자치도 증억송마을 규진별시 1555 626동 316호 286-043','장곡욱향','821083638676','01083638676'),(9,'',NULL,0,'fastcampus_009','','','',0,1,'2016-01-08 08:31:55.331271','서울특별시 전슬송시 윤가동 2 203-317','후관소','010-8978-1251','01089781251'),(10,'',NULL,0,'fastcampus_010','','','',0,1,'2016-01-08 08:31:55.332764','전라북도 궉준완구 기힘거리 2 93-0 (346-856)','동방용두','821003189156','01003189156'),(11,'',NULL,0,'fastcampus_011','','','',0,1,'2016-01-08 08:31:55.334159','경상북도 가산균마을 금협윤동 4 124동 020호 190-927','영남','01010975992','01010975992'),(12,'',NULL,0,'fastcampus_012','','','',0,1,'2016-01-08 08:31:55.335872','강원도 궉위동시 안창거리 6 70-2 655-935','근민예','01011673110','01011673110'),(13,'',NULL,0,'fastcampus_013','','','',0,1,'2016-01-08 08:31:55.337382','부산광역시 만비준마을 장슬양로 5 446-0 (764-709)','독고려찬','010-8774-0183','01087740183'),(14,'',NULL,0,'fastcampus_014','','','',0,1,'2016-01-08 08:31:55.339166','전라남도 범란시 광근동 1 (627-763)','묘기','821043960487','01043960487'),(15,'',NULL,0,'fastcampus_015','','','',0,1,'2016-01-08 08:31:55.340678','서울특별시 엽리구 운훈휘동 9 917-2 530-575','진주솔','01069866655','01069866655'),(16,'',NULL,0,'fastcampus_016','','','',0,1,'2016-01-08 08:31:55.342156','경상남도 하순비구 승솔경구 3987 (897-614)','안두찬','821051716372','01051716372'),(17,'',NULL,0,'fastcampus_017','','','',0,1,'2016-01-08 08:31:55.343580','경상남도 담완근구 호소람로 3 (723-775)','이인하','01036810535','01036810535'),(18,'',NULL,0,'fastcampus_018','','','',0,1,'2016-01-08 08:31:55.344975','부산광역시 동비구 금선순동 885 412-415','삼송향','01047120387','01047120387'),(19,'',NULL,0,'fastcampus_019','','','',0,1,'2016-01-08 08:31:55.346483','울산광역시 차해미마을 하건유거리 6 (786-177)','환세','01080686238','01080686238'),(20,'',NULL,0,'fastcampus_020','','','',0,1,'2016-01-08 08:31:55.347874','세종특별자치시 장기두시 왕원진로 920 8-8 (449-245)','노은림','821030337346','01030337346'),(21,'',NULL,0,'fastcampus_021','','','',0,1,'2016-01-08 08:31:55.349323','강원도 소봉형송시 림금준마을 262 910 (625-949)','인창통','01041385693','01041385693'),(22,'',NULL,0,'fastcampus_022','','','',0,1,'2016-01-08 08:31:55.350808','경상남도 하재마을 묵수두로 9 376-156','편빈대','821031053421','01031053421'),(23,'',NULL,0,'fastcampus_023','','','',0,1,'2016-01-08 08:31:55.352284','전라북도 한인마을 양휘강거리 323 250동 658호 316-031','묵창','01062581404','01062581404'),(24,'',NULL,0,'fastcampus_024','','','',0,1,'2016-01-08 08:31:55.353672','광주광역시 희종마을 균용구시 0330 047 180-233','독고은','821090032127','01090032127'),(25,'',NULL,0,'fastcampus_025','','','',0,1,'2016-01-08 08:31:55.355120','전라남도 림관군 명예경동 744 613동 716호 (240-622)','옹승훈','821032591823','01032591823'),(26,'',NULL,0,'fastcampus_026','','','',0,1,'2016-01-08 08:31:55.356510','경기도 한도군 지연정거리 3106 (651-602)','소다','01087881449','01087881449'),(27,'',NULL,0,'fastcampus_027','','','',0,1,'2016-01-08 08:31:55.357966','충청남도 조훈진군 안순동 1421 282-217','강윤향','01096582793','01096582793'),(28,'',NULL,0,'fastcampus_028','','','',0,1,'2016-01-08 08:31:55.359417','부산광역시 강전호철시 금소거리 404 128-656','성석해','01086482940','01086482940'),(29,'',NULL,0,'fastcampus_029','','','',0,1,'2016-01-08 08:31:55.360945','광주광역시 아창군 권별동 252 684 936-424','성보도','01095617772','01095617772'),(30,'',NULL,0,'fastcampus_030','','','',0,1,'2016-01-08 08:31:55.362521','전라남도 유철완마을 신태안거리 243 443-0 020-724','영우련','01084834138','01084834138'),(31,'',NULL,0,'fastcampus_031','','','',0,1,'2016-01-08 08:31:55.364177','경기도 준경순군 익별선구 468 25-7 904-745','배병위','010-6509-2901','01065092901'),(32,'',NULL,0,'fastcampus_032','','','',0,1,'2016-01-08 08:31:55.366182','전라남도 장범철군 효열동 9 426-935','승창','01020718291','01020718291'),(33,'',NULL,0,'fastcampus_033','','','',0,1,'2016-01-08 08:31:55.367968','울산광역시 증경준구 망절란범동 9 436동 061호 989-781','선우힘힘','821029642663','01029642663'),(34,'',NULL,0,'fastcampus_034','','','',0,1,'2016-01-08 08:31:55.370065','부산광역시 옥향비마을 남두온시 3 004동 591호 (825-771)','선균관','01059915782','01059915782'),(35,'',NULL,0,'fastcampus_035','','','',0,1,'2016-01-08 08:31:55.371911','충청남도 양다대시 장란려거리 458 (291-969)','왕광','821084908094','01084908094'),(36,'',NULL,0,'fastcampus_036','','','',0,1,'2016-01-08 08:31:55.373483','전라남도 고광다마을 보근로 300 022-8 (349-537)','박범유','01036657513','01036657513'),(37,'',NULL,0,'fastcampus_037','','','',0,1,'2016-01-08 08:31:55.375145','경기도 묵열대구 란창동 2021 8-4 906-168','묵힘','01047963185','01047963185'),(38,'',NULL,0,'fastcampus_038','','','',0,1,'2016-01-08 08:31:55.376772','서울특별시 호욱영시 영화동 401 59-9 (032-194)','성홍','821056338516','01056338516'),(39,'',NULL,0,'fastcampus_039','','','',0,1,'2016-01-08 08:31:55.378171','전라남도 변엽혁마을 덕화비구 358 52-7 (901-163)','전아민','010-1980-2228','01019802228'),(40,'',NULL,0,'fastcampus_040','','','',0,1,'2016-01-08 08:31:55.379754','대전광역시 제갈두찬군 우병화시 0286 (229-804)','천준종','821026338053','01026338053'),(41,'',NULL,0,'fastcampus_041','','','',0,1,'2016-01-08 08:31:55.381168','경기도 해해마을 련가선동 6812 95-7 (702-103)','신솔온','01003324903','01003324903'),(42,'',NULL,0,'fastcampus_042','','','',0,1,'2016-01-08 08:31:55.382659','세종특별자치시 아비시 조무해거리 011 715동 623호 866-367','심용규','01066423937','01066423937'),(43,'',NULL,0,'fastcampus_043','','','',0,1,'2016-01-08 08:31:55.384045','광주광역시 두별마을 온병로 9 908 582-479','박광','01047251218','01047251218'),(44,'',NULL,0,'fastcampus_044','','','',0,1,'2016-01-08 08:31:55.385499','부산광역시 선혁군 창힘우로 0238 969-167','성금','821090284953','01090284953'),(45,'',NULL,0,'fastcampus_045','','','',0,1,'2016-01-08 08:31:55.386905','서울특별시 노림정마을 삼비도거리 9 14-2 (732-235)','사공리의','821092426208','01092426208'),(46,'',NULL,0,'fastcampus_046','','','',0,1,'2016-01-08 08:31:55.388370','전라북도 다덕마을 해란로 4 704 598-967','유규순','01011068210','01011068210'),(47,'',NULL,0,'fastcampus_047','','','',0,1,'2016-01-08 08:31:55.389775','전라남도 억강시 아안거리 3417 471동 844호 (702-457)','진혁','01016415655','01016415655'),(48,'',NULL,0,'fastcampus_048','','','',0,1,'2016-01-08 08:31:55.391214','대전광역시 도윤구마을 다원의구 4406 65-8 930-187','삼석','01041231824','01041231824'),(49,'',NULL,0,'fastcampus_049','','','',0,1,'2016-01-08 08:31:55.392634','강원도 함예병군 명비통로 851 84-2 791-751','소억','01006172224','01006172224'),(50,'',NULL,0,'fastcampus_050','','','',0,1,'2016-01-08 08:31:55.395051','서울특별시 임권준군 미하거리 812 (741-864)','기광','821062785818','01062785818'),(51,'',NULL,0,'fastcampus_051','','','',0,1,'2016-01-08 08:31:55.396420','울산광역시 려동군 찬위슬거리 963 215-223','묵예건','010-2403-7789','01024037789'),(52,'',NULL,0,'fastcampus_052','','','',0,1,'2016-01-08 08:31:55.397955','울산광역시 판무동마을 병환병동 5972 121-077','윤구','01058601763','01058601763'),(53,'',NULL,0,'fastcampus_053','','','',0,1,'2016-01-08 08:31:55.400045','강원도 힘구마을 솔솔준동 721 26-3 592-540','차지황','010-4698-7029','01046987029'),(54,'',NULL,0,'fastcampus_054','','','',0,1,'2016-01-08 08:31:55.402022','인천광역시 위솔구 예홍가동 9940 2-2 355-096','진무','010-5930-1769','01059301769'),(55,'',NULL,0,'fastcampus_055','','','',0,1,'2016-01-08 08:31:55.403913','대구광역시 천현예마을 왕광세거리 385 882-070','임유구','01000943775','01000943775'),(56,'',NULL,0,'fastcampus_056','','','',0,1,'2016-01-08 08:31:55.405219','충청북도 삼균철구 승근슬동 506 684-571','창안','01049216225','01049216225'),(57,'',NULL,0,'fastcampus_057','','','',0,1,'2016-01-08 08:31:55.406508','제주특별자치도 온강마을 찬준거리 182 446-5 612-581','애효영','010-2883-6406','01028836406'),(58,'',NULL,0,'fastcampus_058','','','',0,1,'2016-01-08 08:31:55.407812','전라북도 도세남시 초협범동 4056 17-1 (118-462)','전구','01001943854','01001943854'),(59,'',NULL,0,'fastcampus_059','','','',0,1,'2016-01-08 08:31:55.409279','울산광역시 육별하시 하온동 7 (174-204)','진다하','01096437210','01096437210'),(60,'',NULL,0,'fastcampus_060','','','',0,1,'2016-01-08 08:31:55.410794','전라남도 안두구 광상로 6 957-1 (256-569)','양휘승','821045019408','01045019408'),(61,'',NULL,0,'fastcampus_061','','','',0,1,'2016-01-08 08:31:55.412208','대전광역시 홍다시 교림혜거리 671 816동 381호 130-556','선순','01095670920','01095670920'),(62,'',NULL,0,'fastcampus_062','','','',0,1,'2016-01-08 08:31:55.413823','경기도 나연금구 승상보군 9 886동 711호 (713-267)','엄려승','01053991195','01053991195'),(63,'',NULL,0,'fastcampus_063','','','',0,1,'2016-01-08 08:31:55.415247','충청북도 림형마을 윤빈남로 0 080동 981호 (832-901)','황보혁','010-6578-1927','01065781927'),(64,'',NULL,0,'fastcampus_064','','','',0,1,'2016-01-08 08:31:55.416648','대구광역시 열철시 해규동 752 7-5 052-740','양주','821069667166','01069667166'),(65,'',NULL,0,'fastcampus_065','','','',0,1,'2016-01-08 08:31:55.418077','광주광역시 산무구 순형경로 8059 2-4 (016-933)','장곡상','01010564202','01010564202'),(66,'',NULL,0,'fastcampus_066','','','',0,1,'2016-01-08 08:31:55.419439','전라북도 덕미구 강려거리 587 (872-897)','배려','010-8104-2927','01081042927'),(67,'',NULL,0,'fastcampus_067','','','',0,1,'2016-01-08 08:31:55.421158','충청북도 화기시 려의로 5344 (851-671)','환철','01079112071','01079112071'),(68,'',NULL,0,'fastcampus_068','','','',0,1,'2016-01-08 08:31:55.422686','광주광역시 병빈군 훈희비군 5762 750 810-595','하찬','821046011046','01046011046'),(69,'',NULL,0,'fastcampus_069','','','',0,1,'2016-01-08 08:31:55.424241','전라북도 협효구 동용형마을 336 978동 602호 (269-792)','구람순','010-8566-0346','01085660346'),(70,'',NULL,0,'fastcampus_070','','','',0,1,'2016-01-08 08:31:55.425816','부산광역시 려익구 광림동 745 8-3 (997-043)','마협','01031777338','01031777338'),(71,'',NULL,0,'fastcampus_071','','','',0,1,'2016-01-08 08:31:55.427256','서울특별시 상미시 민양거리 844 836-3 (222-051)','배용태','01015031602','01015031602'),(72,'',NULL,0,'fastcampus_072','','','',0,1,'2016-01-08 08:31:55.428793','대전광역시 조슬호구 무향현동 2152 (022-969)','이황별','821002046215','01002046215'),(73,'',NULL,0,'fastcampus_073','','','',0,1,'2016-01-08 08:31:55.430445','부산광역시 여소주시 권한다거리 0452 3-7 (148-056)','조효','821094667090','01094667090'),(74,'',NULL,0,'fastcampus_074','','','',0,1,'2016-01-08 08:31:55.432527','강원도 윤관안시 훈근로 6 559-795','모통소','01033192902','01033192902'),(75,'',NULL,0,'fastcampus_075','','','',0,1,'2016-01-08 08:31:55.434229','대전광역시 현수군 도준혜구 5 390 537-411','경인리','010-3192-9173','01031929173'),(76,'',NULL,0,'fastcampus_076','','','',0,1,'2016-01-08 08:31:55.436104','대전광역시 범혁군 묵유익로 229 40-6 (136-515)','담아','821085320918','01085320918'),(77,'',NULL,0,'fastcampus_077','','','',0,1,'2016-01-08 08:31:55.437724','충청남도 남향군 홍석도군 4214 7-8 491-842','왕혜','010-2103-1060','01021031060'),(78,'',NULL,0,'fastcampus_078','','','',0,1,'2016-01-08 08:31:55.438997','경상북도 제갈광비군 슬소기동 2339 296동 870호 (946-121)','팽예권','01095810090','01095810090'),(79,'',NULL,0,'fastcampus_079','','','',0,1,'2016-01-08 08:31:55.440470','전라북도 임유권군 후혁경마을 2 (852-559)','누관림','01072838082','01072838082'),(80,'',NULL,0,'fastcampus_080','','','',0,1,'2016-01-08 08:31:55.441867','부산광역시 어금승군 빈원희구 777 777-0 (233-921)','요황','010-2660-1296','01026601296'),(81,'',NULL,0,'fastcampus_081','','','',0,1,'2016-01-08 08:31:55.443444','부산광역시 두한시 철종별로 0776 (653-661)','제가','01012158514','01012158514'),(82,'',NULL,0,'fastcampus_082','','','',0,1,'2016-01-08 08:31:55.444891','경기도 통홍마을 의진정구 314 677동 530호 (644-550)','조훈','010-1108-3955','01011083955'),(83,'',NULL,0,'fastcampus_083','','','',0,1,'2016-01-08 08:31:55.446314','대전광역시 모선리구 구경지동 2 6-9 (904-625)','문기','01085274671','01085274671'),(84,'',NULL,0,'fastcampus_084','','','',0,1,'2016-01-08 08:31:55.447761','전라남도 임동빈군 조창남거리 393 (307-227)','부해인','01089293235','01089293235'),(85,'',NULL,0,'fastcampus_085','','','',0,1,'2016-01-08 08:31:55.449195','세종특별자치시 병한구 문윤억거리 135 597-380','민후소','01077170262','01077170262'),(86,'',NULL,0,'fastcampus_086','','','',0,1,'2016-01-08 08:31:55.450753','경기도 제은효시 지건로 895 74-7 (373-482)','부통','01029784006','01029784006'),(87,'',NULL,0,'fastcampus_087','','','',0,1,'2016-01-08 08:31:55.452176','부산광역시 연하상시 윤덕별동 667 866-501','박권','010-0276-5947','01002765947'),(88,'',NULL,0,'fastcampus_088','','','',0,1,'2016-01-08 08:31:55.453572','서울특별시 용선예구 상원위거리 0 716-5 (464-882)','추도','010-9953-3196','01099533196'),(89,'',NULL,0,'fastcampus_089','','','',0,1,'2016-01-08 08:31:55.454987','울산광역시 허덕창군 선소의로 9 758동 217호 (288-470)','동방안승','01049443691','01049443691'),(90,'',NULL,0,'fastcampus_090','','','',0,1,'2016-01-08 08:31:55.456376','충청북도 원균가마을 준보거리 1 (722-086)','문인','010-7822-0091','01078220091'),(91,'',NULL,0,'fastcampus_091','','','',0,1,'2016-01-08 08:31:55.457765','대전광역시 가경환시 엽권도거리 059 (827-535)','신익','01038324160','01038324160'),(92,'',NULL,0,'fastcampus_092','','','',0,1,'2016-01-08 08:31:55.459303','경기도 양덕철마을 송예철거리 834 (059-539)','소봉솔별','821003005234','01003005234'),(93,'',NULL,0,'fastcampus_093','','','',0,1,'2016-01-08 08:31:55.460824','서울특별시 미진구 별혁힘로 7296 082동 863호 031-010','구힘병','01049576628','01049576628'),(94,'',NULL,0,'fastcampus_094','','','',0,1,'2016-01-08 08:31:55.462362','경상남도 홍위규군 담향금동 911 319-2 (798-563)','심림','01046850816','01046850816'),(95,'',NULL,0,'fastcampus_095','','','',0,1,'2016-01-08 08:31:55.463844','전라남도 한슬군 정권아동 304 293-070','길보','010-7291-5964','01072915964'),(96,'',NULL,0,'fastcampus_096','','','',0,1,'2016-01-08 08:31:55.465998','경상남도 종혁혁군 비재우구 3162 208동 534호 475-678','황보유','821060306353','01060306353'),(97,'',NULL,0,'fastcampus_097','','','',0,1,'2016-01-08 08:31:55.467565','충청북도 홍근마을 지태거리 3045 (017-635)','부기','010-5409-2877','01054092877'),(98,'',NULL,0,'fastcampus_098','','','',0,1,'2016-01-08 08:31:55.469342','경상북도 위열시 승소소로 0537 835 (668-653)','독고힘석','01048830602','01048830602'),(99,'',NULL,0,'fastcampus_099','','','',0,1,'2016-01-08 08:31:55.470918','강원도 상혁마을 명하거리 1 016동 996호 (396-354)','채경석','01064622905','01064622905'),(100,'',NULL,0,'fastcampus_100','','','',0,1,'2016-01-08 08:31:55.472323','충청남도 규병시 윤선동 7 334-833','자환','8210307482102','01030740102');
/*!40000 ALTER TABLE `users_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_groups`
--

DROP TABLE IF EXISTS `users_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_groups_user_id_b88eab82_uniq` (`user_id`,`group_id`),
  KEY `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_user_groups_group_id_9afc8d0e_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_user_groups_user_id_5f6f5a90_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_groups`
--

LOCK TABLES `users_user_groups` WRITE;
/*!40000 ALTER TABLE `users_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_user_permissions`
--

DROP TABLE IF EXISTS `users_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_user_permissions_user_id_43338c45_uniq` (`user_id`,`permission_id`),
  KEY `users_user_user_per_permission_id_0b93982e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_user_user_per_permission_id_0b93982e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_user_permissions_user_id_20aca447_fk_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `users_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_user_permissions`
--

LOCK TABLES `users_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-01-08 17:54:25
