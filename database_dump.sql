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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `version` varchar(191) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
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
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7DD398624B89032C` (`post_id`),
  CONSTRAINT `paragraph_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paragraph`
--

LOCK TABLES `paragraph` WRITE;
/*!40000 ALTER TABLE `paragraph` DISABLE KEYS */;
INSERT INTO `paragraph` VALUES (1,1,'J\'ai pas trop envie d\'écrire là tout de suite, normal, je viens déjà d\'écrire quelque chose que j\'ai dropé.',1,'intro'),(2,1,'Bah oui vous connaissez certainement ça, dropper sa database, ses migrations, ouais, c\'est moins fun que le drag and drop, là c\'est au revoir et à jamais, hasta la vista baby !',2,'paragraphe'),(3,1,'Ben finalement j\'ai quand même écrit quelque chose, comme quoi, c\'est comme la bouffe, l\'inspiration vient en écrivant !',5,'paragraphe'),(4,1,'if (my keyboard is capslocked) {\r\nI code in SQL ;\r\n}',4,'code'),(5,1,'Il faut juste un peu de temps, c\'est ça qui nous manque le plus.',6,'paragraphe'),(6,1,'C\'est comme ça que voulez-vous ?',3,'paragraphe'),(7,2,'Allez on fait un deuxième article, c\'est histoire de remplir la base de données héhé !',1,'intro'),(8,2,'Non mais est-ce que ça vous arrive de coder au milieu de la nuit, genre je me réveille, j\'ai envie de faire pipi, au lieu de ça,  j\'allume le P.C., je crée des bugs, je me recouche parce que j\'ai la main congelée...',2,'paragraphe'),(9,2,'Bah moi tout le temps ! ou c\'est la petite qui se met à geindre \"Maman,maman ! Et elle doit se demander qu\'est-ce que je fais à bosser la nuit ??',3,'paragraphe'),(10,2,'En vrai ça la dérange pas, au contraire ! L\'autre jour, elle me demande de continuer à jouer avec elle, et moi je lui dis : \" Mais, tu sais, j\'ai pas fini de travailler ! \" - Mais c\'est pas grave Maman ! Tu te réveilleras dans la nuit !',4,'paragraphe'),(11,2,'Non mais j\'vous jure ! Faites des gosses ! ( en vrai je suis une vraie mère poule mais bon faut pas dévoiler ses sentiments dans ce monde de brutes... )',6,'paragraphe'),(12,2,'php bin/console make:child',5,'code'),(13,2,'Bon bref je vais aller pisser !',6,'paragraphe'),(14,3,'J\'ai le droit de râler ou pas ?Oui bon, j\'ai le droit, c\'est mon blog, après tout ?? Voilà, je vous explique le contexte :',1,'intro'),(15,3,'Je suis actuellement entrain de faire mon projet de groupe final pour clôturer ma formation dev web par une mise en pratique comme sur le terrain.',2,'paragraphe'),(16,3,'Bien évidemment, il fallait que je me coltine une nana qui nous a avoué  ne rien avoir suivi de la moitié de la formation alors autant dire que moi qui suis fonceuse, je me dis \"elle va me ralentir\", mais bon, je prends sur moi, c\'est ça la patience, faut s\'adapter aux gens avec qui on travaille !',3,'paragraphe'),(18,3,'Du coup, pour lui transmettre des connaissances,j\'ai proposé qu\'on fasse du pair programming pour la mise en place du projet. Elle était entrain de regarder mon collègue coder le premier controller.',4,'paragraphe'),(19,3,'Quand tout d\'un coup elle dit \"oh j\'ai rajouté TODO sur le README pour pas qu\'on oublie de le faire \" [comme si j\'allais oublier de le faire ...] et moi je lui dis \"non non ne fais pas ça en ligne, faut le faire dans le repo local!!\" et on continue sur le controller. ',5,'paragraphe'),(20,3,'Et voilà, vous devinez, au moment de push : ',6,'paragraphe'),(21,3,'! [rejected] blablabla master -> master (fetch first)\r\nerror: failed to push some refs to \'https://github.com/notreProjet/transport.git\'',7,'code'),(22,3,'Vous croyez pas qu\'elle aurait pu le dire non ?\r\nElle a cru que j\'allais pas m\'en rendre compte ?\r\nEt mon collègue qui s\'affole et qui copie colle son TODO en local au lieu de git pull 💣',8,'paragraphe'),(23,3,'Bref on travaille en équipe !',9,'paragraphe'),(24,4,'Mes nerfs sont soumis à rude épreuve !! Le travail en équipe, c\'est notamment s\'adapter à la personnalité de chacun, son rythme...',1,'intro'),(25,4,'Moi j\'suis du genre Speedy Gonzales et il a fallu que j\'admire mes collègues taper bin/console doctrine:migrations:migrate pendant 5 minutes entre les fautes de pluriel et les deux points et le / , pourquoi ils veulent pas copier / coller ?? 😭\r\n\r\n',2,'paragraphe'),(26,5,'Il parait qu\'on doit pas mettre en prod\' un vendredi ? Vous y croyez à cette légende urbaine ?',1,'paragraphe'),(27,5,'Bah moi, j\'ai dit \"Si ! On va déployer un vendredi ! C\'est un jour comme un autre !\" ...',2,'paragraphe'),(28,5,'\"Euh ! ouais ! bah heureusement que j\'avais pas un train à prendre après !',3,'paragraphe'),(29,5,'Parce que je sais plus à quelle heure on a fini mais déjà on a été trop vite, on a cloné un projet avec des problèmes de migrations, puis il s\'est avéré qu\'il y avait des dépendances qui étaient pas installables en env de prod...\" \r\nOn en vient à mon prochain post sur le déploiement qui arrive là, tout de suite !\"',4,'paragraphe'),(30,6,'Moi j\'aime bien rigoler ! Mais y a un truc avec lequel faut pas rigoler, ben c\'est le déploiement ... 💣 !',1,'paragraphe'),(31,6,'Ce blog, il a été déployé à l\'arrache, enfin, c\'est en déployant qu\'on devient déployeur...',2,'paragraphe'),(32,6,'D\'abord j\'ai cloné le repo en étant en root, et du coup j\'ai fait un composer install en root, pourtant c\'était dit qu\'il fallait pas mais je voulais voir ce que ça allait faire...\n',3,'paragraphe'),(33,6,'Et bien je sais plus, mais en tout cas, ça m\'a bloquée à un moment !',4,'paragraphe'),(34,6,'Et puis j\'ai voulu laissé en env de dev pour voir...',5,'paragraphe'),(35,6,'Un pote à qui je montre le site il me demande \"C\'est quoi cette barre en bas du site ?\" - Ah oups c\'est la debug bar de Symfony :) ... ',6,'paragraphe'),(36,15,'Oui, je l\'avoue, j\'ai osé mettre ma life dans un Kanban...Bon pas tout hein... Mais bon, j\'ai osé... ;)',1,'paragraphe'),(61,49,'On est trop contents quand ça marche, on lance l\'app en espérant qu\'il n\'y ait pas de message d\'erreur',1,'intro'),(62,49,'Et ben non voilà c\'était trop facile sinon !',2,'intro'),(63,49,'En fait, des fois, voire souvent, je suis sûre que ça vous arrive tout le temps, vous êtes étonnés quand ça marche, y a un meme qui représente ça très bien.',3,'paragraphe'),(65,11,'Je suis sûre qu\'il y a des dev qui disent qu\'ils préfèrent le back, tout ça à cause de mésaventures avec le responsive !',1,'intro'),(66,11,'En fait, on dit que le CSS, c\'est pas un langage de programmation, ok, je suis tout à fait d\'accord avec ça ! Mais n\'empêche que ça me prend la tête et que je trouve ça super chronophage.',2,'paragraphe'),(67,11,'Que ce soit en CSS natif, avec SASS, Bootstrap, Tailwind, y a toujours un moment où je bloque pour positionner ou dimensionner quelque chose correctement... Pas vous ?? 🤔',3,'paragraphe'),(68,11,'#lor { align-self : droit-au-but ; }',3,'code'),(69,15,'En fait,  c\'était mon premier jour post-formation, et là j\'ai réalisé que, comme d\'habitude, j\'avais plein de choses à terminer, mais alors PLEIN !',2,'paragraphe'),(70,15,'Entre les dossiers pour le titre pro, les recherches d\'emploi, le portfolio et tous les autres projets sur lesquels il faut avancer, j\'ai l\'impression de partir dans tous les sens. Ce qui est pas faux...',2,'paragraphe'),(71,15,'Partir dans tous les sens me semble nécessaire en fait, je vais pas passer ma journée à faire du Word non plus, j\'ai besoin de coder quand même, mais bon faut être organisée et écrire mes todolist sur mes bouts de papier brouillon (chut, le beau dessin de ma fille ! ... ) ou dans mon app maison inachevée, c\'est pas super optimal !',3,'paragraphe'),(72,15,'Donc voilà, j\'ai mis ma life dans un Kanban 😅 j\'pourrais dire que j\'ai pratiqué la méthodo Agile au quotidien 😅',5,'paragraphe'),(73,15,'cd /home/lor/maLife\r\nls \r\ntitrepro portfolio trouverBoulot marmotte menage',4,'code'),(74,15,'ls \r\n',5,'code'),(75,15,'titrepro portfolio trouverBoulot marmotte menage',6,'code');
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
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`),
  CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,1,'Il y a un début à tout','2024-03-22'),(2,1,'Navigation en eaux troubles','2024-03-24'),(3,1,'Mais noooon !','2024-03-29'),(4,1,'On met mes nerfs à rude épreuve','2024-03-30'),(5,1,'On met en production un vendredi','2024-04-05'),(6,1,'On rigole pas avec le déploiement','2024-04-08'),(11,1,'Je hais le responsive','2024-05-10'),(15,1,'J\'ai mis ma life dans un Kanban','2024-04-23'),(49,1,'Je crois que ça marche','2024-05-02');
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
INSERT INTO `post_tag` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(11,1),(15,1),(49,1);
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
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
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

-- Dump completed on 2024-05-13  5:34:21
