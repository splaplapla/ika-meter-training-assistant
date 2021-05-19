-- MySQL dump 10.13  Distrib 5.7.34, for osx10.16 (x86_64)
--
-- Host: localhost    Database: training_assistant_development
-- ------------------------------------------------------
-- Server version	5.7.34

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
-- Table structure for table `active_storage_attachments`
--

DROP TABLE IF EXISTS `active_storage_attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_attachments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `record_type` varchar(255) NOT NULL,
  `record_id` bigint(20) NOT NULL,
  `blob_id` bigint(20) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_attachments_uniqueness` (`record_type`,`record_id`,`name`,`blob_id`),
  KEY `index_active_storage_attachments_on_blob_id` (`blob_id`),
  CONSTRAINT `fk_rails_c3b3935057` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_attachments`
--

LOCK TABLES `active_storage_attachments` WRITE;
/*!40000 ALTER TABLE `active_storage_attachments` DISABLE KEYS */;
INSERT INTO `active_storage_attachments` VALUES (1,'image','Dataset',1,1,'2021-05-17 13:52:19'),(6,'image','Dataset',14,6,'2021-05-19 13:57:06'),(9,'image','Dataset',17,9,'2021-05-19 14:00:29'),(10,'image','Dataset',18,10,'2021-05-19 14:00:29'),(11,'image','Dataset',19,11,'2021-05-19 14:00:30'),(12,'image','Dataset',20,12,'2021-05-19 14:00:30'),(13,'image','Dataset',21,13,'2021-05-19 14:00:30'),(14,'image','Dataset',22,14,'2021-05-19 14:00:30'),(15,'image','Dataset',23,15,'2021-05-19 14:00:30'),(16,'image','Dataset',24,16,'2021-05-19 14:00:30'),(17,'image','Dataset',25,17,'2021-05-19 14:00:30'),(18,'image','Dataset',26,18,'2021-05-19 14:00:30'),(19,'image','Dataset',27,19,'2021-05-19 14:00:30'),(20,'image','Dataset',28,20,'2021-05-19 14:00:30'),(21,'image','Dataset',29,21,'2021-05-19 14:00:30'),(22,'image','Dataset',30,22,'2021-05-19 14:00:30'),(23,'image','Dataset',31,23,'2021-05-19 14:00:30'),(24,'image','Dataset',32,24,'2021-05-19 14:00:30'),(25,'image','Dataset',33,25,'2021-05-19 14:00:30'),(26,'image','Dataset',34,26,'2021-05-19 14:00:30'),(27,'image','Dataset',35,27,'2021-05-19 14:00:30'),(28,'image','Dataset',36,28,'2021-05-19 14:00:30'),(29,'image','Dataset',37,29,'2021-05-19 14:00:30'),(30,'image','Dataset',38,30,'2021-05-19 14:00:30'),(31,'image','Dataset',39,31,'2021-05-19 14:00:30'),(32,'image','Dataset',40,32,'2021-05-19 14:00:30'),(33,'image','Dataset',41,33,'2021-05-19 14:00:30'),(34,'image','Dataset',42,34,'2021-05-19 14:00:30'),(35,'image','Dataset',43,35,'2021-05-19 14:00:30'),(36,'image','Dataset',44,36,'2021-05-19 14:00:30'),(37,'image','Dataset',45,37,'2021-05-19 14:00:30'),(38,'image','Dataset',46,38,'2021-05-19 14:00:30'),(39,'image','Dataset',47,39,'2021-05-19 14:00:30'),(40,'image','Dataset',48,40,'2021-05-19 14:00:30'),(41,'image','Dataset',49,41,'2021-05-19 14:00:30'),(42,'image','Dataset',50,42,'2021-05-19 14:00:30'),(43,'image','Dataset',51,43,'2021-05-19 14:00:30'),(44,'image','Dataset',52,44,'2021-05-19 14:00:30'),(45,'image','Dataset',53,45,'2021-05-19 14:00:30'),(46,'image','Dataset',54,46,'2021-05-19 14:00:30'),(47,'image','Dataset',55,47,'2021-05-19 14:00:30'),(48,'image','Dataset',56,48,'2021-05-19 14:00:30'),(49,'image','Dataset',57,49,'2021-05-19 14:00:30'),(50,'image','Dataset',58,50,'2021-05-19 14:00:30'),(51,'image','Dataset',59,51,'2021-05-19 14:00:30'),(52,'image','Dataset',60,52,'2021-05-19 14:00:30'),(53,'image','Dataset',61,53,'2021-05-19 14:00:30'),(54,'image','Dataset',62,54,'2021-05-19 14:00:30'),(55,'image','Dataset',63,55,'2021-05-19 14:00:30'),(56,'image','Dataset',64,56,'2021-05-19 14:00:30'),(57,'image','Dataset',65,57,'2021-05-19 14:00:30'),(58,'image','Dataset',66,58,'2021-05-19 14:00:30'),(59,'image','Dataset',67,59,'2021-05-19 14:00:31'),(60,'image','Dataset',68,60,'2021-05-19 14:00:31'),(61,'image','Dataset',69,61,'2021-05-19 14:00:31'),(62,'image','Dataset',70,62,'2021-05-19 14:00:31'),(63,'image','Dataset',71,63,'2021-05-19 14:01:05');
/*!40000 ALTER TABLE `active_storage_attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_blobs`
--

DROP TABLE IF EXISTS `active_storage_blobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_blobs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `content_type` varchar(255) DEFAULT NULL,
  `metadata` text,
  `service_name` varchar(255) NOT NULL,
  `byte_size` bigint(20) NOT NULL,
  `checksum` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_blobs_on_key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_blobs`
--

LOCK TABLES `active_storage_blobs` WRITE;
/*!40000 ALTER TABLE `active_storage_blobs` DISABLE KEYS */;
INSERT INTO `active_storage_blobs` VALUES (1,'wvd0u82w0wcq5dw63gnft9gij0sw','oxxo4.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',289692,'VBtiQ9Iyx0f9sMCbC1STWg==','2021-05-17 13:52:19'),(6,'m6hc0hekbxfp3tftpattyi9mz2g5','1621432626206169.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',274361,'QtmE3Tmjt1jPHGpAlG35qg==','2021-05-19 13:57:06'),(9,'af6h52w4hatl3d53suh71udavnr8','1621432829899596.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',326169,'h+mKzHxcrEDAvr4uggqnXw==','2021-05-19 14:00:29'),(10,'kyf5iqbnjs1cwlzttc43bintvo6x','1621432829937392.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',242101,'RJOt5ja0Q7s16hVYYL3Z3Q==','2021-05-19 14:00:29'),(11,'k26l3gmgoneu3qbuaap0ce2385yl','1621432829996860.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',260724,'+Cdn0gRjJzJLG7uP5/+uYg==','2021-05-19 14:00:30'),(12,'7y29nabwjtq7wlq0abgr07cxrrz9','162143283023361.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',271421,'+rjfej7iipNcylYN/NPcDQ==','2021-05-19 14:00:30'),(13,'vo8evysqmjum7drljm33fjh941iz','162143283051819.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',278427,'nt9XW+P6NjPUXM3R71QS7w==','2021-05-19 14:00:30'),(14,'gwi71ng18i8dhkt3l3kd9htat8uj','162143283067802.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',268858,'/jaGxj8utDgAieuTUj29fw==','2021-05-19 14:00:30'),(15,'cgpfw2uxg1zdcv8xq0q2x2cklzbc','162143283087274.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',301244,'qWnjt/kDDtPqzrqDX8tmPA==','2021-05-19 14:00:30'),(16,'x6mgk659ll5hux7rfa1bsy33b33d','1621432830111956.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',316325,'/tXj6+aNdNiJC2b8L/JEig==','2021-05-19 14:00:30'),(17,'99n02tq2w2s9d9tsdsoobwc3d7f7','1621432830125713.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',315372,'ArqaqJgWg1q0fK75vNXPdQ==','2021-05-19 14:00:30'),(18,'a36rfcka1r15vuy0knpwhu85hkpn','1621432830160955.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',291848,'Qdv0Om8r4WLkGb2ddO+OMA==','2021-05-19 14:00:30'),(19,'r00kyhqgfztz5s8e6aj6v5toi34y','1621432830177721.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',297375,'yYb9pOW6exlHtswmpUvnUw==','2021-05-19 14:00:30'),(20,'mlldm8bxrb2718bo4zgqs3r2xpfn','1621432830191341.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',368104,'FAUmUa8fOW/XIAkGKX4LMA==','2021-05-19 14:00:30'),(21,'xks3r08fwrzy9w0y51dmqyhlvway','1621432830224880.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',278416,'MEeiO05F498qNU4UuqBbzQ==','2021-05-19 14:00:30'),(22,'oycslqs66gcroyf69gp6khip0imj','1621432830234075.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',391888,'se2M+zPcW4UtExjEF0Hqbw==','2021-05-19 14:00:30'),(23,'h09tlb57gh7qt2g1s4upildojsrt','1621432830247004.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',350947,'+dWMFQB49mq+GOuDytSZQg==','2021-05-19 14:00:30'),(24,'j0ivzw1p4ng070c79m10t2ci93fo','1621432830258461.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',359651,'dlwbHTGtBTlSFrBptz3lkg==','2021-05-19 14:00:30'),(25,'zrqda05esyjkgnnyrsjgdtob8tzx','1621432830273687.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',272046,'H6WzEjjsUy88Rj9XagyKiA==','2021-05-19 14:00:30'),(26,'jaf9l4y0j1yzqyekvwb6s0i3knmh','1621432830281899.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',299282,'BQj1d76WGycMzyaqZDu/vw==','2021-05-19 14:00:30'),(27,'pn5f4nbiqczlxo7zsol4885jthb2','1621432830295308.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',339923,'+4sT1S/nIIztsPTeudOhPg==','2021-05-19 14:00:30'),(28,'bl750grcol85vftih614ro75bvgu','1621432830308827.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',351397,'8bs2S5NZiZrE9WIIsAKpMg==','2021-05-19 14:00:30'),(29,'8ow11ru8q9ihai34ip7fwpbnzgxz','1621432830325807.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',328846,'m+0LpVc/kjc16vobnsrGpA==','2021-05-19 14:00:30'),(30,'hoaw82830jtrbnmqgovhfhzka9sq','1621432830335247.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',340527,'Bh9AiU7aqqj+DAA9R51O5Q==','2021-05-19 14:00:30'),(31,'lgwa3g8p3kympsus6kqxdnpqy5t4','1621432830346473.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',323708,'eEzW61PgEJsdGV6qinlgrQ==','2021-05-19 14:00:30'),(32,'yk5ilm7huq6c9bw68capx0a26sy9','1621432830359464.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',322879,'nvJad34pq/KnbkyXiktmVA==','2021-05-19 14:00:30'),(33,'tosa1puaymrcn4ewuqx0vzie9vs5','1621432830374181.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',315809,'Vyx6zZktSp/umidZyAwlvg==','2021-05-19 14:00:30'),(34,'2oc1a5ntm6kue9kwzmt2fzr7rxq2','1621432830387979.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',403923,'P5L34hF6sNK0Md6xDQZpgg==','2021-05-19 14:00:30'),(35,'rcf2oabr5pw32jzynflf4znmthp1','1621432830400750.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',272937,'Qv5Kjdl5wSDDl+zNz8lAeQ==','2021-05-19 14:00:30'),(36,'g3j7gv6i6y2hh6dqk36114umk2y0','1621432830417490.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',314100,'x/NXarxEevPEmBZOougLkg==','2021-05-19 14:00:30'),(37,'sxqpj1bnii6mtgshrp6qw2yqsoi3','1621432830432123.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',305407,'lFbBKJKhXYWVbgH/xxJIFw==','2021-05-19 14:00:30'),(38,'nspyph7ba6s50pyxwsix753fteps','1621432830455830.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',301241,'juriR/lmVELWgGR/1DZE1w==','2021-05-19 14:00:30'),(39,'vcx544qo2mie3df4vtu9b7mpaqhk','1621432830483637.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',405142,'9XXZ6YeqHbGRjTMVOiDJQw==','2021-05-19 14:00:30'),(40,'sgxhb1lsouy4mm20wotn2aysfxxp','1621432830623392.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',422371,'aqgeCm5tQrgWj+FfXcKC7A==','2021-05-19 14:00:30'),(41,'i7oo439xm0hegp81furms5eznp2e','1621432830643218.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',387974,'lDGqcm560tYqepQ0vv6IKw==','2021-05-19 14:00:30'),(42,'gsw04d0vg91pgl5347okd9el1rmx','1621432830669067.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',373882,'IKX6Bvk9K/VN0eR2NdhLfA==','2021-05-19 14:00:30'),(43,'ekcftbegwr4ulluflz82m4j9cmje','1621432830682810.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',415645,'WKbOYk8GkKJ6Mq8aZd2Uiw==','2021-05-19 14:00:30'),(44,'vz0zrfwzbwkup4kxfv5c1fsotfgh','1621432830696255.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',319818,'krxHOUnBAhxI0XN6rJI/JQ==','2021-05-19 14:00:30'),(45,'3u5fc19f7eg5oggald8y3hawzr8n','1621432830715625.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',378568,'8+pziB5XFU1ek7B9VOcyZA==','2021-05-19 14:00:30'),(46,'k0ctmb8vq89lrpzr9h6iwu36fqj4','1621432830729718.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',247389,'6UJm3/UTpTQjA6oPBwHIgA==','2021-05-19 14:00:30'),(47,'hxgr9t2xlnourrljcxbvab25cmcp','1621432830740640.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',339599,'z6p5HaLTQGeXWemw5R7j9g==','2021-05-19 14:00:30'),(48,'srtil79l7jix90n0tnmcc1gj01ko','1621432830753756.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',330013,'4r+8X8LIAdH19ceqTGWICA==','2021-05-19 14:00:30'),(49,'riuiwue01sxdf611aw3q85tr69xo','1621432830772653.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',338278,'IrAVkSx0FgXbEHKKepKjkA==','2021-05-19 14:00:30'),(50,'ajf7cwgu1ul7esm0jd812mr9at6n','1621432830785483.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',343807,'v3gZGOfSQZ9vVBN3uD+mLA==','2021-05-19 14:00:30'),(51,'9z0dgoli4nt72vvrc67vaj5n8sm2','1621432830799861.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',338802,'b7QwVuZ47TDPStqRSnenng==','2021-05-19 14:00:30'),(52,'3vii56bsi39voeiw8ymtk1irgn02','1621432830835995.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',355660,'Z2sg31Ie213djVPF6AtvZg==','2021-05-19 14:00:30'),(53,'8wfwya5veqmmkzl72cmcs07srbbx','1621432830890988.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',338622,'5GNx10qjsZIZcCK+5k1g0g==','2021-05-19 14:00:30'),(54,'cfvjq98e3z5lheml7vveavb3qeia','1621432830900682.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',372601,'rO40hvGSCnjfr79+mi8tiQ==','2021-05-19 14:00:30'),(55,'2x06mort0wh7gnmswntxhgc48jpb','1621432830913267.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',416791,'xHrZ/dEaq9qbxc08CbNutQ==','2021-05-19 14:00:30'),(56,'e6zixn5ri591jrsxq22a8xoc7czt','1621432830927367.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',420575,'7zrLcqVq4003RARKkjsS3Q==','2021-05-19 14:00:30'),(57,'relhno06fufn9vnksxjy6xzn5r88','1621432830945444.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',377937,'uENt88lMTTJnzovBQr+fvg==','2021-05-19 14:00:30'),(58,'hghu4zqkvmbmgttgdo8o06e5uip6','1621432830965432.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',477126,'FWZY1WdYY4mOldjsDnEhWw==','2021-05-19 14:00:30'),(59,'ixciab28gir560ybd5xagtjefceg','162143283133512.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',396362,'yxStINzDctpsKlgjYanzBg==','2021-05-19 14:00:31'),(60,'e8vn94zvf7gksg5kvey3bumgufud','162143283183166.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',396159,'cs0o5YGPDvxGE6tIHMx4Kw==','2021-05-19 14:00:31'),(61,'kfq60yu8ibv5oebvyvzbkmzc1t5z','1621432831117390.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',404382,'TESoVwVd1K9wIFEtsxE11Q==','2021-05-19 14:00:31'),(62,'l8e55jvetrct0lkay3osmkre6szv','1621432831128748.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',467599,'VC4BdqPnxauCvVZhNQilow==','2021-05-19 14:00:31'),(63,'ccswp8oub8jfwbr32sca3t1y5zj2','1621432865373376.jpg','image/jpeg','{\"identified\":true,\"analyzed\":true}','local',274361,'QtmE3Tmjt1jPHGpAlG35qg==','2021-05-19 14:01:05');
/*!40000 ALTER TABLE `active_storage_blobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `active_storage_variant_records`
--

DROP TABLE IF EXISTS `active_storage_variant_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `active_storage_variant_records` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blob_id` bigint(20) NOT NULL,
  `variation_digest` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_active_storage_variant_records_uniqueness` (`blob_id`,`variation_digest`),
  CONSTRAINT `fk_rails_993965df05` FOREIGN KEY (`blob_id`) REFERENCES `active_storage_blobs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `active_storage_variant_records`
--

LOCK TABLES `active_storage_variant_records` WRITE;
/*!40000 ALTER TABLE `active_storage_variant_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `active_storage_variant_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2021-05-17 13:40:57.519675','2021-05-17 13:40:57.519675');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dataset_positions`
--

DROP TABLE IF EXISTS `dataset_positions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dataset_positions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dataset_id` bigint(20) NOT NULL,
  `x` int(11) NOT NULL,
  `y` int(11) NOT NULL,
  `width` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_dataset_positions_on_dataset_id` (`dataset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dataset_positions`
--

LOCK TABLES `dataset_positions` WRITE;
/*!40000 ALTER TABLE `dataset_positions` DISABLE KEYS */;
INSERT INTO `dataset_positions` VALUES (13,1,494,14,93,101,'2021-05-18 13:40:45.046163','2021-05-18 13:40:45.046163'),(14,1,790,18,96,95,'2021-05-18 13:40:45.057232','2021-05-18 13:40:45.057232'),(15,1,598,18,82,97,'2021-05-18 13:40:45.059531','2021-05-18 13:40:45.059531'),(16,1,1045,23,78,84,'2021-05-18 13:40:45.064552','2021-05-18 13:40:45.064552'),(17,1,1275,27,73,85,'2021-05-18 13:40:45.066512','2021-05-18 13:40:45.066512'),(18,1,689,20,92,99,'2021-05-18 13:40:45.069317','2021-05-18 13:40:45.069317'),(19,14,504,17,83,104,'2021-05-19 14:01:54.776977','2021-05-19 14:01:54.776977'),(20,14,593,17,92,102,'2021-05-19 14:01:54.804799','2021-05-19 14:01:54.804799'),(21,14,692,17,88,103,'2021-05-19 14:01:54.805600','2021-05-19 14:01:54.805600'),(22,14,786,17,92,102,'2021-05-19 14:01:54.807178','2021-05-19 14:01:54.807178'),(23,14,1276,33,73,70,'2021-05-19 14:01:54.807864','2021-05-19 14:01:54.807864'),(24,14,1204,30,62,80,'2021-05-19 14:01:54.808657','2021-05-19 14:01:54.808657'),(25,14,1124,32,74,80,'2021-05-19 14:01:54.809353','2021-05-19 14:01:54.809353'),(26,14,1051,31,65,77,'2021-05-19 14:01:54.810297','2021-05-19 14:01:54.810297'),(48,17,489,11,101,102,'2021-05-19 14:24:13.345038','2021-05-19 14:24:13.345038'),(49,17,689,16,94,104,'2021-05-19 14:24:13.357225','2021-05-19 14:24:13.357225'),(50,17,795,14,83,106,'2021-05-19 14:24:13.359461','2021-05-19 14:24:13.359461'),(51,17,1045,31,79,79,'2021-05-19 14:24:13.361802','2021-05-19 14:24:13.361802'),(52,17,1129,30,68,76,'2021-05-19 14:24:13.363733','2021-05-19 14:24:13.363733'),(53,17,1204,30,67,79,'2021-05-19 14:24:13.366474','2021-05-19 14:24:13.366474');
/*!40000 ALTER TABLE `dataset_positions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `datasets`
--

DROP TABLE IF EXISTS `datasets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `datasets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `digest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datasets_on_digest` (`digest`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datasets`
--

LOCK TABLES `datasets` WRITE;
/*!40000 ALTER TABLE `datasets` DISABLE KEYS */;
INSERT INTO `datasets` VALUES (1,'2021-05-17 13:52:19.255166','2021-05-19 03:21:20.138741','541b6243d232c747fdb0c09b0b54935a'),(14,'2021-05-19 13:57:06.212207','2021-05-19 13:57:06.227388','d41d8cd98f00b204e9800998ecf8427e'),(17,'2021-05-19 14:00:29.900693','2021-05-19 14:00:29.910503','87e98acc7c5cac40c0bebe2e820aa75f'),(18,'2021-05-19 14:00:29.938281','2021-05-19 14:00:29.974277','4493ade636b443bb35ea155860bdd9dd'),(19,'2021-05-19 14:00:29.998097','2021-05-19 14:00:30.015533','f82767d2046327324b1bbb8fe7ffae62'),(20,'2021-05-19 14:00:30.024468','2021-05-19 14:00:30.044715','fab8df7a3ee28a935cca560dfcd3dc0d'),(21,'2021-05-19 14:00:30.052746','2021-05-19 14:00:30.061806','9edf575be3fa3633d45ccdd1ef5412ef'),(22,'2021-05-19 14:00:30.068868','2021-05-19 14:00:30.078491','fe3686c63f2eb4380089eb93523dbd7f'),(23,'2021-05-19 14:00:30.089395','2021-05-19 14:00:30.101500','a969e3b7f9030ed3eaceba835fcb663c'),(24,'2021-05-19 14:00:30.113072','2021-05-19 14:00:30.120891','fed5e3ebe68d74d8890b66fc2ff2448a'),(25,'2021-05-19 14:00:30.126681','2021-05-19 14:00:30.151402','02ba9aa89816835ab47caef9bcd5cf75'),(26,'2021-05-19 14:00:30.162091','2021-05-19 14:00:30.167260','41dbf43a6f2be162e419bd9d74ef8e30'),(27,'2021-05-19 14:00:30.179086','2021-05-19 14:00:30.185349','c986fda4e5ba7b1947b6cc26a54be753'),(28,'2021-05-19 14:00:30.193313','2021-05-19 14:00:30.212928','14052651af1f396fd7200906297e0b30'),(29,'2021-05-19 14:00:30.225882','2021-05-19 14:00:30.229796','3047a23b4e45e3df2a354e14baa05bcd'),(30,'2021-05-19 14:00:30.235168','2021-05-19 14:00:30.241890','b1ed8cfb33dc5b852d1318c41741ea6f'),(31,'2021-05-19 14:00:30.249169','2021-05-19 14:00:30.254033','f9d58c150078f66abe18eb83cad49942'),(32,'2021-05-19 14:00:30.259578','2021-05-19 14:00:30.269519','765c1b1d31ad05395216b069b73de592'),(33,'2021-05-19 14:00:30.274612','2021-05-19 14:00:30.278049','1fa5b31238ec532f3c463f576a0c8a88'),(34,'2021-05-19 14:00:30.282825','2021-05-19 14:00:30.289654','0508f577be961b270ccf26aa643bbfbf'),(35,'2021-05-19 14:00:30.296910','2021-05-19 14:00:30.304445','fb8b13d52fe7208cedb0f4deb9d3a13e'),(36,'2021-05-19 14:00:30.309876','2021-05-19 14:00:30.321495','f1bb364b9359899ac4f56208b002a932'),(37,'2021-05-19 14:00:30.326800','2021-05-19 14:00:30.330703','9bed0ba5573f923735eafa1b9ecac6a4'),(38,'2021-05-19 14:00:30.337734','2021-05-19 14:00:30.342045','061f40894edaaaa8fe0c003d479d4ee5'),(39,'2021-05-19 14:00:30.347630','2021-05-19 14:00:30.353617','784cd6eb53e0109b1d195eaa8a7960ad'),(40,'2021-05-19 14:00:30.360972','2021-05-19 14:00:30.369832','9ef25a777e29abf2a76e4c978a4b6654'),(41,'2021-05-19 14:00:30.375256','2021-05-19 14:00:30.382906','572c7acd992d4a9fee9a2759c80c25be'),(42,'2021-05-19 14:00:30.389360','2021-05-19 14:00:30.395504','3f92f7e2117ab0d2b431deb10d066982'),(43,'2021-05-19 14:00:30.401780','2021-05-19 14:00:30.408591','42fe4a8dd979c120c397eccdcfc94079'),(44,'2021-05-19 14:00:30.418524','2021-05-19 14:00:30.425500','c7f3576abc447af3c498164ea2e80b92'),(45,'2021-05-19 14:00:30.433323','2021-05-19 14:00:30.447122','9456c12892a15d85956e01ffc7124817'),(46,'2021-05-19 14:00:30.458413','2021-05-19 14:00:30.473976','8eeae247f9665442d680647fd43644d7'),(47,'2021-05-19 14:00:30.485270','2021-05-19 14:00:30.520564','f575d9e987aa1db1918d33153a20c943'),(48,'2021-05-19 14:00:30.624936','2021-05-19 14:00:30.637480','6aa81e0a6e6d42b8168fe15f5dc282ec'),(49,'2021-05-19 14:00:30.644794','2021-05-19 14:00:30.649424','9431aa726e7ad2d62a7a9434befe882b'),(50,'2021-05-19 14:00:30.670610','2021-05-19 14:00:30.674980','20a5fa06f93d2bf54dd1e47635d84b7c'),(51,'2021-05-19 14:00:30.684120','2021-05-19 14:00:30.690623','58a6ce624f0690a27a32af1a65dd948b'),(52,'2021-05-19 14:00:30.697704','2021-05-19 14:00:30.704896','92bc473949c1021c48d1737aac923f25'),(53,'2021-05-19 14:00:30.717559','2021-05-19 14:00:30.724739','f3ea73881e57154d5e93b07d54e73264'),(54,'2021-05-19 14:00:30.730591','2021-05-19 14:00:30.735300','e94266dff513a5342303aa0f0701c880'),(55,'2021-05-19 14:00:30.741689','2021-05-19 14:00:30.749456','cfaa791da2d340679759e9b0e51ee3f6'),(56,'2021-05-19 14:00:30.754894','2021-05-19 14:00:30.763262','e2bfbc5fc2c801d1f5f5c7aa4c658808'),(57,'2021-05-19 14:00:30.773869','2021-05-19 14:00:30.779029','22b015912c741605db10728a7a92a390'),(58,'2021-05-19 14:00:30.786554','2021-05-19 14:00:30.793345','bf781918e7d2419f6f541377b83fa62c'),(59,'2021-05-19 14:00:30.801397','2021-05-19 14:00:30.814371','6fb43056e678ed30cf4ada914a77a79e'),(60,'2021-05-19 14:00:30.837122','2021-05-19 14:00:30.871532','676b20df521edb5ddd8d53c5e80b6f66'),(61,'2021-05-19 14:00:30.892006','2021-05-19 14:00:30.895847','e46371d74aa3b192197022bee64d60d2'),(62,'2021-05-19 14:00:30.902036','2021-05-19 14:00:30.908905','acee3486f1920a78dfafbf7e9a2f2d89'),(63,'2021-05-19 14:00:30.914545','2021-05-19 14:00:30.920308','c47ad9fdd11aabda9bc5cd3c09b36eb5'),(64,'2021-05-19 14:00:30.929084','2021-05-19 14:00:30.934509','ef3acb72a56ae34d3744044a923b12dd'),(65,'2021-05-19 14:00:30.946590','2021-05-19 14:00:30.957986','b8436df3c94c4d3267ce8bc142bf9fbe'),(66,'2021-05-19 14:00:30.967005','2021-05-19 14:00:30.996677','156658d5675863898e95d8ec0e71215b'),(67,'2021-05-19 14:00:31.034903','2021-05-19 14:00:31.075390','cb14ad20dcc372da6c2a582361a9f306'),(68,'2021-05-19 14:00:31.085183','2021-05-19 14:00:31.107522','72cd28e5818f0efc4613ab481ccc782b'),(69,'2021-05-19 14:00:31.118899','2021-05-19 14:00:31.123144','4c44a857055dd4af7020512db31135d5'),(70,'2021-05-19 14:00:31.130324','2021-05-19 14:00:31.139811','542e0176a3e7c5ab82bd56613508a5a3'),(71,'2021-05-19 14:01:05.374905','2021-05-19 14:01:05.383808','42d984dd39a3b758cf1c6a40946df9aa');
/*!40000 ALTER TABLE `datasets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roi_templates`
--

DROP TABLE IF EXISTS `roi_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roi_templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `x` int(11) DEFAULT NULL,
  `y` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roi_templates`
--

LOCK TABLES `roi_templates` WRITE;
/*!40000 ALTER TABLE `roi_templates` DISABLE KEYS */;
/*!40000 ALTER TABLE `roi_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20210517134222'),('20210517134438'),('20210517144842'),('20210517144939'),('20210519031229');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-19 23:24:29
