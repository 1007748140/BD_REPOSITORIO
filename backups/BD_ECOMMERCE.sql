-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_db
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
-- Table structure for table `carritos_compra`
--

DROP TABLE IF EXISTS `carritos_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritos_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `carritos_compra_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritos_compra`
--

LOCK TABLES `carritos_compra` WRITE;
/*!40000 ALTER TABLE `carritos_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritos_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Electrónica','Productos electrónicos y gadgets','2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,'Moda','Ropa y accesorios para hombre y mujer','2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,'Hogar','Muebles y decoración para el hogar','2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,'Deportes','Equipamiento deportivo y ropa','2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,'Libros','Libros de todas las categorías','2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,'Juguetes','Juguetes y juegos para niños','2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,'Belleza','Productos de belleza y cuidado personal','2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,'Automóviles','Accesorios y repuestos para coches','2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,'Jardinería','Herramientas y productos para jardín','2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,'Tecnología','Artículos de tecnología avanzada','2024-09-11 12:53:14','2024-09-11 12:53:14');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `descuentos`
--

DROP TABLE IF EXISTS `descuentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `descuentos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) NOT NULL,
  `porcentaje_descuento` decimal(5,2) NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `descuentos`
--

LOCK TABLES `descuentos` WRITE;
/*!40000 ALTER TABLE `descuentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `descuentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_carrito`
--

DROP TABLE IF EXISTS `detalles_carrito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_carrito` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `carrito_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `carrito_id` (`carrito_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalles_carrito_ibfk_1` FOREIGN KEY (`carrito_id`) REFERENCES `carritos_compra` (`id`),
  CONSTRAINT `detalles_carrito_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_carrito`
--

LOCK TABLES `detalles_carrito` WRITE;
/*!40000 ALTER TABLE `detalles_carrito` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalles_carrito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_ordenes`
--

DROP TABLE IF EXISTS `detalles_ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_ordenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `orden_id` (`orden_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalles_ordenes_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`),
  CONSTRAINT `detalles_ordenes_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_ordenes`
--

LOCK TABLES `detalles_ordenes` WRITE;
/*!40000 ALTER TABLE `detalles_ordenes` DISABLE KEYS */;
INSERT INTO `detalles_ordenes` VALUES (1,1,1,1,500.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,2,3,1,300.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,3,5,2,50.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,4,4,1,200.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,5,2,3,50.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,6,6,1,75.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,7,7,4,100.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,8,9,2,175.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,9,8,2,300.00,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,10,10,1,250.00,'2024-09-11 12:53:14','2024-09-11 12:53:14');
/*!40000 ALTER TABLE `detalles_ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `direcciones_envio`
--

DROP TABLE IF EXISTS `direcciones_envio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direcciones_envio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `direccion` text NOT NULL,
  `ciudad` varchar(100) DEFAULT NULL,
  `codigo_postal` varchar(20) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `direcciones_envio_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direcciones_envio`
--

LOCK TABLES `direcciones_envio` WRITE;
/*!40000 ALTER TABLE `direcciones_envio` DISABLE KEYS */;
/*!40000 ALTER TABLE `direcciones_envio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `envios`
--

DROP TABLE IF EXISTS `envios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `envios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) DEFAULT NULL,
  `direccion_envio` text NOT NULL,
  `estado_envio` enum('Pendiente','Enviado','Entregado') NOT NULL,
  `fecha_envio` datetime DEFAULT NULL,
  `fecha_entrega` datetime DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `orden_id` (`orden_id`),
  CONSTRAINT `envios_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `envios`
--

LOCK TABLES `envios` WRITE;
/*!40000 ALTER TABLE `envios` DISABLE KEYS */;
INSERT INTO `envios` VALUES (1,1,'Calle Falsa 123','Pendiente',NULL,NULL,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,2,'Av. Siempre Viva 742','Enviado','2023-09-01 10:00:00',NULL,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,3,'Calle 12 de Octubre 45','Entregado','2023-08-25 12:00:00','2023-08-27 15:00:00','2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,4,'Av. Principal 10','',NULL,NULL,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,5,'Calle La Estrella 20','Pendiente',NULL,NULL,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,6,'Calle El Sol 88','Enviado','2023-09-02 09:00:00',NULL,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,7,'Av. El Bosque 25','Entregado','2023-08-28 14:00:00','2023-08-30 18:00:00','2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,8,'Calle Los Álamos 100','',NULL,NULL,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,9,'Av. Los Olivos 70','Pendiente',NULL,NULL,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,10,'Calle El Prado 15','Entregado','2023-08-30 10:00:00','2023-09-02 17:00:00','2024-09-11 12:53:14','2024-09-11 12:53:14'),(11,1,'Calle Falsa 123','Pendiente',NULL,NULL,'2024-09-11 12:56:10','2024-09-11 12:56:10'),(12,2,'Av. Siempre Viva 742','Enviado','2023-09-01 10:00:00',NULL,'2024-09-11 12:56:10','2024-09-11 12:56:10'),(13,3,'Calle 12 de Octubre 45','Entregado','2023-08-25 12:00:00','2023-08-27 15:00:00','2024-09-11 12:56:10','2024-09-11 12:56:10'),(14,4,'Av. Principal 10','Pendiente',NULL,NULL,'2024-09-11 12:56:10','2024-09-11 12:56:10'),(15,5,'Calle La Estrella 20','Entregado',NULL,NULL,'2024-09-11 12:56:10','2024-09-11 12:56:10'),(16,6,'Calle El Sol 88','Entregado','2023-09-02 09:00:00',NULL,'2024-09-11 12:56:10','2024-09-11 12:56:10'),(17,7,'Av. El Bosque 25','Enviado','2023-08-28 14:00:00','2023-08-30 18:00:00','2024-09-11 12:56:10','2024-09-11 12:56:10'),(18,8,'Calle Los Álamos 100','',NULL,NULL,'2024-09-11 12:56:10','2024-09-11 12:56:10'),(19,9,'Av. Los Olivos 70','Enviado',NULL,NULL,'2024-09-11 12:56:10','2024-09-11 12:56:10'),(20,10,'Calle El Prado 15','Entregado','2023-08-30 10:00:00','2023-09-02 17:00:00','2024-09-11 12:56:10','2024-09-11 12:56:10'),(21,1,'Calle Falsa 123','Pendiente',NULL,NULL,'2024-09-11 12:56:45','2024-09-11 12:56:45'),(22,2,'Av. Siempre Viva 742','Enviado','2023-09-01 10:00:00',NULL,'2024-09-11 12:56:45','2024-09-11 12:56:45'),(23,3,'Calle 12 de Octubre 45','Entregado','2023-08-25 12:00:00','2023-08-27 15:00:00','2024-09-11 12:56:45','2024-09-11 12:56:45'),(24,4,'Av. Principal 10','Pendiente',NULL,NULL,'2024-09-11 12:56:45','2024-09-11 12:56:45'),(25,5,'Calle La Estrella 20','Entregado',NULL,NULL,'2024-09-11 12:56:45','2024-09-11 12:56:45'),(26,6,'Calle El Sol 88','Entregado','2023-09-02 09:00:00',NULL,'2024-09-11 12:56:45','2024-09-11 12:56:45'),(27,7,'Av. El Bosque 25','Enviado','2023-08-28 14:00:00','2023-08-30 18:00:00','2024-09-11 12:56:45','2024-09-11 12:56:45'),(28,8,'Calle Los Álamos 100','Entregado',NULL,NULL,'2024-09-11 12:56:45','2024-09-11 12:56:45'),(29,9,'Av. Los Olivos 70','Enviado',NULL,NULL,'2024-09-11 12:56:45','2024-09-11 12:56:45'),(30,10,'Calle El Prado 15','Entregado','2023-08-30 10:00:00','2023-09-02 17:00:00','2024-09-11 12:56:45','2024-09-11 12:56:45');
/*!40000 ALTER TABLE `envios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'Tarjeta de Crédito','Pago con tarjeta de crédito','2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,'PayPal','Pago a través de PayPal','2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,'Transferencia Bancaria','Pago mediante transferencia bancaria','2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,'Crédito en Tienda','Pago a crédito en la tienda','2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,'Bitcoin','Pago con criptomonedas','2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,'Tarjeta de Débito','Pago con tarjeta de débito','2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,'Pago contra entrega','Pago al recibir el producto','2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,'Google Pay','Pago con Google Pay','2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,'Apple Pay','Pago con Apple Pay','2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,'PSE','Pago electrónico seguro','2024-09-11 12:53:14','2024-09-11 12:53:14');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordenes`
--

DROP TABLE IF EXISTS `ordenes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ordenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `estado` enum('Pendiente','Enviado','Entregado','Cancelado') NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `direccion_envio` text NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `ordenes_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordenes`
--

LOCK TABLES `ordenes` WRITE;
/*!40000 ALTER TABLE `ordenes` DISABLE KEYS */;
INSERT INTO `ordenes` VALUES (1,1,'Pendiente',500.00,'Calle Falsa 123','2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,2,'Enviado',300.00,'Av. Siempre Viva 742','2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,3,'Entregado',100.00,'Calle 12 de Octubre 45','2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,4,'Cancelado',200.00,'Av. Principal 10','2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,5,'Pendiente',150.00,'Calle La Estrella 20','2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,6,'Enviado',75.00,'Calle El Sol 88','2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,7,'Entregado',400.00,'Av. El Bosque 25','2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,8,'Cancelado',350.00,'Calle Los Álamos 100','2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,9,'Pendiente',600.00,'Av. Los Olivos 70','2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,10,'Entregado',250.00,'Calle El Prado 15','2024-09-11 12:53:14','2024-09-11 12:53:14');
/*!40000 ALTER TABLE `ordenes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) DEFAULT NULL,
  `metodo_pago_id` int(11) DEFAULT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado_pago` enum('Pendiente','Completado','Fallido') NOT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `orden_id` (`orden_id`),
  KEY `metodo_pago_id` (`metodo_pago_id`),
  CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `ordenes` (`id`),
  CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`metodo_pago_id`) REFERENCES `metodos_pago` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,1,500.00,'Pendiente','2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,2,2,300.00,'Completado','2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,3,3,100.00,'Completado','2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,4,4,200.00,'Fallido','2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,5,5,150.00,'Pendiente','2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,6,6,75.00,'Completado','2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,7,7,400.00,'Completado','2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,8,8,350.00,'Pendiente','2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,9,9,600.00,'Completado','2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,10,10,250.00,'Pendiente','2024-09-11 12:53:14','2024-09-11 12:53:14');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `proveedor_id` int(11) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `categoria_id` (`categoria_id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Televisor','Televisor de 50 pulgadas',500.00,10,1,1,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,'Camiseta','Camiseta de algodón',20.00,50,2,2,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,'Sofá','Sofá de 3 plazas',300.00,5,3,3,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,'Bicicleta','Bicicleta de montaña',200.00,15,4,4,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,'Libro de cocina','Recetas de cocina',15.00,30,5,5,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,'Pelota de fútbol','Pelota oficial',25.00,100,4,6,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,'Lápiz Labial','Cosmético de larga duración',10.00,200,7,7,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,'Llanta de coche','Llanta para automóvil',100.00,20,8,8,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,'Cortadora de césped','Cortadora eléctrica',150.00,10,9,9,'2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,'Smartphone','Teléfono inteligente de última generación',800.00,8,10,10,'2024-09-11 12:53:14','2024-09-11 12:53:14');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor 1','Calle del Proveedor 1','555-0011','proveedor1@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,'Proveedor 2','Av. Proveedor 2','555-0022','proveedor2@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,'Proveedor 3','Calle del Proveedor 3','555-0033','proveedor3@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,'Proveedor 4','Av. Proveedor 4','555-0044','proveedor4@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,'Proveedor 5','Calle del Proveedor 5','555-0055','proveedor5@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,'Proveedor 6','Av. Proveedor 6','555-0066','proveedor6@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,'Proveedor 7','Calle del Proveedor 7','555-0077','proveedor7@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,'Proveedor 8','Av. Proveedor 8','555-0088','proveedor8@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,'Proveedor 9','Calle del Proveedor 9','555-0099','proveedor9@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,'Proveedor 10','Av. Proveedor 10','555-0101','proveedor10@example.com','2024-09-11 12:53:14','2024-09-11 12:53:14');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reseñas_productos`
--

DROP TABLE IF EXISTS `reseñas_productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reseñas_productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `comentario` text DEFAULT NULL,
  `calificacion` int(11) DEFAULT NULL CHECK (`calificacion` >= 1 and `calificacion` <= 5),
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `reseñas_productos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`),
  CONSTRAINT `reseñas_productos_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reseñas_productos`
--

LOCK TABLES `reseñas_productos` WRITE;
/*!40000 ALTER TABLE `reseñas_productos` DISABLE KEYS */;
/*!40000 ALTER TABLE `reseñas_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contraseña` varchar(255) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `createdAt` datetime DEFAULT current_timestamp(),
  `updatedAt` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Juan Pérez','juan@example.com','pass1234','555-1234','Calle Falsa 123','2024-09-11 12:53:14','2024-09-11 12:53:14'),(2,'Ana López','ana@example.com','pass5678','555-5678','Av. Siempre Viva 742','2024-09-11 12:53:14','2024-09-11 12:53:14'),(3,'Carlos García','carlos@example.com','pass9012','555-8765','Calle 12 de Octubre 45','2024-09-11 12:53:14','2024-09-11 12:53:14'),(4,'Luisa Martínez','luisa@example.com','pass3456','555-9876','Av. Principal 10','2024-09-11 12:53:14','2024-09-11 12:53:14'),(5,'Miguel Rodríguez','miguel@example.com','pass7890','555-5432','Calle La Estrella 20','2024-09-11 12:53:14','2024-09-11 12:53:14'),(6,'Sofía González','sofia@example.com','pass1235','555-6543','Calle El Sol 88','2024-09-11 12:53:14','2024-09-11 12:53:14'),(7,'Pedro Torres','pedro@example.com','pass4567','555-7654','Av. El Bosque 25','2024-09-11 12:53:14','2024-09-11 12:53:14'),(8,'María Fernández','maria@example.com','pass8901','555-8767','Calle Los Álamos 100','2024-09-11 12:53:14','2024-09-11 12:53:14'),(9,'Jorge Morales','jorge@example.com','pass2345','555-9878','Av. Los Olivos 70','2024-09-11 12:53:14','2024-09-11 12:53:14'),(10,'Laura Castillo','laura@example.com','pass6789','555-5433','Calle El Prado 15','2024-09-11 12:53:14','2024-09-11 12:53:14');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-11 15:50:49
