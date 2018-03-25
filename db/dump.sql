-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: rezervacije
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `grad`
--

DROP TABLE IF EXISTS `grad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grad` (
  `grad_id` int(11) NOT NULL AUTO_INCREMENT,
  `grad_naziv` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`grad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grad`
--

LOCK TABLES `grad` WRITE;
/*!40000 ALTER TABLE `grad` DISABLE KEYS */;
INSERT INTO `grad` VALUES (1,'Beograd'),(2,'Novi Sad'),(3,'Nis'),(4,'Kragujevac\r\n'),(5,'Arandjelovac'),(6,'Jagodina'),(7,'Subotica'),(8,'Leskovac'),(9,'Smederevo'),(10,'Uzice'),(11,'Zrenjanin'),(12,'Kraljevo'),(13,'Sombor'),(14,'Krusevac'),(15,'Valjevo'),(16,'Vranje'),(17,'Novi Pazar'),(18,'Pozarevac'),(19,'Cacak'),(20,'Pancevo'),(21,'Sremska Mitrovica'),(22,'Zajecar'),(23,'Vrsac'),(24,'Pirot'),(25,'Svilajnac'),(26,'Despotovac'),(27,'Guca');
/*!40000 ALTER TABLE `grad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `korisnici`
--

DROP TABLE IF EXISTS `korisnici`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `korisnici` (
  `korisnik_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `korisnik_ime` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `korisnik_prezime` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `korisnik_email` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `korisnik_lozinka` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`korisnik_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `korisnici`
--

LOCK TABLES `korisnici` WRITE;
/*!40000 ALTER TABLE `korisnici` DISABLE KEYS */;
INSERT INTO `korisnici` VALUES (8,'Milos','Jovanovic','mikivts@hotmail.rs','dfss'),(9,'Nenad ','Aksic','aksa@gmail.rs','ksoa'),(10,'Marko','Jovanovic','mare@gmail.com','as'),(11,'Stepan','Stepanovic','stepa@gmail.com','7815696ecbf1c96e6894b779456d330e');
/*!40000 ALTER TABLE `korisnici` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `objekti`
--

DROP TABLE IF EXISTS `objekti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `objekti` (
  `objekat_id` int(11) NOT NULL AUTO_INCREMENT,
  `objekat_grad` int(11) NOT NULL,
  `objekat_tip` int(11) NOT NULL,
  `objekat_vrsta` int(11) NOT NULL,
  `objekat_ime` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `objekat_radnovreme` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `objekat_opis` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `objekat_slika` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `objekat_adresa` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objekat_telefon` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `objekat_cenovnik` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`objekat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `objekti`
--

LOCK TABLES `objekti` WRITE;
/*!40000 ALTER TABLE `objekti` DISABLE KEYS */;
INSERT INTO `objekti` VALUES (1,2,1,7,'Guesthouse Miss Depolo ','00-24','Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Praesent quis velit orci. Aliquam a fermentum urna. Nunc tempus purus id imperdiet dapibus. Cras in luctus turpis. Morbi scelerisque felis et fringilla malesuada. Duis est odio, tristique rutrum risus vitae, porttitor venenatis tellus. Integer posuere arcu id mattis egestas. Fusce id consequat felis, id posuere ante. Praesent eget vestibulum purus. Cras sed ex est. Aenean posuere id massa vitae volutpat. Mauris non vulputate purus. Aliquam erat volutpat. Fusce turpis ante, sollicitudin congue congue ac, elementum at tellus. Praesent rutrum leo id facilisis porta.','1.png','Ljubomira Stojanovic 4 11000 Novi Sad','060/00-22-333','menu-sa-cenama.pdf'),(2,3,2,4,'Leskovacki rostilj','00-24','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec porttitor velit quis nulla eleifend, non vehicula tellus tempor. Nullam mollis dolor id turpis tempor imperdiet. Phasellus eu pellentesque lacus, at tincidunt metus. Curabitur dictum diam lectus. Etiam vel metus non nibh ullamcorper lobortis sed at erat. Nunc quam risus, auctor ut sollicitudin mollis, rutrum at justo.','3.jpg',' Makedonska 4 11000 Nis','060/00-22-333','menu-sa-cenama.pdf'),(3,1,1,5,'Hotel Prag','00-24','<p>Nunc et auctor diam, ac ultrices erat. Nunc eget mauris leo. Aliquam sapien ligula, scelerisque et tempor quis, aliquet ac odio. Nulla ullamcorper augue eget nunc mattis, a finibus est imperdiet. Nunc tincidunt id augue at pharetra. Proin commodo arcu mi. Ut tortor lorem, placerat ac condimentum lobortis, eleifend iaculis eros. Vivamus eleifend nec diam id malesuada.</p>','6.jpg','Kraljice Natalije 46 11000 Beograd','060/00-22-333','menu-sa-cenama.pdf'),(5,1,2,3,'Skroz dobra pekara','00-24','Nunc et auctor diam, ac ultrices erat. Nunc eget mauris leo. Aliquam sapien ligula, scelerisque et tempor quis, aliquet ac odio. Nulla ullamcorper augue eget nunc mattis, a finibus est imperdiet. Nunc tincidunt id augue at pharetra. Proin commodo arcu mi. Ut tortor lorem, placerat ac condimentum lobortis, eleifend iaculis eros. Vivamus eleifend nec diam id malesuada.','8.jpg','lokacije objekata mozete pogledati na stranici <a href=\"http://www.skrozdobrapekara.rs/index.php/nasi-objekti\">Skroz dobra pekara</a>','060/00-22-333','menu-sa-cenama.pdf'),(6,1,2,3,'Pekara Dzordz','06 - 21','Lorem Ipsum Ñ˜Ðµ Ñ˜ÐµÐ´Ð½Ð¾ÑÑ‚Ð°Ð²Ð½Ð¾ Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° ÐºÐ¾Ñ˜Ð¸ ÑÐµ ÐºÐ¾Ñ','9.jpg','Dzordza Vasingtona 9 11000 Beograd','060/00-22-444','menu-sa-cenama.pdf'),(7,1,2,1,'Restoran Zapata','07-24','ÐÐµ ÑÐ°Ð¼Ð¾ ÑˆÑ‚Ð¾ Ñ˜Ðµ Ð¾Ð²Ð°Ñ˜ Ð¼Ð¾Ð´ÐµÐ» Ð¾Ð¿ÑÑ‚Ð°Ð¾ Ð¿ÐµÑ‚ Ð²ÐµÐºÐ¾Ð²Ð°, Ð½ÐµÐ³Ð¾ Ñ˜Ðµ Ñ‡Ð°Ðº Ð¿Ð¾Ñ‡ÐµÐ¾ Ð´Ð° ÑÐµ ÐºÐ¾Ñ€Ð¸ÑÑ‚Ð¸ Ð¸ Ñƒ ÐµÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½ÑÐºÐ¸Ð¼ Ð¼ÐµÐ´Ð¸Ñ˜Ð¸Ð¼Ð°, Ð½ÐµÐ¿Ñ€Ð¾Ð¼ÐµÐ½Ð¸Ð²ÑˆÐ¸ ÑÐµ. ÐŸÐ¾Ð¿ÑƒÐ»Ð°Ñ€Ð¸Ð·Ð¾Ð²Ð°Ð½ Ñ˜Ðµ ÑˆÐµÐ·Ð´ÐµÑÐµÑ‚Ð¸Ñ… Ð³Ð¾Ð´Ð¸Ð½Ð° Ð´Ð²Ð°Ð´ÐµÑÐµÑ‚Ð¾Ð³ Ð²ÐµÐºÐ° Ð·Ð°Ñ˜ÐµÐ´Ð½Ð¾ ÑÐ° Ð»Ð¸ÑÑ‚Ð¾Ð²Ð¸Ð¼Ð° Ð»ÐµÑ‚ÐµÑ€ÑÐµÑ‚Ð° ÐºÐ¾Ñ˜Ð¸ ÑÑƒ ÑÐ°Ð´Ñ€Ð¶Ð°Ð»Ð¸ Lorem Ipsum Ð¿Ð°ÑÑƒÑÐµ, Ð° Ð´Ð°Ð½Ð°Ñ ÑÐ° ÑÐ¾Ñ„Ñ‚Ð²ÐµÑ€ÑÐºÐ¸Ð¼ Ð¿Ð°ÐºÐµÑ‚Ð¾Ð¼ Ð·Ð° Ð¿Ñ€ÐµÐ»Ð¾Ð¼ ÐºÐ°Ð¾ ÑˆÑ‚Ð¾ Ñ˜Ðµ Aldus PageMaker ÐºÐ¾Ñ˜Ð¸ Ñ˜Ðµ ÑÐ°Ð´Ñ€Ð¶Ð°Ð¾ Lorem Ipsum Ð²ÐµÑ€Ð·Ð¸Ñ˜Ðµ.','10.jpg','Ð’Ð¾Ñ˜Ð²Ð¾Ð´Ðµ Ð‘Ð¾Ð³Ð´Ð°Ð½Ð° 13, Ð‘ÐµÐ¾Ð³Ñ€Ð°Ð´ 11000','060/00-22-333','menu-sa-cenama.pdf'),(8,3,4,11,'Riblja Corba koncert','/Vreme odrzavanja: 4.jul.2016','Lorem Ipsum Ñ˜Ðµ Ñ˜ÐµÐ´Ð½Ð¾ÑÑ‚Ð°Ð²Ð½Ð¾ Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° ÐºÐ¾Ñ˜Ð¸ ÑÐµ ÐºÐ¾Ñ€Ð¸ÑÑ‚Ð¸ Ñƒ ÑˆÑ‚Ð°Ð¼Ð¿Ð°Ñ€ÑÐºÐ¾Ñ˜ Ð¸ ÑÐ»Ð¾Ð²Ð¾ÑÐ»Ð°Ð³Ð°Ñ‡ÐºÐ¾Ñ˜ Ð¸Ð½Ð´ÑƒÑÑ‚Ñ€Ð¸Ñ˜Ð¸. Lorem ipsum Ñ˜Ðµ Ð±Ð¸Ð¾ ÑÑ‚Ð°Ð½Ð´Ð°Ñ€Ð´ Ð·Ð° Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° Ñ˜Ð¾Ñˆ Ð¾Ð´ 1500. Ð³Ð¾Ð´Ð¸Ð½Ðµ, ÐºÐ°Ð´Ð° Ñ˜Ðµ Ð½ÐµÐ¿Ð¾Ð·Ð½Ð°Ñ‚Ð¸ ÑˆÑ‚Ð°Ð¼Ð¿Ð°Ñ€ ÑƒÐ·ÐµÐ¾ ÐºÑƒÑ‚Ð¸Ñ˜Ñƒ ÑÐ° ÑÐ»Ð¾Ð²Ð¸Ð¼Ð° Ð¸ ÑÐ»Ð¾Ð¶Ð¸Ð¾ Ð¸Ñ… ÐºÐ°ÐºÐ¾ Ð±Ð¸ Ð½Ð°Ð¿Ñ€Ð°Ð²Ð¸Ð¾ ÑƒÐ·Ð¾Ñ€Ð°Ðº ÐºÑšÐ¸Ð³Ðµ. ÐÐµ ÑÐ°Ð¼Ð¾ ÑˆÑ‚Ð¾ Ñ˜Ðµ Ð¾Ð²Ð°Ñ˜ Ð¼Ð¾Ð´ÐµÐ» Ð¾Ð¿ÑÑ‚Ð°Ð¾ Ð¿ÐµÑ‚ Ð²ÐµÐºÐ¾Ð²Ð°, Ð½ÐµÐ³Ð¾ Ñ˜Ðµ Ñ‡Ð°Ðº Ð¿Ð¾Ñ‡ÐµÐ¾ Ð´Ð° ÑÐµ ÐºÐ¾Ñ€Ð¸ÑÑ‚Ð¸ Ð¸ Ñƒ ÐµÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½ÑÐºÐ¸Ð¼ Ð¼ÐµÐ´Ð¸Ñ˜Ð¸Ð¼Ð°, Ð½ÐµÐ¿Ñ€Ð¾Ð¼ÐµÐ½Ð¸Ð²ÑˆÐ¸ ÑÐµ.','ribljacorba.jpg','Niska tvrdjava, Djuke Dinic, Nis','060/00-22-333','menu-sa-cenama.pdf'),(9,2,5,12,'EXIT festival ','/Vreme odrzavanja: 7. jul - 10. jul 2016.','Lorem Ipsum Ñ˜Ðµ Ñ˜ÐµÐ´Ð½Ð¾ÑÑ‚Ð°Ð²Ð½Ð¾ Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° ÐºÐ¾Ñ˜Ð¸ ÑÐµ ÐºÐ¾Ñ€Ð¸ÑÑ‚Ð¸ Ñƒ ÑˆÑ‚Ð°Ð¼Ð¿Ð°Ñ€ÑÐºÐ¾Ñ˜ Ð¸ ÑÐ»Ð¾Ð²Ð¾ÑÐ»Ð°Ð³Ð°Ñ‡ÐºÐ¾Ñ˜ Ð¸Ð½Ð´ÑƒÑÑ‚Ñ€Ð¸Ñ˜Ð¸. Lorem ipsum Ñ˜Ðµ Ð±Ð¸Ð¾ ÑÑ‚Ð°Ð½Ð´Ð°Ñ€Ð´ Ð·Ð° Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° Ñ˜Ð¾Ñˆ Ð¾Ð´ 1500. Ð³Ð¾Ð´Ð¸Ð½Ðµ, ÐºÐ°Ð´Ð° Ñ˜Ðµ Ð½ÐµÐ¿Ð¾Ð·Ð½Ð°Ñ‚Ð¸ ÑˆÑ‚Ð°Ð¼Ð¿Ð°Ñ€ ÑƒÐ·ÐµÐ¾ ÐºÑƒÑ‚Ð¸Ñ˜Ñƒ ÑÐ° ÑÐ»Ð¾Ð²Ð¸Ð¼Ð° Ð¸ ÑÐ»Ð¾Ð¶Ð¸Ð¾ Ð¸Ñ… ÐºÐ°ÐºÐ¾ Ð±Ð¸ Ð½Ð°Ð¿Ñ€Ð°Ð²Ð¸Ð¾ ÑƒÐ·Ð¾Ñ€Ð°Ðº ÐºÑšÐ¸Ð³Ðµ. ÐÐµ ÑÐ°Ð¼Ð¾ ÑˆÑ‚Ð¾ Ñ˜Ðµ Ð¾Ð²Ð°Ñ˜ Ð¼Ð¾Ð´ÐµÐ» Ð¾Ð¿ÑÑ‚Ð°Ð¾ Ð¿ÐµÑ‚ Ð²ÐµÐºÐ¾Ð²Ð°, Ð½ÐµÐ³Ð¾ Ñ˜Ðµ Ñ‡Ð°Ðº Ð¿Ð¾Ñ‡ÐµÐ¾ Ð´Ð° ÑÐµ ÐºÐ¾Ñ€Ð¸ÑÑ‚Ð¸ Ð¸ Ñƒ ÐµÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½ÑÐºÐ¸Ð¼ Ð¼ÐµÐ´Ð¸Ñ˜Ð¸Ð¼Ð°, Ð½ÐµÐ¿Ñ€Ð¾Ð¼ÐµÐ½Ð¸Ð²ÑˆÐ¸ ÑÐµ.','exit.jpg','Petrovaradinska tvrdjava Petrovaradin Novi Sad','060/00-22-333','menu-sa-cenama.pdf'),(10,1,3,9,'Kombank Arena - prodaja karata','ponedeljak - petak: 10.00 - 20.00 / subota: 10.00 - 15.00 / nedelja: zatvoreno','Lorem Ipsum Ñ˜Ðµ Ñ˜ÐµÐ´Ð½Ð¾ÑÑ‚Ð°Ð²Ð½Ð¾ Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° ÐºÐ¾Ñ˜Ð¸ ÑÐµ ÐºÐ¾Ñ€Ð¸ÑÑ‚Ð¸ Ñƒ ÑˆÑ‚Ð°Ð¼Ð¿Ð°Ñ€ÑÐºÐ¾Ñ˜ Ð¸ ÑÐ»Ð¾Ð²Ð¾ÑÐ»Ð°Ð³Ð°Ñ‡ÐºÐ¾Ñ˜ Ð¸Ð½Ð´ÑƒÑÑ‚Ñ€Ð¸Ñ˜Ð¸. Lorem ipsum Ñ˜Ðµ Ð±Ð¸Ð¾ ÑÑ‚Ð°Ð½Ð´Ð°Ñ€Ð´ Ð·Ð° Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° Ñ˜Ð¾Ñˆ Ð¾Ð´ 1500. Ð³Ð¾Ð´Ð¸Ð½Ðµ, ÐºÐ°Ð´Ð° Ñ˜Ðµ Ð½ÐµÐ¿Ð¾Ð·Ð½Ð°Ñ‚Ð¸ ÑˆÑ‚Ð°Ð¼Ð¿Ð°Ñ€ ÑƒÐ·ÐµÐ¾ ÐºÑƒÑ‚Ð¸Ñ˜Ñƒ ÑÐ° ÑÐ»Ð¾Ð²Ð¸Ð¼Ð° Ð¸ ÑÐ»Ð¾Ð¶Ð¸Ð¾ Ð¸Ñ… ÐºÐ°ÐºÐ¾ Ð±Ð¸ Ð½Ð°Ð¿Ñ€Ð°Ð²Ð¸Ð¾ ÑƒÐ·Ð¾Ñ€Ð°Ðº ÐºÑšÐ¸Ð³Ðµ.','blagajna-wide.jpg','Biletarnica (severna strana objekta) Bulevar Arsenija Carnojevica 58, Beograd','060/00-22-333','menu-sa-cenama.pdf'),(11,1,4,14,'TC Usce - drugi sprat Prodaja karata','radno vreme: ponedeljak - nedelja od 10.00 do 22.00','Lorem Ipsum Ñ˜Ðµ Ñ˜ÐµÐ´Ð½Ð¾ÑÑ‚Ð°Ð²Ð½Ð¾ Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° ÐºÐ¾Ñ˜Ð¸ ÑÐµ ÐºÐ¾Ñ€Ð¸ÑÑ‚Ð¸ Ñƒ ÑˆÑ‚Ð°Ð¼Ð¿Ð°Ñ€ÑÐºÐ¾Ñ˜ Ð¸ ÑÐ»Ð¾Ð²Ð¾ÑÐ»Ð°Ð³Ð°Ñ‡ÐºÐ¾Ñ˜ Ð¸Ð½Ð´ÑƒÑÑ‚Ñ€Ð¸Ñ˜Ð¸. Lorem ipsum Ñ˜Ðµ Ð±Ð¸Ð¾ ÑÑ‚Ð°Ð½Ð´Ð°Ñ€Ð´ Ð·Ð° Ð¼Ð¾Ð´ÐµÐ» Ñ‚ÐµÐºÑÑ‚Ð° Ñ˜Ð¾Ñˆ Ð¾Ð´ 1500. Ð³Ð¾Ð´Ð¸Ð½Ðµ, ÐºÐ°Ð´Ð° Ñ˜Ðµ Ð½ÐµÐ¿Ð¾Ð·Ð½Ð°Ñ‚Ð¸ ÑˆÑ‚Ð°Ð¼Ð¿Ð°Ñ€ ÑƒÐ·ÐµÐ¾ ÐºÑƒÑ‚Ð¸Ñ˜Ñƒ ÑÐ° ÑÐ»Ð¾Ð²Ð¸Ð¼Ð° Ð¸ ÑÐ»Ð¾Ð¶Ð¸Ð¾ Ð¸Ñ… ÐºÐ°ÐºÐ¾ Ð±Ð¸ Ð½Ð°Ð¿Ñ€Ð°Ð²Ð¸Ð¾ ÑƒÐ·Ð¾Ñ€Ð°Ðº ÐºÑšÐ¸Ð³Ðµ. ÐÐµ ÑÐ°Ð¼Ð¾ ÑˆÑ‚Ð¾ Ñ˜Ðµ Ð¾Ð²Ð°Ñ˜ Ð¼Ð¾Ð´ÐµÐ» Ð¾Ð¿ÑÑ‚Ð°Ð¾ Ð¿ÐµÑ‚ Ð²ÐµÐºÐ¾Ð²Ð°, Ð½ÐµÐ³Ð¾ Ñ˜Ðµ Ñ‡Ð°Ðº Ð¿Ð¾Ñ‡ÐµÐ¾ Ð´Ð° ÑÐµ ÐºÐ¾Ñ€Ð¸ÑÑ‚Ð¸ Ð¸ Ñƒ ÐµÐ»ÐµÐºÑ‚Ñ€Ð¾Ð½ÑÐºÐ¸Ð¼ Ð¼ÐµÐ´Ð¸Ñ˜Ð¸Ð¼Ð°, Ð½ÐµÐ¿Ñ€Ð¾Ð¼ÐµÐ½Ð¸Ð²ÑˆÐ¸ ÑÐµ. ÐŸÐ¾Ð¿ÑƒÐ»Ð°Ñ€Ð¸Ð·Ð¾Ð²Ð°Ð½ Ñ˜Ðµ ÑˆÐµÐ·Ð´ÐµÑÐµÑ‚Ð¸Ñ… Ð³Ð¾Ð´Ð¸Ð½Ð° Ð´Ð²Ð°Ð´ÐµÑÐµÑ‚Ð¾Ð³ Ð²ÐµÐºÐ° Ð·Ð°Ñ˜ÐµÐ´Ð½Ð¾ ÑÐ° Ð»Ð¸ÑÑ‚Ð¾Ð²Ð¸Ð¼Ð° Ð»ÐµÑ‚ÐµÑ€ÑÐµÑ‚Ð° ÐºÐ¾Ñ˜Ð¸ ÑÑƒ ÑÐ°Ð´Ñ€Ð¶Ð°Ð»Ð¸ Lorem Ipsum Ð¿Ð°ÑÑƒÑÐµ, Ð° Ð´Ð°Ð½Ð°Ñ ÑÐ° ÑÐ¾Ñ„Ñ‚Ð²ÐµÑ€ÑÐºÐ¸Ð¼ Ð¿Ð°ÐºÐµÑ‚Ð¾Ð¼ Ð·Ð° Ð¿Ñ€ÐµÐ»Ð¾Ð¼ ÐºÐ°Ð¾ ÑˆÑ‚Ð¾ Ñ˜Ðµ Aldus PageMaker ÐºÐ¾Ñ˜Ð¸ Ñ˜Ðµ ÑÐ°Ð´Ñ€Ð¶Ð°Ð¾ Lorem Ipsum Ð²ÐµÑ€Ð·Ð¸Ñ˜Ðµ.','usce.jpg',' Bulevar Mihajla Pupina 4 11000 Beograd','060/00-00-200','menu-sa-cenama.pdf'),(12,19,5,12,'Guca 2016 ','00-24','DragaÄevski sabor trubaÄa biÄ‡e odrÅ¾an 11, 12 i 13. Avgusta 2016. godine, kada Ä‡e biti odrÅ¾ana seniorska i juniorska takmiÄenja trubaÄa, kao i revijalni koncertni program.\r\nNeoficijelni program festivala poÄeÄ‡e veÄ‡ u sredu, koncertom na stadionu, a zavÅ¡iÄ‡e se takoÄ‘e koncertom u nedelju 14. Avgusta.\r\n\r\nOrganizatori zadrÅ¾avaju pravo promene programa do poÄetka sabora!\r\n\r\nSreda, 10. Avgust 2016. (neoficijelni festivalski dan)\r\n\r\n21:00 Koncert Ceca RaÅ¾natoviÄ‡ - pozornica na stadionu\r\n23:00 Koncert Riblja ÄŒorba - pozornica na stadionu\r\n\r\nÄŒetvrtak, 11. Avgust 2016.\r\n\r\n12:00 Otvaranje sabora\r\n19:00 Koncert \"Pobedili su - zasluÅ¾ili su\" - pozornica u centru\r\n23:00 PonoÄ‡ni koncert - pozornica na stadionu\r\n\r\nPetak, 12. Avgust 2016.\r\n\r\n18:00 Defile uÄesnika i gostiju ulicama GuÄe\r\n20:00 Koncert - pozornica na stadionu\r\n21:00 Koncert majstora trube - pozornica na stadionu\r\n\r\nSubota, 13. Avgust 2016.\r\n\r\n14:00 Kulturno umetniÄki program -  koncert u centru\r\n21:00 Finalno takmiÄenje seniorskih orkestara - pozornica na stadionu\r\n23:00 Koncert pobednika sabora â€“ pozornica na stadionu\r\n\r\nNedelja, 14. Avgust 2016. (neoficijelni festivalski dan)\r\n\r\n21:00 Koncert Severina VuÄkoviÄ‡ - pozornica na stadionu\r\n23:00 Miroslav IliÄ‡ - pozornica na stadionu','guca11.jpg','Guca','/','menu-sa-cenama.pdf'),(13,1,3,10,'Otvoreni tereni za mali i veliki fudbal - iznajmljivanje','09-21','Otvoreni tereni za mali i veliki fudbal nalaze se u ulici Kneza ViÅ¡eslava broj 72, na KoÅ¡utnjaku. SmeÅ¡teni na veoma atraktivnoj lokaciji u Beogradu, u prirodnom okruÅ¾enju, naÅ¡i tereni za fudbal predstavljaju najbolji izbor za sve one koji Å¾ele rekreativno da se bave fudbalom i uÅ¾ivaju u jedinstvenim prirodnim lepotama. NaÅ¡i tereni na otvorenom, za mali i veliki fudbal, postoje veÄ‡ viÅ¡e od jedne decenije, doÄekujuÄ‡i svakodnevno veliki broj ljubitelja sporta i rekreacije. Bilo da se profesionalno ili rekreativno bavite sportom, naÅ¡i otvoreni tereni za fudbal su VaÅ¡ najbolji izbor za trening i opuÅ¡tanje u fudbalskoj utakmici sa ekipom iz kraja. Na raspolaganju su Vam:\r\n- VELIKI TEREN ZA FUDBAL â€“ dimenzija 100 x 67m\r\n- MALI TEREN ZA FUDBAL â€“ dimenzija 24 x 44m\r\n\r\nPrilikom iznajmljivanja otvorenih fudbalskih terena, dobijate svu neophodnu opremu u vidu lopti i markera. U neposrednoj blizini terena za mali i veliki fudbal nalaze se svlaÄionice sa tuÅ¡ kabinama, koje moÅ¾ete koristiti pre i posle treninga. TakoÄ‘e nedaleko od naÅ¡ih terena naiÄ‡i Ä‡ete na kafiÄ‡e u kojima se moÅ¾ete osveÅ¾iti nakon napornog treninga i prodiskutovati o upravo zavrÅ¡enoj fudbalskoj utakmici. Termini i cene iznajmljivanja terena za fudbal:\r\n- od 08 â€“ 13h â€“ 2000 rsd\r\n- od 13 â€“ 18h â€“ 3000 rsd\r\n- od 18 â€“ 24h â€“ 4000 rsd','tereni.jpg','Kneza ViÅ¡eslava 72, KoÅ¡utnjak 11000 Beograd','064/24-24-244','menu-sa-cenama.pdf'),(14,1,6,15,'ZIM Rent-a-Car','06-20','ZIP renta car Beograd ima odliÄan odnos cene i kvaliteta. Mi se nalazimo u Beogradu, taÄnije na Novom Beogradu.\r\nSva naÅ¡a vozila su potpuno ispravna i redovno servisirana, ne morate razmiÅ¡ljati o tome da li je auto ispravan ili ne. Sva vozila su potpuno sigurna i opremljena GPS ureÄ‘em (opciono), tako da moÅ¾ete biti sasvim sigurni da se neÄ‡ete izgubiti.','rent.png','Dzordza Vasingtona 9 11000 Beograd','064/24-24-244','menu-sa-cenama.pdf'),(15,5,2,1,'Restoran Amphora','09-24','In tempus enim nec mi bibendum, eget porta quam posuere. Sed vel rutrum urna, eu imperdiet leo. Mauris tincidunt lorem porttitor venenatis vehicula. Fusce maximus mollis mi, sit amet fermentum elit vestibulum ac. Integer nec dolor porta, condimentum odio non, dapibus ipsum. Vestibulum tortor turpis, suscipit ac pharetra quis, ultrices eu nibh. Sed bibendum congue velit sed volutpat. Praesent vel consectetur dolor, nec scelerisque eros. ','Restoran-Amfora-5.jpg','Kraljice Natalije 46 Arandjelovac','060/00-00-200','menu-sa-cenama.pdf'),(16,2,6,15,'Easy Way rent-a-car','06 - 21','In sed est nisi. Cras tempor purus non tellus venenatis, ac convallis erat sodales. Cras efficitur bibendum metus nec vulputate. Nullam vel aliquam est. Nullam sagittis scelerisque porttitor. In hac habitasse platea dictumst. Praesent velit ipsum, porta quis ornare ac, tempor nec dolor. Nulla at dolor dolor. Pellentesque non arcu enim. Etiam efficitur magna velit, id commodo odio lobortis ac. Vestibulum id sem sed sapien vulputate faucibus. Proin fringilla viverra libero. Sed bibendum, massa sit amet efficitur blandit, magna lectus molestie urna, at aliquet orci dolor sed ante. Pellentesque id commodo sem. Aenean elementum mi luctus vehicula vehicula.','easyway-car-rental-logo.png','Kraljice Natalije 46 11000 Novi Sad','060/00-00-200','getImage.pdf'),(20,1,1,5,'Hotel Moskva','00-24','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis fringilla erat et ligula cursus pulvinar. Nunc id ipsum ante. In tristique ligula et auctor consequat. In finibus cursus lorem, vitae dictum sapien bibendum nec. Vivamus id orci dui. Cras at tortor mi. Nullam pulvinar, nulla tristique mollis cursus, elit quam consectetur nulla, vitae pharetra ipsum sapien volutpat nisi. Praesent blandit metus id condimentum aliquam. Aenean diam nibh, tempus non condimentum eget, venenatis non est. Phasellus ex leo, hendrerit ut aliquet et, porttitor et nibh. Fusce tempus eget sem in malesuada.','HOTEL2.jpg','Balkanska, Beograd 11000','064/24-24-244','Izvor cenovnik.pdf'),(23,2,2,4,'Rostil SoulFood','00-24','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis fringilla erat et ligula cursus pulvinar. Nunc id ipsum ante. In tristique ligula et auctor consequat. In finibus cursus lorem, vitae dictum sapien bibendum nec. Vivamus id orci dui. Cras at tortor mi. Nullam pulvinar, nulla tristique mollis cursus, elit quam consectetur nulla, vitae pharetra ipsum sapien volutpat nisi. Praesent blandit metus id condimentum aliquam. Aenean diam nibh, tempus non condimentum eget, venenatis non est. Phasellus ex leo, hendrerit ut aliquet et, porttitor et nibh. Fusce tempus eget sem in malesuada.','from-gladys-knight-s-to-jct-these-are-atlanta-s-10-best-soul-food-spots.jpeg','Kraljice Natalije 46 Novi Sad','060/00-00-200','fast-food-has-meni.pdf'),(24,1,1,5,'Hotel JumpInn','00-24','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis fringilla erat et ligula cursus pulvinar. Nunc id ipsum ante. In tristique ligula et auctor consequat. In finibus cursus lorem, vitae dictum sapien bibendum nec. Vivamus id orci dui. Cras at tortor mi. Nullam pulvinar, nulla tristique mollis cursus, elit quam consectetur nulla, vitae pharetra ipsum sapien volutpat nisi. Praesent blandit metus id condimentum aliquam. Aenean diam nibh, tempus non condimentum eget, venenatis non est. Phasellus ex leo, hendrerit ut aliquet et, porttitor et nibh. Fusce tempus eget sem in malesuada.','hotel_jump_inn_6_221013.jpg','Koce Popovica 1 11000 Beograd','060/00-00-200','fast-food-has-meniq12.pdf');
/*!40000 ALTER TABLE `objekti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervacije`
--

DROP TABLE IF EXISTS `rezervacije`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rezervacije` (
  `rez_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rez_ime` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rez_prezime` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rez_objekat` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rez_brojosoba` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rez_sati` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rez_od` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rez_do` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `rez_komentar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`rez_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervacije`
--

LOCK TABLES `rezervacije` WRITE;
/*!40000 ALTER TABLE `rezervacije` DISABLE KEYS */;
INSERT INTO `rezervacije` VALUES (1,'Milos','Jovanovic','Hotel Prag','5','20h','17/7/2016','18/7/2016','Cao Cao'),(2,'Marko','Jovanovic','Hotel Prag','6','20','07/11/2016','07/20/2016','cao cao');
/*!40000 ALTER TABLE `rezervacije` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip`
--

DROP TABLE IF EXISTS `tip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tip` (
  `tip_id` int(11) NOT NULL AUTO_INCREMENT,
  `tip_ime` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`tip_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip`
--

LOCK TABLES `tip` WRITE;
/*!40000 ALTER TABLE `tip` DISABLE KEYS */;
INSERT INTO `tip` VALUES (1,'Smestaj'),(2,'Hrana'),(3,'Sport'),(4,'Koncerti'),(5,'Festivali'),(6,'Rent-a-Car');
/*!40000 ALTER TABLE `tip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vrsta`
--

DROP TABLE IF EXISTS `vrsta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vrsta` (
  `vrsta_id` int(11) NOT NULL AUTO_INCREMENT,
  `vrsta_tip` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  `vrsta_ime` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`vrsta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vrsta`
--

LOCK TABLES `vrsta` WRITE;
/*!40000 ALTER TABLE `vrsta` DISABLE KEYS */;
INSERT INTO `vrsta` VALUES (1,'2','Restoran'),(2,'2','Brza hrana'),(3,'2','Pekara'),(4,'2','Rostilj'),(5,'1','Hotel'),(6,'1','Hostel'),(7,'1','Guesthouse'),(8,'1','Stan'),(9,'3','Karte za utakmicu'),(10,'3','Iznajmljivanje terena'),(11,'4','Prodaja karata za koncerte '),(12,'5','Prodaja karata za festivale'),(13,'5 ','Organizovani prevoz za festivale'),(14,'3','Prodaja karata '),(15,'6','Iznajmljivanje');
/*!40000 ALTER TABLE `vrsta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-03 21:13:09
