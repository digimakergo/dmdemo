-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: dmdemo_pub
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

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
-- Table structure for table `dm_activation`
--

DROP TABLE IF EXISTS `dm_activation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_activation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(60) NOT NULL DEFAULT '',
  `type` varchar(20) NOT NULL DEFAULT '',
  `ref` varchar(20) NOT NULL DEFAULT '',
  `created` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_activation`
--

LOCK TABLES `dm_activation` WRITE;
/*!40000 ALTER TABLE `dm_activation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_activation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_article`
--

DROP TABLE IF EXISTS `dm_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `author` int(11) NOT NULL DEFAULT '0',
  `editors` varchar(255) NOT NULL DEFAULT '',
  `coverimage` varchar(255) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `summary` text NOT NULL,
  `body` text NOT NULL,
  `block_linktext` varchar(255) NOT NULL DEFAULT '',
  `block_linkto` varchar(255) NOT NULL DEFAULT '',
  `languages` json DEFAULT NULL,
  `related_articles` json DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `cuid` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_article`
--

LOCK TABLES `dm_article` WRITE;
/*!40000 ALTER TABLE `dm_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_draft`
--

DROP TABLE IF EXISTS `dm_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_draft` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) NOT NULL,
  `parent_location_id` int(11) NOT NULL DEFAULT '0',
  `operation` varchar(150) NOT NULL,
  `time` datetime DEFAULT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_draft`
--

LOCK TABLES `dm_draft` WRITE;
/*!40000 ALTER TABLE `dm_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_folder`
--

DROP TABLE IF EXISTS `dm_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_folder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `folder_type` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `banner` varchar(255) NOT NULL DEFAULT '',
  `hide_sidemenu` tinyint(1) NOT NULL DEFAULT '0',
  `summary` text NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `cuid` varchar(30) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `author` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_folder`
--

LOCK TABLES `dm_folder` WRITE;
/*!40000 ALTER TABLE `dm_folder` DISABLE KEYS */;
INSERT INTO `dm_folder` VALUES (1,'','Content','',0,'',1560534265,1560534265,'bk1tpudi6ekibbmo2ch0',0,1,1),(2,'','Users','',0,'',1560534277,1560534277,'bk1tq1di6ekibbmo2ci0',0,1,1),(3,'site','Demo','',0,'<p>This is a demo site.</p>',1560534450,1616239519,'bk1trcli6ekibbmo2cj0',0,1,1),(24,'','Organization','',0,'',1606001434,1606001434,'busq66h8d3bf3fc0hl30',0,1,1),(25,'','Roles','',0,'',1606001458,1606001458,'busq6ch8d3bf3fc0hl40',0,1,1),(26,'','News','',0,'',1614682007,1614682007,'c0v1f5uvvhfup2usch3g',0,0,1),(27,'','About us','',0,'',1614682022,1614682022,'c0v1f9mvvhfup2usch4g',0,0,1),(28,'','Products','',0,'',1614682043,1614682043,'c0v1feuvvhfup2usch5g',0,0,1),(29,'','Resources','',0,'',1614847995,1614847995,'c109vuuvvhfvc1h67skg',0,0,1),(30,'','Images','',0,'',1614848078,1614848078,'c10a0jmvvhfvc1h67slg',0,0,1),(31,'','Files','',0,'',1614848228,1614848228,'c10a1p6vvhfvc1h67smg',0,0,1),(32,'','Shared','',0,'',1615497038,1615497038,'c158ejmvvhfle47bafg0',0,0,1),(33,'','Photos','',0,'',1615497089,1615497233,'c158f0evvhfle47bafh0',0,0,1);
/*!40000 ALTER TABLE `dm_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_image`
--

DROP TABLE IF EXISTS `dm_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` int(11) NOT NULL DEFAULT '0',
  `imagetype` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `cuid` varchar(30) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  `location_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(500) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_image`
--

LOCK TABLES `dm_image` WRITE;
/*!40000 ALTER TABLE `dm_image` DISABLE KEYS */;
INSERT INTO `dm_image` VALUES (2,2,'','','',1615499606,1615499606,0,'c1592lmvvhfm01j61g1g',0,461,'images/q/qui/upload-091024824-logo.png','logo'),(6,1,'','','',1615537225,1615537225,0,'c15i8ievvhfm4si4959g',0,461,'images/e/ezg/upload-848852230-dsc_2857.jpg','DSC_2857'),(7,1,'','','',1615537246,1615537246,0,'c15i8nmvvhfm4si495a0',0,461,'images/b/bum/upload-740343981-dsc_3008.jpg','DSC_3008'),(8,1,'','','',1615537254,1615537254,0,'c15i8pmvvhfm4si495ag',0,461,'images/x/xfr/upload-306875944-dsc_2987.jpg','DSC_2987'),(9,3,'','','',1615548087,1615548087,0,'c15ktduvvhfoinu52gg0',0,461,'images/o/oik/upload-135615037-dsc_2857.jpg','Farm'),(10,3,'','Garden','',1615883989,1615883989,0,'c186tlevvhfuf0n32kug',0,461,'images/c/cbt/upload-949150609-img_20210314_120133.jpg','Garden'),(11,3,'','','',1616239578,1616239578,0,'c1atnmmvvhftbgrejnug',0,461,'images/p/pln/upload-318528974-dsc_2857.jpg','Test');
/*!40000 ALTER TABLE `dm_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_location`
--

DROP TABLE IF EXISTS `dm_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '-1',
  `main_id` int(11) NOT NULL,
  `hierarchy` varchar(255) NOT NULL DEFAULT '',
  `depth` int(11) NOT NULL DEFAULT '0',
  `identifier_path` varchar(255) NOT NULL DEFAULT '',
  `content_type` varchar(50) NOT NULL DEFAULT '',
  `content_id` int(11) NOT NULL,
  `language` varchar(20) NOT NULL DEFAULT '',
  `author` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `is_invisible` tinyint(1) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `uid` varchar(50) NOT NULL DEFAULT '',
  `scope` varchar(30) NOT NULL DEFAULT '',
  `section` varchar(50) NOT NULL DEFAULT '',
  `p` varchar(30) NOT NULL DEFAULT 'c',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_location`
--

LOCK TABLES `dm_location` WRITE;
/*!40000 ALTER TABLE `dm_location` DISABLE KEYS */;
INSERT INTO `dm_location` VALUES (1,0,1,'1',1,'content','folder',1,'',1,'Content',0,0,0,'bk1tpudi6ekibbmo2chg','','public',''),(2,0,2,'2',1,'users','folder',2,'',1,'Users',0,0,0,'bk1tq1di6ekibbmo2cig','','',''),(3,1,3,'1/3',2,'content/demosite','folder',3,'',1,'Demo',0,0,0,'bk1trcli6ekibbmo2cjg','','public',''),(4,2,4,'2/4',2,'users/organization','folder',24,'',1,'Organization',0,0,0,'busq66h8d3bf3fc0hl3g','','',''),(5,4,5,'2/4/5',3,'users/organization/administrator-admin','user',1,'',1,'Administrator Admin',0,0,0,'bk1tsc5i6ekibbmo2clg','','',''),(6,4,6,'2/4/6',3,'users/organization/anonymous-user','user',2,'',1,'Anonymous User',0,0,0,'bk1tstli6ekibbmo2cmg','','',''),(7,2,7,'2/7',2,'roles/anonymous','folder',25,'',1,'Roles',0,0,0,'bk1vutti6ekij1eq9sgg','','',''),(9,1,9,'1/9',2,'content/resources','folder',29,'',0,'Resources',0,0,0,'c109vuuvvhfvc1h67sl0','','public',''),(10,9,10,'1/9/10',3,'content/resources/images','folder',30,'',0,'Images',0,0,0,'c10a0juvvhfvc1h67sm0','','public',''),(454,3,454,'1/3/454',3,'content/demosite/news','folder',26,'',0,'News',0,0,0,'c0v1f5uvvhfup2usch40','','public',''),(455,3,455,'1/3/455',3,'content/demosite/about-us','folder',27,'',0,'About us',0,0,0,'c0v1f9mvvhfup2usch50','','public',''),(456,3,456,'1/3/456',3,'content/demosite/products','folder',28,'',0,'Products',0,0,0,'c0v1feuvvhfup2usch60','','public',''),(459,9,459,'1/9/459',3,'content/resources/files','folder',31,'',0,'Files',0,0,0,'c10a1p6vvhfvc1h67sn0','','public',''),(460,1,460,'1/460',2,'content/shared','folder',32,'',0,'Shared',0,0,0,'c158ejmvvhfle47bafgg','','public',''),(461,460,461,'1/460/461',3,'content/shared/images','folder',33,'',0,'Photos',0,0,0,'c158f0evvhfle47bafhg','','public',''),(462,4,462,'2/4/462',3,'users/organization/member-name','user',3,'',0,'Test Member',0,0,0,'c15kltevvhfo4ero31ig','','','');
/*!40000 ALTER TABLE `dm_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_log_operation`
--

DROP TABLE IF EXISTS `dm_log_operation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_log_operation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL DEFAULT '0',
  `category` varchar(50) NOT NULL DEFAULT '',
  `operation` varchar(255) NOT NULL DEFAULT '',
  `created` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_log_operation`
--

LOCK TABLES `dm_log_operation` WRITE;
/*!40000 ALTER TABLE `dm_log_operation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_log_operation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_relation`
--

DROP TABLE IF EXISTS `dm_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_relation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `to_content_id` int(11) NOT NULL DEFAULT '0',
  `to_type` varchar(50) NOT NULL DEFAULT '',
  `from_content_id` int(11) NOT NULL DEFAULT '0',
  `from_type` varchar(30) NOT NULL DEFAULT '',
  `from_location` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) NOT NULL DEFAULT '0',
  `identifier` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  `uid` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_relation`
--

LOCK TABLES `dm_relation` WRITE;
/*!40000 ALTER TABLE `dm_relation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_relation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_role`
--

DROP TABLE IF EXISTS `dm_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `summary` text NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `author` int(11) DEFAULT '0',
  `identifier` varchar(100) NOT NULL DEFAULT '',
  `parameters` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_role`
--

LOCK TABLES `dm_role` WRITE;
/*!40000 ALTER TABLE `dm_role` DISABLE KEYS */;
INSERT INTO `dm_role` VALUES (1,'Anonymous','',1560543095,1560543095,1,'',NULL),(2,'Editor','',1560543877,1560543877,1,'',NULL),(3,'Anonymous','',1572803355,1615413222,1,'anonymous',NULL),(7,'Members','',1572803619,1572803619,1,'member',NULL),(8,'Administrator','',1602106747,1602106747,1,'admin',NULL);
/*!40000 ALTER TABLE `dm_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_token_state`
--

DROP TABLE IF EXISTS `dm_token_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_token_state` (
  `guid` varchar(50) NOT NULL DEFAULT '',
  `expiry` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_token_state`
--

LOCK TABLES `dm_token_state` WRITE;
/*!40000 ALTER TABLE `dm_token_state` DISABLE KEYS */;
INSERT INTO `dm_token_state` VALUES ('d38ef51b-2187-4f40-8a9e-b6b25d9547a7',1606009752),('301780da-beee-48be-8b66-46795a6dc875',1606072533),('1489938b-0070-4c32-aef4-9d54f75d97cc',1606090902),('5c84e204-c54f-43ef-8ad3-66bd6c6cfdaa',1606092113),('32312da5-6a5d-4326-a936-30db14b8d29f',1614692748),('29c1ddb2-cc5d-412a-a217-198558a1d13d',1614857550),('472c94c7-ef3c-483d-9c36-f54955494dfa',1614872852),('600ed42e-011b-48dc-a07d-0f1efaae9564',1615030883),('e8b58b8a-9389-40cd-b91b-4a2e1646febc',1615422279),('960fbab6-33b2-493c-b377-70dbe0fc09b5',1615460787),('9d08f9f9-f2a3-4c57-ab36-eb5ac78bdc64',1615472356),('41fd9bf9-82e2-4020-ba12-1abf19385fff',1615485609),('357c8570-b220-4a1f-8802-e33ff41308e3',1615494626),('dfe66769-9104-486d-a58e-f5003eaf4df0',1615506999),('73e89082-90db-4127-bca9-cc409a41fc05',1615507805),('18ad36c9-3d9b-4ee7-912d-463dd8fdd3bd',1615542842),('13b6c72e-4318-4795-8142-d1403a42a68f',1615547730),('f62ce6e6-a369-46d9-860f-62f2a99b9ce5',1615552822),('3ecbf947-bf6a-4557-bdec-e41e6c5a7e88',1615554681),('088b64a3-2610-45e9-959d-b153d277edfa',1615558030),('44979603-ec37-4ccb-90a3-cbb485f90ebd',1615558103),('0f15c3f8-9e15-4fb9-8da4-775307fafda6',1615893136),('8f8d3ee3-91bd-4328-98e5-b08f73e09d63',1615894701),('c196caf5-5b59-4e95-87b3-06aebbc85172',1615977881),('572bd97e-a00b-4dfc-b4cb-d15559c21670',1615980909),('b5f76f03-daca-49ac-b895-a4fbc68ad789',1615984872),('b699e62d-4d93-4d16-ba0f-bf74a081f259',1616089401),('63234db6-aa09-448d-98a2-8012dcf03682',1616089482),('e91fa7cf-e9e5-40bd-8a71-91d1f9e3547f',1616154262),('0079a5d5-c395-455d-bebb-4d549d3da8ca',1616154366),('3c598dc2-2e54-40c9-86c6-6ef3797c69c9',1616164126),('3c1822a8-c6c7-4628-bfa9-64e39d268034',1616250290),('6a591ffa-6035-453b-b373-501410f37464',1616250342),('1125be2a-9e01-4075-a069-e7caf91d5b64',1616595034),('49274899-0cbe-48f1-afd2-ac33dada4ce3',1616678180),('fa3f4727-9179-40cb-9a18-c4c5295c7689',1617148659),('c5fa0c5d-1b7b-471a-878b-b955836e21fd',1617279469),('6f47e3c1-009b-44da-8b1e-88efcb177885',1617281071),('77053383-ddf2-45c8-b41a-05429a725878',1627996005),('394f7b08-378b-4638-b992-c2a58e751d6b',1628008941);
/*!40000 ALTER TABLE `dm_token_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user`
--

DROP TABLE IF EXISTS `dm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `password` binary(60) DEFAULT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  `cuid` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `preferance` varchar(255) NOT NULL DEFAULT '',
  `author` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user`
--

LOCK TABLES `dm_user` WRITE;
/*!40000 ALTER TABLE `dm_user` DISABLE KEYS */;
INSERT INTO `dm_user` VALUES (1,'admin','Administrator','Admin',_binary '$2a$14$.CDllulymS4HOmejgwrKaOn0N1g1VI.YQP2IZcA3TRQgHMoQ9ovcq',1560534576,1615496463,7,'bk1tsc5i6ekibbmo2cl0','chen@digimaker.com',1,'',1),(2,'anonymous','Anonymous','User',_binary '\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0',1560534645,1560534645,1,'bk1tstdi6ekibbmo2cm0','',1,'',1),(3,'member','Test','Member',_binary '$2a$14$7LnzFPW2VEGr9FXHH.b6W.7jF8FP88G1g/UdhFCqokp3VxeIgVzLG',1615547124,1615556633,5,'c15klt6vvhfo4ero31i0','chen@digimaker.no',0,'',1);
/*!40000 ALTER TABLE `dm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user_role`
--

DROP TABLE IF EXISTS `dm_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user_role`
--

LOCK TABLES `dm_user_role` WRITE;
/*!40000 ALTER TABLE `dm_user_role` DISABLE KEYS */;
INSERT INTO `dm_user_role` VALUES (149,1,8),(150,2,3),(151,3,7);
/*!40000 ALTER TABLE `dm_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_usergroup`
--

DROP TABLE IF EXISTS `dm_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_usergroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL DEFAULT '',
  `summary` text NOT NULL,
  `published` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `cuid` varchar(30) NOT NULL DEFAULT '',
  `version` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `author` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_usergroup`
--

LOCK TABLES `dm_usergroup` WRITE;
/*!40000 ALTER TABLE `dm_usergroup` DISABLE KEYS */;
INSERT INTO `dm_usergroup` VALUES (9,'Organization','',1577728826,1577728826,'bo53mei23aki2n1jbpq0',0,0,1),(10,'Members','',1577728935,1577728935,'bo53n9q23aki2n1jbpr0',0,0,1),(12,'Administrator','',1577728976,1577728976,'bo53nk223aki2n1jbpt0',0,0,1);
/*!40000 ALTER TABLE `dm_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_version`
--

DROP TABLE IF EXISTS `dm_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content_type` varchar(50) NOT NULL,
  `content_id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `author` int(11) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `location_id` int(11) NOT NULL DEFAULT '0',
  `created` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=572 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_version`
--

LOCK TABLES `dm_version` WRITE;
/*!40000 ALTER TABLE `dm_version` DISABLE KEYS */;
INSERT INTO `dm_version` VALUES (564,'user',1,5,0,1,'{\"cid\":1,\"version\":4,\"published\":1560534576,\"modified\":1591484517,\"cuid\":\"bk1tsc5i6ekibbmo2cl0\",\"status\":1,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.com\",\"firstname\":\"Administrator\",\"lastname\":\"Admin\",\"login\":\"admin\",\"preferance\":\"\",\"id\":5,\"parent_id\":4,\"main_id\":5,\"identifier_path\":\"users/organization/administrator-admin\",\"hierarchy\":\"2/4/5\",\"depth\":3,\"content_type\":\"user\",\"content_id\":1,\"language\":\"\",\"name\":\"Administrator Admin\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"bk1tsc5i6ekibbmo2clg\",\"section\":\"\",\"p\":\"\"}',0,0),(565,'user',1,6,0,1,'{\"cid\":1,\"version\":5,\"published\":1560534576,\"modified\":1606061706,\"cuid\":\"bk1tsc5i6ekibbmo2cl0\",\"status\":1,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.com\",\"firstname\":\"Administrator1\",\"lastname\":\"Admin\",\"login\":\"admin\",\"preferance\":\"\",\"id\":5,\"parent_id\":4,\"main_id\":5,\"identifier_path\":\"users/organization/administrator-admin\",\"hierarchy\":\"2/4/5\",\"depth\":3,\"content_type\":\"user\",\"content_id\":1,\"language\":\"\",\"name\":\"Administrator Admin\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"bk1tsc5i6ekibbmo2clg\",\"section\":\"\",\"p\":\"\"}',0,0),(566,'user',1,7,0,1,'{\"cid\":1,\"version\":6,\"published\":1560534576,\"modified\":1615496458,\"cuid\":\"bk1tsc5i6ekibbmo2cl0\",\"status\":1,\"author\":1,\"author_name\":\"Administrator1 Admin\",\"relations\":{},\"email\":\"chen@digimaker.com\",\"firstname\":\"Administrator\",\"lastname\":\"Admin\",\"login\":\"admin\",\"preferance\":\"\",\"id\":5,\"parent_id\":4,\"main_id\":5,\"identifier_path\":\"users/organization/administrator-admin\",\"hierarchy\":\"2/4/5\",\"depth\":3,\"content_type\":\"user\",\"content_id\":1,\"language\":\"\",\"name\":\"Administrator1 Admin\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"bk1tsc5i6ekibbmo2clg\",\"section\":\"\",\"p\":\"\"}',0,0),(567,'user',3,1,0,1,'{\"cid\":3,\"version\":1,\"published\":1615547124,\"modified\":1615547124,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"\",\"relations\":null,\"email\":\"chen@digimaker.no\",\"firstname\":\"Member\",\"lastname\":\"Name\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(568,'user',3,2,0,1,'{\"cid\":3,\"version\":1,\"published\":1615547124,\"modified\":1615547124,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.no\",\"firstname\":\"Member1\",\"lastname\":\"Name\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(569,'user',3,3,0,1,'{\"cid\":3,\"version\":2,\"published\":1615547124,\"modified\":1615548401,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.no\",\"firstname\":\"Member\",\"lastname\":\"Name\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member1 Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(570,'user',3,4,0,1,'{\"cid\":3,\"version\":3,\"published\":1615547124,\"modified\":1615548406,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.no\",\"firstname\":\"Member\",\"lastname\":\"Name\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(571,'user',3,5,0,1,'{\"cid\":3,\"version\":4,\"published\":1615547124,\"modified\":1615548511,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.no\",\"firstname\":\"Test\",\"lastname\":\"Member\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0);
/*!40000 ALTER TABLE `dm_version` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-03 15:45:34
