-- MariaDB dump 10.17  Distrib 10.5.5-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: allyouwatch
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Episodio`
--

DROP TABLE IF EXISTS `Episodio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Episodio` (
  `id` int(11) NOT NULL,
  `idSerieTv` int(11) NOT NULL,
  `idStagione` int(11) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `descrizione` varchar(45) DEFAULT NULL,
  `numeroEpisodio` int(11) NOT NULL,
  PRIMARY KEY (`id`,`idSerieTv`,`idStagione`),
  KEY `fk_Episodio_1_idx` (`idSerieTv`),
  KEY `fk_Episodio_2_idx` (`idStagione`),
  CONSTRAINT `fk_Episodio_1` FOREIGN KEY (`idSerieTv`) REFERENCES `SerieTv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Episodio_2` FOREIGN KEY (`idStagione`) REFERENCES `Stagione` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Episodio`
--

LOCK TABLES `Episodio` WRITE;
/*!40000 ALTER TABLE `Episodio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Episodio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeedbackEpisodio`
--

DROP TABLE IF EXISTS `FeedbackEpisodio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedbackEpisodio` (
  `idUtente` int(11) NOT NULL,
  `idEpisodio` int(11) NOT NULL,
  `idSerieTv` int(11) NOT NULL,
  `idStagione` int(11) NOT NULL,
  `voto` int(11) NOT NULL,
  `commento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtente`,`idEpisodio`,`idSerieTv`,`idStagione`),
  KEY `fk_feedbackEpisode_2_idx` (`idEpisodio`),
  KEY `fk_FeedbackEpisodio_1_idx` (`idUtente`),
  KEY `fk_FeedbackEpisodio_3_idx` (`idSerieTv`),
  KEY `fk_FeedbackEpisodio_4_idx` (`idStagione`),
  CONSTRAINT `fk_FeedbackEpisodio_1` FOREIGN KEY (`idUtente`) REFERENCES `Utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FeedbackEpisodio_2` FOREIGN KEY (`idEpisodio`) REFERENCES `Episodio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FeedbackEpisodio_3` FOREIGN KEY (`idSerieTv`) REFERENCES `SerieTv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FeedbackEpisodio_4` FOREIGN KEY (`idStagione`) REFERENCES `Stagione` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeedbackEpisodio`
--

LOCK TABLES `FeedbackEpisodio` WRITE;
/*!40000 ALTER TABLE `FeedbackEpisodio` DISABLE KEYS */;
/*!40000 ALTER TABLE `FeedbackEpisodio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeedbackFilm`
--

DROP TABLE IF EXISTS `FeedbackFilm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedbackFilm` (
  `idUtente` int(11) NOT NULL,
  `idFilm` int(11) NOT NULL,
  `voto` int(11) NOT NULL,
  `commento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtente`,`idFilm`),
  KEY `fk_FeedbackFilm_2_idx` (`idFilm`),
  CONSTRAINT `fk_FeedbackFilm_1` FOREIGN KEY (`idUtente`) REFERENCES `Utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FeedbackFilm_2` FOREIGN KEY (`idFilm`) REFERENCES `Film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeedbackFilm`
--

LOCK TABLES `FeedbackFilm` WRITE;
/*!40000 ALTER TABLE `FeedbackFilm` DISABLE KEYS */;
/*!40000 ALTER TABLE `FeedbackFilm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeedbackSerieTv`
--

DROP TABLE IF EXISTS `FeedbackSerieTv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedbackSerieTv` (
  `idUtente` int(11) NOT NULL,
  `idSerieTv` int(11) NOT NULL,
  `voto` int(11) NOT NULL,
  `commento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtente`,`idSerieTv`),
  KEY `fk_FeedbackSerieTv_1_idx` (`idSerieTv`),
  CONSTRAINT `fk_FeedbackSerieTv_1` FOREIGN KEY (`idUtente`) REFERENCES `Utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FeedbackSerieTv_2` FOREIGN KEY (`idSerieTv`) REFERENCES `SerieTv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeedbackSerieTv`
--

LOCK TABLES `FeedbackSerieTv` WRITE;
/*!40000 ALTER TABLE `FeedbackSerieTv` DISABLE KEYS */;
/*!40000 ALTER TABLE `FeedbackSerieTv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FeedbackStagione`
--

DROP TABLE IF EXISTS `FeedbackStagione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FeedbackStagione` (
  `idUtente` int(11) NOT NULL,
  `idSerieTv` int(11) NOT NULL,
  `idStagione` int(11) NOT NULL,
  `voto` int(11) NOT NULL,
  `commento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUtente`,`idStagione`,`idSerieTv`),
  KEY `fk_FeedbackStagione_2_idx` (`idStagione`),
  KEY `fk_FeedbackStagione_3_idx` (`idSerieTv`),
  CONSTRAINT `fk_FeedbackStagione_1` FOREIGN KEY (`idUtente`) REFERENCES `Utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FeedbackStagione_2` FOREIGN KEY (`idStagione`) REFERENCES `Stagione` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_FeedbackStagione_3` FOREIGN KEY (`idSerieTv`) REFERENCES `SerieTv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FeedbackStagione`
--

LOCK TABLES `FeedbackStagione` WRITE;
/*!40000 ALTER TABLE `FeedbackStagione` DISABLE KEYS */;
/*!40000 ALTER TABLE `FeedbackStagione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Film`
--

DROP TABLE IF EXISTS `Film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Film` (
  `id` int(11) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `descrizione` varchar(45) DEFAULT NULL,
  `percorsoPoster` varchar(45) DEFAULT NULL,
  `dataDiUscita` date NOT NULL,
  `societaDiProduzione` varchar(45) NOT NULL,
  `cast` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Film`
--

LOCK TABLES `Film` WRITE;
/*!40000 ALTER TABLE `Film` DISABLE KEYS */;
/*!40000 ALTER TABLE `Film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SerieTv`
--

DROP TABLE IF EXISTS `SerieTv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SerieTv` (
  `id` int(11) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `genere` varchar(45) NOT NULL,
  `descrizione` varchar(45) DEFAULT NULL,
  `percorsoPoster` varchar(45) DEFAULT NULL,
  `dataDiUscita` date NOT NULL,
  `societaDiProduzione` varchar(45) NOT NULL,
  `network` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SerieTv`
--

LOCK TABLES `SerieTv` WRITE;
/*!40000 ALTER TABLE `SerieTv` DISABLE KEYS */;
/*!40000 ALTER TABLE `SerieTv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stagione`
--

DROP TABLE IF EXISTS `Stagione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Stagione` (
  `id` int(11) NOT NULL,
  `idSerieTv` int(11) NOT NULL,
  `titolo` varchar(45) NOT NULL,
  `descrizione` varchar(45) DEFAULT NULL,
  `percorsoPoster` varchar(45) DEFAULT NULL,
  `dataDiUscita` varchar(45) NOT NULL,
  `numeroStagione` varchar(45) NOT NULL,
  PRIMARY KEY (`id`,`idSerieTv`),
  KEY `fk_Stagione_1_idx` (`idSerieTv`),
  CONSTRAINT `fk_Stagione_1` FOREIGN KEY (`idSerieTv`) REFERENCES `SerieTv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stagione`
--

LOCK TABLES `Stagione` WRITE;
/*!40000 ALTER TABLE `Stagione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Stagione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TieneTracciaFilm`
--

DROP TABLE IF EXISTS `TieneTracciaFilm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TieneTracciaFilm` (
  `idUtente` int(11) NOT NULL,
  `idFilm` int(11) NOT NULL,
  PRIMARY KEY (`idUtente`,`idFilm`),
  KEY `fk_TieneTracciaFilm_2_idx` (`idFilm`),
  CONSTRAINT `fk_TieneTracciaFilm_1` FOREIGN KEY (`idUtente`) REFERENCES `Utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TieneTracciaFilm_2` FOREIGN KEY (`idFilm`) REFERENCES `Film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TieneTracciaFilm`
--

LOCK TABLES `TieneTracciaFilm` WRITE;
/*!40000 ALTER TABLE `TieneTracciaFilm` DISABLE KEYS */;
/*!40000 ALTER TABLE `TieneTracciaFilm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TieneTracciaTv`
--

DROP TABLE IF EXISTS `TieneTracciaTv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TieneTracciaTv` (
  `idUtente` int(11) NOT NULL,
  `idSerieTv` int(11) NOT NULL,
  PRIMARY KEY (`idUtente`,`idSerieTv`),
  KEY `fk_TieneTracciaTv_2_idx` (`idSerieTv`),
  CONSTRAINT `fk_TieneTracciaTv_1` FOREIGN KEY (`idUtente`) REFERENCES `Utente` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_TieneTracciaTv_2` FOREIGN KEY (`idSerieTv`) REFERENCES `SerieTv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TieneTracciaTv`
--

LOCK TABLES `TieneTracciaTv` WRITE;
/*!40000 ALTER TABLE `TieneTracciaTv` DISABLE KEYS */;
/*!40000 ALTER TABLE `TieneTracciaTv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Utente`
--

DROP TABLE IF EXISTS `Utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Utente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomeCognome` varchar(60) NOT NULL,
  `nomeUtente` varchar(30) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(60) NOT NULL,
  `dataDiNascita` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`nomeUtente`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Utente`
--

LOCK TABLES `Utente` WRITE;
/*!40000 ALTER TABLE `Utente` DISABLE KEYS */;
/*!40000 ALTER TABLE `Utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `id` int(11) NOT NULL,
  `idTv` int(11) NOT NULL,
  `idSeason` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `overview` varchar(45) DEFAULT NULL,
  `episode_number` int(11) DEFAULT NULL,
  `crew` varchar(45) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`idTv`,`idSeason`),
  KEY `idTv` (`idTv`),
  KEY `idSeason` (`idSeason`),
  CONSTRAINT `episode_ibfk_1` FOREIGN KEY (`idTv`) REFERENCES `tv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `episode_ibfk_2` FOREIGN KEY (`idSeason`) REFERENCES `season` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbackEpisode`
--

DROP TABLE IF EXISTS `feedbackEpisode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbackEpisode` (
  `idUser` int(11) NOT NULL,
  `idEpisode` int(11) NOT NULL,
  `vote` int(11) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUser`,`idEpisode`),
  KEY `idEpisode` (`idEpisode`),
  CONSTRAINT `feedbackEpisode_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `feedbackEpisode_ibfk_2` FOREIGN KEY (`idEpisode`) REFERENCES `episode` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbackEpisode`
--

LOCK TABLES `feedbackEpisode` WRITE;
/*!40000 ALTER TABLE `feedbackEpisode` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbackEpisode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbackFilm`
--

DROP TABLE IF EXISTS `feedbackFilm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbackFilm` (
  `idUser` int(11) NOT NULL,
  `idFilm` int(11) NOT NULL,
  `vote` int(11) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUser`,`idFilm`),
  KEY `idFilm` (`idFilm`),
  CONSTRAINT `feedbackFilm_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `feedbackFilm_ibfk_2` FOREIGN KEY (`idFilm`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbackFilm`
--

LOCK TABLES `feedbackFilm` WRITE;
/*!40000 ALTER TABLE `feedbackFilm` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbackFilm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbackSeason`
--

DROP TABLE IF EXISTS `feedbackSeason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbackSeason` (
  `idUser` int(11) NOT NULL,
  `idSeason` int(11) NOT NULL,
  `vote` int(11) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUser`,`idSeason`),
  KEY `idSeason` (`idSeason`),
  CONSTRAINT `feedbackSeason_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `feedbackSeason_ibfk_2` FOREIGN KEY (`idSeason`) REFERENCES `season` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbackSeason`
--

LOCK TABLES `feedbackSeason` WRITE;
/*!40000 ALTER TABLE `feedbackSeason` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbackSeason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbackTv`
--

DROP TABLE IF EXISTS `feedbackTv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feedbackTv` (
  `idUser` int(11) NOT NULL,
  `idTv` int(11) NOT NULL,
  `vote` int(11) DEFAULT NULL,
  `comment` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idUser`,`idTv`),
  KEY `idTv` (`idTv`),
  CONSTRAINT `feedbackTv_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `feedbackTv_ibfk_2` FOREIGN KEY (`idTv`) REFERENCES `tv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbackTv`
--

LOCK TABLES `feedbackTv` WRITE;
/*!40000 ALTER TABLE `feedbackTv` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedbackTv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `film`
--

DROP TABLE IF EXISTS `film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `film` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `overview` varchar(45) DEFAULT NULL,
  `poster_path` varchar(45) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `production_companies` varchar(45) DEFAULT NULL,
  `cast` varchar(45) DEFAULT NULL,
  `vote` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `film`
--

LOCK TABLES `film` WRITE;
/*!40000 ALTER TABLE `film` DISABLE KEYS */;
/*!40000 ALTER TABLE `film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `season` (
  `id` int(11) NOT NULL,
  `idTv` int(11) NOT NULL,
  `title` varchar(45) DEFAULT NULL,
  `overview` varchar(45) DEFAULT NULL,
  `poster_path` varchar(45) DEFAULT NULL,
  `release_date` varchar(45) DEFAULT NULL,
  `season_number` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`idTv`),
  KEY `idTv` (`idTv`),
  CONSTRAINT `season_ibfk_1` FOREIGN KEY (`idTv`) REFERENCES `tv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackingFilm`
--

DROP TABLE IF EXISTS `trackingFilm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackingFilm` (
  `idUser` int(11) NOT NULL COMMENT '	',
  `idFilm` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idFilm`),
  KEY `idFilm` (`idFilm`),
  CONSTRAINT `trackingFilm_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trackingFilm_ibfk_2` FOREIGN KEY (`idFilm`) REFERENCES `film` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackingFilm`
--

LOCK TABLES `trackingFilm` WRITE;
/*!40000 ALTER TABLE `trackingFilm` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackingFilm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackingTv`
--

DROP TABLE IF EXISTS `trackingTv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trackingTv` (
  `idUser` int(11) NOT NULL,
  `idTv` int(11) NOT NULL,
  PRIMARY KEY (`idUser`,`idTv`),
  KEY `idTv` (`idTv`),
  CONSTRAINT `trackingTv_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trackingTv_ibfk_2` FOREIGN KEY (`idTv`) REFERENCES `tv` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackingTv`
--

LOCK TABLES `trackingTv` WRITE;
/*!40000 ALTER TABLE `trackingTv` DISABLE KEYS */;
/*!40000 ALTER TABLE `trackingTv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tv`
--

DROP TABLE IF EXISTS `tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tv` (
  `id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `genre` varchar(45) DEFAULT NULL,
  `overview` varchar(45) DEFAULT NULL,
  `poster_path` varchar(45) DEFAULT NULL,
  `release_date` date DEFAULT NULL,
  `production_companies` varchar(45) DEFAULT NULL,
  `network` varchar(45) DEFAULT NULL,
  `vote` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tv`
--

LOCK TABLES `tv` WRITE;
/*!40000 ALTER TABLE `tv` DISABLE KEYS */;
/*!40000 ALTER TABLE `tv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(60) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(60) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'prova','prova','$2y$10$Yhqlzc23qSq6qCbxmPnMy.otOU7JTQe7VP7M2kAcBjNg4Vcwhob.i','prova@prova.prova','0001-01-01'),(2,'ciao','ciao','ciao','ciao@ciao.it','1998-01-01'),(3,'santino','santino','$2y$10$daWqWWlYtp5HqtAIUOUf6uXaw78B/x1bND9vkcIcdrL.6oKsJEV9O','santinoisgr@gmail.com','1998-01-01'),(4,'Santino Isgrò','santinoisgro','$2y$10$dJp8avL32mIqMiWGA.o6vOygNpuUsjko5J8h/Yb7kpvG8pxTienyu','santinoisgr@live.it','1198-07-28'),(5,'santino','santinoisgr','$2y$10$3Cf0dzhP5oJJ9Ve/qS.N0.JKQ4rnLI95h2Fbo48XNzxRUF4M30Wji','santinoisgr@outlook.it','1998-07-28'),(6,'santinoisgro','santino1234','$2y$10$8IsEFHpA9sCk6M9nr9weD.PM0L88rLcW.flCfBp6Zk7/VDmGhSiyO','santino@ciao.it','1998-07-28'),(7,'prova','prova1234','$2y$10$LD1WJ2f1ZuFornjXDhe/P.mnMDNKoNmNT1dvSCMbBvvux8ykMGFBG','prova@prova.it','1998-07-28'),(8,'santino','santino1','$2y$10$A.Vk/wDKe865Bf9H1uyqGey8U3p8uvzl24HEIUQXgp1z1YLgFOrXe','santino@via.it','1998-07-28'),(9,'prova','prova12','$2y$10$JdMMFLs9RokLxopc1oPrxeSPvzGtDfojWdI7EZu8d67p0Mi.diBkO','prova@it.it','1998-07-28');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-24  1:10:05
