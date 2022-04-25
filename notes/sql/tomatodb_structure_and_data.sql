-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tomatodb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tomatodb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tomatodb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tomatodb` ;

-- -----------------------------------------------------
-- Table `tomatodb`.`varieties`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`varieties` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `variety_name` VARCHAR(100) NOT NULL,
  `category` VARCHAR(100) NOT NULL,
  `color` VARCHAR(100) NULL DEFAULT NULL,
  `image_url` VARCHAR(3000) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `variety_name` (`variety_name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 92
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`plants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`plants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `variety_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_plants_varieties_idx` (`variety_id` ASC) VISIBLE,
  CONSTRAINT `FK_plants_varieties`
    FOREIGN KEY (`variety_id`)
    REFERENCES `tomatodb`.`varieties` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 196
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`plots`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`plots` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `soil_makeup` VARCHAR(1000) NULL DEFAULT NULL,
  `cultivation_style` VARCHAR(1000) NULL DEFAULT NULL,
  `spaces_total` INT NOT NULL,
  `spaces_taken` INT NOT NULL,
  `user_fullname` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_plots_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_plots_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `tomatodb`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`plots_plants`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`plots_plants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `plot_id` INT NOT NULL,
  `plant_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `FK_plots_plants_plot_id_idx` (`plot_id` ASC) VISIBLE,
  INDEX `FK_plots_plants_plant_id_idx` (`plant_id` ASC) VISIBLE,
  CONSTRAINT `FK_plots_plants_plant_id`
    FOREIGN KEY (`plant_id`)
    REFERENCES `tomatodb`.`plants` (`id`),
  CONSTRAINT `FK_plots_plants_plot_id`
    FOREIGN KEY (`plot_id`)
    REFERENCES `tomatodb`.`plots` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 196
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tomatodb`.`user_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tomatodb`.`user_roles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `user_role` VARCHAR(45) NOT NULL,
  `create_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `FK_user_roles_user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_user_roles_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `tomatodb`.`users` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 74
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: tomatodb
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Dumping data for table `plants`
--

LOCK TABLES `plants` WRITE;
/*!40000 ALTER TABLE `plants` DISABLE KEYS */;
INSERT INTO `plants` VALUES (1,1),(2,1),(181,1),(182,1),(3,2),(4,3),(5,3),(71,3),(72,3),(6,4),(7,5),(8,5),(9,6),(125,7),(126,7),(127,7),(128,7),(129,7),(130,7),(131,7),(132,7),(133,7),(134,7),(135,7),(136,7),(137,7),(138,7),(139,7),(140,7),(141,7),(142,7),(143,7),(144,7),(145,7),(146,7),(147,7),(148,7),(149,7),(150,7),(151,7),(152,7),(153,7),(154,7),(155,7),(156,7),(157,7),(158,7),(159,7),(160,7),(161,7),(162,7),(163,7),(164,7),(165,7),(166,7),(167,7),(168,7),(169,7),(170,7),(171,7),(172,7),(173,7),(174,7),(175,7),(176,7),(177,7),(178,7),(179,7),(180,7),(73,12),(74,12),(75,12),(78,23),(76,27),(77,27),(51,35),(52,35),(53,35),(54,35),(55,35),(56,35),(57,35),(58,35),(59,35),(60,35),(61,35),(62,35),(63,35),(64,35),(65,35),(66,35),(67,35),(68,35),(69,35),(70,35),(85,71),(86,71),(87,71),(88,71),(89,71),(90,71),(91,71),(92,71),(93,71),(94,71),(95,71),(96,71),(97,71),(98,71),(99,71),(100,71),(101,71),(102,71),(103,71),(104,71),(183,71),(184,71),(185,71),(186,76),(187,76),(188,76),(189,76),(190,76),(191,76),(192,76),(193,76),(194,76),(195,76),(105,87),(106,87),(107,87),(108,87),(109,87),(110,87),(111,87),(112,87),(113,87),(114,87),(115,87),(116,87),(117,87),(118,87),(119,87),(120,87),(121,87),(122,87),(123,87),(124,87);
/*!40000 ALTER TABLE `plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plots`
--

LOCK TABLES `plots` WRITE;
/*!40000 ALTER TABLE `plots` DISABLE KEYS */;
INSERT INTO `plots` VALUES (1,1,'hydroponic','indoor hydroponics',10,8,'Admin Tester'),(2,23,'hydroponic','indoor hydroponics',50,3,'Admin Tester'),(3,3,'hydroponic','indoor hydroponics',50,3,'Joe Pera'),(4,2,'hydroponic','indoor hydroponics',70,3,'Keanue Driscoll-Cherland'),(5,3,'woody soil','covered hoop house',64,64,'	Joe Pera'),(6,3,'hydroponic','indoor hydroponics',20,20,'Joe Pera'),(7,4,'hydroponic','indoor hydroponics',30,0,'Cory Quirk	'),(8,3,'woody soil','covered hoop house',20,20,'Joe Pera'),(9,4,'healthy soil','outdoor raised beds',50,0,'Cory Quirk'),(10,6,'sandy soil	','traditional outdoor',63,0,'Kate Bush	'),(11,19,'healthy soil','traditional outdoor',50,0,'Carlos Correa'),(16,5,'hydroponic','indoor hydroponics',9,0,'Hannah Hensley'),(17,20,'hydroponic','indoor hydroponics',7,0,'Miguel Sano	'),(18,7,'healthy soil','traditional open air',80,0,'Charles Lawler'),(19,7,'healthy soil','traditional open air',50,0,'Charles Lawler'),(20,19,'rocky soil','traditional outdoor',10,0,'Carlos Correa'),(21,7,'sandy soil	','covered hoop house',40,0,'Charles Lawler'),(22,19,'woody soil','outdoor raised beds',50,0,'Carlos Correa'),(23,6,'healthy soil','traditional outdoor',10,0,'Kate Bush'),(24,23,'hydroponic','indoor hydroponics',50,0,'Kate Bush'),(25,1,'woody soil','outdoor raised beds',30,30,'Keanue Driscoll-Cherland'),(26,20,'healthy soil','covered hoop house',50,0,'Hannah Hensley'),(27,24,'woody soil','outdoor raised beds',50,0,'John Appleseed'),(28,29,'hydroponic','indoor hydroponics',30,30,'Michael Cuddyer'),(29,26,'hydroponic','indoor hydroponics',40,0,'Byron Buxton'),(30,7,'hydroponic','indoor hydroponics',45,0,'Conner O\'Malley'),(31,33,'sandy soil	','covered hoop house',30,0,'Ornette Coleman');
/*!40000 ALTER TABLE `plots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plots_plants`
--

LOCK TABLES `plots_plants` WRITE;
/*!40000 ALTER TABLE `plots_plants` DISABLE KEYS */;
INSERT INTO `plots_plants` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,2,6),(7,3,7),(8,3,8),(9,3,9),(51,6,51),(52,6,52),(53,6,53),(54,6,54),(55,6,55),(56,6,56),(57,6,57),(58,6,58),(59,6,59),(60,6,60),(61,6,61),(62,6,62),(63,6,63),(64,6,64),(65,6,65),(66,6,66),(67,6,67),(68,6,68),(69,6,69),(71,5,71),(72,5,72),(73,5,73),(74,5,74),(75,5,75),(76,5,76),(77,5,77),(78,5,78),(85,8,85),(86,8,86),(87,8,87),(88,8,88),(89,8,89),(90,8,90),(91,8,91),(92,8,92),(93,8,93),(94,8,94),(95,8,95),(96,8,96),(97,8,97),(98,8,98),(99,8,99),(100,8,100),(101,8,101),(102,8,102),(103,8,103),(104,8,104),(105,28,105),(106,28,106),(107,28,107),(108,28,108),(109,28,109),(110,28,110),(111,28,111),(112,28,112),(113,28,113),(114,28,114),(115,28,115),(116,28,116),(117,28,117),(118,28,118),(119,28,119),(120,28,120),(121,28,121),(122,28,122),(123,28,123),(124,28,124),(125,5,125),(126,5,126),(127,5,127),(128,5,128),(129,5,129),(130,5,130),(131,5,131),(132,5,132),(133,5,133),(134,5,134),(135,5,135),(136,5,136),(137,5,137),(138,5,138),(139,5,139),(140,5,140),(141,5,141),(142,5,142),(143,5,143),(144,5,144),(145,5,145),(146,5,146),(147,5,147),(148,5,148),(149,5,149),(150,5,150),(151,5,151),(152,5,152),(153,5,153),(154,5,154),(155,5,155),(156,5,156),(157,5,157),(158,5,158),(159,5,159),(160,5,160),(161,5,161),(162,5,162),(163,5,163),(164,5,164),(165,5,165),(166,5,166),(167,5,167),(168,5,168),(169,5,169),(170,5,170),(171,5,171),(172,5,172),(173,5,173),(174,5,174),(175,5,175),(176,5,176),(177,5,177),(178,5,178),(179,5,179),(180,5,180),(181,1,181),(182,1,182),(183,1,183),(184,1,184),(185,1,185),(186,28,186),(187,28,187),(188,28,188),(189,28,189),(190,28,190),(191,28,191),(192,28,192),(193,28,193),(194,28,194),(195,28,195);
/*!40000 ALTER TABLE `plots_plants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (35,19,'USER','2022-04-19 19:55:36'),(36,7,'USER','2022-04-19 19:55:36'),(37,4,'USER','2022-04-19 19:55:36'),(38,3,'USER','2022-04-19 19:55:36'),(39,6,'USER','2022-04-19 19:55:36'),(40,20,'USER','2022-04-19 19:55:36'),(41,5,'USER','2022-04-19 19:55:36'),(42,1,'USER','2022-04-19 19:55:36'),(43,2,'USER','2022-04-19 19:55:36'),(53,1,'ADMIN','2022-04-19 20:21:05'),(54,2,'ADMIN','2022-04-19 20:22:43'),(56,4,'ADMIN','2022-04-19 20:22:50'),(57,23,'USER','2022-04-21 13:09:56'),(58,23,'ADMIN','2022-04-21 13:10:59'),(59,24,'USER','2022-04-21 15:22:38'),(60,24,'ADMIN','2022-04-21 15:23:06'),(61,25,'USER','2022-04-21 15:54:04'),(62,25,'ADMIN','2022-04-21 15:55:04'),(63,26,'USER','2022-04-21 20:09:47'),(64,26,'ADMIN','2022-04-21 20:11:16'),(65,27,'USER','2022-04-22 11:20:47'),(66,28,'USER','2022-04-22 11:32:39'),(67,29,'USER','2022-04-22 11:37:55'),(68,30,'USER','2022-04-22 11:39:24'),(69,31,'USER','2022-04-22 11:41:04'),(70,32,'USER','2022-04-22 11:42:08'),(71,33,'USER','2022-04-22 11:46:34'),(72,34,'USER','2022-04-22 12:00:37'),(73,5,'ADMIN','2022-04-22 14:27:46');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','Tester','test123@email.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:03:41'),(2,'Keanue','Driscoll-Cherland','testemail123@email.com','$2a$10$5GQO5NTzgkqAtvwe9H4jz.i2innHmBnEBPnFkRCnYeU0iX2XriWFG','2022-04-11 01:03:41'),(3,'Joe','Pera','joetoematoe@test.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(4,'Cory','Quirk','coryquirk@ymail.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(5,'Hannah','Hensley','test@email.net','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(6,'Kate','Bush','kate@gmail.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(7,'Conner','O\'Malley','conner@melsky.com','$2a$12$OIqV/5DPNlr/.yn5Fk0nWOi/yDJZxG5aK57NZyAFJAjsw6PuQ9aTG','2022-04-11 01:06:29'),(19,'Carlos','Correa','ccorrea@twins.com','$2a$10$ZazCZ.REm726neubkU5AnuxzKzQAJ8CxVKOHUsCPZt57bZrHtCOFS','2022-04-17 23:20:50'),(20,'Miguel','Sano','msano@twins.com','$2a$10$a9L2awptpQEw4tCOA5CQveHk.UfosElsFnzMlinEO/ycQHOQizmm.','2022-04-17 23:27:16'),(23,'John','Muir','jmuir@gmail.com','$2a$10$1SCvKeXkqTUnIwMNyQhjF..twc97DvcteZRPnQzGQzTEnCsfG0eXC','2022-04-21 13:09:56'),(24,'John','Appleseed','jappleseed@gmail.com','$2a$10$u/W7PaVrIiTNdCF/If/OwOkcWLmBEjM3LTM.n/XS5UmsYAJz0ysUK','2022-04-21 15:22:38'),(25,'Max','Kepler','mkepler@twins.com','$2a$10$GSV3fbG/YuJc0/m0Dkh8YOl7nTENPHAtLzkOsxbsAi7/JYbhLpeuu','2022-04-21 15:54:04'),(26,'Byron','Buxton','bbuxton@twins.com','$2a$10$3a6RRiZGbKg6zZjVa.pHIOhVwgSWDbc5DJgXKx90.LjO8QGRv0yJq','2022-04-21 20:09:47'),(27,'Kenta','Maeda','kmaeda@dodgers.com','$2a$10$NM9lnnz6u68Y7iK7VF5saue9q.3ndB75avsMYCrwgxwomVqmWmyuW','2022-04-22 11:20:47'),(28,'Shohei','Ohtani','shohei@angels.com','$2a$10$oAxMvx.q46WtVDRu7X6xxum2e0Bw02JuGH6MKs0wqNW3unRg7/qKG','2022-04-22 11:32:39'),(29,'Michael','Cuddyer','mcuddyer@twins.com','$2a$10$Ayh/aInji5zQFakGJ335DelKr7WRkmuua5IJpTl0XqOwlg2Cyudba','2022-04-22 11:37:55'),(30,'John','Coltrane','jcoltrane@bluetrain.com','$2a$10$BgJRb9GAEBU91xL99PHJterPgjntfUhUklQxjacGvNUuUhNLjgkIq','2022-04-22 11:39:24'),(31,'Miles','Davis','miles@davis.com','$2a$10$WzSqyjUWkkHu3/Ry84RyZ.d/sTikqkwOCRV6MmDwMgleBZWMlaOWG','2022-04-22 11:41:04'),(32,'Miles','Smiles','miles@smiles.com','$2a$10$sj1epaG0ZjfsL2lotIMjxeUXWlbQjLzxlHyw//2UiCdUr2dQ32feG','2022-04-22 11:42:08'),(33,'Ornette','Coleman','ornette@coleman.com','$2a$10$Qla9kjyxbwCXZpMtK0fDa.DfxSu33CLaK0JCS2bwNnn9WFEHiN4py','2022-04-22 11:46:34'),(34,'Chick','Corea','chick@corea.com','$2a$10$x18n0Ysy8CPkThv1T9rmQeJ/4ZIvOI4wBS73Uur8uor1PGZ6L9HAe','2022-04-22 12:00:37');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `varieties`
--

LOCK TABLES `varieties` WRITE;
/*!40000 ALTER TABLE `varieties` DISABLE KEYS */;
INSERT INTO `varieties` VALUES (1,'Aunt Ruby\'s German','beefsteak','green','https://www.seedsavers.org/site/img/seo-images/0249-aunt-rubys-german-green-tomato-organic.jpg'),(2,'Amish Paste','canning','red','https://www.seedsavers.org/site/img/seo-images/0107A-amish-paste-tomato-organic.jpg'),(3,'Austin\'s Red','pear','red','https://www.seedsavers.org/site/img/seo-images/1227C-austins-red-pear-tomato.jpg'),(4,'Baker\'s Family','heirloom','red-orange','https://www.seedsavers.org/site/img/seo-images/0335-baker-family-heirloom-tomato-organic.JPG'),(5,'Beam\'s Yellow','pear','yellow','https://www.seedsavers.org/site/img/seo-images/0661-beams-yellow-pear-tomato.jpg'),(6,'Black Cherry','cherry','black','https://www.seedsavers.org/site/img/seo-images/1609-black-cherry-tomato-organic.jpg'),(7,'Black From Tula','heirloom','black','https://www.seedsavers.org/site/img/seo-images/0251-black-from-tula-tomato.jpg'),(8,'Black Krim','heirloom','black','https://www.seedsavers.org/site/img/seo-images/0662-black-krim-tomato.jpg'),(9,'Black Plum','plum','black','https://www.seedsavers.org/site/img/seo-images/0018-black-plum-tomato.jpg'),(10,'Black Sea Man','heirloom','black','https://www.seedsavers.org/site/img/seo-images/0019-black-sea-man-tomato-organic.jpg'),(12,'Brandywine','slicer','red','https://www.seedsavers.org/site/img/seo-images/0427-brandywine-sudduths-strain-tomato.jpg'),(13,'Cherokee Purple','heirloom','purple','https://www.seedsavers.org/site/img/seo-images/0253-cherokee-purple-tomato-organic.jpg'),(14,'Cherry Roma','cherry','red','https://www.seedsavers.org/site/img/seo-images/0974A-cherry-roma-tomato-organic.jpg'),(15,'Cream Sausage','roma','red','https://www.seedsavers.org/site/img/seo-images/1314-tomato-cream-sausage.jpg'),(16,'David Davidson\'s','slicer','yellow','https://www.seedsavers.org/site/img/seo-images/0027-david-davidsons-tomato-organic.jpg'),(17,'Crynkovic Yugoslavian','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/0663-crnkovic-yugoslavian-tomato.jpg'),(18,'Dester','heirloom','red','https://www.seedsavers.org/site/img/seo-images/1552-dester-tomato-organic.jpg'),(19,'Dr. Wyche\'s','beefsteak','yellow','https://www.seedsavers.org/site/img/seo-images/0975C-dr-wyche\'s-yellow-tomato.jpg'),(20,'Earliana','slicer','red','https://www.seedsavers.org/site/img/seo-images/1451-earliana-tomato-organic.jpg'),(21,'Eva Purple Ball','slicer','red','https://www.seedsavers.org/site/img/seo-images/1387-eva-purple-ball-tomato.jpg'),(22,'Federle','canning','red','https://www.seedsavers.org/site/img/seo-images/0439-federle-tomato.jpg'),(23,'German Pink','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/0440A-german-pink-tomato-organic.jpg'),(24,'Gold Medal','heirloom','gold','https://www.seedsavers.org/site/img/seo-images/0825-gold-medal-tomato.jpg'),(25,'Gold Rush Currant','cherry','gold','https://www.seedsavers.org/site/img/seo-images/1229-gold-rush-currant-tomato-organic.jpg'),(26,'Green Grape','grape','green','https://www.seedsavers.org/site/img/seo-images/1231-gree-grape-tomato.jpg'),(27,'Green Zebra','heirloom','green','https://www.seedsavers.org/site/img/seo-images/0443C-tomato-green-zebra.jpg'),(28,'Hartman\'s Yellow Gooseberry','cherry','yellow','https://www.seedsavers.org/site/img/seo-images/1481-hartmans-yellow-gooseberry-tomato-organic.jpg'),(29,'Hungarian Heart','canning','orange','https://www.seedsavers.org/site/img/seo-images/0444-hungarian-heart-tomato.jpg'),(30,'Hillbilly Potato Leaf','beefsteak','yellow','https://www.seedsavers.org/site/img/seo-images/0979-hillbilly-potato-leaf-tomato.jpg'),(31,'Igleheart','cherry','yellow','https://www.seedsavers.org/site/img/seo-images/0118-igleheart-yellow-cherry-tomato-organic.jpg'),(32,'Isis Candy Cherry','cherry','red-orange','https://www.seedsavers.org/site/img/seo-images/1232-isis-candy-cherry-tomato.jpg'),(33,'Italian Heirloom','canning','red','https://www.seedsavers.org/site/img/seo-images/0826-italian-heirloom-tomato-organic.jpg'),(34,'Japanese Trifele Black','slicer','black','https://www.seedsavers.org/site/img/seo-images/1460A-japanese-trifele-black-tomato-organic.jpg'),(35,'Jaune Flamme','slicer','red','https://www.seedsavers.org/site/img/seo-images/0827-jaune-flamme-tomato-organic.jpg'),(36,'John Baer','slicer','red','https://www.seedsavers.org/site/img/seo-images/1435-john-baer-tomato-organic.jpg'),(37,'Kanner Hoell','canning','red','https://www.seedsavers.org/site/img/seo-images/0011-kanner-hoell-tomato-organic.jpg'),(38,'Kellogg\'s Breakfast','beefsteak','orange','https://www.seedsavers.org/site/img/seo-images/1057-kelloggs-breakfast-tomato-organic.jpg'),(39,'Kolb','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/1482-tomato-kolb.jpg'),(40,'Large Red Cherrry','cherry','red','https://www.seedsavers.org/site/img/seo-images/0828-large-red-cherry-tomato-organic.jpg'),(41,'Lemon Drop','cherry','yellow','https://www.seedsavers.org/site/img/seo-images/1233-lemon-drop-tomato-organic.jpg'),(42,'Livingston\'s Paragon','slicer','red','https://www.seedsavers.org/site/img/seo-images/0144-livingstons-paragon-tomato-organic.jpg'),(43,'Mamie Brown\'s Pink','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/1611-mamie-browns-pink-tomato-organic.jpg'),(44,'Martino\'s Roma','roma','red','https://www.seedsavers.org/site/img/seo-images/0259-martinos-roma-tomato-organic.jpg'),(45,'Missouri Pink Love Apple','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/0117-missouri-pink-love-apple-tomato-organic.jpg'),(46,'Moonglow','slicer','orange','https://www.seedsavers.org/site/img/seo-images/0446-moonglow-tomato-organic.jpg'),(47,'Mortgage Lifter (Halladay\'s)','beefsteak','red','https://www.seedsavers.org/site/img/seo-images/1380-mortgage-lifter-halladays-tomato.jpg'),(48,'Nebraska Wedding','beefsteak','orange','https://www.seedsavers.org/site/img/seo-images/0261-nebraska-wedding-tomato-organic.jpg'),(49,'Nyagous','heirloom','brown-red','https://www.seedsavers.org/site/img/seo-images/1237-nyagous-tomato-organic.jpg'),(50,'Oma\'s Orange','beefsteak','orange','https://www.seedsavers.org/site/img/seo-images/0289-omas-orange-tomato.jpg'),(51,'Oma\'s Pink','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/0290-omas-pink-tomato.jpg'),(52,'Opalka','canning','pink','https://www.seedsavers.org/site/img/seo-images/0447A-opalka-tomato-organic.jpg'),(53,'Paul Robeson','slicer','red','https://www.seedsavers.org/site/img/seo-images/1604A-paul-robeson-tomato-organic.jpg'),(54,'Peach Blow Sutton','beefsteak','pink','https://www.seedsavers.org/site/img/seo-images/1572-peach-blow-sutton-tomato-organic.jpg'),(55,'Powers Heirloom','heirloom','yellow','https://www.seedsavers.org/site/img/seo-images/1453-tomato-powers-heirloom.jpg'),(56,'Principe Borghese','grape','red','https://www.seedsavers.org/site/img/seo-images/0823C-principe-borghese-tomato.jpg'),(57,'Red Fig','pear','red','https://www.seedsavers.org/site/img/seo-images/1235-red-fig-tomato-organic.jpg'),(58,'Red Zebra','heirloom','red-orange','https://www.seedsavers.org/site/img/seo-images/1317A-red-zebra-tomato-organic.jpg'),(59,'Redfield Beauty','slicer','red','https://www.seedsavers.org/site/img/seo-images/1483-redfield-beauty-tomato-organic.jpg'),(60,'Riesentraube','plum','red','https://www.seedsavers.org/site/img/seo-images/0263A-riesentraube-tomato.jpg'),(61,'Rosso Sicilian','beefsteak','red','https://www.seedsavers.org/site/img/seo-images/1530-rosso-sicilian-tomato-organic.jpg'),(62,'Sheboygan','canning','red','https://www.seedsavers.org/site/img/seo-images/1484-sheboygan-tomato-organic.jpg'),(63,'Siberian','slicer','red','https://www.seedsavers.org/site/img/seo-images/1236-siberian-tomato-organic.jpg'),(64,'Silvery Fir Tree','beefsteak','red-orange','https://www.seedsavers.org/site/img/seo-images/0029-silvery-fir-tree-tomato-organic.jpg'),(65,'Speckled Roman','roma','red-orange','https://www.seedsavers.org/site/img/seo-images/0981A-speckled-roma-tomato-organic.jpg'),(66,'Stupice','cocktail','red','https://www.seedsavers.org/site/img/seo-images/0667-stupice-tomato-organic.jpg'),(67,'Sweet Pea Currant','cherry','red','https://www.seedsavers.org/site/img/seo-images/1230-sweet-pea-currant-tomato-organic.jpg'),(68,'Tasty Evergreen','beefsteak','green','https://www.seedsavers.org/site/img/seo-images/0434-tasty-evergreen-tomato-organic.jpg'),(69,'Tommy Toe','cherry','red','https://www.seedsavers.org/site/img/seo-images/0265-tommy-toe-tomato.jpg'),(70,'Trophy','slicer','red','https://www.seedsavers.org/site/img/seo-images/1183-trophy-tomato.jpg'),(71,'Trucker\'s Favorite Pink ','slicer','pink','https://www.seedsavers.org/site/img/seo-images/1485-truckers-favorite-tomato-organic.jpg'),(72,'Ukranian Purple','plum','purple','https://www.seedsavers.org/site/img/seo-images/1234-ukrainian-purple-tomato.jpg'),(73,'Varigated','slicer','various','https://www.seedsavers.org/site/img/seo-images/1318-tomato-variegated.jpg'),(75,'Wapsipinicon Peach','slicer','yellow','https://www.seedsavers.org/site/img/seo-images/1058-wapsipinicon-peach-tomato.jpg'),(76,'White Cherry','cherry','yellow-white','https://www.seedsavers.org/site/img/seo-images/1610-white-cherry-tomato-organic.jpg'),(77,'White Tomesol','slicer','yellow-white','https://www.seedsavers.org/site/img/seo-images/1620-white-tomesol-tomato.jpg'),(78,'Whittemore Heirloom','beefsteak','red','https://www.seedsavers.org/site/img/seo-images/0181-whittemore-heirloom-tomato-organic.jpg'),(79,'Wisconsin 55','canning','pink','https://www.seedsavers.org/site/img/seo-images/1059-wisconsin-55-tomato-organic.jpg'),(80,'Wisconsin Chief','canning','red','https://www.seedsavers.org/site/img/seo-images/0224-wisconsin-chief-tomato-organic.jpg'),(82,'Big Rainbow','heirloom','yellow-orange','https://h2.commercev3.net/cdn.gurneys.com/images/500/64524A.jpg'),(86,'Red Velvet','cherry','red','https://www.seedsavers.org/site/img/seo-images/1226-velvet-red-tomato-organic.jpg'),(87,'Blondkopfchen','cherry','gold','https://www.seedsavers.org/site/img/seo-images/1228-blondkopfchen-tomato-organic.jpg');
/*!40000 ALTER TABLE `varieties` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-25  0:24:00
