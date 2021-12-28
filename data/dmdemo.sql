-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: dmdemo
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_article`
--

LOCK TABLES `dm_article` WRITE;
/*!40000 ALTER TABLE `dm_article` DISABLE KEYS */;
INSERT INTO `dm_article` VALUES (2,0,48,1,'','','Test','','<p><img data-dm-content=\"image;c15ktduvvhfoinu52gg0;9\" src=\"../var/images/o/oik/upload-135615037-dsc_2857.jpg\" width=\"269\" height=\"179\" /></p>','','',NULL,NULL,1617742097,1618044684,'c1mci4evvhfo3q8vofcg'),(3,0,4,1,'','','fff1','','','','',NULL,NULL,1628163956,1628196214,'c45sut594814ldkkc0t0'),(4,0,1,1,'','','Test','','ff','','',NULL,NULL,1631283443,1631283443,'c4tmhst94811behlf6f0');
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
  `display_type` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_folder`
--

LOCK TABLES `dm_folder` WRITE;
/*!40000 ALTER TABLE `dm_folder` DISABLE KEYS */;
INSERT INTO `dm_folder` VALUES (1,'','Content','',0,'',1560534265,1560534265,'bk1tpudi6ekibbmo2ch0',0,1,1,''),(2,'','Users','',0,'',1560534277,1560534277,'bk1tq1di6ekibbmo2ci0',0,1,1,''),(3,'site','Demo','',0,'<p>This is a demo site.</p>',1560534450,1616239519,'bk1trcli6ekibbmo2cj0',0,1,1,''),(24,'','Organization','',0,'',1606001434,1606001434,'busq66h8d3bf3fc0hl30',0,1,1,''),(25,'','Roles','',0,'',1606001458,1606001458,'busq6ch8d3bf3fc0hl40',0,1,1,''),(26,'','News','',0,'',1614682007,1640698900,'c0v1f5uvvhfup2usch3g',0,0,1,'news'),(27,'','About us','',0,'',1614682022,1614682022,'c0v1f9mvvhfup2usch4g',0,0,1,''),(28,'','Products','',0,'',1614682043,1614682043,'c0v1feuvvhfup2usch5g',0,0,1,''),(29,'','Resources','',0,'',1614847995,1614847995,'c109vuuvvhfvc1h67skg',0,0,1,''),(30,'','Images','',0,'',1614848078,1614848078,'c10a0jmvvhfvc1h67slg',0,0,1,''),(31,'','Files','',0,'',1614848228,1614848228,'c10a1p6vvhfvc1h67smg',0,0,1,''),(32,'','Shared','',0,'',1615497038,1615497038,'c158ejmvvhfle47bafg0',0,0,1,''),(33,'','Photos','',0,'',1615497089,1615497233,'c158f0evvhfle47bafh0',0,0,1,'');
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
  `published` int(11) NOT NULL DEFAULT '0',
  `modified` int(11) NOT NULL DEFAULT '0',
  `cuid` varchar(30) NOT NULL DEFAULT '',
  `location_id` int(11) NOT NULL DEFAULT '0',
  `image` varchar(500) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_image`
--

LOCK TABLES `dm_image` WRITE;
/*!40000 ALTER TABLE `dm_image` DISABLE KEYS */;
INSERT INTO `dm_image` VALUES (2,2,'',1615499606,1615499606,'c1592lmvvhfm01j61g1g',461,'images/q/qui/upload-091024824-logo.png','logo'),(6,1,'',1615537225,1615537225,'c15i8ievvhfm4si4959g',461,'images/e/ezg/upload-848852230-dsc_2857.jpg','DSC_2857'),(7,1,'',1615537246,1615537246,'c15i8nmvvhfm4si495a0',461,'images/b/bum/upload-740343981-dsc_3008.jpg','DSC_3008'),(8,1,'',1615537254,1615537254,'c15i8pmvvhfm4si495ag',461,'images/x/xfr/upload-306875944-dsc_2987.jpg','DSC_2987'),(9,3,'',1615548087,1615548087,'c15ktduvvhfoinu52gg0',461,'images/o/oik/upload-135615037-dsc_2857.jpg','Farm'),(10,3,'',1615883989,1617569030,'c186tlevvhfuf0n32kug',461,'images/c/cbt/upload-949150609-img_20210314_120133.jpg','Garden');
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
) ENGINE=InnoDB AUTO_INCREMENT=469 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_location`
--

LOCK TABLES `dm_location` WRITE;
/*!40000 ALTER TABLE `dm_location` DISABLE KEYS */;
INSERT INTO `dm_location` VALUES (1,0,1,'1',1,'content','folder',1,'',1,'Content',0,0,0,'bk1tpudi6ekibbmo2chg','','public',''),(2,0,2,'2',1,'users','folder',2,'',1,'Users',0,0,0,'bk1tq1di6ekibbmo2cig','','',''),(3,1,3,'1/3',2,'content/demosite','folder',3,'',1,'Demo',0,0,0,'bk1trcli6ekibbmo2cjg','','public',''),(4,2,4,'2/4',2,'users/organization','folder',24,'',1,'Organization',0,0,0,'busq66h8d3bf3fc0hl3g','','',''),(5,4,5,'2/4/5',3,'users/organization/administrator-admin','user',1,'',1,'Administrator Admin',0,0,0,'bk1tsc5i6ekibbmo2clg','','',''),(6,4,6,'2/4/6',3,'users/organization/anonymous-user','user',2,'',1,'Anonymous User',0,0,0,'bk1tstli6ekibbmo2cmg','','',''),(7,2,7,'2/7',2,'roles/anonymous','folder',25,'',1,'Roles',0,0,0,'bk1vutti6ekij1eq9sgg','','',''),(8,7,8,'2/7/8',3,'users/anonymous/editor','role',2,'',1,'Editor',0,0,0,'bk2051di6ekislpnehu0','','',''),(9,1,9,'1/9',2,'content/resources','folder',29,'',0,'Resources',0,0,0,'c109vuuvvhfvc1h67sl0','','public',''),(10,9,10,'1/9/10',3,'content/resources/images','folder',30,'',0,'Images',0,0,0,'c10a0juvvhfvc1h67sm0','','public',''),(64,7,64,'2/7/64',3,'users/anonymous/','role',3,'',1,'Anonymous',0,0,0,'bmvh66ot6to17mufvagg','','',''),(68,7,68,'2/7/68',3,'users/anonymous/members','role',7,'',1,'Members',0,0,0,'bmvh88ot6to1b9bl2of0','','',''),(451,7,451,'2/7/451',3,'users/roles/administrator','role',8,'',1,'Administrator',0,0,0,'','','','c'),(453,2,453,'2/453',2,'users/roles','role',1,'',1,'Roles',0,0,0,'busq6ch8d3bf3fc0hl4g','','',''),(454,3,454,'1/3/454',3,'content/demosite/news','folder',26,'',0,'News',0,0,0,'c0v1f5uvvhfup2usch40','','public',''),(455,3,455,'1/3/455',3,'content/demosite/about-us','folder',27,'',0,'About us',0,0,0,'c0v1f9mvvhfup2usch50','','public',''),(456,3,456,'1/3/456',3,'content/demosite/products','folder',28,'',0,'Products',0,0,0,'c0v1feuvvhfup2usch60','','public',''),(459,9,459,'1/9/459',3,'content/resources/files','folder',31,'',0,'Files',0,0,0,'c10a1p6vvhfvc1h67sn0','','public',''),(460,1,460,'1/460',2,'content/shared','folder',32,'',0,'Shared',0,0,0,'c158ejmvvhfle47bafgg','','public',''),(461,460,461,'1/460/461',3,'content/shared/images','folder',33,'',0,'Photos',0,0,0,'c158f0evvhfle47bafhg','','public',''),(462,4,462,'2/4/462',3,'users/organization/member-name','user',3,'',0,'Test Member',0,0,0,'c15kltevvhfo4ero31ig','','',''),(464,454,464,'1/3/454/464',4,'content/demosite/news/test','article',2,'',0,'Test',0,0,0,'c1mci4evvhfo3q8vofd0','','public',''),(465,7,465,'2/7/465',3,'roles/anonymous/member','role',9,'',0,'Member',0,0,0,'c439cgt94817s83haf7g','','',''),(466,7,466,'2/7/466',3,'roles/anonymous/member','role',10,'',0,'Member',0,0,0,'c43a9g594818c5kouui0','','',''),(467,454,467,'1/3/454/467',4,'content/demosite/news/fff','article',3,'',0,'fff1',0,0,0,'c45sut594814ldkkc0tg','','public',''),(468,1,468,'1/468',2,'content/test','article',4,'',0,'Test',0,0,0,'c4tmhst94811behlf6fg','','public','');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_relation`
--

LOCK TABLES `dm_relation` WRITE;
/*!40000 ALTER TABLE `dm_relation` DISABLE KEYS */;
INSERT INTO `dm_relation` VALUES (12,2,'article',1,'user',0,2,'editors','','',''),(13,2,'article',3,'user',0,1,'editors','','','');
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_role`
--

LOCK TABLES `dm_role` WRITE;
/*!40000 ALTER TABLE `dm_role` DISABLE KEYS */;
INSERT INTO `dm_role` VALUES (1,'Anonymous','',1560543095,1560543095,1,'',NULL),(2,'Editor','',1560543877,1560543877,1,'',NULL),(3,'Anonymous','',1572803355,1615413222,1,'anonymous',NULL),(7,'Members','',1572803619,1572803619,1,'member',NULL),(8,'Administrator','',1602106747,1602106747,1,'admin',NULL),(10,'Member','',1627825344,1627825344,1,'member','{\"subject\": 1}'),(11,'Test','',1627996729,1627996729,1,'member','null');
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
  `expiry` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_token_state`
--

LOCK TABLES `dm_token_state` WRITE;
/*!40000 ALTER TABLE `dm_token_state` DISABLE KEYS */;
INSERT INTO `dm_token_state` VALUES ('d38ef51b-2187-4f40-8a9e-b6b25d9547a7',1606009752,0),('301780da-beee-48be-8b66-46795a6dc875',1606072533,0),('1489938b-0070-4c32-aef4-9d54f75d97cc',1606090902,0),('5c84e204-c54f-43ef-8ad3-66bd6c6cfdaa',1606092113,0),('32312da5-6a5d-4326-a936-30db14b8d29f',1614692748,0),('29c1ddb2-cc5d-412a-a217-198558a1d13d',1614857550,0),('472c94c7-ef3c-483d-9c36-f54955494dfa',1614872852,0),('600ed42e-011b-48dc-a07d-0f1efaae9564',1615030883,0),('e8b58b8a-9389-40cd-b91b-4a2e1646febc',1615422279,0),('960fbab6-33b2-493c-b377-70dbe0fc09b5',1615460787,0),('9d08f9f9-f2a3-4c57-ab36-eb5ac78bdc64',1615472356,0),('41fd9bf9-82e2-4020-ba12-1abf19385fff',1615485609,0),('357c8570-b220-4a1f-8802-e33ff41308e3',1615494626,0),('dfe66769-9104-486d-a58e-f5003eaf4df0',1615506999,0),('73e89082-90db-4127-bca9-cc409a41fc05',1615507805,0),('18ad36c9-3d9b-4ee7-912d-463dd8fdd3bd',1615542842,0),('13b6c72e-4318-4795-8142-d1403a42a68f',1615547730,0),('f62ce6e6-a369-46d9-860f-62f2a99b9ce5',1615552822,0),('3ecbf947-bf6a-4557-bdec-e41e6c5a7e88',1615554681,0),('088b64a3-2610-45e9-959d-b153d277edfa',1615558030,0),('44979603-ec37-4ccb-90a3-cbb485f90ebd',1615558103,0),('0f15c3f8-9e15-4fb9-8da4-775307fafda6',1615893136,0),('8f8d3ee3-91bd-4328-98e5-b08f73e09d63',1615894701,0),('c196caf5-5b59-4e95-87b3-06aebbc85172',1615977881,0),('572bd97e-a00b-4dfc-b4cb-d15559c21670',1615980909,0),('b5f76f03-daca-49ac-b895-a4fbc68ad789',1615984872,0),('b699e62d-4d93-4d16-ba0f-bf74a081f259',1616089401,0),('63234db6-aa09-448d-98a2-8012dcf03682',1616089482,0),('e91fa7cf-e9e5-40bd-8a71-91d1f9e3547f',1616154262,0),('0079a5d5-c395-455d-bebb-4d549d3da8ca',1616154366,0),('3c598dc2-2e54-40c9-86c6-6ef3797c69c9',1616164126,0),('3c1822a8-c6c7-4628-bfa9-64e39d268034',1616250290,0),('6a591ffa-6035-453b-b373-501410f37464',1616250342,0),('1125be2a-9e01-4075-a069-e7caf91d5b64',1616595034,0),('49274899-0cbe-48f1-afd2-ac33dada4ce3',1616678180,0),('fa3f4727-9179-40cb-9a18-c4c5295c7689',1617148659,0),('c5fa0c5d-1b7b-471a-878b-b955836e21fd',1617279469,0),('6f47e3c1-009b-44da-8b1e-88efcb177885',1617281071,0),('e57799a5-9433-4c01-8070-f5a19523e9b1',1617541739,0),('a4fef663-a7ad-4248-a720-ed6b0daf3b24',1617542610,0),('61f9e41c-4bd4-49ee-9cdc-65999e61d6fa',1617544403,0),('9a85f7ae-1287-44af-a047-6edd94a71358',1617563598,0),('17c72d98-5de6-4afe-a337-e767aedb3072',1617563812,0),('8439aad4-6af3-42aa-9486-de0f4653ca0d',1617578067,0),('123844b4-9f1e-44c9-9915-e08e5d01b00f',1617579923,0),('ef66f2ef-89ed-4e45-aed2-1bf790df76c5',1617727590,0),('8dedae2d-d5c4-4e71-946d-a265312b1467',1617728208,0),('20734f5f-3626-4250-ad4f-ebdd28b0543c',1617748888,0),('03abcf68-ef5f-4c77-b619-db60131bb826',1617799075,0),('534a37ec-5159-41ec-a797-2ce498b675a9',1617810343,0),('d2f2698a-4385-4cba-a0f9-7903fcfaea17',1617823147,0),('91dc4224-13d9-4972-bef7-928dcac2dad2',1617836882,0),('45ce8022-8c80-4e58-a7cf-92a002332eed',1617874883,0),('c3637fb8-5db1-4e4e-8ebc-07b1c5e7fd19',1617891584,0),('e65bcfaa-72fb-46aa-bd02-b47fc75309cc',1617905548,0),('4fce7012-c85b-46fb-a41c-a567842deba8',1617916419,0),('6f8dec72-241e-4713-ad2f-1303eadb7a34',1617964799,0),('a4c410ab-6875-44d0-9752-4439c2bf1ab3',1617995931,0),('e1264067-c20b-4c82-9b33-8bab463f7558',1618016070,0),('311c3b23-6a89-4676-b29b-2357fb8cee00',1618048565,0),('2e92bf74-432b-4aa2-9fa8-f09e3da2b308',1618059656,0),('3552b4cf-082a-4920-b108-f37fcb6eb049',1618079654,0),('bd10db87-b02a-46b9-824b-f1ae33f806d5',1618090651,0),('0e42f30f-4a7b-4c80-be5c-7eff5534dc05',1618172312,0),('cea20f15-a022-47b9-84c5-9ec0bf4bacd3',1618224261,0),('b02d795d-c37b-4fc5-81f2-40b4ea0d54d7',1618319371,0),('7b155718-1605-4103-8943-9aeff8aff1f5',1618490007,0),('46641e9b-a846-4dba-b0d7-a1649bf1320c',1618768893,0),('5d2b894f-ac19-40b5-9ed3-ec599aeb7e61',1618779940,0),('dc48b544-1792-4eea-90ea-debcf11b61b7',1618828753,0),('f83ab5ef-9a40-4cc3-aa73-c894060a9b64',1619033570,0),('26f9a995-255f-4207-880a-46e1db30d9ca',1619033597,0),('f0301443-2688-4446-99b9-32d3f2fca34b',1619033932,0),('f4fd7f3a-1c54-4208-a39d-809aff9285a1',1619034505,0),('54ca1f83-ded1-49ce-9145-c8ed1b9a1680',1619046094,0),('f08c2ccb-b82e-45c1-9d02-f8d66d9a0165',1619096306,0),('edc01742-cd1c-4b3a-b795-050ddac2333f',1619107639,0),('6843df27-b101-4dab-8781-bc1bcc0ed657',1619124916,0),('4e2f4f2e-4df1-4b46-a9e7-bd93c1a8374d',1619284820,0),('582dd425-f09c-43fc-ac96-94923b6e116a',1619299223,0),('8934125b-8ba0-4e74-a907-1878abaf5761',1622729493,0),('e5847152-ad47-446d-ba70-d845dfdd776c',1627739410,0),('938e29a4-f825-4f7f-8a1e-b649fbd24301',1627771867,0),('1a649e15-bbb2-4e16-96a2-d7a5ffeddf2d',1627831345,0),('5c3a963f-d688-42ad-881c-42108729ad5c',1627927713,0),('c6586093-29fa-40ae-9228-bb720688f1e6',1628001381,0),('5c5916a5-af47-4db9-a22b-7688c1058ff8',1628088497,0),('232f46d3-f412-4548-8147-5745393b608a',1628174157,0),('6815a877-4472-449a-b228-6db274a6f051',1628188352,0),('ea2bbbb6-980a-4cda-81fd-69d7b5603971',1628200450,0),('907f8875-b4c8-477c-8b6e-3f5003ceb4d5',1628206601,0),('051af0e2-91f7-4b4e-a020-900ca8b9d547',1628253663,0),('ca148c32-bf5a-4bb2-a685-e03f5dd4e546',1628255408,0),('7afb1749-eb90-4f64-8a7c-532461987286',1628704163,0),('23cd7d4e-84bb-4986-8f87-5651d3714e67',1628795340,0),('ceb0b967-f41e-4935-b4db-a18d799546df',1628805043,0),('49252d64-0cc4-4e82-b1d9-d2b20cb9cfab',1628861478,0),('649146ad-d75c-475f-a363-a20193bc0004',1628867629,0),('f8754707-785b-4768-9b7b-7df1e91e2f82',1628867633,0),('50b57890-3125-4aaa-8f37-d32161748cf2',1628868676,0),('70d4609a-3a7d-420f-ade5-29316fe0c216',1629298660,0),('b29a1240-a21c-4540-8bbe-a667226edb22',1629298843,0),('f805742a-7ce2-4995-8d85-d4d836063847',1629458670,0),('5e3c0bd2-6ea0-415e-adf9-1338a0a13913',1629458673,0),('5657f749-b68a-4a7e-a7bb-4039459431ac',1629458736,0),('7aedc243-c8cd-455e-b3d5-ad58e0fe5a76',1629462080,0),('a06debf3-5bbc-4385-b0e4-43bcfad5d841',1629674138,0),('59c80ff8-34cb-4eb3-bca5-9404d248a3e2',1629729204,0),('c4991bc2-a6a6-4990-b038-de590425468f',1629754280,0),('ce67b6ff-dae3-4b3a-b701-3ad22f5cdebb',1629756122,0),('b248d15c-b56f-4020-9a74-a9bf744665d9',1629759057,0),('e5c55562-176e-4f67-9c9a-3509f47ec280',1631294093,0),('b70413b9-9a3e-4ecf-9e92-329fdaf94a43',1631537810,0),('01da1ba6-0871-4fc3-be3e-e43ae7533c5f',1631546093,0),('6e9910ab-d52a-4076-9520-17d07f0123aa',1631546101,0),('29edafa5-f927-4111-aedd-deceeadb8b50',1631546113,0),('81fcf630-6eaa-4027-8b5f-df76b80cbc48',1631546147,0),('0f4abfaf-ca7f-4886-af75-0f9980611134',1631548462,0),('ed1206ba-94ad-4fc5-873a-91678747c1ac',1631548497,0),('c5304dd3-8d7f-4981-b031-50aeeadc6bf2',1631548588,0),('51d3d6c2-9d73-40ae-92fa-fc3ef927769b',1639760968,1),('aeffb0ea-7d52-4641-a647-277210ce4c59',1639778991,1),('eaaf6261-385a-46fd-94eb-a05112277b70',1639779048,1),('e573a3da-1a7c-4ab1-b868-d32e43de41c4',1639779101,1),('3d1c5329-3d5f-445f-b7a5-53ce13eefb6d',1639779109,1),('b59c6323-2467-4dba-8f3c-0bb218359d34',1639779125,1),('94513392-2116-47fc-b8b6-3c33eb5f4351',1639779155,1),('a32b0185-4d09-4065-b6b9-e028df1b9947',1639779187,1),('07b11760-2420-442c-9a16-5d4df97598bd',1639779245,1),('2f971786-f74f-4da5-8916-5952e3b0df89',1639779306,1),('8c2e9779-3fa1-44de-a9f2-f08f6066022b',1639779326,1),('667d73dd-ecd1-4c4f-8f63-5f0d03e4d551',1639779352,1),('b488f370-8242-4167-8446-f70c6be092e7',1639779445,1),('9857b71b-5137-4dbc-9062-e56f2401f771',1639779499,1),('43584e5a-ce79-485a-8ee2-57cc3b275864',1639779633,1),('b392a438-4f21-43be-b9ea-ca61b68e14ae',1640708372,1);
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
  `role_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user_role`
--

LOCK TABLES `dm_user_role` WRITE;
/*!40000 ALTER TABLE `dm_user_role` DISABLE KEYS */;
INSERT INTO `dm_user_role` VALUES (149,1,8),(150,2,3),(151,3,7),(156,1,10);
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
) ENGINE=InnoDB AUTO_INCREMENT=627 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_version`
--

LOCK TABLES `dm_version` WRITE;
/*!40000 ALTER TABLE `dm_version` DISABLE KEYS */;
INSERT INTO `dm_version` VALUES (564,'user',1,5,0,1,'{\"cid\":1,\"version\":4,\"published\":1560534576,\"modified\":1591484517,\"cuid\":\"bk1tsc5i6ekibbmo2cl0\",\"status\":1,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.com\",\"firstname\":\"Administrator\",\"lastname\":\"Admin\",\"login\":\"admin\",\"preferance\":\"\",\"id\":5,\"parent_id\":4,\"main_id\":5,\"identifier_path\":\"users/organization/administrator-admin\",\"hierarchy\":\"2/4/5\",\"depth\":3,\"content_type\":\"user\",\"content_id\":1,\"language\":\"\",\"name\":\"Administrator Admin\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"bk1tsc5i6ekibbmo2clg\",\"section\":\"\",\"p\":\"\"}',0,0),(565,'user',1,6,0,1,'{\"cid\":1,\"version\":5,\"published\":1560534576,\"modified\":1606061706,\"cuid\":\"bk1tsc5i6ekibbmo2cl0\",\"status\":1,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.com\",\"firstname\":\"Administrator1\",\"lastname\":\"Admin\",\"login\":\"admin\",\"preferance\":\"\",\"id\":5,\"parent_id\":4,\"main_id\":5,\"identifier_path\":\"users/organization/administrator-admin\",\"hierarchy\":\"2/4/5\",\"depth\":3,\"content_type\":\"user\",\"content_id\":1,\"language\":\"\",\"name\":\"Administrator Admin\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"bk1tsc5i6ekibbmo2clg\",\"section\":\"\",\"p\":\"\"}',0,0),(566,'user',1,7,0,1,'{\"cid\":1,\"version\":6,\"published\":1560534576,\"modified\":1615496458,\"cuid\":\"bk1tsc5i6ekibbmo2cl0\",\"status\":1,\"author\":1,\"author_name\":\"Administrator1 Admin\",\"relations\":{},\"email\":\"chen@digimaker.com\",\"firstname\":\"Administrator\",\"lastname\":\"Admin\",\"login\":\"admin\",\"preferance\":\"\",\"id\":5,\"parent_id\":4,\"main_id\":5,\"identifier_path\":\"users/organization/administrator-admin\",\"hierarchy\":\"2/4/5\",\"depth\":3,\"content_type\":\"user\",\"content_id\":1,\"language\":\"\",\"name\":\"Administrator1 Admin\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"bk1tsc5i6ekibbmo2clg\",\"section\":\"\",\"p\":\"\"}',0,0),(567,'user',3,1,0,1,'{\"cid\":3,\"version\":1,\"published\":1615547124,\"modified\":1615547124,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"\",\"relations\":null,\"email\":\"chen@digimaker.no\",\"firstname\":\"Member\",\"lastname\":\"Name\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(568,'user',3,2,0,1,'{\"cid\":3,\"version\":1,\"published\":1615547124,\"modified\":1615547124,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.no\",\"firstname\":\"Member1\",\"lastname\":\"Name\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(569,'user',3,3,0,1,'{\"cid\":3,\"version\":2,\"published\":1615547124,\"modified\":1615548401,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.no\",\"firstname\":\"Member\",\"lastname\":\"Name\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member1 Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(570,'user',3,4,0,1,'{\"cid\":3,\"version\":3,\"published\":1615547124,\"modified\":1615548406,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.no\",\"firstname\":\"Member\",\"lastname\":\"Name\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(571,'user',3,5,0,1,'{\"cid\":3,\"version\":4,\"published\":1615547124,\"modified\":1615548511,\"cuid\":\"c15klt6vvhfo4ero31i0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{},\"email\":\"chen@digimaker.no\",\"firstname\":\"Test\",\"lastname\":\"Member\",\"login\":\"member\",\"id\":462,\"parent_id\":4,\"main_id\":462,\"identifier_path\":\"users/organization/member-name\",\"hierarchy\":\"2/4/462\",\"depth\":3,\"content_type\":\"user\",\"content_id\":3,\"language\":\"\",\"name\":\"Member Name\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c15kltevvhfo4ero31ig\",\"section\":\"\",\"p\":\"\"}',0,0),(572,'article',2,1,0,1,'{\"cid\":2,\"version\":1,\"published\":1617742097,\"modified\":1617742097,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"\",\"relations\":null,\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(573,'article',2,2,0,1,'{\"cid\":2,\"version\":1,\"published\":1617742097,\"modified\":1617742097,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}],\"related_articles\":[],\"useful_resources\":[]},\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(574,'article',2,3,0,1,'{\"cid\":2,\"version\":2,\"published\":1617742097,\"modified\":1617800339,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}],\"related_articles\":[],\"useful_resources\":[]},\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(577,'article',2,4,0,1,'{\"cid\":2,\"version\":3,\"published\":1617742097,\"modified\":1617805540,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}],\"related_articles\":[],\"useful_resources\":[]},\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(578,'article',2,5,0,1,'{\"cid\":2,\"version\":4,\"published\":1617742097,\"modified\":1617805678,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[],\"related_articles\":[],\"useful_resources\":[]},\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(579,'article',2,6,0,1,'{\"cid\":2,\"version\":5,\"published\":1617742097,\"modified\":1617805742,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}],\"related_articles\":[],\"useful_resources\":[]},\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(580,'article',2,7,0,1,'{\"cid\":2,\"version\":6,\"published\":1617742097,\"modified\":1617806790,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"},{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":1,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}],\"related_articles\":[],\"useful_resources\":[]},\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(581,'article',2,8,0,1,'{\"cid\":2,\"version\":7,\"published\":1617742097,\"modified\":1617806943,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}],\"related_articles\":[],\"useful_resources\":[]},\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(582,'article',2,9,0,1,'{\"cid\":2,\"version\":8,\"published\":1617742097,\"modified\":1617806981,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"},{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":2,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}],\"related_articles\":[],\"useful_resources\":[]},\"body\":\"\",\"coverimage\":\"\",\"summary\":\"\",\"title\":\"Test\",\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(583,'article',2,10,0,1,'{\"cid\":2,\"version\":9,\"published\":1617742097,\"modified\":1617807007,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"relations\":{\"editors\":[{\"id\":5,\"to_content_id\":2,\"to_type\":\"article\",\"from_content_id\":2,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"},{\"id\":3,\"to_content_id\":2,\"to_type\":\"article\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":0,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}]},\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":2,\"from_type\":\"user\",\"from_location\":0,\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"},{\"id\":0,\"to_content_id\":0,\"to_type\":\"\",\"from_content_id\":3,\"from_type\":\"user\",\"from_location\":0,\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\",\"uid\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(584,'article',2,11,0,1,'{\"cid\":2,\"version\":10,\"published\":1617742097,\"modified\":1617865890,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(585,'article',2,12,0,1,'{\"cid\":2,\"version\":11,\"published\":1617742097,\"modified\":1617869185,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(586,'article',2,13,0,1,'{\"cid\":2,\"version\":12,\"published\":1617742097,\"modified\":1617869924,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(587,'article',2,14,0,1,'{\"cid\":2,\"version\":13,\"published\":1617742097,\"modified\":1617869938,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(588,'article',2,15,0,1,'{\"cid\":2,\"version\":14,\"published\":1617742097,\"modified\":1617870026,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(589,'article',2,16,0,1,'{\"cid\":2,\"version\":15,\"published\":1617742097,\"modified\":1617870075,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(590,'article',2,17,0,1,'{\"cid\":2,\"version\":16,\"published\":1617742097,\"modified\":1617870083,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(591,'article',2,18,0,1,'{\"cid\":2,\"version\":17,\"published\":1617742097,\"modified\":1617870407,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(592,'article',2,19,0,1,'{\"cid\":2,\"version\":18,\"published\":1617742097,\"modified\":1617870459,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(593,'article',2,20,0,1,'{\"cid\":2,\"version\":19,\"published\":1617742097,\"modified\":1617870541,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(594,'article',2,21,0,1,'{\"cid\":2,\"version\":20,\"published\":1617742097,\"modified\":1617870879,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(595,'article',2,22,0,1,'{\"cid\":2,\"version\":21,\"published\":1617742097,\"modified\":1617872545,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(596,'article',2,23,0,1,'{\"cid\":2,\"version\":22,\"published\":1617742097,\"modified\":1617872602,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(597,'article',2,24,0,1,'{\"cid\":2,\"version\":23,\"published\":1617742097,\"modified\":1617872725,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(598,'article',2,25,0,1,'{\"cid\":2,\"version\":24,\"published\":1617742097,\"modified\":1617872823,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(599,'article',2,26,0,1,'{\"cid\":2,\"version\":25,\"published\":1617742097,\"modified\":1617872835,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(600,'article',2,27,0,1,'{\"cid\":2,\"version\":26,\"published\":1617742097,\"modified\":1617872896,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(601,'article',2,28,0,1,'{\"cid\":2,\"version\":27,\"published\":1617742097,\"modified\":1617872955,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(602,'article',2,29,0,1,'{\"cid\":2,\"version\":28,\"published\":1617742097,\"modified\":1617872971,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(603,'article',2,30,0,1,'{\"cid\":2,\"version\":29,\"published\":1617742097,\"modified\":1617873043,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(604,'article',2,31,0,1,'{\"cid\":2,\"version\":30,\"published\":1617742097,\"modified\":1617873136,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(605,'article',2,32,0,1,'{\"cid\":2,\"version\":31,\"published\":1617742097,\"modified\":1617873145,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(606,'article',2,33,0,1,'{\"cid\":2,\"version\":32,\"published\":1617742097,\"modified\":1617873159,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(607,'article',2,34,0,1,'{\"cid\":2,\"version\":33,\"published\":1617742097,\"modified\":1617873171,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(608,'article',2,35,0,1,'{\"cid\":2,\"version\":34,\"published\":1617742097,\"modified\":1617873228,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(609,'article',2,36,0,1,'{\"cid\":2,\"version\":35,\"published\":1617742097,\"modified\":1617873458,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(610,'article',2,37,0,1,'{\"cid\":2,\"version\":36,\"published\":1617742097,\"modified\":1617873467,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":2,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(611,'article',2,38,0,1,'{\"cid\":2,\"version\":37,\"published\":1617742097,\"modified\":1617873476,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(612,'article',2,39,0,1,'{\"cid\":2,\"version\":38,\"published\":1617742097,\"modified\":1617873488,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(613,'article',2,40,0,1,'{\"cid\":2,\"version\":39,\"published\":1617742097,\"modified\":1617873500,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(614,'article',2,41,0,1,'{\"cid\":2,\"version\":40,\"published\":1617742097,\"modified\":1617873510,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(615,'article',2,42,0,1,'{\"cid\":2,\"version\":41,\"published\":1617742097,\"modified\":1617873758,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(616,'article',2,43,0,1,'{\"cid\":2,\"version\":42,\"published\":1617742097,\"modified\":1617873763,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(617,'article',2,44,0,1,'{\"cid\":2,\"version\":43,\"published\":1617742097,\"modified\":1617873874,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(618,'article',2,45,0,1,'{\"cid\":2,\"version\":44,\"published\":1617742097,\"modified\":1617873879,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(619,'article',2,46,0,1,'{\"cid\":2,\"version\":45,\"published\":1617742097,\"modified\":1617891106,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(620,'article',2,47,0,1,'{\"cid\":2,\"version\":46,\"published\":1617742097,\"modified\":1617894834,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(621,'article',2,48,0,1,'{\"cid\":2,\"version\":47,\"published\":1617742097,\"modified\":1617894866,\"cuid\":\"c1mci4evvhfo3q8vofcg\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\\u003cp\\u003e\\u003cimg src=\\\"../var/images/o/oik/upload-135615037-dsc_2857.jpg\\\" width=\\\"269\\\" height=\\\"179\\\" data-dm-content=\\\"image;9;c15ktduvvhfoinu52gg0\\\" /\\u003e\\u003c/p\\u003e\",\"coverimage\":\"\",\"editors\":[{\"from_content_id\":1,\"from_type\":\"user\",\"priority\":2,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"},{\"from_content_id\":3,\"from_type\":\"user\",\"priority\":1,\"identifier\":\"editors\",\"description\":\"\",\"data\":\"\"}],\"related_articles\":[],\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":[],\"id\":464,\"parent_id\":454,\"main_id\":464,\"identifier_path\":\"content/demosite/news/test\",\"hierarchy\":\"1/3/454/464\",\"depth\":4,\"content_type\":\"article\",\"content_id\":2,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c1mci4evvhfo3q8vofd0\",\"section\":\"public\",\"p\":\"\"}',0,0),(622,'article',3,1,0,1,'{\"cid\":3,\"version\":1,\"published\":1628163956,\"modified\":1628163956,\"cuid\":\"c45sut594814ldkkc0t0\",\"status\":0,\"author\":1,\"author_name\":\"\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[],\"related_articles\":[],\"summary\":\"\",\"title\":\"fff\",\"useful_resources\":[],\"id\":467,\"parent_id\":454,\"main_id\":467,\"identifier_path\":\"content/demosite/news/fff\",\"hierarchy\":\"1/3/454/467\",\"depth\":4,\"content_type\":\"article\",\"content_id\":3,\"language\":\"\",\"name\":\"fff\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c45sut594814ldkkc0tg\",\"section\":\"public\",\"p\":\"\"}',0,0),(623,'article',3,2,0,1,'{\"cid\":3,\"version\":1,\"published\":1628163956,\"modified\":1628163956,\"cuid\":\"c45sut594814ldkkc0t0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[],\"related_articles\":[],\"summary\":\"\",\"title\":\"fff\",\"useful_resources\":[],\"id\":467,\"parent_id\":454,\"main_id\":467,\"identifier_path\":\"content/demosite/news/fff\",\"hierarchy\":\"1/3/454/467\",\"depth\":4,\"content_type\":\"article\",\"content_id\":3,\"language\":\"\",\"name\":\"fff\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c45sut594814ldkkc0tg\",\"section\":\"public\",\"p\":\"\"}',0,0),(624,'article',3,3,0,1,'{\"cid\":3,\"version\":2,\"published\":1628163956,\"modified\":1628178054,\"cuid\":\"c45sut594814ldkkc0t0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[],\"related_articles\":[],\"summary\":\"\",\"title\":\"fff1\",\"useful_resources\":[],\"id\":467,\"parent_id\":454,\"main_id\":467,\"identifier_path\":\"content/demosite/news/fff\",\"hierarchy\":\"1/3/454/467\",\"depth\":4,\"content_type\":\"article\",\"content_id\":3,\"language\":\"\",\"name\":\"fff\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c45sut594814ldkkc0tg\",\"section\":\"public\",\"p\":\"\"}',0,0),(625,'article',3,4,0,1,'{\"cid\":3,\"version\":3,\"published\":1628163956,\"modified\":1628189660,\"cuid\":\"c45sut594814ldkkc0t0\",\"status\":0,\"author\":1,\"author_name\":\"Administrator Admin\",\"body\":\"\",\"coverimage\":\"\",\"editors\":[],\"related_articles\":[],\"summary\":\"\",\"title\":\"fff1\",\"useful_resources\":[],\"id\":467,\"parent_id\":454,\"main_id\":467,\"identifier_path\":\"content/demosite/news/fff\",\"hierarchy\":\"1/3/454/467\",\"depth\":4,\"content_type\":\"article\",\"content_id\":3,\"language\":\"\",\"name\":\"fff1\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c45sut594814ldkkc0tg\",\"section\":\"public\",\"p\":\"\"}',0,0),(626,'article',4,1,0,1,'{\"cid\":4,\"version\":1,\"published\":1631283443,\"modified\":1631283443,\"cuid\":\"c4tmhst94811behlf6f0\",\"status\":0,\"author\":1,\"author_name\":\"\",\"body\":\"ff\",\"coverimage\":\"\",\"editors\":null,\"related_articles\":null,\"summary\":\"\",\"title\":\"Test\",\"useful_resources\":null,\"id\":468,\"parent_id\":1,\"main_id\":468,\"identifier_path\":\"content/test\",\"hierarchy\":\"1/468\",\"depth\":2,\"content_type\":\"article\",\"content_id\":4,\"language\":\"\",\"name\":\"Test\",\"is_hidden\":false,\"is_invisible\":false,\"priority\":0,\"uid\":\"c4tmhst94811behlf6fg\",\"section\":\"public\",\"p\":\"\"}',0,0);
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

-- Dump completed on 2021-12-28 14:44:39
