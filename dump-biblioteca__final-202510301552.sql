-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca__final
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `ID_Autor` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Nacionalidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Autor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'José Saramago','Portuguesa'),(2,'J.K. Rowling','Britânica'),(3,'Gabriel García Márquez','Colombiana'),(4,'Virginia Woolf','Britânica'),(5,'Fernando Pessoa','Portuguesa'),(6,'Isabel Allende','Chilena'),(7,'George Orwell','Britânica'),(8,'Sophia de Mello Breyner','Portuguesa'),(9,'Eça de Queirós','Portuguesa'),(10,'Homer','Grega'),(11,'António Lobo Antunes','Portuguesa');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `ID_Editora` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Cidade` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Editora`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'Caminho','Lisboa'),(2,'Bloomsbury','Londres'),(3,'Sudamericana','Buenos Aires'),(4,'Hogarth Press','Londres'),(5,'Ática','Lisboa'),(6,'Plaza & Janés','Barcelona'),(7,'Secker & Warburg','Londres'),(8,'Bompiani','Milão'),(9,'Lello','Porto'),(10,'Clássicos','Atenas');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palavra_chave`
--

DROP TABLE IF EXISTS `palavra_chave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palavra_chave` (
  `ID_Palavra` int NOT NULL AUTO_INCREMENT,
  `Palavra` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Palavra`),
  UNIQUE KEY `Palavra` (`Palavra`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palavra_chave`
--

LOCK TABLES `palavra_chave` WRITE;
/*!40000 ALTER TABLE `palavra_chave` DISABLE KEYS */;
INSERT INTO `palavra_chave` VALUES (9,'Clássicos'),(6,'Distopia'),(2,'Fantasia'),(7,'Ficção Científica'),(11,'Filosofia'),(1,'Literatura Portuguesa'),(4,'Modernismo'),(8,'Poesia'),(10,'Política'),(3,'Realismo Mágico'),(5,'Romance Histórico');
/*!40000 ALTER TABLE `palavra_chave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacao`
--

DROP TABLE IF EXISTS `publicacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacao` (
  `ID_Publicacao` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(150) NOT NULL,
  `Ano` year DEFAULT NULL,
  `Cota` varchar(10) DEFAULT NULL,
  `ID_Editora` int DEFAULT NULL,
  `Estado` enum('disponível','requisitada','reservada','consultada') DEFAULT 'disponível',
  PRIMARY KEY (`ID_Publicacao`),
  KEY `ID_Editora` (`ID_Editora`),
  CONSTRAINT `publicacao_ibfk_1` FOREIGN KEY (`ID_Editora`) REFERENCES `editora` (`ID_Editora`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacao`
--

LOCK TABLES `publicacao` WRITE;
/*!40000 ALTER TABLE `publicacao` DISABLE KEYS */;
INSERT INTO `publicacao` VALUES (1,'Ensaio sobre a Cegueira',1995,'L01A',1,'disponível'),(2,'Harry Potter e a Pedra Filosofal',1997,'F05B',2,'requisitada'),(3,'Cem Anos de Solidão',1967,'RM02C',3,'reservada'),(4,'Mrs. Dalloway',1925,'M03D',4,'disponível'),(5,'Livro do Desassossego',1982,'L01B',5,'consultada'),(6,'A Casa dos Espíritos',1982,'RH01E',6,'disponível'),(7,'1984',1949,'D01F',7,'requisitada'),(8,'O Nome da Rosa',1980,'RH02G',8,'disponível'),(9,'A Cidade e as Serras',1901,'L02H',9,'reservada'),(10,'A Odisseia',1901,'CL01I',10,'disponível'),(11,'As Intermitências da Morte',2005,'L01J',1,'disponível');
/*!40000 ALTER TABLE `publicacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacao_autor`
--

DROP TABLE IF EXISTS `publicacao_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publicacao_autor` (
  `ID_Publicacao` int NOT NULL,
  `ID_Autor` int NOT NULL,
  `Ordem` int DEFAULT NULL,
  PRIMARY KEY (`ID_Publicacao`,`ID_Autor`),
  KEY `ID_Autor` (`ID_Autor`),
  CONSTRAINT `publicacao_autor_ibfk_1` FOREIGN KEY (`ID_Publicacao`) REFERENCES `publicacao` (`ID_Publicacao`),
  CONSTRAINT `publicacao_autor_ibfk_2` FOREIGN KEY (`ID_Autor`) REFERENCES `autor` (`ID_Autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacao_autor`
--

LOCK TABLES `publicacao_autor` WRITE;
/*!40000 ALTER TABLE `publicacao_autor` DISABLE KEYS */;
INSERT INTO `publicacao_autor` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,1),(7,7,1),(8,7,1),(9,9,1),(10,10,1),(11,1,1);
/*!40000 ALTER TABLE `publicacao_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisicao`
--

DROP TABLE IF EXISTS `requisicao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requisicao` (
  `ID_Requisicao` int NOT NULL AUTO_INCREMENT,
  `ID_Requisitante` int DEFAULT NULL,
  `ID_Publicacao` int DEFAULT NULL,
  `Data_Requisicao` date NOT NULL,
  `Data_Entrega` date DEFAULT NULL,
  `Estado` enum('ativa','devolvida','atrasada') DEFAULT 'ativa',
  PRIMARY KEY (`ID_Requisicao`),
  KEY `ID_Requisitante` (`ID_Requisitante`),
  KEY `ID_Publicacao` (`ID_Publicacao`),
  CONSTRAINT `requisicao_ibfk_1` FOREIGN KEY (`ID_Requisitante`) REFERENCES `requisitante` (`ID_Requisitante`),
  CONSTRAINT `requisicao_ibfk_2` FOREIGN KEY (`ID_Publicacao`) REFERENCES `publicacao` (`ID_Publicacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisicao`
--

LOCK TABLES `requisicao` WRITE;
/*!40000 ALTER TABLE `requisicao` DISABLE KEYS */;
/*!40000 ALTER TABLE `requisicao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisitante`
--

DROP TABLE IF EXISTS `requisitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `requisitante` (
  `ID_Requisitante` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) NOT NULL,
  `Num_ID` varchar(20) DEFAULT NULL,
  `Morada` varchar(150) DEFAULT NULL,
  `Telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_Requisitante`),
  UNIQUE KEY `Num_ID` (`Num_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisitante`
--

LOCK TABLES `requisitante` WRITE;
/*!40000 ALTER TABLE `requisitante` DISABLE KEYS */;
INSERT INTO `requisitante` VALUES (1,'João Silva','1234567A','Rua das Flores, 10','911234567'),(2,'Ana Ferreira','9876543B','Avenida da Liberdade, 5','932345678'),(3,'Pedro Costa','1122334C','Travessa da Sé, 21','963456789'),(4,'Rita Gomes','5566778D','Praça do Comércio, 1','914567890'),(5,'Mário Santos','9900112E','Rua Nova, 45','935678901'),(6,'Susana Pinto','3344556F','Largo da Feira, 12','966789012'),(7,'Carlos Martins','7788990G','Alameda dos Oceanos, 3','917890123'),(8,'Helena Lima','0011223H','Rua Principal, 7','938901234'),(9,'Rui Oliveira','4455667I','Bairro Novo, 50','969012345'),(10,'Laura Rodrigues','8899001J','Estrada Nacional, 2','910123456'),(11,'Tiago Fernandes','1098765K','Rua dos Mercadores, 33','931234560');
/*!40000 ALTER TABLE `requisitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'biblioteca__final'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-30 15:52:57
