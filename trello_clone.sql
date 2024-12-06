-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: trello_clone
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES (1,'Доска 1','2024-11-26 05:36:57'),(2,'Доска 2','2024-11-26 05:36:57'),(3,'Доска 3','2024-11-26 05:36:57'),(4,'Доска 4','2024-11-26 05:36:57'),(5,'Доска 5','2024-11-26 05:36:57');
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card_assignees`
--

DROP TABLE IF EXISTS `card_assignees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card_assignees` (
  `card_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`card_id`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `card_assignees_ibfk_1` FOREIGN KEY (`card_id`) REFERENCES `cards` (`id`),
  CONSTRAINT `card_assignees_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card_assignees`
--

LOCK TABLES `card_assignees` WRITE;
/*!40000 ALTER TABLE `card_assignees` DISABLE KEYS */;
INSERT INTO `card_assignees` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(1,6),(3,6),(4,6);
/*!40000 ALTER TABLE `card_assignees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cards`
--

DROP TABLE IF EXISTS `cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `list_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `position` int DEFAULT '0',
  `due_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `list_id` (`list_id`),
  CONSTRAINT `cards_ibfk_1` FOREIGN KEY (`list_id`) REFERENCES `lists` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cards`
--

LOCK TABLES `cards` WRITE;
/*!40000 ALTER TABLE `cards` DISABLE KEYS */;
INSERT INTO `cards` VALUES (1,1,'Задача 1','Описание задачи 1',0,'2024-12-01 07:00:00'),(2,1,'Задача 2','Описание задачи 2',1,'2024-12-02 09:00:00'),(3,2,'Задача 3','Описание задачи 3',0,'2024-12-05 11:00:00'),(4,2,'Задача 4','Описание задачи 4',1,'2024-12-06 13:00:00'),(5,3,'Задача 5','Описание задачи 5',0,'2024-12-10 15:00:00'),(6,4,'Задача 6','Описание задачи 6',0,'2024-12-15 07:00:00'),(7,4,'Задача 7','Описание задачи 7',1,'2024-12-17 09:00:00'),(8,5,'Задача 8','Описание задачи 8',0,'2024-12-20 11:00:00'),(9,5,'Задача 9','Описание задачи 9',1,'2024-12-22 13:00:00'),(10,1,'Задача 10','Описание задачи 10',1,'2024-12-23 15:00:00'),(11,2,'Задача 11','Описание задачи 11',2,'2024-12-25 17:00:00'),(12,3,'Задача 12','Описание задачи 12',1,'2024-12-26 09:00:00'),(13,4,'Задача 13','Описание задачи 13',2,'2024-12-27 11:00:00'),(14,5,'Задача 14','Описание задачи 14',2,'2024-12-28 13:00:00'),(15,1,'Задача 15','Описание задачи 15',2,'2024-12-30 15:00:00'),(16,2,'Задача 16','Описание задачи 16',2,'2024-12-31 07:00:00'),(17,3,'Задача 17','Описание задачи 17',3,'2024-12-30 09:00:00'),(18,4,'Задача 18','Описание задачи 18',3,'2024-12-31 11:00:00'),(19,5,'Задача 19','Описание задачи 19',3,'2024-12-30 13:00:00'),(20,1,'Задача 20','Описание задачи 20',3,'2024-12-31 15:00:00'),(21,2,'Задача 21','Описание задачи 21',3,'2025-01-02 07:00:00'),(22,3,'Задача 22','Описание задачи 22',4,'2025-01-05 09:00:00'),(23,4,'Задача 23','Описание задачи 23',4,'2025-01-07 11:00:00'),(24,5,'Задача 24','Описание задачи 24',4,'2025-01-10 13:00:00'),(25,1,'Задача 25','Описание задачи 25',4,'2025-01-12 15:00:00'),(26,2,'Задача 26','Описание задачи 26',5,'2025-01-15 07:00:00'),(27,3,'Задача 27','Описание задачи 27',5,'2025-01-18 09:00:00'),(28,4,'Задача 28','Описание задачи 28',5,'2025-01-20 11:00:00'),(29,5,'Задача 29','Описание задачи 29',5,'2025-01-22 13:00:00'),(30,1,'Задача 30','Описание задачи 30',5,'2025-01-25 15:00:00'),(31,2,'Задача 31','Описание задачи 31',6,'2025-01-30 07:00:00'),(32,3,'Задача 32','Описание задачи 32',6,'2025-02-02 09:00:00'),(33,4,'Задача 33','Описание задачи 33',6,'2025-02-05 11:00:00'),(34,5,'Задача 34','Описание задачи 34',6,'2025-02-07 13:00:00'),(35,1,'Задача 35','Описание задачи 35',6,'2025-02-10 15:00:00'),(36,2,'Задача 36','Описание задачи 36',7,'2025-02-12 07:00:00'),(37,3,'Задача 37','Описание задачи 37',7,'2025-02-15 09:00:00'),(38,4,'Задача 38','Описание задачи 38',7,'2025-02-17 11:00:00'),(39,5,'Задача 39','Описание задачи 39',7,'2025-02-20 13:00:00'),(40,1,'Задача 40','Описание задачи 40',7,'2025-02-22 15:00:00'),(41,2,'Задача 41','Описание задачи 41',8,'2025-02-25 07:00:00'),(42,3,'Задача 42','Описание задачи 42',8,'2025-02-27 09:00:00'),(43,4,'Задача 43','Описание задачи 43',8,'2025-03-02 11:00:00'),(44,5,'Задача 44','Описание задачи 44',8,'2025-03-05 13:00:00'),(45,1,'Задача 45','Описание задачи 45',8,'2025-03-08 15:00:00'),(46,2,'Задача 46','Описание задачи 46',9,'2025-03-10 07:00:00'),(47,3,'Задача 47','Описание задачи 47',9,'2025-03-12 09:00:00'),(48,4,'Задача 48','Описание задачи 48',9,'2025-03-15 11:00:00'),(49,5,'Задача 49','Описание задачи 49',9,'2025-03-18 13:00:00');
/*!40000 ALTER TABLE `cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lists`
--

DROP TABLE IF EXISTS `lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `board_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `position` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `board_id` (`board_id`),
  CONSTRAINT `lists_ibfk_1` FOREIGN KEY (`board_id`) REFERENCES `boards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lists`
--

LOCK TABLES `lists` WRITE;
/*!40000 ALTER TABLE `lists` DISABLE KEYS */;
INSERT INTO `lists` VALUES (1,1,'Сделать',0),(2,1,'В процессе',1),(3,1,'Готово',2),(4,2,'Задачи',0),(5,2,'Ожидание',1),(6,2,'Завершено',2),(7,3,'Идеи',0),(8,3,'Разработка',1),(9,3,'Тестирование',2),(10,4,'Запланировано',0),(11,4,'В работе',1),(12,4,'Закрыто',2),(13,5,'Мои задачи',0),(14,5,'В процессе',1),(15,5,'Архив',2);
/*!40000 ALTER TABLE `lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Иван Иванов','ivan.ivanov@example.com',''),(2,'Мария Петрова','maria.petrova@example.com',''),(3,'Алексей Сидоров','aleksey.sidorov@example.com',''),(4,'Ольга Кузнецова','olga.kuznetsova@example.com',''),(5,'Дмитрий Волков','dmitry.volkov@example.com',''),(6,'Александр ','biontos11@gmail.com','15102006');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-27  9:47:28
