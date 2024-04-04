-- Adminer 4.8.1 MySQL 8.0.36-0ubuntu0.22.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `role` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `author` (`id`, `name`, `description`, `role`, `picture`) VALUES
(1,	'lor',	'Bidouilleuse et curieuse, elle partage avec vous ses ressentis, ses trucs et astuces, tout ce qui lui passe par la tête, avec spontanéité et générosité.',	'Développeur web',	'/images/lor.png');

DROP TABLE IF EXISTS `code`;
CREATE TABLE `code` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_771530984B89032C` (`post_id`),
  CONSTRAINT `FK_771530984B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `code` (`id`, `post_id`, `content`, `order_number`) VALUES
(1,	1,	'if (my keyboard is capslocked) {\r\nI code in SQL ;\r\n}\r\n',	4);

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20240322021106',	'2024-03-22 02:21:22',	78),
('DoctrineMigrations\\Version20240322021638',	'2024-03-22 02:21:22',	219),
('DoctrineMigrations\\Version20240322021856',	'2024-03-22 02:21:23',	13),
('DoctrineMigrations\\Version20240322022442',	'2024-03-22 02:24:47',	24),
('DoctrineMigrations\\Version20240322123749',	'2024-03-22 12:37:59',	13),
('DoctrineMigrations\\Version20240322133837',	'2024-03-22 13:38:47',	16),
('DoctrineMigrations\\Version20240322134412',	'2024-03-22 13:44:16',	19);

DROP TABLE IF EXISTS `paragraph`;
CREATE TABLE `paragraph` (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7DD398624B89032C` (`post_id`),
  CONSTRAINT `FK_7DD398624B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `paragraph` (`id`, `post_id`, `content`, `order_number`, `type`) VALUES
(1,	1,	'J\'ai pas trop envie d\'écrire là tout de suite, normal, je viens déjà d\'écrire quelque chose que j\'ai dropé.',	1,	'intro'),
(2,	1,	'Bah oui vous connaissez certainement ça, dropper sa database, ses migrations, ouais, c\'est moins fun que le drag and drop, là c\'est au revoir et à jamais, hasta la vista baby !',	2,	'paragraphe'),
(3,	1,	'Ben finalement j\'ai quand même écrit quelque chose, comme quoi, c\'est comme la bouffe, l\'inspiration vient en écrivant !',	5,	'paragraphe'),
(4,	1,	'if (my keyboard is capslocked) {\r\nI code in SQL ;\r\n}',	4,	'code'),
(5,	1,	'Il faut juste un peu de temps, c\'est ça qui nous manque le plus.',	6,	'paragraphe'),
(6,	1,	'C\'est comme ça que voulez-vous ?',	3,	'paragraphe'),
(7,	2,	'Allez on fait un deuxième article, c\'est histoire de remplir la base de données héhé !',	1,	'intro'),
(8,	2,	'Non mais est-ce que ça vous arrive de coder au milieu de la nuit, genre je me réveille, j\'ai envie de faire pipi, au lieu de ça,  j\'allume le P.C., je crée des bugs, je me recouche parce que j\'ai la main congelée...',	2,	'paragraphe'),
(9,	2,	'Bah moi tout le temps ! ou c\'est la petite qui se met à geindre \"Maman,maman ! Et elle doit se demander qu\'est-ce que je fais à bosser la nuit ??',	3,	'paragraphe'),
(10,	2,	'En vrai ça la dérange pas, au contraire ! L\'autre jour, elle me demande de continuer à jouer avec elle, et moi je lui dis : \" Mais, tu sais, j\'ai pas fini de travailler ! \" - Mais c\'est pas grave Maman ! Tu te réveilleras dans la nuit !',	4,	'paragraphe'),
(11,	2,	'Non mais j\'vous jure ! Faites des gosses ! ( en vrai je suis une vraie mère poule mais bon faut pas dévoiler ses sentiments dans ce monde de brutes... )',	6,	'paragraphe'),
(12,	2,	'php bin/console make:child',	5,	'code'),
(13,	2,	'Bon bref je vais aller pisser !',	6,	'paragraphe'),
(14,	3,	'J\'ai le droit de râler ou pas ?Oui bon, j\'ai le droit, c\'est mon blog, après tout ?? Voilà, je vous explique le contexte :',	1,	'intro'),
(15,	3,	'Je suis actuellement entrain de faire mon projet de groupe final pour clôturer ma formation dev web par une mise en pratique comme sur le terrain.',	2,	'paragraphe'),
(16,	3,	'Bien évidemment, il fallait que je me coltine une nana qui nous a avoué  ne rien avoir suivi de la moitié de la formation alors autant dire que moi qui suis fonceuse, je me dis \"elle va me ralentir\", mais bon, je prends sur moi, c\'est ça la patience, faut s\'adapter aux gens avec qui on travaille !',	3,	'paragraphe'),
(18,	3,	'Du coup, pour lui transmettre des connaissances,j\'ai proposé qu\'on fasse du pair programming pour la mise en place du projet. Elle était entrain de regarder mon collègue coder le premier controller.',	4,	'paragraphe'),
(19,	3,	'Quand tout d\'un coup elle dit \"oh j\'ai rajouté TODO sur le README pour pas qu\'on oublie de le faire \" [comme si j\'allais oublier de le faire ...] et moi je lui dis \"non non ne fais pas ça en ligne, faut le faire dans le repo local!!\" et on continue sur le controller. ',	5,	'paragraphe'),
(20,	3,	'Et voilà, vous devinez, au moment de push : ',	6,	'paragraphe'),
(21,	3,	'! [rejected] blablabla master -> master (fetch first)\r\nerror: failed to push some refs to \'https://github.com/notreProjet/transport.git\'',	7,	'code'),
(22,	3,	'Vous croyez pas qu\'elle aurait pu le dire non ?\r\nElle a cru que j\'allais pas m\'en rendre compte ?\r\nEt mon collègue qui s\'affole et qui copie colle son TODO en local au lieu de git pull 💣',	8,	'paragraphe'),
(23,	3,	'Bref on travaille en équipe !',	9,	'paragraphe'),
(24,	4,	'Mes nerfs sont soumis à rude épreuve !! Le travail en équipe, c\'est notamment s\'adapter à la personnalité de chacun, son rythme...',	1,	'intro'),
(25,	4,	'Moi j\'suis du genre Speedy Gonzales et il a fallu que j\'admire mes collègues taper bin/console doctrine:migrations:migrate pendant 5 minutes entre les fautes de pluriel et les deux points et le / , pourquoi ils veulent pas copier / coller ?? 😭\r\n\r\n',	2,	'paragraphe');

DROP TABLE IF EXISTS `post`;
CREATE TABLE `post` (
  `id` int NOT NULL AUTO_INCREMENT,
  `author_id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5A8A6C8DF675F31B` (`author_id`),
  CONSTRAINT `FK_5A8A6C8DF675F31B` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `post` (`id`, `author_id`, `title`, `date`) VALUES
(1,	1,	'Il y a un début à tout',	'2024-03-22'),
(2,	1,	'Navigation en eaux troubles',	'2024-03-24'),
(3,	1,	'Mais noooon !',	'2024-03-29'),
(4,	1,	'On met mes nerfs à rude épreuve',	'2024-03-30');

DROP TABLE IF EXISTS `post_tag`;
CREATE TABLE `post_tag` (
  `post_id` int NOT NULL,
  `tag_id` int NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_5ACE3AF04B89032C` (`post_id`),
  KEY `IDX_5ACE3AF0BAD26311` (`tag_id`),
  CONSTRAINT `FK_5ACE3AF04B89032C` FOREIGN KEY (`post_id`) REFERENCES `post` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_5ACE3AF0BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `post_tag` (`post_id`, `tag_id`) VALUES
(1,	1);

DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `tag` (`id`, `name`) VALUES
(1,	'biographie'),
(2,	'tuto'),
(3,	'DIY');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_IDENTIFIER_USERNAME` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- 2024-04-04 23:12:51