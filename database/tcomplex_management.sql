CREATE DATABASE  IF NOT EXISTS `tcomplex_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tcomplex_management`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tcomplex_management
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `matbang`
--

DROP TABLE IF EXISTS `matbang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matbang` (
  `ma_mat_bang` varchar(10) NOT NULL,
  `trang_thai` varchar(20) NOT NULL,
  `dien_tich` double NOT NULL,
  `tang` int NOT NULL,
  `loai_mat_bang` varchar(50) NOT NULL,
  `gia_tien` double NOT NULL,
  `ngay_bat_dau` date NOT NULL,
  `ngay_ket_thuc` date NOT NULL,
  PRIMARY KEY (`ma_mat_bang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matbang`
--

LOCK TABLES `matbang` WRITE;
/*!40000 ALTER TABLE `matbang` DISABLE KEYS */;
INSERT INTO `matbang` VALUES ('123-22-22','Đầy đủ',31,12,'Văn phòng trọn gói',23213213131,'2026-04-29','2027-02-24'),('ABC-12-34','Trống',50.5,5,'Văn phòng trọn gói',15000000,'2026-01-01','2026-12-31'),('MB2-05-10','Hạ tầng',120.5,5,'Văn phòng trọn gói',45000000,'2026-06-15','2027-01-01'),('MB3-10-02','Đầy đủ',30,10,'Văn phòng chia sẻ',12000000,'2026-01-10','2026-08-15'),('MB4-02-05','Trống',45.5,2,'Văn phòng trọn gói',20000000,'2026-02-01','2026-09-01'),('MB5-15-01','Hạ tầng',200,15,'Văn phòng trọn gói',80000000,'2026-03-01','2026-10-01');
/*!40000 ALTER TABLE `matbang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tcomplex_management'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-29 19:50:23
