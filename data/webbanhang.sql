-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: webbanhang
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `webbanhang`
--
DROP DATABASE IF EXISTS `webbanhang`;
DROP DATABASE IF EXISTS `webbanhangtest`;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `webbanhang` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `webbanhang`;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `message_id` varchar(36) NOT NULL,
  `subject` text,
  `message` text,
  `sender_name` varchar(45) DEFAULT NULL,
  `sender_email` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_id_UNIQUE` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('42081ee5-4ec6-11e9-90ab-20474704b06e','This is also a test message','huheuhuhuhuh','Kien Nguyen','f.kien1997@gmail.com','2019-03-25 13:21:42'),('9718390d-4d7f-11e9-90ab-20474704b06e','ASDF','This is an example message\r\nsdajflsafdslkafjlkdsajfkldsaf','dante','asd@example.com','2019-03-23 22:23:20');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `message_BEFORE_INSERT` BEFORE INSERT ON `message` FOR EACH ROW BEGIN
		if new.message_id is null then
		set new.message_id = UUID();
        end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `order_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_phone` varchar(12) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `order_status_id` int(11) NOT NULL DEFAULT '1',
  `validation_code` varchar(36) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user1_idx` (`user_id`),
  KEY `fk_order_order_status_idx` (`order_status_id`),
  KEY `fk_order_payment_method_id_idx` (`payment_method_id`),
  CONSTRAINT `fk_order_order_status` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`order_status_id`),
  CONSTRAINT `fk_order_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('2c90a6c6-5096-11e9-90ab-20474704b06e','defec356-38cc-11e9-97d5-20474704b06e','2019-03-27 20:42:47','Số 1, ngách 178/30. phố Tây Sơn, quận Đống Đa, Hà Nội','123456789','kienntse04792@fpt.edu.vn',2,'2c90aa99-5096-11e9-90ab-20474704b06e',2),('7784c643-4be6-11e9-90ab-20474704b06e',NULL,'2019-03-21 21:34:43','1, 178/30 Alley, Tay Son Street','973118854','test@fpt.edu.vn',2,'7784c723-4be6-11e9-90ab-20474704b06e',1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_BEFORE_INSERT` BEFORE INSERT ON `order` FOR EACH ROW BEGIN
if new.order_id is null then
		set new.order_id = UUID();
    end if;
if new.validation_code is null then
		set new.validation_code = UUID();
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `product_id` varchar(36) NOT NULL,
  `order_id` varchar(36) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total` int(11) GENERATED ALWAYS AS ((`quantity` * `price`)) VIRTUAL,
  PRIMARY KEY (`product_id`,`order_id`),
  KEY `fk_order_detail_order1_idx` (`order_id`),
  CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `fk_order_detail_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` (`product_id`, `order_id`, `quantity`, `price`) VALUES ('1457473f-4036-11e9-91dc-448a5bec6a0c','2c90a6c6-5096-11e9-90ab-20474704b06e',1,50000000),('1459461b-4036-11e9-91dc-448a5bec6a0c','2c90a6c6-5096-11e9-90ab-20474704b06e',1,100000000),('1459461b-4036-11e9-91dc-448a5bec6a0c','7784c643-4be6-11e9-90ab-20474704b06e',1,100000000),('145b39d6-4036-11e9-91dc-448a5bec6a0c','2c90a6c6-5096-11e9-90ab-20474704b06e',1,400000000);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Unverified'),(2,'Verified'),(3,'Completed');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'cod'),(2,'cash');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` varchar(36) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_categories_id` int(11) NOT NULL DEFAULT '1',
  `product_material_id` int(11) NOT NULL DEFAULT '1',
  `product_origin_id` int(11) NOT NULL DEFAULT '1',
  `product_room_id` int(11) NOT NULL DEFAULT '1',
  `product_code` varchar(45) NOT NULL DEFAULT '0000',
  `thumbnail` varchar(45) DEFAULT NULL,
  `description` text,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_bin_UNIQUE` (`product_id`) /*!80000 INVISIBLE */,
  KEY `fk_product_material_idx` (`product_material_id`),
  KEY `fk_product_origin1_idx` (`product_origin_id`),
  KEY `fk_product_categories` (`product_categories_id`),
  KEY `fk_product_room_idx` (`product_room_id`),
  CONSTRAINT `fk_product_categories` FOREIGN KEY (`product_categories_id`) REFERENCES `product_categories` (`categories_id`),
  CONSTRAINT `fk_product_material` FOREIGN KEY (`product_material_id`) REFERENCES `product_material` (`material_id`),
  CONSTRAINT `fk_product_origin` FOREIGN KEY (`product_origin_id`) REFERENCES `product_origin` (`origin_id`),
  CONSTRAINT `fk_product_room` FOREIGN KEY (`product_room_id`) REFERENCES `product_room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1457473f-4036-11e9-91dc-448a5bec6a0c','Thang Bộ 1',2,1,1,1,'CT-1','2019-03-16_19-41-32.png','',123,50000000),('1459461b-4036-11e9-91dc-448a5bec6a0c','Cầu Thang 2',23,2,1,1,'CT-2','CT-2\\1',NULL,10,100000000),('145b39d6-4036-11e9-91dc-448a5bec6a0c','Cầu Thang 3',23,3,1,1,'CT-3','CT-3\\1',NULL,10,400000000),('145d3537-4036-11e9-91dc-448a5bec6a0c','Cầu Thang 4',23,4,1,1,'CT-4','CT-4\\1',NULL,10,250000000),('15682b00-4032-11e9-91dc-448a5bec6a0c','Đồ Thờ 1',5,1,1,1,'ĐT-1','ĐT-1\\1',NULL,11,5000000),('15689754-4032-11e9-91dc-448a5bec6a0c','Đồ Thờ 2',5,2,1,1,'ĐT-2','ĐT-2\\1',NULL,10,10000000),('1568a513-4032-11e9-91dc-448a5bec6a0c','Đồ Thờ 3',5,3,1,1,'ĐT-3','ĐT-3\\1',NULL,10,40000000),('1568b2d1-4032-11e9-91dc-448a5bec6a0c','Đồ Thờ 4',5,4,1,1,'ĐT-4','ĐT-4\\1',NULL,10,25000000),('1ed01e11-4035-11e9-91dc-448a5bec6a0c','Sập 1',16,1,1,1,'S-1','S-1\\1',NULL,11,50000000),('1ed1cf57-4035-11e9-91dc-448a5bec6a0c','Sập 2',16,2,1,1,'S-2','S-2\\1',NULL,10,100000000),('1ed34e0c-4035-11e9-91dc-448a5bec6a0c','Sập 3',16,3,1,1,'S-3','S-3\\1',NULL,10,400000000),('1ed4ce58-4035-11e9-91dc-448a5bec6a0c','Sập 4',16,4,1,1,'S-4','S-4\\1',NULL,10,250000000),('2b1bfb15-4034-11e9-91dc-448a5bec6a0c','Bàn Làm Việc 1',10,1,1,1,'BLV-1','BLV-1\\1',NULL,11,5000000),('2b1dc37b-4034-11e9-91dc-448a5bec6a0c','Bàn Làm Việc 2',10,2,1,1,'BLV-2','BLV-2\\1',NULL,10,10000000),('2b1f5a88-4034-11e9-91dc-448a5bec6a0c','Bàn Làm Việc 3',10,3,1,1,'BLV-3','BLV-3\\1',NULL,10,40000000),('2b20e71d-4034-11e9-91dc-448a5bec6a0c','Bàn Làm Việc 4',10,4,1,1,'BLV-4','BLV-4\\1',NULL,10,25000000),('35fb14b1-4035-11e9-91dc-448a5bec6a0c','Phản 1',17,1,1,1,'P-1','P-1\\1',NULL,11,50000000),('35fd65de-4035-11e9-91dc-448a5bec6a0c','Phản 2',17,2,1,1,'P-2','P-2\\1',NULL,10,100000000),('35fee575-4035-11e9-91dc-448a5bec6a0c','Phản 3',17,3,1,1,'P-3','P-3\\1',NULL,10,400000000),('36005e1b-4035-11e9-91dc-448a5bec6a0c','Phản 4',17,4,1,1,'P-4','P-4\\1',NULL,10,250000000),('3c9741ae-4026-11e9-91dc-448a5bec6a0c','Bàn ghế 3',1,3,1,1,'BG-3','BG-3\\1',NULL,10,400000000),('3c977afb-4026-11e9-91dc-448a5bec6a0c','Bàn ghế 4',1,4,1,1,'BG-4','BG-4\\1',NULL,10,250000000),('4a8966d4-4035-11e9-91dc-448a5bec6a0c','Tủ Thờ 1',18,1,1,1,'TT-1','TT-1\\1',NULL,11,50000000),('4a8b8b50-4035-11e9-91dc-448a5bec6a0c','Tủ Thờ 2',18,2,1,1,'TT-2','TT-2\\1',NULL,10,100000000),('4a8d1088-4035-11e9-91dc-448a5bec6a0c','Tủ Thờ 3',18,3,1,1,'TT-3','TT-3\\1',NULL,10,400000000),('4a8eb610-4035-11e9-91dc-448a5bec6a0c','Tủ Thờ 4',18,4,1,1,'TT-4','TT-4\\1',NULL,10,250000000),('4dd524a4-4032-11e9-91dc-448a5bec6a0c','Bể Cá 1',6,1,1,1,'BC-1','BC-1\\1',NULL,11,50000000),('4dd56de2-4032-11e9-91dc-448a5bec6a0c','Bể Cá 2',6,2,1,1,'BC-2','BC-2\\1',NULL,10,100000000),('4dd57bf6-4032-11e9-91dc-448a5bec6a0c','Bể Cá 3',6,3,1,1,'BC-3','BC-3\\1',NULL,10,400000000),('4dd58a1f-4032-11e9-91dc-448a5bec6a0c','Bể Cá 4',6,4,1,1,'BC-4','BC-4\\1',NULL,10,250000000),('5380cb0f-4034-11e9-91dc-448a5bec6a0c','Bàn Phấn 1',11,1,1,1,'BP-1','BP-1\\1',NULL,11,50000000),('5382b3a0-4034-11e9-91dc-448a5bec6a0c','Bàn Phấn 2',11,2,1,1,'BP-2','BP-2\\1',NULL,10,100000000),('53842363-4034-11e9-91dc-448a5bec6a0c','Bàn Phấn 3',11,3,1,1,'BP-3','BP-3\\1',NULL,10,400000000),('53858eda-4034-11e9-91dc-448a5bec6a0c','Bàn Phấn 4',11,4,1,1,'BP-4','BP-4\\1',NULL,10,250000000),('6bb3f171-4f10-11e9-90ab-20474704b06e','Bàn siêu nhỏ',1,1,1,1,'ASDF-123','','<div>\r\nasdfsdafsvcxzvxzcvqwewqe\r\nsfsdfdsfsdf\r\n</div>',0,99999),('872ad8b0-4035-11e9-91dc-448a5bec6a0c','Bàn Thờ 1',19,1,1,1,'BT-1','BT-1\\1',NULL,11,50000000),('872c8eb1-4035-11e9-91dc-448a5bec6a0c','Bàn Thờ 2',19,2,1,1,'BT-2','BT-2\\1',NULL,10,100000000),('872e4a21-4035-11e9-91dc-448a5bec6a0c','Bàn Thờ 3',19,3,1,1,'BT-3','BT-3\\1',NULL,10,400000000),('872fcea5-4035-11e9-91dc-448a5bec6a0c','Bàn Thờ 4',19,4,1,1,'BT-4','BT-4\\1',NULL,10,250000000),('9a3a8a2e-4032-11e9-91dc-448a5bec6a0c','Tượng 1',7,1,1,1,'T-1','T-1\\1',NULL,11,50000000),('9a3d5fdb-4032-11e9-91dc-448a5bec6a0c','Tượng 2',7,2,1,1,'T-2','T-2\\1',NULL,10,100000000),('9a3eddec-4032-11e9-91dc-448a5bec6a0c','Tượng 3',7,3,1,1,'T-3','T-3\\1',NULL,10,400000000),('9a408637-4032-11e9-91dc-448a5bec6a0c','Tượng 4',7,4,1,1,'T-4','T-4\\1',NULL,10,250000000),('9cd11d25-4035-11e9-91dc-448a5bec6a0c','Câu Đối 1',20,1,1,1,'CĐ-1','CĐ-1\\1',NULL,11,50000000),('9cd3451c-4035-11e9-91dc-448a5bec6a0c','Câu Đối 2',20,2,1,1,'CĐ-2','CĐ-2\\1',NULL,10,100000000),('9cd4c406-4035-11e9-91dc-448a5bec6a0c','Câu Đối 3',20,3,1,1,'CĐ-3','CĐ-3\\1',NULL,10,400000000),('9cd65f2b-4035-11e9-91dc-448a5bec6a0c','Câu Đối 4',20,4,1,1,'CĐ-4','CĐ-4\\1',NULL,10,250000000),('9f223c05-4026-11e9-91dc-448a5bec6a0c','Tủ 1',2,1,1,1,'T-1','T-1\\1',NULL,11,50000000),('9f228430-4026-11e9-91dc-448a5bec6a0c','Tủ 2',2,2,1,1,'T-2','T-2\\1',NULL,10,100000000),('9f2292cc-4026-11e9-91dc-448a5bec6a0c','Tủ 3',2,3,1,1,'T-3','T-3\\1',NULL,10,400000000),('9f22a31f-4026-11e9-91dc-448a5bec6a0c','Tủ 4',2,4,1,1,'T-4','T-4\\1',NULL,10,250000000),('a759ae63-4034-11e9-91dc-448a5bec6a0c','Kệ 1',12,1,1,1,'K-1','K-1\\1',NULL,11,50000000),('a75baece-4034-11e9-91dc-448a5bec6a0c','Kệ 2',12,2,1,1,'K-2','K-2\\1',NULL,10,100000000),('a75d4346-4034-11e9-91dc-448a5bec6a0c','Kệ 3',12,3,1,1,'K-3','K-3\\1',NULL,10,400000000),('a75eb710-4034-11e9-91dc-448a5bec6a0c','Kệ 4',12,4,1,1,'K-4','K-4\\1',NULL,10,250000000),('a763fa4c-4028-11e9-91dc-448a5bec6a0c','Giường 1',3,1,1,1,'G-1','G-1\\1',NULL,11,50000000),('a764153d-4028-11e9-91dc-448a5bec6a0c','Giường 2',3,2,1,1,'G-2','G-2\\1',NULL,10,100000000),('a76423c9-4028-11e9-91dc-448a5bec6a0c','Giường 3',3,3,1,1,'G-3','G-3\\1',NULL,10,400000000),('a7643506-4028-11e9-91dc-448a5bec6a0c','Giường 4',3,4,1,1,'G-4','G-4\\1',NULL,10,250000000),('bc412cf0-3902-11e9-abcb-20474704b06e','Bàn ghế 1',1,1,1,1,'BG-1','BG-1\\1','<p> <i class=\"fa fa-hand-o-right\" aria-hidden=\"true\"></i>Pantry Cashback Offer</p> <ul> <li> Doesn\'t just cover, Truly removes odours </li> <li> Ambi Pur is a brand of air freshener products available in the United States, Europe, Asia and Oceania. </li> <li> Their range of products may be used in the home or in the car with a variety of smells and properties such as odor neutralisation. </li> <li> Transforms your home from smelly to smiley </li> </ul> <p> <i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>All food products are <label>returnable.</label> </p>',11,50000000),('bc423157-3902-11e9-abcb-20474704b06e','Bàn ghế 2',1,2,1,1,'BG-2','BG-2\\1','<p> <i class=\"fa fa-hand-o-right\" aria-hidden=\"true\"></i>This is a <label>Vegetarian</label> product.</p> <ul> <li> Best for Biryani and Pulao. </li> <li> After cooking, Zeeba Basmati rice grains attain an extra ordinary length of upto 2.4 cm/~1 inch. </li> <li> Zeeba Basmati rice adheres to the highest food afety standards as your health is paramount to us. </li> <li> Contains only the best and purest grade of basmati rice grain of Export quality. </li> </ul> <p> <i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>All food products are <label>non-returnable.</label> </p>',10,100000000),('c15c507c-4035-11e9-91dc-448a5bec6a0c','Cửa 1',21,1,1,1,'C-1','C-1\\1',NULL,11,50000000),('c15e5445-4035-11e9-91dc-448a5bec6a0c','Cửa 2',21,2,1,1,'C-2','C-2\\1',NULL,10,100000000),('c15fd478-4035-11e9-91dc-448a5bec6a0c','Cửa 3',21,3,1,1,'C-3','C-3\\1',NULL,10,400000000),('c161d42a-4035-11e9-91dc-448a5bec6a0c','Cửa 4',21,4,1,1,'C-4','C-4\\1',NULL,10,250000000),('c2a0a7a9-4034-11e9-91dc-448a5bec6a0c','Gương 1',13,1,1,1,'G-1','G-1\\1',NULL,11,50000000),('c2a2bec0-4034-11e9-91dc-448a5bec6a0c','Gương 2',13,2,1,1,'G-2','G-2\\1',NULL,10,100000000),('c2a45af0-4034-11e9-91dc-448a5bec6a0c','Gương 3',13,3,1,1,'G-3','G-3\\1',NULL,10,400000000),('c2a5c809-4034-11e9-91dc-448a5bec6a0c','Gương 4',13,4,1,1,'G-4','G-4\\1',NULL,10,250000000),('ccc7f04a-4033-11e9-91dc-448a5bec6a0c','Tủ Bếp 1',9,1,1,1,'TB-1','TB-1\\1',NULL,11,50000000),('d8918393-4032-11e9-91dc-448a5bec6a0c','Bàn Ăn 1',8,1,1,1,'BA-1','BA-1\\1',NULL,11,50000000),('d8933001-4032-11e9-91dc-448a5bec6a0c','Bàn Ăn 2',8,2,1,1,'BA-2','BA-2\\1',NULL,10,100000000),('d894b126-4032-11e9-91dc-448a5bec6a0c','Bàn Ăn 3',8,3,1,1,'BA-3','BA-3\\1',NULL,10,400000000),('d8961043-4032-11e9-91dc-448a5bec6a0c','Bàn Ăn 4',8,4,1,1,'BA-4','BA-4\\1',NULL,10,250000000),('ebdf8077-4028-11e9-91dc-448a5bec6a0c','Đồng Hồ 1',4,1,1,1,'ĐH-1','ĐH-1\\1',NULL,11,50000000),('ebdfc900-4028-11e9-91dc-448a5bec6a0c','Đồng Hồ 2',4,2,1,1,'ĐH-2','ĐH-2\\1',NULL,10,100000000),('ebdfd7a0-4028-11e9-91dc-448a5bec6a0c','Đồng Hồ 3',4,3,1,1,'ĐH-3','ĐH-3\\1',NULL,10,400000000),('ebdfe5e2-4028-11e9-91dc-448a5bec6a0c','Đồng Hồ 4',4,4,1,1,'ĐH-4','ĐH-4\\1',NULL,10,250000000),('f58c7028-4033-11e9-91dc-448a5bec6a0c','Tủ Bếp 2',9,2,1,1,'TB-2','TB-2\\1',NULL,10,100000000),('f58e2a9e-4033-11e9-91dc-448a5bec6a0c','Tủ Bếp 3',9,3,1,1,'TB-3','TB-3\\1',NULL,10,400000000),('f58fa5bc-4033-11e9-91dc-448a5bec6a0c','Tủ Bếp 4',9,4,1,1,'TB-4','TB-4\\1',NULL,10,250000000),('f66e51cc-4034-11e9-91dc-448a5bec6a0c','Bàn 1',14,1,1,1,'B-1','B-1\\1',NULL,11,5000000),('f6702fa7-4034-11e9-91dc-448a5bec6a0c','Bàn 2',14,2,1,1,'B-2','B-2\\1',NULL,10,10000000),('f671de4b-4034-11e9-91dc-448a5bec6a0c','Bàn 3',14,3,1,1,'B-3','B-3\\1',NULL,10,40000000),('f67388c0-4034-11e9-91dc-448a5bec6a0c','Bàn 4',14,4,1,1,'B-4','B-4\\1',NULL,10,25000000),('f84aa177-4034-11e9-91dc-448a5bec6a0c','Ghế 1',15,1,1,1,'G-1','G-1\\1',NULL,11,5000000),('f84cce24-4034-11e9-91dc-448a5bec6a0c','Ghế 2',15,2,1,1,'G-2','G-2\\1',NULL,10,10000000),('f84e4b64-4034-11e9-91dc-448a5bec6a0c','Ghế 3',15,3,1,1,'G-3','G-3\\1',NULL,10,40000000),('f84ff3e8-4034-11e9-91dc-448a5bec6a0c','Ghế 4',15,4,1,1,'G-4','G-4\\1',NULL,10,25000000),('fa4330f6-4035-11e9-91dc-448a5bec6a0c','Khung Tranh 1',22,1,1,1,'KT-1','KT-1\\1',NULL,11,50000000),('fa4538ea-4035-11e9-91dc-448a5bec6a0c','Khung Tranh 2',22,2,1,1,'KT-2','KT-2\\1',NULL,10,100000000),('fa46e858-4035-11e9-91dc-448a5bec6a0c','Khung Tranh 3',22,3,1,1,'KT-3','KT-3\\1',NULL,10,400000000),('fa486e65-4035-11e9-91dc-448a5bec6a0c','Khung Tranh 4',22,4,1,1,'KT-4','KT-4\\1',NULL,10,250000000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `product_BEFORE_INSERT` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
	if new.product_id is null then
		set new.product_id = UUID();
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_name` varchar(45) NOT NULL,
  PRIMARY KEY (`categories_id`),
  UNIQUE KEY `categories_id_UNIQUE` (`categories_id`),
  UNIQUE KEY `categories_name_UNIQUE` (`categories_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (14,'Bàn'),(8,'Bàn Ăn'),(1,'Bàn Ghế'),(10,'Bàn Làm Việc'),(11,'Bàn Phấn'),(19,'Bàn Thờ'),(6,'Bể Cá'),(20,'Câu Đối'),(23,'Cầu Thang'),(21,'Cửa '),(5,'Đồ Thờ'),(4,'Đồng Hồ'),(15,'Ghế'),(3,'Giường'),(13,'Gương'),(12,'Kệ'),(22,'Khung Tranh'),(17,'Phản'),(16,'Sập'),(2,'Tủ'),(9,'Tủ Bếp'),(18,'Tủ Thờ'),(7,'Tượng');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_img`
--

DROP TABLE IF EXISTS `product_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_img` (
  `img_name` varchar(45) NOT NULL,
  `product_product_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`img_name`),
  UNIQUE KEY `img_name_UNIQUE` (`img_name`),
  KEY `fk_product_img_product1_idx` (`product_product_id`),
  CONSTRAINT `fk_product_img_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_img`
--

LOCK TABLES `product_img` WRITE;
/*!40000 ALTER TABLE `product_img` DISABLE KEYS */;
INSERT INTO `product_img` VALUES ('product/20190224_122832.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('product/20190224_122848.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('product/20190224_122938.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('product/20190224_122941.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('product/20190224_122954.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('se1.jpg','bc412cf0-3902-11e9-abcb-20474704b06e'),('se2.jpg','bc412cf0-3902-11e9-abcb-20474704b06e'),('se3.jpg','bc412cf0-3902-11e9-abcb-20474704b06e'),('si.jpg','bc423157-3902-11e9-abcb-20474704b06e'),('si2.jpg','bc423157-3902-11e9-abcb-20474704b06e'),('si3.jpg','bc423157-3902-11e9-abcb-20474704b06e');
/*!40000 ALTER TABLE `product_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_material`
--

DROP TABLE IF EXISTS `product_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(45) NOT NULL,
  PRIMARY KEY (`material_id`),
  UNIQUE KEY `material_name_UNIQUE` (`material_name`),
  UNIQUE KEY `material_id_UNIQUE` (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_material`
--

LOCK TABLES `product_material` WRITE;
/*!40000 ALTER TABLE `product_material` DISABLE KEYS */;
INSERT INTO `product_material` VALUES (3,'Gỗ Cẩm lai'),(5,'Gỗ Chắc'),(1,'Gỗ Gụ'),(2,'Gỗ Hương'),(4,'Gỗ Mun');
/*!40000 ALTER TABLE `product_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_origin`
--

DROP TABLE IF EXISTS `product_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_origin` (
  `origin_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(45) NOT NULL,
  PRIMARY KEY (`origin_id`),
  UNIQUE KEY `origin_id_UNIQUE` (`origin_id`),
  UNIQUE KEY `origin_name_UNIQUE` (`origin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_origin`
--

LOCK TABLES `product_origin` WRITE;
/*!40000 ALTER TABLE `product_origin` DISABLE KEYS */;
INSERT INTO `product_origin` VALUES (1,'Thủy Hằng');
/*!40000 ALTER TABLE `product_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_room`
--

DROP TABLE IF EXISTS `product_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(45) NOT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_id_UNIQUE` (`room_id`),
  UNIQUE KEY `room_name_UNIQUE` (`room_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_room`
--

LOCK TABLES `product_room` WRITE;
/*!40000 ALTER TABLE `product_room` DISABLE KEYS */;
INSERT INTO `product_room` VALUES (3,'Phòng ăn'),(1,'Phòng khách'),(2,'Phòng làm việc'),(5,'Phòng ngủ'),(4,'Phòng thờ');
/*!40000 ALTER TABLE `product_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` varchar(36) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `recovery_code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_bin_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_user_role1_idx` (`user_role_id`),
  CONSTRAINT `fk_user_user_role1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('37ee6ada-52f6-11e9-90ab-20474704b06e','user2','test','user2@gmail.com',2,'111111','123123123',NULL),('defe4bf4-38cc-11e9-97d5-20474704b06e','admin1','123123','admin1@gmail.com',1,'aaaaa','091234567','test_recovery_code'),('defeae12-38cc-11e9-97d5-20474704b06e','admin2','123456','admin2@gmail.com',1,'asdf','09111111',NULL),('defec356-38cc-11e9-97d5-20474704b06e','user1','12341234','user1@gmail.com',2,'sdafdsaf','123456789',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
	if new.user_id is null then
		set new.user_id = UUID();
        end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'webbanhang'
--

--
-- Dumping routines for database 'webbanhang'
--

--
-- Current Database: `webbanhangtest`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `webbanhangtest` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `webbanhangtest`;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `message_id` varchar(36) NOT NULL,
  `subject` text,
  `message` text,
  `sender_name` varchar(45) DEFAULT NULL,
  `sender_email` varchar(45) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_id_UNIQUE` (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES ('42081ee5-4ec6-11e9-90ab-20474704b06e','This is also a test message','huheuhuhuhuh','Kien Nguyen','f.kien1997@gmail.com','2019-03-25 13:21:42'),('9718390d-4d7f-11e9-90ab-20474704b06e','ASDF','This is an example message\r\nsdajflsafdslkafjlkdsajfkldsaf','dante','asd@example.com','2019-03-23 22:23:20');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `message_BEFORE_INSERT` BEFORE INSERT ON `message` FOR EACH ROW BEGIN
		if new.message_id is null then
		set new.message_id = UUID();
        end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `order_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `order_date` datetime DEFAULT NULL,
  `user_address` varchar(100) DEFAULT NULL,
  `user_phone` varchar(12) DEFAULT NULL,
  `user_email` varchar(45) DEFAULT NULL,
  `order_status_id` int(11) NOT NULL DEFAULT '1',
  `validation_code` varchar(36) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user1_idx` (`user_id`),
  KEY `fk_order_order_status_idx` (`order_status_id`),
  KEY `fk_order_payment_method_id_idx` (`payment_method_id`),
  CONSTRAINT `fk_order_order_status` FOREIGN KEY (`order_status_id`) REFERENCES `order_status` (`order_status_id`),
  CONSTRAINT `fk_order_payment_method_id` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`payment_method_id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES ('2c90a6c6-5096-11e9-90ab-20474704b06e','defec356-38cc-11e9-97d5-20474704b06e','2019-03-27 20:42:47','Số 1, ngách 178/30. phố Tây Sơn, quận Đống Đa, Hà Nội','123456789','kienntse04792@fpt.edu.vn',2,'2c90aa99-5096-11e9-90ab-20474704b06e',2),('7784c643-4be6-11e9-90ab-20474704b06e',NULL,'2019-03-21 21:34:43','1, 178/30 Alley, Tay Son Street','973118854','test@fpt.edu.vn',2,'7784c723-4be6-11e9-90ab-20474704b06e',1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_BEFORE_INSERT` BEFORE INSERT ON `order` FOR EACH ROW BEGIN
if new.order_id is null then
		set new.order_id = UUID();
    end if;
if new.validation_code is null then
		set new.validation_code = UUID();
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_detail` (
  `product_id` varchar(36) NOT NULL,
  `order_id` varchar(36) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `total` int(11) GENERATED ALWAYS AS ((`quantity` * `price`)) VIRTUAL,
  PRIMARY KEY (`product_id`,`order_id`),
  KEY `fk_order_detail_order1_idx` (`order_id`),
  CONSTRAINT `fk_order_detail_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  CONSTRAINT `fk_order_detail_product1` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` (`product_id`, `order_id`, `quantity`, `price`) VALUES ('1457473f-4036-11e9-91dc-448a5bec6a0c','2c90a6c6-5096-11e9-90ab-20474704b06e',1,50000000),('1459461b-4036-11e9-91dc-448a5bec6a0c','2c90a6c6-5096-11e9-90ab-20474704b06e',1,100000000),('1459461b-4036-11e9-91dc-448a5bec6a0c','7784c643-4be6-11e9-90ab-20474704b06e',1,100000000),('145b39d6-4036-11e9-91dc-448a5bec6a0c','2c90a6c6-5096-11e9-90ab-20474704b06e',1,400000000);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_status_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'Unverified'),(2,'Verified'),(3,'Completed');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `payment_method` (
  `payment_method_id` int(11) NOT NULL AUTO_INCREMENT,
  `payment_method_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,'cod'),(2,'cash');
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `product_id` varchar(36) NOT NULL,
  `product_name` varchar(45) NOT NULL,
  `product_categories_id` int(11) NOT NULL DEFAULT '1',
  `product_material_id` int(11) NOT NULL DEFAULT '1',
  `product_origin_id` int(11) NOT NULL DEFAULT '1',
  `product_room_id` int(11) NOT NULL DEFAULT '1',
  `product_code` varchar(45) NOT NULL DEFAULT '0000',
  `thumbnail` varchar(45) DEFAULT NULL,
  `description` text,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_bin_UNIQUE` (`product_id`) /*!80000 INVISIBLE */,
  KEY `fk_product_material_idx` (`product_material_id`),
  KEY `fk_product_origin1_idx` (`product_origin_id`),
  KEY `fk_product_categories` (`product_categories_id`),
  KEY `fk_product_room_idx` (`product_room_id`),
  CONSTRAINT `fk_product_categories` FOREIGN KEY (`product_categories_id`) REFERENCES `product_categories` (`categories_id`),
  CONSTRAINT `fk_product_material` FOREIGN KEY (`product_material_id`) REFERENCES `product_material` (`material_id`),
  CONSTRAINT `fk_product_origin` FOREIGN KEY (`product_origin_id`) REFERENCES `product_origin` (`origin_id`),
  CONSTRAINT `fk_product_room` FOREIGN KEY (`product_room_id`) REFERENCES `product_room` (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1457473f-4036-11e9-91dc-448a5bec6a0c','Thang Bộ 1',2,1,1,1,'CT-1','2019-03-16_19-41-32.png','',123,50000000),('1459461b-4036-11e9-91dc-448a5bec6a0c','Cầu Thang 2',23,2,1,1,'CT-2','CT-2\\1',NULL,10,100000000),('145b39d6-4036-11e9-91dc-448a5bec6a0c','Cầu Thang 3',23,3,1,1,'CT-3','CT-3\\1',NULL,10,400000000),('145d3537-4036-11e9-91dc-448a5bec6a0c','Cầu Thang 4',23,4,1,1,'CT-4','CT-4\\1',NULL,10,250000000),('15682b00-4032-11e9-91dc-448a5bec6a0c','Đồ Thờ 1',5,1,1,1,'ĐT-1','ĐT-1\\1',NULL,11,5000000),('15689754-4032-11e9-91dc-448a5bec6a0c','Đồ Thờ 2',5,2,1,1,'ĐT-2','ĐT-2\\1',NULL,10,10000000),('1568a513-4032-11e9-91dc-448a5bec6a0c','Đồ Thờ 3',5,3,1,1,'ĐT-3','ĐT-3\\1',NULL,10,40000000),('1568b2d1-4032-11e9-91dc-448a5bec6a0c','Đồ Thờ 4',5,4,1,1,'ĐT-4','ĐT-4\\1',NULL,10,25000000),('1ed01e11-4035-11e9-91dc-448a5bec6a0c','Sập 1',16,1,1,1,'S-1','S-1\\1',NULL,11,50000000),('1ed1cf57-4035-11e9-91dc-448a5bec6a0c','Sập 2',16,2,1,1,'S-2','S-2\\1',NULL,10,100000000),('1ed34e0c-4035-11e9-91dc-448a5bec6a0c','Sập 3',16,3,1,1,'S-3','S-3\\1',NULL,10,400000000),('1ed4ce58-4035-11e9-91dc-448a5bec6a0c','Sập 4',16,4,1,1,'S-4','S-4\\1',NULL,10,250000000),('2b1bfb15-4034-11e9-91dc-448a5bec6a0c','Bàn Làm Việc 1',10,1,1,1,'BLV-1','BLV-1\\1',NULL,11,5000000),('2b1dc37b-4034-11e9-91dc-448a5bec6a0c','Bàn Làm Việc 2',10,2,1,1,'BLV-2','BLV-2\\1',NULL,10,10000000),('2b1f5a88-4034-11e9-91dc-448a5bec6a0c','Bàn Làm Việc 3',10,3,1,1,'BLV-3','BLV-3\\1',NULL,10,40000000),('2b20e71d-4034-11e9-91dc-448a5bec6a0c','Bàn Làm Việc 4',10,4,1,1,'BLV-4','BLV-4\\1',NULL,10,25000000),('35fb14b1-4035-11e9-91dc-448a5bec6a0c','Phản 1',17,1,1,1,'P-1','P-1\\1',NULL,11,50000000),('35fd65de-4035-11e9-91dc-448a5bec6a0c','Phản 2',17,2,1,1,'P-2','P-2\\1',NULL,10,100000000),('35fee575-4035-11e9-91dc-448a5bec6a0c','Phản 3',17,3,1,1,'P-3','P-3\\1',NULL,10,400000000),('36005e1b-4035-11e9-91dc-448a5bec6a0c','Phản 4',17,4,1,1,'P-4','P-4\\1',NULL,10,250000000),('3c9741ae-4026-11e9-91dc-448a5bec6a0c','Bàn ghế 3',1,3,1,1,'BG-3','BG-3\\1',NULL,10,400000000),('3c977afb-4026-11e9-91dc-448a5bec6a0c','Bàn ghế 4',1,4,1,1,'BG-4','BG-4\\1',NULL,10,250000000),('4a8966d4-4035-11e9-91dc-448a5bec6a0c','Tủ Thờ 1',18,1,1,1,'TT-1','TT-1\\1',NULL,11,50000000),('4a8b8b50-4035-11e9-91dc-448a5bec6a0c','Tủ Thờ 2',18,2,1,1,'TT-2','TT-2\\1',NULL,10,100000000),('4a8d1088-4035-11e9-91dc-448a5bec6a0c','Tủ Thờ 3',18,3,1,1,'TT-3','TT-3\\1',NULL,10,400000000),('4a8eb610-4035-11e9-91dc-448a5bec6a0c','Tủ Thờ 4',18,4,1,1,'TT-4','TT-4\\1',NULL,10,250000000),('4dd524a4-4032-11e9-91dc-448a5bec6a0c','Bể Cá 1',6,1,1,1,'BC-1','BC-1\\1',NULL,11,50000000),('4dd56de2-4032-11e9-91dc-448a5bec6a0c','Bể Cá 2',6,2,1,1,'BC-2','BC-2\\1',NULL,10,100000000),('4dd57bf6-4032-11e9-91dc-448a5bec6a0c','Bể Cá 3',6,3,1,1,'BC-3','BC-3\\1',NULL,10,400000000),('4dd58a1f-4032-11e9-91dc-448a5bec6a0c','Bể Cá 4',6,4,1,1,'BC-4','BC-4\\1',NULL,10,250000000),('5380cb0f-4034-11e9-91dc-448a5bec6a0c','Bàn Phấn 1',11,1,1,1,'BP-1','BP-1\\1',NULL,11,50000000),('5382b3a0-4034-11e9-91dc-448a5bec6a0c','Bàn Phấn 2',11,2,1,1,'BP-2','BP-2\\1',NULL,10,100000000),('53842363-4034-11e9-91dc-448a5bec6a0c','Bàn Phấn 3',11,3,1,1,'BP-3','BP-3\\1',NULL,10,400000000),('53858eda-4034-11e9-91dc-448a5bec6a0c','Bàn Phấn 4',11,4,1,1,'BP-4','BP-4\\1',NULL,10,250000000),('6bb3f171-4f10-11e9-90ab-20474704b06e','Bàn siêu nhỏ',1,1,1,1,'ASDF-123','','<div>\r\nasdfsdafsvcxzvxzcvqwewqe\r\nsfsdfdsfsdf\r\n</div>',0,99999),('872ad8b0-4035-11e9-91dc-448a5bec6a0c','Bàn Thờ 1',19,1,1,1,'BT-1','BT-1\\1',NULL,11,50000000),('872c8eb1-4035-11e9-91dc-448a5bec6a0c','Bàn Thờ 2',19,2,1,1,'BT-2','BT-2\\1',NULL,10,100000000),('872e4a21-4035-11e9-91dc-448a5bec6a0c','Bàn Thờ 3',19,3,1,1,'BT-3','BT-3\\1',NULL,10,400000000),('872fcea5-4035-11e9-91dc-448a5bec6a0c','Bàn Thờ 4',19,4,1,1,'BT-4','BT-4\\1',NULL,10,250000000),('9a3a8a2e-4032-11e9-91dc-448a5bec6a0c','Tượng 1',7,1,1,1,'T-1','T-1\\1',NULL,11,50000000),('9a3d5fdb-4032-11e9-91dc-448a5bec6a0c','Tượng 2',7,2,1,1,'T-2','T-2\\1',NULL,10,100000000),('9a3eddec-4032-11e9-91dc-448a5bec6a0c','Tượng 3',7,3,1,1,'T-3','T-3\\1',NULL,10,400000000),('9a408637-4032-11e9-91dc-448a5bec6a0c','Tượng 4',7,4,1,1,'T-4','T-4\\1',NULL,10,250000000),('9cd11d25-4035-11e9-91dc-448a5bec6a0c','Câu Đối 1',20,1,1,1,'CĐ-1','CĐ-1\\1',NULL,11,50000000),('9cd3451c-4035-11e9-91dc-448a5bec6a0c','Câu Đối 2',20,2,1,1,'CĐ-2','CĐ-2\\1',NULL,10,100000000),('9cd4c406-4035-11e9-91dc-448a5bec6a0c','Câu Đối 3',20,3,1,1,'CĐ-3','CĐ-3\\1',NULL,10,400000000),('9cd65f2b-4035-11e9-91dc-448a5bec6a0c','Câu Đối 4',20,4,1,1,'CĐ-4','CĐ-4\\1',NULL,10,250000000),('9f223c05-4026-11e9-91dc-448a5bec6a0c','Tủ 1',2,1,1,1,'T-1','T-1\\1',NULL,11,50000000),('9f228430-4026-11e9-91dc-448a5bec6a0c','Tủ 2',2,2,1,1,'T-2','T-2\\1',NULL,10,100000000),('9f2292cc-4026-11e9-91dc-448a5bec6a0c','Tủ 3',2,3,1,1,'T-3','T-3\\1',NULL,10,400000000),('9f22a31f-4026-11e9-91dc-448a5bec6a0c','Tủ 4',2,4,1,1,'T-4','T-4\\1',NULL,10,250000000),('a759ae63-4034-11e9-91dc-448a5bec6a0c','Kệ 1',12,1,1,1,'K-1','K-1\\1',NULL,11,50000000),('a75baece-4034-11e9-91dc-448a5bec6a0c','Kệ 2',12,2,1,1,'K-2','K-2\\1',NULL,10,100000000),('a75d4346-4034-11e9-91dc-448a5bec6a0c','Kệ 3',12,3,1,1,'K-3','K-3\\1',NULL,10,400000000),('a75eb710-4034-11e9-91dc-448a5bec6a0c','Kệ 4',12,4,1,1,'K-4','K-4\\1',NULL,10,250000000),('a763fa4c-4028-11e9-91dc-448a5bec6a0c','Giường 1',3,1,1,1,'G-1','G-1\\1',NULL,11,50000000),('a764153d-4028-11e9-91dc-448a5bec6a0c','Giường 2',3,2,1,1,'G-2','G-2\\1',NULL,10,100000000),('a76423c9-4028-11e9-91dc-448a5bec6a0c','Giường 3',3,3,1,1,'G-3','G-3\\1',NULL,10,400000000),('a7643506-4028-11e9-91dc-448a5bec6a0c','Giường 4',3,4,1,1,'G-4','G-4\\1',NULL,10,250000000),('bc412cf0-3902-11e9-abcb-20474704b06e','Bàn ghế 1',1,1,1,1,'BG-1','BG-1\\1','<p> <i class=\"fa fa-hand-o-right\" aria-hidden=\"true\"></i>Pantry Cashback Offer</p> <ul> <li> Doesn\'t just cover, Truly removes odours </li> <li> Ambi Pur is a brand of air freshener products available in the United States, Europe, Asia and Oceania. </li> <li> Their range of products may be used in the home or in the car with a variety of smells and properties such as odor neutralisation. </li> <li> Transforms your home from smelly to smiley </li> </ul> <p> <i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>All food products are <label>returnable.</label> </p>',11,50000000),('bc423157-3902-11e9-abcb-20474704b06e','Bàn ghế 2',1,2,1,1,'BG-2','BG-2\\1','<p> <i class=\"fa fa-hand-o-right\" aria-hidden=\"true\"></i>This is a <label>Vegetarian</label> product.</p> <ul> <li> Best for Biryani and Pulao. </li> <li> After cooking, Zeeba Basmati rice grains attain an extra ordinary length of upto 2.4 cm/~1 inch. </li> <li> Zeeba Basmati rice adheres to the highest food afety standards as your health is paramount to us. </li> <li> Contains only the best and purest grade of basmati rice grain of Export quality. </li> </ul> <p> <i class=\"fa fa-refresh\" aria-hidden=\"true\"></i>All food products are <label>non-returnable.</label> </p>',10,100000000),('c15c507c-4035-11e9-91dc-448a5bec6a0c','Cửa 1',21,1,1,1,'C-1','C-1\\1',NULL,11,50000000),('c15e5445-4035-11e9-91dc-448a5bec6a0c','Cửa 2',21,2,1,1,'C-2','C-2\\1',NULL,10,100000000),('c15fd478-4035-11e9-91dc-448a5bec6a0c','Cửa 3',21,3,1,1,'C-3','C-3\\1',NULL,10,400000000),('c161d42a-4035-11e9-91dc-448a5bec6a0c','Cửa 4',21,4,1,1,'C-4','C-4\\1',NULL,10,250000000),('c2a0a7a9-4034-11e9-91dc-448a5bec6a0c','Gương 1',13,1,1,1,'G-1','G-1\\1',NULL,11,50000000),('c2a2bec0-4034-11e9-91dc-448a5bec6a0c','Gương 2',13,2,1,1,'G-2','G-2\\1',NULL,10,100000000),('c2a45af0-4034-11e9-91dc-448a5bec6a0c','Gương 3',13,3,1,1,'G-3','G-3\\1',NULL,10,400000000),('c2a5c809-4034-11e9-91dc-448a5bec6a0c','Gương 4',13,4,1,1,'G-4','G-4\\1',NULL,10,250000000),('ccc7f04a-4033-11e9-91dc-448a5bec6a0c','Tủ Bếp 1',9,1,1,1,'TB-1','TB-1\\1',NULL,11,50000000),('d8918393-4032-11e9-91dc-448a5bec6a0c','Bàn Ăn 1',8,1,1,1,'BA-1','BA-1\\1',NULL,11,50000000),('d8933001-4032-11e9-91dc-448a5bec6a0c','Bàn Ăn 2',8,2,1,1,'BA-2','BA-2\\1',NULL,10,100000000),('d894b126-4032-11e9-91dc-448a5bec6a0c','Bàn Ăn 3',8,3,1,1,'BA-3','BA-3\\1',NULL,10,400000000),('d8961043-4032-11e9-91dc-448a5bec6a0c','Bàn Ăn 4',8,4,1,1,'BA-4','BA-4\\1',NULL,10,250000000),('ebdf8077-4028-11e9-91dc-448a5bec6a0c','Đồng Hồ 1',4,1,1,1,'ĐH-1','ĐH-1\\1',NULL,11,50000000),('ebdfc900-4028-11e9-91dc-448a5bec6a0c','Đồng Hồ 2',4,2,1,1,'ĐH-2','ĐH-2\\1',NULL,10,100000000),('ebdfd7a0-4028-11e9-91dc-448a5bec6a0c','Đồng Hồ 3',4,3,1,1,'ĐH-3','ĐH-3\\1',NULL,10,400000000),('ebdfe5e2-4028-11e9-91dc-448a5bec6a0c','Đồng Hồ 4',4,4,1,1,'ĐH-4','ĐH-4\\1',NULL,10,250000000),('f58c7028-4033-11e9-91dc-448a5bec6a0c','Tủ Bếp 2',9,2,1,1,'TB-2','TB-2\\1',NULL,10,100000000),('f58e2a9e-4033-11e9-91dc-448a5bec6a0c','Tủ Bếp 3',9,3,1,1,'TB-3','TB-3\\1',NULL,10,400000000),('f58fa5bc-4033-11e9-91dc-448a5bec6a0c','Tủ Bếp 4',9,4,1,1,'TB-4','TB-4\\1',NULL,10,250000000),('f66e51cc-4034-11e9-91dc-448a5bec6a0c','Bàn 1',14,1,1,1,'B-1','B-1\\1',NULL,11,5000000),('f6702fa7-4034-11e9-91dc-448a5bec6a0c','Bàn 2',14,2,1,1,'B-2','B-2\\1',NULL,10,10000000),('f671de4b-4034-11e9-91dc-448a5bec6a0c','Bàn 3',14,3,1,1,'B-3','B-3\\1',NULL,10,40000000),('f67388c0-4034-11e9-91dc-448a5bec6a0c','Bàn 4',14,4,1,1,'B-4','B-4\\1',NULL,10,25000000),('f84aa177-4034-11e9-91dc-448a5bec6a0c','Ghế 1',15,1,1,1,'G-1','G-1\\1',NULL,11,5000000),('f84cce24-4034-11e9-91dc-448a5bec6a0c','Ghế 2',15,2,1,1,'G-2','G-2\\1',NULL,10,10000000),('f84e4b64-4034-11e9-91dc-448a5bec6a0c','Ghế 3',15,3,1,1,'G-3','G-3\\1',NULL,10,40000000),('f84ff3e8-4034-11e9-91dc-448a5bec6a0c','Ghế 4',15,4,1,1,'G-4','G-4\\1',NULL,10,25000000),('fa4330f6-4035-11e9-91dc-448a5bec6a0c','Khung Tranh 1',22,1,1,1,'KT-1','KT-1\\1',NULL,11,50000000),('fa4538ea-4035-11e9-91dc-448a5bec6a0c','Khung Tranh 2',22,2,1,1,'KT-2','KT-2\\1',NULL,10,100000000),('fa46e858-4035-11e9-91dc-448a5bec6a0c','Khung Tranh 3',22,3,1,1,'KT-3','KT-3\\1',NULL,10,400000000),('fa486e65-4035-11e9-91dc-448a5bec6a0c','Khung Tranh 4',22,4,1,1,'KT-4','KT-4\\1',NULL,10,250000000);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `product_BEFORE_INSERT` BEFORE INSERT ON `product` FOR EACH ROW BEGIN
	if new.product_id is null then
		set new.product_id = UUID();
    end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `product_categories`
--

DROP TABLE IF EXISTS `product_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_categories` (
  `categories_id` int(11) NOT NULL AUTO_INCREMENT,
  `categories_name` varchar(45) NOT NULL,
  PRIMARY KEY (`categories_id`),
  UNIQUE KEY `categories_id_UNIQUE` (`categories_id`),
  UNIQUE KEY `categories_name_UNIQUE` (`categories_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_categories`
--

LOCK TABLES `product_categories` WRITE;
/*!40000 ALTER TABLE `product_categories` DISABLE KEYS */;
INSERT INTO `product_categories` VALUES (14,'Bàn'),(8,'Bàn Ăn'),(1,'Bàn Ghế'),(10,'Bàn Làm Việc'),(11,'Bàn Phấn'),(19,'Bàn Thờ'),(6,'Bể Cá'),(20,'Câu Đối'),(23,'Cầu Thang'),(21,'Cửa '),(5,'Đồ Thờ'),(4,'Đồng Hồ'),(15,'Ghế'),(3,'Giường'),(13,'Gương'),(12,'Kệ'),(22,'Khung Tranh'),(17,'Phản'),(16,'Sập'),(2,'Tủ'),(9,'Tủ Bếp'),(18,'Tủ Thờ'),(7,'Tượng');
/*!40000 ALTER TABLE `product_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_img`
--

DROP TABLE IF EXISTS `product_img`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_img` (
  `img_name` varchar(45) NOT NULL,
  `product_product_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`img_name`),
  UNIQUE KEY `img_name_UNIQUE` (`img_name`),
  KEY `fk_product_img_product1_idx` (`product_product_id`),
  CONSTRAINT `fk_product_img_product1` FOREIGN KEY (`product_product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_img`
--

LOCK TABLES `product_img` WRITE;
/*!40000 ALTER TABLE `product_img` DISABLE KEYS */;
INSERT INTO `product_img` VALUES ('product/20190224_122832.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('product/20190224_122848.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('product/20190224_122938.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('product/20190224_122941.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('product/20190224_122954.jpg','1457473f-4036-11e9-91dc-448a5bec6a0c'),('se1.jpg','bc412cf0-3902-11e9-abcb-20474704b06e'),('se2.jpg','bc412cf0-3902-11e9-abcb-20474704b06e'),('se3.jpg','bc412cf0-3902-11e9-abcb-20474704b06e'),('si.jpg','bc423157-3902-11e9-abcb-20474704b06e'),('si2.jpg','bc423157-3902-11e9-abcb-20474704b06e'),('si3.jpg','bc423157-3902-11e9-abcb-20474704b06e');
/*!40000 ALTER TABLE `product_img` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_material`
--

DROP TABLE IF EXISTS `product_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `material_name` varchar(45) NOT NULL,
  PRIMARY KEY (`material_id`),
  UNIQUE KEY `material_name_UNIQUE` (`material_name`),
  UNIQUE KEY `material_id_UNIQUE` (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_material`
--

LOCK TABLES `product_material` WRITE;
/*!40000 ALTER TABLE `product_material` DISABLE KEYS */;
INSERT INTO `product_material` VALUES (3,'Gỗ Cẩm lai'),(5,'Gỗ Chắc'),(1,'Gỗ Gụ'),(2,'Gỗ Hương'),(4,'Gỗ Mun');
/*!40000 ALTER TABLE `product_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_origin`
--

DROP TABLE IF EXISTS `product_origin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_origin` (
  `origin_id` int(11) NOT NULL AUTO_INCREMENT,
  `origin_name` varchar(45) NOT NULL,
  PRIMARY KEY (`origin_id`),
  UNIQUE KEY `origin_id_UNIQUE` (`origin_id`),
  UNIQUE KEY `origin_name_UNIQUE` (`origin_name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_origin`
--

LOCK TABLES `product_origin` WRITE;
/*!40000 ALTER TABLE `product_origin` DISABLE KEYS */;
INSERT INTO `product_origin` VALUES (1,'Thủy Hằng');
/*!40000 ALTER TABLE `product_origin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_room`
--

DROP TABLE IF EXISTS `product_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product_room` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(45) NOT NULL,
  PRIMARY KEY (`room_id`),
  UNIQUE KEY `room_id_UNIQUE` (`room_id`),
  UNIQUE KEY `room_name_UNIQUE` (`room_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_room`
--

LOCK TABLES `product_room` WRITE;
/*!40000 ALTER TABLE `product_room` DISABLE KEYS */;
INSERT INTO `product_room` VALUES (3,'Phòng ăn'),(1,'Phòng khách'),(2,'Phòng làm việc'),(5,'Phòng ngủ'),(4,'Phòng thờ');
/*!40000 ALTER TABLE `product_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` varchar(36) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(45) NOT NULL,
  `user_role_id` int(11) NOT NULL,
  `address` varchar(100) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `recovery_code` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_bin_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_user_role1_idx` (`user_role_id`),
  CONSTRAINT `fk_user_user_role1` FOREIGN KEY (`user_role_id`) REFERENCES `user_role` (`user_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('37ee6ada-52f6-11e9-90ab-20474704b06e','user2','test','user2@gmail.com',2,'111111','123123123',NULL),('defe4bf4-38cc-11e9-97d5-20474704b06e','admin1','123123','admin1@gmail.com',1,'aaaaa','091234567','test_recovery_code'),('defeae12-38cc-11e9-97d5-20474704b06e','admin2','123456','admin2@gmail.com',1,'asdf','09111111',NULL),('defec356-38cc-11e9-97d5-20474704b06e','user1','12341234','user1@gmail.com',2,'sdafdsaf','123456789',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW BEGIN
	if new.user_id is null then
		set new.user_id = UUID();
        end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_role` (
  `user_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`user_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'webbanhangtest'
--

--
-- Dumping routines for database 'webbanhangtest'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-12 14:56:34
