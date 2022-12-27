-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: rehmat_e_insaniat
-- ------------------------------------------------------
-- Server version	8.0.30
drop database if exists rehmat_e_insaniat;
CREATE DATABASE rehmat_e_insaniat;
use rehmat_e_insaniat;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
INSERT INTO `auth_group` VALUES (1,'admin'),(3,'clerk'),(5,'driver'),(6,'editorial'),(2,'hr'),(4,'it');
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
INSERT INTO `auth_group_permissions` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(11,1,11),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,1,17),(18,1,18),(19,1,19),(20,1,20),(21,1,21),(22,1,22),(23,1,23),(24,1,24),(25,1,25),(26,1,26),(27,1,27),(28,1,28),(29,1,29),(30,1,30),(31,1,31),(32,1,32),(33,1,33),(34,1,34),(35,1,35),(36,1,36),(37,1,37),(38,1,38),(39,1,39),(40,1,40),(41,1,41),(42,1,42),(43,1,43),(44,1,44),(45,1,45),(46,1,46),(47,1,47),(48,1,48),(49,1,49),(50,1,50),(51,1,51),(52,1,52),(53,1,53),(54,1,54),(55,1,55),(56,1,56),(57,1,57),(58,1,58),(59,1,59),(60,1,60),(61,1,61),(62,1,62),(63,1,63),(64,1,64),(65,1,65),(66,1,66),(67,1,67),(68,1,68),(69,1,69),(70,1,70),(71,1,71),(72,1,72),(73,1,73),(74,1,74),(75,1,75),(76,1,76),(77,1,77),(78,1,78),(79,1,79),(80,1,80),(81,1,81),(82,1,82),(83,1,83),(84,1,84),(85,1,85),(86,1,86),(87,1,87),(88,1,88),(89,1,89),(90,1,90),(91,1,91),(92,1,92),(93,1,93),(94,1,94),(95,1,95),(96,1,96),(97,1,97),(98,1,98),(99,1,99),(100,1,100),(101,1,101),(102,1,102),(103,1,103),(104,1,104),(206,2,1),(207,2,2),(208,2,3),(209,2,4),(210,2,69),(211,2,70),(212,2,71),(213,2,72),(106,3,1),(107,3,2),(108,3,3),(109,3,4),(110,3,5),(111,3,6),(112,3,7),(113,3,8),(114,3,9),(115,3,10),(116,3,11),(117,3,12),(118,3,13),(119,3,14),(120,3,15),(121,3,16),(122,3,17),(123,3,18),(124,3,19),(125,3,20),(126,3,21),(127,3,22),(128,3,23),(129,3,24),(130,3,25),(131,3,26),(132,3,27),(133,3,28),(134,3,29),(135,3,30),(136,3,31),(137,3,32),(138,3,33),(139,3,34),(140,3,35),(141,3,36),(142,3,37),(143,3,38),(144,3,39),(145,3,40),(146,3,41),(147,3,42),(148,3,43),(149,3,44),(150,3,45),(151,3,46),(152,3,47),(153,3,48),(154,3,49),(155,3,50),(156,3,51),(157,3,52),(158,3,53),(159,3,54),(160,3,55),(161,3,56),(162,3,57),(163,3,58),(164,3,59),(165,3,60),(166,3,61),(167,3,62),(168,3,63),(169,3,64),(170,3,65),(171,3,66),(172,3,67),(173,3,68),(174,3,69),(175,3,70),(176,3,71),(177,3,72),(178,3,73),(179,3,74),(180,3,75),(181,3,76),(182,3,77),(183,3,78),(184,3,79),(185,3,80),(186,3,81),(187,3,82),(188,3,83),(189,3,84),(214,4,4),(215,4,8),(216,4,12),(217,4,16),(218,4,20),(219,4,24),(220,4,28),(221,4,32),(222,4,36),(223,4,40),(224,4,44),(225,4,48),(226,4,52),(227,4,56),(228,4,60),(229,4,64),(230,4,68),(231,4,72),(232,4,76),(233,4,80),(234,4,84),(235,4,88),(236,4,92),(237,4,96),(238,4,100),(239,4,104),(105,5,68),(203,6,29),(204,6,30),(205,6,31),(190,6,32),(191,6,41),(192,6,42),(193,6,43),(194,6,44),(195,6,45),(196,6,46),(197,6,47),(198,6,48),(199,6,49),(200,6,50),(201,6,51),(202,6,52);
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add employee',1,'add_employee'),(2,'Can change employee',1,'change_employee'),(3,'Can delete employee',1,'delete_employee'),(4,'Can view employee',1,'view_employee'),(5,'Can add blood bank',2,'add_bloodbank'),(6,'Can change blood bank',2,'change_bloodbank'),(7,'Can delete blood bank',2,'delete_bloodbank'),(8,'Can view blood bank',2,'view_bloodbank'),(9,'Can add department',3,'add_department'),(10,'Can change department',3,'change_department'),(11,'Can delete department',3,'delete_department'),(12,'Can view department',3,'view_department'),(13,'Can add dispensary',4,'add_dispensary'),(14,'Can change dispensary',4,'change_dispensary'),(15,'Can delete dispensary',4,'delete_dispensary'),(16,'Can view dispensary',4,'view_dispensary'),(17,'Can add donation',5,'add_donation'),(18,'Can change donation',5,'change_donation'),(19,'Can delete donation',5,'delete_donation'),(20,'Can view donation',5,'view_donation'),(21,'Can add donor',6,'add_donor'),(22,'Can change donor',6,'change_donor'),(23,'Can delete donor',6,'delete_donor'),(24,'Can view donor',6,'view_donor'),(25,'Can add drive',7,'add_drive'),(26,'Can change drive',7,'change_drive'),(27,'Can delete drive',7,'delete_drive'),(28,'Can view drive',7,'view_drive'),(29,'Can add faq',8,'add_faq'),(30,'Can change faq',8,'change_faq'),(31,'Can delete faq',8,'delete_faq'),(32,'Can view faq',8,'view_faq'),(33,'Can add past drive',9,'add_pastdrive'),(34,'Can change past drive',9,'change_pastdrive'),(35,'Can delete past drive',9,'delete_pastdrive'),(36,'Can view past drive',9,'view_pastdrive'),(37,'Can add pitch',10,'add_pitch'),(38,'Can change pitch',10,'change_pitch'),(39,'Can delete pitch',10,'delete_pitch'),(40,'Can view pitch',10,'view_pitch'),(41,'Can add subscriber',11,'add_subscriber'),(42,'Can change subscriber',11,'change_subscriber'),(43,'Can delete subscriber',11,'delete_subscriber'),(44,'Can view subscriber',11,'view_subscriber'),(45,'Can add topic',12,'add_topic'),(46,'Can change topic',12,'change_topic'),(47,'Can delete topic',12,'delete_topic'),(48,'Can view topic',12,'view_topic'),(49,'Can add post',13,'add_post'),(50,'Can change post',13,'change_post'),(51,'Can delete post',13,'delete_post'),(52,'Can view post',13,'view_post'),(53,'Can add inventory',14,'add_inventory'),(54,'Can change inventory',14,'change_inventory'),(55,'Can delete inventory',14,'delete_inventory'),(56,'Can view inventory',14,'view_inventory'),(57,'Can add blood donation',15,'add_blooddonation'),(58,'Can change blood donation',15,'change_blooddonation'),(59,'Can delete blood donation',15,'delete_blooddonation'),(60,'Can view blood donation',15,'view_blooddonation'),(61,'Can add benificiary',16,'add_benificiary'),(62,'Can change benificiary',16,'change_benificiary'),(63,'Can delete benificiary',16,'delete_benificiary'),(64,'Can view benificiary',16,'view_benificiary'),(65,'Can add ambulance',17,'add_ambulance'),(66,'Can change ambulance',17,'change_ambulance'),(67,'Can delete ambulance',17,'delete_ambulance'),(68,'Can view ambulance',17,'view_ambulance'),(69,'Can add volunteer',18,'add_volunteer'),(70,'Can change volunteer',18,'change_volunteer'),(71,'Can delete volunteer',18,'delete_volunteer'),(72,'Can view volunteer',18,'view_volunteer'),(73,'Can add inventory report',19,'add_inventoryreport'),(74,'Can change inventory report',19,'change_inventoryreport'),(75,'Can delete inventory report',19,'delete_inventoryreport'),(76,'Can view inventory report',19,'view_inventoryreport'),(77,'Can add monthly donations',20,'add_monthlydonations'),(78,'Can change monthly donations',20,'change_monthlydonations'),(79,'Can delete monthly donations',20,'delete_monthlydonations'),(80,'Can view monthly donations',20,'view_monthlydonations'),(81,'Can add yearly donations',21,'add_yearlydonations'),(82,'Can change yearly donations',21,'change_yearlydonations'),(83,'Can delete yearly donations',21,'delete_yearlydonations'),(84,'Can view yearly donations',21,'view_yearlydonations'),(85,'Can add log entry',22,'add_logentry'),(86,'Can change log entry',22,'change_logentry'),(87,'Can delete log entry',22,'delete_logentry'),(88,'Can view log entry',22,'view_logentry'),(89,'Can add permission',23,'add_permission'),(90,'Can change permission',23,'change_permission'),(91,'Can delete permission',23,'delete_permission'),(92,'Can view permission',23,'view_permission'),(93,'Can add group',24,'add_group'),(94,'Can change group',24,'change_group'),(95,'Can delete group',24,'delete_group'),(96,'Can view group',24,'view_group'),(97,'Can add content type',25,'add_contenttype'),(98,'Can change content type',25,'change_contenttype'),(99,'Can delete content type',25,'delete_contenttype'),(100,'Can view content type',25,'view_contenttype'),(101,'Can add session',26,'add_session'),(102,'Can change session',26,'change_session'),(103,'Can delete session',26,'delete_session'),(104,'Can view session',26,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_employees_employee_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_employees_employee_id` FOREIGN KEY (`user_id`) REFERENCES `employees_employee` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-12-26 16:12:47.109031','1','tayyibulhassan',2,'[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]',1,1),(2,'2022-12-26 16:14:54.567159','1','admin',1,'[{\"added\": {}}]',24,1),(3,'2022-12-26 16:14:58.388806','2','hr',1,'[{\"added\": {}}]',24,1),(4,'2022-12-26 16:15:03.042063','3','clerk',1,'[{\"added\": {}}]',24,1),(5,'2022-12-26 16:15:14.639334','4','it',1,'[{\"added\": {}}]',24,1),(6,'2022-12-26 16:15:18.307222','5','driver',1,'[{\"added\": {}}]',24,1),(7,'2022-12-26 16:15:22.917993','6','editorial',1,'[{\"added\": {}}]',24,1),(8,'2022-12-26 16:15:39.483523','1','admin',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',24,1),(9,'2022-12-26 16:16:05.551551','5','driver',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',24,1),(10,'2022-12-26 16:18:40.279403','3','clerk',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',24,1),(11,'2022-12-26 16:19:40.669076','6','editorial',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',24,1),(12,'2022-12-26 16:20:39.744903','2','hr',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',24,1),(13,'2022-12-26 16:20:50.088037','4','it',2,'[{\"changed\": {\"fields\": [\"Permissions\"]}}]',24,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (22,'admin','logentry'),(24,'auth','group'),(23,'auth','permission'),(25,'contenttypes','contenttype'),(17,'employees','ambulance'),(16,'employees','benificiary'),(2,'employees','bloodbank'),(15,'employees','blooddonation'),(3,'employees','department'),(4,'employees','dispensary'),(5,'employees','donation'),(6,'employees','donor'),(7,'employees','drive'),(1,'employees','employee'),(8,'employees','faq'),(14,'employees','inventory'),(19,'employees','inventoryreport'),(20,'employees','monthlydonations'),(9,'employees','pastdrive'),(10,'employees','pitch'),(13,'employees','post'),(11,'employees','subscriber'),(12,'employees','topic'),(18,'employees','volunteer'),(21,'employees','yearlydonations'),(26,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-26 15:40:06.393582'),(2,'contenttypes','0002_remove_content_type_name','2022-12-26 15:40:07.199258'),(3,'auth','0001_initial','2022-12-26 15:40:08.521605'),(4,'auth','0002_alter_permission_name_max_length','2022-12-26 15:40:08.909253'),(5,'auth','0003_alter_user_email_max_length','2022-12-26 15:40:08.928950'),(6,'auth','0004_alter_user_username_opts','2022-12-26 15:40:08.950017'),(7,'auth','0005_alter_user_last_login_null','2022-12-26 15:40:08.970279'),(8,'auth','0006_require_contenttypes_0002','2022-12-26 15:40:08.984284'),(9,'auth','0007_alter_validators_add_error_messages','2022-12-26 15:40:09.003770'),(10,'auth','0008_alter_user_username_max_length','2022-12-26 15:40:09.023050'),(11,'auth','0009_alter_user_last_name_max_length','2022-12-26 15:40:09.042994'),(12,'auth','0010_alter_group_name_max_length','2022-12-26 15:40:09.088092'),(13,'auth','0011_update_proxy_permissions','2022-12-26 15:40:09.106295'),(14,'auth','0012_alter_user_first_name_max_length','2022-12-26 15:40:09.125818'),(15,'employees','0001_initial','2022-12-26 15:40:11.356124'),(16,'admin','0001_initial','2022-12-26 15:40:12.860001'),(17,'admin','0002_logentry_remove_auto_add','2022-12-26 15:40:12.912781'),(18,'admin','0003_logentry_add_action_flag_choices','2022-12-26 15:40:12.933718'),(19,'employees','0002_alter_employee_username','2022-12-26 15:40:13.041242'),(20,'employees','0003_employee_description','2022-12-26 15:40:13.155150'),(21,'employees','0004_alter_employee_is_superuser','2022-12-26 15:40:13.176620'),(22,'employees','0005_bloodbank_department_dispensary_donation_donor_drive_and_more','2022-12-26 15:40:18.955041'),(23,'employees','0006_employee_available','2022-12-26 15:40:19.130637'),(24,'employees','0007_drive_collected_funds_drive_required_funds','2022-12-26 15:40:19.387459'),(25,'employees','0008_alter_department_description','2022-12-26 15:40:19.405720'),(26,'employees','0009_volunteer','2022-12-26 15:40:19.500239'),(27,'employees','0010_alter_donation_department_alter_donation_drive','2022-12-26 15:40:19.522097'),(28,'employees','0011_alter_department_name_alter_donor_phone_no_and_more','2022-12-26 15:40:21.496132'),(29,'employees','0012_alter_post_title','2022-12-26 15:40:22.935386'),(30,'employees','0013_donation_used_inventory_price_per_item_and_more','2022-12-26 15:40:23.520249'),(31,'employees','0014_alter_pitch_phone_no_alter_volunteer_phone_no','2022-12-26 15:40:24.080356'),(32,'employees','0015_pastdrive_collected_funds','2022-12-26 15:40:24.200062'),(33,'employees','0016_inventoryreport_monthlydonations_yearlydonations','2022-12-26 15:40:24.217738'),(34,'sessions','0001_initial','2022-12-26 15:40:24.364777'),(35,'visitor','0001_initial','2022-12-26 15:40:24.448948'),(36,'visitor','0002_delete_faqs','2022-12-26 15:40:24.519346');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('eul3erv6ix105qo1ln4c0wz7f37a7s0b','.eJxVjMsOwiAQRf-FtSFAZxhw6d5vIMMjUjWQlHZl_Hdt0oVu7znnvkTgba1hG2UJcxZnAeL0u0VOj9J2kO_cbl2m3tZljnJX5EGHvPZcnpfD_TuoPOq3poxZT5MzqXgGJK2AUZFV2gGkSNFBsYlMQrAZnLeRbURDBb0jjUa8P7uJNpU:1p9ubm:mPp2-nHagGRDEvzF1tflbqmew6t-KA5ASPB6ONraB_w','2023-01-09 21:02:06.897560'),('ng31gl349bbu7syoseukcq32dnzqjjrg','.eJxVjEsOgjAUAO_StWn6oQVcuucM5PV9LGpoQmFlvLtpwkK3M5N5qxmOPc9H5W1eSF2VVZdflgCfvDZBD1jvRWNZ921JuiX6tFVPhfh1O9u_QYaa25YMgYdoYnBsOmu9ADP7YXS2w9EwDT11EtAJg-uDJEwOhWOQXhwE9fkC7Lw4tg:1pA2SD:Yo6IQ1RfJpgdFoIkamCEg-qa6QmzRrar9718qEpua9Y','2023-01-10 05:24:45.433905');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_ambulance`
--

DROP TABLE IF EXISTS `employees_ambulance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_ambulance` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `plate_no` varchar(100) NOT NULL,
  `driver_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_ambulance_plate_no_1e559bd6_uniq` (`plate_no`),
  KEY `employees_ambulance_driver_id_31b3285c_fk_employees_employee_id` (`driver_id`),
  CONSTRAINT `employees_ambulance_driver_id_31b3285c_fk_employees_employee_id` FOREIGN KEY (`driver_id`) REFERENCES `employees_employee` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_ambulance`
--

LOCK TABLES `employees_ambulance` WRITE;
/*!40000 ALTER TABLE `employees_ambulance` DISABLE KEYS */;
INSERT INTO `employees_ambulance` VALUES (2,'MBG 101',6),(4,'RIE 987',8),(5,'LEA 142',3),(6,'LEA 325',7),(7,'RWP 876',13);
/*!40000 ALTER TABLE `employees_ambulance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateAfterInsertion_ambulanceDrivers` AFTER INSERT ON `employees_ambulance` FOR EACH ROW update employees_employee e set available = false where new.driver_id = id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateAfterUpdation_ambulanceDrivers` AFTER UPDATE ON `employees_ambulance` FOR EACH ROW begin
update employees_employee e 
set e.available = false where new.driver_id = id;
update employees_employee e
set e.available= true where old.driver_id=id;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `updateBeforeDeletion_ambulanceDrivers` BEFORE DELETE ON `employees_ambulance` FOR EACH ROW update employees_employee e set available = true where old.driver_id = id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employees_benificiary`
--

DROP TABLE IF EXISTS `employees_benificiary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_benificiary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `age` int NOT NULL,
  `gender` varchar(10) NOT NULL,
  `department_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_benificiar_department_id_ebe8ff40_fk_employees` (`department_id`),
  CONSTRAINT `employees_benificiar_department_id_ebe8ff40_fk_employees` FOREIGN KEY (`department_id`) REFERENCES `employees_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_benificiary`
--

LOCK TABLES `employees_benificiary` WRITE;
/*!40000 ALTER TABLE `employees_benificiary` DISABLE KEYS */;
INSERT INTO `employees_benificiary` VALUES (1,'Ayesha','Amir',19,'Female',2),(2,'Peter','Hossainai',9,'Other',1),(3,'Aamir','Paracha',12,'Male',1),(4,'Wajiha','Niazi',33,'Female',2),(5,'Zara','Kamran',42,'Female',2),(6,'Ali','Hussain',7,'Male',1),(7,'Waleed','Tariq',12,'Male',1),(8,'Ambreen','Ali',12,'Female',1),(9,'Irtaza','Hussain',5,'Male',1),(10,'Rashid','Nawaz',9,'Male',1),(11,'Rafia','Haq',8,'Female',1),(12,'Fatima','Ayaz',5,'Female',1),(13,'Tehmina','Arshad',49,'Female',2),(14,'Sara','Hayat',40,'Female',2);
/*!40000 ALTER TABLE `employees_benificiary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_bloodbank`
--

DROP TABLE IF EXISTS `employees_bloodbank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_bloodbank` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bloodType` varchar(10) NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_bloodbank_bloodType_2a1df75e_uniq` (`bloodType`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_bloodbank`
--

LOCK TABLES `employees_bloodbank` WRITE;
/*!40000 ALTER TABLE `employees_bloodbank` DISABLE KEYS */;
INSERT INTO `employees_bloodbank` VALUES (1,'O-',3),(2,'A+',3),(3,'O+',1),(4,'B-',2),(6,'B+',1),(7,'AB+',1);
/*!40000 ALTER TABLE `employees_bloodbank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_blooddonation`
--

DROP TABLE IF EXISTS `employees_blooddonation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_blooddonation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `bloodtype` varchar(10) NOT NULL,
  `date` datetime(6) NOT NULL,
  `donor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_blooddonation_donor_id_014fb81c_fk_employees_donor_id` (`donor_id`),
  CONSTRAINT `employees_blooddonation_donor_id_014fb81c_fk_employees_donor_id` FOREIGN KEY (`donor_id`) REFERENCES `employees_donor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_blooddonation`
--

LOCK TABLES `employees_blooddonation` WRITE;
/*!40000 ALTER TABLE `employees_blooddonation` DISABLE KEYS */;
INSERT INTO `employees_blooddonation` VALUES (1,'A+','2022-12-26 20:46:20.878750',9),(2,'O+','2022-12-27 03:05:27.110332',12),(3,'B-','2022-12-27 03:06:03.705842',13),(4,'A+','2022-12-27 03:06:54.274665',14),(5,'O-','2022-12-27 03:07:37.268050',15),(6,'B-','2022-12-27 03:08:06.897235',16),(8,'O-','2022-12-27 03:10:34.231974',18),(9,'A+','2022-12-27 03:11:46.236556',19),(10,'B+','2022-12-27 03:12:17.536030',20),(11,'AB+','2022-12-27 03:12:56.256756',21);
/*!40000 ALTER TABLE `employees_blooddonation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_bloodDonation` AFTER INSERT ON `employees_blooddonation` FOR EACH ROW begin 
    declare b_rec_count int;
    
    select count(*) into b_rec_count
    from employees_bloodbank
    where employees_bloodbank.bloodtype = new.bloodtype;    
    
	if b_rec_count > 0 then
      update employees_bloodbank 
      set employees_bloodbank.count = employees_bloodbank.count + 1
      where employees_bloodbank.bloodType = new.bloodType;
	else
		insert into employees_bloodbank(bloodtype, count)
        values(new.bloodType, 1);
	end if;      
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employees_department`
--

DROP TABLE IF EXISTS `employees_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_department` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_department_name_74e89247_uniq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_department`
--

LOCK TABLES `employees_department` WRITE;
/*!40000 ALTER TABLE `employees_department` DISABLE KEYS */;
INSERT INTO `employees_department` VALUES (1,'Orphanage','A well-equipped orphanage housing hundreds of children without families.'),(2,'Women\'s Shelter','Safe, comfortable, accommodation for women in need.');
/*!40000 ALTER TABLE `employees_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_dispensary`
--

DROP TABLE IF EXISTS `employees_dispensary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_dispensary` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `medicine` varchar(100) NOT NULL,
  `count` int NOT NULL,
  `category` varchar(100) NOT NULL,
  `expiry` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_dispensary_medicine_57e9bbbe_uniq` (`medicine`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_dispensary`
--

LOCK TABLES `employees_dispensary` WRITE;
/*!40000 ALTER TABLE `employees_dispensary` DISABLE KEYS */;
INSERT INTO `employees_dispensary` VALUES (1,'Panadol Syrup',15,'NSAID','2022-12-29 00:00:00.000000'),(2,'Panadol Tablets',20,'NSAID','2024-12-29 00:00:00.000000'),(3,'Brufen Syrup',10,'NSAID','2023-10-10 00:00:00.000000'),(4,'Brufen Tablets',5,'NSAID','2022-10-29 00:00:00.000000'),(5,'Imodium',25,'Anti-diarrheal','2025-09-11 00:00:00.000000'),(6,'Pepto-Bismol',20,'Anti-diarrheal','2025-12-19 00:00:00.000000'),(7,'Floranex',15,'Anti-diarrheal','2022-12-29 00:00:00.000000'),(8,'Calamox',20,'Antibiotic','2024-05-01 00:00:00.000000');
/*!40000 ALTER TABLE `employees_dispensary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_donation`
--

DROP TABLE IF EXISTS `employees_donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_donation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `amount` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `department_id` bigint DEFAULT NULL,
  `donor_id` bigint DEFAULT NULL,
  `drive_id` bigint DEFAULT NULL,
  `used` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_donation_donor_id_96ded280_fk_employees_donor_id` (`donor_id`),
  KEY `employees_donation_drive_id_3d74e8a4_fk_employees_drive_id` (`drive_id`),
  KEY `employees_donation_department_id_764da64b_fk_employees` (`department_id`),
  CONSTRAINT `employees_donation_department_id_764da64b_fk_employees` FOREIGN KEY (`department_id`) REFERENCES `employees_department` (`id`),
  CONSTRAINT `employees_donation_donor_id_96ded280_fk_employees_donor_id` FOREIGN KEY (`donor_id`) REFERENCES `employees_donor` (`id`),
  CONSTRAINT `employees_donation_drive_id_3d74e8a4_fk_employees_drive_id` FOREIGN KEY (`drive_id`) REFERENCES `employees_drive` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_donation`
--

LOCK TABLES `employees_donation` WRITE;
/*!40000 ALTER TABLE `employees_donation` DISABLE KEYS */;
INSERT INTO `employees_donation` VALUES (1,16000,'2022-04-10 00:00:00.000000',1,1,NULL,600),(2,50000,'2022-09-10 00:00:00.000000',1,1,NULL,23000),(3,20000,'2022-12-11 00:00:00.000000',NULL,2,2,15000),(4,10000,'2022-11-10 00:00:00.000000',2,3,NULL,4800),(10,10000,'2022-12-26 20:11:18.631555',NULL,8,3,0),(11,6000,'2022-12-26 20:48:55.740686',NULL,10,3,6000),(12,10000,'2022-12-27 02:53:34.876550',NULL,11,5,0);
/*!40000 ALTER TABLE `employees_donation` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `redirect_donation_to_drive` AFTER INSERT ON `employees_donation` FOR EACH ROW begin
	if (new.drive_id is not null) then
		update employees_drive d
		set d.collected_funds =  (d.collected_funds + new.amount) where d.id = new.drive_id;
      
	end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employees_donor`
--

DROP TABLE IF EXISTS `employees_donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_donor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone_no` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_donor_phone_no_072edb1d_uniq` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_donor`
--

LOCK TABLES `employees_donor` WRITE;
/*!40000 ALTER TABLE `employees_donor` DISABLE KEYS */;
INSERT INTO `employees_donor` VALUES (1,'Sara','Rehman','s.rehman@gmail.com','03346131457'),(2,'Muhammad','Munir','mmrocks4ever@gmail.com','03389031457'),(3,'Sadia','Amanat','sadia.amanat@gmail.com','0317131776'),(4,'Amir','Imran','a.imran@gmail.com','03337208897'),(5,'Bilal','Nazir','b.nazir@gmail.com','03546199457'),(6,'Sirosh','Masood','sirosh235@gmail.com','03336136450'),(7,'Alina','Waseem','aleena@hotmail.com','03455756382'),(8,'Alina','Tabish','alina@gmail.com','0345820284'),(9,'Fizza','Ur Rehman','fizza@hotmail.com','0345576382'),(10,'Farooq','Ahmed','farooq@optimistic.edu','0323768234'),(11,'Fazail','Haider','fhaider@gmail.com','033328901786'),(12,'Haneen','Azhar','hazhar@gmail.com','03367128919'),(13,'Tariq','Malik','tmalik@gmail.com','03356236781'),(14,'Aliya','Ahmed','aahmed@gmail.com','03332198432'),(15,'Ibtisam','Zafar','izafar@gmail.com','03346723461'),(16,'Asad','Malik','amalik@gmail.com','03336809809'),(17,'Amna','Javed','ajaved@gmail.com','03346123450'),(18,'Amna','Javed','ajaved@gmail.com','03342187256'),(19,'Hassan','Nazir','hnazir@gmail.com','033346218903'),(20,'Abdullah','Siddiqui','asiddiqui@gmail.com','03334287456'),(21,'Mussarat','Orakzai','morakzai@gmail.com','0334921462');
/*!40000 ALTER TABLE `employees_donor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_drive`
--

DROP TABLE IF EXISTS `employees_drive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_drive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `start_date` datetime(6) NOT NULL,
  `collected_funds` int NOT NULL,
  `required_funds` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_drive`
--

LOCK TABLES `employees_drive` WRITE;
/*!40000 ALTER TABLE `employees_drive` DISABLE KEYS */;
INSERT INTO `employees_drive` VALUES (2,'Earthquake Relief Drive','The recent earthquake in Mirpur, Azad Kashmir brought unprecedented destruction. All of our help is needed to rebuild and rehabilitate. This drive is for collecting money for the victims of the October 2022 earthquake in Mirpur.','2022-10-22 00:00:00.000000',50000,200000),(3,'Ramadan Ration Drive','Ramadan 2023 is nearly upon us. Many people will need a little extra help this year. Join us in making the fasts of hundreds of deserving people easier. Contribute generously to the Ramadan 2023 ration collection drive!','2022-12-01 00:00:00.000000',31000,100000),(4,'Eid gift packages(2023)','Let\'s play our part in making this Eid a happy occasion for all, regardless of their financial situation. Through this drive, we are aiming to collect money for making and distributing gift hampers to families in need this Eid','2022-12-27 02:41:38.361233',3000,50000),(5,'Constructing wells in nearby localities','There is an acute shortage of fresh water supply in many of the surrounding localities. We have decided to build 3 wells in the areas most in need of them.','2022-12-27 02:49:33.092954',140000,250000);
/*!40000 ALTER TABLE `employees_drive` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_pastdrives` BEFORE DELETE ON `employees_drive` FOR EACH ROW insert into employees_pastdrive(name, description, start_date, collected_funds, end_date) 
values(old.name, old.description, old.start_date, old.collected_funds, now()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employees_employee`
--

DROP TABLE IF EXISTS `employees_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `username` varchar(250) NOT NULL,
  `email` varchar(254) NOT NULL,
  `role` varchar(100) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `description` longtext,
  `available` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `employees_employee_username_014026ca_uniq` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee`
--

LOCK TABLES `employees_employee` WRITE;
/*!40000 ALTER TABLE `employees_employee` DISABLE KEYS */;
INSERT INTO `employees_employee` VALUES (1,'pbkdf2_sha256$390000$RcfKABwwuntVgNvYg9yotH$7RDj9M8SWx89+9Dfsto0up7/pqO7oGKqh4acGPjjs20=','2022-12-27 05:24:45.426008',1,'Tayyib','Gondal','tayyibulhassan','tayyibgondal2003@gmail.com','admin',1,1,'2022-12-26 15:45:12.650028','He was a nice person. Used to work on backend.',1),(2,'pbkdf2_sha256$390000$2AvMUaaLUxc7TVdHJcEeiG$NOSXuRPIHhiebW8RwAIzYprRODqDrFFhQuavcB/SBAA=','2022-12-27 01:56:46.109324',0,'Aamina','Khan','aaminabintek','aamina@shahkhalid.com','editorial',1,1,'2022-12-26 16:22:19.869077',NULL,1),(3,'pbkdf2_sha256$390000$TwYXmvC07hjY55WiXH3YnA$pYm2zgSjq9aLKnUhAN47eGfgFG1SQvn7FsQumnRHvyk=',NULL,0,'Taimoor','Ikram','tikram','taimoor@shahk.com','driver',0,1,'2022-12-26 16:23:02.392260',NULL,0),(4,'pbkdf2_sha256$390000$uAI3dAYYzHyjdECtPjL2uL$hCV2wkNEbxmliu/J70jX+G3GU2Wv6RMfzRHsS3Z7S4c=','2022-12-26 21:02:06.882832',0,'Armaghan','Chaudhry','geetu_101','armaghan@shahk.com','it',1,1,'2022-12-26 16:24:22.549323',NULL,1),(5,'pbkdf2_sha256$390000$4uC5jPCvcCG5NRIdRMvkY1$BbVLiHNGe/Z3uyNNP4tBba+5yrD5zeVsq2eZ44NqoMc=','2022-12-26 16:26:06.928944',0,'Aliya','Shahid','aliya_shahid','aliya@shahk.com','editorial',1,1,'2022-12-26 16:25:45.438420',NULL,1),(6,'pbkdf2_sha256$390000$B5oVvWQxtzCRNV1Kolxzuc$wlVmSZRz2hr/YOwixy9vjEjFLFRJMbrVsyK1y0rLbAo=',NULL,0,'Hussain','Kazmi','hmk_hazard','hussain.mehdi@seecs.gmail.com','driver',1,1,'2022-12-26 20:12:43.543340',NULL,0),(7,'pbkdf2_sha256$390000$rBipmmSMyU0mONdREedmyR$nJqW2O/BZb/YEo6VufpyfmC8anLTPd28reTVON9bfxo=',NULL,0,'Arbab','Qureshi','arbaba','arbab.hocane@gmail.com','driver',1,1,'2022-12-26 20:13:32.842335',NULL,0),(8,'pbkdf2_sha256$390000$zMXfe61IpxBEA6Bwt9LfhW$+WB8NCAjZNZ0dvBccuCEaX430xX553Sf/xjOwacUeBI=',NULL,0,'Mustansir','Hussain','mustansirh','mhusssain@gmail.com','driver',1,1,'2022-12-27 01:46:01.835129',NULL,0),(9,'pbkdf2_sha256$390000$UFzrygnyzeF43g0UtOIfjK$aAZKjk0XA+wLcFJETqPVeL5o740N1CXSoBYH60KJ5RQ=',NULL,0,'Iftikhar','Javed','ijaved','ijaved00@gmail.com','clerk',1,1,'2022-12-27 01:47:16.046468',NULL,1),(10,'pbkdf2_sha256$390000$4e2matK8l0t33rf0q4g1pY$VPJWP/YhaTAvq322mX1gQ5oajtrB5NlrQ8WSJqu2v+g=',NULL,0,'Yasir','Hussain','yasirh','yhussain@gmail.com','manager',1,1,'2022-12-27 01:49:10.259396',NULL,1),(11,'pbkdf2_sha256$390000$o7T39x698UtSnFtfYRLNnp$8rP+piqxjWZcy4aTAXbdgFyJ8+RSy/I6rFfsgd/ag4g=',NULL,0,'Alvina','Naz','alvinan','alvina!123@gmail.com','it',1,1,'2022-12-27 01:51:15.768643',NULL,1),(12,'pbkdf2_sha256$390000$SMngspyPFjHFhWZVzSaLa3$cWSVjwN4MHDOfipLzFZwWY/3fTV8/0nZCVQsv8JZER0=',NULL,0,'Bilal','Saeed','bilals','bsaeed@gmail.com','editorial',1,1,'2022-12-27 01:53:54.566433',NULL,1),(13,'pbkdf2_sha256$390000$9gAsaGKH40sgJg8w0Notwk$osFUc87f5TcUWA38+VBIi9aufmO815/ExavdYikdC3g=',NULL,0,'Mustafa','Nawaz','mnawaz','mnawaz@gmail.com','driver',1,1,'2022-12-27 03:03:31.304170',NULL,0);
/*!40000 ALTER TABLE `employees_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_employee_groups`
--

DROP TABLE IF EXISTS `employees_employee_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_employee_groups_employee_id_group_id_4b30f410_uniq` (`employee_id`,`group_id`),
  KEY `employees_employee_groups_group_id_52c62ac3_fk_auth_group_id` (`group_id`),
  CONSTRAINT `employees_employee_g_employee_id_ac41f363_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`id`),
  CONSTRAINT `employees_employee_groups_group_id_52c62ac3_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee_groups`
--

LOCK TABLES `employees_employee_groups` WRITE;
/*!40000 ALTER TABLE `employees_employee_groups` DISABLE KEYS */;
INSERT INTO `employees_employee_groups` VALUES (1,2,6),(2,3,5),(3,4,4),(4,5,6),(5,6,5),(6,7,5),(7,8,5),(8,9,3),(9,11,4),(10,12,6),(11,13,5);
/*!40000 ALTER TABLE `employees_employee_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_employee_user_permissions`
--

DROP TABLE IF EXISTS `employees_employee_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_employee_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `employee_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_employee_user__employee_id_permission_i_4988a274_uniq` (`employee_id`,`permission_id`),
  KEY `employees_employee_u_permission_id_f4b51364_fk_auth_perm` (`permission_id`),
  CONSTRAINT `employees_employee_u_employee_id_67f277a2_fk_employees` FOREIGN KEY (`employee_id`) REFERENCES `employees_employee` (`id`),
  CONSTRAINT `employees_employee_u_permission_id_f4b51364_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_employee_user_permissions`
--

LOCK TABLES `employees_employee_user_permissions` WRITE;
/*!40000 ALTER TABLE `employees_employee_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees_employee_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_faq`
--

DROP TABLE IF EXISTS `employees_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_faq` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `question` longtext NOT NULL,
  `answer` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_faq`
--

LOCK TABLES `employees_faq` WRITE;
/*!40000 ALTER TABLE `employees_faq` DISABLE KEYS */;
INSERT INTO `employees_faq` VALUES (1,'How do I know where my money is being spent?','Your contributions mean the word to us and we make sure the money you donate goes to the cause it was intended for. We\'ll update you on the status of your donation and how exactly we disemminate it among our various departments.'),(2,'How can I become a volunteer?','We\'d love to have you join us on our mission to make the world a better place! You can join us a volunteer by filling out the application form available in the \'Volunteer\' section.'),(3,'Should I trust you?','We understand that there is nothing more important than being able to trust the organisation you choose to donate your hard-earned money too. You can rest assured that here at Rehmat_e_Insaniat,transparency and accountability are of the utmost importance to us. We regularly carry out external audits, send you proof of your donation being employed as you intended it to be, and are open to hear any concerns you may have!'),(4,'How do I ensure that my donation for the NGO is utilized properly?','We are very transparent about our costs. To assure complete transparency to our donors/stakeholders, you are free to check our accounts and/or visit programs. Accounts and programs are audited regularly and strict guidelines on finances are maintained as per Government guidelines.'),(5,'Is the website safe to make online payments?','Yes, the website is safe for any kind of transaction. Also any information exchange is kept safe and in no condition gets disclosed. Also the payment gateway is a third party payment gateway recognized by the financial institutions under the government of Pakistan. So any transaction also is thoroughly secured.'),(6,'How can I contribute to this organization?','You can contribute by sponsoring a child, by making a general donation, by convincing your friends, company or other companies to provide corporate funding to Rehmat_e_Insaniat. You can join us and provide voluntary services and there is no specific amount that should be donated. However all the programs have a detailed breakup of the expenditure.'),(7,'Do you provide aid to physically challenged orphans as well?','Yes, we believe and follow the principle of inclusive care. We do house and care for physically challenged children.'),(8,'How you maintain the process of keeping the donor’s information safe?','As a credible organization, we honour the privacy of our donors. The donor data is not exposed or shared with any external agency under any circumstances. We have a robust in-house mechanism and server system where the records are kept safe. The entire setup is protected and monitored by surveillance system and management.');
/*!40000 ALTER TABLE `employees_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_inventory`
--

DROP TABLE IF EXISTS `employees_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_name` varchar(100) NOT NULL,
  `item_count` int NOT NULL,
  `donation_id` bigint DEFAULT NULL,
  `price_per_item` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_inventory_donation_id_d0dbf8c4_fk_employees` (`donation_id`),
  CONSTRAINT `employees_inventory_donation_id_d0dbf8c4_fk_employees` FOREIGN KEY (`donation_id`) REFERENCES `employees_donation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_inventory`
--

LOCK TABLES `employees_inventory` WRITE;
/*!40000 ALTER TABLE `employees_inventory` DISABLE KEYS */;
INSERT INTO `employees_inventory` VALUES (1,'3-kg sugar',12,4,400),(2,'10-kg rice',3,1,4000),(3,'running gear',2,1,1750),(4,'3-kg sugar',12,2,400),(5,'woollen sweater',2,3,2000),(6,'1-kg ghee',34,1,340),(11,'Apple',6,1,100),(12,'Grapes',23,2,1000),(13,'pulses(1-kg packets)',60,11,100),(14,'cooking oil (1-kg)',30,3,500);
/*!40000 ALTER TABLE `employees_inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_donation_usedInInventory` AFTER INSERT ON `employees_inventory` FOR EACH ROW update employees_donation d
set d.used =  (new.item_count * new.price_per_item) where d.id = new.donation_id */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employees_pastdrive`
--

DROP TABLE IF EXISTS `employees_pastdrive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_pastdrive` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext,
  `start_date` datetime(6) NOT NULL,
  `end_date` datetime(6) NOT NULL,
  `collected_funds` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_pastdrive`
--

LOCK TABLES `employees_pastdrive` WRITE;
/*!40000 ALTER TABLE `employees_pastdrive` DISABLE KEYS */;
INSERT INTO `employees_pastdrive` VALUES (1,'Flood Relief Drive','A drive for collecting money for the victims of the summer 2022 floods.','2022-09-12 00:00:00.000000','2022-12-26 20:59:24.000000',70000),(2,'Eid gift packages','Let\'s play our part in making this Eid a happy occasion for all, regardless of their financial situation. Through this drive, we are aiming to collect money for making and distributing gift hampers to families in need this Eid','2022-01-20 00:00:00.000000','2022-04-18 00:00:00.000000',50000);
/*!40000 ALTER TABLE `employees_pastdrive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_pitch`
--

DROP TABLE IF EXISTS `employees_pitch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_pitch` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone_no` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_pitch`
--

LOCK TABLES `employees_pitch` WRITE;
/*!40000 ALTER TABLE `employees_pitch` DISABLE KEYS */;
INSERT INTO `employees_pitch` VALUES (1,'M. Iftikhar','miftik.9824@gmail.com','03187800'),(2,'Tanzeela Batool','tbatool@gmail.com','03348121432'),(3,'Navid Iftikhar','naiftikar@gmail.com','03334289435'),(4,'Zaheer Ahmed','zahmed@gmail.com','03342134215');
/*!40000 ALTER TABLE `employees_pitch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_post`
--

DROP TABLE IF EXISTS `employees_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` longtext NOT NULL,
  `updated` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `author_id` bigint DEFAULT NULL,
  `title_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `employees_post_author_id_aef495ec_fk_employees_employee_id` (`author_id`),
  KEY `employees_post_title_id_5e7d5762` (`title_id`),
  CONSTRAINT `employees_post_author_id_aef495ec_fk_employees_employee_id` FOREIGN KEY (`author_id`) REFERENCES `employees_employee` (`id`),
  CONSTRAINT `employees_post_title_id_5e7d5762_fk_employees_topic_id` FOREIGN KEY (`title_id`) REFERENCES `employees_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_post`
--

LOCK TABLES `employees_post` WRITE;
/*!40000 ALTER TABLE `employees_post` DISABLE KEYS */;
INSERT INTO `employees_post` VALUES (1,'Rehmat-e-Insanit Foundation is striving to help the people in all the walks of life. A project of monthly grocery packs is also functional since its inauguration. They number is increasing day by day. Presently we are providing monthly 138 grocery packs to the needy families on permanent monthly base. Except the routine rations, we try to reach the maximum deserving people specially at the festive occasions. The same was done at the eve of the EID. 250 families were provided with Ramdan and Eid Ration packages except the routine of 138, so the maximum number of people can enjoy the happiness and glory of the events.','2022-12-26 16:28:07.070540','2022-12-26 16:27:28.409806',5,6),(2,'Rehmat-e-Insaniat Foundation is working in 2 provinces currently without any discrimination. The foundation was already running 2 ambulances but we had routine calls for the provision of ambulance from the area of Miani. The belt from Midh to Bhera is unlucky enough as the nearest rescue ambulance had to come from Bhalwal, about 60 KM away. Feeling the severe need of the public, Rehmat-e-Insaniat Foundation decided to launch a new ambulance point at Miani, Distt. Sargodha to help the people. The third ambulance from the foundation plate form was launched in the end of 2021 on the same criteria on the previous pattern like ChotDheeran and Malakwal. The facility is available 24/7 for all. It works on petrol.','2022-12-26 16:28:48.918279','2022-12-26 16:28:48.918279',5,7),(3,'Rehmat-e-Insaniat Foundation is working to facilitate the people in different walks of life. The project is also a mile stone for the organization. There is a large number of kidney patients, having regular dialysis, in the area with the only facility of 16 beds at DHQ. The number of patients is much larger than the available facility. So the patients have to move towards private dialysis center, located at district level. It costs a lot and the hectic travelling hinders the far away patients too. So with the help of our donors, we have established a 4 bed kidney dialysis center at Malakwal, the Tehsil Head Quarter. General patients have to pay the medicinal cost only while the deserving patients are tried to be given maximum concession even free of cost. The running expense is not charged by any patient. We are trying hard to manage it by our donors on monthly basis. Currently we are having a setback of about 3 lacs per month in the project but we are still continuing it on the same criteria and hoping for the best to extend the number of beds and moving towards total welfare means free of cost.','2022-12-26 16:29:28.143950','2022-12-26 16:29:28.143950',5,8),(4,'With the grace of almighty Allah, we have a hard-working team of volunteers. They belong to different sectors of life and ever ready to help the needy without any cost. All the activities are performed with a consultation with the team and the ideas are demanded to improve it. Such a meeting was held under the shade of the organization at The Spirit School, Malakwal Campus. All the team members submitted their activity reports to the members and brought out new ideas to be worked upon. It was decided to extend the team and the formation of local units to help the people at grass root level. The frames to aware the general public were also taken in view to let them be a facilitator for the masses and to work for the betterment at personal and organizational level.','2022-12-26 16:30:01.193288','2022-12-26 16:30:01.193288',5,5),(5,'The world in general and Pakistan specifically is dealing with the ravaging effects of climate change. The foundation engaged its hands with the government policy of Green Pakistan and organized seminars to highlight the issue. Practically it involved the main stream personals of the area in the planting activity and planted more than 2000 trees. Our aim is to make our country green and clean. For the purpose we are motivating the people to do it on personal level too. Let\'s all join hands to safeguard our future; plant a tree today for a better tomorrow!','2022-12-27 02:01:32.110142','2022-12-27 02:01:32.110142',2,9),(6,'There are countless children around us without the comfort of a roof over their heads and food in their stomachs. Life leaves these innocent souls no choice but to wander the streets, completely devoid of any form of support from their families. We at the Rehmat_e_Insaniat foundation are doing our best to help as many orphans in need as we can-but we can\'t do this alone. We need your help in giving these children better lives. Your donations are pivotal in turning around the lives of so many of these children. Lend us a helping hand and together, let\'s create a better future for these children!','2022-12-27 02:08:07.729001','2022-12-27 02:08:07.729001',2,4),(7,'The blessed month of Ramadan is nearly upon us, but this year\'s Ramadan will be difficult for many families. After a year of unprecedented floods and uncontrollable inflation, many families are now in need of a little extra support to get through this most holy of months. Join us in making the fasts of our brothers and sisters easier by collecting food rations and other necessities required for Ramadan. The sacred month is less than 100 days away; let\'s get this done!','2022-12-27 02:13:21.061635','2022-12-27 02:13:21.061635',2,1);
/*!40000 ALTER TABLE `employees_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_subscriber`
--

DROP TABLE IF EXISTS `employees_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_subscriber` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone_no` varchar(30) NOT NULL,
  `date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_subscriber_email_b4b03fe2_uniq` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_subscriber`
--

LOCK TABLES `employees_subscriber` WRITE;
/*!40000 ALTER TABLE `employees_subscriber` DISABLE KEYS */;
INSERT INTO `employees_subscriber` VALUES (1,'Munazza','Obaid','mun.azz03ob@gmail.com','0332147898','2022-04-23 00:00:00.000000'),(2,'Mustafa','Khan','mustafadagoat@gmail.com','03338908247','2022-10-10 00:00:00.000000');
/*!40000 ALTER TABLE `employees_subscriber` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_topic`
--

DROP TABLE IF EXISTS `employees_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_topic`
--

LOCK TABLES `employees_topic` WRITE;
/*!40000 ALTER TABLE `employees_topic` DISABLE KEYS */;
INSERT INTO `employees_topic` VALUES (1,'Ramadan Drives'),(2,'Flood Relief Drives'),(3,'Come join us'),(4,'Orphans need you'),(5,'Team Meeting'),(6,'Eid Package'),(7,'Ambulance Service at Miani'),(8,'WAKEELAN BIBI KIDNEY DIALYSIS CENTER'),(9,'Tree plantation drives');
/*!40000 ALTER TABLE `employees_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees_volunteer`
--

DROP TABLE IF EXISTS `employees_volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees_volunteer` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone_no` varchar(30) NOT NULL,
  `available` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `employees_volunteer_phone_no_4c2d3242_uniq` (`phone_no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees_volunteer`
--

LOCK TABLES `employees_volunteer` WRITE;
/*!40000 ALTER TABLE `employees_volunteer` DISABLE KEYS */;
INSERT INTO `employees_volunteer` VALUES (1,'Ahmed','Raza',NULL,'145898',1,'2022-04-23 00:00:00.000000'),(2,'Noreen','Lodhi','no.dee012@gmail.com','170945',1,'2022-02-23 00:00:00.000000'),(3,'Arshi','Imran',NULL,'309124',1,'2022-10-03 00:00:00.000000'),(4,'Ali','Kazmi','akazmi345@gmail.com','3345098',1,'2022-11-01 00:00:00.000000'),(5,'Tehreem','Qasim','tqasim@gmail.com','03418792345',1,'2022-12-27 02:27:08.000000'),(6,'Usman','Ejaz','uejaz@gmail.com','03347123428',1,'2022-12-27 02:27:44.000000'),(7,'Azm','Waseem','azzywas@gmail.com','033478920134',1,'2022-12-27 02:28:15.000000'),(8,'Momina','Ashfaq','mashfaq@gmail.com','03338912345',1,'2022-12-27 02:29:02.000000'),(9,'Sahil','Naeem','snaeem@gmail.com','03321456782',1,'2022-12-27 02:29:59.000000'),(10,'Daniyal','Nadeem','dnadeem@gmail.com','03347234529',1,'2022-12-27 02:30:44.000000'),(11,'Zoha','Khan','zohak@gmail.com','033461221561',1,'2022-12-27 02:31:16.000000');
/*!40000 ALTER TABLE `employees_volunteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `inventory_report`
--

DROP TABLE IF EXISTS `inventory_report`;
/*!50001 DROP VIEW IF EXISTS `inventory_report`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inventory_report` AS SELECT 
 1 AS `inventory_id`,
 1 AS `item_name`,
 1 AS `item_count`,
 1 AS `price_per_item`,
 1 AS `donor_name`,
 1 AS `phone_no`,
 1 AS `donated_amount`,
 1 AS `donated_on`,
 1 AS `department`,
 1 AS `drive`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `monthly_donations`
--

DROP TABLE IF EXISTS `monthly_donations`;
/*!50001 DROP VIEW IF EXISTS `monthly_donations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `monthly_donations` AS SELECT 
 1 AS `month`,
 1 AS `total_donated`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `yearly_donations`
--

DROP TABLE IF EXISTS `yearly_donations`;
/*!50001 DROP VIEW IF EXISTS `yearly_donations`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `yearly_donations` AS SELECT 
 1 AS `year`,
 1 AS `total_donated`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'rehmat_e_insaniat'
--

--
-- Dumping routines for database 'rehmat_e_insaniat'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_ExpiredMedicines` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ExpiredMedicines`()
begin
select *
from employees_dispensary where datediff(expiry, now()) <= 0;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getDonatedItems` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getDonatedItems`(IN donor int)
begin 
declare deptno int;
select department_id from employees_donation where donor_id = donor;

if (deptno is not null) then
select item_name, item_count
from employees_inventory join employees_donation on(employees_inventory.donation_id = employees_donation.id) join employees_donor on (employees_donation.donor_id = employees_donor.id);
end if; 
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getItemCount` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getItemCount`(IN name varchar(100))
begin
select item_count
from employees_inventory 
where item_name = name;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getNumOfBeneficiariesInAgeBracket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getNumOfBeneficiariesInAgeBracket`(IN age1 int, IN age2 int)
begin
select *
from employees_beneficiary where (age >= age1 or age <= age2);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getTotalMedicinesInAllCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getTotalMedicinesInAllCategories`()
begin
select category, sum(count) 
from employees_dispensary group by(category);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_getTotalMedicinesInCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getTotalMedicinesInCategory`(IN cat varchar(100), OUT totalMed int)
begin
select sum(count) into totalMed
from employees_dispensary where category = cat;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_medicinesNearingExpiry` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_medicinesNearingExpiry`()
begin
select *, datediff(expiry, now()) as days_left_until_expiry
from employees_dispensary where (datediff(expiry, now()) < 10 and datediff(expiry, now()) > 0);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_returnNumOfMinors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_returnNumOfMinors`(OUT numMinors int)
begin
select count(*) into numMinors
from employees_beneficiary where age < 18;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `inventory_report`
--

/*!50001 DROP VIEW IF EXISTS `inventory_report`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inventory_report` AS select `employees_inventory`.`id` AS `inventory_id`,`employees_inventory`.`item_name` AS `item_name`,`employees_inventory`.`item_count` AS `item_count`,`employees_inventory`.`price_per_item` AS `price_per_item`,concat_ws(' ',`employees_donor`.`first_name`,`employees_donor`.`last_name`) AS `donor_name`,`employees_donor`.`phone_no` AS `phone_no`,`employees_donation`.`amount` AS `donated_amount`,`employees_donation`.`date` AS `donated_on`,`employees_department`.`name` AS `department`,`d`.`name` AS `drive` from ((((`employees_inventory` join `employees_donation` on((`employees_inventory`.`donation_id` = `employees_donation`.`id`))) join `employees_donor` on((`employees_donation`.`donor_id` = `employees_donor`.`id`))) left join `employees_department` on((`employees_donation`.`department_id` = `employees_department`.`id`))) left join `employees_drive` `d` on((`employees_donation`.`drive_id` = `d`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `monthly_donations`
--

/*!50001 DROP VIEW IF EXISTS `monthly_donations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `monthly_donations` AS select date_format(`employees_donation`.`date`,'%M') AS `month`,sum(`employees_donation`.`amount`) AS `total_donated` from `employees_donation` group by date_format(`employees_donation`.`date`,'%M') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `yearly_donations`
--

/*!50001 DROP VIEW IF EXISTS `yearly_donations`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `yearly_donations` AS select date_format(`employees_donation`.`date`,'%Y') AS `year`,sum(`employees_donation`.`amount`) AS `total_donated` from `employees_donation` group by date_format(`employees_donation`.`date`,'%Y') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-27 10:34:23
