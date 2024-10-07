CREATE DATABASE  IF NOT EXISTS `barberexpress` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `barberexpress`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: barberexpress
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `barbershop_id` int(20) NOT NULL,
  `people_id` int(20) NOT NULL,
  `service_id` int(20) NOT NULL,
  `barber_id` int(20) NOT NULL,
  `date` datetime NOT NULL,
  `status` enum('pending','confirmed','cancelled','completed') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `barbershop_id` (`barbershop_id`),
  KEY `people_id` (`people_id`),
  KEY `service_id` (`service_id`),
  KEY `barber_id` (`barber_id`),
  CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`barbershop_id`) REFERENCES `barbershop` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE,
  CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,1,1,1,1,'2024-10-06 10:00:00','confirmed','2024-10-07 02:37:35'),(2,2,2,2,2,'2024-10-07 11:00:00','completed','2024-10-07 02:37:35'),(3,3,3,3,3,'2024-10-08 12:00:00','pending','2024-10-07 02:37:35'),(4,4,4,4,4,'2024-10-09 13:00:00','cancelled','2024-10-07 02:37:35'),(5,5,5,5,5,'2024-10-10 14:00:00','confirmed','2024-10-07 02:37:35');
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `banks`
--

DROP TABLE IF EXISTS `banks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `banks` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` enum('BANCOLOMBIA','NEQUI','LULOBANK','DAVIDPLATA') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banks`
--

LOCK TABLES `banks` WRITE;
/*!40000 ALTER TABLE `banks` DISABLE KEYS */;
INSERT INTO `banks` VALUES (1,'BANCOLOMBIA'),(2,'NEQUI'),(3,'LULOBANK'),(4,'DAVIDPLATA');
/*!40000 ALTER TABLE `banks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barber_accounts`
--

DROP TABLE IF EXISTS `barber_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barber_accounts` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `barber_id` int(20) NOT NULL,
  `bank_id` int(20) NOT NULL,
  `account_number` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `barber_id` (`barber_id`),
  KEY `bank_id` (`bank_id`),
  CONSTRAINT `barber_accounts_ibfk_1` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barber_accounts_ibfk_2` FOREIGN KEY (`bank_id`) REFERENCES `banks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barber_accounts`
--

LOCK TABLES `barber_accounts` WRITE;
/*!40000 ALTER TABLE `barber_accounts` DISABLE KEYS */;
INSERT INTO `barber_accounts` VALUES (1,1,1,'1234567890','2024-10-07 02:37:35'),(2,2,2,'2345678901','2024-10-07 02:37:35'),(3,3,3,'3456789012','2024-10-07 02:37:35'),(4,4,4,'4567890123','2024-10-07 02:37:35'),(5,5,1,'5678901234','2024-10-07 02:37:35');
/*!40000 ALTER TABLE `barber_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barbers`
--

DROP TABLE IF EXISTS `barbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barbers` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `barbershop_id` int(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `profile_picture` varchar(100) NOT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `barbershop_id` (`barbershop_id`),
  CONSTRAINT `barbers_ibfk_1` FOREIGN KEY (`barbershop_id`) REFERENCES `barbershop` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barbers`
--

LOCK TABLES `barbers` WRITE;
/*!40000 ALTER TABLE `barbers` DISABLE KEYS */;
INSERT INTO `barbers` VALUES (1,1,'Pedro Torres','https://example.com/barber1.jpg',1),(2,2,'Miguel Sánchez','https://example.com/barber2.jpg',1),(3,3,'Jorge Ramírez','https://example.com/barber3.jpg',1),(4,4,'Oscar Díaz','https://example.com/barber4.jpg',1),(5,5,'Fernando Mendoza','https://example.com/barber5.jpg',1);
/*!40000 ALTER TABLE `barbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barbershop`
--

DROP TABLE IF EXISTS `barbershop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barbershop` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `people_id` int(20) NOT NULL,
  `location_id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `people_id` (`people_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `barbershop_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `barbershop_ibfk_2` FOREIGN KEY (`location_id`) REFERENCES `people_location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barbershop`
--

LOCK TABLES `barbershop` WRITE;
/*!40000 ALTER TABLE `barbershop` DISABLE KEYS */;
INSERT INTO `barbershop` VALUES (1,2,2,'Carlos Barbershop','A professional barbershop located in Medellín.','2024-10-07 02:37:35'),(2,5,5,'Luis Cuts','Expert haircuts and grooming in Cartagena.','2024-10-07 02:37:35'),(3,1,1,'Juan´s Hair Salon','Top-quality haircuts in Bogotá.','2024-10-07 02:37:35'),(4,3,3,'Ana Styles','Modern hair salon in Cali.','2024-10-07 02:37:35'),(5,4,4,'María´s Barber','Family-friendly barbershop in Barranquilla.','2024-10-07 02:37:35');
/*!40000 ALTER TABLE `barbershop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Colombia');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `appointment_id` int(20) NOT NULL,
  `people_id` int(20) NOT NULL,
  `barbershop_id` int(20) NOT NULL,
  `barber_id` int(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method` enum('cash','transfer') NOT NULL,
  `status` enum('pending','paid') DEFAULT 'pending',
  `receipt_url` varchar(255) NOT NULL,
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `appointment_id` (`appointment_id`),
  KEY `people_id` (`people_id`),
  KEY `barbershop_id` (`barbershop_id`),
  KEY `barber_id` (`barber_id`),
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_ibfk_3` FOREIGN KEY (`barbershop_id`) REFERENCES `barbershop` (`id`) ON DELETE CASCADE,
  CONSTRAINT `payments_ibfk_4` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,1,1,1,1,20.00,'cash','paid','https://example.com/receipt1.jpg','2024-10-07 02:37:35','2024-10-07 02:37:35'),(2,2,2,2,2,15.00,'transfer','paid','https://example.com/receipt2.jpg','2024-10-07 02:37:35','2024-10-07 02:37:35'),(3,3,3,3,3,40.00,'cash','pending','https://example.com/receipt3.jpg','2024-10-07 02:37:35','2024-10-07 02:37:35'),(4,4,4,4,4,10.00,'transfer','','https://example.com/receipt4.jpg','2024-10-07 02:37:35','2024-10-07 02:37:35'),(5,5,5,5,5,30.00,'cash','paid','https://example.com/receipt5.jpg','2024-10-07 02:37:35','2024-10-07 02:37:35');
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Juan','Pérez'),(2,'Carlos','Rodríguez'),(3,'Ana','Gómez'),(4,'María','López'),(5,'Luis','Martínez');
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_info`
--

DROP TABLE IF EXISTS `people_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `people_id` int(20) NOT NULL,
  `role_id` int(20) NOT NULL,
  `location_id` int(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `profile_image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `people_id` (`people_id`),
  KEY `role_id` (`role_id`),
  KEY `location_id` (`location_id`),
  CONSTRAINT `people_info_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `people_info_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE CASCADE,
  CONSTRAINT `people_info_ibfk_3` FOREIGN KEY (`location_id`) REFERENCES `people_location` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_info`
--

LOCK TABLES `people_info` WRITE;
/*!40000 ALTER TABLE `people_info` DISABLE KEYS */;
INSERT INTO `people_info` VALUES (1,1,1,1,'juan.perez@example.com','hashed_password_1','3101234567','https://example.com/profile1.jpg','2024-10-07 02:37:35'),(2,2,2,2,'carlos.rodriguez@example.com','hashed_password_2','3101234568','https://example.com/profile2.jpg','2024-10-07 02:37:35'),(3,3,1,3,'ana.gomez@example.com','hashed_password_3','3101234569','https://example.com/profile3.jpg','2024-10-07 02:37:35'),(4,4,1,4,'maria.lopez@example.com','hashed_password_4','3101234570','https://example.com/profile4.jpg','2024-10-07 02:37:35'),(5,5,2,5,'luis.martinez@example.com','hashed_password_5','3101234571','https://example.com/profile5.jpg','2024-10-07 02:37:35');
/*!40000 ALTER TABLE `people_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `people_location`
--

DROP TABLE IF EXISTS `people_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people_location` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `people_id` int(20) NOT NULL,
  `country_id` int(20) NOT NULL,
  `state_id` int(20) NOT NULL,
  `latitude` decimal(10,7) NOT NULL,
  `longitude` decimal(10,7) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `people_id` (`people_id`),
  KEY `country_id` (`country_id`),
  KEY `state_id` (`state_id`),
  CONSTRAINT `people_location_ibfk_1` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `people_location_ibfk_2` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE,
  CONSTRAINT `people_location_ibfk_3` FOREIGN KEY (`state_id`) REFERENCES `state` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `people_location`
--

LOCK TABLES `people_location` WRITE;
/*!40000 ALTER TABLE `people_location` DISABLE KEYS */;
INSERT INTO `people_location` VALUES (1,1,1,1,4.7110000,-74.0721000),(2,2,1,2,6.2442000,-75.5812000),(3,3,1,3,3.4372000,-76.5225000),(4,4,1,4,10.9685000,-74.7813000),(5,5,1,5,10.3910000,-75.4794000);
/*!40000 ALTER TABLE `people_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `barbershop_id` int(20) NOT NULL,
  `barber_id` int(20) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `media` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `barbershop_id` (`barbershop_id`),
  KEY `barber_id` (`barber_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`barbershop_id`) REFERENCES `barbershop` (`id`) ON DELETE CASCADE,
  CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`barber_id`) REFERENCES `barbers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,1,1,'New Haircut Styles','Check out our new haircut styles for this season.','https://example.com/media1.jpg','2024-10-07 02:37:35'),(2,2,2,'Beard Care Tips','Learn how to take care of your beard.','https://example.com/media2.jpg','2024-10-07 02:37:35'),(3,3,3,'Hair Coloring Trends','The latest trends in hair coloring.','https://example.com/media3.jpg','2024-10-07 02:37:35'),(4,4,4,'Special Offers','Special offers available this week.','https://example.com/media4.jpg','2024-10-07 02:37:35'),(5,5,5,'Deluxe Services','Try our new deluxe haircut service.','https://example.com/media5.jpg','2024-10-07 02:37:35');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `barbershop_id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `barbershop_id` (`barbershop_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`barbershop_id`) REFERENCES `barbershop` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Shampoo','High-quality shampoo.',10.00,100),(2,2,'Hair Gel','Strong hold hair gel.',8.00,50),(3,3,'Beard Oil','Beard nourishing oil.',12.00,40),(4,4,'Hair Spray','Long-lasting hair spray.',9.00,30),(5,5,'Conditioner','Moisturizing hair conditioner.',11.00,20);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `barbershop_id` int(20) NOT NULL,
  `people_id` int(20) NOT NULL,
  `appointment_id` int(20) NOT NULL,
  `comment` text DEFAULT NULL,
  `rating` int(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `barbershop_id` (`barbershop_id`),
  KEY `people_id` (`people_id`),
  KEY `appointment_id` (`appointment_id`),
  CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`barbershop_id`) REFERENCES `barbershop` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`people_id`) REFERENCES `people` (`id`) ON DELETE CASCADE,
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`appointment_id`) REFERENCES `appointments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,1,1,1,'Great service!',5,'2024-10-07 02:37:35'),(2,2,2,2,'Excellent beard trim.',4,'2024-10-07 02:37:35'),(3,3,3,3,'Loved the hair coloring.',5,'2024-10-07 02:37:35'),(4,4,4,4,'Cancelled, but still good.',3,'2024-10-07 02:37:35'),(5,5,5,5,'Best haircut ever!',5,'2024-10-07 02:37:35');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'customer'),(2,'barber');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `barbershop_id` int(20) NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') NOT NULL,
  `shop_status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `barbershop_id` (`barbershop_id`),
  CONSTRAINT `schedule_ibfk_1` FOREIGN KEY (`barbershop_id`) REFERENCES `barbershop` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (1,1,'08:00:00','18:00:00','Monday',1),(2,2,'09:00:00','19:00:00','Tuesday',1),(3,3,'08:00:00','17:00:00','Wednesday',1),(4,4,'10:00:00','20:00:00','Thursday',1),(5,5,'08:30:00','18:30:00','Friday',1);
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `barbershop_id` int(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `duration` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `barbershop_id` (`barbershop_id`),
  CONSTRAINT `services_ibfk_1` FOREIGN KEY (`barbershop_id`) REFERENCES `barbershop` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,1,'Basic Haircut','A simple haircut for men.',20.00,'00:30:00'),(2,2,'Beard Trim','Beard trimming service.',15.00,'00:20:00'),(3,3,'Hair Color','Hair coloring service.',40.00,'01:00:00'),(4,4,'Hair Wash','Professional hair wash.',10.00,'00:15:00'),(5,5,'Deluxe Haircut','Deluxe haircut with special treatment.',30.00,'00:45:00');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `country_id` int(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `country_id` (`country_id`),
  CONSTRAINT `state_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES (1,'Cundinamarca',1),(2,'Antioquia',1),(3,'Valle del Cauca',1),(4,'Atlántico',1),(5,'Bolívar',1);
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-06 22:27:43
