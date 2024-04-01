-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: blogLor
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'lor','Bidouilleuse et curieuse, elle partage avec vous ses ressentis, ses trucs et astuces, tout ce qui lui passe par la tête, avec spontanéité et générosité.','Développeur web','/images/lor.png');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `code`
--

DROP TABLE IF EXISTS `code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_771530984B89032C` (`post_id`),
  CONSTRAINT `FK_771530984B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `code`
--

LOCK TABLES `code` WRITE;
/*!40000 ALTER TABLE `code` DISABLE KEYS */;
INSERT INTO `code` VALUES (1,1,'if (my keyboard is capslocked) {\r\nI code in SQL ;\r\n}\r\n',4);
/*!40000 ALTER TABLE `code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctrine_migration_versions`
--

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20240322021106','2024-03-22 02:21:22',78),('DoctrineMigrations\\Version20240322021638','2024-03-22 02:21:22',219),('DoctrineMigrations\\Version20240322021856','2024-03-22 02:21:23',13),('DoctrineMigrations\\Version20240322022442','2024-03-22 02:24:47',24),('DoctrineMigrations\\Version20240322123749','2024-03-22 12:37:59',13),('DoctrineMigrations\\Version20240322133837','2024-03-22 13:38:47',16),('DoctrineMigrations\\Version20240322134412','2024-03-22 13:44:16',19);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paragraph`
--

DROP TABLE IF EXISTS `paragraph`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paragraph` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7DD398624B89032C` (`post_id`),
  CONSTRAINT `FK_7DD398624B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragraph`
--

LOCK TABLES `paragraph` WRITE;
/*!40000 ALTER TABLE `paragraph` DISABLE KEYS */;
INSERT INTO `paragraph` VALUES (1,1,'J\'ai pas trop envie d\'écrire là tout de suite, normal, je viens déjà d\'écrire quelque chose que j\'ai dropé.',1,'intro'),(2,1,'Bah oui vous connaissez certainement ça, dropper sa database, ses migrations, ouais, c\'est moins fun que le drag and drop, là c\'est au revoir et à jamais, hasta la vista baby !',2,'paragraphe'),(3,1,'Ben finalement j\'ai quand même écrit quelque chose, comme quoi, c\'est comme la bouffe, l\'inspiration vient en écrivant !',5,'paragraphe'),(4,1,'if (my keyboard is capslocked) {\r\nI code in SQL ;\r\n}',4,'code'),(5,1,'Il faut juste un peu de temps, c\'est ça qui nous manque le plus.',6,'paragraphe'),(6,1,'C\'est comme ça que voulez-vous ?',3,'paragraphe'),(7,2,'Allez on fait un deuxième article, c\'est histoire de remplir la base de données héhé !',1,'intro'),(8,2,'Non mais est-ce que ça vous arrive de coder au milieu de la nuit, genre je me réveille, j\'ai envie de faire pipi, au lieu de ça,  j\'allume le P.C., je crée des bugs, je me recouche parce que j\'ai la main congelée...',2,'paragraphe'),(9,2,'Bah moi tout le temps ! ou c\'est la petite qui se met à geindre \"Maman,maman ! Et elle doit se demander qu\'est-ce que je fais à bosser la nuit ??',3,'paragraphe'),(10,2,'En vrai ça la dérange pas, au contraire ! L\'autre jour, elle me demande de continuer à jouer avec elle, et moi je lui dis : \" Mais, tu sais, j\'ai pas fini de travailler ! \" - Mais c\'est pas grave Maman ! Tu te réveilleras dans la nuit !',4,'paragraphe'),(11,2,'Non mais j\'vous jure ! Faites des gosses ! ( en vrai je suis une vraie mère poule mais bon faut pas dévoiler ses sentiments dans ce monde de brutes... )',6,'paragraphe'),(12,2,'php bin/console make:child',5,'code'),(13,2,'Bon bref je vais aller pisser !',6,'paragraphe'),(14,3,'J\'ai le droit de râler ou pas ?Oui bon, j\'ai le droit, c\'est mon blog, après tout ?? Voilà, je vous explique le contexte :',1,'intro'),(15,3,'Je suis actuellement entrain de faire mon projet de groupe final pour clôturer ma formation dev web par une mise en pratique comme sur le terrain.',2,'paragraphe'),(16,3,'Bien évidemment, il fallait que je me coltine une nana qui nous a avoué  ne rien avoir suivi de la moitié de la formation alors autant dire que moi qui suis fonceuse, je me dis \"elle va me ralentir\", mais bon, je prends sur moi, c\'est ça la patience, faut s\'adapter aux gens avec qui on travaille !',3,'paragraphe'),(18,3,'Du coup, pour lui transmettre des connaissances,j\'ai proposé qu\'on fasse du pair programming pour la mise en place du projet. Elle était entrain de regarder mon collègue coder le premier controller.',4,'paragraphe'),(19,3,'Quand tout d\'un coup elle dit \"oh j\'ai rajouté TODO sur le README pour pas qu\'on oublie de le faire \" [comme si j\'allais oublier de le faire ...] et moi je lui dis \"non non ne fais pas ça en ligne, faut le faire dans le repo local!!\" et on continue sur le controller. ',5,'paragraphe'),(20,3,'Et voilà, vous devinez, au moment de push : ',6,'paragraphe'),(21,3,'! [rejected] blablabla master -> master (fetch first)\r\nerror: failed to push some refs to \'https://github.com/notreProjet/transport.git\'',7,'code'),(22,3,'Vous croyez pas qu\'elle aurait pu le dire non ?\r\nElle a cru que j\'allais pas m\'en rendre compte ?\r\nEt mon collègue qui s\'affole et qui copie colle son TODO en local au lieu de git pull 💣',8,'paragraphe'),(23,3,'Bref on travaille en équipe !',9,'paragraphe'),(24,4,'Mes nerfs sont soumis à rude épreuve !! Le travail en équipe, c\'est notamment s\'adapter à la personnalité de chacun, son rythme...',1,'intro'),(25,4,'Moi j\'suis du genre Speedy Gonzales et il a fallu que j\'admire mes collègues taper bin/console doctrine:migrations:migrate pendant 5 minutes entre les fautes de pluriel et les deux points et le / , pourquoi ils veulent pas copier / coller ?? 😭\r\n\r\n',2,'paragraphe');
/*!40000 ALTER TABLE `paragraph` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`),
  CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'Il y a un début à tout','2024-03-22'),(2,1,'Navigation en eaux troubles','2024-03-24'),(3,1,'Mais noooon !','2024-03-29'),(4,1,'On met mes nerfs à rude épreuve','2024-03-30');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tag`
--

DROP TABLE IF EXISTS `post_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tag` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_5ACE3AF04B89032C` (`post_id`),
  KEY `IDX_5ACE3AF0BAD26311` (`tag_id`),
  CONSTRAINT `FK_5ACE3AF04B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5ACE3AF0BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tag`
--

LOCK TABLES `post_tag` WRITE;
/*!40000 ALTER TABLE `post_tag` DISABLE KEYS */;
INSERT INTO `post_tag` VALUES (1,1);
/*!40000 ALTER TABLE `post_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'biographie'),(2,'tuto'),(3,'DIY');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2024-04-01  7:17:42
