-- MySQL dump 10.13  Distrib 9.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: gario
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `gario`
--

/*!40000 DROP DATABASE IF EXISTS `gario`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `gario` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `gario`;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos` (
  `id_gasto` int NOT NULL AUTO_INCREMENT,
  `fk_monto` int NOT NULL,
  `fk_tipo` int NOT NULL,
  `fk_categoria` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fechas` json NOT NULL,
  `fk_metodo` int NOT NULL,
  PRIMARY KEY (`id_gasto`),
  KEY `fk_monto` (`fk_monto`),
  KEY `gastos_ibfk_2` (`fk_tipo`),
  KEY `gastos_ibfk_3_idx` (`fk_categoria`),
  KEY `gastos_ibfk_4_idx` (`fk_metodo`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`fk_monto`) REFERENCES `monto` (`id_monto`),
  CONSTRAINT `gastos_ibfk_2` FOREIGN KEY (`fk_tipo`) REFERENCES `gastos_tipos` (`id_tipo`),
  CONSTRAINT `gastos_ibfk_3` FOREIGN KEY (`fk_categoria`) REFERENCES `gastos_categorias` (`id_categoria`),
  CONSTRAINT `gastos_ibfk_4` FOREIGN KEY (`fk_metodo`) REFERENCES `metodos_pago` (`id_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (1,6,1,1,1200.00,'','[\"2025-07-12\"]',2),(2,6,1,1,1200.00,'','[\"2025-08-12\"]',2),(3,6,1,1,1200.00,'','[\"2025-09-12\"]',2),(4,6,1,1,133200.00,'','[\"2025-09-12\"]',2),(5,6,9,1,120.00,'','[\"2025-09-12\"]',2),(6,6,9,1,120.00,'','[\"2025-09-12\"]',2),(7,6,9,1,120.00,'','[\"2025-02-12\"]',2),(8,6,9,1,120.00,'','[\"2025-05-12\"]',2),(9,6,13,1,120.00,'','[\"2025-05-12\"]',2),(10,6,133,1,120.00,'','[\"2025-05-12\"]',2),(12,6,133,1,120.00,'','[\"2025-05-12\"]',2),(13,6,133,1,120.00,'','[\"2025-05-12\"]',2),(14,6,200,1,120.00,'','[\"2025-05-12\"]',2),(16,6,180,1,120.00,'','[\"2025-05-12\"]',2),(17,6,150,1,120.00,'','[\"2025-05-12\"]',2),(18,6,120,1,120.00,'','[\"2025-05-12\"]',2),(19,6,100,1,120.00,'','[\"2025-05-12\"]',2),(20,6,70,1,120.00,'','[\"2025-05-12\"]',2),(21,6,40,1,120.00,'','[\"2025-05-12\"]',2),(22,6,10,1,120.00,'','[\"2025-05-12\"]',2);
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos_categorias`
--

DROP TABLE IF EXISTS `gastos_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos_categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos_categorias`
--

LOCK TABLES `gastos_categorias` WRITE;
/*!40000 ALTER TABLE `gastos_categorias` DISABLE KEYS */;
INSERT INTO `gastos_categorias` VALUES (1,'Gasto Fijo'),(2,'Gasto Diario'),(3,'Gasto Hormiga');
/*!40000 ALTER TABLE `gastos_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RegisterGastogastos_clases`
--

DROP TABLE IF EXISTS `gastos_clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos_clases` (
  `id_clase` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos_clases`
--

LOCK TABLES `gastos_clases` WRITE;
/*!40000 ALTER TABLE `gastos_clases` DISABLE KEYS */;
INSERT INTO `gastos_clases` VALUES (1,'Alimentacion'),(2,'Cumpleahnos'),(3,'Compras'),(4,'Regalos'),(5,'Educacion'),(6,'Viajes'),(7,'Renta'),(8,'Credito');
/*!40000 ALTER TABLE `gastos_clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos_tipos`
--

DROP TABLE IF EXISTS `gastos_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos_tipos` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `fk_clase` int DEFAULT NULL,
  PRIMARY KEY (`id_tipo`),
  KEY `gt_ibfk_1_idx` (`fk_clase`),
  CONSTRAINT `gt_ibfk_1` FOREIGN KEY (`fk_clase`) REFERENCES `gastos_clases` (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos_tipos`
--

LOCK TABLES `gastos_tipos` WRITE;
/*!40000 ALTER TABLE `gastos_tipos` DISABLE KEYS */;
INSERT INTO `gastos_tipos` VALUES (1,'Alimentacion',NULL),(2,'Cumpleanos',NULL),(3,'Compras',NULL),(4,'Regalos',NULL),(5,'Educacion',NULL),(6,'Viajes',NULL),(7,'Renta',NULL),(8,'Credito',NULL),(9,'Restaurante',1),(10,'Supermercado',1),(11,'Fruteria',1),(12,'Panaderia',1),(13,'Carniceria',1),(14,'Comida rapida',1),(15,'Cafeteria',1),(16,'Desayuno',1),(17,'Almuerzo',1),(18,'Cena',1),(19,'Snacks',1),(20,'Postres',1),(21,'Delivery',1),(22,'Buffet',1),(23,'Bar',1),(24,'Licoreria',1),(25,'Comida callejera',1),(26,'Tienda de barrio',1),(27,'Abarrotes',1),(28,'Productos organicos',1),(29,'Comida vegana',1),(30,'Comida internacional',1),(31,'Alimentos para mascotas',1),(32,'Heladeria',1),(33,'Hidratacion',1),(34,'Pastel',2),(35,'Decoracion',2),(36,'Globos',2),(37,'Invitaciones',2),(38,'Lugar del evento',2),(39,'Musica / DJ',2),(40,'Bocaditos',2),(41,'Fotografia',2),(42,'Regalos',2),(43,'Pinata',2),(44,'Catering',2),(45,'Iluminacion',2),(46,'Alquiler de mobiliario',2),(47,'Juegos',2),(48,'Souvenirs',2),(49,'Tarjetas',2),(50,'Animadores',2),(51,'Bebidas',2),(52,'Centros de mesa',2),(53,'Renta de inflables',2),(54,'Articulos tematicos',2),(55,'Seguridad del evento',2),(56,'Transporte',2),(57,'Vestuario',2),(58,'Limpieza post-evento',2),(59,'Ropa',3),(60,'Calzado',3),(61,'Electronica',3),(62,'Cosmeticos',3),(63,'Juguetes',3),(64,'Muebles',3),(65,'Electrodomesticos',3),(66,'Articulos de oficina',3),(67,'Libros',3),(68,'Herramientas',3),(69,'Decoracion',3),(70,'Accesorios',3),(71,'Perfumeria',3),(72,'Suplementos',3),(73,'Productos de limpieza',3),(74,'Articulos deportivos',3),(75,'Plantas / Jardineria',3),(76,'Utiles escolares',3),(77,'Joyeria',3),(78,'Ropa interior',3),(79,'Bolsos',3),(80,'Tecnologia',3),(81,'Articulos para mascotas',3),(82,'Mercancia en linea',3),(83,'Software o apps',3),(84,'Flores',4),(85,'Chocolates',4),(86,'Peluches',4),(87,'Tarjetas',4),(88,'Libros',4),(89,'Perfumes',4),(90,'Ropa',4),(91,'Experiencias (spa, viajes)',4),(92,'Electronica',4),(93,'Accesorios personalizados',4),(94,'Albumes de fotos',4),(95,'Relojes',4),(96,'Joyeria',4),(97,'Kits de autocuidado',4),(98,'Juegos de mesa',4),(99,'Tarjetas regalo',4),(100,'Productos artesanales',4),(101,'Arte',4),(102,'Canastas sorpresa',4),(103,'Musica (CD, vinilo)',4),(104,'Decoraciones',4),(105,'Utensilios de cocina',4),(106,'Gadgets',4),(107,'Souvenirs',4),(108,'Bebidas',4),(109,'Matricula escolar',5),(110,'Uniformes',5),(111,'Libros',5),(112,'Cuadernos',5),(113,'Lapices y boligrafos',5),(114,'Mochilas',5),(115,'Cursos en linea',5),(116,'Seminarios',5),(117,'Examenes',5),(118,'Tutores',5),(119,'Transporte escolar',5),(120,'Inscripcion a talleres',5),(121,'Software educativo',5),(122,'Licencias digitales',5),(123,'Plataformas virtuales',5),(124,'Clases de idiomas',5),(125,'Clases de musica',5),(126,'Clases de arte',5),(127,'Educacion financiera',5),(128,'Certificaciones',5),(129,'Copias / impresiones',5),(130,'Papeleria',5),(131,'Asesorias academicas',5),(132,'Material reciclado',5),(133,'Becas y ayudas',5),(134,'Boletos de avion',6),(135,'Hospedaje',6),(136,'Transporte local',6),(137,'Tours guiados',6),(138,'Maletas',6),(139,'Pasaporte',6),(140,'Seguro de viaje',6),(141,'Alimentacion',6),(142,'Excursiones',6),(143,'Entradas a eventos',6),(144,'Alquiler de autos',6),(145,'Souvenirs',6),(146,'Mapas y guias',6),(147,'Visas',6),(148,'Actividades recreativas',6),(149,'Cambios de divisas',6),(150,'Apps de viaje',6),(151,'Ropa para clima especifico',6),(152,'Tarjetas SIM',6),(153,'Botiquin',6),(154,'Snacks de viaje',6),(155,'Parques tematicos',6),(156,'Experiencias locales',6),(157,'Cruceros',6),(158,'Fotografia de viaje',6),(159,'Alquiler de vivienda',7),(160,'Alquiler de oficina',7),(161,'Cuota mensual',7),(162,'Deposito',7),(163,'Servicios publicos',7),(164,'Internet',7),(165,'Administracion',7),(166,'Aseo',7),(167,'Parqueadero',7),(168,'Renovacion de contrato',7),(169,'Reparaciones locativas',7),(170,'Aire acondicionado',7),(171,'Arriendo temporal',7),(172,'Alquiler compartido',7),(173,'Seguridad / porteria',7),(174,'Mudanza',7),(175,'Poliza de arrendamiento',7),(176,'Amoblado',7),(177,'Inmobiliaria',7),(178,'Comision',7),(179,'Mascotas',7),(180,'Conexion de servicios',7),(181,'Clausulas legales',7),(182,'Auditoria del lugar',7),(183,'Inspeccion previa',7),(184,'Tarjeta de credito',8),(185,'Intereses',8),(186,'Cuota minima',8),(187,'Compra a plazos',8),(188,'Credito hipotecario',8),(189,'Credito vehicular',8),(190,'Reporte de credito',8),(191,'Mora',8),(192,'Refinanciacion',8),(193,'Historial crediticio',8),(194,'Solicitud de prestamo',8),(195,'Aval',8),(196,'Fiador',8),(197,'Pagare',8),(198,'Linea de credito',8),(199,'Credito estudiantil',8),(200,'Credito personal',8),(201,'Microcreditos',8),(202,'Creditos rotativos',8),(203,'Seguro de deuda',8),(204,'Revision de puntaje',8),(205,'Cobro juridico',8),(206,'Consolidacion de deuda',8),(207,'Comision por desembolso',8);
/*!40000 ALTER TABLE `gastos_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_monto`
--

DROP TABLE IF EXISTS `historial_monto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_monto` (
  `id_historial` int NOT NULL AUTO_INCREMENT,
  `fk_monto` int NOT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_historial`),
  KEY `fk_monto` (`fk_monto`),
  CONSTRAINT `historial_monto_ibfk_1` FOREIGN KEY (`fk_monto`) REFERENCES `monto` (`id_monto`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_monto`
--

LOCK TABLES `historial_monto` WRITE;
/*!40000 ALTER TABLE `historial_monto` DISABLE KEYS */;
INSERT INTO `historial_monto` VALUES (1,1,5000.99,'2025-07-01 13:33:28'),(2,1,4300.99,'2025-07-01 13:34:12'),(3,1,3300.99,'2025-07-01 18:04:55'),(4,1,3270.99,'2025-07-01 18:07:30'),(5,1,3240.99,'2025-07-01 18:08:09'),(6,1,3140.99,'2025-07-01 18:08:24'),(7,1,3040.99,'2025-07-01 20:00:07'),(8,1,8040.99,'2025-07-01 20:03:01'),(9,1,8340.99,'2025-07-01 20:05:02'),(10,1,4340.99,'2025-07-01 20:05:37'),(11,2,7655.00,'2025-07-01 21:15:48'),(12,2,6755.00,'2025-07-01 21:16:10'),(13,2,5555.00,'2025-07-01 21:16:33'),(14,2,7255.00,'2025-07-05 11:35:47'),(15,2,7205.00,'2025-07-05 11:36:42'),(16,2,7135.00,'2025-07-05 11:37:16'),(17,2,7065.00,'2025-07-05 11:40:28'),(18,2,6965.00,'2025-07-05 12:13:01'),(19,2,7065.00,'2025-07-05 12:14:03'),(20,2,7465.00,'2025-07-05 12:14:28'),(21,1,3440.99,'2025-07-06 13:11:24'),(22,3,0.00,'2025-07-07 16:35:02'),(23,3,1000.00,'2025-07-07 16:35:53'),(24,3,1800.00,'2025-07-07 16:37:07'),(25,3,1300.00,'2025-07-07 16:44:56'),(26,4,0.00,'2025-07-13 17:33:37'),(27,4,800.00,'2025-07-13 17:35:20'),(28,4,300.00,'2025-07-13 17:37:57'),(29,4,1700.00,'2025-07-13 17:38:10'),(30,2,7865.00,'2025-07-13 20:20:10'),(31,2,9265.00,'2025-07-13 20:20:42'),(32,2,10665.00,'2025-07-13 20:21:24'),(33,2,10265.00,'2025-07-13 21:48:25'),(34,2,10765.00,'2025-07-13 21:51:09'),(35,2,11265.00,'2025-07-16 10:40:11'),(36,6,0.00,'2025-07-19 16:34:09'),(37,6,1200.00,'2025-07-19 16:34:50'),(38,6,2400.00,'2025-07-19 16:35:24'),(39,6,2400.01,'2025-07-19 16:35:33'),(40,6,2400.02,'2025-07-19 16:36:07'),(41,6,2400.03,'2025-07-19 16:36:24'),(42,6,2400.04,'2025-07-19 16:38:50'),(43,6,2400.03,'2025-07-19 16:39:09'),(44,6,1200.03,'2025-07-19 16:39:11'),(45,6,0.03,'2025-07-19 17:06:20'),(46,6,34.03,'2025-07-23 17:59:36'),(47,6,68.03,'2025-07-23 18:00:17'),(48,6,49068.03,'2025-07-23 18:00:48'),(49,6,47868.03,'2025-07-23 21:31:31'),(50,6,96868.03,'2025-07-23 21:32:00'),(51,6,145868.03,'2025-07-23 21:32:11'),(52,6,144668.03,'2025-07-23 21:32:15'),(53,6,143468.03,'2025-07-23 21:32:18'),(54,6,10268.03,'2025-07-24 16:19:36'),(55,6,59268.03,'2025-07-24 16:19:42'),(56,6,108268.03,'2025-07-24 16:19:47'),(57,6,157268.03,'2025-07-24 16:19:50'),(58,6,206268.03,'2025-07-24 16:19:56'),(59,6,215268.03,'2025-07-24 16:19:59'),(60,6,224268.03,'2025-07-24 16:20:01'),(61,6,233268.03,'2025-07-24 16:20:02'),(62,6,242268.03,'2025-07-24 16:20:09'),(63,6,339268.03,'2025-07-24 16:20:10'),(64,6,436268.03,'2025-07-24 16:20:18'),(65,6,533268.03,'2025-07-24 16:20:33'),(66,6,630268.03,'2025-07-24 16:20:34'),(67,6,727268.03,'2025-07-24 16:20:44'),(68,6,727148.03,'2025-07-24 16:20:46'),(69,6,727028.03,'2025-07-24 16:20:53'),(70,6,726908.03,'2025-07-24 16:20:56'),(71,6,726788.03,'2025-07-24 16:21:03'),(72,6,726668.03,'2025-07-24 16:21:06'),(73,6,726548.03,'2025-07-24 16:21:17'),(74,6,726428.03,'2025-07-24 16:21:21'),(75,6,726308.03,'2025-07-24 16:25:36'),(76,6,823308.03,'2025-07-24 16:25:37'),(77,6,920308.03,'2025-07-24 16:26:11'),(78,6,920188.03,'2025-07-24 16:26:20'),(79,6,920068.03,'2025-07-24 16:26:25'),(80,6,919948.03,'2025-07-24 16:26:27'),(81,6,919828.03,'2025-07-24 16:26:29'),(82,6,919708.03,'2025-07-24 16:26:32'),(83,6,919588.03,'2025-07-24 16:26:36'),(84,6,919468.03,'2025-07-24 16:26:38');
/*!40000 ALTER TABLE `historial_monto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos`
--

DROP TABLE IF EXISTS `ingresos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos` (
  `id_ingreso` int NOT NULL AUTO_INCREMENT,
  `fk_monto` int NOT NULL,
  `fk_tipo` int NOT NULL,
  `fk_categoria` int NOT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `fechas` json NOT NULL,
  `fk_metodo` int NOT NULL,
  PRIMARY KEY (`id_ingreso`),
  KEY `fk_monto` (`fk_monto`),
  KEY `ingresos_ibfk_2` (`fk_tipo`),
  KEY `ingresos_ibfk_3_idx` (`fk_categoria`),
  KEY `ingresos_ibfk_4_idx` (`fk_metodo`),
  CONSTRAINT `ingresos_ibfk_1` FOREIGN KEY (`fk_monto`) REFERENCES `monto` (`id_monto`),
  CONSTRAINT `ingresos_ibfk_2` FOREIGN KEY (`fk_tipo`) REFERENCES `ingresos_tipos` (`id_tipo`),
  CONSTRAINT `ingresos_ibfk_3` FOREIGN KEY (`fk_categoria`) REFERENCES `ingresos_categorias` (`id_categoria`),
  CONSTRAINT `ingresos_ibfk_4` FOREIGN KEY (`fk_metodo`) REFERENCES `metodos_pago` (`id_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos`
--

LOCK TABLES `ingresos` WRITE;
/*!40000 ALTER TABLE `ingresos` DISABLE KEYS */;
INSERT INTO `ingresos` VALUES (24,6,1,1,34.00,'Prueba1','[\"2025-07-12\"]',1),(25,6,1,1,49000.00,'Prueba2','[\"2025-07-12\", \"2025-08-09\"]',1),(26,6,1,1,49000.00,'Prueba2','[\"2025-07-12\", \"2025-08-09\", \"2025-07-12\"]',1),(27,6,1,1,49000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(28,6,1,1,49000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(29,6,9,1,49000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(30,6,12,1,49000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(31,6,13,1,49000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(32,6,21,1,9000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(33,6,12,1,9000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(34,6,12,1,9000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(35,6,12,1,9000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(36,6,22,1,97000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(37,6,22,1,97000.00,'Prueba24','[\"2025-06-12\", \"2025-10-09\", \"2045-07-12\"]',1),(38,6,22,1,97000.00,'Prueba24','[\"2025-06-12\", \"2025-08-09\", \"2045-07-12\"]',1),(39,6,22,1,97000.00,'Prueba24','[\"2025-06-12\", \"2025-05-09\", \"2045-07-12\"]',1),(40,6,22,1,97000.00,'Prueba24','[\"2025-06-12\", \"2025-05-09\", \"2045-07-12\"]',1),(41,6,40,1,97000.00,'Prueba24','[\"2025-06-12\", \"2025-05-09\", \"2045-07-12\"]',1),(42,6,40,1,97000.00,'Prueba24','[\"2025-06-12\", \"2025-05-09\", \"2045-07-12\"]',1);
/*!40000 ALTER TABLE `ingresos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos_categorias`
--

DROP TABLE IF EXISTS `ingresos_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos_categorias` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos_categorias`
--

LOCK TABLES `ingresos_categorias` WRITE;
/*!40000 ALTER TABLE `ingresos_categorias` DISABLE KEYS */;
INSERT INTO `ingresos_categorias` VALUES (1,'Ingreso Fijo'),(2,'Ingreso Externo'),(3,'Ingreso Improvisto');
/*!40000 ALTER TABLE `ingresos_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos_clases`
--

DROP TABLE IF EXISTS `ingresos_clases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos_clases` (
  `id_clase` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_clase`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos_clases`
--

LOCK TABLES `ingresos_clases` WRITE;
/*!40000 ALTER TABLE `ingresos_clases` DISABLE KEYS */;
INSERT INTO `ingresos_clases` VALUES (1,'Salario'),(2,'Renta');
/*!40000 ALTER TABLE `ingresos_clases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingresos_tipos`
--

DROP TABLE IF EXISTS `ingresos_tipos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingresos_tipos` (
  `id_tipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fk_clase` int DEFAULT NULL,
  PRIMARY KEY (`id_tipo`),
  KEY `it_ibfk_1_idx` (`fk_clase`),
  CONSTRAINT `it_ibfk_1` FOREIGN KEY (`fk_clase`) REFERENCES `ingresos_clases` (`id_clase`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingresos_tipos`
--

LOCK TABLES `ingresos_tipos` WRITE;
/*!40000 ALTER TABLE `ingresos_tipos` DISABLE KEYS */;
INSERT INTO `ingresos_tipos` VALUES (1,'Salario',NULL),(2,'Renta',NULL),(3,'Salario b├ísico',1),(4,'Bonificaciones',1),(5,'Comisiones',1),(6,'Horas extra',1),(7,'Auxilio de transporte',1),(8,'Auxilio de alimentaci├│n',1),(9,'Prima legal',1),(10,'Prima extralegal',1),(11,'Cesant├¡as',1),(12,'Intereses sobre cesant├¡as',1),(13,'Vacaciones pagadas',1),(14,'Licencias remuneradas',1),(15,'Subsidio familiar',1),(16,'Retroactivo salarial',1),(17,'Reintegros o pagos pendientes',1),(18,'Pagos por incapacidad',1),(19,'Pagos por indemnizaci├│n',1),(20,'Salario en especie',1),(21,'Aportes patronales',1),(22,'Incentivos por productividad',1),(23,'Participaci├│n en utilidades',1),(24,'Compensaciones no salariales',1),(25,'Salario en moneda extranjera',1),(26,'Pagos por contrato freelance',1),(27,'Pagos quincenales o mensuales',1),(28,'Arriendo de apartamento',2),(29,'Arriendo de casa',2),(30,'Arriendo de oficina',2),(31,'Arriendo de local comercial',2),(32,'Arriendo de habitaci├│n',2),(33,'Arriendo vacacional (Airbnb, Booking)',2),(34,'Subarriendo',2),(35,'Leasing habitacional',2),(36,'Leasing vehicular',2),(37,'Renta de terrenos',2),(38,'Renta de bodegas',2),(39,'Arriendo de parqueadero',2),(40,'Arriendo de espacios compartidos (coworking)',2),(41,'Renta por inversi├│n inmobiliaria',2),(42,'Alquiler con opci├│n de compra',2),(43,'Renta con servicios incluidos',2),(44,'Renta temporal por d├¡as',2),(45,'Renta amoblada',2),(46,'Renta en zona rural',2),(47,'Arriendo estudiantil',2),(48,'Renta en d├│lares',2),(49,'Renta internacional',2),(50,'Renta por contrato fijo',2),(51,'Renta por contrato verbal',2),(52,'Renta con fiador o p├│liza',2);
/*!40000 ALTER TABLE `ingresos_tipos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodos_pago`
--

DROP TABLE IF EXISTS `metodos_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodos_pago` (
  `id_metodo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id_metodo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodos_pago`
--

LOCK TABLES `metodos_pago` WRITE;
/*!40000 ALTER TABLE `metodos_pago` DISABLE KEYS */;
INSERT INTO `metodos_pago` VALUES (1,'Efectivo'),(2,'PSE'),(3,'Tarjeta Debito'),(4,'Transferencia'),(5,'Mercado Pago'),(6,'Tarjeta Credito');
/*!40000 ALTER TABLE `metodos_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `monto`
--

DROP TABLE IF EXISTS `monto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monto` (
  `id_monto` int NOT NULL AUTO_INCREMENT,
  `fk_user` int NOT NULL,
  `cantidad_actual` decimal(10,2) DEFAULT '0.00',
  `update_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_monto`),
  KEY `monto_ibfk_1` (`fk_user`),
  CONSTRAINT `monto_ibfk_1` FOREIGN KEY (`fk_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monto`
--

LOCK TABLES `monto` WRITE;
/*!40000 ALTER TABLE `monto` DISABLE KEYS */;
INSERT INTO `monto` VALUES (1,1,2740.99,'2025-07-06 13:11:24'),(2,2,11765.00,'2025-07-16 10:40:11'),(3,4,800.00,'2025-07-07 16:44:56'),(4,5,1300.00,'2025-07-13 17:38:10'),(6,19,919348.03,'2025-07-24 16:26:38');
/*!40000 ALTER TABLE `monto` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `before_update_monto` BEFORE UPDATE ON `monto` FOR EACH ROW BEGIN
INSERT INTO HISTORIAL_MONTO (fk_monto, cantidad)
VALUES (OLD.id_monto, OLD.cantidad_actual);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `psw` varchar(100) NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Cristian','bsk@gmail.com','$2b$08$f.oIuZOQRyil1gdqqVFjdOxTen8H5vCHaPFMF1Flowr6sfWTttrme',18),(2,'Paula','pabs@gmail.com','$2b$08$sZAdlZRs6vgVPMh1a2a4ROIssVNllqa/YVsRDoY.nK3cKoaIiO0.K',NULL),(4,'Juan David','juan@gmail.com','$2b$08$eras3fuYanpfuhPFfJcp2O9SIpKlbmrSiXP3L7hmQIDMs0HCD/4xq',NULL),(5,'Cardenas','Cardenas@gmail.com','$2b$08$uXQAoHstZMTKB1JHllQnlePXpXi5qQA0NJVp/qNbTkOFhllPhTPIu',NULL),(6,'Isabela','Isa@gmail.com','$2b$08$N2E/z3wuUk7FPtEAaqaxueQrHrUjKTrKKKYsR1/CYWje/MXrfYFxK',NULL),(8,'Isabela','ISABELA@gmail.com','$2b$08$PEU9zEzjQq1T4OKayA17l.774HVaJFWVWqg8N0W9AvnAVhhXMRQjC',NULL),(9,'Isabela','oaoa@gmail.com','$2b$08$pFk8FlI4qy0VsLyXQZtxmuVMFe32UlCpaQGQI/7no04F.kCgvy9Se',NULL),(10,'Carlos','c@gmail.com','juasjuas',21),(11,'Felipe','fer@gmail.com','$2b$08$sNinN7.BIDvRGxOSmWjTfeHB/zBSn6azwF1yt50V9tbNBzX38680C',NULL),(12,'andres','andres@gmail.com','$2b$08$FyfuazKbn0IuHNbnJHgYEOIRBDnEQeNuMhMktM.63PlDnDKKWTbNu',NULL),(13,'Nury','Nury@gmail.com','$2b$08$gv6iUIp22zg/GD8DKl5aeuRxFn0o.vOsnCBIJkg3PSbl6kX4.1vYu',NULL),(19,'PaulaJoi','PaulaJoi@gmail.com','$2b$08$4xFl.epNJ9oTJG3UXMfHiO2GSlVVRlWKgK3dby2K4TMu8ZuCCFF8O',18);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `after_insert_user` AFTER INSERT ON `users` FOR EACH ROW BEGIN
INSERT INTO MONTO(fk_user)
VALUES(NEW.id_user);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'gario'
--

--
-- Dumping routines for database 'gario'
--
/*!50003 DROP PROCEDURE IF EXISTS `find_gastos_categorias_metodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_gastos_categorias_metodos`()
BEGIN
SELECT
1 AS SECCION,
id_Categoria AS ID,
nombre AS NOMBRE
FROM GASTOS_CATEGORIAS
UNION ALL
SELECT
2 AS SECCION,
id_metodo AS ID,
nombre AS NOMBRE
FROM METODOS_PAGO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_gastos_tipos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_gastos_tipos`()
BEGIN
SELECT
gt.id_tipo AS ID,
gc.nombre AS CLASE,
gt.nombre AS NOMBRE
FROM GASTOS_TIPOS AS gt
JOIN GASTOS_CLASES AS gc
ON gc.id_clase = gt.fk_clase;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_informe_gastos_clase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_informe_gastos_clase`()
BEGIN
SELECT
COUNT(gc.NOMBRE) AS NoRegistros,
gc.NOMBRE AS CLASE,
SUM(g.CANTIDAD) AS TOTAL
FROM GASTOS AS g
JOIN GASTOS_TIPOS AS gt
ON gt.id_tipo = g.fk_tipo
JOIN GASTOS_CLASES AS gc
ON gc.id_clase = gt.fk_clase
JOIN JSON_TABLE(
g.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fj
WHERE fj.fecha <= CURDATE()
GROUP BY gc.NOMBRE
ORDER BY NoRegistros DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_informe_ingresos_clase` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_informe_ingresos_clase`()
BEGIN
SELECT
COUNT(ic.NOMBRE) AS NoRegistros,
ic.NOMBRE AS CLASE,
SUM(i.CANTIDAD) AS TOTAL
FROM INGRESOS AS i
JOIN INGRESOS_TIPOS AS it
ON it.id_tipo = i.fk_tipo
JOIN INGRESOS_CLASES AS ic
ON ic.id_clase = it.fk_clase
JOIN JSON_TABLE(
i.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fj
WHERE fj.fecha <= CURDATE()
GROUP BY ic.NOMBRE
ORDER BY NoRegistros DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_ingresos_categorias_metodos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_ingresos_categorias_metodos`()
BEGIN
SELECT
1 AS SECCION,
id_categoria AS ID,
nombre AS NOMBRE
FROM INGRESOS_CATEGORIAS
UNION ALL
SELECT
2 AS SECCION,
id_metodo AS ID,
nombre AS NOMBRE
FROM METODOS_PAGO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `find_ingresos_tipos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `find_ingresos_tipos`()
BEGIN
SELECT
it.id_tipo AS ID,
ic.nombre AS CLASE,
it.nombre AS NOMBRE
FROM INGRESOS_TIPOS AS it
JOIN INGRESOS_CLASES AS ic
ON ic.id_clase = it.fk_clase;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `movimientos_por_5anios` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `movimientos_por_5anios`(
    IN p_idUser INT
)
BEGIN

-- OBJETIVO: Mostrar Gastos e Ingresos Totales de los ultimos 5 anhos

-- Declarar v_fkMonto para obtener id del monto
DECLARE v_fkMonto INT;

-- Query para obtener el id del monto
SELECT id_monto INTO v_fkMonto
FROM MONTO
WHERE fk_user = p_idUser;

-- Query para Cumplir el Objetivo
-- Query de Gastos
-- Se Requiere de Sub Querys para Poder Usar ORDER BY Y LIMIT 
SELECT * FROM (
	SELECT
		SUM(g.cantidad) AS MONTO,
		'GASTO' AS TIPO,
		YEAR(fechas_json.fecha) AS ANIO
	FROM GASTOS AS g
	JOIN JSON_TABLE(
		g.fechas,
		'$[*]' COLUMNS(fecha DATE PATH '$')
	) AS fechas_json
	WHERE g.fk_monto = v_fkMonto
	AND fechas_json.fecha <= CURDATE()
	GROUP BY YEAR(fechas_json.fecha)
	ORDER BY YEAR(fechas_json.fecha) DESC
	LIMIT 5
) AS gastos_top5
-- Unir las Dos querys
UNION ALL

-- Query de Ingresos
SELECT * FROM (
	SELECT
		SUM(i.cantidad) AS MONTO,
		'INGRESO' AS TIPO,
		YEAR(fechas_json.fecha) AS ANIO
	FROM INGRESOS AS i
	JOIN JSON_TABLE(
		i.fechas,
		'$[*]' COLUMNS(fecha DATE PATH '$')
	) AS fechas_json
	WHERE i.fk_monto = v_fkMonto
	AND fechas_json.fecha <= CURDATE()
	GROUP BY YEAR(fechas_json.fecha)
	ORDER BY YEAR(fechas_json.fecha) DESC
	LIMIT 5
) AS ingresos_top5;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `movimientos_por_dia` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `movimientos_por_dia`(
    IN p_idUser INT,
    IN p_SelectedWeek DATE
)
BEGIN
-- OBJETIVO: Mostrar los Gastos e Ingresos Totales de Cada Dia de una Semana Seleccionada
-- Declarar v_fkMonto para obtener Id del Monto
DECLARE v_fkMonto INT;

-- Query para Obtener el id_monto del usuario
SELECT id_monto
INTO v_fkMonto
FROM MONTO
WHERE fk_user = p_idUser;

-- Query para Cumplir El Objetivo
-- Query Gastos
SELECT
SUM(g.cantidad) AS MONTO,
'GASTO' AS TIPO,
-- DAYNAME() -> Obtiene el nombre del Dia Correspondiente
DAYNAME(fechas_json.fecha) AS DIA
FROM GASTOS AS g
-- Tabla Temporal Virtual
JOIN JSON_TABLE(
g.fechas,
'$[*]' COLUMNS(fecha DATE PATH '$')
) AS fechas_json
-- CONDICIONALES
-- Ser del Monto Correspondiente, las Fechas sean de la Semana Seleccionada Y no pueden ser mayores al dia Actual
WHERE g.fk_monto = v_fkMonto
AND WEEK(fechas_json.fecha) = WEEK(p_SelectedWeek)
AND fechas_json.fecha <= CURDATE()
-- Agrupar Por Dias
GROUP BY fechas_json.fecha
-- Unir Querys de Gastos e Ingresos
UNION ALL

-- Query para Obtener Ingresos
SELECT
SUM(i.cantidad) AS MONTO,
'INGRESO' AS TIPO,
DAYNAME(fechas_json.fecha) AS DIA
FROM INGRESOS AS i
JOIN JSON_TABLE(
i.fechas,
'$[*]' COLUMNS(fecha DATE PATH '$')
) AS fechas_json
WHERE i.fk_monto = v_fkMonto
AND WEEK(fechas_json.fecha) = WEEK(p_SelectedWeek)
AND fechas_json.fecha <= CURDATE()
GROUP BY fechas_json.fecha;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `movimientos_por_mes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `movimientos_por_mes`(
IN p_idUser INT)
BEGIN
-- OBJETIVO: Mostrar Los Gastos e Ingresos Totales de cada Mes del Ahno Vigente

-- Declarar Variable v_fkMonto para Obtener el Id del Monto
DECLARE v_fkMonto INT;

-- Query para Obtener el Id del Monto
SELECT id_monto
INTO v_fkMonto
FROM MONTO
WHERE fk_user = p_idUser;

-- Query para completar el Objetivo
-- Query de Gastos
SELECT
SUM(g.cantidad) AS MONTO,
'GASTO' AS TIPO,
/*
	CONCAT(Valor1, Valor2, Valor3, ...) -> Unir Distintos Valores
    LPAD(Valor, Numero_de_Casillas, Valor_de_Relleno) -> Rellenar con un valor el lado Izq
		Si Mes es 7, va a agregar un 0 --> 07
*/
CONCAT(YEAR(fechas_json.fecha), '-', LPAD(MONTH(fechas_json.fecha),2,0)) AS MES
FROM GASTOS AS g
-- Tabla Temporal Virtual
JOIN JSON_TABLE(
g.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fechas_json
-- CONDICIONALES
-- Ser del Monto del User Correspondiente y el Ahno Vigente
WHERE g.fk_monto = v_fkMonto
AND YEAR(fechas_json.fecha) = YEAR(CURDATE())
-- Agrupar por Ahno y Mes Correspondiente
GROUP BY CONCAT(YEAR(fechas_json.fecha), '-', LPAD(MONTH(fechas_json.fecha),2,0))
-- Unir Query Gastos y Query Ingresos
UNION ALL
-- Query Ingresos
SELECT SUM(i.cantidad) AS MONTO,
'INGRESO' AS TIPO,
CONCAT(YEAR(fechas_json.fecha), '-', LPAD(MONTH(fechas_json.fecha),2,0)) AS MES
FROM INGRESOS AS i
JOIN JSON_TABLE(
i.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fechas_json
WHERE i.fk_monto = v_fkMonto
AND YEAR(fechas_json.fecha) = YEAR(CURDATE())
GROUP BY CONCAT(YEAR(fechas_json.fecha), '-', LPAD(MONTH(fechas_json.fecha),2,0));

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `movimientos_por_semana` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `movimientos_por_semana`(
IN p_idUser INT,
IN p_SelectedMonth DATE )
BEGIN
-- OBJETIVO: Mostrar Los Gastos e Ingresos Totales de cada semana de Un Mes Especifico

-- Declarar v_fkMonto para obtener el id del monto
DECLARE v_fkMonto INT;

-- Query para obtener el Id del Monto
SELECT id_monto
INTO v_fkMonto
FROM MONTO
WHERE fk_user = p_idUser;

-- Query para Cumplir el Objetivo

-- Consulta de Gastos
SELECT
SUM(g.cantidad) AS MONTO,
'GASTO' AS TIPO,
-- YEARWEEK --> Muestra el Ahno junto al Numero de la semana
YEARWEEK(fechas_json.fecha) AS SEMANA
FROM GASTOS AS g
-- Tabla Temporal Virtual para Acceder a las fechas
JOIN JSON_TABLE(
g.fechas,
'$[*]' 
COLUMNS(fecha DATE PATH '$')
) AS fechas_json
-- CONDICIONALES
-- Ser el Monto del User Indicado
WHERE g.fk_monto = v_fkMonto
-- La fecha debe ser del Mes y Ahno Indicado Y menor al dia Actual
AND YEAR(fechas_json.fecha) = YEAR(p_SelectedMonth)
AND MONTH(fechas_json.fecha) = MONTH(p_SelectedMonth)
AND fechas_json.fecha <= CURDATE()
-- Agrupar Por Semanas YEARWEEK --> '202526'
GROUP BY YEARWEEK(fechas_json.fecha)
-- Unir Consulta de Gasto con Consulta de Ingresos
UNION ALL
-- Consulta de Ingresos
SELECT
SUM(i.cantidad) AS MONTO,
'INGRESO' AS TIPO,
YEARWEEK(fechas_json.fecha) AS SEMANA
FROM INGRESOS AS i
JOIN JSON_TABLE(
i.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fechas_json
WHERE i.fk_monto = v_fkMonto
AND YEAR(fechas_json.fecha) = YEAR(p_SelectedMonth)
AND MONTH(fechas_json.fecha) = MONTH(p_SelectedMonth)
AND fechas_json.fecha <= CURDATE()
GROUP BY YEARWEEK(fechas_json.fecha);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterGasto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterGasto`( 
IN p_fkUser INT, 
IN p_fkTipo INT, 
IN p_fkCategoria INT,
IN p_fkMetodo INT,
IN p_cantidad DECIMAL(10,2), 
IN p_descripcion VARCHAR(200),
IN p_fechas JSON )
BEGIN 

-- OBJETIVO: Registrar el Gasto que realizo un usuario y Actualizar su Monto

/*
Declarar Variables:
v_fkMonto --> Va a obtener el id_monto
v_monto --> Va a obtener la cantidad Actual del Monto
*/
DECLARE v_fkMonto INT;
DECLARE v_monto DECIMAL(10,2);

-- Query  para obtener el id_monto en base al id del user
SELECT id_monto INTO v_fkMonto 
FROM monto 
WHERE fk_user = p_fkUser;

-- Query para obtener la cantidad actual del monto que posee el user
SELECT cantidad_actual INTO v_monto 
FROM monto 
WHERE id_monto = v_fkMonto;

-- Manejo de Errores: Si el gasto es mayor que el monto actual, se va a cancelar  el proceso
IF v_monto < p_cantidad THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Gasto excede el Monto Actual';
END IF;

-- Insertar datos a la tabla Gastos
INSERT INTO gastos(fk_monto, fk_tipo, fk_categoria, fk_metodo, cantidad, descripcion, fechas)
VALUES (v_fkMonto, p_fkTipo, p_fkCategoria, p_fkMetodo, p_cantidad, p_descripcion, p_fechas);

-- Actualizar la variable v_monto a su cantidad post-gasto
SET v_monto = v_monto - p_cantidad;

-- Actualizar la Cantidad Actual y su ultima fecha de modificacion
UPDATE monto 
SET cantidad_actual = v_monto, update_date = CURRENT_TIMESTAMP()
WHERE id_monto = v_fkMonto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `RegisterIngreso` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `RegisterIngreso`(
IN p_fkUser INT,
IN p_fkTipo INT,
IN p_fkCategoria INT,
IN p_fkmetodo INT,
IN p_cantidad DECIMAL(10,2),
IN p_descripcion VARCHAR(200),
IN p_fechas JSON )
BEGIN

-- OBJETIVO: Registrar el Gasto que realizo un usuario y Actualizar su Monto

-- DECLARAR v_fkMonto --> Va a obtener el id_monto
DECLARE v_fkMonto INT;

-- Query  para obtener el id_monto en base al id del user
SELECT id_monto INTO v_fkMonto 
FROM monto 
WHERE fk_user = p_fkUser;

-- Insertar los datos Correspondientes
INSERT INTO ingresos(fk_monto, fk_tipo, fk_categoria, fk_metodo, cantidad, descripcion, fechas)
VALUES(v_fkMonto, p_fkTipo, p_fkCategoria, p_fkmetodo, p_cantidad, p_descripcion, p_fechas);

-- Actualizar el Monto post-aceptar el nuevo ingreso
UPDATE monto
SET cantidad_actual = cantidad_actual + p_cantidad, update_date = CURRENT_TIMESTAMP()
WHERE id_monto = v_fkMonto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchEmail` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchEmail`(
IN p_email VARCHAR(100)
)
BEGIN

-- OBJETIVO: Buscar todos los datos del email que ingresen, para luego verificar la psw dentro del BackEnd

-- DECLARAR v_verificador para obtener el id del usuario Si llegan a Encontrar el email
DECLARE v_verificador INT;

-- Query para buscar el id del usuario segun el email
SELECT id_user 
INTO v_verificador
FROM USERS 
WHERE email = p_email;

-- Verificar Si es nulo o no
IF v_verificador IS NULL THEN
SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Email Desconocido';
END IF;

-- Obtener todos los datos si Coinciden
SELECT *
FROM USERS
WHERE id_user = v_verificador;


END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchGastosMesActual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchGastosMesActual`(
IN p_iduser INT )
BEGIN

-- OBJETIVO: Buscar 'Cuanto Ha Gastado Durante el Mes Actual' el Usuario

-- DECLARAR VARIABLE: v_fkmonto --> Obtener el Id del Monto a traves del Id del Usuario
DECLARE v_fkmonto INT;

-- Query para obtener el Id_Monto
SELECT id_monto INTO v_fkmonto 
FROM monto 
WHERE fk_user = p_iduser;

-- Query para Obtener la Acumulacion de los gastos del Mes Actual

SELECT SUM(g.cantidad) AS Total_Gastos 
FROM gastos AS g
-- Crear una Tabla Virtual que abarque todas las fechas y sus respectivos gastos
-- Su objetivo es que Cada fecha contenida en formato JSON se convierta en un Registro de la tabla temporal Virtual
JOIN JSON_TABLE( 
-- g.fechas --> Es la Columna que posee datos tipo JSON
g.fechas, 
-- '$[*]' --> Recorrer todos los datos que esten contenidos en la Array
-- COLUMNS(nombre_de_la_columna tipo_de_dato PATH '$.key_seleccionada')
-- En este caso PATH '$' es asi, debido a que solo posee fechas, no tiene keys como un ObjectJson, es un array simple. 
'$[*]' COLUMNS(fecha DATE PATH '$' )
-- Nombrar la tabla Virtual como fechas_json 
) AS fechas_json
-- Condicional que, elige los gastos del monto correspondiente, el monto del usuario
WHERE g.fk_monto = v_fkmonto 
-- Condicionar los gastos seleccionados en base a: Deben ser gastos del mes Actual Y no pueden ser gastos de fechas mayores al dia de hoy.
AND DATE_FORMAT(fechas_json.fecha, '%Y-%m') = DATE_FORMAT(CURDATE(), '%Y-%m')
AND fechas_json.fecha <= CURDATE()
-- Agrupar todos los gastos en base a sus Montos Correspondientes
GROUP BY g.fk_monto;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchMontoUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchMontoUser`(
IN p_id_user INT )
BEGIN

-- OBJETIVO: Buscar el Monto del User que se encuentre en Sesion

-- Declarar variable para verificar que el user tenga un Monto
DECLARE v_verificador INT;

-- Query para Confirmar la existencia del Monto del User
SELECT id_monto 
INTO v_verificador
FROM MONTO
WHERE fk_user = p_id_user;

-- Condicional para saber si no tiene Monto un User
IF v_verificador IS NULL THEN
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'User Sin Monto';
END IF;

-- Query para buscar el monto y demas detalles del usuario
SELECT id_monto, u.username, cantidad_actual, update_date AS ultimaActualizacion 
FROM monto
INNER JOIN users as u
ON monto.fk_user = u.id_user
WHERE monto.fk_user = p_id_user;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SearchUltimos3Movimientos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SearchUltimos3Movimientos`(IN p_iduser INT)
BEGIN

/*
OBJETIVOS: Mostrar
	1. El ultimo Gasto Hormiga
    2. El ultimo Gasto Fijo
    3. El ultimo Ingreso Fijo
*/

-- Declaracion de la variable v_fkmonto para almacenar el Id del monto asociado al usuario recibido como parametro
DECLARE v_fkmonto INT;

-- Obtener el id_monto asociado al usuario, para luego filtrar sus gastos e ingresos
SELECT id_monto INTO v_fkmonto 
FROM monto 
WHERE fk_user = p_iduser;

-- Inicio de la Unificacion de Consultas mediante UNION ALL
-- Cada subconsulta obtiene el movimiento mas reciente de un tipo especifico

-- ===============================
-- 1) ultimo Gasto Hormiga
-- ===============================
SELECT * FROM (
    SELECT 
        fechas_json.fecha,   -- Fecha especifica del gasto desglosada del JSON
        gt.nombre,           -- Nombre del tipo de gasto (referencia a gastos_tipos)
        g.descripcion,       -- Descripcion del gasto
        g.cantidad           -- Monto del gasto
    FROM gastos AS g
    JOIN gastos_tipos AS gt 
        ON g.fk_tipo = gt.id_tipo
    JOIN JSON_TABLE(
        g.fechas,                            -- Columna JSON que almacena fechas de gastos
        '$[*]' COLUMNS(fecha DATE PATH '$')  -- Transformar el array JSON en una tabla virtual de fechas
    ) AS fechas_json
    WHERE fk_monto = v_fkmonto       -- Filtrar solo los gastos asociados al monto del usuario
      AND fk_categoria = 3           -- 3 = Gasto Hormiga
      AND fechas_json.fecha <= CURDATE() -- Evitar tomar fechas futuras
    ORDER BY fechas_json.fecha DESC  -- Obtener la fecha mas reciente primero
    LIMIT 1                          -- Solo el ultimo gasto
) AS sub1

UNION ALL

-- ===============================
-- 2) ultimo Gasto Fijo
-- ===============================
SELECT * FROM (
    SELECT 
        fechas_json.fecha,  
        gt.nombre,           
        g.descripcion,       
        g.cantidad
    FROM gastos AS g
    JOIN gastos_tipos AS gt 
        ON g.fk_tipo = gt.id_tipo
    JOIN JSON_TABLE(
        g.fechas,
        '$[*]' COLUMNS(fecha DATE PATH '$')
    ) AS fechas_json
    WHERE fk_monto = v_fkmonto
      AND fk_categoria = 1           -- 1 = Gasto Fijo
      AND fechas_json.fecha <= CURDATE()
    ORDER BY fechas_json.fecha DESC
    LIMIT 1
) AS sub2

UNION ALL

-- ===============================
-- 3) ultimo Ingreso Fijo
-- ===============================
SELECT * FROM (
    SELECT 
        fechas_json.fecha,  
        it.nombre,           -- Nombre del tipo de ingreso
        i.descripcion,       
        i.cantidad
    FROM ingresos AS i
    JOIN ingresos_tipos AS it
        ON i.fk_tipo = it.id_tipo
    JOIN JSON_TABLE(
        i.fechas,
        '$[*]' COLUMNS(fecha DATE PATH '$')
    ) AS fechas_json
    WHERE fk_monto = v_fkmonto
      AND fk_categoria = 1           -- 1 = Ingreso Fijo
      AND fechas_json.fecha <= CURDATE()
    ORDER BY fechas_json.fecha DESC
    LIMIT 1
) AS sub3;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `search_historial` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `search_historial`(
IN p_valorMin DECIMAL(10,2),
IN p_valorMax DECIMAL(10,2),
IN p_fechaMin DATE,
IN p_fechaMax DATE,
IN p_idUser INT,
IN p_tipoConsulta INT )
BEGIN
-- DECLARAR v_fkMonto para Obtener el id del monto
DECLARE v_fkMonto INT;
-- OBTENER EL ID DEL MONTO
SELECT id_monto
INTO v_fkMonto
FROM MONTO
WHERE fk_user = p_idUser;
-- CREACION DE CASOS SEGUN EL TIPO DE QUERY
CASE p_tipoConsulta
WHEN 1 THEN
SELECT*FROM(
SELECT
'GASTO' AS TIPO,
gt.nombre AS NOMBRE,
g.descripcion AS DETALLES,
g.cantidad AS VALOR,
fj.fecha AS FECHA
FROM GASTOS AS g
JOIN GASTOS_TIPOS AS gt
ON gt.id_tipo = g.fk_tipo
JOIN JSON_TABLE(
g.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fj
-- CONDICIONALES
-- RANGOS DE VALOR
WHERE g.cantidad BETWEEN p_valorMin AND p_valorMax
-- RANGOS DE FECHA
AND fj.fecha BETWEEN p_fechaMin AND p_fechaMax
-- LAS FECHAS NO PUEDEN SER SUPERIOR A HOY
AND fj.fecha <= CURDATE()
-- MONTO CORRESPONDIENTE
AND g.fk_monto = v_fkMonto
) AS sub1
UNION ALL
SELECT*FROM(
SELECT
'INGRESO' AS TIPO,
it.nombre AS NOMBRE,
i.descripcion AS DETALLES,
i.cantidad AS VALOR,
fj.fecha AS FECHA
FROM INGRESOS AS i
JOIN INGRESOS_TIPOS AS it
ON it.id_tipo = i.fk_tipo
JOIN JSON_TABLE(
i.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fj
-- CONDICIONALES
-- RANGOS DE VALOR
WHERE i.cantidad BETWEEN p_valorMin AND p_valorMax
-- RANGOS DE FECHA
AND fj.fecha BETWEEN p_fechaMin AND p_fechaMax
-- FECHAS NO SUPERIORES A HOY
AND fj.fecha <= CURDATE()
-- MONTO CORRESPONDIENTE
AND i.fk_monto = v_fkMonto
) AS sub2
-- ORDENAR POR FECHA
ORDER BY FECHA DESC;
WHEN 2 THEN
SELECT*FROM(
SELECT
'GASTO' AS TIPO,
gt.nombre AS NOMBRE,
g.descripcion AS DETALLES,
g.cantidad AS VALOR,
fj.fecha AS FECHA
FROM GASTOS AS g
JOIN GASTOS_TIPOS AS gt
ON gt.id_tipo = g.fk_tipo
JOIN JSON_TABLE(
g.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fj
-- CONDICIONALES
-- RANGOS DE VALOR
WHERE g.cantidad BETWEEN p_valorMin AND p_valorMax
-- RANGOS DE FECHAS
AND fj.fecha BETWEEN p_fechaMin AND p_fechaMax
-- FECHAS NO SUPERIORES A HOY
AND fj.fecha <= CURDATE()
-- MONTO CORRESPONDIENTE
AND g.fk_monto = v_fkMonto
) sub1
UNION ALL
SELECT*FROM(
SELECT
'INGRESO' AS TIPO,
it.nombre AS NOMBRE,
i.descripcion AS DETALLES,
i.cantidad AS VALOR,
fj.fecha AS FECHA
FROM INGRESOS AS i
JOIN INGRESOS_TIPOS AS it
ON it.id_tipo = i.fk_tipo
JOIN JSON_TABLE(
i.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fj
-- CONDICIONALES
-- RANGOS DE VALOR
WHERE i.cantidad BETWEEN p_valorMin AND p_valorMax
-- RANGOS DE FECHAS
AND fj.fecha BETWEEN p_fechaMin AND p_fechaMax
-- FECHAS MENORES O IGUALES A HOY
AND fj.fecha <= CURDATE()
-- MONTO CORRESPONDIENTE
AND i.fk_monto = v_fkMonto
) AS sub2
-- ORDERNAR POR VALOR
ORDER BY VALOR DESC;
WHEN 3 THEN
SELECT
gc.nombre AS CATEGORIA,
gt.nombre AS TIPO,
g.descripcion AS DETALLES,
g.cantidad AS VALOR,
fj.fecha AS FECHA
FROM GASTOS AS g
JOIN GASTOS_CATEGORIAS AS gc
ON gc.id_categoria = g.fk_categoria
JOIN GASTOS_TIPOS AS gt
ON gt.id_tipo = g.fk_tipo
JOIN JSON_TABLE(
g.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fj
-- CONDICIONALES
-- RANGOS DE VALOR
WHERE g.cantidad BETWEEN p_valorMin AND p_valorMax
-- RANGOS DE FECHAS
AND fj.fecha BETWEEN p_fechaMin AND p_fechaMax
-- FECHAS MENORES O IGUALES A HOY
AND fj.fecha <= CURDATE()
-- MONTO CORRESPONDIENTE
AND g.fk_monto = v_fkMonto
ORDER BY FECHA DESC;
WHEN 4 THEN
SELECT
ic.nombre AS CATEGORIA,
it.nombre AS TIPO,
i.descripcion AS DETALLES,
i.cantidad AS VALOR,
fj.fecha AS FECHA
FROM INGRESOS AS i
JOIN INGRESOS_CATEGORIAS AS ic
ON ic.id_categoria = i.fk_categoria
JOIN INGRESOS_TIPOS AS it
ON it.id_tipo = i.fk_tipo
JOIN JSON_TABLE(
i.fechas,
'$[*]'
COLUMNS(fecha DATE PATH '$')
) AS fj
-- CONDICIONALES
-- RANGOS DE VALOR
WHERE i.cantidad BETWEEN p_valorMin AND p_valorMax
-- RANGOS DE FECHAS
AND fj.fecha BETWEEN p_fechaMin AND p_fechaMax
-- FECHAS MENORES O IGUALES A HOY
AND fj.fecha <= CURDATE()
-- MONTO CORRESPONDIENTE
AND i.fk_monto = v_fkMonto
ORDER BY FECHA DESC;
END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SignUp` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SignUp`(
IN p_username VARCHAR(100),
IN p_email VARCHAR(100),
IN p_psw VARCHAR(100),
IN p_edad INT
)
BEGIN
-- OBJETIVO: Registrar a un Nuevo Usuario

-- Insertar datos del Nuevo user
INSERT INTO users(username, email, psw, age)
VALUES (p_username, p_email, p_psw, p_edad);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-25 13:24:50
USE gario;
SELECT * FROM gastos_clases;
SELECT * FROM gastos_categorias;
SELECT * FROM users;
