-- MySQL dump 10.13  Distrib 5.7.43, for Linux (x86_64)
--
-- Host: localhost    Database: cloud2
-- ------------------------------------------------------
-- Server version	5.7.43-log

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
-- Table structure for table `shd_accounts`
--

DROP TABLE IF EXISTS `shd_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_accounts` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `currency` varchar(3) NOT NULL DEFAULT '' COMMENT '货币',
  `gateway` varchar(80) NOT NULL DEFAULT '' COMMENT '网关',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付生效时间',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `amount_in` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fees` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '费用',
  `amount_out` decimal(10,2) NOT NULL DEFAULT '0.00',
  `rate` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `trans_id` text COMMENT '交易订单id',
  `invoice_id` int(10) NOT NULL DEFAULT '0',
  `refund` int(10) NOT NULL DEFAULT '0' COMMENT '退款至余额',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `aff_refund` int(2) NOT NULL DEFAULT '0' COMMENT '推介计划是否处理了退款',
  `refund_credit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否退至余额:1是',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `invoiceid` (`invoice_id`) USING BTREE,
  KEY `userid` (`uid`) USING BTREE,
  KEY `date` (`create_time`) USING BTREE,
  KEY `transid` (`trans_id`(32)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_accounts`
--

LOCK TABLES `shd_accounts` WRITE;
/*!40000 ALTER TABLE `shd_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_activity_log`
--

DROP TABLE IF EXISTS `shd_activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_activity_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `description` text,
  `user` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人',
  `uid` int(10) NOT NULL DEFAULT '0',
  `ipaddr` text,
  `type` int(2) DEFAULT NULL COMMENT '日志类型1前台登录注册2',
  `activeid` int(11) DEFAULT NULL COMMENT '操作人',
  `usertype` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `port` varchar(32) NOT NULL DEFAULT '' COMMENT '端口号',
  `type_data_id` int(10) DEFAULT '0' COMMENT '操作类型数据对应id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统活动日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_activity_log`
--

LOCK TABLES `shd_activity_log` WRITE;
/*!40000 ALTER TABLE `shd_activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_activity_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_activity_log_home`
--

DROP TABLE IF EXISTS `shd_activity_log_home`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_activity_log_home` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `description` text,
  `user` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人',
  `uid` int(10) NOT NULL DEFAULT '0',
  `ipaddr` text,
  `type` int(2) DEFAULT NULL COMMENT '日志类型1前台登录注册2',
  `activeid` int(11) DEFAULT NULL COMMENT '操作人',
  `usertype` varchar(255) DEFAULT NULL COMMENT '操作类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统活动日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_activity_log_home`
--

LOCK TABLES `shd_activity_log_home` WRITE;
/*!40000 ALTER TABLE `shd_activity_log_home` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_activity_log_home` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_admin_log`
--

DROP TABLE IF EXISTS `shd_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_admin_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_username` text,
  `logintime` int(10) NOT NULL DEFAULT '0',
  `logouttime` int(10) NOT NULL DEFAULT '0',
  `ipaddress` text,
  `sessionid` text,
  `lastvisit` int(10) NOT NULL DEFAULT '0' COMMENT '最后一次操作',
  `port` varchar(32) DEFAULT '' COMMENT '端口号',
  PRIMARY KEY (`id`),
  KEY `logouttime` (`logouttime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='管理员访问日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_admin_log`
--

LOCK TABLES `shd_admin_log` WRITE;
/*!40000 ALTER TABLE `shd_admin_log` DISABLE KEYS */;
INSERT INTO `shd_admin_log` VALUES (1,'admin',1758904515,0,'149.28.171.184','s3tnqssaf57ckum6avbmujkt69',0,'38323'),(2,'admin',1758904547,0,'149.28.171.184','g0aap6d8fuvlohtbc395mbbtne',1758904557,'38323');
/*!40000 ALTER TABLE `shd_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_affiliate_ladder`
--

DROP TABLE IF EXISTS `shd_affiliate_ladder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_affiliate_ladder` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `turnover` decimal(12,2) DEFAULT '0.00' COMMENT '营业额',
  `bates` decimal(12,2) DEFAULT '0.00' COMMENT '提成比例',
  `is_flag` int(2) DEFAULT '0' COMMENT '是否开启  1开启  0  不开启',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_affiliate_ladder`
--

LOCK TABLES `shd_affiliate_ladder` WRITE;
/*!40000 ALTER TABLE `shd_affiliate_ladder` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_affiliate_ladder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_affiliates`
--

DROP TABLE IF EXISTS `shd_affiliates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_affiliates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `date` int(11) NOT NULL DEFAULT '0',
  `uid` int(10) NOT NULL DEFAULT '0',
  `visitors` int(10) NOT NULL DEFAULT '0' COMMENT '访问数量',
  `registcount` int(10) NOT NULL DEFAULT '0' COMMENT '注册数量',
  `payamount` int(10) NOT NULL DEFAULT '0' COMMENT '订购数量',
  `onetime` int(1) NOT NULL DEFAULT '0',
  `audited_balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '待确认佣金',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '可提现佣金',
  `withdrawn` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '已提现佣金',
  `created_time` int(11) NOT NULL DEFAULT '0',
  `updated_time` int(11) NOT NULL DEFAULT '0',
  `withdraw_ing` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '提现中',
  `url_identy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '推介连接标识',
  `sum` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '总佣金',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `affiliateid` (`id`) USING BTREE,
  KEY `clientid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_affiliates`
--

LOCK TABLES `shd_affiliates` WRITE;
/*!40000 ALTER TABLE `shd_affiliates` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_affiliates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_affiliates_product_setting`
--

DROP TABLE IF EXISTS `shd_affiliates_product_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_affiliates_product_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `affiliate_enabled` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否启用推介',
  `affiliate_is_reorder` tinyint(2) NOT NULL DEFAULT '0',
  `affiliate_reorder` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '二次订购比例',
  `affiliate_is_renew` tinyint(2) NOT NULL DEFAULT '0',
  `affiliate_renew` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '续费比例',
  `affiliate_bates` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '推荐比率',
  `affiliate_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '推荐类型',
  `affiliate_renew_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '续费方式',
  `affiliate_reorder_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '二次订购方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_affiliates_product_setting`
--

LOCK TABLES `shd_affiliates_product_setting` WRITE;
/*!40000 ALTER TABLE `shd_affiliates_product_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_affiliates_product_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_affiliates_products_setting`
--

DROP TABLE IF EXISTS `shd_affiliates_products_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_affiliates_products_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `affiliate_enabled` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否启用推介',
  `affiliate_is_reorder` tinyint(2) NOT NULL DEFAULT '0',
  `affiliate_reorder` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '二次订购比例',
  `affiliate_is_renew` tinyint(2) NOT NULL DEFAULT '0',
  `affiliate_renew` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '续费比例',
  `affiliate_bates` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '推荐比率',
  `affiliate_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '推荐类型',
  `affiliate_renew_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '续费方式',
  `affiliate_reorder_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '二次订购方式',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_affiliates_products_setting`
--

LOCK TABLES `shd_affiliates_products_setting` WRITE;
/*!40000 ALTER TABLE `shd_affiliates_products_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_affiliates_products_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_affiliates_user`
--

DROP TABLE IF EXISTS `shd_affiliates_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_affiliates_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `affid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `affid` (`affid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_affiliates_user`
--

LOCK TABLES `shd_affiliates_user` WRITE;
/*!40000 ALTER TABLE `shd_affiliates_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_affiliates_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_affiliates_user_setting`
--

DROP TABLE IF EXISTS `shd_affiliates_user_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_affiliates_user_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `affiliate_enabled` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否启用推介',
  `affiliate_is_reorder` tinyint(2) NOT NULL DEFAULT '0',
  `affiliate_reorder` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '二次订购比例',
  `affiliate_is_renew` tinyint(2) NOT NULL DEFAULT '0',
  `affiliate_renew` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '续费比例',
  `affiliate_bates` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '推荐比率',
  `affiliate_type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '推荐类型',
  `affiliate_renew_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '续费方式',
  `affiliate_reorder_type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '二次订购方式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_affiliates_user_setting`
--

LOCK TABLES `shd_affiliates_user_setting` WRITE;
/*!40000 ALTER TABLE `shd_affiliates_user_setting` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_affiliates_user_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_affiliates_user_temp`
--

DROP TABLE IF EXISTS `shd_affiliates_user_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_affiliates_user_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '临时表',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `affid_uid` int(11) NOT NULL DEFAULT '0' COMMENT '推荐id临时记录用uid代替',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `affid` (`affid_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_affiliates_user_temp`
--

LOCK TABLES `shd_affiliates_user_temp` WRITE;
/*!40000 ALTER TABLE `shd_affiliates_user_temp` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_affiliates_user_temp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_affiliates_withdraw`
--

DROP TABLE IF EXISTS `shd_affiliates_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_affiliates_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `num` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '提现金额',
  `type` int(3) NOT NULL DEFAULT '0' COMMENT '提现方式  余额1 仅记录2 流水支持3',
  `admin_id` int(11) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `status` int(2) NOT NULL DEFAULT '0' COMMENT '1待审核  2审核通过  3拒绝',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_affiliates_withdraw`
--

LOCK TABLES `shd_affiliates_withdraw` WRITE;
/*!40000 ALTER TABLE `shd_affiliates_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_affiliates_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_api`
--

DROP TABLE IF EXISTS `shd_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `ip` text,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `is_auto` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否是自动创建的',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='对外API验证表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_api`
--

LOCK TABLES `shd_api` WRITE;
/*!40000 ALTER TABLE `shd_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_api_resource_log`
--

DROP TABLE IF EXISTS `shd_api_resource_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_api_resource_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'api资源日志id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `version` varchar(25) NOT NULL DEFAULT '' COMMENT '版本',
  `description` varchar(2048) NOT NULL DEFAULT '' COMMENT '描述',
  `ip` varchar(256) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `port` varchar(32) DEFAULT '' COMMENT '端口号',
  `source` varchar(255) NOT NULL DEFAULT 'API' COMMENT '来源：API,WEB',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_api_resource_log`
--

LOCK TABLES `shd_api_resource_log` WRITE;
/*!40000 ALTER TABLE `shd_api_resource_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_api_resource_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_api_user_product`
--

DROP TABLE IF EXISTS `shd_api_user_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_api_user_product` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  `ontrial` int(11) NOT NULL DEFAULT '0' COMMENT '试用数量',
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT '最大购买数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_api_user_product`
--

LOCK TABLES `shd_api_user_product` WRITE;
/*!40000 ALTER TABLE `shd_api_user_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_api_user_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_app_favorite`
--

DROP TABLE IF EXISTS `shd_app_favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_app_favorite` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用收藏',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '应用id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_app_favorite`
--

LOCK TABLES `shd_app_favorite` WRITE;
/*!40000 ALTER TABLE `shd_app_favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_app_favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_app_version`
--

DROP TABLE IF EXISTS `shd_app_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_app_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '应用版本',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '应用id',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '版本',
  `new_function` text COMMENT '新增功能',
  `remove_function` text COMMENT '移除功能',
  `optimize_function` text COMMENT '优化功能',
  `replace_function` text COMMENT '替换功能',
  `bug_fix` text COMMENT 'BUG修复',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_app_version`
--

LOCK TABLES `shd_app_version` WRITE;
/*!40000 ALTER TABLE `shd_app_version` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_app_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_areas`
--

DROP TABLE IF EXISTS `shd_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_areas` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `show` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否展示',
  `sort` int(11) NOT NULL DEFAULT '0',
  `key` char(10) DEFAULT NULL,
  `type` tinyint(4) NOT NULL DEFAULT '1',
  `data_flag` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`area_id`) USING BTREE,
  KEY `isShow` (`show`,`data_flag`) USING BTREE,
  KEY `areaType` (`type`) USING BTREE,
  KEY `parentId` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3409 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_areas`
--

LOCK TABLES `shd_areas` WRITE;
/*!40000 ALTER TABLE `shd_areas` DISABLE KEYS */;
INSERT INTO `shd_areas` VALUES (2,0,'北京市',1,0,'B',0,1,NULL),(3,0,'安徽省',1,0,'A',0,1,NULL),(4,0,'福建省',1,0,'F',0,1,NULL),(5,0,'甘肃省',1,0,'G',0,1,NULL),(6,0,'广东省',1,0,'G',0,1,NULL),(7,0,'广西壮族自治区',1,0,'G',0,1,NULL),(8,0,'贵州省',1,0,'G',0,1,NULL),(9,0,'海南省',1,0,'H',0,1,NULL),(10,0,'河北省',1,0,'H',0,1,NULL),(11,0,'河南省',1,0,'H',0,1,NULL),(12,0,'黑龙江省',1,0,'H',0,1,NULL),(13,0,'湖北省',1,0,'H',0,1,NULL),(14,0,'湖南省',1,0,'H',0,1,NULL),(15,0,'吉林省',1,0,'J',0,1,NULL),(16,0,'江苏省',1,0,'J',0,1,NULL),(17,0,'江西省',1,0,'J',0,1,NULL),(18,0,'辽宁省',1,0,'L',0,1,NULL),(19,0,'内蒙古自治区',1,0,'N',0,1,NULL),(20,0,'宁夏回族自治区',1,0,'N',0,1,NULL),(21,0,'青海省',1,0,'Q',0,1,NULL),(22,0,'山东省',1,0,'S',0,1,NULL),(23,0,'山西省',1,0,'S',0,1,NULL),(24,0,'陕西省',1,0,'S',0,1,NULL),(25,0,'上海市',1,0,'S',0,1,NULL),(26,0,'四川省',1,0,'S',0,1,NULL),(27,0,'天津市',1,0,'T',0,1,NULL),(28,0,'西藏自治区',1,0,'X',0,1,NULL),(29,0,'新疆维吾尔自治区',1,0,'X',0,1,NULL),(30,0,'云南省',1,0,'Y',0,1,NULL),(31,0,'浙江省',1,0,'Z',0,1,NULL),(32,0,'重庆市',1,0,'C',0,1,NULL),(33,0,'香港特别行政区',1,0,'X',0,1,NULL),(34,0,'澳门特别行政区',1,0,'A',0,1,NULL),(35,0,'台湾省',1,0,'T',0,1,NULL),(36,3,'安庆市',1,0,'A',1,1,NULL),(37,3,'蚌埠市',1,0,'B',1,1,NULL),(38,3,'巢湖市',1,0,'C',1,1,NULL),(39,3,'池州市',1,0,'C',1,1,NULL),(40,3,'滁州市',1,0,'C',1,1,NULL),(41,3,'阜阳市',1,0,'F',1,1,NULL),(42,3,'淮北市',1,0,'H',1,1,NULL),(43,3,'淮南市',1,0,'H',1,1,NULL),(44,3,'黄山市',1,0,'H',1,1,NULL),(45,3,'六安市',1,0,'L',1,1,NULL),(46,3,'马鞍山市',1,0,'M',1,1,NULL),(47,3,'宿州市',1,0,'S',1,1,NULL),(48,3,'铜陵市',1,0,'T',1,1,NULL),(49,3,'芜湖市',1,0,'W',1,1,NULL),(50,3,'宣城市',1,0,'X',1,1,NULL),(51,3,'亳州市',1,0,'H',1,1,NULL),(52,2,'北京',1,0,'B',1,1,NULL),(53,4,'福州市',1,0,'F',1,1,NULL),(54,4,'龙岩市',1,0,'L',1,1,NULL),(55,4,'南平市',1,0,'N',1,1,NULL),(56,4,'宁德市',1,0,'N',1,1,NULL),(57,4,'莆田市',1,0,'P',1,1,NULL),(58,4,'泉州市',1,0,'Q',1,1,NULL),(59,4,'三明市',1,0,'S',1,1,NULL),(60,4,'厦门市',1,0,'X',1,1,NULL),(61,4,'漳州市',1,0,'Z',1,1,NULL),(62,5,'兰州市',1,0,'L',1,1,NULL),(63,5,'白银市',1,0,'B',1,1,NULL),(64,5,'定西市',1,0,'D',1,1,NULL),(65,5,'甘南藏族自治州',1,0,'G',1,1,NULL),(66,5,'嘉峪关',1,0,'J',1,1,NULL),(67,5,'金昌市',1,0,'J',1,1,NULL),(68,5,'酒泉市',1,0,'J',1,1,NULL),(69,5,'临夏回族自治州',1,0,'L',1,1,NULL),(70,5,'陇南市',1,0,'L',1,1,NULL),(71,5,'平凉市',1,0,'P',1,1,NULL),(72,5,'庆阳市',1,0,'Q',1,1,NULL),(73,5,'天水市',1,0,'T',1,1,NULL),(74,5,'武威市',1,0,'W',1,1,NULL),(75,5,'张掖市',1,0,'Z',1,1,NULL),(76,6,'广州市',1,0,'G',1,1,NULL),(77,6,'深圳市',1,0,'S',1,1,NULL),(78,6,'潮州市',1,0,'C',1,1,NULL),(79,6,'东莞市',1,0,'D',1,1,NULL),(80,6,'佛山市',1,0,'F',1,1,NULL),(81,6,'河源市',1,0,'H',1,1,NULL),(82,6,'惠州市',1,0,'H',1,1,NULL),(83,6,'江门市',1,0,'J',1,1,NULL),(84,6,'揭阳市',1,0,'J',1,1,NULL),(85,6,'茂名市',1,0,'M',1,1,NULL),(86,6,'梅州市',1,0,'M',1,1,NULL),(87,6,'清远市',1,0,'Q',1,1,NULL),(88,6,'汕头市',1,0,'S',1,1,NULL),(89,6,'汕尾市',1,0,'S',1,1,NULL),(90,6,'韶关市',1,0,'S',1,1,NULL),(91,6,'阳江市',1,0,'Y',1,1,NULL),(92,6,'云浮市',1,0,'Y',1,1,NULL),(93,6,'湛江市',1,0,'Z',1,1,NULL),(94,6,'肇庆市',1,0,'Z',1,1,NULL),(95,6,'中山市',1,0,'Z',1,1,NULL),(96,6,'珠海市',1,0,'Z',1,1,NULL),(97,7,'南宁市',1,0,'N',1,1,NULL),(98,7,'桂林市',1,0,'G',1,1,NULL),(99,7,'百色市',1,0,'B',1,1,NULL),(100,7,'北海市',1,0,'B',1,1,NULL),(101,7,'崇左市',1,0,'C',1,1,NULL),(102,7,'防城港市',1,0,'F',1,1,NULL),(103,7,'贵港市',1,0,'G',1,1,NULL),(104,7,'河池市',1,0,'H',1,1,NULL),(105,7,'贺州市',1,0,'H',1,1,NULL),(106,7,'来宾市',1,0,'L',1,1,NULL),(107,7,'柳州市',1,0,'L',1,1,NULL),(108,7,'钦州市',1,0,'Q',1,1,NULL),(109,7,'梧州市',1,0,'W',1,1,NULL),(110,7,'玉林市',1,0,'Y',1,1,NULL),(111,8,'贵阳市',1,0,'G',1,1,NULL),(112,8,'安顺市',1,0,'A',1,1,NULL),(113,8,'毕节市',1,0,'B',1,1,NULL),(114,8,'六盘水市',1,0,'L',1,1,NULL),(115,8,'黔东南苗族侗族自治州',1,0,'Q',1,1,NULL),(116,8,'黔西南布依族苗族自治州',1,0,'Q',1,1,NULL),(117,8,'黔南布依族苗族自治州',1,0,'Q',1,1,NULL),(118,8,'铜仁',1,0,'T',1,1,NULL),(119,8,'遵义',1,0,'Z',1,1,NULL),(120,9,'海口市',1,0,'H',1,1,NULL),(121,9,'三亚市',1,0,'S',1,1,NULL),(122,9,'白沙黎族自治县',1,0,'B',1,1,NULL),(123,9,'保亭黎族苗族自治县',1,0,'B',1,1,NULL),(124,9,'昌江黎族自治县',1,0,'C',1,1,NULL),(125,9,'澄迈县',1,0,'C',1,1,NULL),(126,9,'定安县',1,0,'D',1,1,NULL),(127,9,'东方市',1,0,'D',1,1,NULL),(128,9,'乐东黎族自治县',1,0,'L',1,1,NULL),(129,9,'临高县',1,0,'L',1,1,NULL),(130,9,'陵水黎族自治县',1,0,'L',1,1,NULL),(131,9,'琼海市',1,0,'Q',1,1,NULL),(132,9,'琼中黎族苗族自治县',1,0,'Q',1,1,NULL),(133,9,'屯昌县',1,0,'T',1,1,NULL),(134,9,'万宁市',1,0,'W',1,1,NULL),(135,9,'文昌市',1,0,'W',1,1,NULL),(136,9,'五指山市',1,0,'W',1,1,NULL),(137,9,'儋州市',1,0,'Z',1,1,NULL),(138,10,'石家庄市',1,0,'S',1,1,NULL),(139,10,'保定市',1,0,'B',1,1,NULL),(140,10,'沧州市',1,0,'C',1,1,NULL),(141,10,'承德市',1,0,'C',1,1,NULL),(142,10,'邯郸市',1,0,'H',1,1,NULL),(143,10,'衡水市',1,0,'H',1,1,NULL),(144,10,'廊坊市',1,0,'L',1,1,NULL),(145,10,'秦皇岛市',1,0,'Q',1,1,NULL),(146,10,'唐山市',1,0,'T',1,1,NULL),(147,10,'邢台市',1,0,'X',1,1,NULL),(148,10,'张家口市',1,0,'Z',1,1,NULL),(149,11,'郑州市',1,0,'Z',1,1,NULL),(150,11,'洛阳市',1,0,'L',1,1,NULL),(151,11,'开封市',1,0,'K',1,1,NULL),(152,11,'安阳市',1,0,'A',1,1,NULL),(153,11,'鹤壁市',1,0,'H',1,1,NULL),(154,11,'济源市',1,0,'J',1,1,NULL),(155,11,'焦作市',1,0,'J',1,1,NULL),(156,11,'南阳市',1,0,'N',1,1,NULL),(157,11,'平顶山市',1,0,'P',1,1,NULL),(158,11,'三门峡市',1,0,'S',1,1,NULL),(159,11,'商丘市',1,0,'S',1,1,NULL),(160,11,'新乡市',1,0,'X',1,1,NULL),(161,11,'信阳市',1,0,'X',1,1,NULL),(162,11,'许昌市',1,0,'X',1,1,NULL),(163,11,'周口市',1,0,'Z',1,1,NULL),(164,11,'驻马店市',1,0,'Z',1,1,NULL),(165,11,'漯河市',1,0,'L',1,1,NULL),(166,11,'濮阳市',1,0,'P',1,1,NULL),(167,12,'哈尔滨市',1,0,'H',1,1,NULL),(168,12,'大庆市',1,0,'D',1,1,NULL),(169,12,'大兴安岭地区',1,0,'D',1,1,NULL),(170,12,'鹤岗市',1,0,'H',1,1,NULL),(171,12,'黑河市',1,0,'H',1,1,NULL),(172,12,'鸡西市',1,0,'J',1,1,NULL),(173,12,'佳木斯市',1,0,'J',1,1,NULL),(174,12,'牡丹江市',1,0,'M',1,1,NULL),(175,12,'七台河市',1,0,'Q',1,1,NULL),(176,12,'齐齐哈尔市',1,0,'Q',1,1,NULL),(177,12,'双鸭山市',1,0,'S',1,1,NULL),(178,12,'绥化市',1,0,'S',1,1,NULL),(179,12,'伊春市',1,0,'Y',1,1,NULL),(180,13,'武汉市',1,0,'W',1,1,NULL),(181,13,'仙桃市',1,0,'X',1,1,NULL),(182,13,'鄂州市',1,0,'E',1,1,NULL),(183,13,'黄冈市',1,0,'H',1,1,NULL),(184,13,'黄石市',1,0,'H',1,1,NULL),(185,13,'荆门市',1,0,'J',1,1,NULL),(186,13,'荆州市',1,0,'J',1,1,NULL),(187,13,'潜江市',1,0,'Q',1,1,NULL),(188,13,'神农架林区',1,0,'S',1,1,NULL),(189,13,'十堰市',1,0,'S',1,1,NULL),(190,13,'随州市',1,0,'S',1,1,NULL),(191,13,'天门市',1,0,'T',1,1,NULL),(192,13,'咸宁市',1,0,'X',1,1,NULL),(193,13,'襄樊市',1,0,'X',1,1,NULL),(194,13,'孝感市',1,0,'X',1,1,NULL),(195,13,'宜昌市',1,0,'Y',1,1,NULL),(196,13,'恩施土家族苗族自治州',1,0,'E',1,1,NULL),(197,14,'长沙市',1,0,'C',1,1,NULL),(198,14,'张家界市',1,0,'Z',1,1,NULL),(199,14,'常德市',1,0,'C',1,1,NULL),(200,14,'郴州市',1,0,'C',1,1,NULL),(201,14,'衡阳市',1,0,'H',1,1,NULL),(202,14,'怀化市',1,0,'H',1,1,NULL),(203,14,'娄底市',1,0,'L',1,1,NULL),(204,14,'邵阳市',1,0,'S',1,1,NULL),(205,14,'湘潭市',1,0,'X',1,1,NULL),(206,14,'湘西土家族苗族自治州',1,0,'X',1,1,NULL),(207,14,'益阳市',1,0,'Y',1,1,NULL),(208,14,'永州市',1,0,'Y',1,1,NULL),(209,14,'岳阳市',1,0,'Y',1,1,NULL),(210,14,'株洲市',1,0,'Z',1,1,NULL),(211,15,'长春市',1,0,'C',1,1,NULL),(212,15,'吉林市',1,0,'J',1,1,NULL),(213,15,'白城市',1,0,'B',1,1,NULL),(214,15,'白山市',1,0,'B',1,1,NULL),(215,15,'辽源市',1,0,'L',1,1,NULL),(216,15,'四平市',1,0,'S',1,1,NULL),(217,15,'松原市',1,0,'S',1,1,NULL),(218,15,'通化市',1,0,'T',1,1,NULL),(219,15,'延边朝鲜族自治州',1,0,'Y',1,1,NULL),(220,16,'南京市',1,0,'N',1,1,NULL),(221,16,'苏州市',1,0,'S',1,1,NULL),(222,16,'无锡市',1,0,'W',1,1,NULL),(223,16,'常州市',1,0,'C',1,1,NULL),(224,16,'淮安市',1,0,'H',1,1,NULL),(225,16,'连云港市',1,0,'L',1,1,NULL),(226,16,'南通市',1,0,'N',1,1,NULL),(227,16,'宿迁市',1,0,'S',1,1,NULL),(228,16,'泰州市',1,0,'T',1,1,NULL),(229,16,'徐州市',1,0,'X',1,1,NULL),(230,16,'盐城市',1,0,'Y',1,1,NULL),(231,16,'扬州市',1,0,'Y',1,1,NULL),(232,16,'镇江市',1,0,'Z',1,1,NULL),(233,17,'南昌市',1,0,'N',1,1,NULL),(234,17,'抚州市',1,0,'F',1,1,NULL),(235,17,'赣州市',1,0,'G',1,1,NULL),(236,17,'吉安市',1,0,'J',1,1,NULL),(237,17,'景德镇市',1,0,'J',1,1,NULL),(238,17,'九江市',1,0,'J',1,1,NULL),(239,17,'萍乡市',1,0,'P',1,1,NULL),(240,17,'上饶市',1,0,'S',1,1,NULL),(241,17,'新余市',1,0,'X',1,1,NULL),(242,17,'宜春市',1,0,'Y',1,1,NULL),(243,17,'鹰潭市',1,0,'Y',1,1,NULL),(244,18,'沈阳市',1,0,'S',1,1,NULL),(245,18,'大连市',1,0,'D',1,1,NULL),(246,18,'鞍山市',1,0,'A',1,1,NULL),(247,18,'本溪市',1,0,'B',1,1,NULL),(248,18,'朝阳市',1,0,'C',1,1,NULL),(249,18,'丹东市',1,0,'D',1,1,NULL),(250,18,'抚顺市',1,0,'F',1,1,NULL),(251,18,'阜新市',1,0,'F',1,1,NULL),(252,18,'葫芦岛市',1,0,'H',1,1,NULL),(253,18,'锦州市',1,0,'J',1,1,NULL),(254,18,'辽阳市',1,0,'L',1,1,NULL),(255,18,'盘锦市',1,0,'P',1,1,NULL),(256,18,'铁岭市',1,0,'T',1,1,NULL),(257,18,'营口市',1,0,'Y',1,1,NULL),(258,19,'呼和浩特市',1,0,'H',1,1,NULL),(259,19,'阿拉善盟',1,0,'A',1,1,NULL),(260,19,'巴彦淖尔盟',1,0,'B',1,1,NULL),(261,19,'包头市',1,0,'B',1,1,NULL),(262,19,'赤峰市',1,0,'C',1,1,NULL),(263,19,'鄂尔多斯市',1,0,'E',1,1,NULL),(264,19,'呼伦贝尔市',1,0,'H',1,1,NULL),(265,19,'通辽市',1,0,'T',1,1,NULL),(266,19,'乌海市',1,0,'W',1,1,NULL),(267,19,'乌兰察布市',1,0,'W',1,1,NULL),(268,19,'锡林郭勒盟',1,0,'X',1,1,NULL),(269,19,'兴安盟',1,0,'X',1,1,NULL),(270,20,'银川市',1,0,'Y',1,1,NULL),(271,20,'固原市',1,0,'G',1,1,NULL),(272,20,'石嘴山市',1,0,'S',1,1,NULL),(273,20,'吴忠市',1,0,'W',1,1,NULL),(274,20,'中卫市',1,0,'Z',1,1,NULL),(275,21,'西宁市',1,0,'X',1,1,NULL),(276,21,'果洛藏族自治州',1,0,'G',1,1,NULL),(277,21,'海北藏族自治州',1,0,'H',1,1,NULL),(278,21,'海东市',1,0,'H',1,1,NULL),(279,21,'海南藏族自治州',1,0,'H',1,1,NULL),(280,21,'海西蒙古族藏族自治州',1,0,'H',1,1,NULL),(281,21,'黄南藏族自治州',1,0,'H',1,1,NULL),(282,21,'玉树藏族自治州',1,0,'Y',1,1,NULL),(283,22,'济南市',1,0,'J',1,1,NULL),(284,22,'青岛市',1,0,'Q',1,1,NULL),(285,22,'滨州市',1,0,'B',1,1,NULL),(286,22,'德州市',1,0,'D',1,1,NULL),(287,22,'东营市',1,0,'D',1,1,NULL),(288,22,'菏泽市',1,0,'H',1,1,NULL),(289,22,'济宁市',1,0,'J',1,1,NULL),(290,22,'莱芜市',1,0,'L',1,1,NULL),(291,22,'聊城市',1,0,'L',1,1,NULL),(292,22,'临沂市',1,0,'L',1,1,NULL),(293,22,'日照市',1,0,'R',1,1,NULL),(294,22,'泰安市',1,0,'T',1,1,NULL),(295,22,'威海市',1,0,'W',1,1,NULL),(296,22,'潍坊市',1,0,'W',1,1,NULL),(297,22,'烟台市',1,0,'Y',1,1,NULL),(298,22,'枣庄市',1,0,'Z',1,1,NULL),(299,22,'淄博市',1,0,'Z',1,1,NULL),(300,23,'太原市',1,0,'T',1,1,NULL),(301,23,'长治市',1,0,'C',1,1,NULL),(302,23,'大同市',1,0,'D',1,1,NULL),(303,23,'晋城市',1,0,'J',1,1,NULL),(304,23,'晋中市',1,0,'J',1,1,NULL),(305,23,'临汾市',1,0,'L',1,1,NULL),(306,23,'吕梁市',1,0,'L',1,1,NULL),(307,23,'朔州市',1,0,'S',1,1,NULL),(308,23,'忻州市',1,0,'X',1,1,NULL),(309,23,'阳泉市',1,0,'Y',1,1,NULL),(310,23,'运城市',1,0,'Y',1,1,NULL),(311,24,'西安市',1,0,'X',1,1,NULL),(312,24,'安康市',1,0,'A',1,1,NULL),(313,24,'宝鸡市',1,0,'B',1,1,NULL),(314,24,'汉中市',1,0,'H',1,1,NULL),(315,24,'商洛市',1,0,'S',1,1,NULL),(316,24,'铜川市',1,0,'T',1,1,NULL),(317,24,'渭南市',1,0,'W',1,1,NULL),(318,24,'咸阳市',1,0,'X',1,1,NULL),(319,24,'延安市',1,0,'Y',1,1,NULL),(320,24,'榆林市',1,0,'Y',1,1,NULL),(321,25,'上海',1,0,'S',1,1,NULL),(322,26,'成都市',1,0,'C',1,1,NULL),(323,26,'绵阳市',1,0,'M',1,1,NULL),(324,26,'阿坝藏族羌族自治州',1,0,'A',1,1,NULL),(325,26,'巴中市',1,0,'B',1,1,NULL),(326,26,'达州市',1,0,'D',1,1,NULL),(327,26,'德阳市',1,0,'D',1,1,NULL),(328,26,'甘孜藏族自治州',1,0,'G',1,1,NULL),(329,26,'广安市',1,0,'G',1,1,NULL),(330,26,'广元市',1,0,'G',1,1,NULL),(331,26,'乐山市',1,0,'L',1,1,NULL),(332,26,'凉山彝族自治州',1,0,'L',1,1,NULL),(333,26,'眉山市',1,0,'M',1,1,NULL),(334,26,'南充市',1,0,'N',1,1,NULL),(335,26,'内江市',1,0,'N',1,1,NULL),(336,26,'攀枝花',1,0,'P',1,1,NULL),(337,26,'遂宁市',1,0,'S',1,1,NULL),(338,26,'雅安市',1,0,'Y',1,1,NULL),(339,26,'宜宾市',1,0,'Y',1,1,NULL),(340,26,'资阳市',1,0,'Z',1,1,NULL),(341,26,'自贡市',1,0,'Z',1,1,NULL),(342,26,'泸州市',1,0,'L',1,1,NULL),(343,27,'天津',1,0,'T',1,1,NULL),(344,28,'拉萨市',1,0,'L',1,1,NULL),(345,28,'阿里地区',1,0,'A',1,1,NULL),(346,28,'昌都市',1,0,'C',1,1,NULL),(347,28,'林芝市',1,0,'L',1,1,NULL),(348,28,'那曲地区',1,0,'Q',1,1,NULL),(349,28,'日喀则市',1,0,'R',1,1,NULL),(350,28,'山南市',1,0,'S',1,1,NULL),(351,29,'乌鲁木齐市',1,0,'W',1,1,NULL),(352,29,'阿克苏地区',1,0,'A',1,1,NULL),(353,29,'阿拉尔',1,0,'A',1,1,NULL),(354,29,'巴音郭楞蒙古自治州',1,0,'B',1,1,NULL),(355,29,'博尔塔拉蒙古自治州',1,0,'B',1,1,NULL),(356,29,'昌吉回族自治州',1,0,'J',1,1,NULL),(357,29,'哈密市',1,0,'H',1,1,NULL),(358,29,'和田地区',1,0,'H',1,1,NULL),(359,29,'喀什地区',1,0,'K',1,1,NULL),(360,29,'克拉玛依市',1,0,'K',1,1,NULL),(361,29,'克孜勒苏柯尔克孜自治州',1,0,'K',1,1,NULL),(362,29,'石河子',1,0,'S',1,1,NULL),(363,29,'图木舒克',1,0,'T',1,1,NULL),(364,29,'吐鲁番市',1,0,'T',1,1,NULL),(365,29,'五家渠市',1,0,'W',1,1,NULL),(366,29,'伊犁哈萨克自治州',1,0,'Y',1,1,NULL),(367,30,'昆明市',1,0,'K',1,1,NULL),(368,30,'怒江傈僳族自治州',1,0,'N',1,1,NULL),(369,30,'普洱市',1,0,'P',1,1,NULL),(370,30,'丽江市',1,0,'L',1,1,NULL),(371,30,'保山市',1,0,'B',1,1,NULL),(372,30,'楚雄彝族自治州',1,0,'C',1,1,NULL),(373,30,'大理白族自治州',1,0,'D',1,1,NULL),(374,30,'德宏傣族景颇族自治州',1,0,'D',1,1,NULL),(375,30,'迪庆藏族自治州',1,0,'D',1,1,NULL),(376,30,'红河哈尼族彝族自治州',1,0,'H',1,1,NULL),(377,30,'临沧市',1,0,'L',1,1,NULL),(378,30,'曲靖市',1,0,'Q',1,1,NULL),(379,30,'文山壮族苗族自治州',1,0,'W',1,1,NULL),(380,30,'西双版纳傣族自治州',1,0,'X',1,1,NULL),(381,30,'玉溪市',1,0,'Y',1,1,NULL),(382,30,'昭通市',1,0,'Z',1,1,NULL),(383,31,'杭州市',1,0,'H',1,1,NULL),(384,31,'湖州市',1,0,'H',1,1,NULL),(385,31,'嘉兴市',1,0,'J',1,1,NULL),(386,31,'金华市',1,0,'J',1,1,NULL),(387,31,'丽水市',1,0,'L',1,1,NULL),(388,31,'宁波市',1,0,'N',1,1,NULL),(389,31,'绍兴市',1,0,'S',1,1,NULL),(390,31,'台州市',1,0,'T',1,1,NULL),(391,31,'温州市',1,0,'W',1,1,NULL),(392,31,'舟山市',1,0,'Z',1,1,NULL),(393,31,'衢州市',1,0,'Q',1,1,NULL),(394,32,'重庆',1,0,'C',1,1,NULL),(395,33,'香港',1,0,'X',1,1,NULL),(396,34,'澳门',1,0,'A',1,1,NULL),(397,35,'台湾',1,0,'T',1,1,NULL),(398,36,'迎江区',1,0,NULL,2,1,NULL),(399,36,'大观区',1,0,NULL,2,1,NULL),(400,36,'宜秀区',1,0,NULL,2,1,NULL),(401,36,'桐城市',1,0,NULL,2,1,NULL),(402,36,'怀宁县',1,0,NULL,2,1,NULL),(403,36,'枞阳县',1,0,NULL,2,1,NULL),(404,36,'潜山县',1,0,NULL,2,1,NULL),(405,36,'太湖县',1,0,NULL,2,1,NULL),(406,36,'宿松县',1,0,NULL,2,1,NULL),(407,36,'望江县',1,0,NULL,2,1,NULL),(408,36,'岳西县',1,0,NULL,2,1,NULL),(409,37,'中市区',1,0,NULL,2,1,NULL),(410,37,'东市区',1,0,NULL,2,1,NULL),(411,37,'西市区',1,0,NULL,2,1,NULL),(412,37,'郊区',1,0,NULL,2,1,NULL),(413,37,'怀远县',1,0,NULL,2,1,NULL),(414,37,'五河县',1,0,NULL,2,1,NULL),(415,37,'固镇县',1,0,NULL,2,1,NULL),(416,38,'居巢区',1,0,NULL,2,1,NULL),(417,38,'庐江县',1,0,NULL,2,1,NULL),(418,38,'无为县',1,0,NULL,2,1,NULL),(419,38,'含山县',1,0,NULL,2,1,NULL),(420,38,'和县',1,0,NULL,2,1,NULL),(421,39,'贵池区',1,0,NULL,2,1,NULL),(422,39,'东至县',1,0,NULL,2,1,NULL),(423,39,'石台县',1,0,NULL,2,1,NULL),(424,39,'青阳县',1,0,NULL,2,1,NULL),(425,40,'琅琊区',1,0,NULL,2,1,NULL),(426,40,'南谯区',1,0,NULL,2,1,NULL),(427,40,'天长市',1,0,NULL,2,1,NULL),(428,40,'明光市',1,0,NULL,2,1,NULL),(429,40,'来安县',1,0,NULL,2,1,NULL),(430,40,'全椒县',1,0,NULL,2,1,NULL),(431,40,'定远县',1,0,NULL,2,1,NULL),(432,40,'凤阳县',1,0,NULL,2,1,NULL),(433,41,'蚌山区',1,0,NULL,2,1,NULL),(434,41,'龙子湖区',1,0,NULL,2,1,NULL),(435,41,'禹会区',1,0,NULL,2,1,NULL),(436,41,'淮上区',1,0,NULL,2,1,NULL),(437,41,'颍州区',1,0,NULL,2,1,NULL),(438,41,'颍东区',1,0,NULL,2,1,NULL),(439,41,'颍泉区',1,0,NULL,2,1,NULL),(440,41,'界首市',1,0,NULL,2,1,NULL),(441,41,'临泉县',1,0,NULL,2,1,NULL),(442,41,'太和县',1,0,NULL,2,1,NULL),(443,41,'阜南县',1,0,NULL,2,1,NULL),(444,41,'颖上县',1,0,NULL,2,1,NULL),(445,42,'相山区',1,0,NULL,2,1,NULL),(446,42,'杜集区',1,0,NULL,2,1,NULL),(447,42,'烈山区',1,0,NULL,2,1,NULL),(448,42,'濉溪县',1,0,NULL,2,1,NULL),(449,43,'田家庵区',1,0,NULL,2,1,NULL),(450,43,'大通区',1,0,NULL,2,1,NULL),(451,43,'谢家集区',1,0,NULL,2,1,NULL),(452,43,'八公山区',1,0,NULL,2,1,NULL),(453,43,'潘集区',1,0,NULL,2,1,NULL),(454,43,'凤台县',1,0,NULL,2,1,NULL),(455,44,'屯溪区',1,0,NULL,2,1,NULL),(456,44,'黄山区',1,0,NULL,2,1,NULL),(457,44,'徽州区',1,0,NULL,2,1,NULL),(458,44,'歙县',1,0,NULL,2,1,NULL),(459,44,'休宁县',1,0,NULL,2,1,NULL),(460,44,'黟县',1,0,NULL,2,1,NULL),(461,44,'祁门县',1,0,NULL,2,1,NULL),(462,45,'金安区',1,0,NULL,2,1,NULL),(463,45,'裕安区',1,0,NULL,2,1,NULL),(464,45,'寿县',1,0,NULL,2,1,NULL),(465,45,'霍邱县',1,0,NULL,2,1,NULL),(466,45,'舒城县',1,0,NULL,2,1,NULL),(467,45,'金寨县',1,0,NULL,2,1,NULL),(468,45,'霍山县',1,0,NULL,2,1,NULL),(469,46,'雨山区',1,0,NULL,2,1,NULL),(470,46,'花山区',1,0,NULL,2,1,NULL),(471,46,'金家庄区',1,0,NULL,2,1,NULL),(472,46,'当涂县',1,0,NULL,2,1,NULL),(473,47,'埇桥区',1,0,NULL,2,1,NULL),(474,47,'砀山县',1,0,NULL,2,1,NULL),(475,47,'萧县',1,0,NULL,2,1,NULL),(476,47,'灵璧县',1,0,NULL,2,1,NULL),(477,47,'泗县',1,0,NULL,2,1,NULL),(478,48,'铜官山区',1,0,NULL,2,1,NULL),(479,48,'狮子山区',1,0,NULL,2,1,NULL),(480,48,'郊区',1,0,NULL,2,1,NULL),(481,48,'铜陵县',1,0,NULL,2,1,NULL),(482,49,'镜湖区',1,0,NULL,2,1,NULL),(483,49,'弋江区',1,0,NULL,2,1,NULL),(484,49,'鸠江区',1,0,NULL,2,1,NULL),(485,49,'三山区',1,0,NULL,2,1,NULL),(486,49,'芜湖县',1,0,NULL,2,1,NULL),(487,49,'繁昌县',1,0,NULL,2,1,NULL),(488,49,'南陵县',1,0,NULL,2,1,NULL),(489,50,'宣州区',1,0,NULL,2,1,NULL),(490,50,'宁国市',1,0,NULL,2,1,NULL),(491,50,'郎溪县',1,0,NULL,2,1,NULL),(492,50,'广德县',1,0,NULL,2,1,NULL),(493,50,'泾县',1,0,NULL,2,1,NULL),(494,50,'绩溪县',1,0,NULL,2,1,NULL),(495,50,'旌德县',1,0,NULL,2,1,NULL),(496,51,'涡阳县',1,0,NULL,2,1,NULL),(497,51,'蒙城县',1,0,NULL,2,1,NULL),(498,51,'利辛县',1,0,NULL,2,1,NULL),(499,51,'谯城区',1,0,NULL,2,1,NULL),(500,52,'东城区',1,0,NULL,2,1,NULL),(501,52,'西城区',1,0,NULL,2,1,NULL),(502,52,'海淀区',1,0,NULL,2,1,NULL),(503,52,'朝阳区',1,0,NULL,2,1,NULL),(504,52,'崇文区',1,0,NULL,2,1,NULL),(505,52,'宣武区',1,0,NULL,2,1,NULL),(506,52,'丰台区',1,0,NULL,2,1,NULL),(507,52,'石景山区',1,0,NULL,2,1,NULL),(508,52,'房山区',1,0,NULL,2,1,NULL),(509,52,'门头沟区',1,0,NULL,2,1,NULL),(510,52,'通州区',1,0,NULL,2,1,NULL),(511,52,'顺义区',1,0,NULL,2,1,NULL),(512,52,'昌平区',1,0,NULL,2,1,NULL),(513,52,'怀柔区',1,0,NULL,2,1,NULL),(514,52,'平谷区',1,0,NULL,2,1,NULL),(515,52,'大兴区',1,0,NULL,2,1,NULL),(516,52,'密云县',1,0,NULL,2,1,NULL),(517,52,'延庆县',1,0,NULL,2,1,NULL),(518,53,'鼓楼区',1,0,NULL,2,1,NULL),(519,53,'台江区',1,0,NULL,2,1,NULL),(520,53,'仓山区',1,0,NULL,2,1,NULL),(521,53,'马尾区',1,0,NULL,2,1,NULL),(522,53,'晋安区',1,0,NULL,2,1,NULL),(523,53,'福清市',1,0,NULL,2,1,NULL),(524,53,'长乐市',1,0,NULL,2,1,NULL),(525,53,'闽侯县',1,0,NULL,2,1,NULL),(526,53,'连江县',1,0,NULL,2,1,NULL),(527,53,'罗源县',1,0,NULL,2,1,NULL),(528,53,'闽清县',1,0,NULL,2,1,NULL),(529,53,'永泰县',1,0,NULL,2,1,NULL),(530,53,'平潭县',1,0,NULL,2,1,NULL),(531,54,'新罗区',1,0,NULL,2,1,NULL),(532,54,'漳平市',1,0,NULL,2,1,NULL),(533,54,'长汀县',1,0,NULL,2,1,NULL),(534,54,'永定县',1,0,NULL,2,1,NULL),(535,54,'上杭县',1,0,NULL,2,1,NULL),(536,54,'武平县',1,0,NULL,2,1,NULL),(537,54,'连城县',1,0,NULL,2,1,NULL),(538,55,'延平区',1,0,NULL,2,1,NULL),(539,55,'邵武市',1,0,NULL,2,1,NULL),(540,55,'武夷山市',1,0,NULL,2,1,NULL),(541,55,'建瓯市',1,0,NULL,2,1,NULL),(542,55,'建阳市',1,0,NULL,2,1,NULL),(543,55,'顺昌县',1,0,NULL,2,1,NULL),(544,55,'浦城县',1,0,NULL,2,1,NULL),(545,55,'光泽县',1,0,NULL,2,1,NULL),(546,55,'松溪县',1,0,NULL,2,1,NULL),(547,55,'政和县',1,0,NULL,2,1,NULL),(548,56,'蕉城区',1,0,NULL,2,1,NULL),(549,56,'福安市',1,0,NULL,2,1,NULL),(550,56,'福鼎市',1,0,NULL,2,1,NULL),(551,56,'霞浦县',1,0,NULL,2,1,NULL),(552,56,'古田县',1,0,NULL,2,1,NULL),(553,56,'屏南县',1,0,NULL,2,1,NULL),(554,56,'寿宁县',1,0,NULL,2,1,NULL),(555,56,'周宁县',1,0,NULL,2,1,NULL),(556,56,'柘荣县',1,0,NULL,2,1,NULL),(557,57,'城厢区',1,0,NULL,2,1,NULL),(558,57,'涵江区',1,0,NULL,2,1,NULL),(559,57,'荔城区',1,0,NULL,2,1,NULL),(560,57,'秀屿区',1,0,NULL,2,1,NULL),(561,57,'仙游县',1,0,NULL,2,1,NULL),(562,58,'鲤城区',1,0,NULL,2,1,NULL),(563,58,'丰泽区',1,0,NULL,2,1,NULL),(564,58,'洛江区',1,0,NULL,2,1,NULL),(565,58,'清濛开发区',1,0,NULL,2,1,NULL),(566,58,'泉港区',1,0,NULL,2,1,NULL),(567,58,'石狮市',1,0,NULL,2,1,NULL),(568,58,'晋江市',1,0,NULL,2,1,NULL),(569,58,'南安市',1,0,NULL,2,1,NULL),(570,58,'惠安县',1,0,NULL,2,1,NULL),(571,58,'安溪县',1,0,NULL,2,1,NULL),(572,58,'永春县',1,0,NULL,2,1,NULL),(573,58,'德化县',1,0,NULL,2,1,NULL),(574,58,'金门县',1,0,NULL,2,1,NULL),(575,59,'梅列区',1,0,NULL,2,1,NULL),(576,59,'三元区',1,0,NULL,2,1,NULL),(577,59,'永安市',1,0,NULL,2,1,NULL),(578,59,'明溪县',1,0,NULL,2,1,NULL),(579,59,'清流县',1,0,NULL,2,1,NULL),(580,59,'宁化县',1,0,NULL,2,1,NULL),(581,59,'大田县',1,0,NULL,2,1,NULL),(582,59,'尤溪县',1,0,NULL,2,1,NULL),(583,59,'沙县',1,0,NULL,2,1,NULL),(584,59,'将乐县',1,0,NULL,2,1,NULL),(585,59,'泰宁县',1,0,NULL,2,1,NULL),(586,59,'建宁县',1,0,NULL,2,1,NULL),(587,60,'思明区',1,0,NULL,2,1,NULL),(588,60,'海沧区',1,0,NULL,2,1,NULL),(589,60,'湖里区',1,0,NULL,2,1,NULL),(590,60,'集美区',1,0,NULL,2,1,NULL),(591,60,'同安区',1,0,NULL,2,1,NULL),(592,60,'翔安区',1,0,NULL,2,1,NULL),(593,61,'芗城区',1,0,NULL,2,1,NULL),(594,61,'龙文区',1,0,NULL,2,1,NULL),(595,61,'龙海市',1,0,NULL,2,1,NULL),(596,61,'云霄县',1,0,NULL,2,1,NULL),(597,61,'漳浦县',1,0,NULL,2,1,NULL),(598,61,'诏安县',1,0,NULL,2,1,NULL),(599,61,'长泰县',1,0,NULL,2,1,NULL),(600,61,'东山县',1,0,NULL,2,1,NULL),(601,61,'南靖县',1,0,NULL,2,1,NULL),(602,61,'平和县',1,0,NULL,2,1,NULL),(603,61,'华安县',1,0,NULL,2,1,NULL),(604,62,'皋兰县',1,0,NULL,2,1,NULL),(605,62,'城关区',1,0,NULL,2,1,NULL),(606,62,'七里河区',1,0,NULL,2,1,NULL),(607,62,'西固区',1,0,NULL,2,1,NULL),(608,62,'安宁区',1,0,NULL,2,1,NULL),(609,62,'红古区',1,0,NULL,2,1,NULL),(610,62,'永登县',1,0,NULL,2,1,NULL),(611,62,'榆中县',1,0,NULL,2,1,NULL),(612,63,'白银区',1,0,NULL,2,1,NULL),(613,63,'平川区',1,0,NULL,2,1,NULL),(614,63,'会宁县',1,0,NULL,2,1,NULL),(615,63,'景泰县',1,0,NULL,2,1,NULL),(616,63,'靖远县',1,0,NULL,2,1,NULL),(617,64,'临洮县',1,0,NULL,2,1,NULL),(618,64,'陇西县',1,0,NULL,2,1,NULL),(619,64,'通渭县',1,0,NULL,2,1,NULL),(620,64,'渭源县',1,0,NULL,2,1,NULL),(621,64,'漳县',1,0,NULL,2,1,NULL),(622,64,'岷县',1,0,NULL,2,1,NULL),(623,64,'安定区',1,0,NULL,2,1,NULL),(624,64,'安定区',1,0,NULL,2,1,NULL),(625,65,'合作市',1,0,NULL,2,1,NULL),(626,65,'临潭县',1,0,NULL,2,1,NULL),(627,65,'卓尼县',1,0,NULL,2,1,NULL),(628,65,'舟曲县',1,0,NULL,2,1,NULL),(629,65,'迭部县',1,0,NULL,2,1,NULL),(630,65,'玛曲县',1,0,NULL,2,1,NULL),(631,65,'碌曲县',1,0,NULL,2,1,NULL),(632,65,'夏河县',1,0,NULL,2,1,NULL),(633,66,'嘉峪关市',1,0,NULL,2,1,NULL),(634,67,'金川区',1,0,NULL,2,1,NULL),(635,67,'永昌县',1,0,NULL,2,1,NULL),(636,68,'肃州区',1,0,NULL,2,1,NULL),(637,68,'玉门市',1,0,NULL,2,1,NULL),(638,68,'敦煌市',1,0,NULL,2,1,NULL),(639,68,'金塔县',1,0,NULL,2,1,NULL),(640,68,'瓜州县',1,0,NULL,2,1,NULL),(641,68,'肃北',1,0,NULL,2,1,NULL),(642,68,'阿克塞',1,0,NULL,2,1,NULL),(643,69,'临夏市',1,0,NULL,2,1,NULL),(644,69,'临夏县',1,0,NULL,2,1,NULL),(645,69,'康乐县',1,0,NULL,2,1,NULL),(646,69,'永靖县',1,0,NULL,2,1,NULL),(647,69,'广河县',1,0,NULL,2,1,NULL),(648,69,'和政县',1,0,NULL,2,1,NULL),(649,69,'东乡族自治县',1,0,NULL,2,1,NULL),(650,69,'积石山',1,0,NULL,2,1,NULL),(651,70,'成县',1,0,NULL,2,1,NULL),(652,70,'徽县',1,0,NULL,2,1,NULL),(653,70,'康县',1,0,NULL,2,1,NULL),(654,70,'礼县',1,0,NULL,2,1,NULL),(655,70,'两当县',1,0,NULL,2,1,NULL),(656,70,'文县',1,0,NULL,2,1,NULL),(657,70,'西和县',1,0,NULL,2,1,NULL),(658,70,'宕昌县',1,0,NULL,2,1,NULL),(659,70,'武都区',1,0,NULL,2,1,NULL),(660,71,'崇信县',1,0,NULL,2,1,NULL),(661,71,'华亭县',1,0,NULL,2,1,NULL),(662,71,'静宁县',1,0,NULL,2,1,NULL),(663,71,'灵台县',1,0,NULL,2,1,NULL),(664,71,'崆峒区',1,0,NULL,2,1,NULL),(665,71,'庄浪县',1,0,NULL,2,1,NULL),(666,71,'泾川县',1,0,NULL,2,1,NULL),(667,72,'合水县',1,0,NULL,2,1,NULL),(668,72,'华池县',1,0,NULL,2,1,NULL),(669,72,'环县',1,0,NULL,2,1,NULL),(670,72,'宁县',1,0,NULL,2,1,NULL),(671,72,'庆城县',1,0,NULL,2,1,NULL),(672,72,'西峰区',1,0,NULL,2,1,NULL),(673,72,'镇原县',1,0,NULL,2,1,NULL),(674,72,'正宁县',1,0,NULL,2,1,NULL),(675,73,'甘谷县',1,0,NULL,2,1,NULL),(676,73,'秦安县',1,0,NULL,2,1,NULL),(677,73,'清水县',1,0,NULL,2,1,NULL),(678,73,'秦州区',1,0,NULL,2,1,NULL),(679,73,'麦积区',1,0,NULL,2,1,NULL),(680,73,'武山县',1,0,NULL,2,1,NULL),(681,73,'张家川',1,0,NULL,2,1,NULL),(682,74,'古浪县',1,0,NULL,2,1,NULL),(683,74,'民勤县',1,0,NULL,2,1,NULL),(684,74,'天祝',1,0,NULL,2,1,NULL),(685,74,'凉州区',1,0,NULL,2,1,NULL),(686,75,'高台县',1,0,NULL,2,1,NULL),(687,75,'临泽县',1,0,NULL,2,1,NULL),(688,75,'民乐县',1,0,NULL,2,1,NULL),(689,75,'山丹县',1,0,NULL,2,1,NULL),(690,75,'肃南',1,0,NULL,2,1,NULL),(691,75,'甘州区',1,0,NULL,2,1,NULL),(692,76,'从化区',1,0,NULL,2,1,NULL),(693,76,'天河区',1,0,NULL,2,1,NULL),(695,76,'白云区',1,0,NULL,2,1,NULL),(696,76,'海珠区',1,0,NULL,2,1,NULL),(697,76,'荔湾区',1,0,NULL,2,1,NULL),(698,76,'越秀区',1,0,NULL,2,1,NULL),(699,76,'黄埔区',1,0,NULL,2,1,NULL),(700,76,'番禺区',1,0,NULL,2,1,NULL),(701,76,'花都区',1,0,NULL,2,1,NULL),(702,76,'增城区',1,0,NULL,2,1,NULL),(703,76,'南沙区',1,0,NULL,2,1,NULL),(705,77,'福田区',1,0,NULL,2,1,NULL),(706,77,'罗湖区',1,0,NULL,2,1,NULL),(707,77,'南山区',1,0,NULL,2,1,NULL),(708,77,'宝安区',1,0,NULL,2,1,NULL),(709,77,'龙岗区',1,0,NULL,2,1,NULL),(710,77,'盐田区',1,0,NULL,2,1,NULL),(711,78,'湘桥区',1,0,NULL,2,1,NULL),(712,78,'潮安县',1,0,NULL,2,1,NULL),(713,78,'饶平县',1,0,NULL,2,1,NULL),(714,79,'南城区',1,0,NULL,2,1,NULL),(715,79,'东城区',1,0,NULL,2,1,NULL),(716,79,'万江区',1,0,NULL,2,1,NULL),(717,79,'莞城区',1,0,NULL,2,1,NULL),(718,79,'石龙镇',1,0,NULL,2,1,NULL),(719,79,'虎门镇',1,0,NULL,2,1,NULL),(720,79,'麻涌镇',1,0,NULL,2,1,NULL),(721,79,'道滘镇',1,0,NULL,2,1,NULL),(722,79,'石碣镇',1,0,NULL,2,1,NULL),(723,79,'沙田镇',1,0,NULL,2,1,NULL),(724,79,'望牛墩镇',1,0,NULL,2,1,NULL),(725,79,'洪梅镇',1,0,NULL,2,1,NULL),(726,79,'茶山镇',1,0,NULL,2,1,NULL),(727,79,'寮步镇',1,0,NULL,2,1,NULL),(728,79,'大岭山镇',1,0,NULL,2,1,NULL),(729,79,'大朗镇',1,0,NULL,2,1,NULL),(730,79,'黄江镇',1,0,NULL,2,1,NULL),(731,79,'樟木头',1,0,NULL,2,1,NULL),(732,79,'凤岗镇',1,0,NULL,2,1,NULL),(733,79,'塘厦镇',1,0,NULL,2,1,NULL),(734,79,'谢岗镇',1,0,NULL,2,1,NULL),(735,79,'厚街镇',1,0,NULL,2,1,NULL),(736,79,'清溪镇',1,0,NULL,2,1,NULL),(737,79,'常平镇',1,0,NULL,2,1,NULL),(738,79,'桥头镇',1,0,NULL,2,1,NULL),(739,79,'横沥镇',1,0,NULL,2,1,NULL),(740,79,'东坑镇',1,0,NULL,2,1,NULL),(741,79,'企石镇',1,0,NULL,2,1,NULL),(742,79,'石排镇',1,0,NULL,2,1,NULL),(743,79,'长安镇',1,0,NULL,2,1,NULL),(744,79,'中堂镇',1,0,NULL,2,1,NULL),(745,79,'高埗镇',1,0,NULL,2,1,NULL),(746,80,'禅城区',1,0,NULL,2,1,NULL),(747,80,'南海区',1,0,NULL,2,1,NULL),(748,80,'顺德区',1,0,NULL,2,1,NULL),(749,80,'三水区',1,0,NULL,2,1,NULL),(750,80,'高明区',1,0,NULL,2,1,NULL),(751,81,'东源县',1,0,NULL,2,1,NULL),(752,81,'和平县',1,0,NULL,2,1,NULL),(753,81,'源城区',1,0,NULL,2,1,NULL),(754,81,'连平县',1,0,NULL,2,1,NULL),(755,81,'龙川县',1,0,NULL,2,1,NULL),(756,81,'紫金县',1,0,NULL,2,1,NULL),(757,82,'惠阳区',1,0,NULL,2,1,NULL),(758,82,'惠城区',1,0,NULL,2,1,NULL),(759,82,'大亚湾',1,0,NULL,2,1,NULL),(760,82,'博罗县',1,0,NULL,2,1,NULL),(761,82,'惠东县',1,0,NULL,2,1,NULL),(762,82,'龙门县',1,0,NULL,2,1,NULL),(763,83,'江海区',1,0,NULL,2,1,NULL),(764,83,'蓬江区',1,0,NULL,2,1,NULL),(765,83,'新会区',1,0,NULL,2,1,NULL),(766,83,'台山市',1,0,NULL,2,1,NULL),(767,83,'开平市',1,0,NULL,2,1,NULL),(768,83,'鹤山市',1,0,NULL,2,1,NULL),(769,83,'恩平市',1,0,NULL,2,1,NULL),(770,84,'榕城区',1,0,NULL,2,1,NULL),(771,84,'普宁市',1,0,NULL,2,1,NULL),(772,84,'揭东县',1,0,NULL,2,1,NULL),(773,84,'揭西县',1,0,NULL,2,1,NULL),(774,84,'惠来县',1,0,NULL,2,1,NULL),(775,85,'茂南区',1,0,NULL,2,1,NULL),(776,85,'茂港区',1,0,NULL,2,1,NULL),(777,85,'高州市',1,0,NULL,2,1,NULL),(778,85,'化州市',1,0,NULL,2,1,NULL),(779,85,'信宜市',1,0,NULL,2,1,NULL),(780,85,'电白县',1,0,NULL,2,1,NULL),(781,86,'梅县',1,0,NULL,2,1,NULL),(782,86,'梅江区',1,0,NULL,2,1,NULL),(783,86,'兴宁市',1,0,NULL,2,1,NULL),(784,86,'大埔县',1,0,NULL,2,1,NULL),(785,86,'丰顺县',1,0,NULL,2,1,NULL),(786,86,'五华县',1,0,NULL,2,1,NULL),(787,86,'平远县',1,0,NULL,2,1,NULL),(788,86,'蕉岭县',1,0,NULL,2,1,NULL),(789,87,'清城区',1,0,NULL,2,1,NULL),(790,87,'英德市',1,0,NULL,2,1,NULL),(791,87,'连州市',1,0,NULL,2,1,NULL),(792,87,'佛冈县',1,0,NULL,2,1,NULL),(793,87,'阳山县',1,0,NULL,2,1,NULL),(794,87,'清新县',1,0,NULL,2,1,NULL),(795,87,'连山',1,0,NULL,2,1,NULL),(796,87,'连南',1,0,NULL,2,1,NULL),(797,88,'南澳县',1,0,NULL,2,1,NULL),(798,88,'潮阳区',1,0,NULL,2,1,NULL),(799,88,'澄海区',1,0,NULL,2,1,NULL),(800,88,'龙湖区',1,0,NULL,2,1,NULL),(801,88,'金平区',1,0,NULL,2,1,NULL),(802,88,'濠江区',1,0,NULL,2,1,NULL),(803,88,'潮南区',1,0,NULL,2,1,NULL),(804,89,'城区',1,0,NULL,2,1,NULL),(805,89,'陆丰市',1,0,NULL,2,1,NULL),(806,89,'海丰县',1,0,NULL,2,1,NULL),(807,89,'陆河县',1,0,NULL,2,1,NULL),(808,90,'曲江县',1,0,NULL,2,1,NULL),(809,90,'浈江区',1,0,NULL,2,1,NULL),(810,90,'武江区',1,0,NULL,2,1,NULL),(811,90,'曲江区',1,0,NULL,2,1,NULL),(812,90,'乐昌市',1,0,NULL,2,1,NULL),(813,90,'南雄市',1,0,NULL,2,1,NULL),(814,90,'始兴县',1,0,NULL,2,1,NULL),(815,90,'仁化县',1,0,NULL,2,1,NULL),(816,90,'翁源县',1,0,NULL,2,1,NULL),(817,90,'新丰县',1,0,NULL,2,1,NULL),(818,90,'乳源',1,0,NULL,2,1,NULL),(819,91,'江城区',1,0,NULL,2,1,NULL),(820,91,'阳春市',1,0,NULL,2,1,NULL),(821,91,'阳西县',1,0,NULL,2,1,NULL),(822,91,'阳东县',1,0,NULL,2,1,NULL),(823,92,'云城区',1,0,NULL,2,1,NULL),(824,92,'罗定市',1,0,NULL,2,1,NULL),(825,92,'新兴县',1,0,NULL,2,1,NULL),(826,92,'郁南县',1,0,NULL,2,1,NULL),(827,92,'云安县',1,0,NULL,2,1,NULL),(828,93,'赤坎区',1,0,NULL,2,1,NULL),(829,93,'霞山区',1,0,NULL,2,1,NULL),(830,93,'坡头区',1,0,NULL,2,1,NULL),(831,93,'麻章区',1,0,NULL,2,1,NULL),(832,93,'廉江市',1,0,NULL,2,1,NULL),(833,93,'雷州市',1,0,NULL,2,1,NULL),(834,93,'吴川市',1,0,NULL,2,1,NULL),(835,93,'遂溪县',1,0,NULL,2,1,NULL),(836,93,'徐闻县',1,0,NULL,2,1,NULL),(837,94,'肇庆市',1,0,NULL,2,1,NULL),(838,94,'高要市',1,0,NULL,2,1,NULL),(839,94,'四会市',1,0,NULL,2,1,NULL),(840,94,'广宁县',1,0,NULL,2,1,NULL),(841,94,'怀集县',1,0,NULL,2,1,NULL),(842,94,'封开县',1,0,NULL,2,1,NULL),(843,94,'德庆县',1,0,NULL,2,1,NULL),(844,95,'石岐街道',1,0,NULL,2,1,NULL),(845,95,'东区街道',1,0,NULL,2,1,NULL),(846,95,'西区街道',1,0,NULL,2,1,NULL),(847,95,'环城街道',1,0,NULL,2,1,NULL),(848,95,'中山港街道',1,0,NULL,2,1,NULL),(849,95,'五桂山街道',1,0,NULL,2,1,NULL),(850,96,'香洲区',1,0,NULL,2,1,NULL),(851,96,'斗门区',1,0,NULL,2,1,NULL),(852,96,'金湾区',1,0,NULL,2,1,NULL),(853,97,'邕宁区',1,0,NULL,2,1,NULL),(854,97,'青秀区',1,0,NULL,2,1,NULL),(855,97,'兴宁区',1,0,NULL,2,1,NULL),(856,97,'良庆区',1,0,NULL,2,1,NULL),(857,97,'西乡塘区',1,0,NULL,2,1,NULL),(858,97,'江南区',1,0,NULL,2,1,NULL),(859,97,'武鸣县',1,0,NULL,2,1,NULL),(860,97,'隆安县',1,0,NULL,2,1,NULL),(861,97,'马山县',1,0,NULL,2,1,NULL),(862,97,'上林县',1,0,NULL,2,1,NULL),(863,97,'宾阳县',1,0,NULL,2,1,NULL),(864,97,'横县',1,0,NULL,2,1,NULL),(865,98,'秀峰区',1,0,NULL,2,1,NULL),(866,98,'叠彩区',1,0,NULL,2,1,NULL),(867,98,'象山区',1,0,NULL,2,1,NULL),(868,98,'七星区',1,0,NULL,2,1,NULL),(869,98,'雁山区',1,0,NULL,2,1,NULL),(870,98,'阳朔县',1,0,NULL,2,1,NULL),(871,98,'临桂县',1,0,NULL,2,1,NULL),(872,98,'灵川县',1,0,NULL,2,1,NULL),(873,98,'全州县',1,0,NULL,2,1,NULL),(874,98,'平乐县',1,0,NULL,2,1,NULL),(875,98,'兴安县',1,0,NULL,2,1,NULL),(876,98,'灌阳县',1,0,NULL,2,1,NULL),(877,98,'荔浦县',1,0,NULL,2,1,NULL),(878,98,'资源县',1,0,NULL,2,1,NULL),(879,98,'永福县',1,0,NULL,2,1,NULL),(880,98,'龙胜',1,0,NULL,2,1,NULL),(881,98,'恭城',1,0,NULL,2,1,NULL),(882,99,'右江区',1,0,NULL,2,1,NULL),(883,99,'凌云县',1,0,NULL,2,1,NULL),(884,99,'平果县',1,0,NULL,2,1,NULL),(885,99,'西林县',1,0,NULL,2,1,NULL),(886,99,'乐业县',1,0,NULL,2,1,NULL),(887,99,'德保县',1,0,NULL,2,1,NULL),(888,99,'田林县',1,0,NULL,2,1,NULL),(889,99,'田阳县',1,0,NULL,2,1,NULL),(890,99,'靖西县',1,0,NULL,2,1,NULL),(891,99,'田东县',1,0,NULL,2,1,NULL),(892,99,'那坡县',1,0,NULL,2,1,NULL),(893,99,'隆林',1,0,NULL,2,1,NULL),(894,100,'海城区',1,0,NULL,2,1,NULL),(895,100,'银海区',1,0,NULL,2,1,NULL),(896,100,'铁山港区',1,0,NULL,2,1,NULL),(897,100,'合浦县',1,0,NULL,2,1,NULL),(898,101,'江州区',1,0,NULL,2,1,NULL),(899,101,'凭祥市',1,0,NULL,2,1,NULL),(900,101,'宁明县',1,0,NULL,2,1,NULL),(901,101,'扶绥县',1,0,NULL,2,1,NULL),(902,101,'龙州县',1,0,NULL,2,1,NULL),(903,101,'大新县',1,0,NULL,2,1,NULL),(904,101,'天等县',1,0,NULL,2,1,NULL),(905,102,'港口区',1,0,NULL,2,1,NULL),(906,102,'防城区',1,0,NULL,2,1,NULL),(907,102,'东兴市',1,0,NULL,2,1,NULL),(908,102,'上思县',1,0,NULL,2,1,NULL),(909,103,'港北区',1,0,NULL,2,1,NULL),(910,103,'港南区',1,0,NULL,2,1,NULL),(911,103,'覃塘区',1,0,NULL,2,1,NULL),(912,103,'桂平市',1,0,NULL,2,1,NULL),(913,103,'平南县',1,0,NULL,2,1,NULL),(914,104,'金城江区',1,0,NULL,2,1,NULL),(915,104,'宜州市',1,0,NULL,2,1,NULL),(916,104,'天峨县',1,0,NULL,2,1,NULL),(917,104,'凤山县',1,0,NULL,2,1,NULL),(918,104,'南丹县',1,0,NULL,2,1,NULL),(919,104,'东兰县',1,0,NULL,2,1,NULL),(920,104,'都安',1,0,NULL,2,1,NULL),(921,104,'罗城',1,0,NULL,2,1,NULL),(922,104,'巴马',1,0,NULL,2,1,NULL),(923,104,'环江',1,0,NULL,2,1,NULL),(924,104,'大化',1,0,NULL,2,1,NULL),(925,105,'八步区',1,0,NULL,2,1,NULL),(926,105,'钟山县',1,0,NULL,2,1,NULL),(927,105,'昭平县',1,0,NULL,2,1,NULL),(928,105,'富川',1,0,NULL,2,1,NULL),(929,106,'兴宾区',1,0,NULL,2,1,NULL),(930,106,'合山市',1,0,NULL,2,1,NULL),(931,106,'象州县',1,0,NULL,2,1,NULL),(932,106,'武宣县',1,0,NULL,2,1,NULL),(933,106,'忻城县',1,0,NULL,2,1,NULL),(934,106,'金秀',1,0,NULL,2,1,NULL),(935,107,'城中区',1,0,NULL,2,1,NULL),(936,107,'鱼峰区',1,0,NULL,2,1,NULL),(937,107,'柳北区',1,0,NULL,2,1,NULL),(938,107,'柳南区',1,0,NULL,2,1,NULL),(939,107,'柳江县',1,0,NULL,2,1,NULL),(940,107,'柳城县',1,0,NULL,2,1,NULL),(941,107,'鹿寨县',1,0,NULL,2,1,NULL),(942,107,'融安县',1,0,NULL,2,1,NULL),(943,107,'融水',1,0,NULL,2,1,NULL),(944,107,'三江',1,0,NULL,2,1,NULL),(945,108,'钦南区',1,0,NULL,2,1,NULL),(946,108,'钦北区',1,0,NULL,2,1,NULL),(947,108,'灵山县',1,0,NULL,2,1,NULL),(948,108,'浦北县',1,0,NULL,2,1,NULL),(949,109,'万秀区',1,0,NULL,2,1,NULL),(950,109,'蝶山区',1,0,NULL,2,1,NULL),(951,109,'长洲区',1,0,NULL,2,1,NULL),(952,109,'岑溪市',1,0,NULL,2,1,NULL),(953,109,'苍梧县',1,0,NULL,2,1,NULL),(954,109,'藤县',1,0,NULL,2,1,NULL),(955,109,'蒙山县',1,0,NULL,2,1,NULL),(956,110,'玉州区',1,0,NULL,2,1,NULL),(957,110,'北流市',1,0,NULL,2,1,NULL),(958,110,'容县',1,0,NULL,2,1,NULL),(959,110,'陆川县',1,0,NULL,2,1,NULL),(960,110,'博白县',1,0,NULL,2,1,NULL),(961,110,'兴业县',1,0,NULL,2,1,NULL),(962,111,'南明区',1,0,NULL,2,1,NULL),(963,111,'云岩区',1,0,NULL,2,1,NULL),(964,111,'花溪区',1,0,NULL,2,1,NULL),(965,111,'乌当区',1,0,NULL,2,1,NULL),(966,111,'白云区',1,0,NULL,2,1,NULL),(967,111,'小河区',1,0,NULL,2,1,NULL),(968,111,'金阳新区',1,0,NULL,2,1,NULL),(969,111,'新天园区',1,0,NULL,2,1,NULL),(970,111,'清镇市',1,0,NULL,2,1,NULL),(971,111,'开阳县',1,0,NULL,2,1,NULL),(972,111,'修文县',1,0,NULL,2,1,NULL),(973,111,'息烽县',1,0,NULL,2,1,NULL),(974,112,'西秀区',1,0,NULL,2,1,NULL),(975,112,'关岭',1,0,NULL,2,1,NULL),(976,112,'镇宁',1,0,NULL,2,1,NULL),(977,112,'紫云',1,0,NULL,2,1,NULL),(978,112,'平坝县',1,0,NULL,2,1,NULL),(979,112,'普定县',1,0,NULL,2,1,NULL),(980,113,'毕节市',1,0,NULL,2,1,NULL),(981,113,'大方县',1,0,NULL,2,1,NULL),(982,113,'黔西县',1,0,NULL,2,1,NULL),(983,113,'金沙县',1,0,NULL,2,1,NULL),(984,113,'织金县',1,0,NULL,2,1,NULL),(985,113,'纳雍县',1,0,NULL,2,1,NULL),(986,113,'赫章县',1,0,NULL,2,1,NULL),(987,113,'威宁',1,0,NULL,2,1,NULL),(988,114,'钟山区',1,0,NULL,2,1,NULL),(989,114,'六枝特区',1,0,NULL,2,1,NULL),(990,114,'水城县',1,0,NULL,2,1,NULL),(991,114,'盘县',1,0,NULL,2,1,NULL),(992,115,'凯里市',1,0,NULL,2,1,NULL),(993,115,'黄平县',1,0,NULL,2,1,NULL),(994,115,'施秉县',1,0,NULL,2,1,NULL),(995,115,'三穗县',1,0,NULL,2,1,NULL),(996,115,'镇远县',1,0,NULL,2,1,NULL),(997,115,'岑巩县',1,0,NULL,2,1,NULL),(998,115,'天柱县',1,0,NULL,2,1,NULL),(999,115,'锦屏县',1,0,NULL,2,1,NULL),(1000,115,'剑河县',1,0,NULL,2,1,NULL),(1001,115,'台江县',1,0,NULL,2,1,NULL),(1002,115,'黎平县',1,0,NULL,2,1,NULL),(1003,115,'榕江县',1,0,NULL,2,1,NULL),(1004,115,'从江县',1,0,NULL,2,1,NULL),(1005,115,'雷山县',1,0,NULL,2,1,NULL),(1006,115,'麻江县',1,0,NULL,2,1,NULL),(1007,115,'丹寨县',1,0,NULL,2,1,NULL),(1008,116,'都匀市',1,0,NULL,2,1,NULL),(1009,116,'福泉市',1,0,NULL,2,1,NULL),(1010,116,'荔波县',1,0,NULL,2,1,NULL),(1011,116,'贵定县',1,0,NULL,2,1,NULL),(1012,116,'瓮安县',1,0,NULL,2,1,NULL),(1013,116,'独山县',1,0,NULL,2,1,NULL),(1014,116,'平塘县',1,0,NULL,2,1,NULL),(1015,116,'罗甸县',1,0,NULL,2,1,NULL),(1016,116,'长顺县',1,0,NULL,2,1,NULL),(1017,116,'龙里县',1,0,NULL,2,1,NULL),(1018,116,'惠水县',1,0,NULL,2,1,NULL),(1019,116,'三都',1,0,NULL,2,1,NULL),(1020,117,'兴义市',1,0,NULL,2,1,NULL),(1021,117,'兴仁县',1,0,NULL,2,1,NULL),(1022,117,'普安县',1,0,NULL,2,1,NULL),(1023,117,'晴隆县',1,0,NULL,2,1,NULL),(1024,117,'贞丰县',1,0,NULL,2,1,NULL),(1025,117,'望谟县',1,0,NULL,2,1,NULL),(1026,117,'册亨县',1,0,NULL,2,1,NULL),(1027,117,'安龙县',1,0,NULL,2,1,NULL),(1028,118,'铜仁市',1,0,NULL,2,1,NULL),(1029,118,'江口县',1,0,NULL,2,1,NULL),(1030,118,'石阡县',1,0,NULL,2,1,NULL),(1031,118,'思南县',1,0,NULL,2,1,NULL),(1032,118,'德江县',1,0,NULL,2,1,NULL),(1033,118,'玉屏',1,0,NULL,2,1,NULL),(1034,118,'印江',1,0,NULL,2,1,NULL),(1035,118,'沿河',1,0,NULL,2,1,NULL),(1036,118,'松桃',1,0,NULL,2,1,NULL),(1037,118,'万山特区',1,0,NULL,2,1,NULL),(1038,119,'红花岗区',1,0,NULL,2,1,NULL),(1039,119,'务川县',1,0,NULL,2,1,NULL),(1040,119,'道真县',1,0,NULL,2,1,NULL),(1041,119,'汇川区',1,0,NULL,2,1,NULL),(1042,119,'赤水市',1,0,NULL,2,1,NULL),(1043,119,'仁怀市',1,0,NULL,2,1,NULL),(1044,119,'遵义县',1,0,NULL,2,1,NULL),(1045,119,'桐梓县',1,0,NULL,2,1,NULL),(1046,119,'绥阳县',1,0,NULL,2,1,NULL),(1047,119,'正安县',1,0,NULL,2,1,NULL),(1048,119,'凤冈县',1,0,NULL,2,1,NULL),(1049,119,'湄潭县',1,0,NULL,2,1,NULL),(1050,119,'余庆县',1,0,NULL,2,1,NULL),(1051,119,'习水县',1,0,NULL,2,1,NULL),(1052,119,'道真',1,0,NULL,2,1,NULL),(1053,119,'务川',1,0,NULL,2,1,NULL),(1054,120,'秀英区',1,0,NULL,2,1,NULL),(1055,120,'龙华区',1,0,NULL,2,1,NULL),(1056,120,'琼山区',1,0,NULL,2,1,NULL),(1057,120,'美兰区',1,0,NULL,2,1,NULL),(1058,137,'市区',1,0,NULL,2,1,NULL),(1059,137,'洋浦开发区',1,0,NULL,2,1,NULL),(1060,137,'那大镇',1,0,NULL,2,1,NULL),(1061,137,'王五镇',1,0,NULL,2,1,NULL),(1062,137,'雅星镇',1,0,NULL,2,1,NULL),(1063,137,'大成镇',1,0,NULL,2,1,NULL),(1064,137,'中和镇',1,0,NULL,2,1,NULL),(1065,137,'峨蔓镇',1,0,NULL,2,1,NULL),(1066,137,'南丰镇',1,0,NULL,2,1,NULL),(1067,137,'白马井镇',1,0,NULL,2,1,NULL),(1068,137,'兰洋镇',1,0,NULL,2,1,NULL),(1069,137,'和庆镇',1,0,NULL,2,1,NULL),(1070,137,'海头镇',1,0,NULL,2,1,NULL),(1071,137,'排浦镇',1,0,NULL,2,1,NULL),(1072,137,'东成镇',1,0,NULL,2,1,NULL),(1073,137,'光村镇',1,0,NULL,2,1,NULL),(1074,137,'木棠镇',1,0,NULL,2,1,NULL),(1075,137,'新州镇',1,0,NULL,2,1,NULL),(1076,137,'三都镇',1,0,NULL,2,1,NULL),(1077,137,'其他',1,0,NULL,2,1,NULL),(1078,138,'长安区',1,0,NULL,2,1,NULL),(1079,138,'桥东区',1,0,NULL,2,1,NULL),(1080,138,'桥西区',1,0,NULL,2,1,NULL),(1081,138,'新华区',1,0,NULL,2,1,NULL),(1082,138,'裕华区',1,0,NULL,2,1,NULL),(1083,138,'井陉矿区',1,0,NULL,2,1,NULL),(1084,138,'高新区',1,0,NULL,2,1,NULL),(1085,138,'辛集市',1,0,NULL,2,1,NULL),(1086,138,'藁城市',1,0,NULL,2,1,NULL),(1087,138,'晋州市',1,0,NULL,2,1,NULL),(1088,138,'新乐市',1,0,NULL,2,1,NULL),(1089,138,'鹿泉市',1,0,NULL,2,1,NULL),(1090,138,'井陉县',1,0,NULL,2,1,NULL),(1091,138,'正定县',1,0,NULL,2,1,NULL),(1092,138,'栾城县',1,0,NULL,2,1,NULL),(1093,138,'行唐县',1,0,NULL,2,1,NULL),(1094,138,'灵寿县',1,0,NULL,2,1,NULL),(1095,138,'高邑县',1,0,NULL,2,1,NULL),(1096,138,'深泽县',1,0,NULL,2,1,NULL),(1097,138,'赞皇县',1,0,NULL,2,1,NULL),(1098,138,'无极县',1,0,NULL,2,1,NULL),(1099,138,'平山县',1,0,NULL,2,1,NULL),(1100,138,'元氏县',1,0,NULL,2,1,NULL),(1101,138,'赵县',1,0,NULL,2,1,NULL),(1102,139,'新市区',1,0,NULL,2,1,NULL),(1103,139,'南市区',1,0,NULL,2,1,NULL),(1104,139,'北市区',1,0,NULL,2,1,NULL),(1105,139,'涿州市',1,0,NULL,2,1,NULL),(1106,139,'定州市',1,0,NULL,2,1,NULL),(1107,139,'安国市',1,0,NULL,2,1,NULL),(1108,139,'高碑店市',1,0,NULL,2,1,NULL),(1109,139,'满城县',1,0,NULL,2,1,NULL),(1110,139,'清苑县',1,0,NULL,2,1,NULL),(1111,139,'涞水县',1,0,NULL,2,1,NULL),(1112,139,'阜平县',1,0,NULL,2,1,NULL),(1113,139,'徐水县',1,0,NULL,2,1,NULL),(1114,139,'定兴县',1,0,NULL,2,1,NULL),(1115,139,'唐县',1,0,NULL,2,1,NULL),(1116,139,'高阳县',1,0,NULL,2,1,NULL),(1117,139,'容城县',1,0,NULL,2,1,NULL),(1118,139,'涞源县',1,0,NULL,2,1,NULL),(1119,139,'望都县',1,0,NULL,2,1,NULL),(1120,139,'安新县',1,0,NULL,2,1,NULL),(1121,139,'易县',1,0,NULL,2,1,NULL),(1122,139,'曲阳县',1,0,NULL,2,1,NULL),(1123,139,'蠡县',1,0,NULL,2,1,NULL),(1124,139,'顺平县',1,0,NULL,2,1,NULL),(1125,139,'博野县',1,0,NULL,2,1,NULL),(1126,139,'雄县',1,0,NULL,2,1,NULL),(1127,140,'运河区',1,0,NULL,2,1,NULL),(1128,140,'新华区',1,0,NULL,2,1,NULL),(1129,140,'泊头市',1,0,NULL,2,1,NULL),(1130,140,'任丘市',1,0,NULL,2,1,NULL),(1131,140,'黄骅市',1,0,NULL,2,1,NULL),(1132,140,'河间市',1,0,NULL,2,1,NULL),(1133,140,'沧县',1,0,NULL,2,1,NULL),(1134,140,'青县',1,0,NULL,2,1,NULL),(1135,140,'东光县',1,0,NULL,2,1,NULL),(1136,140,'海兴县',1,0,NULL,2,1,NULL),(1137,140,'盐山县',1,0,NULL,2,1,NULL),(1138,140,'肃宁县',1,0,NULL,2,1,NULL),(1139,140,'南皮县',1,0,NULL,2,1,NULL),(1140,140,'吴桥县',1,0,NULL,2,1,NULL),(1141,140,'献县',1,0,NULL,2,1,NULL),(1142,140,'孟村',1,0,NULL,2,1,NULL),(1143,141,'双桥区',1,0,NULL,2,1,NULL),(1144,141,'双滦区',1,0,NULL,2,1,NULL),(1145,141,'鹰手营子矿区',1,0,NULL,2,1,NULL),(1146,141,'承德县',1,0,NULL,2,1,NULL),(1147,141,'兴隆县',1,0,NULL,2,1,NULL),(1148,141,'平泉县',1,0,NULL,2,1,NULL),(1149,141,'滦平县',1,0,NULL,2,1,NULL),(1150,141,'隆化县',1,0,NULL,2,1,NULL),(1151,141,'丰宁',1,0,NULL,2,1,NULL),(1152,141,'宽城',1,0,NULL,2,1,NULL),(1153,141,'围场',1,0,NULL,2,1,NULL),(1154,142,'从台区',1,0,NULL,2,1,NULL),(1155,142,'复兴区',1,0,NULL,2,1,NULL),(1156,142,'邯山区',1,0,NULL,2,1,NULL),(1157,142,'峰峰矿区',1,0,NULL,2,1,NULL),(1158,142,'武安市',1,0,NULL,2,1,NULL),(1159,142,'邯郸县',1,0,NULL,2,1,NULL),(1160,142,'临漳县',1,0,NULL,2,1,NULL),(1161,142,'成安县',1,0,NULL,2,1,NULL),(1162,142,'大名县',1,0,NULL,2,1,NULL),(1163,142,'涉县',1,0,NULL,2,1,NULL),(1164,142,'磁县',1,0,NULL,2,1,NULL),(1165,142,'肥乡县',1,0,NULL,2,1,NULL),(1166,142,'永年县',1,0,NULL,2,1,NULL),(1167,142,'邱县',1,0,NULL,2,1,NULL),(1168,142,'鸡泽县',1,0,NULL,2,1,NULL),(1169,142,'广平县',1,0,NULL,2,1,NULL),(1170,142,'馆陶县',1,0,NULL,2,1,NULL),(1171,142,'魏县',1,0,NULL,2,1,NULL),(1172,142,'曲周县',1,0,NULL,2,1,NULL),(1173,143,'桃城区',1,0,NULL,2,1,NULL),(1174,143,'冀州市',1,0,NULL,2,1,NULL),(1175,143,'深州市',1,0,NULL,2,1,NULL),(1176,143,'枣强县',1,0,NULL,2,1,NULL),(1177,143,'武邑县',1,0,NULL,2,1,NULL),(1178,143,'武强县',1,0,NULL,2,1,NULL),(1179,143,'饶阳县',1,0,NULL,2,1,NULL),(1180,143,'安平县',1,0,NULL,2,1,NULL),(1181,143,'故城县',1,0,NULL,2,1,NULL),(1182,143,'景县',1,0,NULL,2,1,NULL),(1183,143,'阜城县',1,0,NULL,2,1,NULL),(1184,144,'安次区',1,0,NULL,2,1,NULL),(1185,144,'广阳区',1,0,NULL,2,1,NULL),(1186,144,'霸州市',1,0,NULL,2,1,NULL),(1187,144,'三河市',1,0,NULL,2,1,NULL),(1188,144,'固安县',1,0,NULL,2,1,NULL),(1189,144,'永清县',1,0,NULL,2,1,NULL),(1190,144,'香河县',1,0,NULL,2,1,NULL),(1191,144,'大城县',1,0,NULL,2,1,NULL),(1192,144,'文安县',1,0,NULL,2,1,NULL),(1193,144,'大厂',1,0,NULL,2,1,NULL),(1194,145,'海港区',1,0,NULL,2,1,NULL),(1195,145,'山海关区',1,0,NULL,2,1,NULL),(1196,145,'北戴河区',1,0,NULL,2,1,NULL),(1197,145,'昌黎县',1,0,NULL,2,1,NULL),(1198,145,'抚宁县',1,0,NULL,2,1,NULL),(1199,145,'卢龙县',1,0,NULL,2,1,NULL),(1200,145,'青龙',1,0,NULL,2,1,NULL),(1201,146,'路北区',1,0,NULL,2,1,NULL),(1202,146,'路南区',1,0,NULL,2,1,NULL),(1203,146,'古冶区',1,0,NULL,2,1,NULL),(1204,146,'开平区',1,0,NULL,2,1,NULL),(1205,146,'丰南区',1,0,NULL,2,1,NULL),(1206,146,'丰润区',1,0,NULL,2,1,NULL),(1207,146,'遵化市',1,0,NULL,2,1,NULL),(1208,146,'迁安市',1,0,NULL,2,1,NULL),(1209,146,'滦县',1,0,NULL,2,1,NULL),(1210,146,'滦南县',1,0,NULL,2,1,NULL),(1211,146,'乐亭县',1,0,NULL,2,1,NULL),(1212,146,'迁西县',1,0,NULL,2,1,NULL),(1213,146,'玉田县',1,0,NULL,2,1,NULL),(1214,146,'唐海县',1,0,NULL,2,1,NULL),(1215,147,'桥东区',1,0,NULL,2,1,NULL),(1216,147,'桥西区',1,0,NULL,2,1,NULL),(1217,147,'南宫市',1,0,NULL,2,1,NULL),(1218,147,'沙河市',1,0,NULL,2,1,NULL),(1219,147,'邢台县',1,0,NULL,2,1,NULL),(1220,147,'临城县',1,0,NULL,2,1,NULL),(1221,147,'内丘县',1,0,NULL,2,1,NULL),(1222,147,'柏乡县',1,0,NULL,2,1,NULL),(1223,147,'隆尧县',1,0,NULL,2,1,NULL),(1224,147,'任县',1,0,NULL,2,1,NULL),(1225,147,'南和县',1,0,NULL,2,1,NULL),(1226,147,'宁晋县',1,0,NULL,2,1,NULL),(1227,147,'巨鹿县',1,0,NULL,2,1,NULL),(1228,147,'新河县',1,0,NULL,2,1,NULL),(1229,147,'广宗县',1,0,NULL,2,1,NULL),(1230,147,'平乡县',1,0,NULL,2,1,NULL),(1231,147,'威县',1,0,NULL,2,1,NULL),(1232,147,'清河县',1,0,NULL,2,1,NULL),(1233,147,'临西县',1,0,NULL,2,1,NULL),(1234,148,'桥西区',1,0,NULL,2,1,NULL),(1235,148,'桥东区',1,0,NULL,2,1,NULL),(1236,148,'宣化区',1,0,NULL,2,1,NULL),(1237,148,'下花园区',1,0,NULL,2,1,NULL),(1238,148,'宣化县',1,0,NULL,2,1,NULL),(1239,148,'张北县',1,0,NULL,2,1,NULL),(1240,148,'康保县',1,0,NULL,2,1,NULL),(1241,148,'沽源县',1,0,NULL,2,1,NULL),(1242,148,'尚义县',1,0,NULL,2,1,NULL),(1243,148,'蔚县',1,0,NULL,2,1,NULL),(1244,148,'阳原县',1,0,NULL,2,1,NULL),(1245,148,'怀安县',1,0,NULL,2,1,NULL),(1246,148,'万全县',1,0,NULL,2,1,NULL),(1247,148,'怀来县',1,0,NULL,2,1,NULL),(1248,148,'涿鹿县',1,0,NULL,2,1,NULL),(1249,148,'赤城县',1,0,NULL,2,1,NULL),(1250,148,'崇礼县',1,0,NULL,2,1,NULL),(1251,149,'金水区',1,0,NULL,2,1,NULL),(1252,149,'邙山区',1,0,NULL,2,1,NULL),(1253,149,'二七区',1,0,NULL,2,1,NULL),(1254,149,'管城区',1,0,NULL,2,1,NULL),(1255,149,'中原区',1,0,NULL,2,1,NULL),(1256,149,'上街区',1,0,NULL,2,1,NULL),(1257,149,'惠济区',1,0,NULL,2,1,NULL),(1258,149,'郑东新区',1,0,NULL,2,1,NULL),(1259,149,'经济技术开发区',1,0,NULL,2,1,NULL),(1260,149,'高新开发区',1,0,NULL,2,1,NULL),(1261,149,'出口加工区',1,0,NULL,2,1,NULL),(1262,149,'巩义市',1,0,NULL,2,1,NULL),(1263,149,'荥阳市',1,0,NULL,2,1,NULL),(1264,149,'新密市',1,0,NULL,2,1,NULL),(1265,149,'新郑市',1,0,NULL,2,1,NULL),(1266,149,'登封市',1,0,NULL,2,1,NULL),(1267,149,'中牟县',1,0,NULL,2,1,NULL),(1268,150,'西工区',1,0,NULL,2,1,NULL),(1269,150,'老城区',1,0,NULL,2,1,NULL),(1270,150,'涧西区',1,0,NULL,2,1,NULL),(1271,150,'瀍河回族区',1,0,NULL,2,1,NULL),(1272,150,'洛龙区',1,0,NULL,2,1,NULL),(1273,150,'吉利区',1,0,NULL,2,1,NULL),(1274,150,'偃师市',1,0,NULL,2,1,NULL),(1275,150,'孟津县',1,0,NULL,2,1,NULL),(1276,150,'新安县',1,0,NULL,2,1,NULL),(1277,150,'栾川县',1,0,NULL,2,1,NULL),(1278,150,'嵩县',1,0,NULL,2,1,NULL),(1279,150,'汝阳县',1,0,NULL,2,1,NULL),(1280,150,'宜阳县',1,0,NULL,2,1,NULL),(1281,150,'洛宁县',1,0,NULL,2,1,NULL),(1282,150,'伊川县',1,0,NULL,2,1,NULL),(1283,151,'鼓楼区',1,0,NULL,2,1,NULL),(1284,151,'龙亭区',1,0,NULL,2,1,NULL),(1285,151,'顺河回族区',1,0,NULL,2,1,NULL),(1286,151,'金明区',1,0,NULL,2,1,NULL),(1287,151,'禹王台区',1,0,NULL,2,1,NULL),(1288,151,'杞县',1,0,NULL,2,1,NULL),(1289,151,'通许县',1,0,NULL,2,1,NULL),(1290,151,'尉氏县',1,0,NULL,2,1,NULL),(1291,151,'开封县',1,0,NULL,2,1,NULL),(1292,151,'兰考县',1,0,NULL,2,1,NULL),(1293,152,'北关区',1,0,NULL,2,1,NULL),(1294,152,'文峰区',1,0,NULL,2,1,NULL),(1295,152,'殷都区',1,0,NULL,2,1,NULL),(1296,152,'龙安区',1,0,NULL,2,1,NULL),(1297,152,'林州市',1,0,NULL,2,1,NULL),(1298,152,'安阳县',1,0,NULL,2,1,NULL),(1299,152,'汤阴县',1,0,NULL,2,1,NULL),(1300,152,'滑县',1,0,NULL,2,1,NULL),(1301,152,'内黄县',1,0,NULL,2,1,NULL),(1302,153,'淇滨区',1,0,NULL,2,1,NULL),(1303,153,'山城区',1,0,NULL,2,1,NULL),(1304,153,'鹤山区',1,0,NULL,2,1,NULL),(1305,153,'浚县',1,0,NULL,2,1,NULL),(1306,153,'淇县',1,0,NULL,2,1,NULL),(1307,154,'济源市',1,0,NULL,2,1,NULL),(1308,155,'解放区',1,0,NULL,2,1,NULL),(1309,155,'中站区',1,0,NULL,2,1,NULL),(1310,155,'马村区',1,0,NULL,2,1,NULL),(1311,155,'山阳区',1,0,NULL,2,1,NULL),(1312,155,'沁阳市',1,0,NULL,2,1,NULL),(1313,155,'孟州市',1,0,NULL,2,1,NULL),(1314,155,'修武县',1,0,NULL,2,1,NULL),(1315,155,'博爱县',1,0,NULL,2,1,NULL),(1316,155,'武陟县',1,0,NULL,2,1,NULL),(1317,155,'温县',1,0,NULL,2,1,NULL),(1318,156,'卧龙区',1,0,NULL,2,1,NULL),(1319,156,'宛城区',1,0,NULL,2,1,NULL),(1320,156,'邓州市',1,0,NULL,2,1,NULL),(1321,156,'南召县',1,0,NULL,2,1,NULL),(1322,156,'方城县',1,0,NULL,2,1,NULL),(1323,156,'西峡县',1,0,NULL,2,1,NULL),(1324,156,'镇平县',1,0,NULL,2,1,NULL),(1325,156,'内乡县',1,0,NULL,2,1,NULL),(1326,156,'淅川县',1,0,NULL,2,1,NULL),(1327,156,'社旗县',1,0,NULL,2,1,NULL),(1328,156,'唐河县',1,0,NULL,2,1,NULL),(1329,156,'新野县',1,0,NULL,2,1,NULL),(1330,156,'桐柏县',1,0,NULL,2,1,NULL),(1331,157,'新华区',1,0,NULL,2,1,NULL),(1332,157,'卫东区',1,0,NULL,2,1,NULL),(1333,157,'湛河区',1,0,NULL,2,1,NULL),(1334,157,'石龙区',1,0,NULL,2,1,NULL),(1335,157,'舞钢市',1,0,NULL,2,1,NULL),(1336,157,'汝州市',1,0,NULL,2,1,NULL),(1337,157,'宝丰县',1,0,NULL,2,1,NULL),(1338,157,'叶县',1,0,NULL,2,1,NULL),(1339,157,'鲁山县',1,0,NULL,2,1,NULL),(1340,157,'郏县',1,0,NULL,2,1,NULL),(1341,158,'湖滨区',1,0,NULL,2,1,NULL),(1342,158,'义马市',1,0,NULL,2,1,NULL),(1343,158,'灵宝市',1,0,NULL,2,1,NULL),(1344,158,'渑池县',1,0,NULL,2,1,NULL),(1345,158,'陕县',1,0,NULL,2,1,NULL),(1346,158,'卢氏县',1,0,NULL,2,1,NULL),(1347,159,'梁园区',1,0,NULL,2,1,NULL),(1348,159,'睢阳区',1,0,NULL,2,1,NULL),(1349,159,'永城市',1,0,NULL,2,1,NULL),(1350,159,'民权县',1,0,NULL,2,1,NULL),(1351,159,'睢县',1,0,NULL,2,1,NULL),(1352,159,'宁陵县',1,0,NULL,2,1,NULL),(1353,159,'虞城县',1,0,NULL,2,1,NULL),(1354,159,'柘城县',1,0,NULL,2,1,NULL),(1355,159,'夏邑县',1,0,NULL,2,1,NULL),(1356,160,'卫滨区',1,0,NULL,2,1,NULL),(1357,160,'红旗区',1,0,NULL,2,1,NULL),(1358,160,'凤泉区',1,0,NULL,2,1,NULL),(1359,160,'牧野区',1,0,NULL,2,1,NULL),(1360,160,'卫辉市',1,0,NULL,2,1,NULL),(1361,160,'辉县市',1,0,NULL,2,1,NULL),(1362,160,'新乡县',1,0,NULL,2,1,NULL),(1363,160,'获嘉县',1,0,NULL,2,1,NULL),(1364,160,'原阳县',1,0,NULL,2,1,NULL),(1365,160,'延津县',1,0,NULL,2,1,NULL),(1366,160,'封丘县',1,0,NULL,2,1,NULL),(1367,160,'长垣县',1,0,NULL,2,1,NULL),(1368,161,'浉河区',1,0,NULL,2,1,NULL),(1369,161,'平桥区',1,0,NULL,2,1,NULL),(1370,161,'罗山县',1,0,NULL,2,1,NULL),(1371,161,'光山县',1,0,NULL,2,1,NULL),(1372,161,'新县',1,0,NULL,2,1,NULL),(1373,161,'商城县',1,0,NULL,2,1,NULL),(1374,161,'固始县',1,0,NULL,2,1,NULL),(1375,161,'潢川县',1,0,NULL,2,1,NULL),(1376,161,'淮滨县',1,0,NULL,2,1,NULL),(1377,161,'息县',1,0,NULL,2,1,NULL),(1378,162,'魏都区',1,0,NULL,2,1,NULL),(1379,162,'禹州市',1,0,NULL,2,1,NULL),(1380,162,'长葛市',1,0,NULL,2,1,NULL),(1381,162,'许昌县',1,0,NULL,2,1,NULL),(1382,162,'鄢陵县',1,0,NULL,2,1,NULL),(1383,162,'襄城县',1,0,NULL,2,1,NULL),(1384,163,'川汇区',1,0,NULL,2,1,NULL),(1385,163,'项城市',1,0,NULL,2,1,NULL),(1386,163,'扶沟县',1,0,NULL,2,1,NULL),(1387,163,'西华县',1,0,NULL,2,1,NULL),(1388,163,'商水县',1,0,NULL,2,1,NULL),(1389,163,'沈丘县',1,0,NULL,2,1,NULL),(1390,163,'郸城县',1,0,NULL,2,1,NULL),(1391,163,'淮阳县',1,0,NULL,2,1,NULL),(1392,163,'太康县',1,0,NULL,2,1,NULL),(1393,163,'鹿邑县',1,0,NULL,2,1,NULL),(1394,164,'驿城区',1,0,NULL,2,1,NULL),(1395,164,'西平县',1,0,NULL,2,1,NULL),(1396,164,'上蔡县',1,0,NULL,2,1,NULL),(1397,164,'平舆县',1,0,NULL,2,1,NULL),(1398,164,'正阳县',1,0,NULL,2,1,NULL),(1399,164,'确山县',1,0,NULL,2,1,NULL),(1400,164,'泌阳县',1,0,NULL,2,1,NULL),(1401,164,'汝南县',1,0,NULL,2,1,NULL),(1402,164,'遂平县',1,0,NULL,2,1,NULL),(1403,164,'新蔡县',1,0,NULL,2,1,NULL),(1404,165,'郾城区',1,0,NULL,2,1,NULL),(1405,165,'源汇区',1,0,NULL,2,1,NULL),(1406,165,'召陵区',1,0,NULL,2,1,NULL),(1407,165,'舞阳县',1,0,NULL,2,1,NULL),(1408,165,'临颍县',1,0,NULL,2,1,NULL),(1409,166,'华龙区',1,0,NULL,2,1,NULL),(1410,166,'清丰县',1,0,NULL,2,1,NULL),(1411,166,'南乐县',1,0,NULL,2,1,NULL),(1412,166,'范县',1,0,NULL,2,1,NULL),(1413,166,'台前县',1,0,NULL,2,1,NULL),(1414,166,'濮阳县',1,0,NULL,2,1,NULL),(1415,167,'道里区',1,0,NULL,2,1,NULL),(1416,167,'南岗区',1,0,NULL,2,1,NULL),(1417,167,'动力区',1,0,NULL,2,1,NULL),(1418,167,'平房区',1,0,NULL,2,1,NULL),(1419,167,'香坊区',1,0,NULL,2,1,NULL),(1420,167,'太平区',1,0,NULL,2,1,NULL),(1421,167,'道外区',1,0,NULL,2,1,NULL),(1422,167,'阿城区',1,0,NULL,2,1,NULL),(1423,167,'呼兰区',1,0,NULL,2,1,NULL),(1424,167,'松北区',1,0,NULL,2,1,NULL),(1425,167,'尚志市',1,0,NULL,2,1,NULL),(1426,167,'双城市',1,0,NULL,2,1,NULL),(1427,167,'五常市',1,0,NULL,2,1,NULL),(1428,167,'方正县',1,0,NULL,2,1,NULL),(1429,167,'宾县',1,0,NULL,2,1,NULL),(1430,167,'依兰县',1,0,NULL,2,1,NULL),(1431,167,'巴彦县',1,0,NULL,2,1,NULL),(1432,167,'通河县',1,0,NULL,2,1,NULL),(1433,167,'木兰县',1,0,NULL,2,1,NULL),(1434,167,'延寿县',1,0,NULL,2,1,NULL),(1435,168,'萨尔图区',1,0,NULL,2,1,NULL),(1436,168,'红岗区',1,0,NULL,2,1,NULL),(1437,168,'龙凤区',1,0,NULL,2,1,NULL),(1438,168,'让胡路区',1,0,NULL,2,1,NULL),(1439,168,'大同区',1,0,NULL,2,1,NULL),(1440,168,'肇州县',1,0,NULL,2,1,NULL),(1441,168,'肇源县',1,0,NULL,2,1,NULL),(1442,168,'林甸县',1,0,NULL,2,1,NULL),(1443,168,'杜尔伯特',1,0,NULL,2,1,NULL),(1444,169,'呼玛县',1,0,NULL,2,1,NULL),(1445,169,'漠河县',1,0,NULL,2,1,NULL),(1446,169,'塔河县',1,0,NULL,2,1,NULL),(1447,170,'兴山区',1,0,NULL,2,1,NULL),(1448,170,'工农区',1,0,NULL,2,1,NULL),(1449,170,'南山区',1,0,NULL,2,1,NULL),(1450,170,'兴安区',1,0,NULL,2,1,NULL),(1451,170,'向阳区',1,0,NULL,2,1,NULL),(1452,170,'东山区',1,0,NULL,2,1,NULL),(1453,170,'萝北县',1,0,NULL,2,1,NULL),(1454,170,'绥滨县',1,0,NULL,2,1,NULL),(1455,171,'爱辉区',1,0,NULL,2,1,NULL),(1456,171,'五大连池市',1,0,NULL,2,1,NULL),(1457,171,'北安市',1,0,NULL,2,1,NULL),(1458,171,'嫩江县',1,0,NULL,2,1,NULL),(1459,171,'逊克县',1,0,NULL,2,1,NULL),(1460,171,'孙吴县',1,0,NULL,2,1,NULL),(1461,172,'鸡冠区',1,0,NULL,2,1,NULL),(1462,172,'恒山区',1,0,NULL,2,1,NULL),(1463,172,'城子河区',1,0,NULL,2,1,NULL),(1464,172,'滴道区',1,0,NULL,2,1,NULL),(1465,172,'梨树区',1,0,NULL,2,1,NULL),(1466,172,'虎林市',1,0,NULL,2,1,NULL),(1467,172,'密山市',1,0,NULL,2,1,NULL),(1468,172,'鸡东县',1,0,NULL,2,1,NULL),(1469,173,'前进区',1,0,NULL,2,1,NULL),(1470,173,'郊区',1,0,NULL,2,1,NULL),(1471,173,'向阳区',1,0,NULL,2,1,NULL),(1472,173,'东风区',1,0,NULL,2,1,NULL),(1473,173,'同江市',1,0,NULL,2,1,NULL),(1474,173,'富锦市',1,0,NULL,2,1,NULL),(1475,173,'桦南县',1,0,NULL,2,1,NULL),(1476,173,'桦川县',1,0,NULL,2,1,NULL),(1477,173,'汤原县',1,0,NULL,2,1,NULL),(1478,173,'抚远县',1,0,NULL,2,1,NULL),(1479,174,'爱民区',1,0,NULL,2,1,NULL),(1480,174,'东安区',1,0,NULL,2,1,NULL),(1481,174,'阳明区',1,0,NULL,2,1,NULL),(1482,174,'西安区',1,0,NULL,2,1,NULL),(1483,174,'绥芬河市',1,0,NULL,2,1,NULL),(1484,174,'海林市',1,0,NULL,2,1,NULL),(1485,174,'宁安市',1,0,NULL,2,1,NULL),(1486,174,'穆棱市',1,0,NULL,2,1,NULL),(1487,174,'东宁县',1,0,NULL,2,1,NULL),(1488,174,'林口县',1,0,NULL,2,1,NULL),(1489,175,'桃山区',1,0,NULL,2,1,NULL),(1490,175,'新兴区',1,0,NULL,2,1,NULL),(1491,175,'茄子河区',1,0,NULL,2,1,NULL),(1492,175,'勃利县',1,0,NULL,2,1,NULL),(1493,176,'龙沙区',1,0,NULL,2,1,NULL),(1494,176,'昂昂溪区',1,0,NULL,2,1,NULL),(1495,176,'铁峰区',1,0,NULL,2,1,NULL),(1496,176,'建华区',1,0,NULL,2,1,NULL),(1497,176,'富拉尔基区',1,0,NULL,2,1,NULL),(1498,176,'碾子山区',1,0,NULL,2,1,NULL),(1499,176,'梅里斯达斡尔区',1,0,NULL,2,1,NULL),(1500,176,'讷河市',1,0,NULL,2,1,NULL),(1501,176,'龙江县',1,0,NULL,2,1,NULL),(1502,176,'依安县',1,0,NULL,2,1,NULL),(1503,176,'泰来县',1,0,NULL,2,1,NULL),(1504,176,'甘南县',1,0,NULL,2,1,NULL),(1505,176,'富裕县',1,0,NULL,2,1,NULL),(1506,176,'克山县',1,0,NULL,2,1,NULL),(1507,176,'克东县',1,0,NULL,2,1,NULL),(1508,176,'拜泉县',1,0,NULL,2,1,NULL),(1509,177,'尖山区',1,0,NULL,2,1,NULL),(1510,177,'岭东区',1,0,NULL,2,1,NULL),(1511,177,'四方台区',1,0,NULL,2,1,NULL),(1512,177,'宝山区',1,0,NULL,2,1,NULL),(1513,177,'集贤县',1,0,NULL,2,1,NULL),(1514,177,'友谊县',1,0,NULL,2,1,NULL),(1515,177,'宝清县',1,0,NULL,2,1,NULL),(1516,177,'饶河县',1,0,NULL,2,1,NULL),(1517,178,'北林区',1,0,NULL,2,1,NULL),(1518,178,'安达市',1,0,NULL,2,1,NULL),(1519,178,'肇东市',1,0,NULL,2,1,NULL),(1520,178,'海伦市',1,0,NULL,2,1,NULL),(1521,178,'望奎县',1,0,NULL,2,1,NULL),(1522,178,'兰西县',1,0,NULL,2,1,NULL),(1523,178,'青冈县',1,0,NULL,2,1,NULL),(1524,178,'庆安县',1,0,NULL,2,1,NULL),(1525,178,'明水县',1,0,NULL,2,1,NULL),(1526,178,'绥棱县',1,0,NULL,2,1,NULL),(1527,179,'伊春区',1,0,NULL,2,1,NULL),(1528,179,'带岭区',1,0,NULL,2,1,NULL),(1529,179,'南岔区',1,0,NULL,2,1,NULL),(1530,179,'金山屯区',1,0,NULL,2,1,NULL),(1531,179,'西林区',1,0,NULL,2,1,NULL),(1532,179,'美溪区',1,0,NULL,2,1,NULL),(1533,179,'乌马河区',1,0,NULL,2,1,NULL),(1534,179,'翠峦区',1,0,NULL,2,1,NULL),(1535,179,'友好区',1,0,NULL,2,1,NULL),(1536,179,'上甘岭区',1,0,NULL,2,1,NULL),(1537,179,'五营区',1,0,NULL,2,1,NULL),(1538,179,'红星区',1,0,NULL,2,1,NULL),(1539,179,'新青区',1,0,NULL,2,1,NULL),(1540,179,'汤旺河区',1,0,NULL,2,1,NULL),(1541,179,'乌伊岭区',1,0,NULL,2,1,NULL),(1542,179,'铁力市',1,0,NULL,2,1,NULL),(1543,179,'嘉荫县',1,0,NULL,2,1,NULL),(1544,180,'江岸区',1,0,NULL,2,1,NULL),(1545,180,'武昌区',1,0,NULL,2,1,NULL),(1546,180,'江汉区',1,0,NULL,2,1,NULL),(1547,180,'硚口区',1,0,NULL,2,1,NULL),(1548,180,'汉阳区',1,0,NULL,2,1,NULL),(1549,180,'青山区',1,0,NULL,2,1,NULL),(1550,180,'洪山区',1,0,NULL,2,1,NULL),(1551,180,'东西湖区',1,0,NULL,2,1,NULL),(1552,180,'汉南区',1,0,NULL,2,1,NULL),(1553,180,'蔡甸区',1,0,NULL,2,1,NULL),(1554,180,'江夏区',1,0,NULL,2,1,NULL),(1555,180,'黄陂区',1,0,NULL,2,1,NULL),(1556,180,'新洲区',1,0,NULL,2,1,NULL),(1557,180,'经济开发区',1,0,NULL,2,1,NULL),(1558,181,'仙桃市',1,0,NULL,2,1,NULL),(1559,182,'鄂城区',1,0,NULL,2,1,NULL),(1560,182,'华容区',1,0,NULL,2,1,NULL),(1561,182,'梁子湖区',1,0,NULL,2,1,NULL),(1562,183,'黄州区',1,0,NULL,2,1,NULL),(1563,183,'麻城市',1,0,NULL,2,1,NULL),(1564,183,'武穴市',1,0,NULL,2,1,NULL),(1565,183,'团风县',1,0,NULL,2,1,NULL),(1566,183,'红安县',1,0,NULL,2,1,NULL),(1567,183,'罗田县',1,0,NULL,2,1,NULL),(1568,183,'英山县',1,0,NULL,2,1,NULL),(1569,183,'浠水县',1,0,NULL,2,1,NULL),(1570,183,'蕲春县',1,0,NULL,2,1,NULL),(1571,183,'黄梅县',1,0,NULL,2,1,NULL),(1572,184,'黄石港区',1,0,NULL,2,1,NULL),(1573,184,'西塞山区',1,0,NULL,2,1,NULL),(1574,184,'下陆区',1,0,NULL,2,1,NULL),(1575,184,'铁山区',1,0,NULL,2,1,NULL),(1576,184,'大冶市',1,0,NULL,2,1,NULL),(1577,184,'阳新县',1,0,NULL,2,1,NULL),(1578,185,'东宝区',1,0,NULL,2,1,NULL),(1579,185,'掇刀区',1,0,NULL,2,1,NULL),(1580,185,'钟祥市',1,0,NULL,2,1,NULL),(1581,185,'京山县',1,0,NULL,2,1,NULL),(1582,185,'沙洋县',1,0,NULL,2,1,NULL),(1583,186,'沙市区',1,0,NULL,2,1,NULL),(1584,186,'荆州区',1,0,NULL,2,1,NULL),(1585,186,'石首市',1,0,NULL,2,1,NULL),(1586,186,'洪湖市',1,0,NULL,2,1,NULL),(1587,186,'松滋市',1,0,NULL,2,1,NULL),(1588,186,'公安县',1,0,NULL,2,1,NULL),(1589,186,'监利县',1,0,NULL,2,1,NULL),(1590,186,'江陵县',1,0,NULL,2,1,NULL),(1591,187,'潜江市',1,0,NULL,2,1,NULL),(1592,188,'神农架林区',1,0,NULL,2,1,NULL),(1593,189,'张湾区',1,0,NULL,2,1,NULL),(1594,189,'茅箭区',1,0,NULL,2,1,NULL),(1595,189,'丹江口市',1,0,NULL,2,1,NULL),(1596,189,'郧县',1,0,NULL,2,1,NULL),(1597,189,'郧西县',1,0,NULL,2,1,NULL),(1598,189,'竹山县',1,0,NULL,2,1,NULL),(1599,189,'竹溪县',1,0,NULL,2,1,NULL),(1600,189,'房县',1,0,NULL,2,1,NULL),(1601,190,'曾都区',1,0,NULL,2,1,NULL),(1602,190,'广水市',1,0,NULL,2,1,NULL),(1603,191,'天门市',1,0,NULL,2,1,NULL),(1604,192,'咸安区',1,0,NULL,2,1,NULL),(1605,192,'赤壁市',1,0,NULL,2,1,NULL),(1606,192,'嘉鱼县',1,0,NULL,2,1,NULL),(1607,192,'通城县',1,0,NULL,2,1,NULL),(1608,192,'崇阳县',1,0,NULL,2,1,NULL),(1609,192,'通山县',1,0,NULL,2,1,NULL),(1610,193,'襄城区',1,0,NULL,2,1,NULL),(1611,193,'樊城区',1,0,NULL,2,1,NULL),(1612,193,'襄阳区',1,0,NULL,2,1,NULL),(1613,193,'老河口市',1,0,NULL,2,1,NULL),(1614,193,'枣阳市',1,0,NULL,2,1,NULL),(1615,193,'宜城市',1,0,NULL,2,1,NULL),(1616,193,'南漳县',1,0,NULL,2,1,NULL),(1617,193,'谷城县',1,0,NULL,2,1,NULL),(1618,193,'保康县',1,0,NULL,2,1,NULL),(1619,194,'孝南区',1,0,NULL,2,1,NULL),(1620,194,'应城市',1,0,NULL,2,1,NULL),(1621,194,'安陆市',1,0,NULL,2,1,NULL),(1622,194,'汉川市',1,0,NULL,2,1,NULL),(1623,194,'孝昌县',1,0,NULL,2,1,NULL),(1624,194,'大悟县',1,0,NULL,2,1,NULL),(1625,194,'云梦县',1,0,NULL,2,1,NULL),(1626,195,'长阳',1,0,NULL,2,1,NULL),(1627,195,'五峰',1,0,NULL,2,1,NULL),(1628,195,'西陵区',1,0,NULL,2,1,NULL),(1629,195,'伍家岗区',1,0,NULL,2,1,NULL),(1630,195,'点军区',1,0,NULL,2,1,NULL),(1631,195,'猇亭区',1,0,NULL,2,1,NULL),(1632,195,'夷陵区',1,0,NULL,2,1,NULL),(1633,195,'宜都市',1,0,NULL,2,1,NULL),(1634,195,'当阳市',1,0,NULL,2,1,NULL),(1635,195,'枝江市',1,0,NULL,2,1,NULL),(1636,195,'远安县',1,0,NULL,2,1,NULL),(1637,195,'兴山县',1,0,NULL,2,1,NULL),(1638,195,'秭归县',1,0,NULL,2,1,NULL),(1639,196,'恩施市',1,0,NULL,2,1,NULL),(1640,196,'利川市',1,0,NULL,2,1,NULL),(1641,196,'建始县',1,0,NULL,2,1,NULL),(1642,196,'巴东县',1,0,NULL,2,1,NULL),(1643,196,'宣恩县',1,0,NULL,2,1,NULL),(1644,196,'咸丰县',1,0,NULL,2,1,NULL),(1645,196,'来凤县',1,0,NULL,2,1,NULL),(1646,196,'鹤峰县',1,0,NULL,2,1,NULL),(1647,197,'岳麓区',1,0,NULL,2,1,NULL),(1648,197,'芙蓉区',1,0,NULL,2,1,NULL),(1649,197,'天心区',1,0,NULL,2,1,NULL),(1650,197,'开福区',1,0,NULL,2,1,NULL),(1651,197,'雨花区',1,0,NULL,2,1,NULL),(1652,197,'开发区',1,0,NULL,2,1,NULL),(1653,197,'浏阳市',1,0,NULL,2,1,NULL),(1654,197,'长沙县',1,0,NULL,2,1,NULL),(1655,197,'望城县',1,0,NULL,2,1,NULL),(1656,197,'宁乡县',1,0,NULL,2,1,NULL),(1657,198,'永定区',1,0,NULL,2,1,NULL),(1658,198,'武陵源区',1,0,NULL,2,1,NULL),(1659,198,'慈利县',1,0,NULL,2,1,NULL),(1660,198,'桑植县',1,0,NULL,2,1,NULL),(1661,199,'武陵区',1,0,NULL,2,1,NULL),(1662,199,'鼎城区',1,0,NULL,2,1,NULL),(1663,199,'津市市',1,0,NULL,2,1,NULL),(1664,199,'安乡县',1,0,NULL,2,1,NULL),(1665,199,'汉寿县',1,0,NULL,2,1,NULL),(1666,199,'澧县',1,0,NULL,2,1,NULL),(1667,199,'临澧县',1,0,NULL,2,1,NULL),(1668,199,'桃源县',1,0,NULL,2,1,NULL),(1669,199,'石门县',1,0,NULL,2,1,NULL),(1670,200,'北湖区',1,0,NULL,2,1,NULL),(1671,200,'苏仙区',1,0,NULL,2,1,NULL),(1672,200,'资兴市',1,0,NULL,2,1,NULL),(1673,200,'桂阳县',1,0,NULL,2,1,NULL),(1674,200,'宜章县',1,0,NULL,2,1,NULL),(1675,200,'永兴县',1,0,NULL,2,1,NULL),(1676,200,'嘉禾县',1,0,NULL,2,1,NULL),(1677,200,'临武县',1,0,NULL,2,1,NULL),(1678,200,'汝城县',1,0,NULL,2,1,NULL),(1679,200,'桂东县',1,0,NULL,2,1,NULL),(1680,200,'安仁县',1,0,NULL,2,1,NULL),(1681,201,'雁峰区',1,0,NULL,2,1,NULL),(1682,201,'珠晖区',1,0,NULL,2,1,NULL),(1683,201,'石鼓区',1,0,NULL,2,1,NULL),(1684,201,'蒸湘区',1,0,NULL,2,1,NULL),(1685,201,'南岳区',1,0,NULL,2,1,NULL),(1686,201,'耒阳市',1,0,NULL,2,1,NULL),(1687,201,'常宁市',1,0,NULL,2,1,NULL),(1688,201,'衡阳县',1,0,NULL,2,1,NULL),(1689,201,'衡南县',1,0,NULL,2,1,NULL),(1690,201,'衡山县',1,0,NULL,2,1,NULL),(1691,201,'衡东县',1,0,NULL,2,1,NULL),(1692,201,'祁东县',1,0,NULL,2,1,NULL),(1693,202,'鹤城区',1,0,NULL,2,1,NULL),(1694,202,'靖州',1,0,NULL,2,1,NULL),(1695,202,'麻阳',1,0,NULL,2,1,NULL),(1696,202,'通道',1,0,NULL,2,1,NULL),(1697,202,'新晃',1,0,NULL,2,1,NULL),(1698,202,'芷江',1,0,NULL,2,1,NULL),(1699,202,'沅陵县',1,0,NULL,2,1,NULL),(1700,202,'辰溪县',1,0,NULL,2,1,NULL),(1701,202,'溆浦县',1,0,NULL,2,1,NULL),(1702,202,'中方县',1,0,NULL,2,1,NULL),(1703,202,'会同县',1,0,NULL,2,1,NULL),(1704,202,'洪江市',1,0,NULL,2,1,NULL),(1705,203,'娄星区',1,0,NULL,2,1,NULL),(1706,203,'冷水江市',1,0,NULL,2,1,NULL),(1707,203,'涟源市',1,0,NULL,2,1,NULL),(1708,203,'双峰县',1,0,NULL,2,1,NULL),(1709,203,'新化县',1,0,NULL,2,1,NULL),(1710,204,'城步',1,0,NULL,2,1,NULL),(1711,204,'双清区',1,0,NULL,2,1,NULL),(1712,204,'大祥区',1,0,NULL,2,1,NULL),(1713,204,'北塔区',1,0,NULL,2,1,NULL),(1714,204,'武冈市',1,0,NULL,2,1,NULL),(1715,204,'邵东县',1,0,NULL,2,1,NULL),(1716,204,'新邵县',1,0,NULL,2,1,NULL),(1717,204,'邵阳县',1,0,NULL,2,1,NULL),(1718,204,'隆回县',1,0,NULL,2,1,NULL),(1719,204,'洞口县',1,0,NULL,2,1,NULL),(1720,204,'绥宁县',1,0,NULL,2,1,NULL),(1721,204,'新宁县',1,0,NULL,2,1,NULL),(1722,205,'岳塘区',1,0,NULL,2,1,NULL),(1723,205,'雨湖区',1,0,NULL,2,1,NULL),(1724,205,'湘乡市',1,0,NULL,2,1,NULL),(1725,205,'韶山市',1,0,NULL,2,1,NULL),(1726,205,'湘潭县',1,0,NULL,2,1,NULL),(1727,206,'吉首市',1,0,NULL,2,1,NULL),(1728,206,'泸溪县',1,0,NULL,2,1,NULL),(1729,206,'凤凰县',1,0,NULL,2,1,NULL),(1730,206,'花垣县',1,0,NULL,2,1,NULL),(1731,206,'保靖县',1,0,NULL,2,1,NULL),(1732,206,'古丈县',1,0,NULL,2,1,NULL),(1733,206,'永顺县',1,0,NULL,2,1,NULL),(1734,206,'龙山县',1,0,NULL,2,1,NULL),(1735,207,'赫山区',1,0,NULL,2,1,NULL),(1736,207,'资阳区',1,0,NULL,2,1,NULL),(1737,207,'沅江市',1,0,NULL,2,1,NULL),(1738,207,'南县',1,0,NULL,2,1,NULL),(1739,207,'桃江县',1,0,NULL,2,1,NULL),(1740,207,'安化县',1,0,NULL,2,1,NULL),(1741,208,'江华',1,0,NULL,2,1,NULL),(1742,208,'冷水滩区',1,0,NULL,2,1,NULL),(1743,208,'零陵区',1,0,NULL,2,1,NULL),(1744,208,'祁阳县',1,0,NULL,2,1,NULL),(1745,208,'东安县',1,0,NULL,2,1,NULL),(1746,208,'双牌县',1,0,NULL,2,1,NULL),(1747,208,'道县',1,0,NULL,2,1,NULL),(1748,208,'江永县',1,0,NULL,2,1,NULL),(1749,208,'宁远县',1,0,NULL,2,1,NULL),(1750,208,'蓝山县',1,0,NULL,2,1,NULL),(1751,208,'新田县',1,0,NULL,2,1,NULL),(1752,209,'岳阳楼区',1,0,NULL,2,1,NULL),(1753,209,'君山区',1,0,NULL,2,1,NULL),(1754,209,'云溪区',1,0,NULL,2,1,NULL),(1755,209,'汨罗市',1,0,NULL,2,1,NULL),(1756,209,'临湘市',1,0,NULL,2,1,NULL),(1757,209,'岳阳县',1,0,NULL,2,1,NULL),(1758,209,'华容县',1,0,NULL,2,1,NULL),(1759,209,'湘阴县',1,0,NULL,2,1,NULL),(1760,209,'平江县',1,0,NULL,2,1,NULL),(1761,210,'天元区',1,0,NULL,2,1,NULL),(1762,210,'荷塘区',1,0,NULL,2,1,NULL),(1763,210,'芦淞区',1,0,NULL,2,1,NULL),(1764,210,'石峰区',1,0,NULL,2,1,NULL),(1765,210,'醴陵市',1,0,NULL,2,1,NULL),(1766,210,'株洲县',1,0,NULL,2,1,NULL),(1767,210,'攸县',1,0,NULL,2,1,NULL),(1768,210,'茶陵县',1,0,NULL,2,1,NULL),(1769,210,'炎陵县',1,0,NULL,2,1,NULL),(1770,211,'朝阳区',1,0,NULL,2,1,NULL),(1771,211,'宽城区',1,0,NULL,2,1,NULL),(1772,211,'二道区',1,0,NULL,2,1,NULL),(1773,211,'南关区',1,0,NULL,2,1,NULL),(1774,211,'绿园区',1,0,NULL,2,1,NULL),(1775,211,'双阳区',1,0,NULL,2,1,NULL),(1776,211,'净月潭开发区',1,0,NULL,2,1,NULL),(1777,211,'高新技术开发区',1,0,NULL,2,1,NULL),(1778,211,'经济技术开发区',1,0,NULL,2,1,NULL),(1779,211,'汽车产业开发区',1,0,NULL,2,1,NULL),(1780,211,'德惠市',1,0,NULL,2,1,NULL),(1781,211,'九台市',1,0,NULL,2,1,NULL),(1782,211,'榆树市',1,0,NULL,2,1,NULL),(1783,211,'农安县',1,0,NULL,2,1,NULL),(1784,212,'船营区',1,0,NULL,2,1,NULL),(1785,212,'昌邑区',1,0,NULL,2,1,NULL),(1786,212,'龙潭区',1,0,NULL,2,1,NULL),(1787,212,'丰满区',1,0,NULL,2,1,NULL),(1788,212,'蛟河市',1,0,NULL,2,1,NULL),(1789,212,'桦甸市',1,0,NULL,2,1,NULL),(1790,212,'舒兰市',1,0,NULL,2,1,NULL),(1791,212,'磐石市',1,0,NULL,2,1,NULL),(1792,212,'永吉县',1,0,NULL,2,1,NULL),(1793,213,'洮北区',1,0,NULL,2,1,NULL),(1794,213,'洮南市',1,0,NULL,2,1,NULL),(1795,213,'大安市',1,0,NULL,2,1,NULL),(1796,213,'镇赉县',1,0,NULL,2,1,NULL),(1797,213,'通榆县',1,0,NULL,2,1,NULL),(1798,214,'江源区',1,0,NULL,2,1,NULL),(1799,214,'八道江区',1,0,NULL,2,1,NULL),(1800,214,'长白',1,0,NULL,2,1,NULL),(1801,214,'临江市',1,0,NULL,2,1,NULL),(1802,214,'抚松县',1,0,NULL,2,1,NULL),(1803,214,'靖宇县',1,0,NULL,2,1,NULL),(1804,215,'龙山区',1,0,NULL,2,1,NULL),(1805,215,'西安区',1,0,NULL,2,1,NULL),(1806,215,'东丰县',1,0,NULL,2,1,NULL),(1807,215,'东辽县',1,0,NULL,2,1,NULL),(1808,216,'铁西区',1,0,NULL,2,1,NULL),(1809,216,'铁东区',1,0,NULL,2,1,NULL),(1810,216,'伊通',1,0,NULL,2,1,NULL),(1811,216,'公主岭市',1,0,NULL,2,1,NULL),(1812,216,'双辽市',1,0,NULL,2,1,NULL),(1813,216,'梨树县',1,0,NULL,2,1,NULL),(1814,217,'前郭尔罗斯',1,0,NULL,2,1,NULL),(1815,217,'宁江区',1,0,NULL,2,1,NULL),(1816,217,'长岭县',1,0,NULL,2,1,NULL),(1817,217,'乾安县',1,0,NULL,2,1,NULL),(1818,217,'扶余县',1,0,NULL,2,1,NULL),(1819,218,'东昌区',1,0,NULL,2,1,NULL),(1820,218,'二道江区',1,0,NULL,2,1,NULL),(1821,218,'梅河口市',1,0,NULL,2,1,NULL),(1822,218,'集安市',1,0,NULL,2,1,NULL),(1823,218,'通化县',1,0,NULL,2,1,NULL),(1824,218,'辉南县',1,0,NULL,2,1,NULL),(1825,218,'柳河县',1,0,NULL,2,1,NULL),(1826,219,'延吉市',1,0,NULL,2,1,NULL),(1827,219,'图们市',1,0,NULL,2,1,NULL),(1828,219,'敦化市',1,0,NULL,2,1,NULL),(1829,219,'珲春市',1,0,NULL,2,1,NULL),(1830,219,'龙井市',1,0,NULL,2,1,NULL),(1831,219,'和龙市',1,0,NULL,2,1,NULL),(1832,219,'安图县',1,0,NULL,2,1,NULL),(1833,219,'汪清县',1,0,NULL,2,1,NULL),(1834,220,'玄武区',1,0,NULL,2,1,NULL),(1835,220,'鼓楼区',1,0,NULL,2,1,NULL),(1836,220,'白下区',1,0,NULL,2,1,NULL),(1837,220,'建邺区',1,0,NULL,2,1,NULL),(1838,220,'秦淮区',1,0,NULL,2,1,NULL),(1839,220,'雨花台区',1,0,NULL,2,1,NULL),(1840,220,'下关区',1,0,NULL,2,1,NULL),(1841,220,'栖霞区',1,0,NULL,2,1,NULL),(1842,220,'浦口区',1,0,NULL,2,1,NULL),(1843,220,'江宁区',1,0,NULL,2,1,NULL),(1844,220,'六合区',1,0,NULL,2,1,NULL),(1845,220,'溧水县',1,0,NULL,2,1,NULL),(1846,220,'高淳县',1,0,NULL,2,1,NULL),(1847,221,'沧浪区',1,0,NULL,2,1,NULL),(1848,221,'金阊区',1,0,NULL,2,1,NULL),(1849,221,'平江区',1,0,NULL,2,1,NULL),(1850,221,'虎丘区',1,0,NULL,2,1,NULL),(1851,221,'吴中区',1,0,NULL,2,1,NULL),(1852,221,'相城区',1,0,NULL,2,1,NULL),(1853,221,'园区',1,0,NULL,2,1,NULL),(1854,221,'新区',1,0,NULL,2,1,NULL),(1855,221,'常熟市',1,0,NULL,2,1,NULL),(1856,221,'张家港市',1,0,NULL,2,1,NULL),(1857,221,'玉山镇',1,0,NULL,2,1,NULL),(1858,221,'巴城镇',1,0,NULL,2,1,NULL),(1859,221,'周市镇',1,0,NULL,2,1,NULL),(1860,221,'陆家镇',1,0,NULL,2,1,NULL),(1861,221,'花桥镇',1,0,NULL,2,1,NULL),(1862,221,'淀山湖镇',1,0,NULL,2,1,NULL),(1863,221,'张浦镇',1,0,NULL,2,1,NULL),(1864,221,'周庄镇',1,0,NULL,2,1,NULL),(1865,221,'千灯镇',1,0,NULL,2,1,NULL),(1866,221,'锦溪镇',1,0,NULL,2,1,NULL),(1867,221,'开发区',1,0,NULL,2,1,NULL),(1868,221,'吴江市',1,0,NULL,2,1,NULL),(1869,221,'太仓市',1,0,NULL,2,1,NULL),(1870,222,'崇安区',1,0,NULL,2,1,NULL),(1871,222,'北塘区',1,0,NULL,2,1,NULL),(1872,222,'南长区',1,0,NULL,2,1,NULL),(1873,222,'锡山区',1,0,NULL,2,1,NULL),(1874,222,'惠山区',1,0,NULL,2,1,NULL),(1875,222,'滨湖区',1,0,NULL,2,1,NULL),(1876,222,'新区',1,0,NULL,2,1,NULL),(1877,222,'江阴市',1,0,NULL,2,1,NULL),(1878,222,'宜兴市',1,0,NULL,2,1,NULL),(1879,223,'天宁区',1,0,NULL,2,1,NULL),(1880,223,'钟楼区',1,0,NULL,2,1,NULL),(1881,223,'戚墅堰区',1,0,NULL,2,1,NULL),(1882,223,'郊区',1,0,NULL,2,1,NULL),(1883,223,'新北区',1,0,NULL,2,1,NULL),(1884,223,'武进区',1,0,NULL,2,1,NULL),(1885,223,'溧阳市',1,0,NULL,2,1,NULL),(1886,223,'金坛市',1,0,NULL,2,1,NULL),(1887,224,'清河区',1,0,NULL,2,1,NULL),(1888,224,'清浦区',1,0,NULL,2,1,NULL),(1889,224,'楚州区',1,0,NULL,2,1,NULL),(1890,224,'淮阴区',1,0,NULL,2,1,NULL),(1891,224,'涟水县',1,0,NULL,2,1,NULL),(1892,224,'洪泽县',1,0,NULL,2,1,NULL),(1893,224,'盱眙县',1,0,NULL,2,1,NULL),(1894,224,'金湖县',1,0,NULL,2,1,NULL),(1895,225,'新浦区',1,0,NULL,2,1,NULL),(1896,225,'连云区',1,0,NULL,2,1,NULL),(1897,225,'海州区',1,0,NULL,2,1,NULL),(1898,225,'赣榆县',1,0,NULL,2,1,NULL),(1899,225,'东海县',1,0,NULL,2,1,NULL),(1900,225,'灌云县',1,0,NULL,2,1,NULL),(1901,225,'灌南县',1,0,NULL,2,1,NULL),(1902,226,'崇川区',1,0,NULL,2,1,NULL),(1903,226,'港闸区',1,0,NULL,2,1,NULL),(1904,226,'经济开发区',1,0,NULL,2,1,NULL),(1905,226,'启东市',1,0,NULL,2,1,NULL),(1906,226,'如皋市',1,0,NULL,2,1,NULL),(1907,226,'通州市',1,0,NULL,2,1,NULL),(1908,226,'海门市',1,0,NULL,2,1,NULL),(1909,226,'海安县',1,0,NULL,2,1,NULL),(1910,226,'如东县',1,0,NULL,2,1,NULL),(1911,227,'宿城区',1,0,NULL,2,1,NULL),(1912,227,'宿豫区',1,0,NULL,2,1,NULL),(1913,227,'宿豫县',1,0,NULL,2,1,NULL),(1914,227,'沭阳县',1,0,NULL,2,1,NULL),(1915,227,'泗阳县',1,0,NULL,2,1,NULL),(1916,227,'泗洪县',1,0,NULL,2,1,NULL),(1917,228,'海陵区',1,0,NULL,2,1,NULL),(1918,228,'高港区',1,0,NULL,2,1,NULL),(1919,228,'兴化市',1,0,NULL,2,1,NULL),(1920,228,'靖江市',1,0,NULL,2,1,NULL),(1921,228,'泰兴市',1,0,NULL,2,1,NULL),(1922,228,'姜堰市',1,0,NULL,2,1,NULL),(1923,229,'云龙区',1,0,NULL,2,1,NULL),(1924,229,'鼓楼区',1,0,NULL,2,1,NULL),(1925,229,'九里区',1,0,NULL,2,1,NULL),(1926,229,'贾汪区',1,0,NULL,2,1,NULL),(1927,229,'泉山区',1,0,NULL,2,1,NULL),(1928,229,'新沂市',1,0,NULL,2,1,NULL),(1929,229,'邳州市',1,0,NULL,2,1,NULL),(1930,229,'丰县',1,0,NULL,2,1,NULL),(1931,229,'沛县',1,0,NULL,2,1,NULL),(1932,229,'铜山县',1,0,NULL,2,1,NULL),(1933,229,'睢宁县',1,0,NULL,2,1,NULL),(1934,230,'城区',1,0,NULL,2,1,NULL),(1935,230,'亭湖区',1,0,NULL,2,1,NULL),(1936,230,'盐都区',1,0,NULL,2,1,NULL),(1937,230,'盐都县',1,0,NULL,2,1,NULL),(1938,230,'东台市',1,0,NULL,2,1,NULL),(1939,230,'大丰市',1,0,NULL,2,1,NULL),(1940,230,'响水县',1,0,NULL,2,1,NULL),(1941,230,'滨海县',1,0,NULL,2,1,NULL),(1942,230,'阜宁县',1,0,NULL,2,1,NULL),(1943,230,'射阳县',1,0,NULL,2,1,NULL),(1944,230,'建湖县',1,0,NULL,2,1,NULL),(1945,231,'广陵区',1,0,NULL,2,1,NULL),(1946,231,'维扬区',1,0,NULL,2,1,NULL),(1947,231,'邗江区',1,0,NULL,2,1,NULL),(1948,231,'仪征市',1,0,NULL,2,1,NULL),(1949,231,'高邮市',1,0,NULL,2,1,NULL),(1950,231,'江都市',1,0,NULL,2,1,NULL),(1951,231,'宝应县',1,0,NULL,2,1,NULL),(1952,232,'京口区',1,0,NULL,2,1,NULL),(1953,232,'润州区',1,0,NULL,2,1,NULL),(1954,232,'丹徒区',1,0,NULL,2,1,NULL),(1955,232,'丹阳市',1,0,NULL,2,1,NULL),(1956,232,'扬中市',1,0,NULL,2,1,NULL),(1957,232,'句容市',1,0,NULL,2,1,NULL),(1958,233,'东湖区',1,0,NULL,2,1,NULL),(1959,233,'西湖区',1,0,NULL,2,1,NULL),(1960,233,'青云谱区',1,0,NULL,2,1,NULL),(1961,233,'湾里区',1,0,NULL,2,1,NULL),(1962,233,'青山湖区',1,0,NULL,2,1,NULL),(1963,233,'红谷滩新区',1,0,NULL,2,1,NULL),(1964,233,'昌北区',1,0,NULL,2,1,NULL),(1965,233,'高新区',1,0,NULL,2,1,NULL),(1966,233,'南昌县',1,0,NULL,2,1,NULL),(1967,233,'新建县',1,0,NULL,2,1,NULL),(1968,233,'安义县',1,0,NULL,2,1,NULL),(1969,233,'进贤县',1,0,NULL,2,1,NULL),(1970,234,'临川区',1,0,NULL,2,1,NULL),(1971,234,'南城县',1,0,NULL,2,1,NULL),(1972,234,'黎川县',1,0,NULL,2,1,NULL),(1973,234,'南丰县',1,0,NULL,2,1,NULL),(1974,234,'崇仁县',1,0,NULL,2,1,NULL),(1975,234,'乐安县',1,0,NULL,2,1,NULL),(1976,234,'宜黄县',1,0,NULL,2,1,NULL),(1977,234,'金溪县',1,0,NULL,2,1,NULL),(1978,234,'资溪县',1,0,NULL,2,1,NULL),(1979,234,'东乡县',1,0,NULL,2,1,NULL),(1980,234,'广昌县',1,0,NULL,2,1,NULL),(1981,235,'章贡区',1,0,NULL,2,1,NULL),(1982,235,'于都县',1,0,NULL,2,1,NULL),(1983,235,'瑞金市',1,0,NULL,2,1,NULL),(1984,235,'南康市',1,0,NULL,2,1,NULL),(1985,235,'赣县',1,0,NULL,2,1,NULL),(1986,235,'信丰县',1,0,NULL,2,1,NULL),(1987,235,'大余县',1,0,NULL,2,1,NULL),(1988,235,'上犹县',1,0,NULL,2,1,NULL),(1989,235,'崇义县',1,0,NULL,2,1,NULL),(1990,235,'安远县',1,0,NULL,2,1,NULL),(1991,235,'龙南县',1,0,NULL,2,1,NULL),(1992,235,'定南县',1,0,NULL,2,1,NULL),(1993,235,'全南县',1,0,NULL,2,1,NULL),(1994,235,'宁都县',1,0,NULL,2,1,NULL),(1995,235,'兴国县',1,0,NULL,2,1,NULL),(1996,235,'会昌县',1,0,NULL,2,1,NULL),(1997,235,'寻乌县',1,0,NULL,2,1,NULL),(1998,235,'石城县',1,0,NULL,2,1,NULL),(1999,236,'安福县',1,0,NULL,2,1,NULL),(2000,236,'吉州区',1,0,NULL,2,1,NULL),(2001,236,'青原区',1,0,NULL,2,1,NULL),(2002,236,'井冈山市',1,0,NULL,2,1,NULL),(2003,236,'吉安县',1,0,NULL,2,1,NULL),(2004,236,'吉水县',1,0,NULL,2,1,NULL),(2005,236,'峡江县',1,0,NULL,2,1,NULL),(2006,236,'新干县',1,0,NULL,2,1,NULL),(2007,236,'永丰县',1,0,NULL,2,1,NULL),(2008,236,'泰和县',1,0,NULL,2,1,NULL),(2009,236,'遂川县',1,0,NULL,2,1,NULL),(2010,236,'万安县',1,0,NULL,2,1,NULL),(2011,236,'永新县',1,0,NULL,2,1,NULL),(2012,237,'珠山区',1,0,NULL,2,1,NULL),(2013,237,'昌江区',1,0,NULL,2,1,NULL),(2014,237,'乐平市',1,0,NULL,2,1,NULL),(2015,237,'浮梁县',1,0,NULL,2,1,NULL),(2016,238,'浔阳区',1,0,NULL,2,1,NULL),(2017,238,'庐山区',1,0,NULL,2,1,NULL),(2018,238,'瑞昌市',1,0,NULL,2,1,NULL),(2019,238,'九江县',1,0,NULL,2,1,NULL),(2020,238,'武宁县',1,0,NULL,2,1,NULL),(2021,238,'修水县',1,0,NULL,2,1,NULL),(2022,238,'永修县',1,0,NULL,2,1,NULL),(2023,238,'德安县',1,0,NULL,2,1,NULL),(2024,238,'星子县',1,0,NULL,2,1,NULL),(2025,238,'都昌县',1,0,NULL,2,1,NULL),(2026,238,'湖口县',1,0,NULL,2,1,NULL),(2027,238,'彭泽县',1,0,NULL,2,1,NULL),(2028,239,'安源区',1,0,NULL,2,1,NULL),(2029,239,'湘东区',1,0,NULL,2,1,NULL),(2030,239,'莲花县',1,0,NULL,2,1,NULL),(2031,239,'芦溪县',1,0,NULL,2,1,NULL),(2032,239,'上栗县',1,0,NULL,2,1,NULL),(2033,240,'信州区',1,0,NULL,2,1,NULL),(2034,240,'德兴市',1,0,NULL,2,1,NULL),(2035,240,'上饶县',1,0,NULL,2,1,NULL),(2036,240,'广丰县',1,0,NULL,2,1,NULL),(2037,240,'玉山县',1,0,NULL,2,1,NULL),(2038,240,'铅山县',1,0,NULL,2,1,NULL),(2039,240,'横峰县',1,0,NULL,2,1,NULL),(2040,240,'弋阳县',1,0,NULL,2,1,NULL),(2041,240,'余干县',1,0,NULL,2,1,NULL),(2042,240,'波阳县',1,0,NULL,2,1,NULL),(2043,240,'万年县',1,0,NULL,2,1,NULL),(2044,240,'婺源县',1,0,NULL,2,1,NULL),(2045,241,'渝水区',1,0,NULL,2,1,NULL),(2046,241,'分宜县',1,0,NULL,2,1,NULL),(2047,242,'袁州区',1,0,NULL,2,1,NULL),(2048,242,'丰城市',1,0,NULL,2,1,NULL),(2049,242,'樟树市',1,0,NULL,2,1,NULL),(2050,242,'高安市',1,0,NULL,2,1,NULL),(2051,242,'奉新县',1,0,NULL,2,1,NULL),(2052,242,'万载县',1,0,NULL,2,1,NULL),(2053,242,'上高县',1,0,NULL,2,1,NULL),(2054,242,'宜丰县',1,0,NULL,2,1,NULL),(2055,242,'靖安县',1,0,NULL,2,1,NULL),(2056,242,'铜鼓县',1,0,NULL,2,1,NULL),(2057,243,'月湖区',1,0,NULL,2,1,NULL),(2058,243,'贵溪市',1,0,NULL,2,1,NULL),(2059,243,'余江县',1,0,NULL,2,1,NULL),(2060,244,'沈河区',1,0,NULL,2,1,NULL),(2061,244,'皇姑区',1,0,NULL,2,1,NULL),(2062,244,'和平区',1,0,NULL,2,1,NULL),(2063,244,'大东区',1,0,NULL,2,1,NULL),(2064,244,'铁西区',1,0,NULL,2,1,NULL),(2065,244,'苏家屯区',1,0,NULL,2,1,NULL),(2066,244,'东陵区',1,0,NULL,2,1,NULL),(2067,244,'沈北新区',1,0,NULL,2,1,NULL),(2068,244,'于洪区',1,0,NULL,2,1,NULL),(2069,244,'浑南新区',1,0,NULL,2,1,NULL),(2070,244,'新民市',1,0,NULL,2,1,NULL),(2071,244,'辽中县',1,0,NULL,2,1,NULL),(2072,244,'康平县',1,0,NULL,2,1,NULL),(2073,244,'法库县',1,0,NULL,2,1,NULL),(2074,245,'西岗区',1,0,NULL,2,1,NULL),(2075,245,'中山区',1,0,NULL,2,1,NULL),(2076,245,'沙河口区',1,0,NULL,2,1,NULL),(2077,245,'甘井子区',1,0,NULL,2,1,NULL),(2078,245,'旅顺口区',1,0,NULL,2,1,NULL),(2079,245,'金州区',1,0,NULL,2,1,NULL),(2080,245,'开发区',1,0,NULL,2,1,NULL),(2081,245,'瓦房店市',1,0,NULL,2,1,NULL),(2082,245,'普兰店市',1,0,NULL,2,1,NULL),(2083,245,'庄河市',1,0,NULL,2,1,NULL),(2084,245,'长海县',1,0,NULL,2,1,NULL),(2085,246,'铁东区',1,0,NULL,2,1,NULL),(2086,246,'铁西区',1,0,NULL,2,1,NULL),(2087,246,'立山区',1,0,NULL,2,1,NULL),(2088,246,'千山区',1,0,NULL,2,1,NULL),(2089,246,'岫岩',1,0,NULL,2,1,NULL),(2090,246,'海城市',1,0,NULL,2,1,NULL),(2091,246,'台安县',1,0,NULL,2,1,NULL),(2092,247,'本溪',1,0,NULL,2,1,NULL),(2093,247,'平山区',1,0,NULL,2,1,NULL),(2094,247,'明山区',1,0,NULL,2,1,NULL),(2095,247,'溪湖区',1,0,NULL,2,1,NULL),(2096,247,'南芬区',1,0,NULL,2,1,NULL),(2097,247,'桓仁',1,0,NULL,2,1,NULL),(2098,248,'双塔区',1,0,NULL,2,1,NULL),(2099,248,'龙城区',1,0,NULL,2,1,NULL),(2100,248,'喀喇沁左翼蒙古族自治县',1,0,NULL,2,1,NULL),(2101,248,'北票市',1,0,NULL,2,1,NULL),(2102,248,'凌源市',1,0,NULL,2,1,NULL),(2103,248,'朝阳县',1,0,NULL,2,1,NULL),(2104,248,'建平县',1,0,NULL,2,1,NULL),(2105,249,'振兴区',1,0,NULL,2,1,NULL),(2106,249,'元宝区',1,0,NULL,2,1,NULL),(2107,249,'振安区',1,0,NULL,2,1,NULL),(2108,249,'宽甸',1,0,NULL,2,1,NULL),(2109,249,'东港市',1,0,NULL,2,1,NULL),(2110,249,'凤城市',1,0,NULL,2,1,NULL),(2111,250,'顺城区',1,0,NULL,2,1,NULL),(2112,250,'新抚区',1,0,NULL,2,1,NULL),(2113,250,'东洲区',1,0,NULL,2,1,NULL),(2114,250,'望花区',1,0,NULL,2,1,NULL),(2115,250,'清原',1,0,NULL,2,1,NULL),(2116,250,'新宾',1,0,NULL,2,1,NULL),(2117,250,'抚顺县',1,0,NULL,2,1,NULL),(2118,251,'阜新',1,0,NULL,2,1,NULL),(2119,251,'海州区',1,0,NULL,2,1,NULL),(2120,251,'新邱区',1,0,NULL,2,1,NULL),(2121,251,'太平区',1,0,NULL,2,1,NULL),(2122,251,'清河门区',1,0,NULL,2,1,NULL),(2123,251,'细河区',1,0,NULL,2,1,NULL),(2124,251,'彰武县',1,0,NULL,2,1,NULL),(2125,252,'龙港区',1,0,NULL,2,1,NULL),(2126,252,'南票区',1,0,NULL,2,1,NULL),(2127,252,'连山区',1,0,NULL,2,1,NULL),(2128,252,'兴城市',1,0,NULL,2,1,NULL),(2129,252,'绥中县',1,0,NULL,2,1,NULL),(2130,252,'建昌县',1,0,NULL,2,1,NULL),(2131,253,'太和区',1,0,NULL,2,1,NULL),(2132,253,'古塔区',1,0,NULL,2,1,NULL),(2133,253,'凌河区',1,0,NULL,2,1,NULL),(2134,253,'凌海市',1,0,NULL,2,1,NULL),(2135,253,'北镇市',1,0,NULL,2,1,NULL),(2136,253,'黑山县',1,0,NULL,2,1,NULL),(2137,253,'义县',1,0,NULL,2,1,NULL),(2138,254,'白塔区',1,0,NULL,2,1,NULL),(2139,254,'文圣区',1,0,NULL,2,1,NULL),(2140,254,'宏伟区',1,0,NULL,2,1,NULL),(2141,254,'太子河区',1,0,NULL,2,1,NULL),(2142,254,'弓长岭区',1,0,NULL,2,1,NULL),(2143,254,'灯塔市',1,0,NULL,2,1,NULL),(2144,254,'辽阳县',1,0,NULL,2,1,NULL),(2145,255,'双台子区',1,0,NULL,2,1,NULL),(2146,255,'兴隆台区',1,0,NULL,2,1,NULL),(2147,255,'大洼县',1,0,NULL,2,1,NULL),(2148,255,'盘山县',1,0,NULL,2,1,NULL),(2149,256,'银州区',1,0,NULL,2,1,NULL),(2150,256,'清河区',1,0,NULL,2,1,NULL),(2151,256,'调兵山市',1,0,NULL,2,1,NULL),(2152,256,'开原市',1,0,NULL,2,1,NULL),(2153,256,'铁岭县',1,0,NULL,2,1,NULL),(2154,256,'西丰县',1,0,NULL,2,1,NULL),(2155,256,'昌图县',1,0,NULL,2,1,NULL),(2156,257,'站前区',1,0,NULL,2,1,NULL),(2157,257,'西市区',1,0,NULL,2,1,NULL),(2158,257,'鲅鱼圈区',1,0,NULL,2,1,NULL),(2159,257,'老边区',1,0,NULL,2,1,NULL),(2160,257,'盖州市',1,0,NULL,2,1,NULL),(2161,257,'大石桥市',1,0,NULL,2,1,NULL),(2162,258,'回民区',1,0,NULL,2,1,NULL),(2163,258,'玉泉区',1,0,NULL,2,1,NULL),(2164,258,'新城区',1,0,NULL,2,1,NULL),(2165,258,'赛罕区',1,0,NULL,2,1,NULL),(2166,258,'清水河县',1,0,NULL,2,1,NULL),(2167,258,'土默特左旗',1,0,NULL,2,1,NULL),(2168,258,'托克托县',1,0,NULL,2,1,NULL),(2169,258,'和林格尔县',1,0,NULL,2,1,NULL),(2170,258,'武川县',1,0,NULL,2,1,NULL),(2171,259,'阿拉善左旗',1,0,NULL,2,1,NULL),(2172,259,'阿拉善右旗',1,0,NULL,2,1,NULL),(2173,259,'额济纳旗',1,0,NULL,2,1,NULL),(2174,260,'临河区',1,0,NULL,2,1,NULL),(2175,260,'五原县',1,0,NULL,2,1,NULL),(2176,260,'磴口县',1,0,NULL,2,1,NULL),(2177,260,'乌拉特前旗',1,0,NULL,2,1,NULL),(2178,260,'乌拉特中旗',1,0,NULL,2,1,NULL),(2179,260,'乌拉特后旗',1,0,NULL,2,1,NULL),(2180,260,'杭锦后旗',1,0,NULL,2,1,NULL),(2181,261,'昆都仑区',1,0,NULL,2,1,NULL),(2182,261,'青山区',1,0,NULL,2,1,NULL),(2183,261,'东河区',1,0,NULL,2,1,NULL),(2184,261,'九原区',1,0,NULL,2,1,NULL),(2185,261,'石拐区',1,0,NULL,2,1,NULL),(2186,261,'白云矿区',1,0,NULL,2,1,NULL),(2187,261,'土默特右旗',1,0,NULL,2,1,NULL),(2188,261,'固阳县',1,0,NULL,2,1,NULL),(2189,261,'达尔罕茂明安联合旗',1,0,NULL,2,1,NULL),(2190,262,'红山区',1,0,NULL,2,1,NULL),(2191,262,'元宝山区',1,0,NULL,2,1,NULL),(2192,262,'松山区',1,0,NULL,2,1,NULL),(2193,262,'阿鲁科尔沁旗',1,0,NULL,2,1,NULL),(2194,262,'巴林左旗',1,0,NULL,2,1,NULL),(2195,262,'巴林右旗',1,0,NULL,2,1,NULL),(2196,262,'林西县',1,0,NULL,2,1,NULL),(2197,262,'克什克腾旗',1,0,NULL,2,1,NULL),(2198,262,'翁牛特旗',1,0,NULL,2,1,NULL),(2199,262,'喀喇沁旗',1,0,NULL,2,1,NULL),(2200,262,'宁城县',1,0,NULL,2,1,NULL),(2201,262,'敖汉旗',1,0,NULL,2,1,NULL),(2202,263,'东胜区',1,0,NULL,2,1,NULL),(2203,263,'达拉特旗',1,0,NULL,2,1,NULL),(2204,263,'准格尔旗',1,0,NULL,2,1,NULL),(2205,263,'鄂托克前旗',1,0,NULL,2,1,NULL),(2206,263,'鄂托克旗',1,0,NULL,2,1,NULL),(2207,263,'杭锦旗',1,0,NULL,2,1,NULL),(2208,263,'乌审旗',1,0,NULL,2,1,NULL),(2209,263,'伊金霍洛旗',1,0,NULL,2,1,NULL),(2210,264,'海拉尔区',1,0,NULL,2,1,NULL),(2211,264,'莫力达瓦',1,0,NULL,2,1,NULL),(2212,264,'满洲里市',1,0,NULL,2,1,NULL),(2213,264,'牙克石市',1,0,NULL,2,1,NULL),(2214,264,'扎兰屯市',1,0,NULL,2,1,NULL),(2215,264,'额尔古纳市',1,0,NULL,2,1,NULL),(2216,264,'根河市',1,0,NULL,2,1,NULL),(2217,264,'阿荣旗',1,0,NULL,2,1,NULL),(2218,264,'鄂伦春自治旗',1,0,NULL,2,1,NULL),(2219,264,'鄂温克族自治旗',1,0,NULL,2,1,NULL),(2220,264,'陈巴尔虎旗',1,0,NULL,2,1,NULL),(2221,264,'新巴尔虎左旗',1,0,NULL,2,1,NULL),(2222,264,'新巴尔虎右旗',1,0,NULL,2,1,NULL),(2223,265,'科尔沁区',1,0,NULL,2,1,NULL),(2224,265,'霍林郭勒市',1,0,NULL,2,1,NULL),(2225,265,'科尔沁左翼中旗',1,0,NULL,2,1,NULL),(2226,265,'科尔沁左翼后旗',1,0,NULL,2,1,NULL),(2227,265,'开鲁县',1,0,NULL,2,1,NULL),(2228,265,'库伦旗',1,0,NULL,2,1,NULL),(2229,265,'奈曼旗',1,0,NULL,2,1,NULL),(2230,265,'扎鲁特旗',1,0,NULL,2,1,NULL),(2231,266,'海勃湾区',1,0,NULL,2,1,NULL),(2232,266,'乌达区',1,0,NULL,2,1,NULL),(2233,266,'海南区',1,0,NULL,2,1,NULL),(2234,267,'化德县',1,0,NULL,2,1,NULL),(2235,267,'集宁区',1,0,NULL,2,1,NULL),(2236,267,'丰镇市',1,0,NULL,2,1,NULL),(2237,267,'卓资县',1,0,NULL,2,1,NULL),(2238,267,'商都县',1,0,NULL,2,1,NULL),(2239,267,'兴和县',1,0,NULL,2,1,NULL),(2240,267,'凉城县',1,0,NULL,2,1,NULL),(2241,267,'察哈尔右翼前旗',1,0,NULL,2,1,NULL),(2242,267,'察哈尔右翼中旗',1,0,NULL,2,1,NULL),(2243,267,'察哈尔右翼后旗',1,0,NULL,2,1,NULL),(2244,267,'四子王旗',1,0,NULL,2,1,NULL),(2245,268,'二连浩特市',1,0,NULL,2,1,NULL),(2246,268,'锡林浩特市',1,0,NULL,2,1,NULL),(2247,268,'阿巴嘎旗',1,0,NULL,2,1,NULL),(2248,268,'苏尼特左旗',1,0,NULL,2,1,NULL),(2249,268,'苏尼特右旗',1,0,NULL,2,1,NULL),(2250,268,'东乌珠穆沁旗',1,0,NULL,2,1,NULL),(2251,268,'西乌珠穆沁旗',1,0,NULL,2,1,NULL),(2252,268,'太仆寺旗',1,0,NULL,2,1,NULL),(2253,268,'镶黄旗',1,0,NULL,2,1,NULL),(2254,268,'正镶白旗',1,0,NULL,2,1,NULL),(2255,268,'正蓝旗',1,0,NULL,2,1,NULL),(2256,268,'多伦县',1,0,NULL,2,1,NULL),(2257,269,'乌兰浩特市',1,0,NULL,2,1,NULL),(2258,269,'阿尔山市',1,0,NULL,2,1,NULL),(2259,269,'科尔沁右翼前旗',1,0,NULL,2,1,NULL),(2260,269,'科尔沁右翼中旗',1,0,NULL,2,1,NULL),(2261,269,'扎赉特旗',1,0,NULL,2,1,NULL),(2262,269,'突泉县',1,0,NULL,2,1,NULL),(2263,270,'西夏区',1,0,NULL,2,1,NULL),(2264,270,'金凤区',1,0,NULL,2,1,NULL),(2265,270,'兴庆区',1,0,NULL,2,1,NULL),(2266,270,'灵武市',1,0,NULL,2,1,NULL),(2267,270,'永宁县',1,0,NULL,2,1,NULL),(2268,270,'贺兰县',1,0,NULL,2,1,NULL),(2269,271,'原州区',1,0,NULL,2,1,NULL),(2270,271,'海原县',1,0,NULL,2,1,NULL),(2271,271,'西吉县',1,0,NULL,2,1,NULL),(2272,271,'隆德县',1,0,NULL,2,1,NULL),(2273,271,'泾源县',1,0,NULL,2,1,NULL),(2274,271,'彭阳县',1,0,NULL,2,1,NULL),(2275,272,'惠农县',1,0,NULL,2,1,NULL),(2276,272,'大武口区',1,0,NULL,2,1,NULL),(2277,272,'惠农区',1,0,NULL,2,1,NULL),(2278,272,'陶乐县',1,0,NULL,2,1,NULL),(2279,272,'平罗县',1,0,NULL,2,1,NULL),(2280,273,'利通区',1,0,NULL,2,1,NULL),(2281,273,'中卫县',1,0,NULL,2,1,NULL),(2282,273,'青铜峡市',1,0,NULL,2,1,NULL),(2283,273,'中宁县',1,0,NULL,2,1,NULL),(2284,273,'盐池县',1,0,NULL,2,1,NULL),(2285,273,'同心县',1,0,NULL,2,1,NULL),(2286,274,'沙坡头区',1,0,NULL,2,1,NULL),(2287,274,'海原县',1,0,NULL,2,1,NULL),(2288,274,'中宁县',1,0,NULL,2,1,NULL),(2289,275,'城中区',1,0,NULL,2,1,NULL),(2290,275,'城东区',1,0,NULL,2,1,NULL),(2291,275,'城西区',1,0,NULL,2,1,NULL),(2292,275,'城北区',1,0,NULL,2,1,NULL),(2293,275,'湟中县',1,0,NULL,2,1,NULL),(2294,275,'湟源县',1,0,NULL,2,1,NULL),(2295,275,'大通',1,0,NULL,2,1,NULL),(2296,276,'玛沁县',1,0,NULL,2,1,NULL),(2297,276,'班玛县',1,0,NULL,2,1,NULL),(2298,276,'甘德县',1,0,NULL,2,1,NULL),(2299,276,'达日县',1,0,NULL,2,1,NULL),(2300,276,'久治县',1,0,NULL,2,1,NULL),(2301,276,'玛多县',1,0,NULL,2,1,NULL),(2302,277,'海晏县',1,0,NULL,2,1,NULL),(2303,277,'祁连县',1,0,NULL,2,1,NULL),(2304,277,'刚察县',1,0,NULL,2,1,NULL),(2305,277,'门源',1,0,NULL,2,1,NULL),(2306,278,'平安县',1,0,NULL,2,1,NULL),(2307,278,'乐都县',1,0,NULL,2,1,NULL),(2308,278,'民和',1,0,NULL,2,1,NULL),(2309,278,'互助',1,0,NULL,2,1,NULL),(2310,278,'化隆',1,0,NULL,2,1,NULL),(2311,278,'循化',1,0,NULL,2,1,NULL),(2312,279,'共和县',1,0,NULL,2,1,NULL),(2313,279,'同德县',1,0,NULL,2,1,NULL),(2314,279,'贵德县',1,0,NULL,2,1,NULL),(2315,279,'兴海县',1,0,NULL,2,1,NULL),(2316,279,'贵南县',1,0,NULL,2,1,NULL),(2317,280,'德令哈市',1,0,NULL,2,1,NULL),(2318,280,'格尔木市',1,0,NULL,2,1,NULL),(2319,280,'乌兰县',1,0,NULL,2,1,NULL),(2320,280,'都兰县',1,0,NULL,2,1,NULL),(2321,280,'天峻县',1,0,NULL,2,1,NULL),(2322,281,'同仁县',1,0,NULL,2,1,NULL),(2323,281,'尖扎县',1,0,NULL,2,1,NULL),(2324,281,'泽库县',1,0,NULL,2,1,NULL),(2325,281,'河南蒙古族自治县',1,0,NULL,2,1,NULL),(2326,282,'玉树县',1,0,NULL,2,1,NULL),(2327,282,'杂多县',1,0,NULL,2,1,NULL),(2328,282,'称多县',1,0,NULL,2,1,NULL),(2329,282,'治多县',1,0,NULL,2,1,NULL),(2330,282,'囊谦县',1,0,NULL,2,1,NULL),(2331,282,'曲麻莱县',1,0,NULL,2,1,NULL),(2332,283,'市中区',1,0,NULL,2,1,NULL),(2333,283,'历下区',1,0,NULL,2,1,NULL),(2334,283,'天桥区',1,0,NULL,2,1,NULL),(2335,283,'槐荫区',1,0,NULL,2,1,NULL),(2336,283,'历城区',1,0,NULL,2,1,NULL),(2337,283,'长清区',1,0,NULL,2,1,NULL),(2338,283,'章丘市',1,0,NULL,2,1,NULL),(2339,283,'平阴县',1,0,NULL,2,1,NULL),(2340,283,'济阳县',1,0,NULL,2,1,NULL),(2341,283,'商河县',1,0,NULL,2,1,NULL),(2342,284,'市南区',1,0,NULL,2,1,NULL),(2343,284,'市北区',1,0,NULL,2,1,NULL),(2344,284,'城阳区',1,0,NULL,2,1,NULL),(2345,284,'四方区',1,0,NULL,2,1,NULL),(2346,284,'李沧区',1,0,NULL,2,1,NULL),(2347,284,'黄岛区',1,0,NULL,2,1,NULL),(2348,284,'崂山区',1,0,NULL,2,1,NULL),(2349,284,'胶州市',1,0,NULL,2,1,NULL),(2350,284,'即墨市',1,0,NULL,2,1,NULL),(2351,284,'平度市',1,0,NULL,2,1,NULL),(2352,284,'胶南市',1,0,NULL,2,1,NULL),(2353,284,'莱西市',1,0,NULL,2,1,NULL),(2354,285,'滨城区',1,0,NULL,2,1,NULL),(2355,285,'惠民县',1,0,NULL,2,1,NULL),(2356,285,'阳信县',1,0,NULL,2,1,NULL),(2357,285,'无棣县',1,0,NULL,2,1,NULL),(2358,285,'沾化县',1,0,NULL,2,1,NULL),(2359,285,'博兴县',1,0,NULL,2,1,NULL),(2360,285,'邹平县',1,0,NULL,2,1,NULL),(2361,286,'德城区',1,0,NULL,2,1,NULL),(2362,286,'陵县',1,0,NULL,2,1,NULL),(2363,286,'乐陵市',1,0,NULL,2,1,NULL),(2364,286,'禹城市',1,0,NULL,2,1,NULL),(2365,286,'宁津县',1,0,NULL,2,1,NULL),(2366,286,'庆云县',1,0,NULL,2,1,NULL),(2367,286,'临邑县',1,0,NULL,2,1,NULL),(2368,286,'齐河县',1,0,NULL,2,1,NULL),(2369,286,'平原县',1,0,NULL,2,1,NULL),(2370,286,'夏津县',1,0,NULL,2,1,NULL),(2371,286,'武城县',1,0,NULL,2,1,NULL),(2372,287,'东营区',1,0,NULL,2,1,NULL),(2373,287,'河口区',1,0,NULL,2,1,NULL),(2374,287,'垦利县',1,0,NULL,2,1,NULL),(2375,287,'利津县',1,0,NULL,2,1,NULL),(2376,287,'广饶县',1,0,NULL,2,1,NULL),(2377,288,'牡丹区',1,0,NULL,2,1,NULL),(2378,288,'曹县',1,0,NULL,2,1,NULL),(2379,288,'单县',1,0,NULL,2,1,NULL),(2380,288,'成武县',1,0,NULL,2,1,NULL),(2381,288,'巨野县',1,0,NULL,2,1,NULL),(2382,288,'郓城县',1,0,NULL,2,1,NULL),(2383,288,'鄄城县',1,0,NULL,2,1,NULL),(2384,288,'定陶县',1,0,NULL,2,1,NULL),(2385,288,'东明县',1,0,NULL,2,1,NULL),(2386,289,'市中区',1,0,NULL,2,1,NULL),(2387,289,'任城区',1,0,NULL,2,1,NULL),(2388,289,'曲阜市',1,0,NULL,2,1,NULL),(2389,289,'兖州市',1,0,NULL,2,1,NULL),(2390,289,'邹城市',1,0,NULL,2,1,NULL),(2391,289,'微山县',1,0,NULL,2,1,NULL),(2392,289,'鱼台县',1,0,NULL,2,1,NULL),(2393,289,'金乡县',1,0,NULL,2,1,NULL),(2394,289,'嘉祥县',1,0,NULL,2,1,NULL),(2395,289,'汶上县',1,0,NULL,2,1,NULL),(2396,289,'泗水县',1,0,NULL,2,1,NULL),(2397,289,'梁山县',1,0,NULL,2,1,NULL),(2398,290,'莱城区',1,0,NULL,2,1,NULL),(2399,290,'钢城区',1,0,NULL,2,1,NULL),(2400,291,'东昌府区',1,0,NULL,2,1,NULL),(2401,291,'临清市',1,0,NULL,2,1,NULL),(2402,291,'阳谷县',1,0,NULL,2,1,NULL),(2403,291,'莘县',1,0,NULL,2,1,NULL),(2404,291,'茌平县',1,0,NULL,2,1,NULL),(2405,291,'东阿县',1,0,NULL,2,1,NULL),(2406,291,'冠县',1,0,NULL,2,1,NULL),(2407,291,'高唐县',1,0,NULL,2,1,NULL),(2408,292,'兰山区',1,0,NULL,2,1,NULL),(2409,292,'罗庄区',1,0,NULL,2,1,NULL),(2410,292,'河东区',1,0,NULL,2,1,NULL),(2411,292,'沂南县',1,0,NULL,2,1,NULL),(2412,292,'郯城县',1,0,NULL,2,1,NULL),(2413,292,'沂水县',1,0,NULL,2,1,NULL),(2414,292,'苍山县',1,0,NULL,2,1,NULL),(2415,292,'费县',1,0,NULL,2,1,NULL),(2416,292,'平邑县',1,0,NULL,2,1,NULL),(2417,292,'莒南县',1,0,NULL,2,1,NULL),(2418,292,'蒙阴县',1,0,NULL,2,1,NULL),(2419,292,'临沭县',1,0,NULL,2,1,NULL),(2420,293,'东港区',1,0,NULL,2,1,NULL),(2421,293,'岚山区',1,0,NULL,2,1,NULL),(2422,293,'五莲县',1,0,NULL,2,1,NULL),(2423,293,'莒县',1,0,NULL,2,1,NULL),(2424,294,'泰山区',1,0,NULL,2,1,NULL),(2425,294,'岱岳区',1,0,NULL,2,1,NULL),(2426,294,'新泰市',1,0,NULL,2,1,NULL),(2427,294,'肥城市',1,0,NULL,2,1,NULL),(2428,294,'宁阳县',1,0,NULL,2,1,NULL),(2429,294,'东平县',1,0,NULL,2,1,NULL),(2430,295,'荣成市',1,0,NULL,2,1,NULL),(2431,295,'乳山市',1,0,NULL,2,1,NULL),(2432,295,'环翠区',1,0,NULL,2,1,NULL),(2433,295,'文登市',1,0,NULL,2,1,NULL),(2434,296,'潍城区',1,0,NULL,2,1,NULL),(2435,296,'寒亭区',1,0,NULL,2,1,NULL),(2436,296,'坊子区',1,0,NULL,2,1,NULL),(2437,296,'奎文区',1,0,NULL,2,1,NULL),(2438,296,'青州市',1,0,NULL,2,1,NULL),(2439,296,'诸城市',1,0,NULL,2,1,NULL),(2440,296,'寿光市',1,0,NULL,2,1,NULL),(2441,296,'安丘市',1,0,NULL,2,1,NULL),(2442,296,'高密市',1,0,NULL,2,1,NULL),(2443,296,'昌邑市',1,0,NULL,2,1,NULL),(2444,296,'临朐县',1,0,NULL,2,1,NULL),(2445,296,'昌乐县',1,0,NULL,2,1,NULL),(2446,297,'芝罘区',1,0,NULL,2,1,NULL),(2447,297,'福山区',1,0,NULL,2,1,NULL),(2448,297,'牟平区',1,0,NULL,2,1,NULL),(2449,297,'莱山区',1,0,NULL,2,1,NULL),(2450,297,'开发区',1,0,NULL,2,1,NULL),(2451,297,'龙口市',1,0,NULL,2,1,NULL),(2452,297,'莱阳市',1,0,NULL,2,1,NULL),(2453,297,'莱州市',1,0,NULL,2,1,NULL),(2454,297,'蓬莱市',1,0,NULL,2,1,NULL),(2455,297,'招远市',1,0,NULL,2,1,NULL),(2456,297,'栖霞市',1,0,NULL,2,1,NULL),(2457,297,'海阳市',1,0,NULL,2,1,NULL),(2458,297,'长岛县',1,0,NULL,2,1,NULL),(2459,298,'市中区',1,0,NULL,2,1,NULL),(2460,298,'山亭区',1,0,NULL,2,1,NULL),(2461,298,'峄城区',1,0,NULL,2,1,NULL),(2462,298,'台儿庄区',1,0,NULL,2,1,NULL),(2463,298,'薛城区',1,0,NULL,2,1,NULL),(2464,298,'滕州市',1,0,NULL,2,1,NULL),(2465,299,'张店区',1,0,NULL,2,1,NULL),(2466,299,'临淄区',1,0,NULL,2,1,NULL),(2467,299,'淄川区',1,0,NULL,2,1,NULL),(2468,299,'博山区',1,0,NULL,2,1,NULL),(2469,299,'周村区',1,0,NULL,2,1,NULL),(2470,299,'桓台县',1,0,NULL,2,1,NULL),(2471,299,'高青县',1,0,NULL,2,1,NULL),(2472,299,'沂源县',1,0,NULL,2,1,NULL),(2473,300,'杏花岭区',1,0,NULL,2,1,NULL),(2474,300,'小店区',1,0,NULL,2,1,NULL),(2475,300,'迎泽区',1,0,NULL,2,1,NULL),(2476,300,'尖草坪区',1,0,NULL,2,1,NULL),(2477,300,'万柏林区',1,0,NULL,2,1,NULL),(2478,300,'晋源区',1,0,NULL,2,1,NULL),(2479,300,'高新开发区',1,0,NULL,2,1,NULL),(2480,300,'民营经济开发区',1,0,NULL,2,1,NULL),(2481,300,'经济技术开发区',1,0,NULL,2,1,NULL),(2482,300,'清徐县',1,0,NULL,2,1,NULL),(2483,300,'阳曲县',1,0,NULL,2,1,NULL),(2484,300,'娄烦县',1,0,NULL,2,1,NULL),(2485,300,'古交市',1,0,NULL,2,1,NULL),(2486,301,'城区',1,0,NULL,2,1,NULL),(2487,301,'郊区',1,0,NULL,2,1,NULL),(2488,301,'沁县',1,0,NULL,2,1,NULL),(2489,301,'潞城市',1,0,NULL,2,1,NULL),(2490,301,'长治县',1,0,NULL,2,1,NULL),(2491,301,'襄垣县',1,0,NULL,2,1,NULL),(2492,301,'屯留县',1,0,NULL,2,1,NULL),(2493,301,'平顺县',1,0,NULL,2,1,NULL),(2494,301,'黎城县',1,0,NULL,2,1,NULL),(2495,301,'壶关县',1,0,NULL,2,1,NULL),(2496,301,'长子县',1,0,NULL,2,1,NULL),(2497,301,'武乡县',1,0,NULL,2,1,NULL),(2498,301,'沁源县',1,0,NULL,2,1,NULL),(2499,302,'城区',1,0,NULL,2,1,NULL),(2500,302,'矿区',1,0,NULL,2,1,NULL),(2501,302,'南郊区',1,0,NULL,2,1,NULL),(2502,302,'新荣区',1,0,NULL,2,1,NULL),(2503,302,'阳高县',1,0,NULL,2,1,NULL),(2504,302,'天镇县',1,0,NULL,2,1,NULL),(2505,302,'广灵县',1,0,NULL,2,1,NULL),(2506,302,'灵丘县',1,0,NULL,2,1,NULL),(2507,302,'浑源县',1,0,NULL,2,1,NULL),(2508,302,'左云县',1,0,NULL,2,1,NULL),(2509,302,'大同县',1,0,NULL,2,1,NULL),(2510,303,'城区',1,0,NULL,2,1,NULL),(2511,303,'高平市',1,0,NULL,2,1,NULL),(2512,303,'沁水县',1,0,NULL,2,1,NULL),(2513,303,'阳城县',1,0,NULL,2,1,NULL),(2514,303,'陵川县',1,0,NULL,2,1,NULL),(2515,303,'泽州县',1,0,NULL,2,1,NULL),(2516,304,'榆次区',1,0,NULL,2,1,NULL),(2517,304,'介休市',1,0,NULL,2,1,NULL),(2518,304,'榆社县',1,0,NULL,2,1,NULL),(2519,304,'左权县',1,0,NULL,2,1,NULL),(2520,304,'和顺县',1,0,NULL,2,1,NULL),(2521,304,'昔阳县',1,0,NULL,2,1,NULL),(2522,304,'寿阳县',1,0,NULL,2,1,NULL),(2523,304,'太谷县',1,0,NULL,2,1,NULL),(2524,304,'祁县',1,0,NULL,2,1,NULL),(2525,304,'平遥县',1,0,NULL,2,1,NULL),(2526,304,'灵石县',1,0,NULL,2,1,NULL),(2527,305,'尧都区',1,0,NULL,2,1,NULL),(2528,305,'侯马市',1,0,NULL,2,1,NULL),(2529,305,'霍州市',1,0,NULL,2,1,NULL),(2530,305,'曲沃县',1,0,NULL,2,1,NULL),(2531,305,'翼城县',1,0,NULL,2,1,NULL),(2532,305,'襄汾县',1,0,NULL,2,1,NULL),(2533,305,'洪洞县',1,0,NULL,2,1,NULL),(2534,305,'吉县',1,0,NULL,2,1,NULL),(2535,305,'安泽县',1,0,NULL,2,1,NULL),(2536,305,'浮山县',1,0,NULL,2,1,NULL),(2537,305,'古县',1,0,NULL,2,1,NULL),(2538,305,'乡宁县',1,0,NULL,2,1,NULL),(2539,305,'大宁县',1,0,NULL,2,1,NULL),(2540,305,'隰县',1,0,NULL,2,1,NULL),(2541,305,'永和县',1,0,NULL,2,1,NULL),(2542,305,'蒲县',1,0,NULL,2,1,NULL),(2543,305,'汾西县',1,0,NULL,2,1,NULL),(2544,306,'离石市',1,0,NULL,2,1,NULL),(2545,306,'离石区',1,0,NULL,2,1,NULL),(2546,306,'孝义市',1,0,NULL,2,1,NULL),(2547,306,'汾阳市',1,0,NULL,2,1,NULL),(2548,306,'文水县',1,0,NULL,2,1,NULL),(2549,306,'交城县',1,0,NULL,2,1,NULL),(2550,306,'兴县',1,0,NULL,2,1,NULL),(2551,306,'临县',1,0,NULL,2,1,NULL),(2552,306,'柳林县',1,0,NULL,2,1,NULL),(2553,306,'石楼县',1,0,NULL,2,1,NULL),(2554,306,'岚县',1,0,NULL,2,1,NULL),(2555,306,'方山县',1,0,NULL,2,1,NULL),(2556,306,'中阳县',1,0,NULL,2,1,NULL),(2557,306,'交口县',1,0,NULL,2,1,NULL),(2558,307,'朔城区',1,0,NULL,2,1,NULL),(2559,307,'平鲁区',1,0,NULL,2,1,NULL),(2560,307,'山阴县',1,0,NULL,2,1,NULL),(2561,307,'应县',1,0,NULL,2,1,NULL),(2562,307,'右玉县',1,0,NULL,2,1,NULL),(2563,307,'怀仁县',1,0,NULL,2,1,NULL),(2564,308,'忻府区',1,0,NULL,2,1,NULL),(2565,308,'原平市',1,0,NULL,2,1,NULL),(2566,308,'定襄县',1,0,NULL,2,1,NULL),(2567,308,'五台县',1,0,NULL,2,1,NULL),(2568,308,'代县',1,0,NULL,2,1,NULL),(2569,308,'繁峙县',1,0,NULL,2,1,NULL),(2570,308,'宁武县',1,0,NULL,2,1,NULL),(2571,308,'静乐县',1,0,NULL,2,1,NULL),(2572,308,'神池县',1,0,NULL,2,1,NULL),(2573,308,'五寨县',1,0,NULL,2,1,NULL),(2574,308,'岢岚县',1,0,NULL,2,1,NULL),(2575,308,'河曲县',1,0,NULL,2,1,NULL),(2576,308,'保德县',1,0,NULL,2,1,NULL),(2577,308,'偏关县',1,0,NULL,2,1,NULL),(2578,309,'城区',1,0,NULL,2,1,NULL),(2579,309,'矿区',1,0,NULL,2,1,NULL),(2580,309,'郊区',1,0,NULL,2,1,NULL),(2581,309,'平定县',1,0,NULL,2,1,NULL),(2582,309,'盂县',1,0,NULL,2,1,NULL),(2583,310,'盐湖区',1,0,NULL,2,1,NULL),(2584,310,'永济市',1,0,NULL,2,1,NULL),(2585,310,'河津市',1,0,NULL,2,1,NULL),(2586,310,'临猗县',1,0,NULL,2,1,NULL),(2587,310,'万荣县',1,0,NULL,2,1,NULL),(2588,310,'闻喜县',1,0,NULL,2,1,NULL),(2589,310,'稷山县',1,0,NULL,2,1,NULL),(2590,310,'新绛县',1,0,NULL,2,1,NULL),(2591,310,'绛县',1,0,NULL,2,1,NULL),(2592,310,'垣曲县',1,0,NULL,2,1,NULL),(2593,310,'夏县',1,0,NULL,2,1,NULL),(2594,310,'平陆县',1,0,NULL,2,1,NULL),(2595,310,'芮城县',1,0,NULL,2,1,NULL),(2596,311,'莲湖区',1,0,NULL,2,1,NULL),(2597,311,'新城区',1,0,NULL,2,1,NULL),(2598,311,'碑林区',1,0,NULL,2,1,NULL),(2599,311,'雁塔区',1,0,NULL,2,1,NULL),(2600,311,'灞桥区',1,0,NULL,2,1,NULL),(2601,311,'未央区',1,0,NULL,2,1,NULL),(2602,311,'阎良区',1,0,NULL,2,1,NULL),(2603,311,'临潼区',1,0,NULL,2,1,NULL),(2604,311,'长安区',1,0,NULL,2,1,NULL),(2605,311,'蓝田县',1,0,NULL,2,1,NULL),(2606,311,'周至县',1,0,NULL,2,1,NULL),(2607,311,'户县',1,0,NULL,2,1,NULL),(2608,311,'高陵县',1,0,NULL,2,1,NULL),(2609,312,'汉滨区',1,0,NULL,2,1,NULL),(2610,312,'汉阴县',1,0,NULL,2,1,NULL),(2611,312,'石泉县',1,0,NULL,2,1,NULL),(2612,312,'宁陕县',1,0,NULL,2,1,NULL),(2613,312,'紫阳县',1,0,NULL,2,1,NULL),(2614,312,'岚皋县',1,0,NULL,2,1,NULL),(2615,312,'平利县',1,0,NULL,2,1,NULL),(2616,312,'镇坪县',1,0,NULL,2,1,NULL),(2617,312,'旬阳县',1,0,NULL,2,1,NULL),(2618,312,'白河县',1,0,NULL,2,1,NULL),(2619,313,'陈仓区',1,0,NULL,2,1,NULL),(2620,313,'渭滨区',1,0,NULL,2,1,NULL),(2621,313,'金台区',1,0,NULL,2,1,NULL),(2622,313,'凤翔县',1,0,NULL,2,1,NULL),(2623,313,'岐山县',1,0,NULL,2,1,NULL),(2624,313,'扶风县',1,0,NULL,2,1,NULL),(2625,313,'眉县',1,0,NULL,2,1,NULL),(2626,313,'陇县',1,0,NULL,2,1,NULL),(2627,313,'千阳县',1,0,NULL,2,1,NULL),(2628,313,'麟游县',1,0,NULL,2,1,NULL),(2629,313,'凤县',1,0,NULL,2,1,NULL),(2630,313,'太白县',1,0,NULL,2,1,NULL),(2631,314,'汉台区',1,0,NULL,2,1,NULL),(2632,314,'南郑县',1,0,NULL,2,1,NULL),(2633,314,'城固县',1,0,NULL,2,1,NULL),(2634,314,'洋县',1,0,NULL,2,1,NULL),(2635,314,'西乡县',1,0,NULL,2,1,NULL),(2636,314,'勉县',1,0,NULL,2,1,NULL),(2637,314,'宁强县',1,0,NULL,2,1,NULL),(2638,314,'略阳县',1,0,NULL,2,1,NULL),(2639,314,'镇巴县',1,0,NULL,2,1,NULL),(2640,314,'留坝县',1,0,NULL,2,1,NULL),(2641,314,'佛坪县',1,0,NULL,2,1,NULL),(2642,315,'商州区',1,0,NULL,2,1,NULL),(2643,315,'洛南县',1,0,NULL,2,1,NULL),(2644,315,'丹凤县',1,0,NULL,2,1,NULL),(2645,315,'商南县',1,0,NULL,2,1,NULL),(2646,315,'山阳县',1,0,NULL,2,1,NULL),(2647,315,'镇安县',1,0,NULL,2,1,NULL),(2648,315,'柞水县',1,0,NULL,2,1,NULL),(2649,316,'耀州区',1,0,NULL,2,1,NULL),(2650,316,'王益区',1,0,NULL,2,1,NULL),(2651,316,'印台区',1,0,NULL,2,1,NULL),(2652,316,'宜君县',1,0,NULL,2,1,NULL),(2653,317,'临渭区',1,0,NULL,2,1,NULL),(2654,317,'韩城市',1,0,NULL,2,1,NULL),(2655,317,'华阴市',1,0,NULL,2,1,NULL),(2656,317,'华县',1,0,NULL,2,1,NULL),(2657,317,'潼关县',1,0,NULL,2,1,NULL),(2658,317,'大荔县',1,0,NULL,2,1,NULL),(2659,317,'合阳县',1,0,NULL,2,1,NULL),(2660,317,'澄城县',1,0,NULL,2,1,NULL),(2661,317,'蒲城县',1,0,NULL,2,1,NULL),(2662,317,'白水县',1,0,NULL,2,1,NULL),(2663,317,'富平县',1,0,NULL,2,1,NULL),(2664,318,'秦都区',1,0,NULL,2,1,NULL),(2665,318,'渭城区',1,0,NULL,2,1,NULL),(2666,318,'杨陵区',1,0,NULL,2,1,NULL),(2667,318,'兴平市',1,0,NULL,2,1,NULL),(2668,318,'三原县',1,0,NULL,2,1,NULL),(2669,318,'泾阳县',1,0,NULL,2,1,NULL),(2670,318,'乾县',1,0,NULL,2,1,NULL),(2671,318,'礼泉县',1,0,NULL,2,1,NULL),(2672,318,'永寿县',1,0,NULL,2,1,NULL),(2673,318,'彬县',1,0,NULL,2,1,NULL),(2674,318,'长武县',1,0,NULL,2,1,NULL),(2675,318,'旬邑县',1,0,NULL,2,1,NULL),(2676,318,'淳化县',1,0,NULL,2,1,NULL),(2677,318,'武功县',1,0,NULL,2,1,NULL),(2678,319,'吴起县',1,0,NULL,2,1,NULL),(2679,319,'宝塔区',1,0,NULL,2,1,NULL),(2680,319,'延长县',1,0,NULL,2,1,NULL),(2681,319,'延川县',1,0,NULL,2,1,NULL),(2682,319,'子长县',1,0,NULL,2,1,NULL),(2683,319,'安塞县',1,0,NULL,2,1,NULL),(2684,319,'志丹县',1,0,NULL,2,1,NULL),(2685,319,'甘泉县',1,0,NULL,2,1,NULL),(2686,319,'富县',1,0,NULL,2,1,NULL),(2687,319,'洛川县',1,0,NULL,2,1,NULL),(2688,319,'宜川县',1,0,NULL,2,1,NULL),(2689,319,'黄龙县',1,0,NULL,2,1,NULL),(2690,319,'黄陵县',1,0,NULL,2,1,NULL),(2691,320,'榆阳区',1,0,NULL,2,1,NULL),(2692,320,'神木县',1,0,NULL,2,1,NULL),(2693,320,'府谷县',1,0,NULL,2,1,NULL),(2694,320,'横山县',1,0,NULL,2,1,NULL),(2695,320,'靖边县',1,0,NULL,2,1,NULL),(2696,320,'定边县',1,0,NULL,2,1,NULL),(2697,320,'绥德县',1,0,NULL,2,1,NULL),(2698,320,'米脂县',1,0,NULL,2,1,NULL),(2699,320,'佳县',1,0,NULL,2,1,NULL),(2700,320,'吴堡县',1,0,NULL,2,1,NULL),(2701,320,'清涧县',1,0,NULL,2,1,NULL),(2702,320,'子洲县',1,0,NULL,2,1,NULL),(2703,321,'长宁区',1,0,NULL,2,1,NULL),(2704,321,'闸北区',1,0,NULL,2,1,NULL),(2705,321,'闵行区',1,0,NULL,2,1,NULL),(2706,321,'徐汇区',1,0,NULL,2,1,NULL),(2707,321,'浦东新区',1,0,NULL,2,1,NULL),(2708,321,'杨浦区',1,0,NULL,2,1,NULL),(2709,321,'普陀区',1,0,NULL,2,1,NULL),(2710,321,'静安区',1,0,NULL,2,1,NULL),(2711,321,'卢湾区',1,0,NULL,2,1,NULL),(2712,321,'虹口区',1,0,NULL,2,1,NULL),(2713,321,'黄浦区',1,0,NULL,2,1,NULL),(2714,321,'南汇区',1,0,NULL,2,1,NULL),(2715,321,'松江区',1,0,NULL,2,1,NULL),(2716,321,'嘉定区',1,0,NULL,2,1,NULL),(2717,321,'宝山区',1,0,NULL,2,1,NULL),(2718,321,'青浦区',1,0,NULL,2,1,NULL),(2719,321,'金山区',1,0,NULL,2,1,NULL),(2720,321,'奉贤区',1,0,NULL,2,1,NULL),(2721,321,'崇明县',1,0,NULL,2,1,NULL),(2722,322,'青羊区',1,0,NULL,2,1,NULL),(2723,322,'锦江区',1,0,NULL,2,1,NULL),(2724,322,'金牛区',1,0,NULL,2,1,NULL),(2725,322,'武侯区',1,0,NULL,2,1,NULL),(2726,322,'成华区',1,0,NULL,2,1,NULL),(2727,322,'龙泉驿区',1,0,NULL,2,1,NULL),(2728,322,'青白江区',1,0,NULL,2,1,NULL),(2729,322,'新都区',1,0,NULL,2,1,NULL),(2730,322,'温江区',1,0,NULL,2,1,NULL),(2731,322,'高新区',1,0,NULL,2,1,NULL),(2732,322,'高新西区',1,0,NULL,2,1,NULL),(2733,322,'都江堰市',1,0,NULL,2,1,NULL),(2734,322,'彭州市',1,0,NULL,2,1,NULL),(2735,322,'邛崃市',1,0,NULL,2,1,NULL),(2736,322,'崇州市',1,0,NULL,2,1,NULL),(2737,322,'金堂县',1,0,NULL,2,1,NULL),(2738,322,'双流县',1,0,NULL,2,1,NULL),(2739,322,'郫县',1,0,NULL,2,1,NULL),(2740,322,'大邑县',1,0,NULL,2,1,NULL),(2741,322,'蒲江县',1,0,NULL,2,1,NULL),(2742,322,'新津县',1,0,NULL,2,1,NULL),(2743,322,'都江堰市',1,0,NULL,2,1,NULL),(2744,322,'彭州市',1,0,NULL,2,1,NULL),(2745,322,'邛崃市',1,0,NULL,2,1,NULL),(2746,322,'崇州市',1,0,NULL,2,1,NULL),(2747,322,'金堂县',1,0,NULL,2,1,NULL),(2748,322,'双流县',1,0,NULL,2,1,NULL),(2749,322,'郫县',1,0,NULL,2,1,NULL),(2750,322,'大邑县',1,0,NULL,2,1,NULL),(2751,322,'蒲江县',1,0,NULL,2,1,NULL),(2752,322,'新津县',1,0,NULL,2,1,NULL),(2753,323,'涪城区',1,0,NULL,2,1,NULL),(2754,323,'游仙区',1,0,NULL,2,1,NULL),(2755,323,'江油市',1,0,NULL,2,1,NULL),(2756,323,'盐亭县',1,0,NULL,2,1,NULL),(2757,323,'三台县',1,0,NULL,2,1,NULL),(2758,323,'平武县',1,0,NULL,2,1,NULL),(2759,323,'安县',1,0,NULL,2,1,NULL),(2760,323,'梓潼县',1,0,NULL,2,1,NULL),(2761,323,'北川县',1,0,NULL,2,1,NULL),(2762,324,'马尔康县',1,0,NULL,2,1,NULL),(2763,324,'汶川县',1,0,NULL,2,1,NULL),(2764,324,'理县',1,0,NULL,2,1,NULL),(2765,324,'茂县',1,0,NULL,2,1,NULL),(2766,324,'松潘县',1,0,NULL,2,1,NULL),(2767,324,'九寨沟县',1,0,NULL,2,1,NULL),(2768,324,'金川县',1,0,NULL,2,1,NULL),(2769,324,'小金县',1,0,NULL,2,1,NULL),(2770,324,'黑水县',1,0,NULL,2,1,NULL),(2771,324,'壤塘县',1,0,NULL,2,1,NULL),(2772,324,'阿坝县',1,0,NULL,2,1,NULL),(2773,324,'若尔盖县',1,0,NULL,2,1,NULL),(2774,324,'红原县',1,0,NULL,2,1,NULL),(2775,325,'巴州区',1,0,NULL,2,1,NULL),(2776,325,'通江县',1,0,NULL,2,1,NULL),(2777,325,'南江县',1,0,NULL,2,1,NULL),(2778,325,'平昌县',1,0,NULL,2,1,NULL),(2779,326,'通川区',1,0,NULL,2,1,NULL),(2780,326,'万源市',1,0,NULL,2,1,NULL),(2781,326,'达县',1,0,NULL,2,1,NULL),(2782,326,'宣汉县',1,0,NULL,2,1,NULL),(2783,326,'开江县',1,0,NULL,2,1,NULL),(2784,326,'大竹县',1,0,NULL,2,1,NULL),(2785,326,'渠县',1,0,NULL,2,1,NULL),(2786,327,'旌阳区',1,0,NULL,2,1,NULL),(2787,327,'广汉市',1,0,NULL,2,1,NULL),(2788,327,'什邡市',1,0,NULL,2,1,NULL),(2789,327,'绵竹市',1,0,NULL,2,1,NULL),(2790,327,'罗江县',1,0,NULL,2,1,NULL),(2791,327,'中江县',1,0,NULL,2,1,NULL),(2792,328,'康定县',1,0,NULL,2,1,NULL),(2793,328,'丹巴县',1,0,NULL,2,1,NULL),(2794,328,'泸定县',1,0,NULL,2,1,NULL),(2795,328,'炉霍县',1,0,NULL,2,1,NULL),(2796,328,'九龙县',1,0,NULL,2,1,NULL),(2797,328,'甘孜县',1,0,NULL,2,1,NULL),(2798,328,'雅江县',1,0,NULL,2,1,NULL),(2799,328,'新龙县',1,0,NULL,2,1,NULL),(2800,328,'道孚县',1,0,NULL,2,1,NULL),(2801,328,'白玉县',1,0,NULL,2,1,NULL),(2802,328,'理塘县',1,0,NULL,2,1,NULL),(2803,328,'德格县',1,0,NULL,2,1,NULL),(2804,328,'乡城县',1,0,NULL,2,1,NULL),(2805,328,'石渠县',1,0,NULL,2,1,NULL),(2806,328,'稻城县',1,0,NULL,2,1,NULL),(2807,328,'色达县',1,0,NULL,2,1,NULL),(2808,328,'巴塘县',1,0,NULL,2,1,NULL),(2809,328,'得荣县',1,0,NULL,2,1,NULL),(2810,329,'广安区',1,0,NULL,2,1,NULL),(2811,329,'华蓥市',1,0,NULL,2,1,NULL),(2812,329,'岳池县',1,0,NULL,2,1,NULL),(2813,329,'武胜县',1,0,NULL,2,1,NULL),(2814,329,'邻水县',1,0,NULL,2,1,NULL),(2815,330,'利州区',1,0,NULL,2,1,NULL),(2816,330,'元坝区',1,0,NULL,2,1,NULL),(2817,330,'朝天区',1,0,NULL,2,1,NULL),(2818,330,'旺苍县',1,0,NULL,2,1,NULL),(2819,330,'青川县',1,0,NULL,2,1,NULL),(2820,330,'剑阁县',1,0,NULL,2,1,NULL),(2821,330,'苍溪县',1,0,NULL,2,1,NULL),(2822,331,'峨眉山市',1,0,NULL,2,1,NULL),(2823,331,'乐山市',1,0,NULL,2,1,NULL),(2824,331,'犍为县',1,0,NULL,2,1,NULL),(2825,331,'井研县',1,0,NULL,2,1,NULL),(2826,331,'夹江县',1,0,NULL,2,1,NULL),(2827,331,'沐川县',1,0,NULL,2,1,NULL),(2828,331,'峨边',1,0,NULL,2,1,NULL),(2829,331,'马边',1,0,NULL,2,1,NULL),(2830,332,'西昌市',1,0,NULL,2,1,NULL),(2831,332,'盐源县',1,0,NULL,2,1,NULL),(2832,332,'德昌县',1,0,NULL,2,1,NULL),(2833,332,'会理县',1,0,NULL,2,1,NULL),(2834,332,'会东县',1,0,NULL,2,1,NULL),(2835,332,'宁南县',1,0,NULL,2,1,NULL),(2836,332,'普格县',1,0,NULL,2,1,NULL),(2837,332,'布拖县',1,0,NULL,2,1,NULL),(2838,332,'金阳县',1,0,NULL,2,1,NULL),(2839,332,'昭觉县',1,0,NULL,2,1,NULL),(2840,332,'喜德县',1,0,NULL,2,1,NULL),(2841,332,'冕宁县',1,0,NULL,2,1,NULL),(2842,332,'越西县',1,0,NULL,2,1,NULL),(2843,332,'甘洛县',1,0,NULL,2,1,NULL),(2844,332,'美姑县',1,0,NULL,2,1,NULL),(2845,332,'雷波县',1,0,NULL,2,1,NULL),(2846,332,'木里',1,0,NULL,2,1,NULL),(2847,333,'东坡区',1,0,NULL,2,1,NULL),(2848,333,'仁寿县',1,0,NULL,2,1,NULL),(2849,333,'彭山县',1,0,NULL,2,1,NULL),(2850,333,'洪雅县',1,0,NULL,2,1,NULL),(2851,333,'丹棱县',1,0,NULL,2,1,NULL),(2852,333,'青神县',1,0,NULL,2,1,NULL),(2853,334,'阆中市',1,0,NULL,2,1,NULL),(2854,334,'南部县',1,0,NULL,2,1,NULL),(2855,334,'营山县',1,0,NULL,2,1,NULL),(2856,334,'蓬安县',1,0,NULL,2,1,NULL),(2857,334,'仪陇县',1,0,NULL,2,1,NULL),(2858,334,'顺庆区',1,0,NULL,2,1,NULL),(2859,334,'高坪区',1,0,NULL,2,1,NULL),(2860,334,'嘉陵区',1,0,NULL,2,1,NULL),(2861,334,'西充县',1,0,NULL,2,1,NULL),(2862,335,'市中区',1,0,NULL,2,1,NULL),(2863,335,'东兴区',1,0,NULL,2,1,NULL),(2864,335,'威远县',1,0,NULL,2,1,NULL),(2865,335,'资中县',1,0,NULL,2,1,NULL),(2866,335,'隆昌县',1,0,NULL,2,1,NULL),(2867,336,'东  区',1,0,NULL,2,1,NULL),(2868,336,'西  区',1,0,NULL,2,1,NULL),(2869,336,'仁和区',1,0,NULL,2,1,NULL),(2870,336,'米易县',1,0,NULL,2,1,NULL),(2871,336,'盐边县',1,0,NULL,2,1,NULL),(2872,337,'船山区',1,0,NULL,2,1,NULL),(2873,337,'安居区',1,0,NULL,2,1,NULL),(2874,337,'蓬溪县',1,0,NULL,2,1,NULL),(2875,337,'射洪县',1,0,NULL,2,1,NULL),(2876,337,'大英县',1,0,NULL,2,1,NULL),(2877,338,'雨城区',1,0,NULL,2,1,NULL),(2878,338,'名山县',1,0,NULL,2,1,NULL),(2879,338,'荥经县',1,0,NULL,2,1,NULL),(2880,338,'汉源县',1,0,NULL,2,1,NULL),(2881,338,'石棉县',1,0,NULL,2,1,NULL),(2882,338,'天全县',1,0,NULL,2,1,NULL),(2883,338,'芦山县',1,0,NULL,2,1,NULL),(2884,338,'宝兴县',1,0,NULL,2,1,NULL),(2885,339,'翠屏区',1,0,NULL,2,1,NULL),(2886,339,'宜宾县',1,0,NULL,2,1,NULL),(2887,339,'南溪县',1,0,NULL,2,1,NULL),(2888,339,'江安县',1,0,NULL,2,1,NULL),(2889,339,'长宁县',1,0,NULL,2,1,NULL),(2890,339,'高县',1,0,NULL,2,1,NULL),(2891,339,'珙县',1,0,NULL,2,1,NULL),(2892,339,'筠连县',1,0,NULL,2,1,NULL),(2893,339,'兴文县',1,0,NULL,2,1,NULL),(2894,339,'屏山县',1,0,NULL,2,1,NULL),(2895,340,'雁江区',1,0,NULL,2,1,NULL),(2896,340,'简阳市',1,0,NULL,2,1,NULL),(2897,340,'安岳县',1,0,NULL,2,1,NULL),(2898,340,'乐至县',1,0,NULL,2,1,NULL),(2899,341,'大安区',1,0,NULL,2,1,NULL),(2900,341,'自流井区',1,0,NULL,2,1,NULL),(2901,341,'贡井区',1,0,NULL,2,1,NULL),(2902,341,'沿滩区',1,0,NULL,2,1,NULL),(2903,341,'荣县',1,0,NULL,2,1,NULL),(2904,341,'富顺县',1,0,NULL,2,1,NULL),(2905,342,'江阳区',1,0,NULL,2,1,NULL),(2906,342,'纳溪区',1,0,NULL,2,1,NULL),(2907,342,'龙马潭区',1,0,NULL,2,1,NULL),(2908,342,'泸县',1,0,NULL,2,1,NULL),(2909,342,'合江县',1,0,NULL,2,1,NULL),(2910,342,'叙永县',1,0,NULL,2,1,NULL),(2911,342,'古蔺县',1,0,NULL,2,1,NULL),(2912,343,'和平区',1,0,NULL,2,1,NULL),(2913,343,'河西区',1,0,NULL,2,1,NULL),(2914,343,'南开区',1,0,NULL,2,1,NULL),(2915,343,'河北区',1,0,NULL,2,1,NULL),(2916,343,'河东区',1,0,NULL,2,1,NULL),(2917,343,'红桥区',1,0,NULL,2,1,NULL),(2918,343,'东丽区',1,0,NULL,2,1,NULL),(2919,343,'津南区',1,0,NULL,2,1,NULL),(2920,343,'西青区',1,0,NULL,2,1,NULL),(2921,343,'北辰区',1,0,NULL,2,1,NULL),(2922,343,'塘沽区',1,0,NULL,2,1,NULL),(2923,343,'汉沽区',1,0,NULL,2,1,NULL),(2924,343,'大港区',1,0,NULL,2,1,NULL),(2925,343,'武清区',1,0,NULL,2,1,NULL),(2926,343,'宝坻区',1,0,NULL,2,1,NULL),(2927,343,'经济开发区',1,0,NULL,2,1,NULL),(2928,343,'宁河县',1,0,NULL,2,1,NULL),(2929,343,'静海县',1,0,NULL,2,1,NULL),(2930,343,'蓟县',1,0,NULL,2,1,NULL),(2931,344,'城关区',1,0,NULL,2,1,NULL),(2932,344,'林周县',1,0,NULL,2,1,NULL),(2933,344,'当雄县',1,0,NULL,2,1,NULL),(2934,344,'尼木县',1,0,NULL,2,1,NULL),(2935,344,'曲水县',1,0,NULL,2,1,NULL),(2936,344,'堆龙德庆县',1,0,NULL,2,1,NULL),(2937,344,'达孜县',1,0,NULL,2,1,NULL),(2938,344,'墨竹工卡县',1,0,NULL,2,1,NULL),(2939,345,'噶尔县',1,0,NULL,2,1,NULL),(2940,345,'普兰县',1,0,NULL,2,1,NULL),(2941,345,'札达县',1,0,NULL,2,1,NULL),(2942,345,'日土县',1,0,NULL,2,1,NULL),(2943,345,'革吉县',1,0,NULL,2,1,NULL),(2944,345,'改则县',1,0,NULL,2,1,NULL),(2945,345,'措勤县',1,0,NULL,2,1,NULL),(2946,346,'昌都县',1,0,NULL,2,1,NULL),(2947,346,'江达县',1,0,NULL,2,1,NULL),(2948,346,'贡觉县',1,0,NULL,2,1,NULL),(2949,346,'类乌齐县',1,0,NULL,2,1,NULL),(2950,346,'丁青县',1,0,NULL,2,1,NULL),(2951,346,'察雅县',1,0,NULL,2,1,NULL),(2952,346,'八宿县',1,0,NULL,2,1,NULL),(2953,346,'左贡县',1,0,NULL,2,1,NULL),(2954,346,'芒康县',1,0,NULL,2,1,NULL),(2955,346,'洛隆县',1,0,NULL,2,1,NULL),(2956,346,'边坝县',1,0,NULL,2,1,NULL),(2957,347,'林芝县',1,0,NULL,2,1,NULL),(2958,347,'工布江达县',1,0,NULL,2,1,NULL),(2959,347,'米林县',1,0,NULL,2,1,NULL),(2960,347,'墨脱县',1,0,NULL,2,1,NULL),(2961,347,'波密县',1,0,NULL,2,1,NULL),(2962,347,'察隅县',1,0,NULL,2,1,NULL),(2963,347,'朗县',1,0,NULL,2,1,NULL),(2964,348,'那曲县',1,0,NULL,2,1,NULL),(2965,348,'嘉黎县',1,0,NULL,2,1,NULL),(2966,348,'比如县',1,0,NULL,2,1,NULL),(2967,348,'聂荣县',1,0,NULL,2,1,NULL),(2968,348,'安多县',1,0,NULL,2,1,NULL),(2969,348,'申扎县',1,0,NULL,2,1,NULL),(2970,348,'索县',1,0,NULL,2,1,NULL),(2971,348,'班戈县',1,0,NULL,2,1,NULL),(2972,348,'巴青县',1,0,NULL,2,1,NULL),(2973,348,'尼玛县',1,0,NULL,2,1,NULL),(2974,349,'日喀则市',1,0,NULL,2,1,NULL),(2975,349,'南木林县',1,0,NULL,2,1,NULL),(2976,349,'江孜县',1,0,NULL,2,1,NULL),(2977,349,'定日县',1,0,NULL,2,1,NULL),(2978,349,'萨迦县',1,0,NULL,2,1,NULL),(2979,349,'拉孜县',1,0,NULL,2,1,NULL),(2980,349,'昂仁县',1,0,NULL,2,1,NULL),(2981,349,'谢通门县',1,0,NULL,2,1,NULL),(2982,349,'白朗县',1,0,NULL,2,1,NULL),(2983,349,'仁布县',1,0,NULL,2,1,NULL),(2984,349,'康马县',1,0,NULL,2,1,NULL),(2985,349,'定结县',1,0,NULL,2,1,NULL),(2986,349,'仲巴县',1,0,NULL,2,1,NULL),(2987,349,'亚东县',1,0,NULL,2,1,NULL),(2988,349,'吉隆县',1,0,NULL,2,1,NULL),(2989,349,'聂拉木县',1,0,NULL,2,1,NULL),(2990,349,'萨嘎县',1,0,NULL,2,1,NULL),(2991,349,'岗巴县',1,0,NULL,2,1,NULL),(2992,350,'乃东县',1,0,NULL,2,1,NULL),(2993,350,'扎囊县',1,0,NULL,2,1,NULL),(2994,350,'贡嘎县',1,0,NULL,2,1,NULL),(2995,350,'桑日县',1,0,NULL,2,1,NULL),(2996,350,'琼结县',1,0,NULL,2,1,NULL),(2997,350,'曲松县',1,0,NULL,2,1,NULL),(2998,350,'措美县',1,0,NULL,2,1,NULL),(2999,350,'洛扎县',1,0,NULL,2,1,NULL),(3000,350,'加查县',1,0,NULL,2,1,NULL),(3001,350,'隆子县',1,0,NULL,2,1,NULL),(3002,350,'错那县',1,0,NULL,2,1,NULL),(3003,350,'浪卡子县',1,0,NULL,2,1,NULL),(3004,351,'天山区',1,0,NULL,2,1,NULL),(3005,351,'沙依巴克区',1,0,NULL,2,1,NULL),(3006,351,'新市区',1,0,NULL,2,1,NULL),(3007,351,'水磨沟区',1,0,NULL,2,1,NULL),(3008,351,'头屯河区',1,0,NULL,2,1,NULL),(3009,351,'达坂城区',1,0,NULL,2,1,NULL),(3010,351,'米东区',1,0,NULL,2,1,NULL),(3011,351,'乌鲁木齐县',1,0,NULL,2,1,NULL),(3012,352,'阿克苏市',1,0,NULL,2,1,NULL),(3013,352,'温宿县',1,0,NULL,2,1,NULL),(3014,352,'库车县',1,0,NULL,2,1,NULL),(3015,352,'沙雅县',1,0,NULL,2,1,NULL),(3016,352,'新和县',1,0,NULL,2,1,NULL),(3017,352,'拜城县',1,0,NULL,2,1,NULL),(3018,352,'乌什县',1,0,NULL,2,1,NULL),(3019,352,'阿瓦提县',1,0,NULL,2,1,NULL),(3020,352,'柯坪县',1,0,NULL,2,1,NULL),(3021,353,'阿拉尔市',1,0,NULL,2,1,NULL),(3022,354,'库尔勒市',1,0,NULL,2,1,NULL),(3023,354,'轮台县',1,0,NULL,2,1,NULL),(3024,354,'尉犁县',1,0,NULL,2,1,NULL),(3025,354,'若羌县',1,0,NULL,2,1,NULL),(3026,354,'且末县',1,0,NULL,2,1,NULL),(3027,354,'焉耆',1,0,NULL,2,1,NULL),(3028,354,'和静县',1,0,NULL,2,1,NULL),(3029,354,'和硕县',1,0,NULL,2,1,NULL),(3030,354,'博湖县',1,0,NULL,2,1,NULL),(3031,355,'博乐市',1,0,NULL,2,1,NULL),(3032,355,'精河县',1,0,NULL,2,1,NULL),(3033,355,'温泉县',1,0,NULL,2,1,NULL),(3034,356,'呼图壁县',1,0,NULL,2,1,NULL),(3035,356,'米泉市',1,0,NULL,2,1,NULL),(3036,356,'昌吉市',1,0,NULL,2,1,NULL),(3037,356,'阜康市',1,0,NULL,2,1,NULL),(3038,356,'玛纳斯县',1,0,NULL,2,1,NULL),(3039,356,'奇台县',1,0,NULL,2,1,NULL),(3040,356,'吉木萨尔县',1,0,NULL,2,1,NULL),(3041,356,'木垒',1,0,NULL,2,1,NULL),(3042,357,'哈密市',1,0,NULL,2,1,NULL),(3043,357,'伊吾县',1,0,NULL,2,1,NULL),(3044,357,'巴里坤',1,0,NULL,2,1,NULL),(3045,358,'和田市',1,0,NULL,2,1,NULL),(3046,358,'和田县',1,0,NULL,2,1,NULL),(3047,358,'墨玉县',1,0,NULL,2,1,NULL),(3048,358,'皮山县',1,0,NULL,2,1,NULL),(3049,358,'洛浦县',1,0,NULL,2,1,NULL),(3050,358,'策勒县',1,0,NULL,2,1,NULL),(3051,358,'于田县',1,0,NULL,2,1,NULL),(3052,358,'民丰县',1,0,NULL,2,1,NULL),(3053,359,'喀什市',1,0,NULL,2,1,NULL),(3054,359,'疏附县',1,0,NULL,2,1,NULL),(3055,359,'疏勒县',1,0,NULL,2,1,NULL),(3056,359,'英吉沙县',1,0,NULL,2,1,NULL),(3057,359,'泽普县',1,0,NULL,2,1,NULL),(3058,359,'莎车县',1,0,NULL,2,1,NULL),(3059,359,'叶城县',1,0,NULL,2,1,NULL),(3060,359,'麦盖提县',1,0,NULL,2,1,NULL),(3061,359,'岳普湖县',1,0,NULL,2,1,NULL),(3062,359,'伽师县',1,0,NULL,2,1,NULL),(3063,359,'巴楚县',1,0,NULL,2,1,NULL),(3064,359,'塔什库尔干',1,0,NULL,2,1,NULL),(3065,360,'克拉玛依市',1,0,NULL,2,1,NULL),(3066,361,'阿图什市',1,0,NULL,2,1,NULL),(3067,361,'阿克陶县',1,0,NULL,2,1,NULL),(3068,361,'阿合奇县',1,0,NULL,2,1,NULL),(3069,361,'乌恰县',1,0,NULL,2,1,NULL),(3070,362,'石河子市',1,0,NULL,2,1,NULL),(3071,363,'图木舒克市',1,0,NULL,2,1,NULL),(3072,364,'吐鲁番市',1,0,NULL,2,1,NULL),(3073,364,'鄯善县',1,0,NULL,2,1,NULL),(3074,364,'托克逊县',1,0,NULL,2,1,NULL),(3075,365,'五家渠市',1,0,NULL,2,1,NULL),(3076,366,'阿勒泰市',1,0,NULL,2,1,NULL),(3077,366,'布克赛尔',1,0,NULL,2,1,NULL),(3078,366,'伊宁市',1,0,NULL,2,1,NULL),(3079,366,'布尔津县',1,0,NULL,2,1,NULL),(3080,366,'奎屯市',1,0,NULL,2,1,NULL),(3081,366,'乌苏市',1,0,NULL,2,1,NULL),(3082,366,'额敏县',1,0,NULL,2,1,NULL),(3083,366,'富蕴县',1,0,NULL,2,1,NULL),(3084,366,'伊宁县',1,0,NULL,2,1,NULL),(3085,366,'福海县',1,0,NULL,2,1,NULL),(3086,366,'霍城县',1,0,NULL,2,1,NULL),(3087,366,'沙湾县',1,0,NULL,2,1,NULL),(3088,366,'巩留县',1,0,NULL,2,1,NULL),(3089,366,'哈巴河县',1,0,NULL,2,1,NULL),(3090,366,'托里县',1,0,NULL,2,1,NULL),(3091,366,'青河县',1,0,NULL,2,1,NULL),(3092,366,'新源县',1,0,NULL,2,1,NULL),(3093,366,'裕民县',1,0,NULL,2,1,NULL),(3094,366,'和布克赛尔',1,0,NULL,2,1,NULL),(3095,366,'吉木乃县',1,0,NULL,2,1,NULL),(3096,366,'昭苏县',1,0,NULL,2,1,NULL),(3097,366,'特克斯县',1,0,NULL,2,1,NULL),(3098,366,'尼勒克县',1,0,NULL,2,1,NULL),(3099,366,'察布查尔',1,0,NULL,2,1,NULL),(3100,367,'盘龙区',1,0,NULL,2,1,NULL),(3101,367,'五华区',1,0,NULL,2,1,NULL),(3102,367,'官渡区',1,0,NULL,2,1,NULL),(3103,367,'西山区',1,0,NULL,2,1,NULL),(3104,367,'东川区',1,0,NULL,2,1,NULL),(3105,367,'安宁市',1,0,NULL,2,1,NULL),(3106,367,'呈贡县',1,0,NULL,2,1,NULL),(3107,367,'晋宁县',1,0,NULL,2,1,NULL),(3108,367,'富民县',1,0,NULL,2,1,NULL),(3109,367,'宜良县',1,0,NULL,2,1,NULL),(3110,367,'嵩明县',1,0,NULL,2,1,NULL),(3111,367,'石林县',1,0,NULL,2,1,NULL),(3112,367,'禄劝',1,0,NULL,2,1,NULL),(3113,367,'寻甸',1,0,NULL,2,1,NULL),(3114,368,'兰坪',1,0,NULL,2,1,NULL),(3115,368,'泸水县',1,0,NULL,2,1,NULL),(3116,368,'福贡县',1,0,NULL,2,1,NULL),(3117,368,'贡山',1,0,NULL,2,1,NULL),(3118,369,'宁洱',1,0,NULL,2,1,NULL),(3119,369,'思茅区',1,0,NULL,2,1,NULL),(3120,369,'墨江',1,0,NULL,2,1,NULL),(3121,369,'景东',1,0,NULL,2,1,NULL),(3122,369,'景谷',1,0,NULL,2,1,NULL),(3123,369,'镇沅',1,0,NULL,2,1,NULL),(3124,369,'江城',1,0,NULL,2,1,NULL),(3125,369,'孟连',1,0,NULL,2,1,NULL),(3126,369,'澜沧',1,0,NULL,2,1,NULL),(3127,369,'西盟',1,0,NULL,2,1,NULL),(3128,370,'古城区',1,0,NULL,2,1,NULL),(3129,370,'宁蒗',1,0,NULL,2,1,NULL),(3130,370,'玉龙',1,0,NULL,2,1,NULL),(3131,370,'永胜县',1,0,NULL,2,1,NULL),(3132,370,'华坪县',1,0,NULL,2,1,NULL),(3133,371,'隆阳区',1,0,NULL,2,1,NULL),(3134,371,'施甸县',1,0,NULL,2,1,NULL),(3135,371,'腾冲县',1,0,NULL,2,1,NULL),(3136,371,'龙陵县',1,0,NULL,2,1,NULL),(3137,371,'昌宁县',1,0,NULL,2,1,NULL),(3138,372,'楚雄市',1,0,NULL,2,1,NULL),(3139,372,'双柏县',1,0,NULL,2,1,NULL),(3140,372,'牟定县',1,0,NULL,2,1,NULL),(3141,372,'南华县',1,0,NULL,2,1,NULL),(3142,372,'姚安县',1,0,NULL,2,1,NULL),(3143,372,'大姚县',1,0,NULL,2,1,NULL),(3144,372,'永仁县',1,0,NULL,2,1,NULL),(3145,372,'元谋县',1,0,NULL,2,1,NULL),(3146,372,'武定县',1,0,NULL,2,1,NULL),(3147,372,'禄丰县',1,0,NULL,2,1,NULL),(3148,373,'大理市',1,0,NULL,2,1,NULL),(3149,373,'祥云县',1,0,NULL,2,1,NULL),(3150,373,'宾川县',1,0,NULL,2,1,NULL),(3151,373,'弥渡县',1,0,NULL,2,1,NULL),(3152,373,'永平县',1,0,NULL,2,1,NULL),(3153,373,'云龙县',1,0,NULL,2,1,NULL),(3154,373,'洱源县',1,0,NULL,2,1,NULL),(3155,373,'剑川县',1,0,NULL,2,1,NULL),(3156,373,'鹤庆县',1,0,NULL,2,1,NULL),(3157,373,'漾濞',1,0,NULL,2,1,NULL),(3158,373,'南涧',1,0,NULL,2,1,NULL),(3159,373,'巍山',1,0,NULL,2,1,NULL),(3160,374,'潞西市',1,0,NULL,2,1,NULL),(3161,374,'瑞丽市',1,0,NULL,2,1,NULL),(3162,374,'梁河县',1,0,NULL,2,1,NULL),(3163,374,'盈江县',1,0,NULL,2,1,NULL),(3164,374,'陇川县',1,0,NULL,2,1,NULL),(3165,375,'香格里拉县',1,0,NULL,2,1,NULL),(3166,375,'德钦县',1,0,NULL,2,1,NULL),(3167,375,'维西',1,0,NULL,2,1,NULL),(3168,376,'泸西县',1,0,NULL,2,1,NULL),(3169,376,'蒙自县',1,0,NULL,2,1,NULL),(3170,376,'个旧市',1,0,NULL,2,1,NULL),(3171,376,'开远市',1,0,NULL,2,1,NULL),(3172,376,'绿春县',1,0,NULL,2,1,NULL),(3173,376,'建水县',1,0,NULL,2,1,NULL),(3174,376,'石屏县',1,0,NULL,2,1,NULL),(3175,376,'弥勒县',1,0,NULL,2,1,NULL),(3176,376,'元阳县',1,0,NULL,2,1,NULL),(3177,376,'红河县',1,0,NULL,2,1,NULL),(3178,376,'金平',1,0,NULL,2,1,NULL),(3179,376,'河口',1,0,NULL,2,1,NULL),(3180,376,'屏边',1,0,NULL,2,1,NULL),(3181,377,'临翔区',1,0,NULL,2,1,NULL),(3182,377,'凤庆县',1,0,NULL,2,1,NULL),(3183,377,'云县',1,0,NULL,2,1,NULL),(3184,377,'永德县',1,0,NULL,2,1,NULL),(3185,377,'镇康县',1,0,NULL,2,1,NULL),(3186,377,'双江',1,0,NULL,2,1,NULL),(3187,377,'耿马',1,0,NULL,2,1,NULL),(3188,377,'沧源',1,0,NULL,2,1,NULL),(3189,378,'麒麟区',1,0,NULL,2,1,NULL),(3190,378,'宣威市',1,0,NULL,2,1,NULL),(3191,378,'马龙县',1,0,NULL,2,1,NULL),(3192,378,'陆良县',1,0,NULL,2,1,NULL),(3193,378,'师宗县',1,0,NULL,2,1,NULL),(3194,378,'罗平县',1,0,NULL,2,1,NULL),(3195,378,'富源县',1,0,NULL,2,1,NULL),(3196,378,'会泽县',1,0,NULL,2,1,NULL),(3197,378,'沾益县',1,0,NULL,2,1,NULL),(3198,379,'文山县',1,0,NULL,2,1,NULL),(3199,379,'砚山县',1,0,NULL,2,1,NULL),(3200,379,'西畴县',1,0,NULL,2,1,NULL),(3201,379,'麻栗坡县',1,0,NULL,2,1,NULL),(3202,379,'马关县',1,0,NULL,2,1,NULL),(3203,379,'丘北县',1,0,NULL,2,1,NULL),(3204,379,'广南县',1,0,NULL,2,1,NULL),(3205,379,'富宁县',1,0,NULL,2,1,NULL),(3206,380,'景洪市',1,0,NULL,2,1,NULL),(3207,380,'勐海县',1,0,NULL,2,1,NULL),(3208,380,'勐腊县',1,0,NULL,2,1,NULL),(3209,381,'红塔区',1,0,NULL,2,1,NULL),(3210,381,'江川县',1,0,NULL,2,1,NULL),(3211,381,'澄江县',1,0,NULL,2,1,NULL),(3212,381,'通海县',1,0,NULL,2,1,NULL),(3213,381,'华宁县',1,0,NULL,2,1,NULL),(3214,381,'易门县',1,0,NULL,2,1,NULL),(3215,381,'峨山',1,0,NULL,2,1,NULL),(3216,381,'新平',1,0,NULL,2,1,NULL),(3217,381,'元江',1,0,NULL,2,1,NULL),(3218,382,'昭阳区',1,0,NULL,2,1,NULL),(3219,382,'鲁甸县',1,0,NULL,2,1,NULL),(3220,382,'巧家县',1,0,NULL,2,1,NULL),(3221,382,'盐津县',1,0,NULL,2,1,NULL),(3222,382,'大关县',1,0,NULL,2,1,NULL),(3223,382,'永善县',1,0,NULL,2,1,NULL),(3224,382,'绥江县',1,0,NULL,2,1,NULL),(3225,382,'镇雄县',1,0,NULL,2,1,NULL),(3226,382,'彝良县',1,0,NULL,2,1,NULL),(3227,382,'威信县',1,0,NULL,2,1,NULL),(3228,382,'水富县',1,0,NULL,2,1,NULL),(3229,383,'西湖区',1,0,NULL,2,1,NULL),(3230,383,'上城区',1,0,NULL,2,1,NULL),(3231,383,'下城区',1,0,NULL,2,1,NULL),(3232,383,'拱墅区',1,0,NULL,2,1,NULL),(3233,383,'滨江区',1,0,NULL,2,1,NULL),(3234,383,'江干区',1,0,NULL,2,1,NULL),(3235,383,'萧山区',1,0,NULL,2,1,NULL),(3236,383,'余杭区',1,0,NULL,2,1,NULL),(3237,383,'市郊',1,0,NULL,2,1,NULL),(3238,383,'建德市',1,0,NULL,2,1,NULL),(3239,383,'富阳市',1,0,NULL,2,1,NULL),(3240,383,'临安市',1,0,NULL,2,1,NULL),(3241,383,'桐庐县',1,0,NULL,2,1,NULL),(3242,383,'淳安县',1,0,NULL,2,1,NULL),(3243,384,'吴兴区',1,0,NULL,2,1,NULL),(3244,384,'南浔区',1,0,NULL,2,1,NULL),(3245,384,'德清县',1,0,NULL,2,1,NULL),(3246,384,'长兴县',1,0,NULL,2,1,NULL),(3247,384,'安吉县',1,0,NULL,2,1,NULL),(3248,385,'南湖区',1,0,NULL,2,1,NULL),(3249,385,'秀洲区',1,0,NULL,2,1,NULL),(3250,385,'海宁市',1,0,NULL,2,1,NULL),(3251,385,'嘉善县',1,0,NULL,2,1,NULL),(3252,385,'平湖市',1,0,NULL,2,1,NULL),(3253,385,'桐乡市',1,0,NULL,2,1,NULL),(3254,385,'海盐县',1,0,NULL,2,1,NULL),(3255,386,'婺城区',1,0,NULL,2,1,NULL),(3256,386,'金东区',1,0,NULL,2,1,NULL),(3257,386,'兰溪市',1,0,NULL,2,1,NULL),(3258,386,'市区',1,0,NULL,2,1,NULL),(3259,386,'佛堂镇',1,0,NULL,2,1,NULL),(3260,386,'上溪镇',1,0,NULL,2,1,NULL),(3261,386,'义亭镇',1,0,NULL,2,1,NULL),(3262,386,'大陈镇',1,0,NULL,2,1,NULL),(3263,386,'苏溪镇',1,0,NULL,2,1,NULL),(3264,386,'赤岸镇',1,0,NULL,2,1,NULL),(3265,386,'东阳市',1,0,NULL,2,1,NULL),(3266,386,'永康市',1,0,NULL,2,1,NULL),(3267,386,'武义县',1,0,NULL,2,1,NULL),(3268,386,'浦江县',1,0,NULL,2,1,NULL),(3269,386,'磐安县',1,0,NULL,2,1,NULL),(3270,387,'莲都区',1,0,NULL,2,1,NULL),(3271,387,'龙泉市',1,0,NULL,2,1,NULL),(3272,387,'青田县',1,0,NULL,2,1,NULL),(3273,387,'缙云县',1,0,NULL,2,1,NULL),(3274,387,'遂昌县',1,0,NULL,2,1,NULL),(3275,387,'松阳县',1,0,NULL,2,1,NULL),(3276,387,'云和县',1,0,NULL,2,1,NULL),(3277,387,'庆元县',1,0,NULL,2,1,NULL),(3278,387,'景宁',1,0,NULL,2,1,NULL),(3279,388,'海曙区',1,0,NULL,2,1,NULL),(3280,388,'江东区',1,0,NULL,2,1,NULL),(3281,388,'江北区',1,0,NULL,2,1,NULL),(3282,388,'镇海区',1,0,NULL,2,1,NULL),(3283,388,'北仑区',1,0,NULL,2,1,NULL),(3284,388,'鄞州区',1,0,NULL,2,1,NULL),(3285,388,'余姚市',1,0,NULL,2,1,NULL),(3286,388,'慈溪市',1,0,NULL,2,1,NULL),(3287,388,'奉化市',1,0,NULL,2,1,NULL),(3288,388,'象山县',1,0,NULL,2,1,NULL),(3289,388,'宁海县',1,0,NULL,2,1,NULL),(3290,389,'越城区',1,0,NULL,2,1,NULL),(3291,389,'上虞市',1,0,NULL,2,1,NULL),(3292,389,'嵊州市',1,0,NULL,2,1,NULL),(3293,389,'绍兴县',1,0,NULL,2,1,NULL),(3294,389,'新昌县',1,0,NULL,2,1,NULL),(3295,389,'诸暨市',1,0,NULL,2,1,NULL),(3296,390,'椒江区',1,0,NULL,2,1,NULL),(3297,390,'黄岩区',1,0,NULL,2,1,NULL),(3298,390,'路桥区',1,0,NULL,2,1,NULL),(3299,390,'温岭市',1,0,NULL,2,1,NULL),(3300,390,'临海市',1,0,NULL,2,1,NULL),(3301,390,'玉环县',1,0,NULL,2,1,NULL),(3302,390,'三门县',1,0,NULL,2,1,NULL),(3303,390,'天台县',1,0,NULL,2,1,NULL),(3304,390,'仙居县',1,0,NULL,2,1,NULL),(3305,391,'鹿城区',1,0,NULL,2,1,NULL),(3306,391,'龙湾区',1,0,NULL,2,1,NULL),(3307,391,'瓯海区',1,0,NULL,2,1,NULL),(3308,391,'瑞安市',1,0,NULL,2,1,NULL),(3309,391,'乐清市',1,0,NULL,2,1,NULL),(3310,391,'洞头县',1,0,NULL,2,1,NULL),(3311,391,'永嘉县',1,0,NULL,2,1,NULL),(3312,391,'平阳县',1,0,NULL,2,1,NULL),(3313,391,'苍南县',1,0,NULL,2,1,NULL),(3314,391,'文成县',1,0,NULL,2,1,NULL),(3315,391,'泰顺县',1,0,NULL,2,1,NULL),(3316,392,'定海区',1,0,NULL,2,1,NULL),(3317,392,'普陀区',1,0,NULL,2,1,NULL),(3318,392,'岱山县',1,0,NULL,2,1,NULL),(3319,392,'嵊泗县',1,0,NULL,2,1,NULL),(3320,393,'衢州市',1,0,NULL,2,1,NULL),(3321,393,'江山市',1,0,NULL,2,1,NULL),(3322,393,'常山县',1,0,NULL,2,1,NULL),(3323,393,'开化县',1,0,NULL,2,1,NULL),(3324,393,'龙游县',1,0,NULL,2,1,NULL),(3325,394,'合川区',1,0,'H',2,1,NULL),(3326,394,'江津区',1,0,'J',2,1,NULL),(3327,394,'南川区',1,0,'N',2,1,NULL),(3328,394,'永川区',1,0,'Y',2,1,NULL),(3329,394,'南岸区',1,0,'N',2,1,NULL),(3330,394,'渝北区',1,0,'Y',2,1,NULL),(3331,394,'万盛区',1,0,'W',2,1,NULL),(3332,394,'大渡口区',1,0,'D',2,1,NULL),(3333,394,'万州区',1,0,'W',2,1,NULL),(3334,394,'北碚区',1,0,'B',2,1,NULL),(3335,394,'沙坪坝区',1,0,'S',2,1,NULL),(3336,394,'巴南区',1,0,'B',2,1,NULL),(3337,394,'涪陵区',1,0,'F',2,1,NULL),(3338,394,'江北区',1,0,'J',2,1,NULL),(3339,394,'九龙坡区',1,0,'J',2,1,NULL),(3340,394,'渝中区',1,0,'Y',2,1,NULL),(3341,394,'黔江开发区',1,0,'Q',2,1,NULL),(3342,394,'长寿区',1,0,'C',2,1,NULL),(3343,394,'双桥区',1,0,'S',2,1,NULL),(3344,394,'綦江县',1,0,'Q',2,1,NULL),(3345,394,'潼南县',1,0,'T',2,1,NULL),(3346,394,'铜梁县',1,0,'T',2,1,NULL),(3347,394,'大足县',1,0,'D',2,1,NULL),(3348,394,'荣昌县',1,0,'R',2,1,NULL),(3349,394,'璧山县',1,0,'B',2,1,NULL),(3350,394,'垫江县',1,0,'D',2,1,NULL),(3351,394,'武隆县',1,0,'W',2,1,NULL),(3352,394,'丰都县',1,0,'F',2,1,NULL),(3353,394,'城口县',1,0,'C',2,1,NULL),(3354,394,'梁平县',1,0,'L',2,1,NULL),(3355,394,'开县',1,0,'K',2,1,NULL),(3356,394,'巫溪县',1,0,'W',2,1,NULL),(3357,394,'巫山县',1,0,'W',2,1,NULL),(3358,394,'奉节县',1,0,'F',2,1,NULL),(3359,394,'云阳县',1,0,'Y',2,1,NULL),(3360,394,'忠县',1,0,'Z',2,1,NULL),(3361,394,'石柱土家族自治县',1,0,'S',2,1,NULL),(3362,394,'彭水苗族土家族自治县',1,0,'P',2,1,NULL),(3363,394,'酉阳土家族苗族自治县',1,0,'Y',2,1,NULL),(3364,394,'秀山土家族苗族自治县',1,0,'X',2,1,NULL),(3365,395,'沙田区',1,0,NULL,2,1,NULL),(3366,395,'东区',1,0,NULL,2,1,NULL),(3367,395,'观塘区',1,0,NULL,2,1,NULL),(3368,395,'黄大仙区',1,0,NULL,2,1,NULL),(3369,395,'九龙城区',1,0,NULL,2,1,NULL),(3370,395,'屯门区',1,0,NULL,2,1,NULL),(3371,395,'葵青区',1,0,NULL,2,1,NULL),(3372,395,'元朗区',1,0,NULL,2,1,NULL),(3373,395,'深水埗区',1,0,NULL,2,1,NULL),(3374,395,'西贡区',1,0,NULL,2,1,NULL),(3375,395,'大埔区',1,0,NULL,2,1,NULL),(3376,395,'湾仔区',1,0,NULL,2,1,NULL),(3377,395,'油尖旺区',1,0,NULL,2,1,NULL),(3378,395,'北区',1,0,NULL,2,1,NULL),(3379,395,'南区',1,0,NULL,2,1,NULL),(3380,395,'荃湾区',1,0,NULL,2,1,NULL),(3381,395,'中西区',1,0,NULL,2,1,NULL),(3382,395,'离岛区',1,0,NULL,2,1,NULL),(3383,396,'澳门',1,0,NULL,2,1,NULL),(3384,397,'台北市',1,0,'T',2,1,NULL),(3385,397,'高雄市',1,0,'G',2,1,NULL),(3386,397,'基隆市',1,0,'J',2,1,NULL),(3387,397,'台中市',1,0,'T',2,1,NULL),(3388,397,'台南市',1,0,'T',2,1,NULL),(3389,397,'新竹市',1,0,'X',2,1,NULL),(3390,397,'嘉义市',1,0,'J',2,1,NULL),(3391,397,'宜兰县',1,0,'Y',2,1,NULL),(3392,397,'桃园县',1,0,'T',2,1,NULL),(3393,397,'苗栗县',1,0,'M',2,1,NULL),(3394,397,'彰化县',1,0,'Z',2,1,NULL),(3395,397,'南投县',1,0,'N',2,1,NULL),(3396,397,'云林县',1,0,'Y',2,1,NULL),(3397,397,'屏东县',1,0,'P',2,1,NULL),(3398,397,'台东县',1,0,'T',2,1,NULL),(3399,397,'花莲县',1,0,'H',2,1,NULL),(3400,397,'澎湖县',1,0,'P',2,1,NULL),(3401,3,'合肥市',1,0,'H',1,1,NULL),(3402,3401,'庐阳区',1,0,NULL,2,1,NULL),(3403,3401,'瑶海区',1,0,NULL,2,1,NULL),(3404,3401,'蜀山区',1,0,NULL,2,1,NULL),(3405,3401,'包河区',1,0,NULL,2,1,NULL),(3406,3401,'长丰县',1,0,NULL,2,1,NULL),(3407,3401,'肥东县',1,0,NULL,2,1,NULL),(3408,3401,'肥西县',1,0,NULL,2,1,NULL);
/*!40000 ALTER TABLE `shd_areas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_auth_access`
--

DROP TABLE IF EXISTS `shd_auth_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_auth_access` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色',
  `rule_name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类,请加应用前缀,如admin_',
  `rule_id` int(11) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='权限授权表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_auth_access`
--

LOCK TABLES `shd_auth_access` WRITE;
/*!40000 ALTER TABLE `shd_auth_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_auth_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_auth_rule`
--

DROP TABLE IF EXISTS `shd_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `app` varchar(40) NOT NULL DEFAULT '' COMMENT '规则所属app',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(100) NOT NULL DEFAULT '' COMMENT '额外url参数',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '规则描述',
  `condition` varchar(200) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级权限id',
  `is_display` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否显示1=是 0=否',
  `url` varchar(100) DEFAULT NULL COMMENT '跳转地址',
  `order` int(10) NOT NULL DEFAULT '1' COMMENT '排序',
  `language_map` varchar(200) NOT NULL DEFAULT '' COMMENT '多语言列表',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `module` (`app`,`status`,`type`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2203 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='权限规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_auth_rule`
--

LOCK TABLES `shd_auth_rule` WRITE;
/*!40000 ALTER TABLE `shd_auth_rule` DISABLE KEYS */;
INSERT INTO `shd_auth_rule` VALUES (1,1,'admin','admin_url','client','','客户','',0,1,'/customer-list',1,'{\"CN\":\"客户\",\"HK\":\"客戶\",\"US\":\"Customer\"}'),(2,1,'admin','admin_url','order','','业务','',0,1,'/order-list',122,'{\"CN\":\"业务\",\"HK\":\"業務\",\"US\":\"Business\"}'),(3,1,'admun','admin_url','Financial','','财务','',0,1,'/business-statement',188,'{\"CN\":\"财务\",\"HK\":\"財務\",\"US\":\"Finance\"}'),(4,1,'admin','admin_url','Support options','','工单','',0,1,'/support-ticket',289,'{\"CN\":\"工单\",\"HK\":\"工單\",\"US\":\"Ticket\"}'),(5,1,'admin','admin_url','app\\admin\\controller\\ProductController','','商品设置','',6,1,'/product-server',359,'{\"CN\":\"商品设置\",\"HK\":\"商品設置\",\"US\":\"Commodity Set\"}'),(6,1,'admin','admin_url','set','','设置','',0,1,'/set',359,'{\"CN\":\"设置\",\"HK\":\"設置\",\"US\":\"Set\"}'),(7,1,'admin','admin_url','set','','基础设置','',6,1,'/set',357,'{\"CN\":\"基础设置\",\"HK\":\"基础设置\",\"US\":\"Basic Settings\"}'),(8,1,'admin','admin_url','zw','','站务设置','',6,1,'/base-info',497,'{\"CN\":\"站务设置\",\"HK\":\"站務設置\",\"US\":\"Station Service Set\"}'),(11,1,'admin','admin_url','app\\admin\\controller\\PluginController::plIndex','','支付接口','',1902,1,'/payment-interface',259,'{\"CN\":\"支付接口\",\"HK\":\"支付接口\",\"US\":\"Payment Interface\"}'),(12,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::createClientPost','','添加客户','',1,0,'/customer-add',3,'{\"CN\":\"添加客户\",\"HK\":\"添加客戶\",\"US\":\"Add Customer\"}'),(13,1,'admin','admin_url','app\\admin\\controller\\UserManageController','','客户列表','',1860,1,'/customer-list',5,'{\"CN\":\"客户列表\",\"HK\":\"客戶列表\",\"US\":\"Customer List\"}'),(14,1,'admin','admin_url','app\\admin\\controller\\OrderController::createPage','','添加订单','',1866,0,'/add-order',124,'{\"CN\":\"添加订单\",\"HK\":\"添加訂單\",\"US\":\"Add Order\"}'),(15,1,'admin','admin_url','app\\admin\\controller\\OrderController','','产品订单','',1866,1,'/order-list',131,'{\"CN\":\"产品订单\",\"HK\":\"產品訂單\",\"US\":\"Product Order\"}'),(16,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::getDeveloperList','','开发者列表','',0,0,'/customer-developer',812,'{\"CN\":\"开发者列表\",\"HK\":\"開發者列表\",\"US\":\"Developer List\"}'),(17,1,'admin','admin_url','','','续费订单','',1866,1,'/renewal-order',142,'{\"CN\":\"续费订单\",\"HK\":\"續費訂單\",\"US\":\"Renewal Order\"}'),(18,1,'admin','admin_url','app\\admin\\controller\\ProductController','','商品管理','',1875,1,'/product-server',361,'{\"CN\":\"商品管理\",\"HK\":\"商品管理\",\"US\":\"Commodity Management\"}'),(19,1,'admin','admin_url','app\\admin\\controller\\DcimController::listFlowPacket','','流量包管理','',1875,1,'/dcim-traffic',391,'{\"CN\":\"流量包管理\",\"HK\":\"流量包管理\",\"US\":\"Traffic Package Management\"}'),(21,1,'admin','admin_url','app\\admin\\controller\\DcimCloudController','','魔方云','',5,0,'',431,'{\"CN\":\"魔方云\",\"HK\":\"魔方雲\",\"US\":\"Magic Cube Cloud\"}'),(22,1,'admin','admin_url','app\\admin\\controller\\DcimController','','裸金属','',5,0,'',442,'{\"CN\":\"裸金属\",\"HK\":\"裸金屬\",\"US\":\"Bare Metal\"}'),(25,1,'admin','admin_url','hook','','插件安装','',0,0,'',814,'{\"CN\":\"插件安装\",\"HK\":\"插件安裝\",\"US\":\"Plugin Installation\"}'),(27,1,'admin','admin_url','app\\admin\\controller\\DcimController::listBuyRecord','','流量包订单','',1866,1,'/dcim-traffic-log',144,'{\"CN\":\"流量包订单\",\"HK\":\"流量包訂單\",\"US\":\"Traffic Package Order\"}'),(28,1,'admin','admin_url','app\\admin\\controller\\HostController','','业务列表','',1867,1,'/customer-product',148,'{\"CN\":\"业务列表\",\"HK\":\"業務列表\",\"US\":\"Business List\"}'),(29,1,'admin','admin_url','app\\admin\\controller\\ProductController::getProuductlistPage','','商品设置','',22,0,'/dcim-product',443,'{\"CN\":\"商品设置\",\"HK\":\"商品設置\",\"US\":\"Commodity Setting\"}'),(30,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::groupsList','','可配置选项','',22,0,'/configurable-option?type=dcim',462,'{\"CN\":\"可配置选项\",\"HK\":\"可配置選項\",\"US\":\"Configurable Options\"}'),(157,1,'admin','admin_url','app\\admin\\controller\\PublicController','','后台登录','',590,0,'',886,'{\"CN\":\"后台登录\",\"HK\":\"後台登錄\",\"US\":\"Background login\"}'),(158,1,'admin','admin_url','app\\admin\\controller\\PublicController::ad_login','','登录','',157,0,'',889,'{\"CN\":\"登录\",\"HK\":\"登錄\",\"US\":\"Login\"}'),(159,1,'admin','admin_url','app\\admin\\controller\\PublicController::ad_logout','','后台管理员退出','',157,0,'',890,'{\"CN\":\"后台管理员退出\",\"HK\":\"後台管理員退出\",\"US\":\"Back-office administrator exit\"}'),(160,1,'admin','admin_url','app\\admin\\controller\\SetController','','后台设置','',590,0,'',891,'{\"CN\":\"后台设置\",\"HK\":\"後台設置\",\"US\":\"Background Settings\"}'),(164,1,'admin','admin_url','app\\admin\\controller\\SetController::postCustomFields','','保存用户自定义字段','',160,0,'',892,'{\"CN\":\"保存用户自定义字段\",\"HK\":\"保存用戶自定義字段\",\"US\":\"Save user-defined fields\"}'),(165,1,'admin','admin_url','app\\admin\\controller\\SetController::delCustomFields','','删除用户自定义字段配置','',160,0,'',893,'{\"CN\":\"删除用户自定义字段配置\",\"HK\":\"刪除用戶自定義字段配置\",\"US\":\"Delete user-defined field configuration\"}'),(189,1,'admin','admin_url','app\\admin\\controller\\RbacController::addRolePage','','添加角色（添加管理员分组）','',588,0,'',594,'{\"CN\":\"添加角色（添加管理员分组）\",\"HK\":\"添加角色（添加管理員分組）\",\"US\":\"Add role (add administrator group)\"}'),(190,1,'admin','admin_url','app\\admin\\controller\\RbacController::addRole','','添加角色（添加管理员分组）','',189,0,'',595,'{\"CN\":\"添加角色（添加管理员分组）\",\"HK\":\"添加角色（添加管理員分組）\",\"US\":\"Add role (add administrator group)\"}'),(191,1,'admin','admin_url','app\\admin\\controller\\RbacController::editRolePage','','编辑角色（编辑管理员分组）','',588,0,'',596,'{\"CN\":\"编辑角色（编辑管理员分组）\",\"HK\":\"編輯角色（編輯管理員分組）\",\"US\":\"Edit role (edit administrator group)\"}'),(192,1,'admin','admin_url','app\\admin\\controller\\RbacController::editRole','','编辑角色（编辑管理员分组）','',191,0,'',597,'{\"CN\":\"编辑角色（编辑管理员分组）\",\"HK\":\"編輯角色（編輯管理員分組）\",\"US\":\"Edit role (edit administrator group)\"}'),(193,1,'admin','admin_url','app\\admin\\controller\\RbacController::delete','','删除角色(删除管理员组)','',588,0,'',598,'{\"CN\":\"删除角色(删除管理员组)\",\"HK\":\"刪除角色(刪除管理員組)\",\"US\":\"Delete role (delete administrator group)\"}'),(195,1,'admin','admin_url','app\\admin\\controller\\UserController::adminList','','员工管理','',1912,1,'/admin-management',615,'{\"CN\":\"员工管理\",\"HK\":\"員工管理\",\"US\":\"Staff Management\"}'),(196,1,'admin','admin_url','app\\admin\\controller\\UserController::createPage','','管理员添加','',195,0,'',619,'{\"CN\":\"管理员添加\",\"HK\":\"管理員添加\",\"US\":\"Added by Administrator\"}'),(197,1,'admin','admin_url','app\\admin\\controller\\UserController::create','','管理员添加','',196,0,'',620,'{\"CN\":\"管理员添加\",\"HK\":\"管理員添加\",\"US\":\"Added by Administrator\"}'),(198,1,'admin','admin_url','app\\admin\\controller\\UserController::updatePage','','管理员编辑显示','',195,0,'',621,'{\"CN\":\"管理员编辑显示\",\"HK\":\"管理員編輯顯示\",\"US\":\"Administrator edit display\"}'),(199,1,'admin','admin_url','app\\admin\\controller\\UserController::update','','管理员编辑','',198,0,'',622,'{\"CN\":\"管理员编辑\",\"HK\":\"管理員編輯\",\"US\":\"Administrator Edit\"}'),(200,1,'admin','admin_url','app\\admin\\controller\\UserController::delete','','管理员删除','',195,0,'',623,'{\"CN\":\"管理员删除\",\"HK\":\"管理員刪除\",\"US\":\"Administrator delete\"}'),(201,1,'admin','admin_url','app\\admin\\controller\\UserController::ban','','停用管理员','',195,0,'',624,'{\"CN\":\"停用管理员\",\"HK\":\"停用管理員\",\"US\":\"Disable Administrator\"}'),(202,1,'admin','admin_url','app\\admin\\controller\\UserController::cancelBan','','启用管理员','',195,0,'',625,'{\"CN\":\"启用管理员\",\"HK\":\"啟用管理員\",\"US\":\"Enable Administrator\"}'),(203,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::getList','','优惠码','',1902,1,'/promo-code',271,'{\"CN\":\"优惠码\",\"HK\":\"優惠碼\",\"US\":\"Promotion Code\"}'),(204,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::addPage','','添加优惠码','',203,0,'',273,'{\"CN\":\"添加优惠码\",\"HK\":\"添加優惠碼\",\"US\":\"Add coupon code\"}'),(205,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::add','','添加优惠码提交','',204,0,'',275,'{\"CN\":\"添加优惠码提交\",\"HK\":\"添加優惠碼提交\",\"US\":\"Add coupon code to submit\"}'),(206,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::savePage','','编辑优惠码','',203,0,'',276,'{\"CN\":\"编辑优惠码\",\"HK\":\"編輯優惠碼\",\"US\":\"Edit Promo Code\"}'),(207,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::save','','编辑优惠码提交','',206,0,'',278,'{\"CN\":\"编辑优惠码提交\",\"HK\":\"編輯優惠碼提交\",\"US\":\"Edit coupon code submission\"}'),(208,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::delete','','删除优惠码','',203,0,'',281,'{\"CN\":\"删除优惠码\",\"HK\":\"刪除優惠碼\",\"US\":\"Delete coupon code\"}'),(209,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::expireImmediately','','优惠码立即过期','',206,0,'',279,'{\"CN\":\"优惠码立即过期\",\"HK\":\"優惠碼立即過期\",\"US\":\"The coupon code expires immediately\"}'),(211,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::autoPromoCode','','自动生成优惠码','',206,0,'',280,'{\"CN\":\"自动生成优惠码\",\"HK\":\"自動生成優惠碼\",\"US\":\"Automatically generate coupon code\"}'),(212,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController','','后台服务器配置','',0,0,'/server-settings',937,'{\"CN\":\"后台服务器配置\",\"HK\":\"後台服務器配置\",\"US\":\"Background server configuration\"}'),(214,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::addServers','','添加服务器','',528,0,'',402,'{\"CN\":\"添加服务器\",\"HK\":\"添加服務器\",\"US\":\"Add Server\"}'),(215,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::addServersPost','','添加服务器提交','',214,0,'',403,'{\"CN\":\"添加服务器提交\",\"HK\":\"添加服務器提交\",\"US\":\"Add server submission\"}'),(216,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::editServers','','编辑服务器','',528,0,'',404,'{\"CN\":\"编辑服务器\",\"HK\":\"編輯服務器\",\"US\":\"Edit Server\"}'),(217,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::editServersPost','','编辑服务器提交','',216,0,'',405,'{\"CN\":\"编辑服务器提交\",\"HK\":\"編輯服務器提交\",\"US\":\"Edit server submission\"}'),(218,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::deleteServers','','删除服务器','',528,0,'',406,'{\"CN\":\"删除服务器\",\"HK\":\"刪除服務器\",\"US\":\"Delete Server\"}'),(219,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::createGroups','','创建服务器组','',528,0,'',407,'{\"CN\":\"创建服务器组\",\"HK\":\"創建服務器組\",\"US\":\"Create Server Group\"}'),(220,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::createGroupsPost','','创建服务器组提交','',219,0,'',408,'{\"CN\":\"创建服务器组提交\",\"HK\":\"創建服務器組提交\",\"US\":\"Create server group submission\"}'),(221,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::editServerGroups','','编辑服务器组','',528,0,'',409,'{\"CN\":\"编辑服务器组\",\"HK\":\"編輯服務器組\",\"US\":\"Edit Server Group\"}'),(222,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::editServerGroupsPost','','编辑服务器组页面提交','',221,0,'',410,'{\"CN\":\"编辑服务器组页面提交\",\"HK\":\"編輯服務器組頁面提交\",\"US\":\"Edit server group page submission\"}'),(223,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::deleteServerGroups','','删除服务器组','',528,0,'',411,'{\"CN\":\"删除服务器组\",\"HK\":\"刪除服務器組\",\"US\":\"Delete Server Group\"}'),(224,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController','','可配置选项组','',0,0,'/configurable-option',945,'{\"CN\":\"可配置选项组\",\"HK\":\"可配置選項組\",\"US\":\"Configurable Option Group\"}'),(226,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::createGroups','','创建可选项配置组','',30,0,'',464,'{\"CN\":\"创建可选项配置组\",\"HK\":\"創建可選項配置組\",\"US\":\"Create optional configuration group\"}'),(227,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::createGroupsPost','','创建可选项配置组页面提交','',226,0,'',465,'{\"CN\":\"创建可选项配置组页面提交\",\"HK\":\"創建可選項配置組頁面提交\",\"US\":\"Create optional configuration group page submission\"}'),(228,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::editGroups','','编辑可配置选项组','',30,0,'',466,'{\"CN\":\"编辑可配置选项组\",\"HK\":\"編輯可配置選項組\",\"US\":\"Edit configurable option group\"}'),(229,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::editGroupsPost','','编辑可配置选项组页面提交','',228,0,'',467,'{\"CN\":\"编辑可配置选项组页面提交\",\"HK\":\"編輯可配置選項組頁面提交\",\"US\":\"Edit configurable option group page submission\"}'),(230,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::addOptions','','添加可配置选项','',228,0,'',468,'{\"CN\":\"添加可配置选项\",\"HK\":\"添加可配置選項\",\"US\":\"Add configurable options\"}'),(231,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::deleteSubOptions','','删除可配置选项的子选项','',232,0,'',470,'{\"CN\":\"删除可配置选项的子选项\",\"HK\":\"刪除可配置選項的子選項\",\"US\":\"Delete sub-options of configurable options\"}'),(232,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::deleteOptions','','删除可配置选项','',228,0,'',469,'{\"CN\":\"删除可配置选项\",\"HK\":\"刪除可配置選項\",\"US\":\"Delete configurable options\"}'),(233,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::deleteGroups','','删除可配置选项组','',30,0,'',473,'{\"CN\":\"删除可配置选项组\",\"HK\":\"刪除可配置選項組\",\"US\":\"Delete configurable option group\"}'),(234,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::duplicateGroups','','复制可配置选项组','',30,0,'',474,'{\"CN\":\"复制可配置选项组\",\"HK\":\"複製可配置選項組\",\"US\":\"Copy Configurable Option Group\"}'),(235,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::duplicateGroupsPost','','复制可配置选项组页面提交','',234,0,'',475,'{\"CN\":\"复制可配置选项组页面提交\",\"HK\":\"複製可配置選項組頁面提交\",\"US\":\"Copy configurable option group page submission\"}'),(236,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::editConfig','','编辑可配置项','',228,0,'',471,'{\"CN\":\"编辑可配置项\",\"HK\":\"編輯可配置項\",\"US\":\"Edit configurable items\"}'),(237,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::editConfigPost','','编辑可配置项页面提交','',236,0,'',472,'{\"CN\":\"编辑可配置项页面提交\",\"HK\":\"編輯可配置項頁面提交\",\"US\":\"Edit configurable item page submission\"}'),(238,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getGeneral','','显示设置','',8,1,'/base-info',498,'{\"CN\":\"显示设置\",\"HK\":\"顯示設置\",\"US\":\"Display Settings\"}'),(240,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::configMobile','','短信设置详情','',1359,0,'',630,'{\"CN\":\"短信设置详情\",\"HK\":\"短信設置詳情\",\"US\":\"SMS setting details\"}'),(242,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::createTemplatePage','','创建模板','',533,0,'',653,'{\"CN\":\"创建模板\",\"HK\":\"創建模板\",\"US\":\"Create Template\"}'),(243,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::createTemplate','','创建模板并提交审核','',242,0,'',654,'{\"CN\":\"创建模板并提交审核\",\"HK\":\"創建模板並提交審核\",\"US\":\"Create a template and submit it for review\"}'),(244,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::updateTemplate','','更新模板','',533,0,'',655,'{\"CN\":\"更新模板\",\"HK\":\"更新模板\",\"US\":\"Update Template\"}'),(245,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::updateTemplatePost','','更新模板页面提交并审核','',244,0,'',656,'{\"CN\":\"更新模板页面提交并审核\",\"HK\":\"更新模板頁面提交並審核\",\"US\":\"Submit and review the updated template page\"}'),(246,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::deleteTemplate','','删除模板','',533,0,'',657,'{\"CN\":\"删除模板\",\"HK\":\"刪除模板\",\"US\":\"Delete Template\"}'),(248,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::SetSmsTemplate','','发送设置详情','',536,0,'',662,'{\"CN\":\"发送设置详情\",\"HK\":\"發送設置詳情\",\"US\":\"Send setting details\"}'),(249,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::testMessageTemplatePage','','测试短信模板','',533,0,'/sms-template-index',658,'{\"CN\":\"测试短信模板\",\"HK\":\"測試短信模板\",\"US\":\"Test SMS template\"}'),(250,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::testMessageTemplate','','测试短信模板','',249,0,'',659,'{\"CN\":\"测试短信模板\",\"HK\":\"測試短信模板\",\"US\":\"Test SMS template\"}'),(251,1,'admin','admin_url','','','会员中心与购物','',8,0,'',521,'{\"CN\":\"会员中心与购物\",\"HK\":\"會員中心與購物\",\"US\":\"Member Center and Shopping\"}'),(252,1,'admin','admin_url','app\\admin\\controller\\NewsController::getGetCustomParam','','自定义模板字段','',8,0,'/custom-template-fields',562,'{\"CN\":\"自定义模板字段\",\"HK\":\"自定義模板字段\",\"US\":\"Customize template fields\"}'),(253,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::addCurrency','','添加货币种类','',260,0,'',255,'{\"CN\":\"添加货币种类\",\"HK\":\"添加貨幣種類\",\"US\":\"Add currency type\"}'),(254,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::editCurrency','','编辑货币种类','',260,0,'',256,'{\"CN\":\"编辑货币种类\",\"HK\":\"編輯貨幣種類\",\"US\":\"Edit currency type\"}'),(255,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::editCurrencyPost','','编辑货币种类页面提交','',254,0,'',258,'{\"CN\":\"编辑货币种类页面提交\",\"HK\":\"編輯貨幣種類頁面提交\",\"US\":\"Edit currency type page submission\"}'),(256,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::deleteCurrency','','删除货币种类','',260,0,'',251,'{\"CN\":\"删除货币种类\",\"HK\":\"刪除貨幣種類\",\"US\":\"Delete currency type\"}'),(257,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::updateRate','','更新汇率','',260,0,'',252,'{\"CN\":\"更新汇率\",\"HK\":\"更新匯率\",\"US\":\"Update exchange rate\"}'),(258,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::defaultCurrency','','选择默认货币','',0,0,'',803,'{\"CN\":\"选择默认货币\",\"HK\":\"選擇默認貨幣\",\"US\":\"Select the default currency\"}'),(259,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::updatePrice','','更新价格','',260,0,'',253,'{\"CN\":\"更新价格\",\"HK\":\"更新價格\",\"US\":\"Update price\"}'),(260,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::currencyList','','货币配置','',1902,1,'/currency-settings',250,'{\"CN\":\"货币配置\",\"HK\":\"貨幣配置\",\"US\":\"Currency Configuration\"}'),(261,1,'admin','admin_url','app\\admin\\controller\\ContractController::uploadLogo','','设置上传合同logo','',922,0,'',872,'{\"CN\":\"设置上传合同logo\",\"HK\":\"設置上傳合同logo\",\"US\":\"Set upload contract logo\"}'),(262,1,'admin','admin_url','app\\admin\\controller\\ContractController::uploadLogoPost','','设置上传合同logo提交','',922,0,'',873,'{\"CN\":\"设置上传合同logo提交\",\"HK\":\"設置上傳合同logo提交\",\"US\":\"Set upload contract logo submission\"}'),(263,1,'admin','admin_url','app\\admin\\controller\\ContractController::contractList','','合同列表','',922,0,'',874,'{\"CN\":\"合同列表\",\"HK\":\"合同列表\",\"US\":\"Contract List\"}'),(264,1,'admin','admin_url','app\\admin\\controller\\ContractController::contractDetail','','查看合同详情','',922,0,'',875,'{\"CN\":\"查看合同详情\",\"HK\":\"查看合同詳情\",\"US\":\"View contract details\"}'),(265,1,'admin','admin_url','app\\admin\\controller\\ContractController::downloadContract','','查看下载','',922,0,'',876,'{\"CN\":\"查看下载\",\"HK\":\"查看下載\",\"US\":\"View Download\"}'),(266,1,'admin','admin_url','app\\admin\\controller\\ContractController::checkContract','','审核通过','',922,0,'',877,'{\"CN\":\"审核通过\",\"HK\":\"審核通過\",\"US\":\"Approved\"}'),(267,1,'admin','admin_url','app\\admin\\controller\\ContractController::cancelContract','','合同作废','',922,0,'',878,'{\"CN\":\"合同作废\",\"HK\":\"合同作廢\",\"US\":\"Contract voided\"}'),(268,1,'admin','admin_url','app\\admin\\controller\\ContractController::deleteContract','','删除合同','',922,0,'',879,'{\"CN\":\"删除合同\",\"HK\":\"刪除合同\",\"US\":\"Delete Contract\"}'),(269,1,'admin','admin_url','app\\admin\\controller\\ContractController::contractTemplateList','','合同模块列表','',922,0,'',880,'{\"CN\":\"合同模块列表\",\"HK\":\"合同模塊列表\",\"US\":\"Contract Module List\"}'),(270,1,'admin','admin_url','app\\admin\\controller\\ContractController::createContract','','创建合同','',922,0,'',881,'{\"CN\":\"创建合同\",\"HK\":\"創建合同\",\"US\":\"Create Contract\"}'),(271,1,'admin','admin_url','app\\admin\\controller\\ContractController::createContractPost','','创建合同页面提交','',922,0,'',882,'{\"CN\":\"创建合同页面提交\",\"HK\":\"創建合同頁面提交\",\"US\":\"Submit to create contract page\"}'),(272,1,'admin','admin_url','app\\admin\\controller\\ContractController::editContract','','编辑合同','',922,0,'',883,'{\"CN\":\"编辑合同\",\"HK\":\"編輯合同\",\"US\":\"Edit Contract\"}'),(273,1,'admin','admin_url','app\\admin\\controller\\ContractController::editContractPost','','编辑合同页面提交','',922,0,'',884,'{\"CN\":\"编辑合同页面提交\",\"HK\":\"編輯合同頁面提交\",\"US\":\"Edit contract page submission\"}'),(274,1,'admin','admin_url','app\\admin\\controller\\ContractController::deleteContractTemplate','','删除合同模板','',922,0,'',885,'{\"CN\":\"删除合同模板\",\"HK\":\"刪除合同模板\",\"US\":\"Delete contract template\"}'),(284,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::emailList','','邮件模板列表','',531,0,'',635,'{\"CN\":\"邮件模板列表\",\"HK\":\"郵件模板列表\",\"US\":\"Mail template list\"}'),(285,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::createTemplate','','创建邮件模板','',531,0,'',636,'{\"CN\":\"创建邮件模板\",\"HK\":\"創建郵件模板\",\"US\":\"Create Email Template\"}'),(286,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::createTemplatePost','','创建邮件模板提交','',285,0,'',637,'{\"CN\":\"创建邮件模板提交\",\"HK\":\"創建郵件模板提交\",\"US\":\"Create email template submission\"}'),(287,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::manageLanguages','','管理邮件模板语言','',531,0,'',638,'{\"CN\":\"管理邮件模板语言\",\"HK\":\"管理郵件模板語言\",\"US\":\"Manage Mail Template Language\"}'),(288,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::manageLanguagesPost','','管理邮件模板语言页面提交','',287,0,'',639,'{\"CN\":\"管理邮件模板语言页面提交\",\"HK\":\"管理郵件模板語言頁面提交\",\"US\":\"Manage mail template language page submission\"}'),(289,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::disabled','','禁用语言','',287,0,'',640,'{\"CN\":\"禁用语言\",\"HK\":\"禁用語言\",\"US\":\"Forbidden language\"}'),(290,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::deleteTemplate','','删除模板','',531,0,'',641,'{\"CN\":\"删除模板\",\"HK\":\"刪除模板\",\"US\":\"Delete template\"}'),(291,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::editTemplate','','编辑邮件模板','',531,0,'',642,'{\"CN\":\"编辑邮件模板\",\"HK\":\"編輯郵件模板\",\"US\":\"Edit Email Template\"}'),(292,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::editTemplatePost','','编辑邮件模板页面提交','',291,0,'',643,'{\"CN\":\"编辑邮件模板页面提交\",\"HK\":\"編輯郵件模板頁面提交\",\"US\":\"Edit email template page submission\"}'),(306,1,'admin','admin_url','app\\admin\\controller\\ReportController','','基础统计信息','',1329,0,'',821,'{\"CN\":\"基础统计信息\",\"HK\":\"基礎統計信息\",\"US\":\"Basic Statistics\"}'),(307,1,'admin','admin_url','app\\admin\\controller\\ReportController::baseInfo','','基础信息','',306,0,'',822,'{\"CN\":\"基础信息\",\"HK\":\"基礎信息\",\"US\":\"Basic Information\"}'),(308,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::getList','','工单部门','',1320,1,'/work-order-dept',322,'{\"CN\":\"工单部门\",\"HK\":\"工單部門\",\"US\":\"Ticket Department\"}'),(309,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::addPage','','添加新部门','',308,0,'',328,'{\"CN\":\"添加新部门\",\"HK\":\"添加新部門\",\"US\":\"Add new department\"}'),(310,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::add','','添加新部门','',309,0,'',329,'{\"CN\":\"添加新部门\",\"HK\":\"添加新部門\",\"US\":\"Add new department\"}'),(311,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::save','','修改工单部门','',308,0,'',330,'{\"CN\":\"修改工单部门\",\"HK\":\"修改工單部門\",\"US\":\"Modify Ticket Department\"}'),(312,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::delete','','删除工单部门','',308,0,'',333,'{\"CN\":\"删除工单部门\",\"HK\":\"刪除工單部門\",\"US\":\"Delete Ticket Department\"}'),(313,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::moveDown','','向后排序','',311,0,'',331,'{\"CN\":\"向后排序\",\"HK\":\"向後排序\",\"US\":\"Sort Backward\"}'),(314,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::moveUp','','向前排序','',311,0,'',332,'{\"CN\":\"向前排序\",\"HK\":\"向前排序\",\"US\":\"Sort Forward\"}'),(315,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::getList','','工单部门列表','',338,0,'',296,'{\"CN\":\"工单部门列表\",\"HK\":\"工單部門列表\",\"US\":\"Ticket Department List\"}'),(316,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::getDetail','','部门详情','',308,0,'',334,'{\"CN\":\"部门详情\",\"HK\":\"部門詳情\",\"US\":\"Department Details\"}'),(317,1,'admin','admin_url','app\\admin\\controller\\TicketStatusController','','工单状态','',1320,1,'/work-order-status',336,'{\"CN\":\"工单状态\",\"HK\":\"工單狀態\",\"US\":\"Ticket Status\"}'),(318,1,'admin','admin_url','app\\admin\\controller\\TicketStatusController::add','','添加工单状态','',317,0,'',337,'{\"CN\":\"添加工单状态\",\"HK\":\"添加工單狀態\",\"US\":\"Add Ticket Status\"}'),(319,1,'admin','admin_url','app\\admin\\controller\\TicketStatusController::save','','修改工单状态','',317,0,'',338,'{\"CN\":\"修改工单状态\",\"HK\":\"修改工單狀態\",\"US\":\"Modify Ticket Status\"}'),(320,1,'admin','admin_url','app\\admin\\controller\\TicketStatusController::delete','','删除工单状态','',317,0,'',339,'{\"CN\":\"删除工单状态\",\"HK\":\"刪除工單狀態\",\"US\":\"Delete Ticket Status\"}'),(321,1,'admin','admin_url','app\\admin\\controller\\TicketStatusController::getList','','工单状态列表','',0,0,'',850,'{\"CN\":\"工单状态列表\",\"HK\":\"工單狀態列表\",\"US\":\"Ticket Status List\"}'),(322,1,'admin','admin_url','app\\admin\\controller\\TicketStatusController::getDetail','','工单状态详情','',317,0,'',340,'{\"CN\":\"工单状态详情\",\"HK\":\"工單狀態詳情\",\"US\":\"Ticket Status Details\"}'),(323,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController','','预设回复','',1320,0,'/preset-reply',341,'{\"CN\":\"预设回复\",\"HK\":\"預設回复\",\"US\":\"Preset Reply\"}'),(324,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::replyList','','预设回复列表','',323,0,'',342,'{\"CN\":\"预设回复列表\",\"HK\":\"預設回复列表\",\"US\":\"Preset Reply List\"}'),(325,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::addCategory','','添加预设回复分类','',323,0,'',343,'{\"CN\":\"添加预设回复分类\",\"HK\":\"添加預設回複分類\",\"US\":\"Add preset reply category\"}'),(326,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::editCategoryPage','','编辑预设回复分类','',323,0,'',344,'{\"CN\":\"编辑预设回复分类\",\"HK\":\"編輯預設回複分類\",\"US\":\"Edit preset reply category\"}'),(327,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::editCategory','','编辑预设回复分类提交','',326,0,'',345,'{\"CN\":\"编辑预设回复分类提交\",\"HK\":\"編輯預設回複分類提交\",\"US\":\"Edit preset reply category submission\"}'),(328,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::deleteCategory','','删除预设回复分类','',323,0,'',346,'{\"CN\":\"删除预设回复分类\",\"HK\":\"刪除預設回複分類\",\"US\":\"Delete preset reply category\"}'),(329,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::addPrereplyPage','','添加预设回复','',323,0,'',347,'{\"CN\":\"添加预设回复\",\"HK\":\"添加預設回复\",\"US\":\"Add Canned Reply\"}'),(330,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::addPrereply','','添加预设回复提交','',329,0,'',348,'{\"CN\":\"添加预设回复提交\",\"HK\":\"添加預設回复提交\",\"US\":\"Add canned response to submit\"}'),(331,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::savePrereplyPage','','编辑预设回复','',323,0,'',349,'{\"CN\":\"编辑预设回复\",\"HK\":\"編輯預設回复\",\"US\":\"Edit preset reply\"}'),(332,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::savePrereply','','编辑预设回复提交','',331,0,'',350,'{\"CN\":\"编辑预设回复提交\",\"HK\":\"編輯預設回复提交\",\"US\":\"Edit preset reply submission\"}'),(333,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::searchPrereply','','搜索预设回复','',323,0,'',351,'{\"CN\":\"搜索预设回复\",\"HK\":\"搜索預設回复\",\"US\":\"Search for preset responses\"}'),(334,1,'admin','admin_url','app\\admin\\controller\\TicketPrereplyController::deletePrereply','','删除预设回复','',323,0,'',352,'{\"CN\":\"删除预设回复\",\"HK\":\"刪除預設回复\",\"US\":\"Delete Canned Reply\"}'),(335,1,'admin','admin_url','app\\admin\\controller\\TicketController','','工单','',4,1,'/support-ticket',290,'{\"CN\":\"工单\",\"HK\":\"工單\",\"US\":\"Ticket\"}'),(336,1,'admin','admin_url','app\\admin\\controller\\TicketController::createPage','','新建工单','',335,0,'',292,'{\"CN\":\"新建工单\",\"HK\":\"新建工單\",\"US\":\"New Ticket\"}'),(337,1,'admin','admin_url','app\\admin\\controller\\TicketController::add','','新建工单提交','',336,0,'',293,'{\"CN\":\"新建工单提交\",\"HK\":\"新建工單提交\",\"US\":\"New Ticket Submit\"}'),(338,1,'admin','admin_url','app\\admin\\controller\\TicketController::getList','','工单列表','',335,1,'/support-ticket',295,'{\"CN\":\"工单列表\",\"HK\":\"工單列表\",\"US\":\"Ticket List\"}'),(339,1,'admin','admin_url','app\\admin\\controller\\TicketController::getClientTicketPage','','获取客户工单列表','',338,0,'',298,'{\"CN\":\"获取客户工单列表\",\"HK\":\"獲取客戶工單列表\",\"US\":\"Get a list of customer tickets\"}'),(340,1,'admin','admin_url','app\\admin\\controller\\TicketController::reply','','回复工单','',351,0,'',303,'{\"CN\":\"回复工单\",\"HK\":\"回復工單\",\"US\":\"Respond to Ticket\"}'),(341,1,'admin','admin_url','app\\admin\\controller\\TicketController::saveReply','','编辑工单回复','',351,0,'',304,'{\"CN\":\"编辑工单回复\",\"HK\":\"編輯工單回复\",\"US\":\"Edit Ticket Reply\"}'),(342,1,'admin','admin_url','app\\admin\\controller\\TicketController::mergeTicket','','合并工单','',351,0,'',305,'{\"CN\":\"合并工单\",\"HK\":\"合併工單\",\"US\":\"Merge Ticket\"}'),(343,1,'admin','admin_url','app\\admin\\controller\\TicketController::closeTicket','','修改工单状态','',351,0,'',306,'{\"CN\":\"修改工单状态\",\"HK\":\"修改工單狀態\",\"US\":\"Modify Ticket Status\"}'),(344,1,'admin','admin_url','app\\admin\\controller\\TicketController::deleteTicket','','删除工单','',351,0,'',307,'{\"CN\":\"删除工单\",\"HK\":\"刪除工單\",\"US\":\"Delete Ticket\"}'),(345,1,'admin','admin_url','app\\admin\\controller\\TicketController::addNote','','添加工单备注','',351,0,'',308,'{\"CN\":\"添加工单备注\",\"HK\":\"添加工單備註\",\"US\":\"Add Ticket Remarks\"}'),(346,1,'admin','admin_url','app\\admin\\controller\\TicketController::deleteNote','','删除工单备注','',351,0,'',309,'{\"CN\":\"删除工单备注\",\"HK\":\"刪除工單備註\",\"US\":\"Delete Ticket Remarks\"}'),(347,1,'admin','admin_url','app\\admin\\controller\\TicketController::deleteReply','','删除工单回复','',351,0,'',310,'{\"CN\":\"删除工单回复\",\"HK\":\"刪除工單回复\",\"US\":\"Delete Ticket Reply\"}'),(348,1,'admin','admin_url','app\\admin\\controller\\TicketController::deleteAttachment','','删除附件','',351,0,'',311,'{\"CN\":\"删除附件\",\"HK\":\"刪除附件\",\"US\":\"Delete attachment\"}'),(349,1,'admin','admin_url','app\\admin\\controller\\TicketController::downloadAttachment','','下载附件','',351,0,'',312,'{\"CN\":\"下载附件\",\"HK\":\"下載附件\",\"US\":\"Download attachment\"}'),(350,1,'admin','admin_url','app\\admin\\controller\\TicketController::ticketDetail','','工单详情','',335,0,'',301,'{\"CN\":\"工单详情\",\"HK\":\"工單詳情\",\"US\":\"Ticket Details\"}'),(351,1,'admin','admin_url','app\\admin\\controller\\TicketController::saveTicket','','编辑工单','',350,0,'',302,'{\"CN\":\"编辑工单\",\"HK\":\"編輯工單\",\"US\":\"Edit Ticket\"}'),(354,1,'admin','admin_url','app\\admin\\controller\\ProductController::updateGroupsort','','产品分组排序修改','',0,0,'',909,'{\"CN\":\"产品分组排序修改\",\"HK\":\"產品分組排序修改\",\"US\":\"Product grouping and sorting modification\"}'),(355,1,'admin','admin_url','app\\admin\\controller\\ProductController::updateProductsort','','产品排序修改','',0,0,'',910,'{\"CN\":\"产品排序修改\",\"HK\":\"產品排序修改\",\"US\":\"Product Sorting Modification\"}'),(356,1,'admin','admin_url','app\\admin\\controller\\ProductController::editGroupPage','','产品分组添加/编辑','',1353,0,'',445,'{\"CN\":\"产品分组添加\\/编辑\",\"HK\":\"產品分組添加\\/編輯\",\"US\":\"Product Group Add\\/Edit\"}'),(357,1,'admin','admin_url','app\\admin\\controller\\ProductController::saveProductGroup','','保存产品分组信息','',356,0,'',446,'{\"CN\":\"保存产品分组信息\",\"HK\":\"保存產品分組信息\",\"US\":\"Save product group information\"}'),(358,1,'admin','admin_url','app\\admin\\controller\\ProductController::delete','','删除产品','',29,0,'',448,'{\"CN\":\"删除产品\",\"HK\":\"刪除產品\",\"US\":\"Delete product\"}'),(359,1,'admin','admin_url','app\\admin\\controller\\ProductController::deleteGroup','','删除产品组','',1353,0,'',447,'{\"CN\":\"删除产品组\",\"HK\":\"刪除產品組\",\"US\":\"Delete product group\"}'),(360,1,'admin','admin_url','app\\admin\\controller\\ProductController::duplicatePage','','复制产品','',29,0,'',449,'{\"CN\":\"复制产品\",\"HK\":\"複製產品\",\"US\":\"Copy product\"}'),(361,1,'admin','admin_url','app\\admin\\controller\\ProductController::duplicate','','复制产品','',360,0,'',450,'{\"CN\":\"复制产品\",\"HK\":\"複製產品\",\"US\":\"Copy product\"}'),(362,1,'admin','admin_url','app\\admin\\controller\\ProductController::addPage','','产品添加','',29,0,'',451,'{\"CN\":\"产品添加\",\"HK\":\"產品添加\",\"US\":\"Product Added\"}'),(363,1,'admin','admin_url','app\\admin\\controller\\ProductController::create','','创建产品','',362,0,'',452,'{\"CN\":\"创建产品\",\"HK\":\"創建產品\",\"US\":\"Create Product\"}'),(364,1,'admin','admin_url','app\\admin\\controller\\ProductController::editPage','','产品编辑','',29,0,'',453,'{\"CN\":\"产品编辑\",\"HK\":\"產品編輯\",\"US\":\"Product Editor\"}'),(365,1,'admin','admin_url','app\\admin\\controller\\ProductController::edit','','保存产品信息','',364,0,'',455,'{\"CN\":\"保存产品信息\",\"HK\":\"保存產品信息\",\"US\":\"Save product information\"}'),(366,1,'admin','admin_url','app\\admin\\controller\\ProductController::delCustomField','','删除自定义字段','',0,0,'',911,'{\"CN\":\"删除自定义字段\",\"HK\":\"刪除自定義字段\",\"US\":\"Delete custom fields\"}'),(367,1,'admin','admin_url','app\\admin\\controller\\ProductController::managedownloads','','关联相关下载','',364,0,'',456,'{\"CN\":\"关联相关下载\",\"HK\":\"關聯相關下載\",\"US\":\"Related Downloads\"}'),(368,1,'admin','admin_url','app\\admin\\controller\\ProductController::addDownloadcats','','添加分类','',0,0,'',912,'{\"CN\":\"添加分类\",\"HK\":\"添加分類\",\"US\":\"Add Category\"}'),(369,1,'admin','admin_url','app\\admin\\controller\\ProductController::addDownloadFlie','','添加文件,同时关联到产品中','',0,0,'',913,'{\"CN\":\"添加文件,同时关联到产品中\",\"HK\":\"添加文件,同時關聯到產品中\",\"US\":\"Add a file and associate it to the product at the same time\"}'),(371,1,'admin','admin_url','app\\admin\\controller\\CronController::detail','','自动任务详情','',1894,0,'',578,'{\"CN\":\"自动任务详情\",\"HK\":\"自動任務詳情\",\"US\":\"Automatic task details\"}'),(372,1,'admin','admin_url','app\\admin\\controller\\CronController::saveCron','','编辑自动任务','',1894,0,'',579,'{\"CN\":\"编辑自动任务\",\"HK\":\"編輯自動任務\",\"US\":\"Edit Auto Task\"}'),(389,1,'admin','admin_url','app\\admin\\controller\\OrderController::searchPage','','搜索','',390,0,'',135,'{\"CN\":\"搜索\",\"HK\":\"搜索\",\"US\":\"Search\"}'),(390,1,'admin','admin_url','app\\admin\\controller\\OrderController::index','','订单列表','',15,0,'',132,'{\"CN\":\"订单列表\",\"HK\":\"訂單列表\",\"US\":\"Order List\"}'),(391,1,'admin','admin_url','app\\admin\\controller\\OrderController::check','','订单审核','',398,0,'',140,'{\"CN\":\"订单审核\",\"HK\":\"訂單審核\",\"US\":\"Order Review\"}'),(392,1,'admin','admin_url','app\\admin\\controller\\OrderController::cancel','','取消订单','',398,0,'',141,'{\"CN\":\"取消订单\",\"HK\":\"取消訂單\",\"US\":\"Cancel order\"}'),(393,1,'admin','admin_url','app\\admin\\controller\\OrderController::delete','','删除订单','',15,0,'',136,'{\"CN\":\"删除订单\",\"HK\":\"刪除訂單\",\"US\":\"Delete Order\"}'),(395,1,'admin','admin_url','app\\admin\\controller\\OrderController::setConfig','','选择配置','',14,0,'',127,'{\"CN\":\"选择配置\",\"HK\":\"選擇配置\",\"US\":\"Select Configuration\"}'),(396,1,'admin','admin_url','app\\admin\\controller\\OrderController::getMultiTotal','','多产品--异步请求计算总价','',14,0,'',128,'{\"CN\":\"多产品--异步请求计算总价\",\"HK\":\"多產品--異步請求計算總價\",\"US\":\"Multi-product-asynchronous request to calculate total price\"}'),(398,1,'admin','admin_url','app\\admin\\controller\\OrderController::read','','订单详情','',15,0,'',137,'{\"CN\":\"订单详情\",\"HK\":\"訂單詳情\",\"US\":\"Order Details\"}'),(399,1,'admin','admin_url','app\\admin\\controller\\OrderController::notes','','添加备注','',0,0,'',914,'{\"CN\":\"添加备注\",\"HK\":\"添加備註\",\"US\":\"Add Remarks\"}'),(400,1,'admin','admin_url','app\\admin\\controller\\OrderController::active','','审核通过','',0,0,'',915,'{\"CN\":\"审核通过\",\"HK\":\"審核通過\",\"US\":\"Approved\"}'),(401,1,'admin','admin_url','app\\admin\\controller\\OrderController::customPromoPage','','创建定制优惠码','',14,0,'',129,'{\"CN\":\"创建定制优惠码\",\"HK\":\"創建定制優惠碼\",\"US\":\"Create a custom coupon code\"}'),(402,1,'admin','admin_url','app\\admin\\controller\\OrderController::customPromo','','创建定制优惠码','',401,0,'',130,'{\"CN\":\"创建定制优惠码\",\"HK\":\"創建定制優惠碼\",\"US\":\"Create a custom coupon code\"}'),(404,1,'admin','admin_url','app\\admin\\controller\\InvoiceController','','账单列表','',408,0,'',230,'{\"CN\":\"账单列表\",\"HK\":\"賬單列表\",\"US\":\"Bill List\"}'),(405,1,'admin','admin_url','app\\admin\\controller\\AccountController','','交易流水','',1868,1,'/business-statement',192,'{\"CN\":\"交易流水\",\"HK\":\"交易流水\",\"US\":\"Trading Flow\"}'),(406,1,'admin','admin_url','app\\admin\\controller\\AccountController::searchPage','','交易流水列表搜索','',1344,0,'',194,'{\"CN\":\"交易流水列表搜索\",\"HK\":\"交易流水列表搜索\",\"US\":\"Search for Transaction Flow List\"}'),(407,1,'admin','admin_url','app\\admin\\controller\\AccountController::index','','交易流水列表','',1344,0,'',195,'{\"CN\":\"交易流水列表\",\"HK\":\"交易流水列表\",\"US\":\"Transaction Flow List\"}'),(408,1,'admin','admin_url','app\\admin\\controller\\InvoiceController','','账单管理','',1868,1,'/bill-management',204,'{\"CN\":\"账单管理\",\"HK\":\"賬單管理\",\"US\":\"Bill Management\"}'),(409,1,'admin','admin_url','app\\admin\\controller\\AccountController::save','','添加交易流水','',1453,0,'',202,'{\"CN\":\"添加交易流水\",\"HK\":\"添加交易流水\",\"US\":\"Add transaction flow\"}'),(410,1,'admin','admin_url','app\\admin\\controller\\AccountController::read','','交易流水详情','',405,0,'',196,'{\"CN\":\"交易流水详情\",\"HK\":\"交易流水詳情\",\"US\":\"Transaction Flow Details\"}'),(411,1,'admin','admin_url','app\\admin\\controller\\AccountController','','编辑交易流水','',405,0,'',197,'{\"CN\":\"编辑交易流水\",\"HK\":\"編輯交易流水\",\"US\":\"Edit transaction flow\"}'),(412,1,'admin','admin_url','app\\admin\\controller\\AccountController::delete','','删除交易流水','',405,0,'',200,'{\"CN\":\"删除交易流水\",\"HK\":\"刪除交易流水\",\"US\":\"Delete transaction flow\"}'),(413,1,'admin','admin_url','app\\admin\\controller\\CreditController::index','','余额管理','',1332,0,'',18,'{\"CN\":\"余额管理\",\"HK\":\"餘額管理\",\"US\":\"Balance Management\"}'),(414,1,'admin','admin_url','app\\admin\\controller\\CreditController::index','','用户余额列表','',413,0,'',19,'{\"CN\":\"用户余额列表\",\"HK\":\"用戶餘額列表\",\"US\":\"User Balance List\"}'),(415,1,'admin','admin_url','app\\admin\\controller\\CreditController::save','','添加编辑余额','',413,0,'',20,'{\"CN\":\"添加编辑余额\",\"HK\":\"添加編輯餘額\",\"US\":\"Add Edit Balance\"}'),(416,1,'admin','admin_url','app\\admin\\controller\\CreditController::read','','余额详情','',413,0,'',21,'{\"CN\":\"余额详情\",\"HK\":\"餘額詳情\",\"US\":\"Balance Details\"}'),(417,1,'admin','admin_url','app\\admin\\controller\\CreditController::update','','更新余额','',413,0,'',22,'{\"CN\":\"更新余额\",\"HK\":\"更新余額\",\"US\":\"Update balance\"}'),(418,1,'admin','admin_url','app\\admin\\controller\\CreditController::reduce','','减少余额','',413,0,'',23,'{\"CN\":\"减少余额\",\"HK\":\"減少餘額\",\"US\":\"Decrease balance\"}'),(419,1,'admin','admin_url','app\\admin\\controller\\CreditController::delete','','删除余额','',413,0,'',24,'{\"CN\":\"删除余额\",\"HK\":\"刪除餘額\",\"US\":\"Delete balance\"}'),(420,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller','','文件下载','',8,1,'/service-support',524,'{\"CN\":\"文件下载\",\"HK\":\"文件下載\",\"US\":\"File Download\"}'),(423,1,'admin','admin_url','app\\admin\\controller\\NewsController::getCatData','','获取分类id数据','',519,0,'',555,'{\"CN\":\"获取分类id数据\",\"HK\":\"獲取分類id數據\",\"US\":\"Get classification id data\"}'),(424,1,'admin','admin_url','app\\admin\\controller\\NewsController::postEditCat','','添加/编辑分类','',519,0,'',556,'{\"CN\":\"添加\\/编辑分类\",\"HK\":\"添加\\/編輯分類\",\"US\":\"Add\\/Edit Category\"}'),(425,1,'admin','admin_url','app\\admin\\controller\\NewsController::deleteCat','','删除分类','',519,0,'',557,'{\"CN\":\"删除分类\",\"HK\":\"刪除分類\",\"US\":\"Delete category\"}'),(426,1,'admin','admin_url','app\\admin\\controller\\NewsController::getContent','','编辑新闻页面数据','',518,0,'',549,'{\"CN\":\"编辑新闻页面数据\",\"HK\":\"編輯新聞頁面數據\",\"US\":\"Edit news page data\"}'),(427,1,'admin','admin_url','app\\admin\\controller\\NewsController::postEditContent','','添加/编辑新闻','',518,0,'',551,'{\"CN\":\"添加\\/编辑新闻\",\"HK\":\"添加\\/編輯新聞\",\"US\":\"Add\\/Edit News\"}'),(428,1,'admin','admin_url','app\\admin\\controller\\NewsController::deleteContent','','删除新闻','',518,0,'',552,'{\"CN\":\"删除新闻\",\"HK\":\"刪除新聞\",\"US\":\"Delete News\"}'),(429,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController','','后台产品','',0,0,'',918,'{\"CN\":\"后台产品\",\"HK\":\"後台產品\",\"US\":\"Background Product\"}'),(430,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::index','','查看产品/服务详情页','',28,0,'',168,'{\"CN\":\"查看产品\\/服务详情页\",\"HK\":\"查看產品\\/服務詳情頁\",\"US\":\"View product\\/service details page\"}'),(431,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::postInfo','','编辑产品/服务','',28,0,'',171,'{\"CN\":\"编辑产品\\/服务\",\"HK\":\"編輯產品\\/服務\",\"US\":\"Edit product\\/service\"}'),(432,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::postTransfer','','转移产品/服务','',28,0,'',172,'{\"CN\":\"转移产品\\/服务\",\"HK\":\"轉移產品\\/服務\",\"US\":\"Transfer Products\\/Services\"}'),(433,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::deleteHost','','删除产品/服务','',28,0,'',173,'{\"CN\":\"删除产品\\/服务\",\"HK\":\"刪除產品\\/服務\",\"US\":\"Delete product\\/service\"}'),(434,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::postSearchClient','','搜索用户','',0,0,'',919,'{\"CN\":\"搜索用户\",\"HK\":\"搜索用戶\",\"US\":\"Search User\"}'),(435,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::upgradeconfig','','升降级配置','',28,0,'',176,'{\"CN\":\"升降级配置\",\"HK\":\"升降級配置\",\"US\":\"Upgrade and Downgrade Configuration\"}'),(439,1,'admin','admin_url','app\\admin\\controller\\PluginController::plIndex','','模块插件','',1898,0,'/module-plugin',795,'{\"CN\":\"模块插件\",\"HK\":\"模塊插件\",\"US\":\"Module Plug-in\"}'),(440,1,'admin','admin_url','app\\admin\\controller\\HostController::getList','','产品/服务','',0,0,'',928,'{\"CN\":\"产品\\/服务\",\"HK\":\"產品\\/服務\",\"US\":\"Product\\/Service\"}'),(441,1,'admin','admin_url','app\\admin\\controller\\SendMessageController','','批量发送邮件','',590,0,'',894,'{\"CN\":\"批量发送邮件\",\"HK\":\"批量發送郵件\",\"US\":\"Send emails in bulk\"}'),(442,1,'admin','admin_url','app\\admin\\controller\\SendMessageController::postEmailPage','','发送邮件页面数据','',441,0,'',895,'{\"CN\":\"发送邮件页面数据\",\"HK\":\"發送郵件頁面數據\",\"US\":\"Send mail page data\"}'),(443,1,'admin','admin_url','app\\admin\\controller\\SendMessageController::postSendEmail','','发送邮件接口','',441,0,'',896,'{\"CN\":\"发送邮件接口\",\"HK\":\"發送郵件接口\",\"US\":\"Send Mail Interface\"}'),(446,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getSecondVerify','','二次验证','',1914,0,'/second',667,'{\"CN\":\"二次验证\",\"HK\":\"二次驗證\",\"US\":\"Secondary Verification\"}'),(447,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postSecondVerify','','二次验证设置','',446,0,'',668,'{\"CN\":\"二次验证设置\",\"HK\":\"二次驗證設置\",\"US\":\"Secondary Verification Settings\"}'),(448,1,'admin','admin_url','app\\admin\\controller\\ClientGroupController','','客户分组与折扣','',1901,1,'/customer-group',100,'{\"CN\":\"客户分组与折扣\",\"HK\":\"客戶分組與折扣\",\"US\":\"Customer Grouping and Discount\"}'),(450,1,'admin','admin_url','app\\admin\\controller\\ClientGroupController::save','','添加客户分组','',448,0,'',102,'{\"CN\":\"添加客户分组\",\"HK\":\"添加客戶分組\",\"US\":\"Add customer group\"}'),(451,1,'admin','admin_url','app\\admin\\controller\\ClientGroupController::read','','组详情','',0,0,'',929,'{\"CN\":\"组详情\",\"HK\":\"組詳情\",\"US\":\"Group Details\"}'),(452,1,'admin','admin_url','app\\admin\\controller\\ClientGroupController::update','','编辑客户分组','',448,0,'',103,'{\"CN\":\"编辑客户分组\",\"HK\":\"編輯客戶分組\",\"US\":\"Edit Customer Group\"}'),(453,1,'admin','admin_url','app\\admin\\controller\\ClientGroupController::delete','','删除客户分组','',448,0,'',104,'{\"CN\":\"删除客户分组\",\"HK\":\"刪除客戶分組\",\"US\":\"Delete Customer Group\"}'),(454,1,'admin','admin_url','app\\admin\\controller\\ConfigCertificontroller','','实名设置','',1901,1,'/authentication-setting',105,'{\"CN\":\"实名设置\",\"HK\":\"實名設置\",\"US\":\"Identity verification\"}'),(457,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::certifiIndex','','实名认证配置','',0,0,'',932,'{\"CN\":\"实名认证配置\",\"HK\":\"實名認證配置\",\"US\":\"Real-name authentication configuration\"}'),(458,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::certifiIndexPost','','实名认证配置页面提交','',0,0,'',933,'{\"CN\":\"实名认证配置页面提交\",\"HK\":\"實名認證配置頁面提交\",\"US\":\"Submit the real-name authentication configuration page\"}'),(462,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getGeneral','','常规设置','',1910,1,'/general-settings/general',573,'{\"CN\":\"常规设置\",\"HK\":\"常規設置\",\"US\":\"General Settings\"}'),(463,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postGeneral','','常规设置页面提交','',462,0,'',575,'{\"CN\":\"常规设置页面提交\",\"HK\":\"常規設置頁面提交\",\"US\":\"General settings page submission\"}'),(465,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postLocal','','常规设置-本地化页面提交','',0,0,'',934,'{\"CN\":\"常规设置-本地化页面提交\",\"HK\":\"常規設置-本地化頁面提交\",\"US\":\"General Settings-Localized Page Submission\"}'),(466,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getSupport','','常规设置页面-支持','',0,0,'',935,'{\"CN\":\"常规设置页面-支持\",\"HK\":\"常規設置頁面-支持\",\"US\":\"General Settings Page-Support\"}'),(467,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postSupport','','常规设置-支持页面提交','',0,0,'',936,'{\"CN\":\"常规设置-支持页面提交\",\"HK\":\"常規設置-支持頁面提交\",\"US\":\"General Settings-Support Page Submit\"}'),(469,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postAffiliate','','常规设置-推介页面提交','',1680,0,'',94,'{\"CN\":\"常规设置-推介页面提交\",\"HK\":\"常規設置-推介頁面提交\",\"US\":\"General Settings-Referral Page Submit\"}'),(470,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getSafe','','常规设置页面-安全','',0,0,'',938,'{\"CN\":\"常规设置页面-安全\",\"HK\":\"常規設置頁面-安全\",\"US\":\"General Settings Page-Security\"}'),(471,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postSafe','','常规设置-安全页面提交','',0,0,'',939,'{\"CN\":\"常规设置-安全页面提交\",\"HK\":\"常規設置-安全頁面提交\",\"US\":\"General Settings-Secure Page Submit\"}'),(472,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getOther','','常规设置页面-其他','',0,0,'',940,'{\"CN\":\"常规设置页面-其他\",\"HK\":\"常規設置頁面-其他\",\"US\":\"General Settings Page-Other\"}'),(473,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postOther','','常规设置-其他页面提交','',0,0,'',941,'{\"CN\":\"常规设置-其他页面提交\",\"HK\":\"常規設置-其他頁面提交\",\"US\":\"General Settings-Other Page Submit\"}'),(476,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getInvoice','','常规设置-账单','',0,0,'',942,'{\"CN\":\"常规设置-账单\",\"HK\":\"常規設置-賬單\",\"US\":\"General Settings-Billing\"}'),(479,1,'admin','admin_url','app\\admin\\controller\\SystemController::getInfo','','系统升级','',1915,1,'/system-message',676,'{\"CN\":\"系统升级\",\"HK\":\"系統升級\",\"US\":\"System Upgrade\"}'),(480,1,'admin','admin_url','app\\admin\\controller\\SystemController::getPhpInfo','','php信息','',1915,1,'/php-message',677,'{\"CN\":\"php信息\",\"HK\":\"php信息\",\"US\":\"php information\"}'),(481,1,'admin','admin_url','app\\admin\\controller\\SystemController','','数据库状态','',2102,1,'/database-message',702,'{\"CN\":\"数据库状态\",\"HK\":\"數據庫狀態\",\"US\":\"Database Status\"}'),(482,1,'admin','admin_url','app\\admin\\controller\\SystemController::postOptimizeTables','','优化数据表','',481,0,'',704,'{\"CN\":\"优化数据表\",\"HK\":\"優化數據表\",\"US\":\"Optimized Data Table\"}'),(483,1,'admin','admin_url','app\\admin\\controller\\SystemController::postDownDataBackup','','下载数据库备份','',481,0,'',705,'{\"CN\":\"下载数据库备份\",\"HK\":\"下載數據庫備份\",\"US\":\"Download database backup\"}'),(485,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getSystemLog','','系统日志','',1916,1,'/system-log',689,'{\"CN\":\"系统日志\",\"HK\":\"系統日誌\",\"US\":\"System Log\"}'),(486,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getAdminLog','','管理员登录日志','',1916,1,'/system-admin-log',690,'{\"CN\":\"管理员登录日志\",\"HK\":\"管理員登錄日誌\",\"US\":\"Administrator Login Log\"}'),(488,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getEmailLog','','邮件日志','',1916,1,'/email-log',691,'{\"CN\":\"邮件日志\",\"HK\":\"郵件日誌\",\"US\":\"Mail Log\"}'),(489,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getEmailDetail','','查看邮件信息','',488,0,'',692,'{\"CN\":\"查看邮件信息\",\"HK\":\"查看郵件信息\",\"US\":\"View Mail Information\"}'),(495,1,'admin','admin_url','app\\admin\\controller\\PluginController::plIndex','','插件列表','',439,0,'',796,'{\"CN\":\"插件列表\",\"HK\":\"插件列表\",\"US\":\"Plugin List\"}'),(496,1,'admin','admin_url','app\\admin\\controller\\PluginController::plInstall','','插件安装','',439,0,'',797,'{\"CN\":\"插件安装\",\"HK\":\"插件安裝\",\"US\":\"Plugin Installation\"}'),(497,1,'admin','admin_url','app\\admin\\controller\\PluginController::plUninstall','','插件卸载','',439,0,'',798,'{\"CN\":\"插件卸载\",\"HK\":\"插件卸載\",\"US\":\"Plugin Uninstallation\"}'),(498,1,'admin','admin_url','app\\admin\\controller\\PluginController::plToggle','','禁用(启用)插件','',439,0,'',799,'{\"CN\":\"禁用(启用)插件\",\"HK\":\"禁用(啟用)插件\",\"US\":\"Disable (enable) plugins\"}'),(499,1,'admin','admin_url','app\\admin\\controller\\PluginController::plSetting','','配置插件','',439,0,'',800,'{\"CN\":\"配置插件\",\"HK\":\"配置插件\",\"US\":\"Configure Plugin\"}'),(500,1,'admin','admin_url','app\\admin\\controller\\PluginController::plSettingPost','','保存插件配置','',499,0,'',801,'{\"CN\":\"保存插件配置\",\"HK\":\"保存插件配置\",\"US\":\"Save plugin configuration\"}'),(501,1,'admin','admin_url','app\\admin\\controller\\PluginController::plUpdate','','插件更新','',439,0,'',802,'{\"CN\":\"插件更新\",\"HK\":\"插件更新\",\"US\":\"Plugin Update\"}'),(502,1,'admin','admin_url','app\\admin\\controller\\ProvisionController','','后台服务模块','',590,0,'',900,'{\"CN\":\"后台服务模块\",\"HK\":\"後台服務模塊\",\"US\":\"Background Service Module\"}'),(503,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::getModules','','获取所有模块','',502,0,'',901,'{\"CN\":\"获取所有模块\",\"HK\":\"獲取所有模塊\",\"US\":\"Get all modules\"}'),(504,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::getMetaData','','获取模块metadata','',502,0,'',902,'{\"CN\":\"获取模块metadata\",\"HK\":\"獲取模塊metadata\",\"US\":\"Get module metadata\"}'),(505,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::getModuleConfig','','获取模块设置','',502,0,'',903,'{\"CN\":\"获取模块设置\",\"HK\":\"獲取模塊設置\",\"US\":\"Get Module Settings\"}'),(506,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::execute','','执行开通,暂停,解除暂停,删除,修改密码','',502,0,'',904,'{\"CN\":\"执行开通,暂停,解除暂停,删除,修改密码\",\"HK\":\"執行開通,暫停,解除暫停,刪除,修改密碼\",\"US\":\"Execute activation, suspension, release suspension, delete, change password\"}'),(507,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::execAdmin','','执行模块自定义方法','',502,0,'',905,'{\"CN\":\"执行模块自定义方法\",\"HK\":\"執行模塊自定義方法\",\"US\":\"Execute module custom method\"}'),(512,1,'admin','admin_url','app\\admin\\controller\\SetController','','自定义客户字段','',1901,1,'/customer-custom',88,'{\"CN\":\"自定义客户字段\",\"HK\":\"自定義客戶字段\",\"US\":\"Custom Customer Field\"}'),(516,1,'admin','admin_url','app\\admin\\controller\\CancelRequestController','','取消续费','',0,0,'/cancel-request',804,'{\"CN\":\"取消续费\",\"HK\":\"取消續費\",\"US\":\"Cancel renewal\"}'),(518,1,'admin','admin_url','app\\admin\\controller\\NewsController::getList','','新闻列表','',1316,1,'/news-list',547,'{\"CN\":\"新闻列表\",\"HK\":\"新聞列表\",\"US\":\"News List\"}'),(519,1,'admin','admin_url','app\\admin\\controller\\NewsController::getCatsPage','','新闻分类','',1316,1,'/news-category',553,'{\"CN\":\"新闻分类\",\"HK\":\"新聞分類\",\"US\":\"News Category\"}'),(524,1,'admin','admin_url','app\\admin\\controller\\ProductController::getProuductlistPage','','商品设置','',18,0,'/product-server',362,'{\"CN\":\"商品设置\",\"HK\":\"商品設置\",\"US\":\"Commodity Setting\"}'),(525,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::groupsList','','全局产品配置','',18,0,'/configurable-option',376,'{\"CN\":\"全局产品配置\",\"HK\":\"全局產品配置\",\"US\":\"Global Product Configuration\"}'),(526,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::groupsList','','可配置选项','',18,0,'/configurable-option',377,'{\"CN\":\"可配置选项\",\"HK\":\"可配置選項\",\"US\":\"Configurable Options\"}'),(527,1,'admin','admin_url','','','接口设置','',5,0,'',430,'{\"CN\":\"接口设置\",\"HK\":\"接口設置\",\"US\":\"Interface Settings\"}'),(528,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::serverList','','通用接口','',1876,1,'/server-settings',399,'{\"CN\":\"通用接口\",\"HK\":\"通用接口\",\"US\":\"Universal Interface\"}'),(530,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::configMobile','','接口设置','',1913,1,'/sms-template/sms',627,'{\"CN\":\"接口设置\",\"HK\":\"接口設置\",\"US\":\"Interface Settings\"}'),(531,1,'admin','admin_url','app\\admin\\controller\\EmailTemplateController::emailList','','邮件模板','',1913,1,'/email-list',634,'{\"CN\":\"邮件模板\",\"HK\":\"郵件模板\",\"US\":\"Mail Template\"}'),(533,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::templateList','','短信模板','',1913,1,'/sms-template-index',647,'{\"CN\":\"短信模板\",\"HK\":\"短信模板\",\"US\":\"SMS template\"}'),(536,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::SetSmsTemplate','','发送设置','',1913,1,'/sms-send-settings',660,'{\"CN\":\"发送设置\",\"HK\":\"發送設置\",\"US\":\"Send Settings\"}'),(542,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller','','实名认证','',1860,1,'/customer-authentication',34,'{\"CN\":\"实名认证\",\"HK\":\"實名認證\",\"US\":\"Real-name authentication\"}'),(555,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::hostRenew','','续费','',28,0,'',149,'{\"CN\":\"续费\",\"HK\":\"續費\",\"US\":\"Renewal\"}'),(557,1,'admin','admin_url','app\\admin\\controller\\ConfigCertificontroller::type','','获取认证类型','',1336,0,'',107,'{\"CN\":\"获取认证类型\",\"HK\":\"獲取認證類型\",\"US\":\"Obtain authentication type\"}'),(558,1,'admin','admin_url','app\\admin\\controller\\ConfigCertificontroller::alipay_biz_code','','获取阿里认证类型','',1336,0,'',108,'{\"CN\":\"获取阿里认证类型\",\"HK\":\"獲取阿里認證類型\",\"US\":\"Get Ali certification type\"}'),(559,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::registerlogin','','注册登录提交','',0,0,'',817,'{\"CN\":\"注册登录提交\",\"HK\":\"註冊登錄提交\",\"US\":\"Registration Login Submit\"}'),(560,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::postrecharge','','常规设置-充值页面-提交','',0,0,'',818,'{\"CN\":\"常规设置-充值页面-提交\",\"HK\":\"常規設置-充值頁面-提交\",\"US\":\"General Settings-Top Up Page-Submit\"}'),(561,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::postinvoice','','常规设置-账单页面-提交','',476,0,'',943,'{\"CN\":\"常规设置-账单页面-提交\",\"HK\":\"常規設置-賬單頁面-提交\",\"US\":\"General Settings-Billing Page-Submit\"}'),(562,1,'admin','admin_url','app\\admin\\controller\\CancelRequestcontroller::getlist','','待审核取消请求','',516,0,'',805,'{\"CN\":\"待审核取消请求\",\"HK\":\"待審核取消請求\",\"US\":\"Pending review cancellation request\"}'),(563,1,'admin','admin_url','app\\admin\\controller\\CancelRequestcontroller::getcancellist','','已审核取消请求','',516,0,'',806,'{\"CN\":\"已审核取消请求\",\"HK\":\"已審核取消請求\",\"US\":\"Cancellation request has been reviewed\"}'),(564,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::certifistatus','','修改认证状态','',542,0,'',38,'{\"CN\":\"修改认证状态\",\"HK\":\"修改認證狀態\",\"US\":\"Modify authentication status\"}'),(566,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::edititem','','编辑账单摘要','',1342,0,'',224,'{\"CN\":\"编辑账单摘要\",\"HK\":\"編輯賬單摘要\",\"US\":\"Edit Bill Summary\"}'),(588,1,'admin','admin_url','app\\admin\\controller\\RbacController::index','','分组权限','',1912,1,'/permissions-managment',593,'{\"CN\":\"分组权限\",\"HK\":\"分組權限\",\"US\":\"Group Permission\"}'),(590,1,'admin','admin_url','','','其他权限','',0,0,'',851,'{\"CN\":\"其他权限\",\"HK\":\"其他權限\",\"US\":\"Other permissions\"}'),(591,1,'admin','admin_url','app\\admin\\controller\\Newscontroller::getCateList','','新闻分类所有数据','',426,0,'',550,'{\"CN\":\"新闻分类所有数据\",\"HK\":\"新聞分類所有數據\",\"US\":\"All data of news classification\"}'),(592,1,'admin','admin_url','app\\admin\\controller\\Ordercontroller::checkProduct','','验证','',0,0,'',906,'{\"CN\":\"验证\",\"HK\":\"驗證\",\"US\":\"Verify\"}'),(600,1,'admin','admin_url','app\\admin\\controller\\Announcecontroller::getList','','站点公告列表数据','',604,0,'',867,'{\"CN\":\"站点公告列表数据\",\"HK\":\"站點公告列表數據\",\"US\":\"Site announcement list data\"}'),(601,1,'admin','admin_url','app\\admin\\controller\\Announcecontroller::deleteList','','删除站点公告','',604,0,'',868,'{\"CN\":\"删除站点公告\",\"HK\":\"刪除站點公告\",\"US\":\"Delete site announcement\"}'),(602,1,'admin','admin_url','app\\admin\\controller\\Announcecontroller::getManage','','公告内页数据','',604,0,'',869,'{\"CN\":\"公告内页数据\",\"HK\":\"公告內頁數據\",\"US\":\"Announcement Inner Page Data\"}'),(603,1,'admin','admin_url','app\\admin\\controller\\Announcecontroller::postSave','','保存公告','',604,0,'',870,'{\"CN\":\"保存公告\",\"HK\":\"保存公告\",\"US\":\"Save Announcement\"}'),(604,1,'admin','admin_url','app\\admin\\controller\\Announcecontroller','','站点公告','',590,0,'',866,'{\"CN\":\"站点公告\",\"HK\":\"站點公告\",\"US\":\"Site Notice\"}'),(855,1,'admin','admin_url','app\\admin\\controller\\CancelRequestcontroller::deleteList','','删除取消请求','',516,0,'',807,'{\"CN\":\"删除取消请求\",\"HK\":\"刪除取消請求\",\"US\":\"Delete cancellation request\"}'),(887,1,'admin','admin_url','app\\admin\\controller\\ConfigCertificontroller::update','','修改实名认证设置','',454,0,'',111,'{\"CN\":\"修改实名认证设置\",\"HK\":\"修改實名認證設置\",\"US\":\"Modify real-name authentication settings\"}'),(922,1,'admin','admin_url','app\\admin\\controller\\ContractController','','后台合同模块','',590,0,'',871,'{\"CN\":\"后台合同模块\",\"HK\":\"後台合同模塊\",\"US\":\"Background contract module\"}'),(984,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::addServer','','添加接口','',1813,0,'',415,'{\"CN\":\"添加接口\",\"HK\":\"添加接口\",\"US\":\"Add interface\"}'),(985,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::editServer','','编辑接口','',1813,0,'',416,'{\"CN\":\"编辑接口\",\"HK\":\"編輯接口\",\"US\":\"Edit Interface\"}'),(986,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::serverDetail','','接口详情','',1813,0,'',417,'{\"CN\":\"接口详情\",\"HK\":\"接口詳情\",\"US\":\"Interface Details\"}'),(987,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::delServer','','删除接口','',1813,0,'',418,'{\"CN\":\"删除接口\",\"HK\":\"刪除接口\",\"US\":\"Delete interface\"}'),(989,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::refreshServerStatus','','获取服务器状态','',1813,0,'',419,'{\"CN\":\"获取服务器状态\",\"HK\":\"獲取服務器狀態\",\"US\":\"Get server status\"}'),(990,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::refreshAllServerStatus','','刷新所有服务器状态','',0,0,'',944,'{\"CN\":\"刷新所有服务器状态\",\"HK\":\"刷新所有服務器狀態\",\"US\":\"Refresh all server status\"}'),(992,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::delRecord','','删除购买记录','',27,0,'',146,'{\"CN\":\"删除购买记录\",\"HK\":\"刪除購買記錄\",\"US\":\"Delete Purchase Record\"}'),(994,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::addFlowPacketPage','','添加流量包','',19,0,'',393,'{\"CN\":\"添加流量包\",\"HK\":\"添加流量包\",\"US\":\"Add Traffic Package\"}'),(995,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::editFlowPacketPage','','修改流量包','',19,0,'',395,'{\"CN\":\"修改流量包\",\"HK\":\"修改流量包\",\"US\":\"Modify Traffic Package\"}'),(996,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::addFlowPacket','','添加流量包','',994,0,'',394,'{\"CN\":\"添加流量包\",\"HK\":\"添加流量包\",\"US\":\"Add Traffic Package\"}'),(997,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::editFlowPacket','','修改流量包','',995,0,'',396,'{\"CN\":\"修改流量包\",\"HK\":\"修改流量包\",\"US\":\"Modify Traffic Package\"}'),(998,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::delFlowPacket','','删除流量包','',19,0,'',397,'{\"CN\":\"删除流量包\",\"HK\":\"刪除流量包\",\"US\":\"Delete traffic package\"}'),(999,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::suspendPage','','暂停','',1397,0,'',156,'{\"CN\":\"暂停\",\"HK\":\"暫停\",\"US\":\"Pause\"}'),(1000,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::execute','','解除暂停','',1397,0,'',158,'{\"CN\":\"解除暂停\",\"HK\":\"解除暫停\",\"US\":\"Unsuspend\"}'),(1001,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::execute','','删除','',1397,0,'',159,'{\"CN\":\"删除\",\"HK\":\"刪除\",\"US\":\"Delete\"}'),(1002,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::on','','开机','',1397,0,'',160,'{\"CN\":\"开机\",\"HK\":\"開機\",\"US\":\"Turn on\"}'),(1003,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::off','','关机','',1397,0,'',161,'{\"CN\":\"关机\",\"HK\":\"關機\",\"US\":\"Shutdown\"}'),(1004,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::reboot','','重启','',1397,0,'',162,'{\"CN\":\"重启\",\"HK\":\"重啟\",\"US\":\"Restart\"}'),(1005,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::download','','下载java文件','',0,0,'',947,'{\"CN\":\"下载java文件\",\"HK\":\"下載java文件\",\"US\":\"Download java file\"}'),(1006,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::bmc','','重置BMC','',1397,0,'',163,'{\"CN\":\"重置BMC\",\"HK\":\"重置BMC\",\"US\":\"Reset BMC\"}'),(1007,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::getReinstallStatus','','获取重装,救援系统,破解密码进度','',430,0,'',170,'{\"CN\":\"获取重装,救援系统,破解密码进度\",\"HK\":\"獲取重裝,救援系統,破解密碼進度\",\"US\":\"Get reinstallation, rescue system, password cracking progress\"}'),(1008,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::kvm','','获取kvm','',1397,0,'',164,'{\"CN\":\"获取kvm\",\"HK\":\"獲取kvm\",\"US\":\"Get kvm\"}'),(1009,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::ikvm','','获取ikvm','',1397,0,'',165,'{\"CN\":\"获取ikvm\",\"HK\":\"獲取ikvm\",\"US\":\"Get ikvm\"}'),(1010,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::getTrafficUsage','','获取用量信息','',0,0,'',948,'{\"CN\":\"获取用量信息\",\"HK\":\"獲取用量信息\",\"US\":\"Get usage information\"}'),(1011,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::cancelReinstall','','取消重装,救援,破解密码','',0,0,'',949,'{\"CN\":\"取消重装,救援,破解密码\",\"HK\":\"取消重裝,救援,破解密碼\",\"US\":\"Cancel reinstallation, rescue, crack password\"}'),(1012,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::unsuspendReload','','重装解除暂停','',0,0,'',950,'{\"CN\":\"重装解除暂停\",\"HK\":\"重裝解除暫停\",\"US\":\"Reloading to release pause\"}'),(1013,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::getList','','文档下载分类页数据','',420,0,'',534,'{\"CN\":\"文档下载分类页数据\",\"HK\":\"文檔下載分類頁數據\",\"US\":\"Document download category page data\"}'),(1014,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postCreate','','文档下载添加分类','',420,0,'',536,'{\"CN\":\"文档下载添加分类\",\"HK\":\"文檔下載添加分類\",\"US\":\"File download add category\"}'),(1015,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::getEdit','','文档下载编辑分类','',420,0,'',537,'{\"CN\":\"文档下载编辑分类\",\"HK\":\"文檔下載編輯分類\",\"US\":\"Document download editing category\"}'),(1016,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postUpdate','','编辑分类保存数据','',420,0,'',538,'{\"CN\":\"编辑分类保存数据\",\"HK\":\"編輯分類保存數據\",\"US\":\"Edit classification and save data\"}'),(1017,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::deleteCat','','删除分类数据','',420,0,'',539,'{\"CN\":\"删除分类数据\",\"HK\":\"刪除分類數據\",\"US\":\"Delete classification data\"}'),(1018,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postAddFile','','添加文件','',420,0,'',541,'{\"CN\":\"添加文件\",\"HK\":\"添加文件\",\"US\":\"Add File\"}'),(1019,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::getFilePage','','编辑文件','',420,0,'',542,'{\"CN\":\"编辑文件\",\"HK\":\"編輯文件\",\"US\":\"Edit File\"}'),(1020,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postSaveFile','','保存文件信息','',420,0,'',543,'{\"CN\":\"保存文件信息\",\"HK\":\"保存文件信息\",\"US\":\"Save file information\"}'),(1021,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::deleteFile','','删除文件','',420,0,'',544,'{\"CN\":\"删除文件\",\"HK\":\"刪除文件\",\"US\":\"Delete File\"}'),(1035,1,'admin','admin_url','app\\admin\\controller\\Indexcontroller','','后台首页','',590,0,'',852,'{\"CN\":\"后台首页\",\"HK\":\"後台首頁\",\"US\":\"Backstage Homepage\"}'),(1036,1,'admin','admin_url','app\\admin\\controller\\Indexcontroller::index','','首页','',1035,0,'',853,'{\"CN\":\"首页\",\"HK\":\"首頁\",\"US\":\"Homepage\"}'),(1037,1,'admin','admin_url','app\\admin\\controller\\Indexcontroller::ad_index','','菜单','',1035,0,'',854,'{\"CN\":\"菜单\",\"HK\":\"菜單\",\"US\":\"Menu\"}'),(1040,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::paid','','标记为已支付','',1342,0,'',216,'{\"CN\":\"标记为已支付\",\"HK\":\"標記為已支付\",\"US\":\"Mark as paid\"}'),(1041,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::unpaid','','标记为未支付','',1342,0,'',217,'{\"CN\":\"标记为未支付\",\"HK\":\"標記為未支付\",\"US\":\"Mark as unpaid\"}'),(1042,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::cancelled','','标记为被取消','',1342,0,'',218,'{\"CN\":\"标记为被取消\",\"HK\":\"標記為被取消\",\"US\":\"Mark as cancelled\"}'),(1043,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::delete','','删除账单','',408,0,'',206,'{\"CN\":\"删除账单\",\"HK\":\"刪除賬單\",\"US\":\"Delete Bill\"}'),(1044,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::duplicate','','复制账单','',1342,0,'',219,'{\"CN\":\"复制账单\",\"HK\":\"複製賬單\",\"US\":\"Copy Bill\"}'),(1045,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::summary','','账单详情','',408,0,'',207,'{\"CN\":\"账单详情\",\"HK\":\"賬單詳情\",\"US\":\"Bill Details\"}'),(1046,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::addPayPage','','新增付款','',1045,0,'',208,'{\"CN\":\"新增付款\",\"HK\":\"新增付款\",\"US\":\"Add Payment\"}'),(1047,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::addPay','','编辑新增付款','',1342,0,'',220,'{\"CN\":\"编辑新增付款\",\"HK\":\"編輯新增付款\",\"US\":\"Edit new payment\"}'),(1048,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::optionPage','','选项','',1045,0,'',209,'{\"CN\":\"选项\",\"HK\":\"選項\",\"US\":\"Options\"}'),(1049,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::option','','编辑选项','',1342,0,'',221,'{\"CN\":\"编辑选项\",\"HK\":\"編輯選項\",\"US\":\"Editing Options\"}'),(1050,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::addPayInvoicePage','','余额','',1045,0,'',210,'{\"CN\":\"余额\",\"HK\":\"餘額\",\"US\":\"Balance\"}'),(1051,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::addPayInvoice','','添加付款金额到账单','',1343,0,'',226,'{\"CN\":\"添加付款金额到账单\",\"HK\":\"添加付款金額到賬單\",\"US\":\"Add the payment amount to the bill\"}'),(1052,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::deletePayInvoice','','从账单中删除付款金额','',1343,0,'',227,'{\"CN\":\"从账单中删除付款金额\",\"HK\":\"從賬單中刪除付款金額\",\"US\":\"Remove the payment amount from the bill\"}'),(1053,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::refundPage','','退款','',1045,0,'',211,'{\"CN\":\"退款\",\"HK\":\"退款\",\"US\":\"Refund\"}'),(1054,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::refund','','编辑账单退款','',1342,0,'',222,'{\"CN\":\"编辑账单退款\",\"HK\":\"編輯賬單退款\",\"US\":\"Edit Bill Refund\"}'),(1055,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::notesPage','','备注','',1045,0,'',212,'{\"CN\":\"备注\",\"HK\":\"備註\",\"US\":\"Remarks\"}'),(1056,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::notes','','编辑账单备注','',1342,0,'',223,'{\"CN\":\"编辑账单备注\",\"HK\":\"編輯賬單備註\",\"US\":\"Edit billing notes\"}'),(1057,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::invoceEmail','','发送账单邮件','',1341,0,'',214,'{\"CN\":\"发送账单邮件\",\"HK\":\"發送賬單郵件\",\"US\":\"Send billing email\"}'),(1059,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::deleteItems','','账单项目删除','',1343,0,'',228,'{\"CN\":\"账单项目删除\",\"HK\":\"賬單項目刪除\",\"US\":\"Delete bill item\"}'),(1060,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::delAccount','','删除账单流水','',1343,0,'',229,'{\"CN\":\"删除账单流水\",\"HK\":\"刪除賬單流水\",\"US\":\"Delete bill flow\"}'),(1061,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::createRenew','','生成续费账单','',0,0,'',815,'{\"CN\":\"生成续费账单\",\"HK\":\"生成續費賬單\",\"US\":\"Generate renewal bill\"}'),(1062,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::invoicePayAfterHandle','','获取收入数据','',0,0,'',816,'{\"CN\":\"获取收入数据\",\"HK\":\"獲取收入數據\",\"US\":\"Get income data\"}'),(1065,1,'admin','admin_url','app\\admin\\controller\\InvoiceItemscontroller::save','','添加账单项目','',1070,0,'',862,'{\"CN\":\"添加账单项目\",\"HK\":\"添加賬單項目\",\"US\":\"Add bill item\"}'),(1066,1,'admin','admin_url','app\\admin\\controller\\InvoiceItemscontroller::read','','账单项目列表','',1070,0,'',863,'{\"CN\":\"账单项目列表\",\"HK\":\"賬單項目列表\",\"US\":\"List of billing items\"}'),(1068,1,'admin','admin_url','app\\admin\\controller\\InvoiceItemscontroller::update','','账单项目批量更新','',1070,0,'',864,'{\"CN\":\"账单项目批量更新\",\"HK\":\"賬單項目批量更新\",\"US\":\"Batch update of billing items\"}'),(1069,1,'admin','admin_url','app\\admin\\controller\\InvoiceItemscontroller::delete','','账单项目删除','',1070,0,'',865,'{\"CN\":\"账单项目删除\",\"HK\":\"賬單項目刪除\",\"US\":\"Delete bill item\"}'),(1070,1,'admin','admin_url','app\\admin\\controller\\InvoiceItemscontroller','','账单项目管理','',590,0,'',861,'{\"CN\":\"账单项目管理\",\"HK\":\"賬單項目管理\",\"US\":\"Bill Project Management\"}'),(1174,1,'admin','admin_url','app\\admin\\controller\\Publiccontroller::getMenu','','获取用户菜单数据','',157,0,'',887,'{\"CN\":\"获取用户菜单数据\",\"HK\":\"獲取用戶菜單數據\",\"US\":\"Get user menu data\"}'),(1176,1,'admin','admin_url','app\\admin\\controller\\Publiccontroller::getClient','','后台用户列表','',338,0,'',299,'{\"CN\":\"后台用户列表\",\"HK\":\"後台用戶列表\",\"US\":\"Background user list\"}'),(1177,1,'admin','admin_url','app\\admin\\controller\\Publiccontroller::getTicketDepartment','','后台工单部门列表','',157,0,'',888,'{\"CN\":\"后台工单部门列表\",\"HK\":\"後台工單部門列表\",\"US\":\"Backstage Ticket department list\"}'),(1266,1,'admin','admin_url','app\\admin\\controller\\Uploadcontroller::upload','','富文本框上传图片','',1269,0,'',898,'{\"CN\":\"富文本框上传图片\",\"HK\":\"富文本框上傳圖片\",\"US\":\"Rich text box upload picture\"}'),(1267,1,'admin','admin_url','app\\admin\\controller\\Uploadcontroller::uploadImage','','上传图片','',1269,0,'',899,'{\"CN\":\"上传图片\",\"HK\":\"上傳圖片\",\"US\":\"Upload Picture\"}'),(1268,1,'admin','admin_url','app\\admin\\controller\\Uploadcontroller::uploadFile','','上传文件','',350,0,'',314,'{\"CN\":\"上传文件\",\"HK\":\"上傳文件\",\"US\":\"Upload file\"}'),(1269,1,'admin','admin_url','app\\admin\\controller\\Uploadcontroller','','文件上传','',590,0,'',897,'{\"CN\":\"文件上传\",\"HK\":\"文件上傳\",\"US\":\"File upload\"}'),(1279,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::summary','','查看客户摘要','',13,0,'',32,'{\"CN\":\"查看客户摘要\",\"HK\":\"查看客戶摘要\",\"US\":\"View customer summary\"}'),(1280,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller','','个人资料','',13,0,'',6,'{\"CN\":\"个人资料\",\"HK\":\"個人資料\",\"US\":\"Personal Information\"}'),(1281,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::profilePost','','修改个人资料','',1280,0,'',7,'{\"CN\":\"修改个人资料\",\"HK\":\"修改個人資料\",\"US\":\"Modify Personal Information\"}'),(1282,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::createClient','','创建客户','',1,0,'',2,'{\"CN\":\"创建客户\",\"HK\":\"創建客戶\",\"US\":\"Create Customer\"}'),(1284,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::closeClient','','关闭客户','',1332,0,'',15,'{\"CN\":\"关闭客户\",\"HK\":\"關閉客戶\",\"US\":\"Close Client\"}'),(1285,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::deleteClient','','删除客户','',1332,0,'',16,'{\"CN\":\"删除客户\",\"HK\":\"刪除客戶\",\"US\":\"Delete Customer\"}'),(1286,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::logRecord','','用户日志记录','',1916,0,'',680,'{\"CN\":\"用户日志记录\",\"HK\":\"用戶日誌記錄\",\"US\":\"User Log Record\"}'),(1287,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::cerify_list','','认证列表','',0,0,'',808,'{\"CN\":\"认证列表\",\"HK\":\"認證列表\",\"US\":\"Certification List\"}'),(1289,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::certifiPersonDetail','','客户个人实名认证详情','',542,0,'',35,'{\"CN\":\"客户个人实名认证详情\",\"HK\":\"客戶個人實名認證詳情\",\"US\":\"Customer\'s personal real-name authentication details\"}'),(1290,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::certifiPersonModify','','客户个人实名认证修改','',0,0,'',809,'{\"CN\":\"客户个人实名认证修改\",\"HK\":\"客戶個人實名認證修改\",\"US\":\"Customer personal real-name authentication modification\"}'),(1291,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::certifiCompanyDetail','','客户企业实名认证详情','',542,0,'',36,'{\"CN\":\"客户企业实名认证详情\",\"HK\":\"客戶企業實名認證詳情\",\"US\":\"Customer company real-name authentication details\"}'),(1292,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::certifiCompanyModify','','客户企业实名认证修改','',0,0,'',810,'{\"CN\":\"客户企业实名认证修改\",\"HK\":\"客戶企業實名認證修改\",\"US\":\"Customer company real-name authentication modification\"}'),(1293,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::certifiPersonDownload','','客户个人认证图片下载','',0,0,'',811,'{\"CN\":\"客户个人认证图片下载\",\"HK\":\"客戶個人認證圖片下載\",\"US\":\"Customer personal authentication picture download\"}'),(1294,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::certifiDownload','','下载认证资料','',542,0,'',37,'{\"CN\":\"下载认证资料\",\"HK\":\"下載認證資料\",\"US\":\"Download certification information\"}'),(1296,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::userInvoice','','用户账单列表','',404,0,'',231,'{\"CN\":\"用户账单列表\",\"HK\":\"用戶賬單列表\",\"US\":\"User Bill List\"}'),(1297,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::addUserInvoice','','添加账单','',408,0,'',205,'{\"CN\":\"添加账单\",\"HK\":\"添加賬單\",\"US\":\"Add Bill\"}'),(1298,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::loginByUser','','以该客户登录','',1332,0,'',17,'{\"CN\":\"以该客户登录\",\"HK\":\"以該客戶登錄\",\"US\":\"Log in as this customer\"}'),(1299,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::relationUserList','','用户关系列表','',0,0,'',813,'{\"CN\":\"用户关系列表\",\"HK\":\"用戶關係列表\",\"US\":\"User Relationship List\"}'),(1300,1,'admin','admin_url','app\\admin\\controller\\UserRemarkcontroller::index','','显示资源列表','',1307,0,'',856,'{\"CN\":\"显示资源列表\",\"HK\":\"顯示資源列表\",\"US\":\"Display resource list\"}'),(1302,1,'admin','admin_url','app\\admin\\controller\\UserRemarkcontroller::save','','显示资源列表','',1307,0,'',857,'{\"CN\":\"显示资源列表\",\"HK\":\"顯示資源列表\",\"US\":\"Display resource list\"}'),(1303,1,'admin','admin_url','app\\admin\\controller\\UserRemarkcontroller::read','','显示指定的资源','',1307,0,'',858,'{\"CN\":\"显示指定的资源\",\"HK\":\"顯示指定的資源\",\"US\":\"Display the specified resource\"}'),(1305,1,'admin','admin_url','app\\admin\\controller\\UserRemarkcontroller::update','','保存更新的资源','',1307,0,'',859,'{\"CN\":\"保存更新的资源\",\"HK\":\"保存更新的資源\",\"US\":\"Save updated resources\"}'),(1306,1,'admin','admin_url','app\\admin\\controller\\UserRemarkcontroller::delete','','删除指定资源','',1307,0,'',860,'{\"CN\":\"删除指定资源\",\"HK\":\"刪除指定資源\",\"US\":\"Delete the specified resource\"}'),(1307,1,'admin','admin_url','app\\admin\\controller\\UserRemarkcontroller','','资源','',590,0,'',855,'{\"CN\":\"资源\",\"HK\":\"資源\",\"US\":\"Resources\"}'),(1316,1,'admin','admin_url','app\\admin\\controller\\NewsController','','新闻中心','',8,1,'',545,'{\"CN\":\"新闻中心\",\"HK\":\"新聞中心\",\"US\":\"News Center\"}'),(1317,1,'admin','admin_url','app\\admin\\controller\\NewsController::getList','','帮助列表','',2067,1,'/help-list',559,'{\"CN\":\"帮助列表\",\"HK\":\"幫助列表\",\"US\":\"Help List\"}'),(1318,1,'admin','admin_url','app\\admin\\controller\\NewsController::getCatsPage','','帮助分类','',2067,1,'/help-category',560,'{\"CN\":\"帮助分类\",\"HK\":\"幫助分類\",\"US\":\"Help Classification\"}'),(1320,1,'admin','admin_url','ticsetting','','工单设置','',7,1,'',321,'{\"CN\":\"工单设置\",\"HK\":\"工单設置\",\"US\":\"Ticket Settings\"}'),(1321,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getSmsLog','','短信日志','',1916,1,'/sms-log',681,'{\"CN\":\"短信日志\",\"HK\":\"短信日誌\",\"US\":\"SMS log\"}'),(1329,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::common','','主页','',0,0,'',819,'{\"CN\":\"主页\",\"HK\":\"主頁\",\"US\":\"Homepage\"}'),(1330,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::getuser','','获取指定客户信息','',13,0,'',31,'{\"CN\":\"获取指定客户信息\",\"HK\":\"獲取指定客戶信息\",\"US\":\"Get specific customer information\"}'),(1331,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::refreshPowerStatus','','获取电源状态','',430,0,'',169,'{\"CN\":\"获取电源状态\",\"HK\":\"獲取電源狀態\",\"US\":\"Get power status\"}'),(1332,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::summary','','修改客户摘要','',13,0,'',14,'{\"CN\":\"修改客户摘要\",\"HK\":\"修改客戶摘要\",\"US\":\"Modify Customer Summary\"}'),(1334,1,'admin','admin_url','app\\admin\\controller\\SetController::postCustomFields','','新增/修改客户自定义字段','',512,0,'',89,'{\"CN\":\"新增\\/修改客户自定义字段\",\"HK\":\"新增\\/修改客戶自定義字段\",\"US\":\"Add\\/modify customer-defined fields\"}'),(1335,1,'admin','admin_url','app\\admin\\controller\\SetController::delCustomFields','','删除客户自定义字段','',512,0,'',90,'{\"CN\":\"删除客户自定义字段\",\"HK\":\"刪除客戶自定義字段\",\"US\":\"Delete customer custom fields\"}'),(1336,1,'admin','admin_url','app\\admin\\controller\\ConfigCertificontroller::detail','','实名认证设置详情','',454,0,'/authentication-setting',106,'{\"CN\":\"实名认证设置详情\",\"HK\":\"實名認證設置詳情\",\"US\":\"Real-name authentication setting details\"}'),(1337,1,'admin','admin_url','app\\admin\\controller\\OrderController::save','','添加提交订单','',14,0,'',125,'{\"CN\":\"添加提交订单\",\"HK\":\"添加提交訂單\",\"US\":\"Add Submit Order\"}'),(1338,1,'admin','admin_url','app\\admin\\controller\\OrderController::changeStatus','','修改订单状态','',398,0,'',138,'{\"CN\":\"修改订单状态\",\"HK\":\"修改訂單狀態\",\"US\":\"Modify order status\"}'),(1339,1,'admin','admin_url','app\\admin\\controller\\InvoiceController::index','','账单列表页','',404,0,'',232,'{\"CN\":\"账单列表页\",\"HK\":\"賬單列表頁\",\"US\":\"Bill List Page\"}'),(1340,1,'admin','admin_url','app\\admin\\controller\\InvoiceController::searchPage','','账单列表页搜索','',404,1,'/bill-management',233,'{\"CN\":\"账单列表页搜索\",\"HK\":\"賬單列表頁搜索\",\"US\":\"Search Bill List Page\"}'),(1341,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::summary','','账单摘要','',1045,0,'',213,'{\"CN\":\"账单摘要\",\"HK\":\"賬單摘要\",\"US\":\"Bill Summary\"}'),(1342,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::edititem','','编辑账单','',408,0,'',215,'{\"CN\":\"编辑账单\",\"HK\":\"編輯賬單\",\"US\":\"Edit Bill\"}'),(1343,1,'admin','admin_url','app\\admin\\controller\\Invoicecontroller::addPayInvoicePage','','编辑账单余额','',1342,0,'',225,'{\"CN\":\"编辑账单余额\",\"HK\":\"編輯賬單餘額\",\"US\":\"Edit bill balance\"}'),(1344,1,'admin','admin_url','app\\admin\\controller\\AccountController','','交易流水列表','',405,0,'',193,'{\"CN\":\"交易流水列表\",\"HK\":\"交易流水列表\",\"US\":\"Transaction Flow List\"}'),(1346,1,'admin','admin_url','app\\admin\\controller\\AccountController::update','','编辑交易流水提交','',1436,0,'',199,'{\"CN\":\"编辑交易流水提交\",\"HK\":\"編輯交易流水提交\",\"US\":\"Edit transaction flow submission\"}'),(1353,1,'admin','admin_url','app\\admin\\controller\\ProductController','','产品分组','',29,0,'',444,'{\"CN\":\"产品分组\",\"HK\":\"產品分組\",\"US\":\"Product Group\"}'),(1354,1,'admin','admin_url','app\\admin\\controller\\Publiccontroller::getTicketDepartment','','后台工单部门列表','',338,0,'',297,'{\"CN\":\"后台工单部门列表\",\"HK\":\"後台工單部門列表\",\"US\":\"Backstage ticket department list\"}'),(1359,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::configMobile','','短信设置','',530,0,'/sms-template/sms',628,'{\"CN\":\"短信设置\",\"HK\":\"短信設置\",\"US\":\"SMS Settings\"}'),(1360,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::emailIndex','','邮件设置','',530,0,'',631,'{\"CN\":\"邮件设置\",\"HK\":\"郵件設置\",\"US\":\"Mail Settings\"}'),(1361,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::emailIndex','','邮件设置详情','',1360,0,'',632,'{\"CN\":\"邮件设置详情\",\"HK\":\"郵件設置詳情\",\"US\":\"Mail setting details\"}'),(1362,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::configMobile','','短信模板列表接口数据','',1363,1,'/sms-template/sms',649,'{\"CN\":\"短信模板列表接口数据\",\"HK\":\"短信模板列表接口數據\",\"US\":\"SMS template list interface data\"}'),(1363,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::templateList','','短信模板列表','',533,0,'/sms-template-index',648,'{\"CN\":\"短信模板列表\",\"HK\":\"短信模板列表\",\"US\":\"SMS template list\"}'),(1364,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::updateTemStatus','','更新审核状态','',533,0,'/sms-template-index',650,'{\"CN\":\"更新审核状态\",\"HK\":\"更新審核狀態\",\"US\":\"Update audit status\"}'),(1365,1,'admin','admin_url','app\\admin\\controller\\ProductController::delete','','删除产品','',524,0,'',363,'{\"CN\":\"删除产品\",\"HK\":\"刪除產品\",\"US\":\"Delete product\"}'),(1366,1,'admin','admin_url','app\\admin\\controller\\ProductController::duplicatePage','','复制产品','',524,0,'',364,'{\"CN\":\"复制产品\",\"HK\":\"複製產品\",\"US\":\"Copy product\"}'),(1367,1,'admin','admin_url','app\\admin\\controller\\ProductController::addPage','','产品添加','',524,0,'',366,'{\"CN\":\"产品添加\",\"HK\":\"產品添加\",\"US\":\"Product Added\"}'),(1368,1,'admin','admin_url','app\\admin\\controller\\ProductController','','产品分组','',524,0,'',368,'{\"CN\":\"产品分组\",\"HK\":\"產品分組\",\"US\":\"Product Group\"}'),(1369,1,'admin','admin_url','app\\admin\\controller\\ProductController::editPage','','产品编辑','',524,0,'',372,'{\"CN\":\"产品编辑\",\"HK\":\"產品編輯\",\"US\":\"Product Editor\"}'),(1370,1,'admin','admin_url','app\\admin\\controller\\ProductController::updateGroupsort','','产品分组排序修改','',0,0,'',907,'{\"CN\":\"产品分组排序修改\",\"HK\":\"產品分組排序修改\",\"US\":\"Product grouping and sorting modification\"}'),(1371,1,'admin','admin_url','app\\admin\\controller\\ProductController::updateProductsort','','产品排序修改','',0,0,'',908,'{\"CN\":\"产品排序修改\",\"HK\":\"產品排序修改\",\"US\":\"Product Sorting Modification\"}'),(1372,1,'admin','admin_url','app\\admin\\controller\\ProductController::editGroupPage','','产品分组添加/编辑','',1368,0,'',369,'{\"CN\":\"产品分组添加\\/编辑\",\"HK\":\"產品分組添加\\/編輯\",\"US\":\"Product Group Add\\/Edit\"}'),(1373,1,'admin','admin_url','app\\admin\\controller\\ProductController::saveProductGroup','','保存产品分组信息','',1372,0,'',370,'{\"CN\":\"保存产品分组信息\",\"HK\":\"保存產品分組信息\",\"US\":\"Save product group information\"}'),(1374,1,'admin','admin_url','app\\admin\\controller\\ProductController::deleteGroup','','删除产品组','',1368,0,'',371,'{\"CN\":\"删除产品组\",\"HK\":\"刪除產品組\",\"US\":\"Delete product group\"}'),(1375,1,'admin','admin_url','app\\admin\\controller\\ProductController::duplicate','','复制产品','',1366,0,'',365,'{\"CN\":\"复制产品\",\"HK\":\"複製產品\",\"US\":\"Copy product\"}'),(1376,1,'admin','admin_url','app\\admin\\controller\\ProductController::create','','创建产品','',1367,0,'',367,'{\"CN\":\"创建产品\",\"HK\":\"創建產品\",\"US\":\"Create Product\"}'),(1377,1,'admin','admin_url','app\\admin\\controller\\ProductController::edit','','保存产品信息','',1369,0,'',373,'{\"CN\":\"保存产品信息\",\"HK\":\"保存產品信息\",\"US\":\"Save product information\"}'),(1378,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::createGroups','','创建可选项配置组','',526,0,'',378,'{\"CN\":\"创建可选项配置组\",\"HK\":\"創建可選項配置組\",\"US\":\"Create optional configuration group\"}'),(1379,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::editGroups','','编辑可配置选项组','',526,0,'',380,'{\"CN\":\"编辑可配置选项组\",\"HK\":\"編輯可配置選項組\",\"US\":\"Edit configurable option group\"}'),(1380,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::addOptions','','添加可配置选项','',1379,0,'',381,'{\"CN\":\"添加可配置选项\",\"HK\":\"添加可配置選項\",\"US\":\"Add configurable options\"}'),(1381,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::deleteSubOptions','','删除可配置选项的子选项','',1382,0,'',383,'{\"CN\":\"删除可配置选项的子选项\",\"HK\":\"刪除可配置選項的子選項\",\"US\":\"Delete sub-options of configurable options\"}'),(1382,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::deleteOptions','','删除可配置选项','',1379,0,'',382,'{\"CN\":\"删除可配置选项\",\"HK\":\"刪除可配置選項\",\"US\":\"Delete configurable options\"}'),(1383,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::deleteGroups','','删除可配置选项组','',526,0,'',387,'{\"CN\":\"删除可配置选项组\",\"HK\":\"刪除可配置選項組\",\"US\":\"Delete configurable option group\"}'),(1384,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::duplicateGroups','','复制可配置选项组','',526,0,'',388,'{\"CN\":\"复制可配置选项组\",\"HK\":\"複製可配置選項組\",\"US\":\"Copy Configurable Option Group\"}'),(1385,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::editConfig','','编辑可配置项','',1379,0,'',384,'{\"CN\":\"编辑可配置项\",\"HK\":\"編輯可配置項\",\"US\":\"Edit configurable items\"}'),(1386,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::createGroupsPost','','创建可选项配置组页面提交','',1378,0,'',379,'{\"CN\":\"创建可选项配置组页面提交\",\"HK\":\"創建可選項配置組頁面提交\",\"US\":\"Create optional configuration group page submission\"}'),(1387,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::editGroupsPost','','编辑可配置选项组页面提交','',1379,0,'',386,'{\"CN\":\"编辑可配置选项组页面提交\",\"HK\":\"編輯可配置選項組頁面提交\",\"US\":\"Edit configurable option group page submission\"}'),(1388,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::duplicateGroupsPost','','复制可配置选项组页面提交','',1384,0,'',389,'{\"CN\":\"复制可配置选项组页面提交\",\"HK\":\"複製可配置選項組頁面提交\",\"US\":\"Copy configurable option group page submission\"}'),(1389,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::editConfigPost','','编辑可配置项页面提交','',1385,0,'',385,'{\"CN\":\"编辑可配置项页面提交\",\"HK\":\"編輯可配置項頁面提交\",\"US\":\"Edit configurable item page submission\"}'),(1391,1,'admin','admin_url','app\\admin\\controller\\PluginController::plInstall','','支付接口安装','',11,0,'',261,'{\"CN\":\"支付接口安装\",\"HK\":\"支付接口安裝\",\"US\":\"Payment interface installation\"}'),(1392,1,'admin','admin_url','app\\admin\\controller\\PluginController::plUninstall','','支付接口卸载','',11,0,'',262,'{\"CN\":\"支付接口卸载\",\"HK\":\"支付接口卸載\",\"US\":\"Payment interface uninstall\"}'),(1393,1,'admin','admin_url','app\\admin\\controller\\PluginController::plToggle','','支付接口禁用(启用)','',11,0,'',263,'{\"CN\":\"支付接口禁用(启用)\",\"HK\":\"支付接口禁用(啟用)\",\"US\":\"Payment interface disable (enable)\"}'),(1394,1,'admin','admin_url','app\\admin\\controller\\PluginController::plSetting','','支付接口配置','',11,0,'',264,'{\"CN\":\"支付接口配置\",\"HK\":\"支付接口配置\",\"US\":\"Payment interface configuration\"}'),(1395,1,'admin','admin_url','app\\admin\\controller\\PluginController::plSettingPost','','保存支付接口配置','',1394,0,'',265,'{\"CN\":\"保存支付接口配置\",\"HK\":\"保存支付接口配置\",\"US\":\"Save payment interface configuration\"}'),(1396,1,'admin','admin_url','app\\admin\\controller\\PluginController::plUpdate','','支付接口更新','',11,0,'',267,'{\"CN\":\"支付接口更新\",\"HK\":\"支付接口更新\",\"US\":\"Payment interface update\"}'),(1397,1,'admin','admin_url','app\\admin\\controller\\HostController','','执行模块命令','',28,0,'',150,'{\"CN\":\"执行模块命令\",\"HK\":\"執行模塊命令\",\"US\":\"Execute Module Command\"}'),(1398,1,'admin','admin_url','app\\admin\\controller\\SystemController::getAutoUpdate','','更新系统','',1915,0,'',673,'{\"CN\":\"更新系统\",\"HK\":\"更新系統\",\"US\":\"Update System\"}'),(1399,1,'admin','admin_url','app\\admin\\controller\\OrderController::active','','订单审核通过','',398,0,'',139,'{\"CN\":\"订单审核通过\",\"HK\":\"訂單審核通過\",\"US\":\"Order approved\"}'),(1400,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::getModuleConfig','','获取模块设置','',1369,0,'',374,'{\"CN\":\"获取模块设置\",\"HK\":\"獲取模塊設置\",\"US\":\"Get Module Settings\"}'),(1401,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::getModuleConfig','','获取模块设置','',364,0,'',457,'{\"CN\":\"获取模块设置\",\"HK\":\"獲取模塊設置\",\"US\":\"Get Module Settings\"}'),(1402,1,'admin','admin_url','app\\admin\\controller\\UserManageController::clientList','','客户列表','',13,0,'/customer-list',25,'{\"CN\":\"客户列表\",\"HK\":\"客戶列表\",\"US\":\"Customer List\"}'),(1403,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::cerifyloglist','','实名认证列表','',542,0,'',39,'{\"CN\":\"实名认证列表\",\"HK\":\"實名認證列表\",\"US\":\"Real-name authentication list\"}'),(1404,1,'admin','admin_url','app\\admin\\controller\\HostController::getList','','业务列表','',28,0,'',166,'{\"CN\":\"业务列表\",\"HK\":\"業務列表\",\"US\":\"Business List\"}'),(1405,1,'admin','admin_url','app\\admin\\controller\\PluginController::plIndex','','支付接口列表','',11,0,'',268,'{\"CN\":\"支付接口列表\",\"HK\":\"支付接口列表\",\"US\":\"Payment interface list\"}'),(1406,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::getList','','优惠码列表','',203,0,'',272,'{\"CN\":\"优惠码列表\",\"HK\":\"優惠碼列表\",\"US\":\"Promotion Code List\"}'),(1407,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::currencyList','','货币配置列表','',260,0,'',254,'{\"CN\":\"货币配置列表\",\"HK\":\"貨幣配置列表\",\"US\":\"Currency Configuration List\"}'),(1408,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::getList','','后台工单部门列表','',308,0,'',335,'{\"CN\":\"后台工单部门列表\",\"HK\":\"後台工單部門列表\",\"US\":\"Backstage ticket department list\"}'),(1409,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::novnc','','vnc','',1397,0,'',151,'{\"CN\":\"vnc\",\"HK\":\"vnc\",\"US\":\"vnc\"}'),(1410,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::reinstall','','重装系统','',1397,0,'',152,'{\"CN\":\"重装系统\",\"HK\":\"重裝系統\",\"US\":\"Reinstall the system\"}'),(1412,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::rescue','','救援系统','',1397,0,'',153,'{\"CN\":\"救援系统\",\"HK\":\"救援系統\",\"US\":\"Rescue System\"}'),(1413,1,'admin','admin_url','app\\admin\\controller\\ProvisionController::execute','','暂停提交','',999,0,'',157,'{\"CN\":\"暂停提交\",\"HK\":\"暫停提交\",\"US\":\"Suspend submission\"}'),(1414,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::crackPass','','破解密码','',1397,0,'',154,'{\"CN\":\"破解密码\",\"HK\":\"破解密碼\",\"US\":\"Crack the code\"}'),(1415,1,'admin','admin_url','app\\admin\\controller\\DcimController::serverList','','DCIM接口列表','',1813,0,'',414,'{\"CN\":\"DCIM接口列表\",\"HK\":\"DCIM接口列表\",\"US\":\"DCIM interface list\"}'),(1416,1,'admin','admin_url','app\\admin\\controller\\ProductController::getProuductlistPage','','产品列表','',29,0,'',460,'{\"CN\":\"产品列表\",\"HK\":\"產品列表\",\"US\":\"Product List\"}'),(1417,1,'admin','admin_url','app\\admin\\controller\\ProductController::getProuductlistPage','','产品列表','',1416,0,'',461,'{\"CN\":\"产品列表\",\"HK\":\"產品列表\",\"US\":\"Product List\"}'),(1418,1,'admin','admin_url','app\\admin\\controller\\DcimController::listFlowPacket','','流量包列表','',19,0,'',392,'{\"CN\":\"流量包列表\",\"HK\":\"流量包列表\",\"US\":\"Traffic Packet List\"}'),(1419,1,'admin','admin_url','app\\admin\\controller\\DcimController::listBuyRecord','','流量包记录','',27,0,'',145,'{\"CN\":\"流量包记录\",\"HK\":\"流量包記錄\",\"US\":\"Traffic Packet Record\"}'),(1420,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::groupsList','','自定义配置列表','',526,0,'',390,'{\"CN\":\"自定义配置列表\",\"HK\":\"自定義配置列表\",\"US\":\"Custom Configuration List\"}'),(1421,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::groupsList','','自定义配置列表','',30,0,'',463,'{\"CN\":\"自定义配置列表\",\"HK\":\"自定義配置列表\",\"US\":\"Custom Configuration List\"}'),(1422,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::serverList','','接口列表','',528,0,'',401,'{\"CN\":\"接口列表\",\"HK\":\"接口列表\",\"US\":\"Interface List\"}'),(1423,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::configMobilePost','','手机短信配置页面提交','',1359,0,'',629,'{\"CN\":\"手机短信配置页面提交\",\"HK\":\"手機短信配置頁面提交\",\"US\":\"Submit the SMS configuration page of the mobile phone\"}'),(1424,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::emailIndexPost','','邮件设置提交','',1360,0,'',633,'{\"CN\":\"邮件设置提交\",\"HK\":\"郵件設置提交\",\"US\":\"Mail Settings Submit\"}'),(1425,1,'admin','admin_url','app\\admin\\controller\\SetController::getCustomFields','','客户自定义字段详情','',512,0,'',91,'{\"CN\":\"客户自定义字段详情\",\"HK\":\"客戶自定義字段詳情\",\"US\":\"Customer Custom Field Details\"}'),(1426,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::SetSmsTemplatePost','','发送设置页面提交','',536,0,'',661,'{\"CN\":\"发送设置页面提交\",\"HK\":\"發送設置頁面提交\",\"US\":\"Send setting page submission\"}'),(1427,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getGeneral','','常规设置详情','',462,0,'',574,'{\"CN\":\"常规设置详情\",\"HK\":\"常規設置詳情\",\"US\":\"General Settings Details\"}'),(1428,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getRecharge','','常规设置-充值详情','',0,0,'',916,'{\"CN\":\"常规设置-充值详情\",\"HK\":\"常規設置-充值詳情\",\"US\":\"General Settings-Recharge Details\"}'),(1429,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::registerloginpage','','注册登录列表','',0,0,'',917,'{\"CN\":\"注册登录列表\",\"HK\":\"註冊登錄列表\",\"US\":\"Registered Login List\"}'),(1430,1,'admin','admin_url','app\\admin\\controller\\TicketController::ticketDetail','','工单详情','',350,0,'',313,'{\"CN\":\"工单详情\",\"HK\":\"工單詳情\",\"US\":\"Ticket Details\"}'),(1431,1,'admin','admin_url','app\\admin\\controller\\TicketController::createPage','','新建工单','',336,0,'',294,'{\"CN\":\"新建工单\",\"HK\":\"新建工單\",\"US\":\"New Ticket\"}'),(1432,1,'admin','admin_url','app\\admin\\controller\\CurrencyController::editCurrency','','编辑货币种类','',254,0,'',257,'{\"CN\":\"编辑货币种类\",\"HK\":\"編輯貨幣種類\",\"US\":\"Edit Currency Type\"}'),(1433,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::savePage','','编辑优惠码','',206,0,'',277,'{\"CN\":\"编辑优惠码\",\"HK\":\"編輯優惠碼\",\"US\":\"Edit Promo Code\"}'),(1434,1,'admin','admin_url','app\\admin\\controller\\PromoCodeController::addPage','','添加优惠码','',204,0,'',274,'{\"CN\":\"添加优惠码\",\"HK\":\"添加優惠碼\",\"US\":\"Add coupon code\"}'),(1435,1,'admin','admin_url','app\\admin\\controller\\PluginController::plSetting','','支付接口配置','',1394,0,'',266,'{\"CN\":\"支付接口配置\",\"HK\":\"支付接口配置\",\"US\":\"Payment interface configuration\"}'),(1436,1,'admin','admin_url','app\\admin\\controller\\AccountController::read','','编辑交易流水','',411,0,'',198,'{\"CN\":\"编辑交易流水\",\"HK\":\"編輯交易流水\",\"US\":\"Edit transaction flow\"}'),(1438,1,'admin','admin_url','app\\admin\\controller\\ClientGroupController::index','','客户分组列表','',448,0,'',101,'{\"CN\":\"客户分组列表\",\"HK\":\"客戶分組列表\",\"US\":\"Customer Group List\"}'),(1439,1,'admin','admin_url','app\\admin\\controller\\NewsController::getList','','新闻列表','',518,0,'',548,'{\"CN\":\"新闻列表\",\"HK\":\"新聞列表\",\"US\":\"News List\"}'),(1440,1,'admin','admin_url','app\\admin\\controller\\NewsController::getCatsPage','','新闻分类列表','',519,0,'',554,'{\"CN\":\"新闻分类列表\",\"HK\":\"新聞分類列表\",\"US\":\"News Category List\"}'),(1441,1,'admin','admin_url','app\\admin\\controller\\SystemController::getDatabaseInfo','','数据库状态详情','',481,0,'/database-message',703,'{\"CN\":\"数据库状态详情\",\"HK\":\"數據庫狀態詳情\",\"US\":\"Database Status Details\"}'),(1442,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::profile','','个人资料详情','',1280,0,'',8,'{\"CN\":\"个人资料详情\",\"HK\":\"個人資料詳情\",\"US\":\"Profile Details\"}'),(1443,1,'admin','admin_url','app\\admin\\controller\\SaleController','','销售设置','',1912,1,'/sales-management',599,'{\"CN\":\"销售设置\",\"HK\":\"銷售設置\",\"US\":\"Sales Settings\"}'),(1444,1,'admin','admin_url','app\\admin\\controller\\SaleController::groupList','','分组列表','',1443,0,'',600,'{\"CN\":\"分组列表\",\"HK\":\"分組列表\",\"US\":\"Group List\"}'),(1445,1,'admin','admin_url','app\\admin\\controller\\SaleController::addSalegroupPage','','添加分组页面','',1443,0,'',601,'{\"CN\":\"添加分组页面\",\"HK\":\"添加分組頁面\",\"US\":\"Add group page\"}'),(1446,1,'admin','admin_url','app\\admin\\controller\\SaleController::addSalegroup','','添加分组','',1445,0,'',602,'{\"CN\":\"添加分组\",\"HK\":\"添加分組\",\"US\":\"Add Group\"}'),(1447,1,'admin','admin_url','app\\admin\\controller\\SaleController::editSalegroupPage','','编辑分组页面','',1443,0,'',603,'{\"CN\":\"编辑分组页面\",\"HK\":\"編輯分組頁面\",\"US\":\"Edit Group Page\"}'),(1448,1,'admin','admin_url','app\\admin\\controller\\SaleController::editSalegroup','','编辑分组','',1447,0,'',604,'{\"CN\":\"编辑分组\",\"HK\":\"編輯分組\",\"US\":\"Edit Group\"}'),(1449,1,'admin','admin_url','app\\admin\\controller\\SaleController::ladderList','','阶梯列表','',1443,0,'',605,'{\"CN\":\"阶梯列表\",\"HK\":\"階梯列表\",\"US\":\"Ladder List\"}'),(1450,1,'admin','admin_url','app\\admin\\controller\\SaleController::addSaleLadder','','添加阶梯','',1443,0,'',606,'{\"CN\":\"添加阶梯\",\"HK\":\"添加階梯\",\"US\":\"Add Ladder\"}'),(1451,1,'admin','admin_url','app\\admin\\controller\\SaleController::editSaleLadderPage','','编辑阶梯页面','',1443,0,'',607,'{\"CN\":\"编辑阶梯页面\",\"HK\":\"編輯階梯頁面\",\"US\":\"Edit Ladder Page\"}'),(1452,1,'admin','admin_url','app\\admin\\controller\\SaleController::editSaleLadder','','编辑阶梯','',1451,0,'',608,'{\"CN\":\"编辑阶梯\",\"HK\":\"編輯階梯\",\"US\":\"Edit Ladder\"}'),(1453,1,'admin','admin_url','app\\admin\\controller\\AccountController::create','','添加交易流水页面','',405,0,'',201,'{\"CN\":\"添加交易流水页面\",\"HK\":\"添加交易流水頁面\",\"US\":\"Add transaction flow page\"}'),(1454,1,'admin','admin_url','app\\admin\\controller\\SaleController::saleStatistics','','我的业绩','',1861,1,'/sales-statistics',47,'{\"CN\":\"我的业绩\",\"HK\":\"我的業績\",\"US\":\"My Performance\"}'),(1455,1,'admin','admin_url','app\\admin\\controller\\Salecontroller::saleusers','','获取销售用户','',1454,0,'',48,'{\"CN\":\"获取销售用户\",\"HK\":\"獲取銷售用戶\",\"US\":\"Get sales users\"}'),(1456,1,'admin','admin_url','app\\admin\\controller\\Salecontroller::saleRecords','','获取销售客户购买记录','',1454,0,'',49,'{\"CN\":\"获取销售客户购买记录\",\"HK\":\"獲取銷售客戶購買記錄\",\"US\":\"Get sales customer purchase records\"}'),(1457,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::checkPost','','提交审核','',533,0,'',652,'{\"CN\":\"提交审核\",\"HK\":\"提交審核\",\"US\":\"Submit for review\"}'),(1458,1,'admin','admin_url','app\\admin\\controller\\SaleController::delSalegroup','','删除分组','',1443,0,'',609,'{\"CN\":\"删除分组\",\"HK\":\"刪除分組\",\"US\":\"Delete group\"}'),(1459,1,'admin','admin_url','app\\admin\\controller\\SaleController::delSaleLadder','','删除阶梯','',1443,0,'',610,'{\"CN\":\"删除阶梯\",\"HK\":\"刪除階梯\",\"US\":\"Delete Ladder\"}'),(1462,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getAffiliate','','常规设置-推介页面','',1680,0,'',93,'{\"CN\":\"常规设置-推介页面\",\"HK\":\"常規設置-推介頁面\",\"US\":\"General Settings-Referral Page\"}'),(1463,1,'admin','admin_url','app\\admin\\controller\\AffiliateController','','推介计划','',1863,1,'/customer-promotionplan',66,'{\"CN\":\"推介计划\",\"HK\":\"推介計劃\",\"US\":\"Recommendation Plan\"}'),(1464,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::index','','推介计划列表','',1463,0,'',68,'{\"CN\":\"推介计划列表\",\"HK\":\"推介計劃列表\",\"US\":\"Recommendation Program List\"}'),(1465,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::ladderList','','推介阶梯列表','',1463,0,'',69,'{\"CN\":\"推介阶梯列表\",\"HK\":\"推介階梯列表\",\"US\":\"Recommendation Ladder List\"}'),(1466,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::addAffLadder','','添加推介阶梯','',1463,0,'',70,'{\"CN\":\"添加推介阶梯\",\"HK\":\"添加推介階梯\",\"US\":\"Add referral ladder\"}'),(1467,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::editAffLadderPage','','修改推介阶梯页面','',1463,0,'',71,'{\"CN\":\"修改推介阶梯页面\",\"HK\":\"修改推介階梯頁面\",\"US\":\"Modify the referral ladder page\"}'),(1468,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::editAffLadder','','修改推介阶梯','',1463,0,'',72,'{\"CN\":\"修改推介阶梯\",\"HK\":\"修改推介階梯\",\"US\":\"Modify the recommendation ladder\"}'),(1469,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::delAffLadder','','删除推介阶梯','',1463,0,'',73,'{\"CN\":\"删除推介阶梯\",\"HK\":\"刪除推介階梯\",\"US\":\"Delete the referral ladder\"}'),(1470,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::useraffiPage','','用户推荐配置','',1463,0,'',75,'{\"CN\":\"用户推荐配置\",\"HK\":\"用戶推薦配置\",\"US\":\"User recommended configuration\"}'),(1471,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::useraffiPost','','用户推荐配置提交','',1463,0,'',83,'{\"CN\":\"用户推荐配置提交\",\"HK\":\"用戶推薦配置提交\",\"US\":\"User recommended configuration submission\"}'),(1472,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::productaffiPage','','产品推荐配置','',1463,0,'',84,'{\"CN\":\"产品推荐配置\",\"HK\":\"產品推薦配置\",\"US\":\"Product Recommended Configuration\"}'),(1473,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::productaffiPost','','产品推荐配置提交','',1463,0,'',85,'{\"CN\":\"产品推荐配置提交\",\"HK\":\"產品推薦配置提交\",\"US\":\"Product recommended configuration submission\"}'),(1475,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::invoicePost','','财务设置--提交','',0,0,'',930,'{\"CN\":\"财务设置--提交\",\"HK\":\"財務設置--提交\",\"US\":\"Financial Settings--Submit\"}'),(1476,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::invoicePage','','财务设置--页面','',0,0,'',931,'{\"CN\":\"财务设置--页面\",\"HK\":\"財務設置--頁面\",\"US\":\"Financial Settings--Page\"}'),(1477,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::useraffilist','','客户注册列表','',1470,0,'',76,'{\"CN\":\"客户注册列表\",\"HK\":\"客戶註冊列表\",\"US\":\"Customer Registration List\"}'),(1478,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::useraffirecord','','提现记录','',1470,0,'',77,'{\"CN\":\"提现记录\",\"HK\":\"提現記錄\",\"US\":\"Withdrawal Record\"}'),(1479,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::useraffibuyrecord','','订购记录','',1470,0,'',78,'{\"CN\":\"订购记录\",\"HK\":\"訂購記錄\",\"US\":\"Order Record\"}'),(1480,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::useraffibalance','','用户推荐金额修改','',1463,0,'',86,'{\"CN\":\"用户推荐金额修改\",\"HK\":\"用戶推薦金額修改\",\"US\":\"User recommended amount modification\"}'),(1481,1,'admin','admin_url','app\\admin\\controller\\TicketStatusController::getList','','工单状态列表','',335,0,'',315,'{\"CN\":\"工单状态列表\",\"HK\":\"工單狀態列表\",\"US\":\"Ticket Status List\"}'),(1482,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::affiwithdrawrecord','','后台推介提现记录','',1470,0,'',79,'{\"CN\":\"后台推介提现记录\",\"HK\":\"後台推介提現記錄\",\"US\":\"Background promotion and withdrawal record\"}'),(1483,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::affiwithdrawsh','','提现记录审核','',1470,0,'',80,'{\"CN\":\"提现记录审核\",\"HK\":\"提現記錄審核\",\"US\":\"Withdrawal Record Review\"}'),(1484,1,'admin','admin_url','app\\admin\\controller\\SaleController::adminList','','销售设置管理员列表','',1443,0,'',611,'{\"CN\":\"销售设置管理员列表\",\"HK\":\"銷售設置管理員列表\",\"US\":\"Sales Settings Administrator List\"}'),(1485,1,'admin','admin_url','app\\admin\\controller\\SaleController::editAdminList','','销售设置管理员','',1443,0,'',612,'{\"CN\":\"销售设置管理员\",\"HK\":\"銷售設置管理員\",\"US\":\"Sales Settings Manager\"}'),(1486,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::gatewaylist','','后台推介支付方式列表','',1470,0,'',81,'{\"CN\":\"后台推介支付方式列表\",\"HK\":\"後台推介支付方式列表\",\"US\":\"Backstage recommended payment method list\"}'),(1489,1,'admin','admin_url','app\\admin\\controller\\ProductController::getProuductlistPage','','商品设置','',21,1,'/zjmfcloud-product',438,'{\"CN\":\"商品设置\",\"HK\":\"商品設置\",\"US\":\"Commodity Setting\"}'),(1490,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::groupsList','','可配置选项','',21,0,'/configurable-option?type=dcimcloud',439,'{\"CN\":\"可配置选项\",\"HK\":\"可配置選項\",\"US\":\"Configurable Options\"}'),(1491,1,'admin','admin_url','app\\admin\\controller\\SaleController::getSaleEnble','','销售配置','',1443,0,'',613,'{\"CN\":\"销售配置\",\"HK\":\"銷售配置\",\"US\":\"Sales Configuration\"}'),(1492,1,'admin','admin_url','app\\admin\\controller\\SaleController::saleEnblePost','','销售配置提交','',1443,0,'',614,'{\"CN\":\"销售配置提交\",\"HK\":\"銷售配置提交\",\"US\":\"Sales Configuration Submit\"}'),(1493,1,'admin','admin_url','app\\admin\\controller\\SystemController::getCheckAutoUpdate','','检测更新系统','',1915,0,'',675,'{\"CN\":\"检测更新系统\",\"HK\":\"檢測更新系統\",\"US\":\"Check and update the system\"}'),(1496,1,'admin','admin_url','app\\admin\\controller\\ProductController::groupList','','产品分组','',1901,0,'',112,'{\"CN\":\"产品分组\",\"HK\":\"產品分組\",\"US\":\"Product Group\"}'),(1497,1,'admin','admin_url','app\\admin\\controller\\ProductController::groupList','','产品分组列表','',1496,0,'',113,'{\"CN\":\"产品分组列表\",\"HK\":\"產品分組列表\",\"US\":\"Product Group List\"}'),(1498,1,'admin','admin_url','app\\admin\\controller\\ProductController::addProductgroupPage','','添加产品分组页面','',1496,0,'',114,'{\"CN\":\"添加产品分组页面\",\"HK\":\"添加產品分組頁面\",\"US\":\"Add product group page\"}'),(1499,1,'admin','admin_url','app\\admin\\controller\\ProductController::addProductgroup','','添加分组','',1496,0,'',115,'{\"CN\":\"添加分组\",\"HK\":\"添加分組\",\"US\":\"Add Group\"}'),(1500,1,'admin','admin_url','app\\admin\\controller\\ProductController::editProductgroupPage','','编辑分组页面','',1496,0,'',116,'{\"CN\":\"编辑分组页面\",\"HK\":\"編輯分組頁面\",\"US\":\"Edit Group Page\"}'),(1501,1,'admin','admin_url','app\\admin\\controller\\ProductController::editProductgroup','','编辑分组','',1496,0,'',117,'{\"CN\":\"编辑分组\",\"HK\":\"編輯分組\",\"US\":\"Edit Group\"}'),(1502,1,'admin','admin_url','app\\admin\\controller\\ProductController::delProductgroup','','删除分组','',1496,0,'',118,'{\"CN\":\"删除分组\",\"HK\":\"刪除分組\",\"US\":\"Delete group\"}'),(1503,1,'admin','admin_url','app\\admin\\controller\\ProductController::zklistPage','','折扣设置','',1901,0,'',119,'{\"CN\":\"折扣设置\",\"HK\":\"折扣設置\",\"US\":\"Discount Settings\"}'),(1504,1,'admin','admin_url','app\\admin\\controller\\ProductController::editUserProductgroup','','编辑客户产品分组的金额','',1503,0,'',120,'{\"CN\":\"编辑客户产品分组的金额\",\"HK\":\"編輯客戶產品分組的金額\",\"US\":\"Edit the amount of customer product grouping\"}'),(1505,1,'admin','admin_url','app\\admin\\controller\\ProductController::zklistPage','','折扣列表','',1503,0,'',121,'{\"CN\":\"折扣列表\",\"HK\":\"折扣列表\",\"US\":\"Discount List\"}'),(1506,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::gatewaylist','','后台推介支付方式列表','',1470,0,'',82,'{\"CN\":\"后台推介支付方式列表\",\"HK\":\"後台推介支付方式列表\",\"US\":\"Backstage recommended payment method list\"}'),(1507,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::requestCancelList','','产品暂停请求','',1867,1,'/customer-cancelreq',180,'{\"CN\":\"产品暂停请求\",\"HK\":\"產品暫停請求\",\"US\":\"Product pause request\"}'),(1588,1,'admin','admin_url','app\\admin\\controller\\WithdrawController::getWithdraw','','提现审核','',1869,1,'/customer-withdrawal',240,'{\"CN\":\"提现审核\",\"HK\":\"提現審核\",\"US\":\"Withdrawal review\"}'),(1590,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getSystemMessageLog','','站内信日志','',1916,1,'/station-letter-log',682,'{\"CN\":\"站内信日志\",\"HK\":\"站內信日誌\",\"US\":\"Site Message Log\"}'),(1599,1,'admin','admin_url','','','数据迁移','',1915,1,'/data-migration',671,'{\"CN\":\"数据迁移\",\"HK\":\"數據遷移\",\"US\":\"Data Migration\"}'),(1601,1,'admin','admin_url','app\\admin\\controller\\SystemController','','关于','',1915,1,'/about',672,'{\"CN\":\"关于\",\"HK\":\"關於\",\"US\":\"About\"}'),(1603,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController','','服务器列表','',2110,1,'/munual-resource',723,'{\"CN\":\"服务器列表\",\"HK\":\"服務器列表\",\"US\":\"Server List\"}'),(1604,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController','','上游设置','',1899,0,'',760,'{\"CN\":\"上游设置\",\"HK\":\"上游設置\",\"US\":\"Upstream Settings\"}'),(1605,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::index','','上游列表','',1603,0,'',724,'{\"CN\":\"上游列表\",\"HK\":\"上游列表\",\"US\":\"Upstream List\"}'),(1606,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::addPost','','上游添加','',1603,0,'',725,'{\"CN\":\"上游添加\",\"HK\":\"上游添加\",\"US\":\"Upstream add\"}'),(1607,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::editupPost','','上游修改','',1603,0,'',726,'{\"CN\":\"上游修改\",\"HK\":\"上游修改\",\"US\":\"Upstream Modification\"}'),(1608,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::delup','','上游删除','',1603,0,'',727,'{\"CN\":\"上游删除\",\"HK\":\"上游刪除\",\"US\":\"Upstream delete\"}'),(1609,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController','','资源添加','',1603,0,'',728,'{\"CN\":\"资源添加\",\"HK\":\"資源添加\",\"US\":\"Add Resource\"}'),(1610,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController','','资源修改','',1603,0,'',731,'{\"CN\":\"资源修改\",\"HK\":\"資源修改\",\"US\":\"Resource Modification\"}'),(1611,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::delUpper','','资源删除','',1603,0,'',753,'{\"CN\":\"资源删除\",\"HK\":\"資源刪除\",\"US\":\"Resource Delete\"}'),(1612,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::upperIndex','','资源列表','',1603,0,'',754,'{\"CN\":\"资源列表\",\"HK\":\"資源列表\",\"US\":\"Resource List\"}'),(1613,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::addUpperPage','','资源添加页面','',1609,0,'',729,'{\"CN\":\"资源添加页面\",\"HK\":\"資源添加頁面\",\"US\":\"Resource Adding Page\"}'),(1614,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::addUpperPost','','资源添加提交','',1609,0,'',730,'{\"CN\":\"资源添加提交\",\"HK\":\"資源添加提交\",\"US\":\"Resource add submission\"}'),(1615,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::editUpperPage','','资源修改页面','',1610,0,'',751,'{\"CN\":\"资源修改页面\",\"HK\":\"資源修改頁面\",\"US\":\"Resource Modification Page\"}'),(1616,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::editUpperPost','','资源修改提交','',1610,0,'',752,'{\"CN\":\"资源修改提交\",\"HK\":\"資源修改提交\",\"US\":\"Resource Modification Submit\"}'),(1617,1,'admin','admin_url','app\\admin\\controller\\OrderController::indexPost','','订单提成金额','',390,0,'',134,'{\"CN\":\"订单提成金额\",\"HK\":\"訂單提成金額\",\"US\":\"Order commission amount\"}'),(1680,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getAffiliate','','推介设置','',1901,1,'/promotion_plan',92,'{\"CN\":\"推介设置\",\"HK\":\"推介設置\",\"US\":\"Recommendation Settings\"}'),(1682,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::productgroupPage','','产品分类--页面','',1921,0,'',426,'{\"CN\":\"产品分类--页面\",\"HK\":\"產品分類--頁面\",\"US\":\"Product Category--Page\"}'),(1683,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::productGroupPost','','产品分类--提交','',1921,0,'',427,'{\"CN\":\"产品分类--提交\",\"HK\":\"產品分類--提交\",\"US\":\"Product Classification--Submit\"}'),(1684,1,'admin','admin_url','app\\admin\\controller\\ProductController::selectType','','选择产品分组','',1369,0,'',375,'{\"CN\":\"选择产品分组\",\"HK\":\"選擇產品分組\",\"US\":\"Select Product Group\"}'),(1686,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::productgroupList','','产品分类--列表','',1921,0,'',428,'{\"CN\":\"产品分类--列表\",\"HK\":\"產品分類--列表\",\"US\":\"Product Category--List\"}'),(1687,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getCronSystemLog','','定时任务日志','',1916,1,'/automatic-task-log',684,'{\"CN\":\"定时任务日志\",\"HK\":\"定時任務日誌\",\"US\":\"Timed Task Log\"}'),(1688,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController','','供应商管理','',2110,1,'/zjmf-api',716,'{\"CN\":\"供应商管理\",\"HK\":\"供應商管理\",\"US\":\"Supplier Management\"}'),(1689,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::mobiletemplateList','','个人中心短信模板列表','',533,0,'',651,'{\"CN\":\"个人中心短信模板列表\",\"HK\":\"個人中心短信模板列表\",\"US\":\"Personal Center SMS Template List\"}'),(1690,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::emailtemplateList','','个人中心邮件模板列表','',531,0,'',645,'{\"CN\":\"个人中心邮件模板列表\",\"HK\":\"個人中心郵件模板列表\",\"US\":\"Personal Center Mail Template List\"}'),(1691,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::sendMessagePost','','发送邮件短信消息','',531,0,'',646,'{\"CN\":\"发送邮件短信消息\",\"HK\":\"發送郵件短信消息\",\"US\":\"Send Email SMS Message\"}'),(1692,1,'admin','admin_url','app\\admin\\controller\\ConfigCertificontroller::types','','获取认证类型(无人工审核)','',1336,0,'',109,'{\"CN\":\"获取认证类型(无人工审核)\",\"HK\":\"獲取認證類型(無人工審核)\",\"US\":\"Acquire certification type (no manual review)\"}'),(1693,1,'admin','admin_url','app\\admin\\controller\\HostController::getTimetype','','获取时间类型','',28,0,'',167,'{\"CN\":\"获取时间类型\",\"HK\":\"獲取時間類型\",\"US\":\"Get Time Type\"}'),(1695,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postGeneral','','官网设置提交','',8,0,'',561,'{\"CN\":\"官网设置提交\",\"HK\":\"官網設置提交\",\"US\":\"Official website setting submission\"}'),(1698,1,'admin','admin_url','app\\admin\\controller\\ReportsController::getYearIncomeStatistics','','年度收入统计','',2107,1,'/annual-statistics',707,'{\"CN\":\"年度收入统计\",\"HK\":\"年度收入統計\",\"US\":\"Annual Income Statistics\"}'),(1699,1,'admin','admin_url','app\\admin\\controller\\ReportsController::getNewClientStatistics','','新客户','',2107,1,'/new-customer',709,'{\"CN\":\"新客户\",\"HK\":\"新客戶\",\"US\":\"New Customer\"}'),(1700,1,'admin','admin_url','app\\admin\\controller\\ReportsController::getNewClientStatistics','','产品收入','',2107,1,'/product-revenue',710,'{\"CN\":\"产品收入\",\"HK\":\"產品收入\",\"US\":\"Product Revenue\"}'),(1701,1,'admin','admin_url','app\\admin\\controller\\ReportsController::getNewClientStatistics','','收入排名','',2107,1,'/revenue-ranking',711,'{\"CN\":\"收入排名\",\"HK\":\"收入排名\",\"US\":\"Revenue Ranking\"}'),(1702,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::sm_type','','获取类型','',1864,0,'',53,'{\"CN\":\"获取类型\",\"HK\":\"獲取類型\",\"US\":\"Get Type\"}'),(1703,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::searchList','','筛选客户集合','',1864,0,'',54,'{\"CN\":\"筛选客户集合\",\"HK\":\"篩選客戶集合\",\"US\":\"Filter customer collection\"}'),(1704,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::mobiletemplateList','','短信模板列表','',1864,0,'',55,'{\"CN\":\"短信模板列表\",\"HK\":\"短信模板列表\",\"US\":\"SMS template list\"}'),(1705,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::editTemplate','','邮件模板基本参数','',1864,0,'',56,'{\"CN\":\"邮件模板基本参数\",\"HK\":\"郵件模板基本參數\",\"US\":\"Basic Parameters of Email Template\"}'),(1706,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::sendMessagePost','','发送邮件短信消息','',1864,0,'',57,'{\"CN\":\"发送邮件短信消息\",\"HK\":\"發送郵件短信消息\",\"US\":\"Send Email SMS Message\"}'),(1707,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::getProgress','','获取进度','',1864,0,'',58,'{\"CN\":\"获取进度\",\"HK\":\"獲取進度\",\"US\":\"Get Progress\"}'),(1708,1,'admin','admin_url','app\\admin\\controller\\DcimController::getSalesServer','','获取销售服务器','',22,0,'',476,'{\"CN\":\"获取销售服务器\",\"HK\":\"獲取銷售服務器\",\"US\":\"Get sales server\"}'),(1709,1,'admin','admin_url','app\\admin\\controller\\ReportController::getSystemInfoModulesList','','获取信息系统展示模块列表','',306,0,'',823,'{\"CN\":\"获取信息系统展示模块列表\",\"HK\":\"獲取信息系統展示模塊列表\",\"US\":\"Get a list of information system display modules\"}'),(1710,1,'admin','admin_url','app\\admin\\controller\\ReportController::updateSystemInfoModulesSort','','修改信息系统展示模块顺序','',306,0,'',835,'{\"CN\":\"修改信息系统展示模块顺序\",\"HK\":\"修改信息系統展示模塊順序\",\"US\":\"Modify the order of information system display modules\"}'),(1711,1,'admin','admin_url','app\\admin\\controller\\PluginController::plCopy','','复制','',11,0,'',269,'{\"CN\":\"复制\",\"HK\":\"複製\",\"US\":\"Copy\"}'),(1712,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_waiting_ticket','','待处理工单','',1709,0,'',824,'{\"CN\":\"待处理工单\",\"HK\":\"待處理工單\",\"US\":\"Pending Ticket\"}'),(1713,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_staff_sales_ranking','','员工销售排行','',1709,0,'',825,'{\"CN\":\"员工销售排行\",\"HK\":\"員工銷售排行\",\"US\":\"Employee Sales Ranking\"}'),(1714,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_online_admin','','在线管理员','',1709,0,'',826,'{\"CN\":\"在线管理员\",\"HK\":\"在線管理員\",\"US\":\"Online Administrator\"}'),(1715,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_system_log','','系统日志','',1709,0,'',827,'{\"CN\":\"系统日志\",\"HK\":\"系統日誌\",\"US\":\"System Log\"}'),(1716,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_sales_ranking','','本月销售排行','',1709,0,'',828,'{\"CN\":\"本月销售排行\",\"HK\":\"本月銷售排行\",\"US\":\"This month\'s sales ranking\"}'),(1717,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_expiring','','即将过期','',1709,0,'',829,'{\"CN\":\"即将过期\",\"HK\":\"即將過期\",\"US\":\"Expiration soon\"}'),(1718,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_client','','客户概况','',1709,0,'',830,'{\"CN\":\"客户概况\",\"HK\":\"客戶概況\",\"US\":\"Customer Profile\"}'),(1719,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_trade','','交易统计','',1709,0,'',831,'{\"CN\":\"交易统计\",\"HK\":\"交易統計\",\"US\":\"Transaction Statistics\"}'),(1720,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_todo','','代办事项','',1709,0,'',832,'{\"CN\":\"代办事项\",\"HK\":\"代辦事項\",\"US\":\"Agents to do\"}'),(1721,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_income','','收入概览','',1709,0,'',833,'{\"CN\":\"收入概览\",\"HK\":\"收入概覽\",\"US\":\"Income Overview\"}'),(1722,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_order','','订单概览','',1709,0,'',834,'{\"CN\":\"订单概览\",\"HK\":\"訂單概覽\",\"US\":\"Order Overview\"}'),(1723,1,'admin','admin_url','app\\admin\\controller\\DcimController::assignserver','','分配设置','',28,0,'',179,'{\"CN\":\"分配设置\",\"HK\":\"分配設置\",\"US\":\"Assignment Settings\"}'),(1724,1,'admin','admin_url','app\\admin\\controller\\UserController::editSelfInfoPage','','修改信息显示','',195,0,'',616,'{\"CN\":\"修改信息显示\",\"HK\":\"修改信息顯示\",\"US\":\"Modification information display\"}'),(1725,1,'admin','admin_url','app\\admin\\controller\\UserController::editSelfInfo','','修改信息','',195,0,'',617,'{\"CN\":\"修改信息\",\"HK\":\"修改信息\",\"US\":\"Modify Information\"}'),(1726,1,'admin','admin_url','app\\admin\\controller\\UserController::getBlackList','','黑名单列表','',1914,1,'/black-list',669,'{\"CN\":\"黑名单列表\",\"HK\":\"黑名單列表\",\"US\":\"Blacklist List\"}'),(1727,1,'admin','admin_url','app\\admin\\controller\\UserController::removeBlackList','','移除黑名单','',195,0,'',618,'{\"CN\":\"移除黑名单\",\"HK\":\"移除黑名單\",\"US\":\"Remove blacklist\"}'),(1729,1,'admin','admin_url','app\\admin\\controller\\ConfigCertificontroller::alipay_three_type','','获取三要素认证类型','',1336,0,'',110,'{\"CN\":\"获取三要素认证类型\",\"HK\":\"獲取三要素認證類型\",\"US\":\"Obtain three-factor authentication type\"}'),(1731,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::deleteCancelRequest','','删除取消请求','',1507,0,'',187,'{\"CN\":\"删除取消请求\",\"HK\":\"刪除取消請求\",\"US\":\"Delete cancellation request\"}'),(1732,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::searchPage','','可配置选项组搜索产品类型','',1490,0,'',440,'{\"CN\":\"可配置选项组搜索产品类型\",\"HK\":\"可配置選項組搜索產品類型\",\"US\":\"Configurable option group search product type\"}'),(1733,1,'admin','admin_url','app\\admin\\controller\\ReportsController::getYearIncomeStatisticsForChart','','年度收入统计--图表数据','',1698,0,'',708,'{\"CN\":\"年度收入统计--图表数据\",\"HK\":\"年度收入統計--圖表數據\",\"US\":\"Annual Income Statistics-Chart Data\"}'),(1734,1,'admin','admin_url','app\\admin\\controller\\ReportsController::getNewClientStatistics','','新客户统计','',1897,0,'',696,'{\"CN\":\"新客户统计\",\"HK\":\"新客戶統計\",\"US\":\"New Client Statistics\"}'),(1735,1,'admin','admin_url','app\\admin\\controller\\ReportsController::productIncome','','产品收入','',1897,0,'',697,'{\"CN\":\"产品收入\",\"HK\":\"產品收入\",\"US\":\"Product Revenue\"}'),(1736,1,'admin','admin_url','app\\admin\\controller\\ReportsController::rankForwardClient','','收入排名','',1897,0,'',698,'{\"CN\":\"收入排名\",\"HK\":\"收入排名\",\"US\":\"Revenue Ranking\"}'),(1738,1,'admin','admin_url','app\\admin\\controller\\SystemController::postToggleVersion','','切换版本','',1915,0,'',674,'{\"CN\":\"切换版本\",\"HK\":\"切換版本\",\"US\":\"Switch version\"}'),(1739,1,'admin','admin_url','app\\admin\\controller\\DcimCloudController::editServer','','修改服务器','',21,0,'',432,'{\"CN\":\"修改服务器\",\"HK\":\"修改服務器\",\"US\":\"Modify Server\"}'),(1740,1,'admin','admin_url','app\\admin\\controller\\DcimCloudController::addServer','','添加服务器','',21,0,'',433,'{\"CN\":\"添加服务器\",\"HK\":\"添加服務器\",\"US\":\"Add Server\"}'),(1741,1,'admin','admin_url','app\\admin\\controller\\DcimCloudController::delServer','','删除服务器','',21,0,'',434,'{\"CN\":\"删除服务器\",\"HK\":\"刪除服務器\",\"US\":\"Delete Server\"}'),(1742,1,'admin','admin_url','app\\admin\\controller\\DcimCloudController::refreshAllServerStatus','','刷新所有服务器状态','',21,0,'',435,'{\"CN\":\"刷新所有服务器状态\",\"HK\":\"刷新所有服務器狀態\",\"US\":\"Refresh all server status\"}'),(1743,1,'admin','admin_url','app\\admin\\controller\\DcimCloudController::refreshServerStatus','','获取服务器状态','',21,0,'',436,'{\"CN\":\"获取服务器状态\",\"HK\":\"獲取服務器狀態\",\"US\":\"Get server status\"}'),(1744,1,'admin','admin_url','app\\admin\\controller\\DcimCloudController::serverDetail','','服务器详情','',21,0,'',437,'{\"CN\":\"服务器详情\",\"HK\":\"服務器詳情\",\"US\":\"Server Details\"}'),(1745,1,'admin','admin_url','app\\admin\\controller\\Salecontroller::saleRecordsNew','','获取销售客户购买记录(新)','',1454,0,'',50,'{\"CN\":\"获取销售客户购买记录(新)\",\"HK\":\"獲取銷售客戶購買記錄(新)\",\"US\":\"Get sales customer purchase records (new)\"}'),(1746,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::getSearchParams','','获取营销推送筛选条件','',1864,0,'',59,'{\"CN\":\"获取营销推送筛选条件\",\"HK\":\"獲取營銷推送篩選條件\",\"US\":\"Get marketing push filter criteria\"}'),(1747,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController','','魔方财务接口管理','',1899,0,'',761,'{\"CN\":\"魔方财务接口管理\",\"HK\":\"魔方財務接口管理\",\"US\":\"Mofang Financial Interface Management\"}'),(1748,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::createApi','','添加魔方财务API','',1747,0,'',762,'{\"CN\":\"添加魔方财务API\",\"HK\":\"添加魔方財務API\",\"US\":\"Add Rubik\'s Cube Finance API\"}'),(1749,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::modifyApi','','修改魔方财务API','',1747,0,'',763,'{\"CN\":\"修改魔方财务API\",\"HK\":\"修改魔方財務API\",\"US\":\"Modify Rubik\'s Cube Finance API\"}'),(1750,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::detail','','魔方财务API详情','',1747,0,'',764,'{\"CN\":\"魔方财务API详情\",\"HK\":\"魔方財務API詳情\",\"US\":\"Mofang Finance API Details\"}'),(1751,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::deleteApi','','删除魔方财务API','',1747,0,'',765,'{\"CN\":\"删除魔方财务API\",\"HK\":\"刪除魔方財務API\",\"US\":\"Delete Rubik\'s Cube Finance API\"}'),(1752,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::index','','魔方财务API列表','',1747,0,'',766,'{\"CN\":\"魔方财务API列表\",\"HK\":\"魔方財務API列表\",\"US\":\"Mofang Finance API List\"}'),(1753,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::refreshStatus','','刷新魔方财务API状态','',1747,0,'',767,'{\"CN\":\"刷新魔方财务API状态\",\"HK\":\"刷新魔方財務API狀態\",\"US\":\"Refresh Rubik\'s Cube Finance API Status\"}'),(1755,1,'admin','admin_url','app\\admin\\controller\\ProductController::getUpstreamProducts','','获取上游产品','',5,0,'',483,'{\"CN\":\"获取上游产品\",\"HK\":\"獲取上游產品\",\"US\":\"Get upstream products\"}'),(1756,1,'admin','admin_url','app\\admin\\controller\\ProductController::syncProductInfo','','同步上游产品信息','',5,0,'',484,'{\"CN\":\"同步上游产品信息\",\"HK\":\"同步上游產品信息\",\"US\":\"Synchronize upstream product information\"}'),(1757,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::addRechargeInvoice','','创建充值账单','',1280,0,'',9,'{\"CN\":\"创建充值账单\",\"HK\":\"創建充值賬單\",\"US\":\"Create a recharge bill\"}'),(1758,1,'admin','admin_url','app\\admin\\controller\\ProductController::getUpstreamPrice','','获取上游产品成本价','',5,0,'',485,'{\"CN\":\"获取上游产品成本价\",\"HK\":\"獲取上游產品成本價\",\"US\":\"Get the cost price of upstream products\"}'),(1759,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::addOptionsPage','','添加可配置选项页面','',1490,0,'',441,'{\"CN\":\"添加可配置选项页面\",\"HK\":\"添加可配置選項頁面\",\"US\":\"Add a configurable option page\"}'),(1760,1,'admin','admin_url','app\\admin\\controller\\Dcimcontroller::novncpage','','vnc页面','',1397,0,'',155,'{\"CN\":\"vnc页面\",\"HK\":\"vnc頁面\",\"US\":\"vnc page\"}'),(1762,1,'admin','admin_url','app\\admin\\controller\\DeveloperController','','开发者应用','',5,0,'',486,'{\"CN\":\"开发者应用\",\"HK\":\"開發者應用\",\"US\":\"Developer App\"}'),(1763,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::getDeveloperAppList','','应用列表','',1762,1,'/application-list?appstatus=1',488,'{\"CN\":\"应用列表\",\"HK\":\"應用列表\",\"US\":\"Application List\"}'),(1764,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::getDeveloperAppList','','应用审核','',1762,1,'/appcheck-list?appstatus=2',489,'{\"CN\":\"应用审核\",\"HK\":\"應用審核\",\"US\":\"App Review\"}'),(1765,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::getDeveloperDetail','','获取开发者详情','',1762,0,'',490,'{\"CN\":\"获取开发者详情\",\"HK\":\"獲取開發者詳情\",\"US\":\"Get developer details\"}'),(1766,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::postCheckDeveloper','','审核开发者','',1762,0,'',491,'{\"CN\":\"审核开发者\",\"HK\":\"審核開發者\",\"US\":\"Audit Developer\"}'),(1767,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::postToggleRetired','','上/下架应用','',1762,0,'',492,'{\"CN\":\"上\\/下架应用\",\"HK\":\"上\\/下架應用\",\"US\":\"Up\\/Down App\"}'),(1768,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::getDeveloperApp','','应用详情','',1762,0,'',493,'{\"CN\":\"应用详情\",\"HK\":\"應用詳情\",\"US\":\"Application Details\"}'),(1769,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::getAppAccounts','','交易流水(开发者应用)','',1762,0,'',494,'{\"CN\":\"交易流水(开发者应用)\",\"HK\":\"交易流水(開發者應用)\",\"US\":\"Transaction Flow (Developer App)\"}'),(1770,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::postCheckDeveloperApp','','审核通过/驳回应用','',1762,0,'',495,'{\"CN\":\"审核通过\\/驳回应用\",\"HK\":\"審核通過\\/駁回​​應用\",\"US\":\"Approved\\/Rejected App\"}'),(1771,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::getDeveloperAppLogs','','开发者应用日志','',1762,0,'',496,'{\"CN\":\"开发者应用日志\",\"HK\":\"開發者應用日誌\",\"US\":\"Developer Application Log\"}'),(1772,1,'admin','admin_url','app\\admin\\controller\\Systemcontroller::getupdatecontent','','获取版本更新内容','',1915,0,'',678,'{\"CN\":\"获取版本更新内容\",\"HK\":\"獲取版本更新內容\",\"US\":\"Get version update content\"}'),(1773,1,'admin','admin_url','app\\admin\\controller\\Indexcontroller::tableList','','条件搜索页面','',1329,0,'',836,'{\"CN\":\"条件搜索页面\",\"HK\":\"條件搜索頁面\",\"US\":\"Conditional Search Page\"}'),(1774,1,'admin','admin_url','app\\admin\\controller\\Indexcontroller::search','','搜索','',1329,0,'',837,'{\"CN\":\"搜索\",\"HK\":\"搜索\",\"US\":\"Search\"}'),(1776,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::userProductInvoice','','用户产品账单列表','',404,0,'',234,'{\"CN\":\"用户产品账单列表\",\"HK\":\"用戶產品賬單列表\",\"US\":\"User Product Billing List\"}'),(1777,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::userProductaccounts','','交易流水列表','',404,0,'',235,'{\"CN\":\"交易流水列表\",\"HK\":\"交易流水列表\",\"US\":\"Transaction Flow List\"}'),(1778,1,'admin','admin_url','app\\admin\\controller\\ProductController::selectcates','','返回可用文件列表','',364,0,'',458,'{\"CN\":\"返回可用文件列表\",\"HK\":\"返回可用文件列表\",\"US\":\"Return to the list of available files\"}'),(1779,1,'admin','admin_url','app\\admin\\controller\\ProductController::downloadcates','','返回文件下载列表','',364,0,'',459,'{\"CN\":\"返回文件下载列表\",\"HK\":\"返回文件下載列表\",\"US\":\"Return to file download list\"}'),(1780,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postUploadFile','','上传文件','',420,0,'',533,'{\"CN\":\"上传文件\",\"HK\":\"上傳文件\",\"US\":\"Upload file\"}'),(1781,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::getFile','','下载文件','',420,0,'',535,'{\"CN\":\"下载文件\",\"HK\":\"下載文件\",\"US\":\"Download File\"}'),(1782,1,'admin','admin_url','app\\admin\\controller\\WithdrawController::postWithdraw','','审核提现记录','',1588,0,'',241,'{\"CN\":\"审核提现记录\",\"HK\":\"審核提現記錄\",\"US\":\"Audit and withdrawal record\"}'),(1783,1,'admin','admin_url','app\\admin\\controller\\ReportController::get_order','','获取用户id','',1337,0,'',126,'{\"CN\":\"获取用户id\",\"HK\":\"獲取用戶id\",\"US\":\"Get user id\"}'),(1784,1,'admin','admin_url','app\\admin\\controller\\AccountController::createInvoice','','添加交易流水获取账单','',409,0,'',203,'{\"CN\":\"添加交易流水获取账单\",\"HK\":\"添加交易流水獲取賬單\",\"US\":\"Add transaction flow to get bill\"}'),(1785,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postUpdateSort','','分类排序','',420,0,'',540,'{\"CN\":\"分类排序\",\"HK\":\"分類排序\",\"US\":\"Sort by Category\"}'),(1786,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::getSendMethod','','营销信息-推送方式','',1864,0,'',60,'{\"CN\":\"营销信息-推送方式\",\"HK\":\"營銷信息-推送方式\",\"US\":\"Marketing Information-Push Method\"}'),(1787,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::emailtemplateList','','邮件模板列表','',1864,0,'',61,'{\"CN\":\"邮件模板列表\",\"HK\":\"郵件模板列表\",\"US\":\"Mail template list\"}'),(1788,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::getEmailTemplateParams','','营销推送方式下的邮件模板参数','',1864,0,'',62,'{\"CN\":\"营销推送方式下的邮件模板参数\",\"HK\":\"營銷推送方式下的郵件模板參數\",\"US\":\"Mail template parameters in marketing push mode\"}'),(1789,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::sendSmsBefore','','发送短信息操作','',1864,0,'',63,'{\"CN\":\"发送短信息操作\",\"HK\":\"發送短信息操作\",\"US\":\"Send SMS Operation\"}'),(1790,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::update_smslog','','更新日志','',1864,0,'',64,'{\"CN\":\"更新日志\",\"HK\":\"更新日誌\",\"US\":\"Update Log\"}'),(1791,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController::get_smslog','','获取日志','',1864,0,'',65,'{\"CN\":\"获取日志\",\"HK\":\"獲取日誌\",\"US\":\"Get Log\"}'),(1793,1,'admin','admin_url','app\\admin\\controller\\DeveloperController::deleteDeveloperApp','','删除应用','',1762,0,'',487,'{\"CN\":\"删除应用\",\"HK\":\"刪除應用\",\"US\":\"Delete Application\"}'),(1794,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::hostByUid','','单个客户产品列表','',13,0,'',12,'{\"CN\":\"单个客户产品列表\",\"HK\":\"單個客戶產品列表\",\"US\":\"Single Customer Product List\"}'),(1795,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::requestCancelReason','','取消请求原因管理','',1507,0,'',181,'{\"CN\":\"取消请求原因管理\",\"HK\":\"取消請求原因管理\",\"US\":\"Cancellation request reason management\"}'),(1796,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::requestCancelReasonPost','','取消请求原因增加修改','',1507,0,'',182,'{\"CN\":\"取消请求原因增加修改\",\"HK\":\"取消請求原因增加修改\",\"US\":\"Add and modify the reason for the cancellation request\"}'),(1797,1,'admin','admin_url','app\\admin\\controller\\Indexcontroller::searchfornameList','','条件搜索','',1329,0,'',820,'{\"CN\":\"条件搜索\",\"HK\":\"條件搜索\",\"US\":\"Condition Search\"}'),(1798,1,'admin','admin_url','app\\admin\\controller\\OrderController::getClients','','获取用户','',390,0,'',133,'{\"CN\":\"获取用户\",\"HK\":\"獲取用戶\",\"US\":\"Get User\"}'),(1799,1,'admin','admin_url','app\\admin\\controller\\TicketController::getTicketDetailHost','','工单信息获取产品','',335,0,'',291,'{\"CN\":\"工单信息获取产品\",\"HK\":\"工單信息獲取產品\",\"US\":\"Ticket information acquisition product\"}'),(1801,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::Index','','应用商店','',1898,0,'',769,'{\"CN\":\"应用商店\",\"HK\":\"應用商店\",\"US\":\"App Store\"}'),(1802,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::marketLogin','','应用商店登录','',1898,0,'',770,'{\"CN\":\"应用商店登录\",\"HK\":\"應用商店登錄\",\"US\":\"App Store Login\"}'),(1803,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::buy','','购买应用(选择产品配置)','',1898,0,'',771,'{\"CN\":\"购买应用(选择产品配置)\",\"HK\":\"購買應用(選擇產品配置)\",\"US\":\"Purchase application (select product configuration)\"}'),(1804,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::changeBillingcycle','','选择付款周期获取金额','',1898,0,'',772,'{\"CN\":\"选择付款周期获取金额\",\"HK\":\"選擇付款週期獲取金額\",\"US\":\"Select the payment cycle to obtain the amount\"}'),(1805,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::createInvoice','','创建订单(默认选择余额)','',1898,0,'',773,'{\"CN\":\"创建订单(默认选择余额)\",\"HK\":\"創建訂單(默認選擇餘額)\",\"US\":\"Create order (select balance by default)\"}'),(1806,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::useCredit','','支付订单(切换支付方式:余额)','',1898,0,'',774,'{\"CN\":\"支付订单(切换支付方式:余额)\",\"HK\":\"支付訂單(切換支付方式:餘額)\",\"US\":\"Pay order (switch payment method: balance)\"}'),(1807,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::changePayment','','支付订单(切换支付方式)','',1898,0,'',775,'{\"CN\":\"支付订单(切换支付方式)\",\"HK\":\"支付訂單(切換支付方式)\",\"US\":\"Pay the order (switch payment method)\"}'),(1808,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::applyCredit','','余额支付','',1898,0,'',776,'{\"CN\":\"余额支付\",\"HK\":\"餘額支付\",\"US\":\"Balance Payment\"}'),(1809,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::checkOrder','','检查支付状态','',1898,0,'',777,'{\"CN\":\"检查支付状态\",\"HK\":\"檢查支付狀態\",\"US\":\"Check payment status\"}'),(1810,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::install','','安装应用','',1898,0,'',778,'{\"CN\":\"安装应用\",\"HK\":\"安裝應用\",\"US\":\"Install App\"}'),(1811,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::uninstall','','卸载应用','',1898,0,'',779,'{\"CN\":\"卸载应用\",\"HK\":\"卸載應用\",\"US\":\"Uninstall Application\"}'),(1812,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::marketLogout','','退出登录','',1898,0,'',780,'{\"CN\":\"退出登录\",\"HK\":\"退出登錄\",\"US\":\"Logout\"}'),(1813,1,'admin','admin_url','app\\admin\\controller\\DcimController::serverList','','魔方DCIM','',1876,1,'/dcim',413,'{\"CN\":\"魔方DCIM\",\"HK\":\"魔方DCIM\",\"US\":\"Cube DCIM\"}'),(1814,1,'admin','admin_url','app\\admin\\controller\\ProductController::updateFirstGroupsort','','一级分组排序修改','',5,0,'',477,'{\"CN\":\"一级分组排序修改\",\"HK\":\"一級分組排序修改\",\"US\":\"First level grouping and sorting modification\"}'),(1815,1,'admin','admin_url','app\\admin\\controller\\ProductController::updateGroupsort','','产品分组排序修改','',5,0,'',478,'{\"CN\":\"产品分组排序修改\",\"HK\":\"產品分組排序修改\",\"US\":\"Product grouping and sorting modification\"}'),(1816,1,'admin','admin_url','app\\admin\\controller\\ProductController::updateProductsort','','产品排序修改','',5,0,'',479,'{\"CN\":\"产品排序修改\",\"HK\":\"產品排序修改\",\"US\":\"Product order modification\"}'),(1817,1,'admin','admin_url','app\\admin\\controller\\ProductController::editFirstGroupPage','','一级分组添加页','',5,0,'',480,'{\"CN\":\"一级分组添加页\",\"HK\":\"一級分組添加頁\",\"US\":\"First level grouping add page\"}'),(1818,1,'admin','admin_url','app\\admin\\controller\\ProductController::saveProductFirstGroup','','保存一级分组信息','',5,0,'',481,'{\"CN\":\"保存一级分组信息\",\"HK\":\"保存一級分組信息\",\"US\":\"Save the first level grouping information\"}'),(1819,1,'admin','admin_url','app\\admin\\controller\\ProductController::deleteFirstGroup','','删除一级组','',5,0,'',482,'{\"CN\":\"删除一级组\",\"HK\":\"刪除一級組\",\"US\":\"Delete first level group\"}'),(1821,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::getGetways','','系统后台支付方式','',1843,0,'',839,'{\"CN\":\"系统后台支付方式\",\"HK\":\"系統後台支付方式\",\"US\":\"System background payment method\"}'),(1822,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::infoNotice','','系统后台消息通知','',1843,0,'',840,'{\"CN\":\"系统后台消息通知\",\"HK\":\"系統後台消息通知\",\"US\":\"System background message notification\"}'),(1823,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::getEmailTem','','系统邮件模板列表','',1843,0,'',841,'{\"CN\":\"系统邮件模板列表\",\"HK\":\"系統郵件模板列表\",\"US\":\"System Mail Template List\"}'),(1824,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::getClientGroups','','系统用户分组','',1843,0,'',842,'{\"CN\":\"系统用户分组\",\"HK\":\"系統用戶分組\",\"US\":\"System User Group\"}'),(1825,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::getProductList','','商品列表','',1843,0,'',843,'{\"CN\":\"商品列表\",\"HK\":\"商品列表\",\"US\":\"Product List\"}'),(1826,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::getPromoCode','','优惠码','',1843,0,'',844,'{\"CN\":\"优惠码\",\"HK\":\"優惠碼\",\"US\":\"Promotion Code\"}'),(1827,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::getHostList','','客户产品列表','',1843,0,'',845,'{\"CN\":\"客户产品列表\",\"HK\":\"客戶產品列表\",\"US\":\"Customer Product List\"}'),(1828,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::getSmsCountry','','国家列表','',1843,0,'',846,'{\"CN\":\"国家列表\",\"HK\":\"國家列表\",\"US\":\"Country List\"}'),(1829,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::getProductConfigOptions','','可配置项','',1843,0,'',847,'{\"CN\":\"可配置项\",\"HK\":\"可配置項\",\"US\":\"Configurable Items\"}'),(1830,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::editUpperPost','','资源修改提交','',1610,0,'',732,'{\"CN\":\"资源修改提交\",\"HK\":\"資源修改提交\",\"US\":\"Resource Modification Submit\"}'),(1831,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::ipmiStatus','','IPMI获取电源状态','',1610,0,'',733,'{\"CN\":\"IPMI获取电源状态\",\"HK\":\"IPMI獲取電源狀態\",\"US\":\"IPMI obtains power status\"}'),(1832,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::ipmiOn','','IPMI开机','',1610,0,'',734,'{\"CN\":\"IPMI开机\",\"HK\":\"IPMI開機\",\"US\":\"IPMI boot\"}'),(1833,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::ipmiOff','','IPMI关机','',1610,0,'',735,'{\"CN\":\"IPMI关机\",\"HK\":\"IPMI關機\",\"US\":\"IPMI shutdown\"}'),(1834,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::ipmiReboot','','IPMI重启','',1610,0,'',736,'{\"CN\":\"IPMI重启\",\"HK\":\"IPMI重啟\",\"US\":\"IPMI restart\"}'),(1835,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::ipmiVnc','','IPMI VNC','',1610,0,'',737,'{\"CN\":\"IPMI VNC\",\"HK\":\"IPMI VNC\",\"US\":\"IPMI VNC\"}'),(1836,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientStatus','','DCIM客户端获取电源状态','',1610,0,'',738,'{\"CN\":\"DCIM客户端获取电源状态\",\"HK\":\"DCIM客戶端獲取電源狀態\",\"US\":\"DCIM client obtains power status\"}'),(1837,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientOn','','DCIM客户端开机','',1610,0,'',739,'{\"CN\":\"DCIM客户端开机\",\"HK\":\"DCIM客戶端開機\",\"US\":\"DCIM client power on\"}'),(1838,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientOff','','DCIM客户端关机','',1610,0,'',740,'{\"CN\":\"DCIM客户端关机\",\"HK\":\"DCIM客戶端關機\",\"US\":\"DCIM client shutdown\"}'),(1839,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientReboot','','DCIM客户端重启','',1610,0,'',741,'{\"CN\":\"DCIM客户端重启\",\"HK\":\"DCIM客戶端重啟\",\"US\":\"DCIM client restart\"}'),(1840,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientVnc','','DCIM客户端VNC','',1610,0,'',742,'{\"CN\":\"DCIM客户端VNC\",\"HK\":\"DCIM客戶端VNC\",\"US\":\"DCIM Client VNC\"}'),(1841,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientVncPage','','novnc页面','',1610,0,'',743,'{\"CN\":\"novnc页面\",\"HK\":\"novnc頁面\",\"US\":\"novnc page\"}'),(1842,1,'admin','admin_url','app\\admin\\controller\\PluginController::plSort','','修改插件排序','',11,0,'',260,'{\"CN\":\"修改插件排序\",\"HK\":\"修改插件排序\",\"US\":\"Modify plug-in sorting\"}'),(1843,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller','','基础数据','',0,0,'',838,'{\"CN\":\"基础数据\",\"HK\":\"基礎數據\",\"US\":\"Basic Data\"}'),(1844,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::emptyUpper','','资源空闲','',1610,0,'',744,'{\"CN\":\"资源空闲\",\"HK\":\"資源空閒\",\"US\":\"Resource is free\"}'),(1845,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::allotUpper','','资源分配','',1610,0,'',745,'{\"CN\":\"资源分配\",\"HK\":\"資源分配\",\"US\":\"Resource Allocation\"}'),(1847,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::detail','','应用详情','',1898,0,'',781,'{\"CN\":\"应用详情\",\"HK\":\"應用詳情\",\"US\":\"Application Details\"}'),(1849,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getapilog','','API日志','',1916,1,'/api-log',683,'{\"CN\":\"API日志\",\"HK\":\"API日誌\",\"US\":\"API Log\"}'),(1850,1,'admin','admin_url','app\\admin\\controller\\ProductController::editStock','','保存产品库存','',364,0,'',454,'{\"CN\":\"保存产品库存\",\"HK\":\"保存產品庫存\",\"US\":\"Save product inventory\"}'),(1851,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientReinstall','','重装系统','',1610,0,'',746,'{\"CN\":\"重装系统\",\"HK\":\"重裝系統\",\"US\":\"Reinstall the system\"}'),(1852,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientCrackPass','','破解密码','',1610,0,'',747,'{\"CN\":\"破解密码\",\"HK\":\"破解密碼\",\"US\":\"Crack the password\"}'),(1853,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientCancelReinstall','','取消重装/破解密码','',1610,0,'',748,'{\"CN\":\"取消重装\\/破解密码\",\"HK\":\"取消重裝\\/破解密碼\",\"US\":\"Cancel reinstallation\\/Crack password\"}'),(1854,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientReinstallStatus','','获取重装/破解密码状态','',1610,0,'',749,'{\"CN\":\"获取重装\\/破解密码状态\",\"HK\":\"獲取重裝\\/破解密碼狀態\",\"US\":\"Get reinstallation\\/crack password status\"}'),(1855,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController::dcimClientGetOs','','获取操作系统','',1610,0,'',750,'{\"CN\":\"获取操作系统\",\"HK\":\"獲取操作系統\",\"US\":\"Get Operating System\"}'),(1857,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::update','','更新应用','',1898,0,'',782,'{\"CN\":\"更新应用\",\"HK\":\"更新應用\",\"US\":\"Update Application\"}'),(1859,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::testLink','','服务器连接测试','',528,0,'',400,'{\"CN\":\"服务器连接测试\",\"HK\":\"服務器連接測試\",\"US\":\"Server Connection Test\"}'),(1860,1,'admin','admin_url','','','客户管理','',1,1,'',4,'{\"CN\":\"客户管理\",\"HK\":\"客戶管理\",\"US\":\"Customer Management\"}'),(1861,1,'admin','admin_url','','','我的业绩','',1,1,'',44,'{\"CN\":\"我的业绩\",\"HK\":\"我的業績\",\"US\":\"My Performance\"}'),(1862,1,'admin','admin_url','','','客户跟踪','',1861,0,'',45,'{\"CN\":\"客户跟踪\",\"HK\":\"客戶跟踪\",\"US\":\"Customer Tracking\"}'),(1863,1,'admin','admin_url','','','运营管理','',1,1,'',51,'{\"CN\":\"运营管理\",\"HK\":\"運營管理\",\"US\":\"Operation Management\"}'),(1864,1,'admin','admin_url','app\\admin\\controller\\SendMessageBatchController','','营销推送','',1863,1,'/marketing-push',52,'{\"CN\":\"营销推送\",\"HK\":\"營銷推送\",\"US\":\"Marketing Push\"}'),(1866,1,'admin','admin_url','','','订单','',2,1,'',123,'{\"CN\":\"订单\",\"HK\":\"訂單\",\"US\":\"Order\"}'),(1867,1,'admin','admin_url','','','业务','',2,1,'',147,'{\"CN\":\"业务\",\"HK\":\"業務\",\"US\":\"Business\"}'),(1868,1,'admin','admin_url','','','财务记录','',3,1,'',189,'{\"CN\":\"财务记录\",\"HK\":\"財務記錄\",\"US\":\"Financial Records\"}'),(1869,1,'admin','admin_url','','','审核管理','',3,1,'',239,'{\"CN\":\"审核管理\",\"HK\":\"審核管理\",\"US\":\"Audit Management\"}'),(1870,1,'admin','admin_url','','','充值记录','',1868,0,'',190,'{\"CN\":\"充值记录\",\"HK\":\"充值記錄\",\"US\":\"Recharge Record\"}'),(1871,1,'admin','admin_url','','','退款记录','',1868,0,'',191,'{\"CN\":\"退款记录\",\"HK\":\"退款記錄\",\"US\":\"Refund Record\"}'),(1872,1,'admin','admin_url','','','合同管理','',1869,0,'',242,'{\"CN\":\"合同管理\",\"HK\":\"合同管理\",\"US\":\"Contract Management\"}'),(1873,1,'admin','admin_url','','','发票管理','',1869,0,'',243,'{\"CN\":\"发票管理\",\"HK\":\"發票管理\",\"US\":\"Invoice Management\"}'),(1874,1,'admin','admin_url','','','我的工单','',335,0,'',300,'{\"CN\":\"我的工单\",\"HK\":\"我的工單​​\",\"US\":\"My Ticket\"}'),(1875,1,'admin','admin_url','','','商品配置','',5,1,'',360,'{\"CN\":\"商品配置\",\"HK\":\"商品配置\",\"US\":\"Commodity Configuration\"}'),(1876,1,'admin','admin_url','','','自动化接口','',5,1,'',398,'{\"CN\":\"自动化接口\",\"HK\":\"自動化接口\",\"US\":\"Automation Interface\"}'),(1878,1,'admin','admin_url','','','设置','',5,1,'',422,'{\"CN\":\"设置\",\"HK\":\"設置\",\"US\":\"Settings\"}'),(1879,1,'admin','admin_url','','','全局可配置项','',1878,1,'/configurable-option',423,'{\"CN\":\"全局可配置项\",\"HK\":\"全局可配置項\",\"US\":\"Globally configurable items\"}'),(1882,1,'admin','admin_url','','','客户资源池','',1860,1,'/customer-resources',43,'{\"CN\":\"客户资源池\",\"HK\":\"客戶資源池\",\"US\":\"Customer Resource Pool\"}'),(1889,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getLocal','','本地化','',1910,0,'/general-settings/local',581,'{\"CN\":\"本地化\",\"HK\":\"本地化\",\"US\":\"Localization\"}'),(1891,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::registerloginpage','','注册登录','',1910,0,'/general-settings/login-setting',582,'{\"CN\":\"注册登录\",\"HK\":\"註冊登錄\",\"US\":\"Register and Login\"}'),(1892,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::invoicePage','','充值与财务','',1902,1,'/general-settings/finance',270,'{\"CN\":\"充值与财务\",\"HK\":\"充值與財務\",\"US\":\"Recharge and Finance\"}'),(1893,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getApiConfig','','API','',1910,0,'/general-settings/source-api',583,'{\"CN\":\"API\",\"HK\":\"API\",\"US\":\"API\"}'),(1894,1,'admin','admin_url','app\\admin\\controller\\CronController','','定时任务','',1910,1,'/automatic-tasks',577,'{\"CN\":\"定时任务\",\"HK\":\"定時任務\",\"US\":\"Timed Task\"}'),(1895,1,'admin','admin_url','app-store','','资源与商店','',0,1,'/app-store/app-list',768,'{\"CN\":\"资源与商店\",\"HK\":\"資源與商店\",\"US\":\"Resources And Stores\"}'),(1897,1,'admin','admin_url','app\\admin\\controller\\ReportsController','','功能','',0,1,'/timing-results',358,'{\"CN\":\"功能\",\"HK\":\"功能\",\"US\":\"Function\"}'),(1898,1,'admin','admin_url','app-store','','应用商店','',1895,1,'/app-store/app-list',768,'{\"CN\":\"应用商店\",\"HK\":\"應用商店\",\"US\":\"App Store\"}'),(1899,1,'admin','admin_url','app\\admin\\controller\\UpperReachesController','','上下游','',1895,1,'/zjmf-api',714,'{\"CN\":\"上下游\",\"HK\":\"上下游\",\"US\":\"Upstream And Downstream\"}'),(1900,1,'admin','admin_url','app\\admin\\controller\\VoucherController','','发票和合同','',3,1,'',244,'{\"CN\":\"发票和合同\",\"HK\":\"發票和合同\",\"US\":\"Invoices and Contracts\"}'),(1901,1,'admin','admin_url','setting','','客户设置','',7,1,'',87,'{\"CN\":\"客户设置\",\"HK\":\"客户設置\",\"US\":\"Customer Settings\"}'),(1902,1,'admin','admin_url','accountset','','财务设置','',7,1,'',249,'{\"CN\":\"财务设置\",\"HK\":\"财务設置\",\"US\":\"Financial Settings\"}'),(1904,1,'admin','admin_url','','','反馈','',0,1,'',769,'{\"CN\":\"反馈\",\"HK\":\"迴響\",\"US\":\"Feedback\"}'),(1905,1,'admin','admin_url','','','需求','',1904,1,'https://bbs.idcsmart.com/forum.php?mod=forumdisplay&fid=10',249,'{\"CN\":\"需求\",\"HK\":\"需求\",\"US\":\"Demand\"}'),(1906,1,'admin','admin_url','','','互助','',1904,1,'https://bbs.idcsmart.com/forum.php?mod=forumdisplay&fid=10',250,'{\"CN\":\"互助\",\"HK\":\"互助\",\"US\":\"Help\"}'),(1907,1,'admin','admin_url','','','BUG反馈','',1904,1,'https://bbs.idcsmart.com/forum.php?mod=forumdisplay&fid=50&filter=typeid&typeid=62',251,'{\"CN\":\"BUG反馈\",\"HK\":\"BUG迴響\",\"US\":\"Bug Feedback\"}'),(1909,1,'admin','admin_url','System','','系统设置','',6,1,'/general-settings/general',358,'{\"CN\":\"系统设置\",\"HK\":\"系統設置\",\"US\":\"System Set\"}'),(1910,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController','','基础设置','',1909,1,'',572,'{\"CN\":\"基础设置\",\"HK\":\"基礎設置\",\"US\":\"Basic Settings\"}'),(1912,1,'admin','admin_url','app\\admin\\controller\\UserController','','人员管理','',1909,1,'',592,'{\"CN\":\"人员管理\",\"HK\":\"人員管理\",\"US\":\"Personnel Management\"}'),(1913,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController','','短信邮件设置','',1909,1,'',626,'{\"CN\":\"短信邮件设置\",\"HK\":\"短信郵件設置\",\"US\":\"SMS mail settings\"}'),(1914,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController','','安全相关','',1909,1,'',663,'{\"CN\":\"安全相关\",\"HK\":\"安全相關\",\"US\":\"Security related\"}'),(1915,1,'admin','admin_url','app\\admin\\controller\\SystemController','','系统相关','',1909,1,'',670,'{\"CN\":\"系统相关\",\"HK\":\"系統相關\",\"US\":\"System Related\"}'),(1916,1,'admin','admin_url','app\\admin\\controller\\LogRecordController','','日志','',1909,1,'',679,'{\"CN\":\"日志\",\"HK\":\"日誌\",\"US\":\"Log\"}'),(1920,1,'admin','admin_url','app\\admin\\controller\\DcimCloudController::serverList','','魔方云','',1876,1,'/zjmfcloud',420,'{\"CN\":\"魔方云\",\"HK\":\"魔方雲\",\"US\":\"Magic Cube Cloud\"}'),(1921,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::invoicePage','','产品分类','',1878,0,'/general-settings/class',425,'{\"CN\":\"产品分类\",\"HK\":\"產品分類\",\"US\":\"Product Classification\"}'),(1922,1,'admin','admin_url','app\\admin\\controller\\ConfigMessagecontroller::sendsmstest','','测试短信','',531,0,'',644,'{\"CN\":\"测试短信\",\"HK\":\"測試短信\",\"US\":\"Test SMS\"}'),(1923,1,'admin','admin_url','app\\admin\\controller\\SaleController::getTimetype','','获取时间类型','',1861,0,'',46,'{\"CN\":\"获取时间类型\",\"HK\":\"獲取時間類型\",\"US\":\"Get Time Type\"}'),(1924,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller','','我的应用','',1898,1,'/app-store',783,'{\"CN\":\"我的应用\",\"HK\":\"我的應用\",\"US\":\"My Application\"}'),(1928,1,'admin','admin_url','app\\admin\\controller\\SystemController::putLicense','','更换授权码','',1909,0,'',693,'{\"CN\":\"更换授权码\",\"HK\":\"更換授權碼\",\"US\":\"Replace authorization code\"}'),(1929,1,'admin','admin_url','app\\admin\\controller\\SystemController::getLastVersion','','下个版本','',1909,0,'',694,'{\"CN\":\"下个版本\",\"HK\":\"下個版本\",\"US\":\"Next version\"}'),(1930,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::getcaptcha_page','','验证码设置','',1914,1,'/general-settings/captcha',665,'{\"CN\":\"验证码设置\",\"HK\":\"驗證碼設置\",\"US\":\"Verification Code Settings\"}'),(1931,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralcontroller::postregister_login_captcha','','验证码设置提交','',1914,0,'',666,'{\"CN\":\"验证码设置提交\",\"HK\":\"驗證碼設置提交\",\"US\":\"Verification code setting submission\"}'),(1932,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::rankingList','','应用排行榜','',1898,0,'',784,'{\"CN\":\"应用排行榜\",\"HK\":\"應用排行榜\",\"US\":\"App Ranking\"}'),(1933,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::myApps','','我的应用','',1898,0,'',785,'{\"CN\":\"我的应用\",\"HK\":\"我的應用\",\"US\":\"My Application\"}'),(1934,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::favoriteApp','','应用收藏','',1898,0,'',786,'{\"CN\":\"应用收藏\",\"HK\":\"應用收藏\",\"US\":\"App Collection\"}'),(1935,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::favoriteAppAdd','','应用添加收藏','',1898,0,'',787,'{\"CN\":\"应用添加收藏\",\"HK\":\"應用添加收藏\",\"US\":\"Apply add favorites\"}'),(1936,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::favoriteAppDel','','应用移除删除','',1898,0,'',788,'{\"CN\":\"应用移除删除\",\"HK\":\"應用移除刪除\",\"US\":\"App remove delete\"}'),(1937,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::appEvaluation','','应用评论','',1898,0,'',789,'{\"CN\":\"应用评论\",\"HK\":\"應用評論\",\"US\":\"App Review\"}'),(1938,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::appEvaluationAdd','','应用添加评论','',1898,0,'',790,'{\"CN\":\"应用添加评论\",\"HK\":\"應用添加評論\",\"US\":\"Apply add comment\"}'),(1939,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::appEvaluationDel','','应用删除评论','',1898,0,'',791,'{\"CN\":\"应用删除评论\",\"HK\":\"應用刪除評論\",\"US\":\"App delete comment\"}'),(1940,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::evaluationEvaluate','','追加评论','',1898,0,'',792,'{\"CN\":\"追加评论\",\"HK\":\"追加評論\",\"US\":\"Add Comment\"}'),(1941,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::evaluationLikeAdd','','评论点赞','',1898,0,'',793,'{\"CN\":\"评论点赞\",\"HK\":\"評論點贊\",\"US\":\"Comment Like\"}'),(1942,1,'admin','admin_url','app\\admin\\controller\\AppStorecontroller::evaluationLikeDel','','评论取消点赞','',1898,0,'',794,'{\"CN\":\"评论取消点赞\",\"HK\":\"評論取消點贊\",\"US\":\"Comment canceled like\"}'),(1943,1,'admin','admin_url','','','客户等级','',1901,1,'/customer-level',95,'{\"CN\":\"客户等级\",\"HK\":\"客戶等級\",\"US\":\"Customer Level\"}'),(1944,1,'admin','admin_url','app\\admin\\controller\\Commoncontroller::saleList','','销售列表','',1843,0,'',848,'{\"CN\":\"销售列表\",\"HK\":\"銷售列表\",\"US\":\"Sales List\"}'),(1945,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::getUserDownList','','附件列表','',420,0,'',526,'{\"CN\":\"附件列表\",\"HK\":\"附件列表\",\"US\":\"Attachment List\"}'),(1946,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::getUserFile','','下载附件','',420,0,'',527,'{\"CN\":\"下载附件\",\"HK\":\"下載附件\",\"US\":\"Download attachment\"}'),(1947,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postUploadUserFile','','添加文件','',420,0,'',528,'{\"CN\":\"添加文件\",\"HK\":\"添加文件\",\"US\":\"Add File\"}'),(1948,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::deleteUserFile','','删除文件','',420,0,'',529,'{\"CN\":\"删除文件\",\"HK\":\"刪除文件\",\"US\":\"Delete File\"}'),(1949,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postAddUserFile','','添加用户附件','',420,0,'',530,'{\"CN\":\"添加用户附件\",\"HK\":\"添加用戶附件\",\"US\":\"Add user attachment\"}'),(1950,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::getUserFilePage','','编辑添加附件页面','',420,0,'',531,'{\"CN\":\"编辑添加附件页面\",\"HK\":\"編輯添加附件頁面\",\"US\":\"Edit and add attachment page\"}'),(1951,1,'admin','admin_url','app\\admin\\controller\\Downloadscontroller::postSaveUserFile','','保存附件信息','',420,0,'',532,'{\"CN\":\"保存附件信息\",\"HK\":\"保存附件信息\",\"US\":\"Save attachment information\"}'),(1953,1,'admin','admin_url','app\\admin\\controller\\UserLevelController::getList','','客户等级列表','',1943,0,'',96,'{\"CN\":\"客户等级列表\",\"HK\":\"客戶等級列表\",\"US\":\"Customer Level List\"}'),(1954,1,'admin','admin_url','app\\admin\\controller\\UserLevelController::getLevelPage','','编辑规则页面','',1943,0,'',97,'{\"CN\":\"编辑规则页面\",\"HK\":\"編輯規則頁面\",\"US\":\"Edit Rule Page\"}'),(1955,1,'admin','admin_url','app\\admin\\controller\\UserLevelController::postLevel','','创建/编辑规则','',1943,0,'',98,'{\"CN\":\"创建\\/编辑规则\",\"HK\":\"創建\\/編輯規則\",\"US\":\"Create\\/Edit Rule\"}'),(1956,1,'admin','admin_url','app\\admin\\controller\\UserLevelController::deleteLevel','','删除规则','',1943,0,'',99,'{\"CN\":\"删除规则\",\"HK\":\"刪除規則\",\"US\":\"Delete Rule\"}'),(1957,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::addRecordLog','','添加跟踪记录','',1507,0,'',183,'{\"CN\":\"添加跟踪记录\",\"HK\":\"添加跟踪記錄\",\"US\":\"Add Tracking Record\"}'),(1958,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::addRemarkLog','','添加跟踪记录 补充说明','',1507,0,'',184,'{\"CN\":\"添加跟踪记录 补充说明\",\"HK\":\"添加跟踪記錄 補充說明\",\"US\":\"Add tracking record supplementary explanation\"}'),(1959,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::getTrackRecord','','获取跟踪记录','',1507,0,'',185,'{\"CN\":\"获取跟踪记录\",\"HK\":\"獲取跟踪記錄\",\"US\":\"Get Tracking Record\"}'),(1960,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::clientTrackStatus','','修改跟踪记录状态','',1507,0,'',186,'{\"CN\":\"修改跟踪记录状态\",\"HK\":\"修改跟踪記錄狀態\",\"US\":\"Modify Track Record Status\"}'),(1961,1,'admin','admin_url','app\\admin\\controller\\DcimController::delete','','dcim删除','',1876,0,'',421,'{\"CN\":\"dcim删除\",\"HK\":\"dcim刪除\",\"US\":\"dcim delete\"}'),(1962,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::clientlistre','','客户列表','',13,0,'',26,'{\"CN\":\"客户列表\",\"HK\":\"客戶列表\",\"US\":\"Customer List\"}'),(1965,1,'admin','admin_url','app\\admin\\controller\\LogRecordController','','日志清理','',1916,1,'/log-cleanup',685,'{\"CN\":\"日志清理\",\"HK\":\"日誌清理\",\"US\":\"Log Cleanup\"}'),(1966,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getDeleteLogPage','','删除日志页面','',1965,0,'0',686,'{\"CN\":\"删除日志页面\",\"HK\":\"刪除日誌頁面\",\"US\":\"Delete log page\"}'),(1967,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::getAffirmDeleteLogPage','','删除日志页面(二次确认)','',1965,0,'0',687,'{\"CN\":\"删除日志页面(二次确认)\",\"HK\":\"刪除日誌頁面(二次確認)\",\"US\":\"Delete log page (second confirmation)\"}'),(1968,1,'admin','admin_url','app\\admin\\controller\\LogRecordController::deleteLog','','删除日志','',1965,0,'0',688,'{\"CN\":\"删除日志\",\"HK\":\"刪除日誌\",\"US\":\"Delete log\"}'),(1969,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::postBatchRenewPage','','结算批量续费（页面）','',28,0,'',174,'{\"CN\":\"结算批量续费（页面）\",\"HK\":\"結算批量續費（頁面）\",\"US\":\"Settlement batch renewal (page)\"}'),(1970,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::postBatchRenew','','结算批量续费','',28,0,'',175,'{\"CN\":\"结算批量续费\",\"HK\":\"結算批量續費\",\"US\":\"Settlement batch renewal\"}'),(1971,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::getApplyCreditPage','','向账单使用余额 页面','',28,0,'',177,'{\"CN\":\"向账单使用余额 页面\",\"HK\":\"向賬單使用餘額 頁面\",\"US\":\"Use balance page to bill\"}'),(1972,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::applyCredit','','向账单使用余额','',28,0,'',178,'{\"CN\":\"向账单使用余额\",\"HK\":\"向賬單使用餘額\",\"US\":\"Use balance to bill\"}'),(1973,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getTimetype','','获取时间类型','',1463,0,'',67,'{\"CN\":\"获取时间类型\",\"HK\":\"獲取時間類型\",\"US\":\"Get Time Type\"}'),(1974,1,'admin','admin_url','app\\admin\\controller\\AdvancedOptionscontroller','','高级可配置项','',0,0,'',921,'{\"CN\":\"高级可配置项\",\"HK\":\"高級可配置項\",\"US\":\"Advanced configurable items\"}'),(1975,1,'admin','admin_url','app\\admin\\controller\\AdvancedOptionscontroller::page','','高级配置页面','',1974,0,'',922,'{\"CN\":\"高级配置页面\",\"HK\":\"高級配置頁面\",\"US\":\"Advanced Configuration Page\"}'),(1976,1,'admin','admin_url','app\\admin\\controller\\AdvancedOptionscontroller::create','','高级配置创建、编辑','',1974,0,'',923,'{\"CN\":\"高级配置创建、编辑\",\"HK\":\"高級配置創建、編輯\",\"US\":\"Advanced configuration creation and editing\"}'),(1977,1,'admin','admin_url','app\\admin\\controller\\AdvancedOptionscontroller::deleteCondition','','删除条件','',1974,0,'',924,'{\"CN\":\"删除条件\",\"HK\":\"刪除條件\",\"US\":\"Delete Condition\"}'),(1978,1,'admin','admin_url','app\\admin\\controller\\AdvancedOptionscontroller::deleteResult','','删除结果','',1974,0,'',925,'{\"CN\":\"删除结果\",\"HK\":\"刪除結果\",\"US\":\"Delete Results\"}'),(1979,1,'admin','admin_url','app\\admin\\controller\\AdvancedOptionscontroller::addCondition','','添加条件','',1974,0,'',926,'{\"CN\":\"添加条件\",\"HK\":\"添加條件\",\"US\":\"Add Condition\"}'),(1980,1,'admin','admin_url','app\\admin\\controller\\AdvancedOptionscontroller::addResult','','添加结果','',1974,0,'',927,'{\"CN\":\"添加结果\",\"HK\":\"添加結果\",\"US\":\"Add Result\"}'),(1981,1,'admin','admin_url','app\\admin\\controller\\AffiliateController::gettimetype','','获取时间类型','',1463,0,'',74,'{\"CN\":\"获取时间类型\",\"HK\":\"獲取時間類型\",\"US\":\"Get Time Type\"}'),(1984,1,'admin','admin_url','app\\admin\\controller\\VoucherController','','发票管理','',1900,0,'/invoice-manage',245,'{\"CN\":\"发票管理\",\"HK\":\"發票管理\",\"US\":\"Invoice Management\"}'),(1985,1,'admin','admin_url','app\\admin\\controller\\VoucherController::getVoucherList','','发票列表','',1900,1,'/invoice-audit',248,'{\"CN\":\"发票列表\",\"HK\":\"發票列表\",\"US\":\"Invoice List\"}'),(1986,1,'admin','admin_url','app\\admin\\controller\\InvoiceController::getCombineInvoices','','合并账单页面','',408,0,'',237,'{\"CN\":\"合并账单页面\",\"HK\":\"合併賬單頁面\",\"US\":\"Consolidated Billing Page\"}'),(1987,1,'admin','admin_url','app\\admin\\controller\\InvoiceController::combineInvoices','','合并账单','',408,0,'',238,'{\"CN\":\"合并账单\",\"HK\":\"合併賬單\",\"US\":\"Consolidated Bills\"}'),(1988,1,'admin','admin_url','app\\admin\\controller\\VoucherController::getrate','','设置费率页面','',2010,0,'',283,'{\"CN\":\"设置费率页面\",\"HK\":\"設置費率頁面\",\"US\":\"Set rate page\"}'),(1989,1,'admin','admin_url','app\\admin\\controller\\VoucherController::postRate','','设置费率','',2010,0,'',284,'{\"CN\":\"设置费率\",\"HK\":\"設置費率\",\"US\":\"Set rate\"}'),(1990,1,'admin','admin_url','app\\admin\\controller\\VoucherController::getExpressList','','快递管理列表','',2010,0,'',285,'{\"CN\":\"快递管理列表\",\"HK\":\"快遞管理列表\",\"US\":\"Express Delivery Management List\"}'),(1991,1,'admin','admin_url','app\\admin\\controller\\VoucherController::postExpress','','快递管理(添加、编辑)','',2010,0,'',286,'{\"CN\":\"快递管理(添加、编辑)\",\"HK\":\"快遞管理(添加、編輯)\",\"US\":\"Express Delivery Management (Add, Edit)\"}'),(1992,1,'admin','admin_url','app\\admin\\controller\\VoucherController::getExpress','','快递管理页面','',2010,0,'',287,'{\"CN\":\"快递管理页面\",\"HK\":\"快遞管理頁面\",\"US\":\"Express Delivery Management Page\"}'),(1993,1,'admin','admin_url','app\\admin\\controller\\VoucherController::deleteExpress','','快递管理(删除)','',2010,0,'',288,'{\"CN\":\"快递管理(删除)\",\"HK\":\"快遞管理(刪除)\",\"US\":\"Express Delivery Management (deleted)\"}'),(1994,1,'admin','admin_url','app\\admin\\controller\\VoucherController::postVoucherStatus','','修改发票状态','',1984,0,'',246,'{\"CN\":\"修改发票状态\",\"HK\":\"修改發票狀態\",\"US\":\"Modify Invoice Status\"}'),(1995,1,'admin','admin_url','app\\admin\\controller\\VoucherController::getVoucherDetail','','发票详情','',1984,0,'',247,'{\"CN\":\"发票详情\",\"HK\":\"發票詳情\",\"US\":\"Invoice Details\"}'),(1996,1,'admin','admin_url','','','工单传递','',1320,1,'/work-order-rules',353,'{\"CN\":\"工单传递\",\"HK\":\"工單傳遞\",\"US\":\"Ticket Transfer\"}'),(1997,1,'admin','admin_url','app\\admin\\controller\\CommonController::getUpstreamTicketDepartmentList','','上游部门列表','',1843,0,'',849,'{\"CN\":\"上游部门列表\",\"HK\":\"上游部門列表\",\"US\":\"Upstream Department List\"}'),(1998,1,'admin','admin_url','app\\admin\\controller\\TicketDeliverController::addPage','','添加工单传递规则页面','',1996,0,'',354,'{\"CN\":\"添加工单传递规则页面\",\"HK\":\"添加工單傳遞規則頁面\",\"US\":\"Add Ticket Delivery Rule Page\"}'),(1999,1,'admin','admin_url','app\\admin\\controller\\TicketDeliverController::add','','添加工单传递规则','',1996,0,'',355,'{\"CN\":\"添加工单传递规则\",\"HK\":\"添加工單傳遞規則\",\"US\":\"Add Ticket routing rules\"}'),(2000,1,'admin','admin_url','app\\admin\\controller\\TicketDeliverController::save','','编辑工单传递规则','',1996,0,'',356,'{\"CN\":\"编辑工单传递规则\",\"HK\":\"編輯工單傳遞規則\",\"US\":\"Edit Ticket Delivery Rules\"}'),(2001,1,'admin','admin_url','app\\admin\\controller\\TicketDeliverController::delete','','删除工单传递规则','',1996,0,'',357,'{\"CN\":\"删除工单传递规则\",\"HK\":\"刪除工單傳遞規則\",\"US\":\"Delete Ticket Delivery Rules\"}'),(2002,1,'admin','admin_url','app\\admin\\controller\\TicketDeliverController::getList','','工单传递规则列表','',1996,0,'',358,'{\"CN\":\"工单传递规则列表\",\"HK\":\"工單傳遞規則列表\",\"US\":\"Ticket Delivery Rule List\"}'),(2003,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::navGroupOrder','','产品分类排序','',1921,0,'',429,'{\"CN\":\"产品分类排序\",\"HK\":\"產品分類排序\",\"US\":\"Product Category Sorting\"}'),(2004,1,'admin','admin_url','app\\admin\\controller\\OauthController::listing','','所有三方登录','',1910,0,'',584,'{\"CN\":\"所有三方登录\",\"HK\":\"所有三方登錄\",\"US\":\"All three parties login\"}'),(2005,1,'admin','admin_url','app\\admin\\controller\\OauthController::active','','激活','',1910,0,'',585,'{\"CN\":\"激活\",\"HK\":\"激活\",\"US\":\"Activate\"}'),(2006,1,'admin','admin_url','app\\admin\\controller\\OauthController::config','','配置选项设置页面','',1910,0,'',586,'{\"CN\":\"配置选项设置页面\",\"HK\":\"配置選項設置頁面\",\"US\":\"Configuration Option Setting Page\"}'),(2007,1,'admin','admin_url','app\\admin\\controller\\OauthController::configSave','','配置选项提交保存页面','',1910,0,'',587,'{\"CN\":\"配置选项提交保存页面\",\"HK\":\"配置選項提交保存頁面\",\"US\":\"Configuration option submission save page\"}'),(2008,1,'admin','admin_url','app\\admin\\controller\\OauthController::suspend','','停用三方登录','',1910,0,'',588,'{\"CN\":\"停用三方登录\",\"HK\":\"停用三方登錄\",\"US\":\"Disable three-way login\"}'),(2010,1,'admin','admin_url','','','发票设置','',1902,1,'/voucher-setting',282,'{\"CN\":\"发票设置\",\"HK\":\"發票設置\",\"US\":\"Invoice Settings\"}'),(2011,1,'admin','admin_url','','','订购商品','',1910,0,'/general-settings/order',589,'{\"CN\":\"订购商品\",\"HK\":\"訂購商品\",\"US\":\"Order Goods\"}'),(2012,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::getBuyProductPage','','订购商品设置页面','',2011,0,'',590,'{\"CN\":\"订购商品设置页面\",\"HK\":\"訂購商品設置頁面\",\"US\":\"Order product setting page\"}'),(2013,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postBuyProduct','','订购商品设置','',2011,0,'',591,'{\"CN\":\"订购商品设置\",\"HK\":\"訂購商品設置\",\"US\":\"Order product settings\"}'),(2014,1,'admin','admin_url','','','工单统计','',335,1,'/support-statistics',316,'{\"CN\":\"工单统计\",\"HK\":\"工單統計\",\"US\":\"Ticket Statistics\"}'),(2019,1,'admin','admin_url','app\\admin\\controller\\TicketController::ticketStatistics','','工单统计','',2014,0,'',317,'{\"CN\":\"工单统计\",\"HK\":\"工單統計\",\"US\":\"Ticket Statistics\"}'),(2020,1,'admin','admin_url','app\\admin\\controller\\TicketController::ticketReceive','','工单接单','',2014,0,'',318,'{\"CN\":\"工单接单\",\"HK\":\"工單接單\",\"US\":\"Ticket Acceptance\"}'),(2021,1,'admin','admin_url','app\\admin\\controller\\TicketController::ticketTransfer','','工单转移','',2014,0,'',319,'{\"CN\":\"工单转移\",\"HK\":\"工單轉移\",\"US\":\"Ticket Transfer\"}'),(2022,1,'admin','admin_url','app\\admin\\controller\\TicketController::ticketTransferList','','获取工单转移对象列表','',2014,0,'',320,'{\"CN\":\"获取工单转移对象列表\",\"HK\":\"獲取工單轉移對象列表\",\"US\":\"Get a list of Ticket transfer objects\"}'),(2023,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::getClientNotes','','获取备注信息','',542,0,'',40,'{\"CN\":\"获取备注信息\",\"HK\":\"獲取備註信息\",\"US\":\"Get Remarks Information\"}'),(2024,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::postClientNotes','','修改备注信息','',542,0,'',41,'{\"CN\":\"修改备注信息\",\"HK\":\"修改備註信息\",\"US\":\"Modify Remarks Information\"}'),(2041,1,'admin','admin_url','plugins','','插件','',1897,1,'https://cloud.hfz.pw/Z5OtUlpd/plugins',698,'{\"CN\":\"插件\",\"HK\":\"插件\",\"US\":\"Plugin\"}'),(2042,1,'admin','admin_url','plugins','','插件列表','',2041,1,'https://cloud.hfz.pw/Z5OtUlpd/plugins',713,'{\"CN\":\"插件列表\",\"HK\":\"插件列表\",\"US\":\"Plugin List\"}'),(2043,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::index','','用户信用额详细','',13,0,'',27,'{\"CN\":\"用户信用额详细\",\"HK\":\"用戶信用額詳細\",\"US\":\"User credit details\"}'),(2044,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::log','','信用额调整记录','',13,0,'',28,'{\"CN\":\"信用额调整记录\",\"HK\":\"信用額調整記錄\",\"US\":\"Credit Adjustment Record\"}'),(2045,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::save','','启用信用额','',13,0,'',29,'{\"CN\":\"启用信用额\",\"HK\":\"啟用信用額\",\"US\":\"Enable Credit\"}'),(2046,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::update','','修改信用额','',13,0,'',30,'{\"CN\":\"修改信用额\",\"HK\":\"修改信用額\",\"US\":\"Modify Credit Limit\"}'),(2047,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::delete','','删除信用额','',13,0,'',33,'{\"CN\":\"删除信用额\",\"HK\":\"刪除信用額\",\"US\":\"Delete Credit\"}'),(2048,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::list','','用户信用额使用记录','',13,0,'',10,'{\"CN\":\"用户信用额使用记录\",\"HK\":\"用戶信用額使用記錄\",\"US\":\"User Credit Usage Record\"}'),(2049,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::userInvoice','','用户信用额使用记录','',13,0,'',11,'{\"CN\":\"用户信用额使用记录\",\"HK\":\"用戶信用額使用記錄\",\"US\":\"User Credit Usage Record\"}'),(2050,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::creditLimitInvoice','','用户信用额账单详情','',13,0,'',13,'{\"CN\":\"用户信用额账单详情\",\"HK\":\"用戶信用額賬單詳情\",\"US\":\"User Credit Billing Details\"}'),(2052,1,'admin','admin_url','app\\admin\\controller\\UploadController::upload','','上传图片','',1316,0,'',546,'{\"CN\":\"上传图片\",\"HK\":\"上傳圖片\",\"US\":\"Upload Picture\"}'),(2053,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::getCustomParamType','','获取自定义字段类型','',308,0,'',323,'{\"CN\":\"获取自定义字段类型\",\"HK\":\"獲取自定義字段類型\",\"US\":\"Get Custom Field Type\"}'),(2054,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::addTicketCustomParam','','添加自定义字段','',308,0,'',324,'{\"CN\":\"添加自定义字段\",\"HK\":\"添加自定義字段\",\"US\":\"Add custom field\"}'),(2055,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::getTicketParamVal','','获取修改自定义字段的值','',308,0,'',325,'{\"CN\":\"获取修改自定义字段的值\",\"HK\":\"獲取修改自定義字段的值\",\"US\":\"Get and modify the value of a custom field\"}'),(2056,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::editTicketCustomParam','','修改自定义字段','',308,0,'',326,'{\"CN\":\"修改自定义字段\",\"HK\":\"修改自定義字段\",\"US\":\"Modify custom fields\"}'),(2057,1,'admin','admin_url','app\\admin\\controller\\TicketDepartmentController::delTicketCustomParam','','删除自定义字段','',308,0,'',327,'{\"CN\":\"删除自定义字段\",\"HK\":\"刪除自定義字段\",\"US\":\"Delete custom fields\"}'),(2058,1,'admin','admin_url','app\\admin\\controller\\NewsController::getGetCustomParam','','获取www自定义字段列表','',252,0,'',563,'{\"CN\":\"获取www自定义字段列表\",\"HK\":\"獲取www自定義字段列表\",\"US\":\"Get the list of www custom fields\"}'),(2059,1,'admin','admin_url','app\\admin\\controller\\NewsController::getAddCustomParam','','添加www自定义字段','',252,0,'',564,'{\"CN\":\"添加www自定义字段\",\"HK\":\"添加www自定義字段\",\"US\":\"Add www custom field\"}'),(2060,1,'admin','admin_url','app\\admin\\controller\\NewsController::getUpdateCustomParam','','修改www自定义字段','',252,0,'',565,'{\"CN\":\"修改www自定义字段\",\"HK\":\"修改www自定義字段\",\"US\":\"Modify www custom field\"}'),(2061,1,'admin','admin_url','app\\admin\\controller\\NewsController::getDelCustomParam','','删除www自定义字段的值','',252,0,'',566,'{\"CN\":\"删除www自定义字段的值\",\"HK\":\"刪除www自定義字段的值\",\"US\":\"Delete the value of the www custom field\"}'),(2062,1,'admin','admin_url','app\\admin\\controller\\NewsController::getGetCustomUpdateVal','','获取要修改的www自定义字段的值','',252,0,'',567,'{\"CN\":\"获取要修改的www自定义字段的值\",\"HK\":\"獲取要修改的www自定義字段的值\",\"US\":\"Get the value of the www custom field to be modified\"}'),(2064,1,'admin','admin_url','','','基础信息','',238,1,'/base-info',499,'{\"CN\":\"基础信息\",\"HK\":\"基礎信息\",\"US\":\"Basic Information\"}'),(2065,1,'admin','admin_url','','','主题模板','',238,1,'/theme-template',500,'{\"CN\":\"主题模板\",\"HK\":\"主題模板\",\"US\":\"Theme Template\"}'),(2066,1,'admin','admin_url','','','官网自定义字段','',238,1,'/custom-template-fields',501,'{\"CN\":\"官网自定义字段\",\"HK\":\"官網自定義字段\",\"US\":\"Official website custom fields\"}'),(2067,1,'admin','admin_url','help','','帮助中心','',8,1,'',558,'{\"CN\":\"帮助中心\",\"HK\":\"幫助中心\",\"US\":\"Help Center\"}'),(2068,1,'admin','admin_url','','','基础信息','',251,1,'/menber-base-info',522,'{\"CN\":\"基础信息\",\"HK\":\"基礎信息\",\"US\":\"Basic Information\"}'),(2069,1,'admin','admin_url','','','注册登录','',1910,1,'/login-register',580,'{\"CN\":\"注册登录\",\"HK\":\"註冊登錄\",\"US\":\"Register and Login\"}'),(2070,1,'admin','admin_url','','','主题模板','',251,1,'/menber-theme-template',523,'{\"CN\":\"主题模板\",\"HK\":\"主題模板\",\"US\":\"Theme Template\"}'),(2071,1,'admin','admin_url','','','商品订购设置','',1878,1,'/order-product',424,'{\"CN\":\"商品订购设置\",\"HK\":\"商品訂購設置\",\"US\":\"Product order setting\"}'),(2072,1,'admin','admin_url','','','文件分组','',420,1,'/service-support',525,'{\"CN\":\"文件分组\",\"HK\":\"文件分組\",\"US\":\"File Group\"}'),(2073,1,'admin','admin_url','','','第三方登录','',1910,1,'/third-login',576,'{\"CN\":\"第三方登录\",\"HK\":\"第三方登錄\",\"US\":\"Third Party Login\"}'),(2074,1,'admin','admin_url','','','二次验证','',1914,1,'/twice-confirm',664,'{\"CN\":\"二次验证\",\"HK\":\"二次驗證\",\"US\":\"Secondary Verification\"}'),(2075,1,'admin','admin_url','','','导航管理','',238,1,'/menu_manage',502,'{\"CN\":\"导航管理\",\"HK\":\"導航管理\",\"US\":\"Navigation Management\"}'),(2076,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postNewGeneral','','系统设置统一修改接口（新）','',1909,0,'',569,'{\"CN\":\"系统设置统一修改接口（新）\",\"HK\":\"系統設置統一修改接口（新）\",\"US\":\"System settings unified modification interface (new)\"}'),(2077,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postGetConfig','','系统设置统一获取接口（新）','',1909,0,'',570,'{\"CN\":\"系统设置统一获取接口（新）\",\"HK\":\"系統設置統一獲取接口（新）\",\"US\":\"System settings unified acquisition interface (new)\"}'),(2078,1,'admin','admin_url','app\\admin\\controller\\ConfigGeneralController::postGetConfigOption','','系统设置选项统一获取接口（新）','',1909,0,'',571,'{\"CN\":\"系统设置选项统一获取接口（新）\",\"HK\":\"系統設置選項統一獲取接口（新）\",\"US\":\"System setting options unified access interface (new)\"}'),(2082,1,'admin','admin_url','app\\admin\\controller\\MenusController::getMenu','','获取导航以及导航对应的菜单列表','',2075,0,'',503,'{\"CN\":\"获取导航以及导航对应的菜单列表\",\"HK\":\"獲取導航以及導航對應的菜單列表\",\"US\":\"Get the navigation and the menu list corresponding to the navigation\"}'),(2083,1,'admin','admin_url','app\\admin\\controller\\MenusController::getMenuList','','获取菜单列表table','',2075,0,'',504,'{\"CN\":\"获取菜单列表table\",\"HK\":\"獲取菜單列表table\",\"US\":\"Get the menu list table\"}'),(2084,1,'admin','admin_url','app\\admin\\controller\\MenusController::setNavList','','设置导航对应的菜单列表','',2075,0,'',505,'{\"CN\":\"设置导航对应的菜单列表\",\"HK\":\"設置導航對應的菜單列表\",\"US\":\"Set the menu list corresponding to the navigation\"}'),(2085,1,'admin','admin_url','app\\admin\\controller\\MenusController::addCustomPage','','添加产品中心页面','',2075,0,'',506,'{\"CN\":\"添加产品中心页面\",\"HK\":\"添加產品中心頁面\",\"US\":\"Add Product Center Page\"}'),(2086,1,'admin','admin_url','app\\admin\\controller\\MenusController::getProductList','','导航类型为产品管理时： 获取产品列表','',2075,0,'',507,'{\"CN\":\"导航类型为产品管理时： 获取产品列表\",\"HK\":\"導航類型為產品管理時： 獲取產品列表\",\"US\":\"When the navigation type is product management: Get product list\"}'),(2087,1,'admin','admin_url','app\\adminc\\ontroller\\MenusController::getMenuType','','获取导航以及导航对应的菜单列表','',2075,0,'',508,'{\"CN\":\"获取导航以及导航对应的菜单列表\",\"HK\":\"獲取導航以及導航對應的菜單列表\",\"US\":\"Get the navigation and the menu list corresponding to the navigation\"}'),(2088,1,'admin','admin_url','app\\admin\\controller\\MenusController::getMenu','','获取菜单项类型（会员中心菜单，头部菜单','',2075,0,'',509,'{\"CN\":\"获取菜单项类型（会员中心菜单，头部菜单\",\"HK\":\"獲取菜單項類型（會員中心菜單，頭部菜單\",\"US\":\"Get the menu item type (member center menu, header menu\"}'),(2089,1,'admin','admin_url','app\\admin\\controller\\MenusController::addMenu','','添加菜单项','',2075,0,'',510,'{\"CN\":\"添加菜单项\",\"HK\":\"添加菜單項\",\"US\":\"Add menu item\"}'),(2090,1,'admin','admin_url','app\\admin\\controller\\MenusController::editMenu','','修改菜单项','',2075,0,'',511,'{\"CN\":\"修改菜单项\",\"HK\":\"修改菜單項\",\"US\":\"Modify Menu Item\"}'),(2091,1,'admin','admin_url','app\\admin\\controller\\MenusController::delMenu','','删除菜单项','',2075,0,'',512,'{\"CN\":\"删除菜单项\",\"HK\":\"刪除菜單項\",\"US\":\"Delete menu item\"}'),(2092,1,'admin','admin_url','app\\admin\\controller\\MenusController::delTwoMenu','','删除菜单项(二次)','',2075,0,'',513,'{\"CN\":\"删除菜单项(二次)\",\"HK\":\"刪除菜單項(二次)\",\"US\":\"Delete menu item (secondary)\"}'),(2093,1,'admin','admin_url','app\\admin\\controller\\MenusController::getTypeAllMenu','','获取导航对应的菜单项列表','',2075,0,'',514,'{\"CN\":\"获取导航对应的菜单项列表\",\"HK\":\"獲取導航對應的菜單項列表\",\"US\":\"Get a list of menu items corresponding to navigation\"}'),(2094,1,'admin','admin_url','app\\admin\\controller\\MenusController::editMenuActive','','修改默认菜单','',2075,0,'',515,'{\"CN\":\"修改默认菜单\",\"HK\":\"修改默認菜單\",\"US\":\"Modify the default menu\"}'),(2095,1,'admin','admin_url','app\\admin\\controller\\MenusController::getSystemNav','','获取指定的页面','',2075,0,'',516,'{\"CN\":\"获取指定的页面\",\"HK\":\"獲取指定的頁面\",\"US\":\"Get the specified page\"}'),(2096,1,'admin','admin_url','app\\admin\\controller\\MenusController::getNavType','','获取页面类型','',2075,0,'',517,'{\"CN\":\"获取页面类型\",\"HK\":\"獲取頁麵類型\",\"US\":\"Get page type\"}'),(2097,1,'admin','admin_url','appadmincontrollerMenusController::getLang','','获取语言列表','',2075,0,'',518,'{\"CN\":\"获取语言列表\",\"HK\":\"獲取語言列表\",\"US\":\"Get Language List\"}'),(2098,1,'admin','admin_url','','','下游管理','',1899,1,'',757,'{\"CN\":\"下游管理\",\"HK\":\"下游管理\",\"US\":\"Downstream Management\"}'),(2099,1,'admin','admin_url','','','API设置','',2098,1,'/api-setup',759,'{\"CN\":\"API设置\",\"HK\":\"API設置\",\"US\":\"API Settings\"}'),(2100,1,'admin','admin_url','','','手动资源','',1899,0,'',755,'{\"CN\":\"手动资源\",\"HK\":\"手動資源\",\"US\":\"Manual Resources\"}'),(2101,1,'admin','admin_url','','','任务队列','',2098,1,'/task-queue',758,'{\"CN\":\"任务队列\",\"HK\":\"任務隊列\",\"US\":\"Task Queue\"}'),(2102,1,'admin','admin_url','','','系统状态','',1897,1,'/timing-results',706,'{\"CN\":\"系统状态\",\"HK\":\"系統狀態\",\"US\":\"System Status\"}'),(2103,1,'admin','admin_url','','','任务队列','',2102,1,'/statistics-taskQueue',701,'{\"CN\":\"任务队列\",\"HK\":\"任務隊列\",\"US\":\"Task Queue\"}'),(2104,1,'admin','admin_url','app\\admin\\controller\\Menuscontroller::getmenutype','','导航菜单类型','',2075,0,'',519,'{\"CN\":\"导航菜单类型\",\"HK\":\"導航菜單類型\",\"US\":\"Navigation Menu Type\"}'),(2105,1,'admin','admin_url','app\\admin\\controller\\Menuscontroller::getlang','','导航菜单语言','',2075,0,'',520,'{\"CN\":\"导航菜单语言\",\"HK\":\"導航菜單語言\",\"US\":\"Navigation Menu Language\"}'),(2106,1,'admin','admin_url','app\\admin\\controller\\InvoiceController::invoiceLog','','账单内页-账单日志','',404,0,'',236,'{\"CN\":\"账单内页-账单日志\",\"HK\":\"賬單內頁-賬單日誌\",\"US\":\"Bill Inner Page-Bill Log\"}'),(2107,1,'admin','admin_url','','','统计','',1897,1,'/annual-statistics',699,'{\"CN\":\"统计\",\"HK\":\"統計\",\"US\":\"Statistics\"}'),(2108,1,'admin','admin_url','','','定时任务状态','',2102,1,'/timing-results',700,'{\"CN\":\"定时任务状态\",\"HK\":\"定時任務狀態\",\"US\":\"Timed Task Status\"}'),(2109,1,'admin','admin_url','','','供应商管理','',2100,1,'/supplier-management',756,'{\"CN\":\"供应商管理\",\"HK\":\"供應商管理\",\"US\":\"Supplier Management\"}'),(2110,1,'admin','admin_url','','','上游资源','',1899,1,'',715,'{\"CN\":\"上游资源\",\"HK\":\"上游資源\",\"US\":\"Upstream Resources\"}'),(2111,1,'admin','admin_url','','','商品管理','',2110,1,'/commodity-list',717,'{\"CN\":\"商品管理\",\"HK\":\"商品管理\",\"US\":\"Commodity Management\"}'),(2112,1,'admin','admin_url','','','产品管理','',2110,1,'/commodity-product',719,'{\"CN\":\"产品管理\",\"HK\":\"產品管理\",\"US\":\"Product Management\"}'),(2113,1,'admin','admin_url','','','任务队列','',2110,1,'/commodity-taskQueue',721,'{\"CN\":\"任务队列\",\"HK\":\"任務隊列\",\"US\":\"Task Queue\"}'),(2114,1,'admin','admin_url','app\\admin\\controller\\UserTastesController::editUserTanstes','','偏好设置','',0,0,'',951,'{\"CN\":\"偏好设置\",\"HK\":\"偏好設置\",\"US\":\"Preferences\"}'),(2115,1,'admin','admin_url','app\\admin\\controller\\RunMapController::runCronList','','定时任务执行统计','',0,0,'',952,'{\"CN\":\"定时任务执行统计\",\"HK\":\"定時任務執行統計\",\"US\":\"Timed task execution statistics\"}'),(2116,1,'admin','admin_url','app\\admin\\controller\\RunMapController::runCronTrend','','定时任务执行,曲线趋势图','',0,0,'',953,'{\"CN\":\"定时任务执行,曲线趋势图\",\"HK\":\"定時任務執行,曲線趨勢圖\",\"US\":\"Timed task execution, curve trend chart\"}'),(2117,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::apiHost','','产品列表','',2112,0,'',720,'{\"CN\":\"产品列表\",\"HK\":\"產品列表\",\"US\":\"Product List\"}'),(2118,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::apiProducts','','商品列表','',2111,0,'',718,'{\"CN\":\"商品列表\",\"HK\":\"商品列表\",\"US\":\"Product List\"}'),(2119,1,'admin','admin_url','app\\admin\\controller\\ConfigServersController::groupsList','','接口组列表','',528,0,'',412,'{\"CN\":\"接口组列表\",\"HK\":\"接口組列表\",\"US\":\"Interface Group List\"}'),(2120,1,'admin','admin_url','app\\admin\\controller\\InvoiceController::renew','','续费订单列表','',17,0,'',143,'{\"CN\":\"续费订单列表\",\"HK\":\"續費訂單列表\",\"US\":\"Renewal Order List\"}'),(2121,1,'admin','admin_url','app\\admin\\controller\\ConfigCertifiController::setting','','实名认证设置','',542,0,'',42,'{\"CN\":\"实名认证设置\",\"HK\":\"實名認證設置\",\"US\":\"Real-name authentication settings\"}'),(2122,1,'admin','admin_url','app\\admin\\controller\\RunMapController::runMapList','','任务队列列表','',2113,0,'',722,'{\"CN\":\"任务队列列表\",\"HK\":\"任務隊列列表\",\"US\":\"Task Queue List\"}'),(2123,1,'admin','admin_url','app\\admin\\controller\\RbacController::copyRole','','权限复制','',588,0,'',2110,'{\"CN\":\"权限复制\",\"HK\":\"權限複製\",\"US\":\"Permission to copy\"}'),(2124,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::summary','','API概览','',1860,0,'',2110,'{\"CN\":\"API概览\",\"HK\":\"API概覽\",\"US\":\"API Overview\"}'),(2125,1,'admin','admin_url','app\\admin\\controller\\HostController::userInfo','','获取用户信息','',28,0,'',167,'{\"CN\":\"获取用户信息\",\"HK\":\"獲取用戶信息\",\"US\":\"Get User Information\"}'),(2126,1,'admin','admin_url','app\\admin\\controller\\UserManagecontroller::getCerifyHistoryLog','','实名认证日志历史记录列表','',542,0,'',2110,'{\"CN\":\"实名认证日志历史记录列表\",\"HK\":\"實名認證日誌歷史記錄列表\",\"US\":\"Real-name authentication log history list\"}'),(2127,1,'admin','admin_url','','','订单列表','',2110,1,'/supplier-order-list',2110,'{\"CN\":\"订单列表\",\"HK\":\"訂單列表\",\"US\":\"Order List\"}'),(2128,1,'admin','admin_url','app\\admin\\controller\\UserManageController::hostBindSale','','绑定销售','',1882,0,'',2110,'{\"CN\":\"绑定销售\",\"HK\":\"綁定銷售\",\"US\":\"Binding Sales\"}'),(2129,1,'admin','admin_url','','','信用额管理','',1868,1,'/credit-management',2110,'{\"CN\":\"信用额管理\",\"HK\":\"信用額管理\",\"US\":\"Credit Management\"}'),(2130,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::clientList','','信用额客户列表','',2129,0,'',2110,'{\"CN\":\"信用额客户列表\",\"HK\":\"信用額客戶列表\",\"US\":\"List of Credit Customers\"}'),(2131,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::getConfig','','信用额设置页面','',2129,0,'',2110,'{\"CN\":\"信用额设置页面\",\"HK\":\"信用額設置頁面\",\"US\":\"Credit Limit Setting Page\"}'),(2132,1,'admin','admin_url','app\\admin\\controller\\CreditLimitController::postConfig','','信用额设置页面提交','',2129,0,'',2110,'{\"CN\":\"信用额设置页面提交\",\"HK\":\"信用額設置頁面提交\",\"US\":\"Submission of credit limit setting page\"}'),(2133,1,'admin','admin_url','app\\admin\\controller\\UploadController::uploadCertificate','','后台实名上传','',1860,0,'',47,'{\"CN\":\"后台实名上传\",\"HK\":\"後臺實名上傳\",\"US\":\"Background real name upload\"}'),(2134,1,'admin','admin_url','app\\admin\\controller\\UploadController::uploadAuthor','','授权书上传','',1860,0,'',48,'{\"CN\":\"授权书上传\",\"HK\":\"後臺實名上傳\",\"US\":\"Background real name upload\"}'),(2135,1,'admin','admin_url','app\\admin\\controller\\ConfigCertifiController::authorDown','','授权书下载','',1860,0,'',49,'{\"CN\":\"授权书下载\",\"HK\":\"授權書下載\",\"US\":\"Power of attorney Download\"}'),(2136,1,'admin','admin_url','app\\admin\\controller\\ConfigCertifiController::authorDel','','授权书删除','',1860,0,'',50,'{\"CN\":\"授权书删除\",\"HK\":\"授權書删除\",\"US\":\"Deletion of power of attorney\"}'),(2137,1,'admin','admin_url','app\\admin\\controller\\UserManageController::authorSubmit','','后台实名提交','',1860,0,'',51,'{\"CN\":\"后台实名提交\",\"HK\":\"後臺實名提交\",\"US\":\"Background real name submission\"}'),(2138,1,'admin','admin_url','app\\admin\\controller\\UserManageController::authorInfo','','后台实名信息','',1860,0,'',52,'{\"CN\":\"后台实名信息\",\"HK\":\"後臺實名資訊\",\"US\":\"Background real name information\"}'),(2139,1,'admin','admin_url','app\\admin\\controller\\UserManageController::getCerifyHistoryLog','','后台实名历史记录','',1860,0,'',53,'{\"CN\":\"后台实名历史记录\",\"HK\":\"後臺實名歷史記錄\",\"US\":\"Background real name history\"}'),(2140,1,'admin','admin_url','app\\admin\\controller\\HostController::userInfo','','获取用户信息','',28,0,'',191,'{\"CN\":\"获取用户信息\",\"HK\":\"獲取用戶資訊\",\"US\":\"Get user information\"}'),(2143,1,'admin','admin_url','','','信用额设置','',1902,1,'/credit-setting',305,'{\"CN\":\"信用额设置\",\"HK\":\"信用額設定\",\"US\":\"Credit limit setting\"}'),(2144,1,'admin','admin_url','app\\admin\\controller\\ConfigMessageController::getTemplateDesc','','创建模板页面可用参数','',533,0,'',2110,'{\"CN\":\"创建模板页面可用参数\",\"HK\":\"創建範本頁面可用參數\",\"US\":\"Create template page available parameters\"}'),(2145,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::addPage','','产品添加页面','',2111,0,'',2110,'{\"CN\":\"产品添加页面\",\"HK\":\"產品添加頁面\",\"US\":\"Product add page\"}'),(2146,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::upstreamHost','','批量拉取产品信息的前台会员中心接口','',2112,0,'',2110,'{\"CN\":\"批量拉取产品信息的前台会员中心接口\",\"HK\":\"批量拉取產品資訊的前臺會員中心介面\",\"US\":\"Front desk member center interface for batch'),(2147,1,'admin','admin_url','','','合同列表','',1900,1,'/contracts_audit',249,'{\"CN\":\"合同列表\",\"HK\":\"合同列表\",\"US\":\"contracts List\"}'),(2148,1,'admin','admin_url','','','合同设置','',1902,1,'/contracts_setting',283,'{\"CN\":\"合同设置\",\"HK\":\"合同設置\",\"US\":\"contracts Settings\"}'),(2149,1,'admin','admin_url','','','友情链接','',238,1,'/friendly_link',503,'{\"CN\":\"友情链接\",\"HK\":\"友情鏈接\",\"US\":\"Friendly Link\"}'),(2150,1,'admin','admin_url','app\\admin\\controller\\MenusController::getDefaultSenior','','根据第一个产品获取高级设置','',2075,0,'',507,'{\"CN\":\"根据第一个产品获取高级设置\",\"HK\":\"根據第一個產品獲取高級設定\",\"US\":\"Get advanced settings based on the first product\"}'),(2151,1,'admin','admin_url','app\\admin\\controller\\MenusController::setWebNavList','','设置web导航对应的菜单列表','',2075,0,'',507,'{\"CN\":\"设置web导航对应的菜单列表\",\"HK\":\"設定web導航對應的選單清單\",\"US\":\"Set the menu list corresponding to web navigation\"}'),(2152,1,'admin','admin_url','app\\admin\\controller\\MenusController::createWebPage','','创建web页面','',2075,0,'',507,'{\"CN\":\"创建web页面\",\"HK\":\"創建web頁面\",\"US\":\"Create a web page\"}'),(2153,1,'admin','admin_url','app\\admin\\controller\\MenusController::getCreateWebData','','获取创建web导航所需数据','',2075,0,'',507,'{\"CN\":\"获取创建web导航所需数据\",\"HK\":\"獲取創建web導航所需數據\",\"US\":\"Get the data needed to create web navigation\"}'),(2154,1,'admin','admin_url','app\\admin\\controller\\MenusController::getOtherMenu','','获取除菜单id之外的菜单','',2075,0,'',507,'{\"CN\":\"获取除菜单id之外的菜单\",\"HK\":\"獲取除選單id之外的選單\",\"US\":\"Gets a menu other than the menu ID\"}'),(2155,1,'admin','admin_url','app\\admin\\controller\\ZjmfFinanceApiController::upstreamCredit','','获取余额','',0,0,'',2110,'{\"CN\":\"获取余额\",\"HK\":\"獲取餘額\",\"US\":\"get balance\"}'),(2156,1,'admin','admin_url','app\\admin\\controller\\SystemController::getSystemAuthRuleLanguage','','路由菜单','',0,0,NULL,1,'{\"CN\":\"路由菜单\",\"HK\":\"路由菜單\",\"US\":\"Routing menu\"}'),(2157,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::adminGetLinkAgeList','','产品内页层级联动','',28,0,'',2110,''),(2158,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::getNextLinkAgeList','','可配置项层级联动下级列表','',228,0,'',2110,''),(2159,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::saveConfigOptionInfo','','可配置项层级联动项信息保存','',228,0,'',2110,''),(2160,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::saveLinkAgeLevel','','可配置项层级联动保存','',228,0,'',2110,''),(2161,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::saveLinkAgeOrder','','可配置项层级联动排序','',228,0,'',2110,''),(2162,1,'admin','admin_url','app\\admin\\controller\\ConfigOptionsController::delLinkAgeSub','','可配置项层级联动删除','',228,0,'',2110,''),(2173,1,'admin','admin_url','app\\admin\\controller\\ContractController::contract','','合同列表','',922,0,'',1,'{\"CN\":\"合同列表\",\"HK\":\"契约清單\",\"US\":\"Contract list\"}'),(2174,1,'admin','admin_url','app\\admin\\controller\\Contractcontroller::setting','','合同模块基础设置','',922,0,'',1,'{\"CN\":\"合同模块基础设置\",\"HK\":\"契约模塊基礎設定\",\"US\":\"Basic settings of contract module\"}'),(2175,1,'admin','admin_url','app\\admin\\controller\\Contractcontroller::download','','合同查看下载','',922,0,'',1,'{\"CN\":\"合同查看下载\",\"HK\":\"契约查看下載\",\"US\":\"Contract view and download\"}'),(2176,1,'admin','admin_url','app\\admin\\controller\\ContractController::tpl','','合同模板列表','',922,0,'',1,'{\"CN\":\"合同模板列表\",\"HK\":\"契约範本清單\",\"US\":\"List of contract templates\"}'),(2177,1,'admin','admin_url','app\\admin\\controller\\ContractController::detail','','添加/编辑合同页面','',922,0,'',1,'{\"CN\":\"添加/编辑合同页面\",\"HK\":\"添加/編輯契约頁面\",\"US\":\"Add / edit contract page\"}'),(2178,1,'admin','admin_url','app\\admin\\controller\\ContractController::detailPost','','创建编辑合同页面提交','',922,0,'',1,'{\"CN\":\"创建编辑合同页面提交\",\"HK\":\"創建編輯契约頁面提交\",\"US\":\"Create  edit contract page submission\"}'),(2179,1,'admin','admin_url','app\\admin\\controller\\ContractController::settingPost','','合同模块基础设置提交','',922,0,'',1,'{\"CN\":\"合同模块基础设置提交\",\"HK\":\"契约模塊基礎設定提交\",\"US\":\"Contract module basic settings submission\"}'),(2180,1,'admin','admin_url','app\\admin\\controller\\ContractController::contractPage','','签订合同页面','',922,0,'',1,'{\"CN\":\"签订合同页面\",\"HK\":\"簽訂合同頁面\",\"US\":\"Contract signing page\"}'),(2181,1,'admin','admin_url','app\\admin\\controller\\ContractController::contractPagePost','','签订合同(生成PDF文档)','',922,0,'',1,'{\"CN\":\"签订合同(生成PDF文档)\",\"HK\":\"簽訂合同（生成PDF檔案）\",\"US\":\"Contract signing (PDF document generation)\"}'),(2182,1,'admin','admin_url','app\\admin\\controller\\ContractController::cancel','','合同作废','',922,0,'',1,'{\"CN\":\"合同作废\",\"HK\":\"契约作廢\",\"US\":\"Cancellation of contract\"}'),(2183,1,'admin','admin_url','app\\admin\\controller\\ContractController::deleteTpl','','删除合同模板','',922,0,'',1,'{\"CN\":\"删除合同模板\",\"HK\":\"删除契约範本\",\"US\":\"Delete contract template\"}'),(2184,1,'admin','admin_url','app\\admin\\controller\\ContractController::cancelPost','','取消邮寄','',922,0,'',1,'{\"CN\":\"取消邮寄\",\"HK\":\"取消郵寄\",\"US\":\"Cancel mailing\"}'),(2185,1,'admin','admin_url','app\\admin\\controller\\ContractController::check','','审核通过','',922,0,'',1,'{\"CN\":\"审核通过\",\"HK\":\"稽核通過\",\"US\":\"Approved\"}'),(2186,1,'admin','admin_url','app\\admin\\controller\\ContractController::delete','','删除合同','',922,0,'',1,'{\"CN\":\"删除合同\",\"HK\":\"删除契约\",\"US\":\"Delete contract\"}'),(2187,1,'admin','admin_url','app\\admin\\controller\\ContractController::contractPost','','合同邮寄管理','',922,0,'',1,'{\"CN\":\"合同邮寄管理\",\"HK\":\"契约郵寄管理\",\"US\":\"Contract mailing management\"}'),(2188,1,'admin','admin_url','app\\admin\\controller\\SystemController::getAuthorize','','更换授权码','',0,0,'',1,'{\"CN\":\"更换授权码\",\"HK\":\"更換授權碼\",\"US\":\"Replace authorization code\"}'),(2189,1,'admin','admin_url','app\\admin\\controller\\MenusController::allLinks','','友情连接列表','',2149,0,'',1,'{\"CN\":\"友情连接列表\",\"HK\":\"友情連接清單\",\"US\":\"Friendship connection list\"}'),(2190,1,'admin','admin_url','app\\admin\\controller\\MenusController::saveLinks','','友情连接保存','',2149,0,'',1,'{\"CN\":\"友情连接保存\",\"HK\":\"友情連接保存\",\"US\":\"Friendship connection preservation\"}'),(2191,1,'admin','admin_url','app\\admin\\controller\\MenusController::deleteLinks','','友情连接删除','',2149,0,'',1,'{\"CN\":\"友情连接删除\",\"HK\":\"友情連接删除\",\"US\":\"Friendship connection deletion\"}'),(2200,1,'admin','admin_url','','','续费订单','',2110,1,'/supplier-renewal-order',2110,'{\"CN\":\"续费订单\",\"HK\":\"續費訂單\",\"US\":\"Renewal order\"}'),(2201,1,'admin','admin_url','app\\admin\\controller\\ClientsServicesController::suspend','','暂停','',1397,0,'',156,'{\"CN\":\"暂停\",\"HK\":\"暫停\",\"US\":\"Pause\"}'),(2202,1,'admin','admin_url','app\\admin\\controller\\InvoiceController::applycreditlimit','','向账单使用信用额','',1342,0,'',230,'{\"CN\":\"向账单使用信用额\",\"HK\":\"向帳單使用信用額\",\"US\":\"Credit amount used for statement\"}');
/*!40000 ALTER TABLE `shd_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_base_info`
--

DROP TABLE IF EXISTS `shd_base_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_base_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '模块名称，英文字符',
  `desc` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '模块描述信息',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序值，越小越在前面',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间戳，未删除0',
  `enable` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否启用，0-否，1-是',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COMMENT='首页基本信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_base_info`
--

LOCK TABLES `shd_base_info` WRITE;
/*!40000 ALTER TABLE `shd_base_info` DISABLE KEYS */;
INSERT INTO `shd_base_info` VALUES (1,'income','收入概览',2,0,1),(2,'order','订单概览',0,0,1),(3,'todo','待办事项',1,0,1),(4,'trade','交易统计',3,0,1),(5,'client','客户概况',8,0,1),(6,'expiring','即将过期',6,0,1),(7,'sales_ranking','销量排行',7,0,1),(8,'system_log','系统日志',4,0,1),(9,'online_admin','在线管理员',5,0,1),(10,'staff_sales_ranking','员工销量排行',9,0,1),(11,'waiting_ticket','待处理工单',10,0,1);
/*!40000 ALTER TABLE `shd_base_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_blacklist`
--

DROP TABLE IF EXISTS `shd_blacklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_blacklist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ip` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'ip地址转为int',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '原因类型1=后台登录',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='黑名单';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_blacklist`
--

LOCK TABLES `shd_blacklist` WRITE;
/*!40000 ALTER TABLE `shd_blacklist` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_blacklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_cancel_reason`
--

DROP TABLE IF EXISTS `shd_cancel_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_cancel_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '原因',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_cancel_reason`
--

LOCK TABLES `shd_cancel_reason` WRITE;
/*!40000 ALTER TABLE `shd_cancel_reason` DISABLE KEYS */;
INSERT INTO `shd_cancel_reason` VALUES (1,'产品稳定性不足'),(2,'业务减少不需要');
/*!40000 ALTER TABLE `shd_cancel_reason` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_cancel_requests`
--

DROP TABLE IF EXISTS `shd_cancel_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_cancel_requests` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `relid` int(10) NOT NULL DEFAULT '0' COMMENT '主机id',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT 'submit提交,adopt通过',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT '取消原因',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `delete_time` int(11) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '执行状态:0未执行,1成功,2失败',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `relid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_cancel_requests`
--

LOCK TABLES `shd_cancel_requests` WRITE;
/*!40000 ALTER TABLE `shd_cancel_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_cancel_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_cart_session`
--

DROP TABLE IF EXISTS `shd_cart_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_cart_session` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) DEFAULT NULL,
  `sessionid` varchar(255) DEFAULT NULL,
  `cart_data` text,
  `status` varchar(10) DEFAULT NULL,
  `create_time` int(10) DEFAULT NULL,
  `expire_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`(100)),
  KEY `sessionid` (`sessionid`(100))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_cart_session`
--

LOCK TABLES `shd_cart_session` WRITE;
/*!40000 ALTER TABLE `shd_cart_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_cart_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_certifi_company`
--

DROP TABLE IF EXISTS `shd_certifi_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_certifi_company` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_user_id` int(11) NOT NULL DEFAULT '0' COMMENT '认证用户uid',
  `auth_real_name` varchar(30) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `auth_card_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '卡类型',
  `auth_card_number` varchar(30) NOT NULL DEFAULT '' COMMENT '卡号',
  `company_name` varchar(30) NOT NULL DEFAULT '' COMMENT '公司名称',
  `company_organ_code` varchar(30) NOT NULL DEFAULT '' COMMENT '公司代码',
  `img_one` varchar(255) NOT NULL DEFAULT '',
  `img_two` varchar(255) NOT NULL DEFAULT '',
  `img_three` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已认证，2未通过，3待审核，4已提交资料',
  `certify_id` varchar(50) NOT NULL DEFAULT '',
  `auth_fail` varchar(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `bank` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机',
  `custom_fields1` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段1-10',
  `custom_fields2` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields3` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields4` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields5` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields6` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields7` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields8` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields9` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields10` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `img_four` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`auth_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='公司认证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_certifi_company`
--

LOCK TABLES `shd_certifi_company` WRITE;
/*!40000 ALTER TABLE `shd_certifi_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_certifi_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_certifi_log`
--

DROP TABLE IF EXISTS `shd_certifi_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_certifi_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0',
  `certifi_name` varchar(50) NOT NULL DEFAULT '' COMMENT '认证名称',
  `company_name` varchar(255) DEFAULT '' COMMENT '公司名称',
  `card_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '卡类型1=大陆0=非大陆',
  `idcard` varchar(80) DEFAULT '' COMMENT '身份证号',
  `company_organ_code` varchar(150) DEFAULT '' COMMENT '执照号',
  `error` varchar(255) DEFAULT '' COMMENT '失败原因',
  `pic` text COMMENT '图片集合用逗号分割',
  `create_time` int(11) DEFAULT NULL COMMENT '提交时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态1=未通过2=通过',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '认证类型1=个人2=企业3=个人转企业',
  `bank` varchar(255) NOT NULL DEFAULT '' COMMENT '银行卡',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机',
  `certifi_type` varchar(255) NOT NULL DEFAULT '',
  `custom_fields_log` varchar(255) DEFAULT '' COMMENT '自定义字段json',
  `notes` varchar(5000) NOT NULL DEFAULT '' COMMENT '其他信息',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='实名认证记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_certifi_log`
--

LOCK TABLES `shd_certifi_log` WRITE;
/*!40000 ALTER TABLE `shd_certifi_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_certifi_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_certifi_person`
--

DROP TABLE IF EXISTS `shd_certifi_person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_certifi_person` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_user_id` int(11) NOT NULL DEFAULT '0',
  `auth_real_name` varchar(30) NOT NULL DEFAULT '' COMMENT '认证真实姓名',
  `auth_card_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '认证卡号类型1大陆(默认)；0其他地区',
  `auth_card_number` varchar(50) NOT NULL DEFAULT '' COMMENT '认证卡号',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1已认证，2未通过，3待审核，4已提交资料',
  `img_one` varchar(255) NOT NULL DEFAULT '',
  `img_two` varchar(255) NOT NULL DEFAULT '',
  `img_three` varchar(255) NOT NULL DEFAULT '',
  `certify_id` varchar(32) NOT NULL DEFAULT '' COMMENT '认证证书',
  `auth_fail` varchar(255) NOT NULL DEFAULT '' COMMENT '失败原因',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机',
  `bank` varchar(255) DEFAULT NULL COMMENT '银行卡号',
  `custom_fields1` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段1-10',
  `custom_fields2` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields3` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields4` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields5` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields6` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields7` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields8` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields9` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  `custom_fields10` varchar(200) NOT NULL DEFAULT '' COMMENT '自定义字段',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`auth_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='个人认证';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_certifi_person`
--

LOCK TABLES `shd_certifi_person` WRITE;
/*!40000 ALTER TABLE `shd_certifi_person` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_certifi_person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_certifi_result`
--

DROP TABLE IF EXISTS `shd_certifi_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_certifi_result` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `auth_user_id` int(11) NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL DEFAULT '',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_certifi_result`
--

LOCK TABLES `shd_certifi_result` WRITE;
/*!40000 ALTER TABLE `shd_certifi_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_certifi_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_certification`
--

DROP TABLE IF EXISTS `shd_certification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_certification` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `idcard` varchar(50) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '姓名',
  `id_image_address` varchar(500) NOT NULL DEFAULT '' COMMENT '身份证图片地址',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '认证类型：1个人，0企业',
  `companyname` varchar(50) NOT NULL DEFAULT '' COMMENT '公司名称',
  `businesslicense` varchar(500) NOT NULL DEFAULT '' COMMENT '公司营业执照',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '客户认证状态：0未认证，1已认证，2未通过，3，待审核',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `client_id` (`client_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_certification`
--

LOCK TABLES `shd_certification` WRITE;
/*!40000 ALTER TABLE `shd_certification` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_certification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_client_care`
--

DROP TABLE IF EXISTS `shd_client_care`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_client_care` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '关怀名称',
  `trigger` varchar(100) NOT NULL COMMENT '触发条件；product_after_order:产品订购后XX天，选择产品或者产品组;product_before_order_due:产品到期前XX天，选择产品或者产品组;register_no_order:注册用户但未下单XX天;register_order_no_pay:注册用户下单未支付XX天;register_surpass:注册用户超过XX天未登录',
  `time` int(11) NOT NULL COMMENT '天数',
  `method` varchar(100) NOT NULL COMMENT '关怀方式(邮件email、短信message、微信wechat(暂不考虑))',
  `email_template_id` int(11) NOT NULL COMMENT '邮件通知模板ID',
  `message_template_id` int(11) NOT NULL COMMENT '短信通知模板ID',
  `wechat_template_id` int(11) NOT NULL COMMENT '微信通知模板ID',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1可用，0不可用',
  `range_type` tinyint(1) NOT NULL COMMENT '1大陆，0非大陆',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_client_care`
--

LOCK TABLES `shd_client_care` WRITE;
/*!40000 ALTER TABLE `shd_client_care` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_client_care` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_client_care_product_links`
--

DROP TABLE IF EXISTS `shd_client_care_product_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_client_care_product_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `care_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_client_care_product_links`
--

LOCK TABLES `shd_client_care_product_links` WRITE;
/*!40000 ALTER TABLE `shd_client_care_product_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_client_care_product_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_client_care_trigger`
--

DROP TABLE IF EXISTS `shd_client_care_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_client_care_trigger` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `toggle_condition` varchar(100) NOT NULL,
  `type` varchar(50) NOT NULL,
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_client_care_trigger`
--

LOCK TABLES `shd_client_care_trigger` WRITE;
/*!40000 ALTER TABLE `shd_client_care_trigger` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_client_care_trigger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_client_groups`
--

DROP TABLE IF EXISTS `shd_client_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_client_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_name` varchar(45) NOT NULL DEFAULT '',
  `group_colour` varchar(45) DEFAULT NULL COMMENT '组颜色',
  `discount_percent` int(10) DEFAULT '0' COMMENT '折扣百分比',
  `susptermexempt` tinyint(1) DEFAULT NULL COMMENT '暂停/删除豁免权(1是0否)',
  `separateinvoices` tinyint(1) DEFAULT NULL COMMENT '拆分服务账单',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_client_groups`
--

LOCK TABLES `shd_client_groups` WRITE;
/*!40000 ALTER TABLE `shd_client_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_client_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_clients`
--

DROP TABLE IF EXISTS `shd_clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uuid` varchar(100) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '客户名',
  `usertype` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户类型：1普通用户，2会员',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未知，1男，2女',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '客户头像',
  `profession` varchar(50) NOT NULL DEFAULT '' COMMENT '职业',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `companyname` varchar(80) NOT NULL DEFAULT '' COMMENT '所在公司',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮件',
  `wechat_id` int(10) DEFAULT NULL COMMENT '微信id',
  `qq` varchar(50) NOT NULL DEFAULT '' COMMENT 'qq',
  `country` varchar(100) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(100) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '城市',
  `region` varchar(100) NOT NULL DEFAULT '' COMMENT '区',
  `address1` varchar(100) NOT NULL DEFAULT '' COMMENT '具体地址1',
  `postcode` varchar(100) NOT NULL DEFAULT '' COMMENT '邮编',
  `phone_code` int(11) NOT NULL DEFAULT '44' COMMENT '国际电话区号  默认44中国为+86',
  `phonenumber` varchar(100) NOT NULL DEFAULT '' COMMENT '电话',
  `tax_id` varchar(100) NOT NULL DEFAULT '' COMMENT '税号ID',
  `password` varchar(200) NOT NULL DEFAULT '' COMMENT '密码',
  `authmodule` varchar(200) NOT NULL DEFAULT '' COMMENT '授权模块',
  `authdata` varchar(200) NOT NULL DEFAULT '' COMMENT '授权数据',
  `currency` int(10) NOT NULL DEFAULT '0' COMMENT '使用货币ID',
  `defaultgateway` varchar(200) NOT NULL DEFAULT '' COMMENT '选择默认支付接口',
  `credit` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `taxexempt` tinyint(1) NOT NULL DEFAULT '0' COMMENT '免税（1：是:0：否）',
  `latefeeoveride` tinyint(1) NOT NULL DEFAULT '0' COMMENT '滞纳金覆盖（1：是；0：否）',
  `overideduenotices` tinyint(1) NOT NULL DEFAULT '0' COMMENT '覆盖过期notices（是，否）',
  `separateinvoices` tinyint(1) NOT NULL DEFAULT '0' COMMENT '单独发票（1：是；0：否）',
  `disableautocc` tinyint(1) NOT NULL DEFAULT '0' COMMENT '禁用自动CC处理（是，否）',
  `notes` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `billingcid` int(10) NOT NULL DEFAULT '0' COMMENT '付款联系人（子账户）ID',
  `securityqid` int(10) NOT NULL DEFAULT '0',
  `securityqans` varchar(100) NOT NULL DEFAULT '',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '用户组ID',
  `cardtype` varchar(765) NOT NULL DEFAULT '',
  `cardlastfour` char(4) NOT NULL DEFAULT '' COMMENT '信用卡后四位',
  `cardnum` blob COMMENT '信用卡号',
  `startdate` blob,
  `expdate` blob,
  `issuenumber` blob,
  `bankname` varchar(100) NOT NULL DEFAULT '',
  `banktype` varchar(100) NOT NULL DEFAULT '',
  `bankcode` blob,
  `bankacct` blob,
  `gatewayid` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `lastloginip` varchar(50) NOT NULL DEFAULT '' COMMENT '最后登录IP',
  `ip` varchar(50) NOT NULL DEFAULT '' COMMENT 'IP地址',
  `host` varchar(50) NOT NULL DEFAULT '' COMMENT '主机',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（1激活，0未激活，2关闭）',
  `language` varchar(100) NOT NULL DEFAULT '' COMMENT '语言',
  `pwresetkey` varchar(100) NOT NULL DEFAULT '' COMMENT '密码重置key',
  `emailoptout` int(11) NOT NULL DEFAULT '0',
  `marketing_emails_opt_in` tinyint(1) NOT NULL DEFAULT '0' COMMENT '发送客户营销邮件（1：是；0：否）',
  `overrideautoclose` int(11) NOT NULL DEFAULT '0' COMMENT '覆盖自动状态更新（1：是；0：否）',
  `allow_sso` tinyint(4) NOT NULL DEFAULT '0',
  `email_verified` tinyint(4) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000' COMMENT '更新时间',
  `pwresetexpiry` int(11) NOT NULL DEFAULT '0' COMMENT '密码重置过期时间',
  `know_us` varchar(255) DEFAULT NULL COMMENT '了解途径',
  `initiative_renew` tinyint(1) NOT NULL DEFAULT '0' COMMENT '余额自动续费(1自动,0手动)',
  `is_login_sms_reminder` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启登录短信提醒 0=默认，不开启  1= 开启',
  `sale_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销售id，后台销售表销售id',
  `activation` tinyint(2) NOT NULL DEFAULT '0' COMMENT '激活',
  `api_password` varchar(50) NOT NULL DEFAULT '' COMMENT '魔方财务api密码',
  `second_verify` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启二次验证:0默认不开启,1开启',
  `track_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '销售跟踪状态:1待开始，2跟进中，3已完成',
  `email_remind` tinyint(1) NOT NULL DEFAULT '1' COMMENT '邮箱提醒',
  `is_open_credit_limit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:开启信用额',
  `credit_limit` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '信用额',
  `credit_limit_balance` decimal(12,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '信用额余额',
  `repayment_date` int(11) NOT NULL DEFAULT '0' COMMENT '还款日',
  `bill_generation_date` int(11) NOT NULL DEFAULT '0' COMMENT '账单生成日',
  `bill_repayment_period` int(11) NOT NULL DEFAULT '0' COMMENT '账单还款期限',
  `credit_limit_create_time` int(11) NOT NULL DEFAULT '0' COMMENT '信用额启用时间',
  `api_open` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否开启API',
  `api_create_time` int(11) NOT NULL DEFAULT '0' COMMENT 'api开通时间',
  `lock_reason` text COMMENT 'api锁定原因',
  `api_lock_time` int(11) NOT NULL DEFAULT '0' COMMENT 'api锁定时间',
  `send_close` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关闭发送邮件短信:0否默认，1是',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `wechat_id` (`wechat_id`) USING BTREE,
  KEY `sale_id` (`sale_id`),
  KEY `phonenumber` (`phonenumber`),
  KEY `currency` (`currency`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_clients`
--

LOCK TABLES `shd_clients` WRITE;
/*!40000 ALTER TABLE `shd_clients` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_clients_level_rule`
--

DROP TABLE IF EXISTS `shd_clients_level_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_clients_level_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `level_name` varchar(50) NOT NULL DEFAULT '' COMMENT '客户等级名称',
  `expense` varchar(50) NOT NULL DEFAULT '' COMMENT '支出',
  `buy_num` varchar(50) NOT NULL DEFAULT '' COMMENT '购买商品数量',
  `login_times` varchar(50) NOT NULL DEFAULT '' COMMENT '累计登陆次数',
  `last_login_times` varchar(100) NOT NULL DEFAULT '' COMMENT '最近x天登陆次数',
  `renew_times` varchar(50) NOT NULL DEFAULT '' COMMENT '续费次数',
  `last_renew_times` varchar(100) NOT NULL DEFAULT '' COMMENT '最近x天续费次数',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_clients_level_rule`
--

LOCK TABLES `shd_clients_level_rule` WRITE;
/*!40000 ALTER TABLE `shd_clients_level_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_clients_level_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_clients_oauth`
--

DROP TABLE IF EXISTS `shd_clients_oauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_clients_oauth` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL COMMENT '类型',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `openid` varchar(64) NOT NULL COMMENT '三方登录的id',
  `oauth` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `openid` (`openid`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_clients_oauth`
--

LOCK TABLES `shd_clients_oauth` WRITE;
/*!40000 ALTER TABLE `shd_clients_oauth` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_clients_oauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_clients_track_record`
--

DROP TABLE IF EXISTS `shd_clients_track_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_clients_track_record` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '客户跟踪记录表',
  `uid` int(11) NOT NULL COMMENT '客户ID',
  `des` text COMMENT '记录',
  `create_time` int(11) NOT NULL COMMENT '创建时间',
  `update_time` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_clients_track_record`
--

LOCK TABLES `shd_clients_track_record` WRITE;
/*!40000 ALTER TABLE `shd_clients_track_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_clients_track_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_clients_track_remark`
--

DROP TABLE IF EXISTS `shd_clients_track_remark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_clients_track_remark` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '补充说明ID',
  `track_id` int(11) NOT NULL COMMENT '记录ID',
  `remark` text COMMENT '补充说明',
  `create_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_clients_track_remark`
--

LOCK TABLES `shd_clients_track_remark` WRITE;
/*!40000 ALTER TABLE `shd_clients_track_remark` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_clients_track_remark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_configuration`
--

DROP TABLE IF EXISTS `shd_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_configuration` (
  `setting` text NOT NULL,
  `value` text NOT NULL,
  `create_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  KEY `setting` (`setting`(32)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_configuration`
--

LOCK TABLES `shd_configuration` WRITE;
/*!40000 ALTER TABLE `shd_configuration` DISABLE KEYS */;
INSERT INTO `shd_configuration` VALUES ('certifi_alipay_biz_code','SMART_FACE',NULL,1590060490),('certifi_app_id','Your Ali App ID',NULL,1590060490),('certifi_merchant_private_key','Your Ali Private key',NULL,1590060490),('certifi_alipay_public_key','Your Ali public key',NULL,1590060490),('certifi_is_stop','0',NULL,1590060490),('certifi_type','ali',NULL,1590060490),('certifi_is_upload','2',NULL,1590060490),('certifi_stop_day','0',NULL,1590060490),('certifi_appcode','Your Applied App Code',NULL,1590060490),('certifi_open','0',NULL,1590060490),('certifi_realname','1',NULL,1590060490),('certifi_three_type','two',NULL,1590060490),('certifi_select','artificial',NULL,1590060490),('nologin_send_ticket','1',NULL,1589886352),('evaluate_ticket','1',NULL,1589886352),('ticket_reply_order','1',NULL,1589886352),('AffiliateEnabled','1',NULL,NULL),('AffiliateEarningPercent','1',NULL,NULL),('AffiliateBonusDeposit','1',NULL,NULL),('AffiliatePayout','1',NULL,NULL),('AffiliateLinks','1',NULL,NULL),('email_host','smtp.163.com',NULL,1589271718),('email_port','25',NULL,1589271718),('email_username','company@email.com',NULL,1589271718),('email_password','password',NULL,1589271718),('email_smtpsecure','0',NULL,1589271718),('email_fromname','CompanyName',NULL,1589271718),('email_systememail','company@email.com',NULL,1589271718),('email_subject','1',NULL,1589271718),('email_body','1',NULL,1589271718),('email_charset','utf-8',NULL,1589271718),('email_type','1',NULL,1589271718),('aliyun_mobile_accesskeyid','Your Ali Key ID',1575464944,1588763335),('aliyun_mobile_accesskeysecret','Your Ali AccessKey Secret',1575464944,1588763335),('aliyun_mobile_signature','Your Ali Sign',1575464944,1588763335),('cron_day_start_time','1',NULL,1589161886),('cron_host_suspend','1',NULL,1587105958),('submail_app_id','Your Submail APP ID',1575629876,1586847043),('submail_app_key','Your Submail AccessKey Secret',1575629876,1586847043),('submail_sign_name','Your Submail SignName',1575629876,1586847043),('submail_international_app_id','1',1575630012,1586845336),('submail_international_app_key','1',1575630013,1586845336),('submail_international_sign_name','1',1575630013,1586845336),('NumRecordstoDisplay','1',NULL,NULL),('sms_operator','',NULL,1588763335),('sms_app_id','1',NULL,NULL),('sms_app_key','1',NULL,NULL),('sms_sign_name','1',NULL,NULL),('recharge_title','1',NULL,NULL),('company_pdf_logo','1',1576485863,1576485870),('company_signet','1',1576485863,1576485870),('company_name','HFCloud',NULL,1758904441),('company_email','company@email.com',NULL,1590049261),('domain','https://cloud.hfz.pw',1577416996,1758904441),('logo_url','/upload/logo.png',1577416996,1590049261),('invoice_payto','1',1577416996,1590049261),('system_url','http://system.website.address.com',1577416996,1590049261),('server_clause_url','http://server.clause.com',1577416996,1590049261),('privacy_clause_url','http://priva.cyclause.com',1577416996,1590049261),('activity_limit','1',1577416996,1590049261),('num_records','1',1577416996,1590049261),('main_tenance_mode','0',1577416996,1590049261),('main_tenance_mode_message','维护模式已开启，请联系管理员或稍后再试！',1577416997,1590049261),('main_tenance_mode_url','http://redirection.address.com',1577416997,1590049261),('dl_incl_product','1',1577432304,1589886352),('affiliate_enabled','0',1577435773,1589272735),('affiliate_percent','1',1577435773,1589272735),('affiliate_bonusde_posit','1',1577435773,1589272735),('affiliate_payout','1',1577435773,1589272735),('affiliate_delay_commission','1',1577435773,1589272735),('affiliate_department','1',1577435773,1589272735),('affiliate_links','1',1577435773,1589272735),('circulation_create_invoice','1',NULL,NULL),('en','1',NULL,NULL),('clients_profoptional','1',1577439917,1589886170),('clients_profuneditable','1',1577439917,1589886170),('show_cancel','1',1577439917,1589886170),('aff_report','1',1577439917,1589886170),('display_errors','1',1577439917,1589886170),('sql_error_reporting','1',1577439917,1589886170),('hooks_debug_mode','1',1577439917,1589886170),('required_pwstrength','1',1577440197,1589886250),('invalid_logins_banlength','1',1577440197,1589886250),('in_circulation_create','1',1577674352,1589359919),('in_pdf','1',1577674352,1589359919),('in_save_user_info','1',1577674352,1589359919),('in_select_payment','1',1577674352,1589359919),('in_unpaid_tick','1',1577674352,1589359919),('in_continuous_pay_num','1',1577674352,1589359919),('in_continuous_pay_num_type','1',1577674352,1589359919),('in_overdue_fine','1',1577674352,1589359919),('in_overdue_fine_min','1',1577674352,1589359919),('language','chinese',1577674352,1589886355),('charset','1',1577959541,1589886355),('date_format','1',1577959541,1589886355),('client_date_format','1',1577959541,1589886355),('default_country','1',1577959541,1589886355),('allow_user_language','1',1577959541,1589886355),('tel_cc_input','1',1577959541,1589886355),('daily_ftp_backup_status','1',1578291261,1578291665),('ftp_backup_hostname','1',1578291261,1578291665),('ftp_backup_port','1',1578291261,1578291665),('ftp_backup_username','1',1578291261,1578291665),('ftp_backup_password','1',1578291261,1578291665),('ftp_backup_destination','1',1578291261,1578291665),('ftp_secure_mode','1',1578291261,1578291665),('ftp_passive_mode','1',1578291261,1578291665),('daily_email_backup','1',1578291795,1578292172),('daily_email_backup_status','1',1578291795,1578292172),('addfunds_enabled','1',1578304917,1590059776),('addfunds_minimum','1.00',1578304917,1590059776),('addfunds_maximum','100000.00',1578304917,1590059776),('addfunds_maximum_balance','1000000.00',1578304917,1590059776),('addfunds_require_order','0',1578304917,1590059776),('no_auto_apply_credit','1',1578304917,1590059776),('credit_on_downgrade','1',1578304917,1590059776),('aliyun_mobile_interaccesskeyid','1',1579155208,1588763335),('aliyun_mobile_interaccesskeysecret','1',1579155208,1588763335),('aliyun_mobile_intersignature','1',1579155208,1588763335),('sms_international','1',1586756930,1588763335),('cron_host_suspend_send','1',1587092883,1587105958),('cron_host_unsuspend','1',1587092883,1587105958),('cron_host_unsuspend_send','1',1587092883,1587105958),('cron_host_terminate','1',1587092883,1587105958),('cron_host_terminate_time','1',1587093419,NULL),('cron_invoice_create_default_days','1',1587093419,1589197564),('cron_invoice_create_annually','1',1587093419,1587104879),('cron_invoice_pay_email','1',1587093419,NULL),('cron_invoice_unpaid_email','1',1587093419,1589770638),('cron_invoice_first_overdue_email','1',1587093419,1589189868),('cron_invoice_second_overdue_email','1',1587093419,1589193131),('cron_invoice_third_overdue_email','1',1587093419,1589192741),('cron_ticket_close_time','1',1587093419,1589967809),('cron_client_delete','1',1587093419,NULL),('cron_client_delete_time','1',1587093419,1587093640),('cron_other_cancel_request','1',1587093419,NULL),('cron_other_client_update','1',1587093419,NULL),('cron_invoice_create_hour','1',1587102211,1589196988),('in_batch_pay','1',1587868361,1589359919),('cron_last_run_time','1',1589102269,1590066101),('cron_invoice_create_day','1',1589189752,1589196691),('cron_invoice_create_monthly','1',1589189752,1589196683),('allow_phone','1',1589542889,1590109909),('allow_email','1',1589542889,1590109909),('allow_wechat','0',1589542889,1590109909),('wechat_login_appid','1',1589542889,1590109909),('wechat_login_secret','1',1589542889,1590109909),('cron_order_unpaid_time','1',1589959785,1590063100),('cron_order_unpaid_action','Cancelled',1589959785,1590060463),('cron_invoice_recharge_delete','1',1590054652,1590055002),('title','1',1,1),('update_last_version','3.6.4',NULL,NULL),('logo_url_home','/upload/logo-colours.png',0,0),('allow_register_phone','1',1595578788,1595578788),('allow_register_email','1',1595578788,1595578788),('allow_register_wechat','1',1595578788,1595578788),('allow_login_phone','1',1595578788,1595578788),('allow_login_email','1',1595578788,1595578788),('allow_login_wechat','1',1595578788,1595578788),('beta_version','3.6.4',1758904364,0),('second_verify','1',1758904364,0),('second_verify_action','on,off,reboot,hardOff,hardReboot,crackPass,rescue,vnc',1758904364,0),('second_verify_action_type','email,phone',1758904364,0),('cancellation_time','1',1589542889,0),('second_verify_home','0',1758904370,0),('second_verify_admin','0',1758904370,0),('second_verify_action_home','',1758904370,0),('second_verify_action_home_type','',1758904370,0),('second_verify_action_admin','',1758904370,0),('executed_update','0',1758904371,1758904526),('updatebates','1',1605702454,1758904547),('captcha_length','5',1605782660,1605796651),('captcha_combination','1',1605782660,1605796651),('allow_register_email_captcha','1',1605782660,1605796651),('allow_register_phone_captcha','1',1605782660,1605796651),('allow_login_phone_captcha','1',1605782660,1605796651),('allow_login_email_captcha','0',1605782660,1605796651),('allow_login_code_captcha','1',1605782660,1605796651),('allow_login_id_captcha','0',1605782660,1605796651),('allow_phone_forgetpwd_captcha','1',1605782660,1605796651),('allow_email_forgetpwd_captcha','1',1605782660,1605796651),('allow_resetpwd_captcha','1',1605782660,1605796651),('allow_phone_bind_captcha','1',1605782660,1605796651),('allow_email_bind_captcha','1',1605782660,1605796651),('allow_cancel_captcha','1',1605782660,1605796651),('allow_login_admin_captcha','0',1605782660,1605796651),('is_captcha','0',1605796651,0),('voucher_manager','1',1758904414,0),('shd_allow_sms_send','1',1758904415,0),('shd_allow_email_send','1',1758904415,1758904523),('themes_templates','clientareaonly',1758904417,0),('affiliate_cookie','14',NULL,NULL),('clientarea_default_themes','default',1758904419,0),('credit_limit','1',1758904422,0),('login_error_max_num','0',1758904422,0),('allow_resource_api_realname','0',1758904422,0),('allow_resource_api_phone','0',1758904422,0),('login_error_switch','0',NULL,NULL),('login_error_max_num','0',NULL,NULL),('allow_resource_api_realname','0',NULL,NULL),('allow_resource_api_phone','0',NULL,NULL),('shd_allow_sms_send_global','1',1619493574,1619595325),('sms_operator_global','',1619493574,1619595325),('allow_login_register','1',1619493574,1619595325),('marketing_emails_opt_in','1',NULL,NULL),('allow_custom_clients_id','0',NULL,NULL),('custom_clients_id_start','0',NULL,NULL),('cron_order_unpaid_time_high','0',1758904431,0),('artificial_auto_send_msg','0',NULL,NULL),('certifi_business_open','0',NULL,NULL),('certifi_business_is_upload','0',NULL,NULL),('certifi_business_is_author','0',NULL,NULL),('certifi_business_author_path','',NULL,NULL),('contract_open','0',1758904434,0),('contract_institutions','',1758904434,0),('contract_phonenumber','',1758904434,0),('contract_consignee_address','',1758904434,0),('contract_postcode','',1758904434,0),('contract_postcode_fee','0',1758904434,0),('contract_number_custom','0',1758904434,0),('contract_number','15',1758904434,0),('contract_number_prefix','',1758904434,0),('contract_pdf_logo','',1758904434,0),('contract_company_logo','',1758904434,0),('zjmf_system_version_type_last','beta',1758904436,0),('system_version_type','beta',1758904436,0),('affiliate_invited','0',0,0),('affiliate_invited_money','',0,0),('affiliate_invited_type','1',0,0),('allow_new_login_template','default',NULL,NULL),('admin_application','Z5OtUlpd',1758904441,NULL),('system_license','11EDA59F92FD735D3CBE8D34B18593BF',1758904441,NULL),('system_token','f0f78e399e3a7fe78c634d2c82fd0d5c',1758904441,NULL),('last_license_time','1758904557',1758904443,1758904557),('authsystemip','ae41c7aaxB1S6eRqUEukfSIEFm7r/wuwPd+HnmZlb5D3svYwQ6j6m6t13Rg26OWK1t6/z1Ey52zWqgYpfSZPrZJg/AolhMadISh3MlZtqw5aSShvtXA1+vPIp1U7rG/yP9fOKLve5VLLLdN7SSFHELxlXiMNlSHaZzMgJHOFVIBJLnTwFBLn1q/n//xZ1Zfzg2/+TCs8i9fKXDrNQW9wSrmt31T7pX17hT6ra4316qO2L+q0HAy71uPQ/TCHryRMcBKYP0XllIHv',1758904515,NULL),('zjmf_authorize','48aeW6pYGbPZMMKHN49oJULPYbzAN6phQHw5qLo6Koj5p03v2zrkAtg0Z0hFLgLzjzQbr0RhH+oqDj7ibzuxgkBjIgAO3HRgCnZ8t4Z+EhFmMyjHd8gH64RPGY9mB8kENiYm0VXCWmIvUNYxU0xkDNh8T9SV1BS5uzbCRwSe/2whrD8pdOf9BYYkZfnA/x7kI5T1RFpDknah+ioBy+Lscm8PjwMVPjAa8ntjX/Zf7h0tnDvr8EEuHCWrpeXkX1g5vy1YtCuScILkr/2mcD62Yt5JcDwRAE/qDY1YPXb3bMC6Ud1FNS9MlaRq4O27qG4T/ob2WQehNSupaHkI8gb5aihhqM6CcW/YYmQILzaRXte7081+GKzKyZKiV7KdfQurd2aHePcES/JC70fmWBtdOViyx0PHOF7+2ucXcZSLCqz59uAGEAsqnRh7CO9mFyFFMfNJggrc1ib+jNGAchzqelfKvucxIjZfPYxb20LOAJpJZx3o5R8KeUO+PmoRng+3UDxYYLZYmDVwuJsojoY5ptGw2W//pT0iWiVlkdSFoH3AMuN9xNS7WVFcDRdeXPfwien7ga+QMyMREOdWK5TvKfEEKaDfdyU+71GAsUIRbX/OgY2aBbAr3WeGvjHtbrSuypgEbFzlpGF+iaafebWMMuMU7T52WT3BjPQnmnQKLSk2VINVRczKy30QXQvc3CFtDWp+W5ZVvQqPS3w//ckVxG3M0HcKiRW+VMjks/oIPtpVWqv/I3roXpYS50FpnYx98ehgJ+4aPYAZAFAjY2uUpD1Yz//XkQ0O9oYD3wHPS4A+LL8g/dL1c9GLX3LM+Bw4Y5x3vE40AKADALvxyuk3UWFnjybPGxlGrPYXiTnhsJ6CDJmAXlUBeqeywr4PkUxp1vQKdoLLNzP0GcgIe0nBrTfr7j+jQiXaF9Yi+5qKRsHJ0+HCBirzSKiQSvG50bTecAmxhNO/w8XSiAD8y9TMaJR9fCS5L64iv07k1FG+9oRtusjed1gG0p2vvspUcrbEDL4+zfdB1gUoz02H7+vFZjOlYOBDMvpP7Cy+y1SoBJKhLQm23JJ7ceAStpdKc4sUUkAzSyH7uUqCr4kiUE6TEvx1GH/s82JkcxBJafyvHrcUhhT9IuJI+XOahuWlDeocT7VIrgiqCvk9WX7fhLWY5QnvsB9Z+XPT2fSIESRuHhhsrR35hXL8LlOS2c7FLula8hFuyu187mPBo2kDpGx4ow3x14wxtzvaX/jqLh0zamZHcaErJfmqrndRMC8tiAlo6qjB/GfQB0vqdERNCrtQ++al2W9pXNDNGldca733+ORxROo+012N0c2ZWhJLfe0zUm+sIN17NFrcN8yh9dPSCMdDNid9vZ+WpJrpTKrrFJJy2Dy5DmAOYVlhYrtoyq/IH+QsxbeHdiFMCl1SIdEHcgAvDsvOud4OkihJ95B2VCHoZfkAAQ+ij5pyP6MotVYenzGzFptZU00QNjm/CJ9IL6/Qh27APhT4oBcoEFgYkuQTbPyM5x4FfyzP0zaL+xtGX0uA+JR4UGP70Mie75RMbzdhQ9XxLAtMOjsr6eRZ6CtPIrmU6CKtCZIqUAIoTytynpmJMwucRpBQBIk3K3JKpVst8/ZA0ymUWNIU5KcTE6PtoARSjB1GDK+4gzdvHdDvJWrAotMlCTcAOlFJpsthvFgvHt+Z3IAXCOWsoIKobSmR+wxyH+Vz7nBNWMGrgAbHHp+ri1bB1Fmc9YB/9NQHiMa1fCIg4rfHN1BgMeIq2sK7UKh5ZQZShR15eoZcaL13Oezm9ikp5VdL1A7iASzIQAx9mG+x23vs/yTn/hmlkdmQCCBAGkr/W8Nh8Gv+zInA1cMU61qZ+60Eg4U3x5LP/QSqsD2U1cPdPaXhGz4CyFXZt4CJF3viarWdbGUiEAtbGctetFinegYr5ZuMl2ubd1uUR2TyhvTtCF8sYqWVWLTrT3zjge5sB9YbFKy25jkGtiRoqYJ/SB05nwx8vsjWpbd05J23qVy2+A5SUBFQnfyuXwMaOYBeUvYBYtDP/5OUV/VhsUBLpPWeyjLcAtW7DbzRRVOJ/UqJJhvFcHynS3fGNcg8SX2fIG8C2L34/gye+kg1gYQlnwtLKCCn8iG6frSwGgZyVI4tSwZ5n/is7r8HMC/bWseW9iLc29gJ5QKZwzX4Hq+0PD8zNADDiCFlPyke19WEsBwj6dRhF9Z3rv9fkmnDgWtv4cFMpFewZKvZUfF1mG7o79POZ+lRdYDcJ/CzFQOGFI/KqRVWL6U0bTArnc9Nn3hjiCYay/DLlFrib2iEyjJqlVNGHGd7GWF7E8Lus9+4H9mJobkYMI3CBb1uBFqij0iNZ6qAu6lLWaB022cMAAmLlMJSOwbjRNRau6xF8/5AbOpkRDUyvonQP8l5GKDNXz5ZsIoQZ1B+DWT8aPMCb041MzL3WO57JQPxmCp+POlJltSaxSgrdQLy7B67g1ka/sJkqmiI4fwTuGz80iKPM8AZkciLDAN6RRUootKdRpTo1zC8jZScKaTvdSgUEHzdp8CuBv6S3WInJFoQmVM3dVADVt62nngjisGFVjlb6GQLuz/9g7UlBPehNZ4/lt+MWlH7ArfzG7nxVJmjEJeCl9gOqPf+8GrkeA',1758904515,NULL),('email_operator','smtp',1758904523,NULL),('update_version_320','1',1758904523,NULL),('update_version_330','1',1758904523,NULL),('certification_compatible_old','1',1758904526,NULL),('update_version_233','1',1758904526,NULL),('update_version_241','1',1758904526,NULL),('update_version_261','1',1758904526,NULL),('update_version_266','1',1758904526,NULL),('update_version_278','1',1758904526,NULL),('update_version_288','1',1758904526,NULL),('update_version_296','1',1758904527,NULL),('update_version_306','1',1758904527,NULL),('update_version_323','1',1758904527,NULL),('update_version_324','1',1758904527,NULL),('update_version_334','1',1758904527,NULL),('update_version_363','1',1758904527,NULL),('web_authcode','lO9vggU0WroS1IYSYj',1758904527,1758904557),('change_product_cycle_to_recurring','1',1758904547,NULL),('updatepromobates','1',1758904557,NULL),('upgrade_send_template_version','1758904564.3324',1758904564,NULL),('cookie_clientarea_nmae','ZJMF_014E56C6E8CC4B0D',1758904566,NULL);
/*!40000 ALTER TABLE `shd_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_contacts`
--

DROP TABLE IF EXISTS `shd_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_contacts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '主账户id',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '客户名',
  `sex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未知，1男，2女',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '客户头像',
  `companyname` varchar(80) NOT NULL DEFAULT '' COMMENT '所在公司',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '邮件',
  `wechat_id` int(10) DEFAULT NULL COMMENT '微信id',
  `country` varchar(100) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(100) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '城市',
  `region` varchar(100) NOT NULL DEFAULT '' COMMENT '区',
  `address1` varchar(100) NOT NULL DEFAULT '' COMMENT '具体地址1',
  `address2` varchar(100) NOT NULL DEFAULT '' COMMENT '具体地址2',
  `postcode` varchar(100) NOT NULL DEFAULT '' COMMENT '邮编',
  `phonenumber` varchar(100) NOT NULL DEFAULT '' COMMENT '电话',
  `password` varchar(200) NOT NULL DEFAULT '' COMMENT '密码',
  `permissions` text COMMENT '权限',
  `generalemails` int(1) NOT NULL DEFAULT '0' COMMENT '普通邮件通知',
  `invoiceemails` int(1) NOT NULL DEFAULT '0' COMMENT '账单邮件通知',
  `productemails` int(1) NOT NULL DEFAULT '0' COMMENT '产品邮件通知',
  `supportemails` int(1) NOT NULL DEFAULT '0' COMMENT '工单邮件通知',
  `authmodule` varchar(200) NOT NULL DEFAULT '' COMMENT '授权模块',
  `authdata` varchar(200) NOT NULL DEFAULT '' COMMENT '授权数据',
  `lastlogin` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `lastloginip` varchar(255) NOT NULL DEFAULT '' COMMENT '登录ip',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态（1激活，0未激活，2关闭）',
  `pwresetkey` varchar(100) NOT NULL DEFAULT '' COMMENT '密码重置key',
  `pwresetexpiry` int(11) NOT NULL DEFAULT '0' COMMENT '密码重置过期时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned zerofill NOT NULL DEFAULT '0000000000' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `wechat_id` (`wechat_id`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_contacts`
--

LOCK TABLES `shd_contacts` WRITE;
/*!40000 ALTER TABLE `shd_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_contract`
--

DROP TABLE IF EXISTS `shd_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_contract` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态：0关闭(默认)，1显示',
  `force` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否强制：0否(默认)，1是',
  `product_id` varchar(100) NOT NULL DEFAULT '' COMMENT '产品ID：,隔开',
  `notes` tinyint(1) NOT NULL DEFAULT '0' COMMENT '提示：0不提示(默认)，1全局提示，2产品页提示',
  `represent` varchar(50) NOT NULL DEFAULT '' COMMENT '授权代表',
  `phonenumber` varchar(50) NOT NULL DEFAULT '' COMMENT '代表电话',
  `inscribe_custom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '落款信息是否自定义：1自定义，0默认',
  `nocheck` tinyint(1) NOT NULL DEFAULT '0' COMMENT '无需审核:1是，0否',
  `suspended` int(11) NOT NULL DEFAULT '0' COMMENT '未签订xx天后进行动作',
  `suspended_type` varchar(25) NOT NULL DEFAULT '' COMMENT '未签订合同：类型：suspended暂停，noaccess产品内容页无法访问',
  `remark` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  `is_post` tinyint(1) NOT NULL DEFAULT '0' COMMENT '支持邮寄：1是，0否',
  `content` text COMMENT '合同内容',
  `base` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否基础合同：1是，0否',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_contract`
--

LOCK TABLES `shd_contract` WRITE;
/*!40000 ALTER TABLE `shd_contract` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_contract_pdf`
--

DROP TABLE IF EXISTS `shd_contract_pdf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_contract_pdf` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pdf_num` varchar(50) NOT NULL DEFAULT '' COMMENT '合同编号',
  `contract_id` int(11) NOT NULL DEFAULT '0' COMMENT '合同模板ID',
  `uid` int(11) NOT NULL DEFAULT '0',
  `host_id` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0已作废，1已签订，2待签订，3待邮寄，4已邮寄',
  `pdf_address` varchar(500) NOT NULL DEFAULT '' COMMENT 'PDF地址',
  `information` varchar(500) NOT NULL DEFAULT '' COMMENT '主机信息',
  `ip` varchar(20) NOT NULL DEFAULT '' COMMENT '用户IP',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '快递公司',
  `express_order` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单号',
  `remark` varchar(500) NOT NULL DEFAULT '',
  `is_post` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否邮寄：1是，0否',
  `sign_addr` varchar(5000) NOT NULL DEFAULT '' COMMENT '签名图片地址',
  `cancel_post` tinyint(1) NOT NULL DEFAULT '0' COMMENT '已取消过邮寄',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `PDF` (`pdf_num`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `host_id` (`host_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_contract_pdf`
--

LOCK TABLES `shd_contract_pdf` WRITE;
/*!40000 ALTER TABLE `shd_contract_pdf` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_contract_pdf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_credit`
--

DROP TABLE IF EXISTS `shd_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_credit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `description` text,
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `relid` int(10) NOT NULL DEFAULT '0',
  `aff_refund` int(2) NOT NULL DEFAULT '0' COMMENT '推介计划是否处理了退款',
  `notes` text COMMENT '备注',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `relid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_credit`
--

LOCK TABLES `shd_credit` WRITE;
/*!40000 ALTER TABLE `shd_credit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_credit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_credit_limit`
--

DROP TABLE IF EXISTS `shd_credit_limit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_credit_limit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `description` text NOT NULL COMMENT '''',
  `type` varchar(50) NOT NULL DEFAULT '',
  `notes` text NOT NULL COMMENT '备注',
  `handle_id` int(10) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `ip` varchar(20) DEFAULT '' COMMENT '用户ip',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_credit_limit`
--

LOCK TABLES `shd_credit_limit` WRITE;
/*!40000 ALTER TABLE `shd_credit_limit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_credit_limit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_cron_log`
--

DROP TABLE IF EXISTS `shd_cron_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_cron_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `method` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_cron_log`
--

LOCK TABLES `shd_cron_log` WRITE;
/*!40000 ALTER TABLE `shd_cron_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_cron_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_currencies`
--

DROP TABLE IF EXISTS `shd_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_currencies` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL DEFAULT '',
  `prefix` varchar(10) NOT NULL DEFAULT '',
  `suffix` varchar(10) NOT NULL DEFAULT '',
  `format` varchar(10) NOT NULL DEFAULT '',
  `rate` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1默认货币',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY ```code``` (`code`),
  KEY `default` (`default`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_currencies`
--

LOCK TABLES `shd_currencies` WRITE;
/*!40000 ALTER TABLE `shd_currencies` DISABLE KEYS */;
INSERT INTO `shd_currencies` VALUES (1,'CNY','¥','元','3',1.00000,1);
/*!40000 ALTER TABLE `shd_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_customfields`
--

DROP TABLE IF EXISTS `shd_customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_customfields` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` text COMMENT 'product(产品层自定义字段),client(用户自定义字段),ticket(工单自定义字段)',
  `relid` int(10) NOT NULL DEFAULT '0' COMMENT '父ID',
  `fieldname` varchar(255) NOT NULL DEFAULT '',
  `fieldtype` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `fieldoptions` varchar(255) NOT NULL DEFAULT '',
  `regexpr` varchar(255) NOT NULL DEFAULT '',
  `adminonly` int(10) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `showorder` tinyint(1) NOT NULL DEFAULT '0',
  `showinvoice` tinyint(1) NOT NULL DEFAULT '0',
  `sortorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `upstream_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应上游自定义字段ID',
  `showdetail` tinyint(1) NOT NULL DEFAULT '0' COMMENT '产品内页显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `serviceid` (`relid`) USING BTREE,
  KEY `type` (`type`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_customfields`
--

LOCK TABLES `shd_customfields` WRITE;
/*!40000 ALTER TABLE `shd_customfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_customfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_customfieldsvalues`
--

DROP TABLE IF EXISTS `shd_customfieldsvalues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_customfieldsvalues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fieldid` int(10) NOT NULL DEFAULT '0',
  `relid` int(10) NOT NULL DEFAULT '0' COMMENT 'hostid或者客户ID或者工单id',
  `value` text,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `fieldid_relid` (`fieldid`,`relid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_customfieldsvalues`
--

LOCK TABLES `shd_customfieldsvalues` WRITE;
/*!40000 ALTER TABLE `shd_customfieldsvalues` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_customfieldsvalues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_dcim_buy_record`
--

DROP TABLE IF EXISTS `shd_dcim_buy_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_dcim_buy_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `relid` int(11) NOT NULL DEFAULT '0' COMMENT '流量包id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '产品名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未支付 1已付款',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `capacity` int(10) NOT NULL DEFAULT '0' COMMENT '流量包大小',
  `show_status` tinyint(10) NOT NULL DEFAULT '0' COMMENT '前台显示状态 0显示 1不显示',
  `invoiceid` int(11) NOT NULL DEFAULT '0' COMMENT '账单ID',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型(flow_packet流量包reinstall_times重装次数)',
  `hostid` int(11) NOT NULL DEFAULT '0' COMMENT 'hostid',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `relid` (`relid`),
  KEY `invoiceid` (`invoiceid`),
  KEY `name` (`name`(100)),
  KEY `hostid` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_dcim_buy_record`
--

LOCK TABLES `shd_dcim_buy_record` WRITE;
/*!40000 ALTER TABLE `shd_dcim_buy_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_dcim_buy_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_dcim_flow_packet`
--

DROP TABLE IF EXISTS `shd_dcim_flow_packet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_dcim_flow_packet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '流量包名称',
  `capacity` int(10) NOT NULL DEFAULT '0' COMMENT '流量包容量(G)',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `allow_products` text COMMENT '允许使用的产品',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0禁用 1启用',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `sale_times` int(11) NOT NULL DEFAULT '0' COMMENT '销售次数',
  `stock` int(10) NOT NULL DEFAULT '0' COMMENT '库存',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='dcim流量包表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_dcim_flow_packet`
--

LOCK TABLES `shd_dcim_flow_packet` WRITE;
/*!40000 ALTER TABLE `shd_dcim_flow_packet` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_dcim_flow_packet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_dcim_percent`
--

DROP TABLE IF EXISTS `shd_dcim_percent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_dcim_percent` (
  `id` int(11) NOT NULL DEFAULT '0',
  `hostid` int(11) NOT NULL DEFAULT '0',
  `percent` varchar(255) NOT NULL DEFAULT '',
  `send_email` tinyint(3) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hostid` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用于流量超过百分比记录邮件是否发送';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_dcim_percent`
--

LOCK TABLES `shd_dcim_percent` WRITE;
/*!40000 ALTER TABLE `shd_dcim_percent` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_dcim_percent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_dcim_servers`
--

DROP TABLE IF EXISTS `shd_dcim_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_dcim_servers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serverid` int(11) NOT NULL DEFAULT '0' COMMENT '服务器ID',
  `reinstall_times` int(11) NOT NULL DEFAULT '0' COMMENT '每周重装次数',
  `buy_times` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否启用付费重装 0禁用 1启用',
  `reinstall_price` decimal(10,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '重装单次价格',
  `auth` text COMMENT '功能设置',
  `api_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT 'api状态 0失败1成功',
  `area` text COMMENT '存储区域',
  `os` text COMMENT '所有镜像数据',
  `bill_type` varchar(255) NOT NULL DEFAULT '' COMMENT '流量计费方式',
  `flow_remind` text COMMENT '流量提醒设置',
  `ip_customid` int(11) NOT NULL DEFAULT '0',
  `is_certifi` varchar(5000) NOT NULL DEFAULT '' COMMENT '操作是否需要实名认证，json格式字符串',
  PRIMARY KEY (`id`),
  KEY `serverid` (`serverid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='dcim接口附加功能配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_dcim_servers`
--

LOCK TABLES `shd_dcim_servers` WRITE;
/*!40000 ALTER TABLE `shd_dcim_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_dcim_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_developer`
--

DROP TABLE IF EXISTS `shd_developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_developer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `desc` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `status` varchar(25) NOT NULL DEFAULT 'Pending',
  `sort` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `suspended_reason` varchar(255) NOT NULL DEFAULT '',
  `cancelled_reason` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_developer`
--

LOCK TABLES `shd_developer` WRITE;
/*!40000 ALTER TABLE `shd_developer` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_developer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_downloadcats`
--

DROP TABLE IF EXISTS `shd_downloadcats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_downloadcats` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类名',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '分类描述',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏分类',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parentid` (`parentid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_downloadcats`
--

LOCK TABLES `shd_downloadcats` WRITE;
/*!40000 ALTER TABLE `shd_downloadcats` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_downloadcats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_downloads`
--

DROP TABLE IF EXISTS `shd_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_downloads` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `category` int(10) NOT NULL DEFAULT '0',
  `type` text,
  `title` text,
  `description` text,
  `downloads` int(10) NOT NULL DEFAULT '0',
  `location` text,
  `clientsonly` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `productdownload` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `locationname` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '原始名字',
  `filetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT 'upload  ',
  `url` varchar(255) DEFAULT '' COMMENT 'url',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `title` (`title`(32)) USING BTREE,
  KEY `downloads` (`downloads`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_downloads`
--

LOCK TABLES `shd_downloads` WRITE;
/*!40000 ALTER TABLE `shd_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_email_log`
--

DROP TABLE IF EXISTS `shd_email_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_email_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `subject` varchar(100) NOT NULL DEFAULT '',
  `message` text,
  `create_time` int(11) NOT NULL DEFAULT '0',
  `to` varchar(100) NOT NULL DEFAULT '',
  `cc` varchar(500) NOT NULL DEFAULT '',
  `bcc` varchar(500) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `fail_reason` varchar(500) NOT NULL DEFAULT '' COMMENT '失败原因',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否是管理员',
  `attachments` text COMMENT '邮件附件地址，相对路径地址',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'ip',
  `port` varchar(32) DEFAULT '' COMMENT '端口号',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_email_log`
--

LOCK TABLES `shd_email_log` WRITE;
/*!40000 ALTER TABLE `shd_email_log` DISABLE KEYS */;
INSERT INTO `shd_email_log` VALUES (1,1,'[系统]账号登录提示','<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"UTF-8\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <title>Document</title>\n  <style>\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  </style>\n</head>\n<body>\n<div class=\"box\">\n<div class=\"logo_top\"><img src=\"https://cloud.hfz.pw/upload/logo.png\" alt=\"\" /></div>\n<div class=\"card\">\n<h2 style=\"text-align: center;\">HFCloud[系统]账号登录提示</h2>\n<br /><strong>管理员admin</strong> <br /><br /><span style=\"margin: 0; padding: 0; display: inline-block; margin-top: 55px;\">您的账号于2025-09-27 00:35:47=在此地址（149.28.171.184）登录。</span><br /><span style=\"margin: 0; padding: 0; display: inline-block; margin-top: 60px;\">如本次操作并非经由您本人，请尽快修改密码。<br />以防安全信息泄露。</span><br /><span style=\"margin: 0; padding: 0; color: #303133; font-family: \'Alibaba PuHuiTi\'; font-size: 16px;\">&nbsp;</span> <br /><span style=\"margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;\">HFCloud</span> <br /><span style=\"margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;\">2025-09-27</span></div>\n<ul class=\"banquan\">\n<li>HFCloud</li>\n</ul>\n</div>\n</body>\n</html>',1758904552,'1733206793a@gmail.com','','',0,'SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting',0,'','149.28.171.184','58186'),(2,1,'[系统]账号登录提示','<!DOCTYPE html>\n<html lang=\"en\">\n<head>\n  <meta charset=\"UTF-8\">\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n  <title>Document</title>\n  <style>\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  </style>\n</head>\n<body>\n<div class=\"box\">\n<div class=\"logo_top\"><img src=\"https://cloud.hfz.pw/upload/logo.png\" alt=\"\" /></div>\n<div class=\"card\">\n<h2 style=\"text-align: center;\">HFCloud[系统]账号登录提示</h2>\n<br /><strong>管理员admin</strong> <br /><br /><span style=\"margin: 0; padding: 0; display: inline-block; margin-top: 55px;\">您的账号于2025-09-27 00:35:57=在此地址（58.253.224.223）登录。</span><br /><span style=\"margin: 0; padding: 0; display: inline-block; margin-top: 60px;\">如本次操作并非经由您本人，请尽快修改密码。<br />以防安全信息泄露。</span><br /><span style=\"margin: 0; padding: 0; color: #303133; font-family: \'Alibaba PuHuiTi\'; font-size: 16px;\">&nbsp;</span> <br /><span style=\"margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;\">HFCloud</span> <br /><span style=\"margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;\">2025-09-27</span></div>\n<ul class=\"banquan\">\n<li>HFCloud</li>\n</ul>\n</div>\n</body>\n</html>',1758904562,'1733206793a@gmail.com','','',0,'SMTP connect() failed. https://github.com/PHPMailer/PHPMailer/wiki/Troubleshooting',0,'','58.253.224.223','64120');
/*!40000 ALTER TABLE `shd_email_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_email_templates`
--

DROP TABLE IF EXISTS `shd_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `name_en` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '邮件名称英文',
  `subject` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8_unicode_ci,
  `attachments` text COLLATE utf8_unicode_ci,
  `fromname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `fromemail` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态:0默认显示，1隐藏',
  `custom` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `copyto` text COLLATE utf8_unicode_ci,
  `blind_copy_to` text COLLATE utf8_unicode_ci,
  `plaintext` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `update_time` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`(32)) USING BTREE,
  KEY `name` (`name`(64)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_email_templates`
--

LOCK TABLES `shd_email_templates` WRITE;
/*!40000 ALTER TABLE `shd_email_templates` DISABLE KEYS */;
INSERT INTO `shd_email_templates` VALUES (1,'notification','验证码','Captcha_Check','{SYSTEM_COMPANYNAME}验证码邮件','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]收到新的验证码&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您好！&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您正在申请{CODE_ACTION}：&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; line-height: 32px;&quot;&gt;为了账号安全，请在指定位置输入下列验证码： &lt;span style=&quot;margin: 0; padding: 0; color: #007bfc; font-size: 18px; font-weight: bold;&quot;&gt;{CODE}&lt;/span&gt;。 验证码涉及个人账号隐私安全，切勿向他人透漏。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;如果本次请求并非由您发起，请务必告知我们, 由此给您带来的不便敬请谅解。&lt;/span&gt;&lt;br /&gt;&amp;nbsp; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590062916,1593398817),(2,'general','注册成功','Registration_Success','[{SYSTEM_COMPANYNAME}]注册成功','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]注册成功&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; m argin-top: 55px;&quot;&gt;您已成功注册{SYSTEM_COMPANYNAME}账号，感谢您的使用。请完善账号个人信息并妥善保管。&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;切勿向他人透漏登录密码！ &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SYSTEM_COMPANYNAME}&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590062970,1594345502),(3,'general','登录提醒','Login_Notice','[{SYSTEM_COMPANYNAME}]来自IP({ACTION_IP})的访问','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;[{SYSTEM_COMPANYNAME}]来自IP{ACTION_IP}的访问&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您的账号于{LOGIN_DATA_TIME}时间在以下（{ACTION_IP}）地址登录&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;如您未曾尝试登录，请立即更改登录密码，以防账号被盗。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; {SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063013,1594349610),(4,'general','邮箱绑定通知','Email_Bond_Notice','[{SYSTEM_COMPANYNAME}]已成功进行{EPW_TYPE}','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]已成功进行{EPW_TYPE}&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您的账号{USERNAME}与此{EPW_TYPE}：（{EPW_ACCOUNT}） 已成功进行绑定。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;如有疑问，请联系客服。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt;&lt;strong&gt; {SYSTEM_COMPANYNAME}&lt;/strong&gt;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063066,1594349363),(5,'product','裸金属产品开通邮件','ZJMF_DCIM_Product_Welcome','[{SYSTEM_COMPANYNAME}]您购买的{PRODUCT_NAME}产品已开通，感谢使用！','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]您购买的{PRODUCT_NAME}产品已开通，感谢使用！&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的产品{PRODUCT_NAME}({HOSTNAME})现已开通，感谢使用。以下为该产品的详细信息，请务必妥善保管。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;IP地址：{PRODUCT_MAINIP}&lt;br /&gt;操作系统用户名：{PRODUCT_USER}&lt;br /&gt;操作系统密码：{PRODUCT_PASSWD}&lt;br /&gt;操作系统：{PRODUCT_DCIMBMS_OS}&lt;br /&gt;其他附加IP地址：{PRODUCT_ADDONIP}&lt;br /&gt;购买时间：{PRODUCT_FIRST_TIME}&lt;br /&gt;到期时间：{PRODUCT_END_TIME}&lt;br /&gt;付款周期：{PRODUCT_BINLLY_CYCLE}&lt;/span&gt;&lt;br /&gt;&amp;nbsp; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','yourEmail@xx.com',0,0,'','','',0,1590063131,1595474404),(6,'invoice','新订单通知','New_Order_Notice','[{SYSTEM_COMPANYNAME}]新的订单等待支付','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]订单尚未支付&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt; 您已成功下单 {PRODUCT_NAME}产品，为期 ：{PRODUCT_BINLLY_CYCLE}。请及时付款，以免订单失效。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;以下为账单信息&lt;br /&gt;&lt;/span&gt;&lt;/span&gt;\n&lt;div style=&quot;margin-left: 30px;&quot;&gt;产品名称：{PRODUCT_NAME}&lt;br /&gt;产品单价：{ORDER_TOTAL_FEE}&lt;br /&gt;付款周期：{PRODUCT_BINLLY_CYCLE}&lt;br /&gt;订单创建时间：{ORDER_CREATE_TIME}&lt;/div&gt;\n&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inli ne-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063167,1594354088),(7,'invoice','订单未支付提示(第一次)','First_Invoice_Payment_Reminder','[{SYSTEM_COMPANYNAME}]订单尚未支付','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]订单尚未支付&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inl ine-block; margin-top: 55px;&quot;&gt;您在{PRODUCT_FIRST_TIME}订购的{PRODUCT_NAME}产品（主机名：{HOSTNAME}）支付尚未完成。&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px; color: red;&quot;&gt;暂时无法开通。&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;为了避免订单过期，请您及时付款。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibab a PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-t op: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063260,1593405745),(8,'invoice','订单未支付提示(第二次)','Second_Invoice_Payment_Reminder','[{SYSTEM_COMPANYNAME}]订单尚未支付','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]订单尚未支付&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您在{PRODUCT_FIRST_TIME}订购的{PRODUCT_NAME}产品（主机名：{HOSTNAME}）支付尚未完成。&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px; color: red;&quot;&gt;暂时无法开通。&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;为了避免订单过期，请您及时付款。&lt;/span&gt;&lt;br /&gt;&amp;nbsp; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063368,1593405801),(9,'invoice','订单未支付提示(第三次)','Third_Invoice_Payment_Reminder','[{SYSTEM_COMPANYNAME}]订单尚未支付','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]产品即将过期，请续费&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的产品{PRODUCT_NAME}（主机名{HOSTNAME}）将于{PRODUCT_END_TIME}到期。&lt;br /&gt;为了保证届时可 以正常使用，请在产品到期之前先行续费。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;libaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063402,1593405816),(10,'invoice','产品到期续费提示(第一次)','Renew_Product_Reminder','[{SYSTEM_COMPANYNAME}]产品即将过期，请续费','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]产品即将过期，请续费&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt; 您购买的产品{PRODUCT_NAME}（主机名{HOSTNAME}）将于{PRODUCT_END_TIME}到期。&lt;br /&gt;为了保证届时可以正常使用，请在产品到期之前先行续费。&lt;/span&gt;&lt;br /&gt;&amp;nbsp; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063460,1593405944),(11,'invoice','产品到期续费提示(第二次)','Second_Renew_Product_Reminder','[{SYSTEM_COMPANYNAME}]产品即将过期，请续费','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]产品即将过期，请续费&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的产品{PRODUCT_NAME}（主机名{HOSTNAME}）将于{PRODUCT_END_TIME}到期。&lt;br /&gt;为了保证届时可 以正常使用，请在产品到期之前先行续费。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;libaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063513,1593405987),(12,'invoice','付款成功提醒','Invoice_Payment_Confirmation','[{SYSTEM_COMPANYNAME}]付款成功，谢谢支持！','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n	  min-width:1000px;\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]付款成功，谢谢支持！&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您的订单（编号{ORDER_ID}）已经完成付款， 付款金额为：{ORDER_TOTAL_FEE}&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;谢谢支持！&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; p adding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SYSTEM_COMPANYNAME}&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063568,1593406080),(13,'product','产品过期停用','Service_Suspension_Notification','{SYSTEM_COMPANYNAME}产品过期停用，续费将重新开启','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]您购买的{PRODUCT_NAME}产品过期停用，续费将重新开启&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的{PRODUCT_NAME}（{HOSTNAME}）由于逾期未续费的缘故，现已被暂停所有功能。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;如需恢复使用，请尽快续费，否则产品将会在{PRODUCT_END_TIME}日自动删除。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SYSTEM_COMPANYNAME}&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063614,1593401003),(14,'product','续费成功提醒','Service_Unsuspension_Notification','[{SYSTEM_COMPANYNAME}]续费成功，谢谢支持','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]续费成功，谢谢支持&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的产品（{PRODUCT_NAME}）现已续费成功，服务将持续至{PRODUCT_END_TIME}&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;感谢您对我们的信赖！&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063654,1593401324),(15,'product','产品未续费，过期删除提醒','Service_Termination_Notification','{SYSTEM_COMPANYNAME}未续期产品（{PRODUCT_NAME}）已删除','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]未续期产品（{PRODUCT_NAME}）已删除&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的产品{PRODUCT_NAME} （{HOSTNAME}）由于未能在指定时间内续费，&lt;br /&gt;已于{PRODUCT_TERMINATE_TIME}自动删除。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;对因此而造成的不便我们表示歉意，希望您可以选择我们的其它产品。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063731,1593401639),(16,'product','重装系统成功提醒','ZJMF_DCIM_REBUILD_SYSTEM_SUCCESS','重装系统成功通知','','','','',0,0,'','','',0,1590063763,1590063772),(17,'support','工单创建成功','Support_Ticket_Opened','[{SYSTEM_COMPANYNAME}]工单-{TICKETNUMBER_TICKETTITLE}已开通','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]工单-{TICKETNUMBER_TICKETTITLE}已开通&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inl ine-block; margin-top: 55px;&quot;&gt;我们已经收到您在{TICKET_CREATETIME}（时间）提交的工单：（{TICKETNUMBER_TICKETTITLE}），工单内容：{TICKET_CONTNET}。&lt;br /&gt;团队将火速处理您的问题。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;请耐心等待。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; p adding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;mar gin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063799,1594347983),(18,'support','工单已回复提醒','Support_Ticket_Opened_by_Admin','[{SYSTEM_COMPANYNAME}]工单-{TICKETNUMBER_TICKETTITLE}有新回复','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]工单-{TICKETNUMBER_TICKETTITLE}有新回复&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您提交的工单-{TICKETNUMBER_TICKETTITLE}在{TICKET_REPLY_TIME}（时间）有了新的回复，内容：{TICKET_REPLY}&lt;br /&gt;团队将火速处理您的问题。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;请注意查看。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME} &lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063831,1594367784),(19,'support','工单自动关闭提醒','Support_Ticket_Auto_Close_Notification','{SYSTEM_COMPANYNAME}工单-{TICKETNUMBER_TICKETTITLE}已关闭','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]工单-{TICKETNUMBER_TICKETTITLE}已关闭&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您在{TICKET_CREATETIME}提交的工单-{TICKETNUMBER_TICKETTITLE}由于长时间未获回复&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;已于{TICKET_REPLY_TIME}自动关闭。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590063874,1594367814),(20,'product','服务器开通邮件','Default_Product_Welcome','[{SYSTEM_COMPANYNAME}]您购买的{PRODUCT_NAME}产品已开通，感谢使用！','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]您购买的{PRODUCT_NAME}产品已开通，感谢使用！&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的产品{PRODUCT_NAME}现已开通，感谢使用&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60p x;&quot;&gt;IP地址：{PRODUCT_MAINIP}&lt;br /&gt;其他附加IP地址：{PRODUCT_ADDONIP}&lt;br /&gt;购买时间：{PRODUCT_FIRST_TIME}&lt;br /&gt;到期时间：{PRODUCT_END_TIME}&lt;br /&gt;付款周期：{PRODUCT_BINLLY_CYCLE}&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi &#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SYSTEM_COMPANYNAME}&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','yourEmail@xx.com',0,0,'','','',0,1590110745,1595474630),(21,'admin','【管理员】新工单提示','Admin_New_Ticket','[系统]新工单提示','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[系统]新工单提示&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;管理员{ADMIN_ACCOUNT_NAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;客户{USERNAME}于{TICKET_CREATETIME}提交了新工单，工单内容：{TICKET_CONTNET}&lt;br /&gt;对接部门{TICKET_DEPARTMENT}，紧急程度&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px; color: red;&quot;&gt;{TICKET_LEVEL}。&lt;/span&gt;&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;望尽快处理。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590384985,1593402951),(22,'admin','【管理员】工单回复提示','Admin_New_Ticket_Reply','[系统]工单-{TICKETNUMBER_TICKETTITLE}有新回复','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[系统]工单-{TICKETNUMBER_TICKETTITLE}有新回复&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;管理员{ADMIN_ACCOUNT_NAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;客户{USERNAME}于{TICKET_REPLY_TIME}在工单-（{TICKETNUMBER_TICKETTITLE}）中添加了新的回复，内容：{TICKET_REPLY}&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;请知悉。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590385161,1594367843),(23,'invoice','【管理员】新订单通知','Admin_New_Order','[系统]新的订单已生成','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[系统]新的订单已生成&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;管理员{ADMIN_ACCOUNT_NAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;客户:{USERNAME}在{PRODUCT_FIRST_TIME}（时间）提交产品{PRODUCT_NAME}的订单，&lt;br /&gt;付款周期为：{PRODUCT_BINLLY_CYCLE}&lt;br /&gt;订单金额为：{ORDER_TOTAL_FEE}&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590385177,1594367485),(24,'invoice','【管理员】订单支付完成提示','Admin_New_Order_Paid','[系统]订单支付完成','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[系统]订单支付完成&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;管理员{ADMIN_ACCOUNT_NAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;订单{ORDER_ID}在{INVOICE_PAID_TIME}(时间)完成付款，&lt;br /&gt;付款金额为：{ORDER_TOTAL_FEE}&lt;br /&gt;请知悉。&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590385196,1594367467),(25,'admin','【管理员】登录提醒','Admin_Login_Success','[系统]账号登录提示','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[系统]账号登录提示&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;管理员{ADMIN_ACCOUNT_NAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您的账号于{ADMIN_LOGIN_DATA_TIME}=在此地址（{ADMIN_ACTION_IP}）登录。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;如本次操作并非经由您本人，请尽快修改密码。&lt;br /&gt;以防安全信息泄露。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SYSTEM_COMPANYNAME}&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590385212,1594344604),(26,'admin','【管理员】产品无法解除停用状态','Admin_Product_Suspension_Faild','[系统]产品无法解除停用状态','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[系统]产品无法解除停用状态&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;管理员{ADMIN_ACCOUNT_NAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;用户{USERNAME}已在{INVOICE_PAID_TIME}（时间）为其欠费停用的主机（{HOSTNAME}）缴纳足额续订费用。&lt;br /&gt;但服务器重启失败，无法恢复正常状态。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;请立刻协助客户进行解决。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,1590385247,1594367441),(83,'invoice','账单退款提醒','Refund_Confirmation','[{SYSTEM_COMPANYNAME}]账单退款','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]退款至余额&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;订单#{ORDER_ID}，金额{ORDER_TOTAL_FEE}已退款33333333333&lt;/span&gt;&lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','1',0,0,'','','',0,0,1593406962),(84,'product','云服务器开通邮件','ZJMF_Cloud_Product_Welcome','[{SYSTEM_COMPANYNAME}]您购买的{PRODUCT_NAME}产品已开通，感谢使用！','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]您购买的{PRODUCT_NAME}产品已开通，感谢使用！&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt; 您购买的产品{PRODUCT_NAME}({HOSTNAME})现已开通，感谢使用。以下为该产品的详细信息，请务必妥善保管。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;IP地址：{PRODUCT_MAINIP}&lt;br /&gt;操作系统用户名：{PRODUCT_USER}&lt;br /&gt;操作系统密码： {PRODUCT_PASSWD}&lt;br /&gt;操作系统：{PRODUCT_DCIMBMS_OS}&lt;br /&gt;其他附加IP地址：{PRODUCT_ADDONIP}&lt;br /&gt;购买时间：{PRODUCT_FIRST_TIME}&lt;br /&gt;到期时间：{PRODUCT_END_TIME}&lt;br /&gt;付款周期：{PRODUCT_BINLLY_CYCLE}&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-f amily: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SYSTEM_COMPANYNAME}&lt;/span&gt; &lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','yourEmail@xx.com',0,0,'','','',0,1590063131,1595474404),(112,'product','未实名暂停提示','Uncertify_Reminder','{SYSTEM_COMPANYNAME}产品因未实名被暂停，实名后将重新开启','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]您购买的{PRODUCT_NAME}产品因未实名被暂停，实名后将重新开启&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的{PRODUCT_NAME}（{HOSTNAME}）由于未完成实名认 证的缘故，现已被暂停所有功能。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-bl ock; margin-top: 60px;&quot;&gt;如需恢复使用，请尽快进行实名认证，否则产品将会在{PRODUCT_END_TIME}日自动删除 。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; fo nt-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; te xt-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;','','','',0,0,'','','',0,1605678336,1605678543),(113,'invoice','信用额账单已生成','Credit_Invoice','{SYSTEM_COMPANYNAME}信用额账单已生成','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]信用额账单待支付&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您有一笔信用额账单已产生，账单号#{INVOICE_ID}，金额{INVOICE_TOTAL_FEE}。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;为了避免所关联产品被暂停，请您及时付款。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;',NULL,'顺戴财务4444','',0,0,'','','',0,1610433971,1610434047),(114,'product','信用额账单未支付暂停产品','Credit_Service_Suspension','{SYSTEM_COMPANYNAME}信用额账单未支付暂停产品','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]信用额账单未支付，产品停用&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您购买的{PRODUCT_NAME}（{HOSTNAME}）由于未在有效期 内支付信用额账单，现已被暂停所有功能。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; displa y: inline-block; margin-top: 60px;&quot;&gt;如需恢复使用，请尽快支付，否则产品将会在{PRODUCT_END_TIME}日自动删除。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba P uHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;mar gin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;',NULL,'顺戴财务4444','',0,0,'','','',0,1610435527,1610435587),(115,'invoice','信用额账单逾期提醒','Credit_Invoice_Reminder','{SYSTEM_COMPANYNAME}信用额账单逾期提醒','&lt;!DOCTYPE html&gt;\n&lt;html lang=&quot;en&quot;&gt;\n&lt;head&gt;\n  &lt;meta charset=&quot;UTF-8&quot;&gt;\n  &lt;meta http-equiv=&quot;X-UA-Compatible&quot; content=&quot;IE=edge&quot;&gt;\n  &lt;meta name=&quot;viewport&quot; content=&quot;width=device-width, initial-scale=1.0&quot;&gt;\n  &lt;title&gt;Document&lt;/title&gt;\n  &lt;style&gt;\n    li{list-style: none;}\n    a{text-decoration: none;}\n    body{margin: 0;}\n\n    .box{\n      background-color: #EBEBEB;\n      height: 100%;\n    }\n    .logo_top {padding: 20px 0;}\n    .logo_top img{\n      display: block;\n      width: auto;\n      margin: 0 auto;\n    }\n    .card{\n      width: 650px;\n      margin: 0 auto;\n      background-color: white;\n      font-size: 0.8rem;\n      line-height: 22px;\n      padding: 40px 50px;\n      box-sizing: border-box;\n    }\n    .contimg{\n      text-align: center;\n    }\n    button{\n      background-color: #F75697;\n      padding: 8px 16px;\n      border-radius: 6px;\n      outline: none;\n      color: white;\n      border: 0;\n    }\n    .lvst{\n      color: #57AC80;\n    }\n    .banquan{\n      display: flex;\n      justify-content: center;\n      flex-wrap: nowrap;\n      color: #B7B8B9;\n      font-size: 0.4rem;\n      padding: 20px 0;\n      margin: 0;\n      padding-left: 0;\n    }\n    .banquan li span{\n      display: inline-block;\n      padding: 0 8px;\n    }\n    @media (max-width: 650px){\n      .card{\n        padding: 5% 5%;\n      }\n      .logo_top img,.contimg img{width: 280px;}\n      .box{height: auto;}\n      .card{width: auto;}\n    }\n    @media (max-width: 280px){.logo_top img,.contimg img{width: 100%;}}\n  &lt;/style&gt;\n&lt;/head&gt;\n&lt;body&gt;\n&lt;div class=&quot;box&quot;&gt;\n&lt;div class=&quot;logo_top&quot;&gt;&lt;img src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\n&lt;div class=&quot;card&quot;&gt;\n&lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]信用额账单逾期提醒&lt;/h2&gt;\n&lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt; &lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您有一笔信用额账单#{INVOICE_ID}，金额{INVOICE_TOTAL_FEE}逾期未支付，现已被暂停相关产品所有功能。&lt;br /&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;如需恢复使用，请尽快支付，否则所关联的产品将会被删除。&lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt; &lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt; &lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt; &lt;/span&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\n&lt;ul class=&quot;banquan&quot;&gt;\n&lt;li&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\n&lt;/ul&gt;\n&lt;/div&gt;\n&lt;/body&gt;\n&lt;/html&gt;',NULL,'顺戴财务4444','',0,0,'','','',0,1610436260,1610436821),(116,'product','解除暂停提醒(用户)','Resume_Use','[{SYSTEM_COMPANYNAME}]解除暂停成功，谢谢支持','&lt;!DOCTYPE html&gt;\r\n                        &lt;html&gt;\r\n                        &lt;head&gt;\r\n                        &lt;/head&gt;\r\n                        &lt;body&gt;\r\n                        &lt;p&gt;&amp;nbsp;&lt;/p&gt;\r\n                        &lt;div class=&quot;logo_top&quot; style=&quot;padding: 20px 0px;&quot;&gt;&lt;img style=&quot;display: block; width: auto; margin: 0px auto;&quot; src=&quot;{SYSTEM_EMAIL_LOGO_URL}&quot; alt=&quot;&quot; /&gt;&lt;/div&gt;\r\n                        &lt;div class=&quot;card&quot; style=&quot;width: 650px; margin: 0px auto; font-size: 0.8rem; line-height: 22px; padding: 40px 50px; box-sizing: border-box;&quot;&gt;\r\n                        &lt;h2 style=&quot;text-align: center;&quot;&gt;{SYSTEM_COMPANYNAME}[{SYSTEM_COMPANYNAME}]续费成功，谢谢支持&lt;/h2&gt;\r\n                        &lt;br /&gt;&lt;strong&gt;尊敬的用户{USERNAME}&lt;/strong&gt;&lt;br /&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 55px;&quot;&gt;您拥有的产品&lt;span style=&quot;font-size: 12.8px;&quot;&gt;（{PRODUCT_NAME}）&lt;/span&gt;现已解除暂停恢复正常使用,感谢您的支持!&lt;/span&gt;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; margin-top: 60px;&quot;&gt;感谢您对我们的信赖！&lt;/span&gt;&lt;/div&gt;\r\n                        &lt;div class=&quot;card&quot; style=&quot;width: 650px; margin: 0px auto; font-size: 0.8rem; line-height: 22px; padding: 40px 50px; box-sizing: border-box;&quot;&gt;&lt;br /&gt;&lt;span style=&quot;margin: 0; padding: 0; color: #303133; font-family: &#039;Alibaba PuHuiTi&#039;; font-size: 16px;&quot;&gt;&amp;nbsp;&lt;/span&gt;&amp;nbsp;&lt;span style=&quot;margin: 0; padding: 0; display: inline-block; width: 100%; text-align: right;&quot;&gt;&lt;strong&gt;{SYSTEM_COMPANYNAME}&lt;/strong&gt;&lt;/span&gt;&lt;span style=&quot;margin: 0; padding: 0; margin-top: 20px; display: inline-block; width: 100%; text-align: right;&quot;&gt;{SEND_TIME}&lt;/span&gt;&lt;/div&gt;\r\n                        &lt;ul class=&quot;banquan&quot; style=&quot;display: flex; justify-content: center; flex-wrap: nowrap; color: #b7b8b9; font-size: 0.4rem; padding: 20px 0px; margin: 0px;&quot;&gt;\r\n                        &lt;li style=&quot;list-style: none;&quot;&gt;{SYSTEM_COMPANYNAME}&lt;/li&gt;\r\n                        &lt;/ul&gt;\r\n                        &lt;/body&gt;\r\n                        &lt;/html&gt;',NULL,'','',0,0,'',NULL,NULL,0,1758904564,0);
/*!40000 ALTER TABLE `shd_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_evaluation`
--

DROP TABLE IF EXISTS `shd_evaluation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_evaluation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论',
  `type` varchar(20) NOT NULL DEFAULT '' COMMENT '关联类型(products:产品)',
  `rid` int(11) NOT NULL DEFAULT '0' COMMENT '关联id',
  `eid` int(11) NOT NULL DEFAULT '0' COMMENT '上级评论id',
  `aid` int(11) NOT NULL DEFAULT '0' COMMENT '回复评论id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `content` text COMMENT '内容',
  `score` float NOT NULL DEFAULT '0' COMMENT '评分',
  `like_num` int(11) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:未审核1:审核通过2:审核未通过3:已删除',
  `reason` varchar(100) NOT NULL DEFAULT '' COMMENT '驳回原因',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_evaluation`
--

LOCK TABLES `shd_evaluation` WRITE;
/*!40000 ALTER TABLE `shd_evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_evaluation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_evaluation_like`
--

DROP TABLE IF EXISTS `shd_evaluation_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_evaluation_like` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论点赞',
  `eid` int(11) NOT NULL DEFAULT '0' COMMENT '评论id',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_evaluation_like`
--

LOCK TABLES `shd_evaluation_like` WRITE;
/*!40000 ALTER TABLE `shd_evaluation_like` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_evaluation_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_express`
--

DROP TABLE IF EXISTS `shd_express`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_express` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '快递ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '快递名称',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_express`
--

LOCK TABLES `shd_express` WRITE;
/*!40000 ALTER TABLE `shd_express` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_express` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_friendly_links`
--

DROP TABLE IF EXISTS `shd_friendly_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_friendly_links` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '',
  `domain` varchar(128) NOT NULL DEFAULT '',
  `link_tag` varchar(255) NOT NULL DEFAULT '',
  `is_open` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_friendly_links`
--

LOCK TABLES `shd_friendly_links` WRITE;
/*!40000 ALTER TABLE `shd_friendly_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_friendly_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_hook`
--

DROP TABLE IF EXISTS `shd_hook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_hook` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '钩子类型(1:系统钩子;2:应用钩子;3:模板钩子;4:后台模板钩子)',
  `once` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否只允许一个插件运行(0:多个;1:一个)',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子',
  `app` varchar(15) NOT NULL DEFAULT '' COMMENT '应用名(只有应用钩子才用)',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统钩子表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_hook`
--

LOCK TABLES `shd_hook` WRITE;
/*!40000 ALTER TABLE `shd_hook` DISABLE KEYS */;
INSERT INTO `shd_hook` VALUES (1,2,1,'后台首页界面','admin_index_index_view','admin','后台首页界面'),(2,2,1,'后台模板设计界面','admin_theme_design_view','admin','后台模板设计界面'),(3,2,1,'后台设置网站信息界面','admin_setting_site_view','admin','后台设置网站信息界面'),(4,2,1,'后台清除缓存界面','admin_setting_clear_cache_view','admin','后台清除缓存界面'),(5,2,1,'后台导航管理界面','admin_nav_index_view','admin','后台导航管理界面'),(6,2,1,'后台友情链接管理界面','admin_link_index_view','admin','后台友情链接管理界面'),(7,2,1,'后台幻灯片管理界面','admin_slide_index_view','admin','后台幻灯片管理界面'),(8,2,1,'后台幻灯片页面列表界面','admin_slide_item_index_view','admin','后台幻灯片页面列表界面'),(9,2,1,'后台幻灯片页面添加界面','admin_slide_item_add_view','admin','后台幻灯片页面添加界面'),(10,2,1,'后台幻灯片页面编辑界面','admin_slide_item_edit_view','admin','后台幻灯片页面编辑界面'),(11,2,1,'后台管理员列表界面','admin_user_index_view','admin','后台管理员列表界面'),(12,2,1,'后台管理员添加界面','admin_user_add_view','admin','后台管理员添加界面'),(13,2,1,'后台管理员编辑界面','admin_user_edit_view','admin','后台管理员编辑界面'),(14,2,1,'后台角色管理界面','admin_rbac_index_view','admin','后台角色管理界面'),(15,2,1,'后台角色添加界面','admin_rbac_role_add_view','admin','后台角色添加界面'),(16,2,1,'后台角色编辑界面','admin_rbac_role_edit_view','admin','后台角色编辑界面'),(17,2,1,'后台角色授权界面','admin_rbac_authorize_view','admin','后台角色授权界面'),(18,2,1,'后台回收站界面','admin_recycle_bin_index_view','admin','后台回收站界面'),(19,2,1,'后台菜单管理界面','admin_menu_index_view','admin','后台菜单管理界面'),(20,2,1,'后台自定义登录是否开启钩子','admin_custom_login_open','admin','后台自定义登录是否开启钩子'),(21,2,0,'前台用户行为日志','home_user_action_log_add','home','前台用户行为日志'),(22,2,0,'阿里国际支付','global_alipay_handle','home','阿里国际支付'),(23,2,0,'前台用户行为日志','user_test','home','前台用户行为日志'),(24,2,0,'微信支付','wxpay_handle','home','微信支付'),(25,2,0,'微信国际支付','global_wxpay_handle','home','微信国际支付');
/*!40000 ALTER TABLE `shd_hook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_hook_plugin`
--

DROP TABLE IF EXISTS `shd_hook_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_hook_plugin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `hook` varchar(50) NOT NULL DEFAULT '' COMMENT '钩子名',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件',
  `module` varchar(25) NOT NULL DEFAULT 'addons' COMMENT '插件钩子所属模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='系统钩子插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_hook_plugin`
--

LOCK TABLES `shd_hook_plugin` WRITE;
/*!40000 ALTER TABLE `shd_hook_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_hook_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_host`
--

DROP TABLE IF EXISTS `shd_host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_host` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `orderid` int(10) NOT NULL DEFAULT '0' COMMENT '订单id',
  `productid` int(10) NOT NULL DEFAULT '0' COMMENT '产品id',
  `serverid` int(10) NOT NULL DEFAULT '0' COMMENT '服务器id',
  `regdate` int(10) NOT NULL DEFAULT '0' COMMENT '开通时间',
  `domain` varchar(255) NOT NULL DEFAULT '' COMMENT '主机名',
  `payment` varchar(50) NOT NULL DEFAULT '' COMMENT '支付方式',
  `firstpaymentamount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '首付金额',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '续费金额',
  `billingcycle` text COMMENT '付款周期',
  `last_settle` int(10) NOT NULL DEFAULT '0' COMMENT '上次结算时间，用于周期为小时/天',
  `nextduedate` int(10) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `nextinvoicedate` int(10) NOT NULL DEFAULT '0' COMMENT '下次生成账单时间',
  `termination_date` int(10) NOT NULL DEFAULT '0' COMMENT '终止日期',
  `completed_date` int(10) NOT NULL DEFAULT '0' COMMENT '完成时间',
  `domainstatus` enum('Pending','Active','Suspended','Cancelled','Fraud','Completed','Deleted','Verifiy_Active','Overdue_Active','Issue_Active') NOT NULL DEFAULT 'Pending' COMMENT '状态',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `notes` text COMMENT '备注',
  `subscriptionid` text COMMENT '订阅编号',
  `promoid` int(10) NOT NULL DEFAULT '0' COMMENT '优惠码id',
  `suspendreason` text COMMENT '暂停原因',
  `overideautosuspend` tinyint(1) NOT NULL DEFAULT '0' COMMENT '修改暂停时间',
  `overidesuspenduntil` int(10) NOT NULL DEFAULT '0' COMMENT '不要暂停直至',
  `dedicatedip` text COMMENT '独立ip地址',
  `assignedips` text COMMENT '分配的ip地址',
  `ns1` varchar(255) NOT NULL DEFAULT '' COMMENT '域名服务器1',
  `ns2` varchar(255) NOT NULL DEFAULT '' COMMENT '域名服务器2',
  `diskusage` int(10) NOT NULL DEFAULT '0',
  `disklimit` int(10) NOT NULL DEFAULT '0',
  `bwusage` decimal(10,2) NOT NULL DEFAULT '0.00',
  `bwlimit` int(10) NOT NULL DEFAULT '0',
  `user_cate_id` int(10) NOT NULL DEFAULT '0' COMMENT '用户分类显示使用id',
  `lastupdate` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) NOT NULL DEFAULT '0',
  `suspend_time` int(10) NOT NULL DEFAULT '0' COMMENT '暂停时间',
  `auto_terminate_end_cycle` tinyint(1) NOT NULL DEFAULT '0' COMMENT '到期后自动删除',
  `auto_terminate_reason` text COMMENT '自动删除原因',
  `dcimid` int(11) NOT NULL DEFAULT '0' COMMENT 'dcimID',
  `dcim_os` int(11) NOT NULL DEFAULT '0' COMMENT 'dcim操作系统ID,用于自动开通',
  `os` varchar(255) NOT NULL DEFAULT '' COMMENT '显示的操作系统',
  `os_url` varchar(255) NOT NULL DEFAULT '' COMMENT '操作系统图标地址',
  `reinstall_info` varchar(255) NOT NULL DEFAULT '' COMMENT '重装次数记录',
  `remark` text,
  `show_last_act_message` tinyint(3) NOT NULL DEFAULT '1' COMMENT '是否显示上次执行结果',
  `port` int(11) NOT NULL DEFAULT '0' COMMENT '端口',
  `dcim_area` int(10) NOT NULL DEFAULT '0' COMMENT 'DCIM机房ID',
  `flag` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否有折扣',
  `flag_cycle` varchar(255) NOT NULL DEFAULT '' COMMENT '是否有折扣',
  `stream_info` varchar(255) NOT NULL DEFAULT '' COMMENT '代理信息',
  `initiative_renew` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否自动续费',
  `percent_value` decimal(10,2) NOT NULL DEFAULT '120.00' COMMENT '购买该商品时的上游价格百分比',
  `agent_client` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否代理商客户购买',
  `upstream_cost` varchar(25) NOT NULL DEFAULT '' COMMENT '上游成本,存文本',
  `upstream_configoption` text COMMENT '上游配置：比如v10,json格式',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `serviceid` (`id`) USING BTREE,
  KEY `userid` (`uid`) USING BTREE,
  KEY `orderid` (`orderid`) USING BTREE,
  KEY `productid` (`productid`) USING BTREE,
  KEY `serverid` (`serverid`) USING BTREE,
  KEY `domain` (`domain`(64)) USING BTREE,
  KEY `domainstatus` (`domainstatus`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_host`
--

LOCK TABLES `shd_host` WRITE;
/*!40000 ALTER TABLE `shd_host` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_host_category`
--

DROP TABLE IF EXISTS `shd_host_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_host_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `default` int(1) NOT NULL DEFAULT '0' COMMENT '是否为默认分类',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_host_category`
--

LOCK TABLES `shd_host_category` WRITE;
/*!40000 ALTER TABLE `shd_host_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_host_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_host_config_options`
--

DROP TABLE IF EXISTS `shd_host_config_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_host_config_options` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `relid` int(10) NOT NULL DEFAULT '0' COMMENT '产品id',
  `configid` int(10) NOT NULL DEFAULT '0' COMMENT '配置id',
  `optionid` int(10) NOT NULL DEFAULT '0' COMMENT 'sub配置id',
  `qty` int(10) NOT NULL DEFAULT '0' COMMENT '滑条的值',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `relid_configid` (`relid`,`configid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_host_config_options`
--

LOCK TABLES `shd_host_config_options` WRITE;
/*!40000 ALTER TABLE `shd_host_config_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_host_config_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_info_notice`
--

DROP TABLE IF EXISTS `shd_info_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_info_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `relid` int(11) NOT NULL DEFAULT '0' COMMENT '关联ID,若type=product,relid就是产品ID',
  `type` varchar(20) DEFAULT 'product' COMMENT '通知类型:product产品相关通知,',
  `info` text COMMENT '通知消息',
  `create_time` int(11) DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) DEFAULT '0' COMMENT '更新时间',
  `admin` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否后台通知消息,1默认后台，0前台',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `relid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_info_notice`
--

LOCK TABLES `shd_info_notice` WRITE;
/*!40000 ALTER TABLE `shd_info_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_info_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_invoice_items`
--

DROP TABLE IF EXISTS `shd_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_invoice_items` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) NOT NULL DEFAULT '0' COMMENT '发票id',
  `uid` int(10) NOT NULL DEFAULT '0',
  `type` varchar(30) NOT NULL DEFAULT '',
  `rel_id` int(10) NOT NULL DEFAULT '0' COMMENT 'host_id',
  `description` text,
  `description2` varchar(5000) NOT NULL DEFAULT '' COMMENT '前台账单内页描述',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `taxed` int(1) NOT NULL DEFAULT '0' COMMENT '税金',
  `due_time` int(11) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `payment` varchar(20) NOT NULL DEFAULT '' COMMENT '支付类型',
  `notes` text COMMENT '票据说明',
  `delete_time` int(10) NOT NULL DEFAULT '0',
  `aff_sure_time` int(11) DEFAULT NULL COMMENT '确认时间',
  `aff_commission` decimal(12,2) DEFAULT NULL COMMENT '佣金',
  `aff_commmission_bates` decimal(12,2) DEFAULT NULL COMMENT '佣金比例',
  `aff_commmission_bates_type` int(2) DEFAULT NULL COMMENT '1金额  2比例',
  `is_aff` int(255) DEFAULT '0' COMMENT '是否确认  1已确定',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `invoiceid` (`invoice_id`) USING BTREE,
  KEY `userid` (`uid`,`type`,`rel_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_invoice_items`
--

LOCK TABLES `shd_invoice_items` WRITE;
/*!40000 ALTER TABLE `shd_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_invoice_user_hide`
--

DROP TABLE IF EXISTS `shd_invoice_user_hide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_invoice_user_hide` (
  `uid` int(11) NOT NULL DEFAULT '0',
  `hide` varchar(255) DEFAULT NULL COMMENT '展示字段',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_invoice_user_hide`
--

LOCK TABLES `shd_invoice_user_hide` WRITE;
/*!40000 ALTER TABLE `shd_invoice_user_hide` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_invoice_user_hide` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_invoices`
--

DROP TABLE IF EXISTS `shd_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `invoice_num` text,
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '(date)',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `due_time` int(11) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `paid_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间(datepaid)',
  `last_capture_attempt` int(11) NOT NULL DEFAULT '0',
  `subtotal` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `credit` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `taxrate` decimal(10,2) NOT NULL DEFAULT '0.00',
  `taxrate2` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` text COMMENT 'Paid:已支付,Unpaid:未支付,Draft:已草稿,Overdue:已逾期,Cancelled:被取消,Refunded:已退款,Collections:已收藏',
  `payment` varchar(20) NOT NULL DEFAULT '' COMMENT '1微信支付,2微信国际支付,3支付宝支付,4支付宝国际支付',
  `notes` text,
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `due_email_times` tinyint(3) NOT NULL DEFAULT '0' COMMENT '已发送逾期提醒邮件次数',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '支付的产品类型:(recharge,product,renew)',
  `payment_status` varchar(50) NOT NULL DEFAULT '' COMMENT '支付接口回调支付状态',
  `aff_sure_time` int(11) DEFAULT NULL COMMENT '确认时间',
  `aff_commission` decimal(12,2) DEFAULT NULL COMMENT '佣金',
  `aff_commmission_bates` decimal(12,2) DEFAULT NULL COMMENT '佣金比例',
  `aff_commmission_bates_type` int(2) DEFAULT NULL COMMENT '1金额  2比例',
  `is_aff` int(255) DEFAULT '0' COMMENT '是否确认  1已确定',
  `is_cron` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自动任务：0否默认，1是',
  `suffix` int(11) NOT NULL DEFAULT '0' COMMENT '账单后缀',
  `use_credit_limit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:使用信用额',
  `invoice_id` int(11) NOT NULL DEFAULT '0' COMMENT '信用额关联账单',
  `url` varchar(200) NOT NULL DEFAULT '' COMMENT '账单支付后回跳地址',
  `paymt` varchar(16) NOT NULL DEFAULT '' COMMENT '优先弹窗的支付模式 | 信用额：credit_limit  其他方式都为余额弹框',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:标记删除',
  `credit_limit_prepayment` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:信用额提前还款',
  `credit_limit_prepayment_invoices` text COMMENT '提前还款的账单ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`uid`) USING BTREE,
  KEY `status` (`status`(3)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_invoices`
--

LOCK TABLES `shd_invoices` WRITE;
/*!40000 ALTER TABLE `shd_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_invoicesid_tmp`
--

DROP TABLE IF EXISTS `shd_invoicesid_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_invoicesid_tmp` (
  `original_invoicesid` int(10) NOT NULL DEFAULT '0',
  `old_invoicesid` int(10) NOT NULL DEFAULT '0',
  `new_invoicesid` int(10) NOT NULL DEFAULT '0',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_invoicesid_tmp`
--

LOCK TABLES `shd_invoicesid_tmp` WRITE;
/*!40000 ALTER TABLE `shd_invoicesid_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_invoicesid_tmp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_jobs`
--

DROP TABLE IF EXISTS `shd_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL DEFAULT '',
  `payload` longtext,
  `attempts` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reserved` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL DEFAULT '0',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_jobs`
--

LOCK TABLES `shd_jobs` WRITE;
/*!40000 ALTER TABLE `shd_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_knowledge_base`
--

DROP TABLE IF EXISTS `shd_knowledge_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_knowledge_base` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID：1篇文章可以在多个种类里',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `article` text COMMENT '内容',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '查看次数',
  `useful` int(11) NOT NULL DEFAULT '0' COMMENT '点赞次数',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否隐藏:0默认显示,1隐藏',
  `login_view` tinyint(1) NOT NULL DEFAULT '0' COMMENT '登录查看:0默认所有人都可以看，1登录才能查看',
  `host_view` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有激活产品才能查看:0默认所有人可看，1有激活产品才能查看',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_by` int(11) NOT NULL DEFAULT '0' COMMENT '创建人',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `public_by` varchar(50) NOT NULL DEFAULT '' COMMENT '发布人',
  `public_time` varchar(100) NOT NULL DEFAULT '' COMMENT '发布时间',
  `image` varchar(10000) NOT NULL DEFAULT '' COMMENT '富文本图片地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_knowledge_base`
--

LOCK TABLES `shd_knowledge_base` WRITE;
/*!40000 ALTER TABLE `shd_knowledge_base` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_knowledge_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_knowledge_base_cats`
--

DROP TABLE IF EXISTS `shd_knowledge_base_cats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_knowledge_base_cats` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `description` varchar(1000) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0显示默认，1隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_knowledge_base_cats`
--

LOCK TABLES `shd_knowledge_base_cats` WRITE;
/*!40000 ALTER TABLE `shd_knowledge_base_cats` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_knowledge_base_cats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_knowledge_base_links`
--

DROP TABLE IF EXISTS `shd_knowledge_base_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_knowledge_base_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL DEFAULT '0',
  `article_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `category_id` (`category_id`),
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_knowledge_base_links`
--

LOCK TABLES `shd_knowledge_base_links` WRITE;
/*!40000 ALTER TABLE `shd_knowledge_base_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_knowledge_base_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_knowledge_base_tags`
--

DROP TABLE IF EXISTS `shd_knowledge_base_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_knowledge_base_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `article_id` int(11) NOT NULL DEFAULT '0',
  `tag` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `article_id` (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_knowledge_base_tags`
--

LOCK TABLES `shd_knowledge_base_tags` WRITE;
/*!40000 ALTER TABLE `shd_knowledge_base_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_knowledge_base_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_menu`
--

DROP TABLE IF EXISTS `shd_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单类型 client会员中心,www官网',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_menu`
--

LOCK TABLES `shd_menu` WRITE;
/*!40000 ALTER TABLE `shd_menu` DISABLE KEYS */;
INSERT INTO `shd_menu` VALUES (1,'会员中心-默认会员中心','client');
/*!40000 ALTER TABLE `shd_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_menu_active`
--

DROP TABLE IF EXISTS `shd_menu_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_menu_active` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT 'client会员中心,www_top官网顶部,www_bottom官网底部',
  `menuid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_menu_active`
--

LOCK TABLES `shd_menu_active` WRITE;
/*!40000 ALTER TABLE `shd_menu_active` DISABLE KEYS */;
INSERT INTO `shd_menu_active` VALUES (1,'client',55),(2,'www_top',56),(3,'www_bottom',57);
/*!40000 ALTER TABLE `shd_menu_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_menus`
--

DROP TABLE IF EXISTS `shd_menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` int(1) NOT NULL DEFAULT '1' COMMENT '菜单类型',
  `nav_list` text NOT NULL COMMENT '菜单json串',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '激活状态',
  `sort` int(1) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_menus`
--

LOCK TABLES `shd_menus` WRITE;
/*!40000 ALTER TABLE `shd_menus` DISABLE KEYS */;
INSERT INTO `shd_menus` VALUES (55,'默认菜单(系统-多语言)',1,'[{\"id\":1,\"name\":\"\\u7528\\u6237\\u4e2d\\u5fc3\",\"url\":\"clientarea\",\"pid\":0,\"order\":84,\"fa_icon\":\"bx bx-home-circle\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u7528\\\\u6237\\\\u4e2d\\\\u5fc3\\\",\\\"chinese_tw\\\":\\\"\\\\u7528\\\\u6236\\\\u4e2d\\\\u5fc3\\\",\\\"english\\\":\\\"User Center\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":2,\"name\":\"\\u4ea7\\u54c1\\u4e0e\\u670d\\u52a1\",\"url\":\"\",\"pid\":0,\"order\":85,\"fa_icon\":\"bx bxs-grid-alt\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u4ea7\\\\u54c1\\\\u4e0e\\\\u670d\\\\u52a1\\\",\\\"chinese_tw\\\":\\\"\\\\u7522\\\\u54c1\\\\u8207\\\\u670d\\\\u52d9\\\",\\\"english\\\":\\\"products and services\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1,\"son\":[{\"id\":8,\"name\":\"\\u8ba2\\u8d2d\\u4ea7\\u54c1\",\"url\":\"cart\",\"pid\":2,\"order\":86,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u8ba2\\\\u8d2d\\\\u4ea7\\\\u54c1\\\",\\\"chinese_tw\\\":\\\"\\\\u8a02\\\\u8cfc\\\\u7522\\\\u54c1\\\",\\\"english\\\":\\\"Ordering Products\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"url\":\"\",\"name\":\"\\u4e91\\u670d\\u52a1\\u5668\",\"pid\":2,\"order\":87,\"fa_icon\":\"\",\"nav_type\":2,\"relid\":\"\",\"menuid\":0,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u4e91\\\\u670d\\\\u52a1\\\\u5668\\\",\\\"chinese_tw\\\":\\\"\\\\u96f2\\\\u670d\\\\u52d9\\\\u5668\\\",\\\"english\\\":\\\"Cloud\\\"}\",\"menu_type\":1,\"id\":305,\"muti\":1,\"senior\":0,\"templatePage\":\"service\",\"orderFuc\":1,\"is_custom\":0,\"orderFucUrl\":\"https:\\/\\/cloud.hfz.pw\\/cart\"},{\"url\":\"\",\"name\":\"\\u72ec\\u7acb\\u670d\\u52a1\\u5668\",\"pid\":2,\"order\":88,\"fa_icon\":\"\",\"nav_type\":2,\"relid\":\"\",\"menuid\":0,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u72ec\\\\u7acb\\\\u670d\\\\u52a1\\\\u5668\\\",\\\"chinese_tw\\\":\\\"\\\\u7368\\\\u7acb\\\\u670d\\\\u52d9\\\\u5668\\\",\\\"english\\\":\\\"Server\\\"}\",\"menu_type\":1,\"id\":306,\"muti\":1,\"senior\":0,\"templatePage\":\"service\",\"orderFuc\":1,\"is_custom\":0,\"orderFucUrl\":\"https:\\/\\/cloud.hfz.pw\\/cart\"},{\"url\":\"\",\"name\":\"\\u5176\\u4ed6\",\"pid\":2,\"order\":89,\"fa_icon\":\"\",\"nav_type\":2,\"relid\":\"\",\"menuid\":0,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5176\\\\u4ed6\\\",\\\"chinese_tw\\\":\\\"\\\\u5176\\\\u4ed6\\\",\\\"english\\\":\\\"Other\\\"}\",\"menu_type\":1,\"id\":307,\"muti\":1,\"senior\":0,\"templatePage\":\"service\",\"orderFuc\":1,\"is_custom\":0,\"orderFucUrl\":\"https:\\/\\/cloud.hfz.pw\\/cart\"}]},{\"id\":3,\"name\":\"\\u8d26\\u6237\\u7ba1\\u7406\",\"url\":\"\",\"pid\":0,\"order\":90,\"fa_icon\":\"bx bx-user\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u8d26\\\\u6237\\\\u7ba1\\\\u7406\\\",\\\"chinese_tw\\\":\\\"\\\\u8cec\\\\u6236\\\\u7ba1\\\\u7406\\\",\\\"english\\\":\\\"Account management\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1,\"son\":[{\"id\":12,\"name\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\",\"url\":\"details\",\"pid\":3,\"order\":91,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u4e2a\\\\u4eba\\\\u4fe1\\\\u606f\\\",\\\"chinese_tw\\\":\\\"\\\\u500b\\\\u4eba\\\\u4fe1\\\\u606f\\\",\\\"english\\\":\\\"Personal information\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":13,\"name\":\"\\u5b89\\u5168\\u4e2d\\u5fc3\",\"url\":\"security\",\"pid\":3,\"order\":92,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5b89\\\\u5168\\\\u4e2d\\\\u5fc3\\\",\\\"chinese_tw\\\":\\\"\\\\u5b89\\\\u5168\\\\u4e2d\\\\u5fc3\\\",\\\"english\\\":\\\"Security center\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":14,\"name\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"url\":\"verified\",\"pid\":3,\"order\":93,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5b9e\\\\u540d\\\\u8ba4\\\\u8bc1\\\",\\\"chinese_tw\\\":\\\"\\\\u5be6\\\\u540d\\\\u8a8d\\\\u8b49\\\",\\\"english\\\":\\\"Verified\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":15,\"name\":\"\\u6d88\\u606f\\u4e2d\\u5fc3\",\"url\":\"message\",\"pid\":3,\"order\":94,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u6d88\\\\u606f\\\\u4e2d\\\\u5fc3\\\",\\\"chinese_tw\\\":\\\"\\\\u6d88\\\\u606f\\\\u4e2d\\\\u5fc3\\\",\\\"english\\\":\\\"Message Center\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":17,\"name\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"url\":\"systemlog\",\"pid\":3,\"order\":95,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u7cfb\\\\u7edf\\\\u65e5\\\\u5fd7\\\",\\\"chinese_tw\\\":\\\"\\\\u7cfb\\\\u7d71\\\\u65e5\\\\u8a8c\\\",\\\"english\\\":\\\"System log\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":303,\"name\":\"API\\u7ba1\\u7406\",\"url\":\"apimanage\",\"pid\":3,\"order\":96,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"\",\"plugin\":\"\",\"menu_type\":1,\"muti\":0}]},{\"id\":4,\"name\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"url\":\"\",\"pid\":0,\"order\":97,\"fa_icon\":\"bx bx-dollar-circle\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u8d22\\\\u52a1\\\\u7ba1\\\\u7406\\\",\\\"chinese_tw\\\":\\\"\\\\u8ca1\\\\u52d9\\\\u7ba1\\\\u7406\\\",\\\"english\\\":\\\"Financial Management\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1,\"son\":[{\"id\":19,\"name\":\"\\u8d26\\u5355\\u5217\\u8868\",\"url\":\"billing\",\"pid\":4,\"order\":98,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u8d26\\\\u5355\\\\u5217\\\\u8868\\\",\\\"chinese_tw\\\":\\\"\\\\u8cec\\\\u55ae\\\\u5217\\\\u8868\\\",\\\"english\\\":\\\"Bill list\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":24,\"name\":\"\\u8d26\\u6237\\u5145\\u503c\",\"url\":\"addfunds\",\"pid\":4,\"order\":99,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u8d26\\\\u6237\\\\u5145\\\\u503c\\\",\\\"chinese_tw\\\":\\\"\\\\u8cec\\\\u6236\\\\u5145\\\\u503c\\\",\\\"english\\\":\\\"Account recharge\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":37,\"name\":\"\\u4fe1\\u7528\\u7ba1\\u7406\",\"url\":\"credit\",\"pid\":4,\"order\":100,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u4fe1\\\\u7528\\\\u7ba1\\\\u7406\\\",\\\"chinese_tw\\\":\\\"\\\\u4fe1\\\\u7528\\\\u7ba1\\\\u7406\\\",\\\"english\\\":\\\"Credit management\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":304,\"name\":\"\\u5408\\u540c\\u7ba1\\u7406\",\"url\":\"contract\",\"pid\":4,\"order\":101,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"\",\"plugin\":\"\",\"menu_type\":1,\"muti\":0},{\"id\":35,\"name\":\"\\u4ea4\\u6613\\u8bb0\\u5f55\",\"url\":\"transaction\",\"pid\":4,\"order\":102,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u4ea4\\\\u6613\\\\u8bb0\\\\u5f55\\\",\\\"chinese_tw\\\":\\\"\\\\u4ea4\\\\u6613\\\\u8a18\\\\u9304\\\",\\\"english\\\":\\\"Transaction Record\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":20,\"name\":\"\\u53d1\\u7968\\u7ba1\\u7406\",\"url\":\"\",\"pid\":4,\"order\":103,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u53d1\\\\u7968\\\\u7ba1\\\\u7406\\\",\\\"chinese_tw\\\":\\\"\\\\u767c\\\\u7968\\\\u7ba1\\\\u7406\\\",\\\"english\\\":\\\"Invoice management\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1,\"son\":[{\"id\":21,\"name\":\"\\u53d1\\u7968\\u5217\\u8868\",\"url\":\"invoicelist\",\"pid\":20,\"order\":104,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u53d1\\\\u7968\\\\u5217\\\\u8868\\\",\\\"chinese_tw\\\":\\\"\\\\u767c\\\\u7968\\\\u5217\\\\u8868\\\",\\\"english\\\":\\\"Invoice list\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":22,\"name\":\"\\u53d1\\u7968\\u62ac\\u5934\",\"url\":\"invoicecompany\",\"pid\":20,\"order\":105,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u53d1\\\\u7968\\\\u62ac\\\\u5934\\\",\\\"chinese_tw\\\":\\\"\\\\u767c\\\\u7968\\\\u62ac\\\\u982d\\\",\\\"english\\\":\\\"Invoice\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":23,\"name\":\"\\u6536\\u8d27\\u5730\\u5740\",\"url\":\"invoiceaddress\",\"pid\":20,\"order\":106,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u6536\\\\u8d27\\\\u5730\\\\u5740\\\",\\\"chinese_tw\\\":\\\"\\\\u6536\\\\u8ca8\\\\u5730\\\\u5740\\\",\\\"english\\\":\\\"Shipping address\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1}]}]},{\"id\":5,\"name\":\"\\u6280\\u672f\\u652f\\u6301\",\"url\":\"\",\"pid\":0,\"order\":107,\"fa_icon\":\"bx bx-detail\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u6280\\\\u672f\\\\u652f\\\\u6301\\\",\\\"chinese_tw\\\":\\\"\\\\u6280\\\\u8853\\\\u652f\\\\u6301\\\",\\\"english\\\":\\\"Technical Support\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1,\"son\":[{\"id\":25,\"name\":\"\\u5de5\\u5355\\u5217\\u8868\",\"url\":\"supporttickets\",\"pid\":5,\"order\":108,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5de5\\\\u5355\\\\u5217\\\\u8868\\\",\\\"chinese_tw\\\":\\\"\\\\u5de5\\\\u55ae\\\\u5217\\\\u8868\\\",\\\"english\\\":\\\"Work order list\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":26,\"name\":\"\\u63d0\\u4ea4\\u5de5\\u5355\",\"url\":\"submitticket\",\"pid\":5,\"order\":109,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u63d0\\\\u4ea4\\\\u5de5\\\\u5355\\\",\\\"chinese_tw\\\":\\\"\\\\u63d0\\\\u4ea4\\\\u5de5\\\\u55ae\\\",\\\"english\\\":\\\"Submit a work order\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":27,\"name\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\",\"url\":\"knowledgebase\",\"pid\":5,\"order\":110,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5e2e\\\\u52a9\\\\u4e2d\\\\u5fc3\\\",\\\"chinese_tw\\\":\\\"\\\\u5e6b\\\\u52a9\\\\u4e2d\\\\u5fc3\\\",\\\"english\\\":\\\"Help center\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":28,\"name\":\"\\u65b0\\u95fb\\u4e2d\\u5fc3\",\"url\":\"news\",\"pid\":5,\"order\":111,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u65b0\\\\u95fb\\\\u4e2d\\\\u5fc3\\\",\\\"chinese_tw\\\":\\\"\\\\u65b0\\\\u805e\\\\u4e2d\\\\u5fc3\\\",\\\"english\\\":\\\"News Center\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1},{\"id\":29,\"name\":\"\\u8d44\\u6e90\\u4e0b\\u8f7d\",\"url\":\"downloads\",\"pid\":5,\"order\":112,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u8d44\\\\u6e90\\\\u4e0b\\\\u8f7d\\\",\\\"chinese_tw\\\":\\\"\\\\u8cc7\\\\u6e90\\\\u4e0b\\\\u8f09\\\",\\\"english\\\":\\\"Download\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1}]},{\"id\":7,\"name\":\"\\u63a8\\u4ecb\\u8ba1\\u5212\",\"url\":\"affiliates\",\"pid\":0,\"order\":113,\"fa_icon\":\"bx bxs-paper-plane\",\"nav_type\":0,\"relid\":\"1\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u63a8\\\\u4ecb\\\\u8ba1\\\\u5212\\\",\\\"chinese_tw\\\":\\\"\\\\u63a8\\\\u4ecb\\\\u8a08\\\\u5283\\\",\\\"english\\\":\\\"Referral plan\\\"}\",\"plugin\":\"\",\"menu_type\":1,\"muti\":1}]',1,0),(56,'官网头部导航',2,'[{\"id\":308,\"name\":\"\\u9996\\u9875\",\"url\":\"index\",\"pid\":0,\"order\":0,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u9996\\\\u9875\\\",\\\"chinese_tw\\\":\\\"\\\\u9996\\\\u9801\\\",\\\"english\\\":\\\"home page\\\"}\",\"plugin\":\"\",\"menu_type\":2,\"muti\":1},{\"id\":309,\"name\":\"\\u4ea7\\u54c1\\u670d\\u52a1\",\"url\":\"\",\"pid\":0,\"order\":1,\"fa_icon\":\"\",\"nav_type\":1,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u4ea7\\\\u54c1\\\\u670d\\\\u52a1\\\",\\\"chinese_tw\\\":\\\"\\\\u7522\\\\u54c1\\\\u670d\\\\u52d9\\\",\\\"english\\\":\\\"Product service\\\"}\",\"plugin\":\"\",\"menu_type\":2,\"custom\":\"all\",\"muti\":1},{\"id\":310,\"name\":\"\\u670d\\u52a1\\u652f\\u6301\",\"url\":\"\",\"pid\":0,\"order\":2,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u670d\\\\u52a1\\\\u652f\\\\u6301\\\",\\\"chinese_tw\\\":\\\"\\\\u670d\\\\u52d9\\\\u652f\\\\u63f4\\\",\\\"english\\\":\\\"Service support\\\"}\",\"plugin\":\"\",\"menu_type\":2,\"muti\":1,\"son\":[{\"id\":311,\"name\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\",\"url\":\"help\",\"pid\":310,\"order\":3,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5e2e\\\\u52a9\\\\u4e2d\\\\u5fc3\\\",\\\"chinese_tw\\\":\\\"\\\\u5e6b\\\\u52a9\\\\u4e2d\\\\u5fc3\\\",\\\"english\\\":\\\"Help center\\\"}\",\"plugin\":\"\",\"menu_type\":2,\"muti\":1},{\"id\":312,\"name\":\"\\u7ba1\\u5bb6\\u670d\\u52a1\",\"url\":\"management\",\"pid\":310,\"order\":4,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"{\\\"chinese\\\":\\\"\\\\u7ba1\\\\u5bb6\\\\u670d\\\\u52a1\\\",\\\"chinese_tw\\\":\\\"\\\\u7ba1\\\\u5bb6\\\\u670d\\\\u52d9\\\",\\\"english\\\":\\\"butler service\\\"}\",\"menuid\":1,\"lang\":\"\",\"plugin\":\"\",\"menu_type\":2,\"muti\":0},{\"id\":313,\"name\":\"\\u65b0\\u95fb\\u8d44\\u8baf\",\"url\":\"news\",\"pid\":310,\"order\":5,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u65b0\\\\u95fb\\\\u8d44\\\\u8baf\\\",\\\"chinese_tw\\\":\\\"\\\\u65b0\\\\u805e\\\\u8cc7\\\\u8a0a\\\",\\\"english\\\":\\\"News information\\\"}\",\"plugin\":\"\",\"menu_type\":2,\"muti\":1}]},{\"id\":314,\"name\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"url\":\"about\",\"pid\":0,\"order\":6,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5173\\\\u4e8e\\\\u6211\\\\u4eec\\\",\\\"chinese_tw\\\":\\\"\\\\u95dc\\\\u65bc\\\\u6211\\\\u5011\\\",\\\"english\\\":\\\"About us\\\"}\",\"plugin\":\"\",\"menu_type\":2,\"muti\":1,\"son\":[{\"id\":315,\"name\":\"\\u8054\\u7cfb\\u6211\\u4eec\",\"url\":\"contact\",\"pid\":314,\"order\":7,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u8054\\\\u7cfb\\\\u6211\\\\u4eec\\\",\\\"chinese_tw\\\":\\\"\\\\u806f\\\\u7e6b\\\\u6211\\\\u5011\\\",\\\"english\\\":\\\"contact us\\\"}\",\"plugin\":\"\",\"menu_type\":2,\"muti\":1}]}]',1,0),(57,'官网底部导航',3,'[{\"id\":316,\"name\":\"\\u4e3b\\u8981\\u4ea7\\u54c1\",\"url\":\"\",\"pid\":0,\"order\":0,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u4e3b\\\\u8981\\\\u4ea7\\\\u54c1\\\",\\\"chinese_tw\\\":\\\"\\\\u4e3b\\\\u8981\\\\u7522\\\\u54c1\\\",\\\"english\\\":\\\"main products\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1,\"son\":[{\"id\":317,\"name\":\"\\u4e91\\u670d\\u52a1\\u5668\",\"url\":\"cloud\",\"pid\":316,\"order\":1,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u4e91\\\\u670d\\\\u52a1\\\\u5668\\\",\\\"chinese_tw\\\":\\\"\\\\u96f2\\\\u670d\\\\u52d9\\\\u5668\\\",\\\"english\\\":\\\"Cloud server\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1},{\"id\":318,\"name\":\"\\u72ec\\u7acb\\u670d\\u52a1\\u5668\",\"url\":\"server\",\"pid\":316,\"order\":2,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u72ec\\\\u7acb\\\\u670d\\\\u52a1\\\\u5668\\\",\\\"chinese_tw\\\":\\\"\\\\u7368\\\\u7acb\\\\u670d\\\\u52d9\\\\u5668\\\",\\\"english\\\":\\\"Stand alone server\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1},{\"id\":319,\"name\":\"SSL\\u8bc1\\u4e66\\u4ee3\\u529e\",\"url\":\"ssl\",\"pid\":316,\"order\":3,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"SSL\\\\u8bc1\\\\u4e66\\\\u4ee3\\\\u529e\\\",\\\"chinese_tw\\\":\\\"SSL\\\\u8b49\\\\u66f8\\\\u4ee3\\\\u8fa6\\\",\\\"english\\\":\\\"SSL certificate agent\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1}]},{\"id\":320,\"name\":\"\\u670d\\u52a1\\u652f\\u6301\",\"url\":\"\",\"pid\":0,\"order\":4,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u670d\\\\u52a1\\\\u652f\\\\u6301\\\",\\\"chinese_tw\\\":\\\"\\\\u670d\\\\u52d9\\\\u652f\\\\u63f4\\\",\\\"english\\\":\\\"Service support\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1,\"son\":[{\"id\":321,\"name\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\",\"url\":\"help\",\"pid\":320,\"order\":5,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5e2e\\\\u52a9\\\\u4e2d\\\\u5fc3\\\",\\\"chinese_tw\\\":\\\"\\\\u5e6b\\\\u52a9\\\\u4e2d\\\\u5fc3\\\",\\\"english\\\":\\\"Help center\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1},{\"id\":322,\"name\":\"\\u7ba1\\u5bb6\\u670d\\u52a1\",\"url\":\"management\",\"pid\":320,\"order\":6,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"{\\\"chinese\\\":\\\"\\\\u7ba1\\\\u5bb6\\\\u670d\\\\u52a1\\\",\\\"chinese_tw\\\":\\\"\\\\u7ba1\\\\u5bb6\\\\u670d\\\\u52d9\\\",\\\"english\\\":\\\"butler service\\\"}\",\"menuid\":1,\"lang\":\"\",\"plugin\":\"\",\"menu_type\":3,\"muti\":0},{\"id\":323,\"name\":\"\\u65b0\\u95fb\\u8d44\\u8baf\",\"url\":\"news\",\"pid\":320,\"order\":7,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u65b0\\\\u95fb\\\\u8d44\\\\u8baf\\\",\\\"chinese_tw\\\":\\\"\\\\u65b0\\\\u805e\\\\u8cc7\\\\u8a0a\\\",\\\"english\\\":\\\"News information\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1}]},{\"id\":324,\"name\":\"\\u5176\\u4ed6\",\"url\":\"\",\"pid\":0,\"order\":8,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5176\\\\u4ed6\\\",\\\"chinese_tw\\\":\\\"\\\\u5176\\\\u4ed6\\\",\\\"english\\\":\\\"other\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1,\"son\":[{\"id\":325,\"name\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"url\":\"about\",\"pid\":324,\"order\":9,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u5173\\\\u4e8e\\\\u6211\\\\u4eec\\\",\\\"chinese_tw\\\":\\\"\\\\u95dc\\\\u65bc\\\\u6211\\\\u5011\\\",\\\"english\\\":\\\"About us\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1},{\"id\":326,\"name\":\"\\u670d\\u52a1\\u6761\\u6b3e\",\"url\":\"tos\",\"pid\":324,\"order\":10,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u670d\\\\u52a1\\\\u6761\\\\u6b3e\\\",\\\"chinese_tw\\\":\\\"\\\\u670d\\\\u52d9\\\\u689d\\\\u6b3e\\\",\\\"english\\\":\\\"Terms of service\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1},{\"id\":327,\"name\":\"\\u9690\\u79c1\\u653f\\u7b56\",\"url\":\"privacy\",\"pid\":324,\"order\":11,\"fa_icon\":\"\",\"nav_type\":0,\"relid\":\"\",\"menuid\":1,\"lang\":\"{\\\"chinese\\\":\\\"\\\\u9690\\\\u79c1\\\\u653f\\\\u7b56\\\",\\\"chinese_tw\\\":\\\"\\\\u96b1\\\\u79c1\\\\u653f\\\\u7b56\\\",\\\"english\\\":\\\"Privacy policy\\\"}\",\"plugin\":\"\",\"menu_type\":3,\"muti\":1}]}]',1,0);
/*!40000 ALTER TABLE `shd_menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_message_log`
--

DROP TABLE IF EXISTS `shd_message_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_message_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `params` varchar(255) NOT NULL DEFAULT '',
  `phone_code` varchar(10) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `template_code` varchar(25) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `fail_reason` varchar(500) NOT NULL DEFAULT '' COMMENT '失败原因',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `is_admin` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否管理员：1是，0否默认',
  `is_wx` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否微信消息：1是，0否默认',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'ip',
  `port` varchar(32) DEFAULT '' COMMENT '端口号',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_message_log`
--

LOCK TABLES `shd_message_log` WRITE;
/*!40000 ALTER TABLE `shd_message_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_message_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_message_template`
--

DROP TABLE IF EXISTS `shd_message_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_message_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `template_id` varchar(64) NOT NULL DEFAULT '',
  `range_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0大陆，1非大陆',
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text COMMENT '阿里云的参数形式:${subject};赛邮的参数形式@var{subject}',
  `remark` varchar(200) NOT NULL DEFAULT '' COMMENT '备注',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未提交审核，1正在审核，2审核通过，3未通过审核',
  `sms_operator` varchar(50) NOT NULL DEFAULT '' COMMENT 'submail赛邮，aliyun阿里大鱼',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_message_template`
--

LOCK TABLES `shd_message_template` WRITE;
/*!40000 ALTER TABLE `shd_message_template` DISABLE KEYS */;
INSERT INTO `shd_message_template` VALUES (1,'',0,'账单支付','您好，您已成功支付账单号#@var(invoiceid)，账单金额@var(total)','账单支付',0,'submail',1588763490,0),(2,'',0,'发送验证码','您的验证码@var(code)，该验证码5分钟内有效，请勿泄漏于他人！','发送验证码',0,'submail',1588763490,0),(3,'',0,'账单支付逾期','您有一笔账单已过期，账单号@var(invoiceid)，金额@var(total)','账单支付逾期',0,'submail',1588764294,0),(4,'',0,'提交工单','您好，您主题为@var(subject)的工单正在处理中，还请耐心等待。','提交工单',0,'submail',1588764363,0),(5,'',0,'工单回复','您的工单@var(subject)有新的回复，请注意查收。','工单回复',0,'submail',1588764394,0),(6,'',0,'账单支付提醒','您好，@var(name)：您的账单#@var(invoiceid)，金额@var(total)即将失效，请及时处理','账单支付提醒',0,'submail',1588764469,0),(7,'',0,'注册成功提醒','您已成功注册@var(system_companyname)账号,感谢您的使用.请完善账号个人信息并妥善保管.切勿向他人透漏登录密码!','注册',0,'submail',1592205253,0),(8,'',0,'退款通知','订单@var(order_id),金额@var(order_total_fee)已退款','退款通知',0,'submail',1592208039,0),(9,'',0,'订单支付成功提醒','您的订单（编号@var(order_id)）已经完成付款,付款金额为：@var(order_total_fee)','订单支付成功提醒',0,'submail',1592208160,0),(10,'',0,'第二次产品到期续费提醒','您购买的产品@var(product_name)（主机名@var(hostname)）将于@var(product_end_time)到期.为了保证届时可以正常使用,请在产品到期之前先行续费','第二次产品到期续费提醒',0,'submail',1592208300,0),(11,'',0,'第一次续费提醒','您购买的产品@var(product_name)（主机名@var(hostname)）将于@var(product_end_time)到期.为了保证届时可以正常使用,请在产品到期之前先行续费','第一次续费提醒',0,'submail',1592209579,0),(12,'',0,'下单提醒','您已成功下单@var(product_name)产品,为期@var(product_binlly_cycle).请及时付款,以免订单失效.以下为账单信息产品名称:@var(product_name)产品单价:@var(product_price)付款周期:@var(product_binlly_cycle)订单创建时间:@var(order_create_time)','下单提醒',0,'submail',1592209957,0),(13,'',0,'续费成功提醒','您购买的产品（@var(product_name)）现已续费成功,服务将持续至@var(product_end_time).感谢您对我们的信赖!','续费成功提醒',0,'submail',1592210336,0),(14,'',0,'未续费暂停提醒','您购买的@var(product_name)（@var(hostname)）由于逾期未续费的缘故,现已被暂停所有功能.如需恢复使用，请尽快续费，否则产品将会在@var(product_end_time)日自动删除.','未续费暂停提醒',0,'submail',1592210476,0),(15,'',0,'工单开通提醒','我们已经收到您在@var(ticket_createtime)（时间）提交的工单:（@var(ticketnumber_tickettitle)）.团队将火速处理您的问题.请耐心等待.','工单开通提醒',0,'submail',1592210648,0),(16,'',0,'第一次支付未完成提醒','您在@var(product_first_time)订购的@var(product_name)产品(主机名：@var(hostname))支付尚未完成.暂时无法开通.为了避免订单过期,请您及时付款。','第一次支付未完成提醒',0,'submail',1592212054,0),(17,'',0,'第二次支付未完成提醒','您在@var(product_first_time)订购的@var(product_name)产品（主机名：@var(hostname)）支付尚未完成.暂时无法开通.为了避免订单过期,请您及时付款','第二次支付未完成提醒',0,'submail',1592212091,0),(18,'',0,'第三次支付未完成提醒','您在@var(product_first_time)订购的@var(product_name)产品(主机名:@var(hostname))支付尚未完成.暂时无法开通.为了避免订单过期,请您及时付款.','第三次支付未完成提醒',0,'submail',1592212179,0),(19,'',0,'删除产品','您购买的产品@var(product_name)(@var(hostname))由于未能在指定时间内续费,已于@var(product_terminate_time)自动删除,对因此而造成的不便我们表示歉意,希望您可以选择我们的其它产品.','删除产品',0,'submail',1592217913,0),(20,'',0,'产品开通','您购买的产品@var(product_name)现已开通,感谢使用!ip地址:@var(product_mainip),操作系统用户名:@var(product_user),操作系统密码:@var(product_passwd),操作系统:@var(product_dcimbms_os),其他附加ip地址:@var(product_addonip),购买时间:@var(product_first_time),到期时间:@var(product_end_time),付款周期:@var(product_binlly_cycle)','产品开通',0,'submail',1592218990,0),(21,'',0,'登录提醒','您好,您的账号@var(account)于@var(time)时间在以下@var(address)地址登录.如您未曾尝试登录,请立即更改登录密码,以防账号被盗.','登录提醒',0,'submail',1592274668,0),(22,'',0,'綁定提醒','您的账号@var(username)与此@var(epw_type):（@var(epw_account)）已成功进行绑定.如有疑问,请联系客服.','綁定提醒',0,'submail',1592278563,0),(23,'',0,'账单支付','您好，您已成功支付账单号#${invoiceid}，账单金额${total}。','账单支付',0,'aliyun',1588763490,0),(24,'',0,'发送认证号','您的认证号${code}，该认证信息5分钟内有效,请确认是本人操作，勿泄漏于他人.','发送认证号',0,'aliyun',1588763490,0),(25,'',0,'账单支付逾期','您有一笔账单已过期，账单号${invoiceid}，金额${total}，请及时关注。','账单支付逾期',0,'aliyun',1588764294,0),(26,'',0,'提交工单','您好，您主题为${subject}的工单正在处理中，还请耐心等待。','提交工单',0,'aliyun',1588764363,0),(27,'',0,'工单回复','您的工单${subject}有新的回复，请注意查收。','工单回复',0,'aliyun',1588764394,0),(28,'',0,'账单支付提醒','您好，${name}：您的账单#${invoiceid}，金额${total}即将失效，请及时处理','账单支付提醒',0,'aliyun',1588764469,0),(29,'',0,'注册成功提醒','您已成功注册${system_companyname}账号,感谢您的使用.请完善账号个人信息并妥善保管.切勿向他人透漏登录密码!','注册',0,'aliyun',1592205253,0),(30,'',0,'退款通知','订单${order_id},金额${order_total_fee}已退款','退款通知',0,'aliyun',1592208039,0),(31,'',0,'订单支付成功提醒','您的订单（编号${order_id}）已经完成付款,付款金额为：${order_total_fee}','订单支付成功提醒',0,'aliyun',1592208160,0),(32,'',0,'第二次产品到期续费提醒','您购买的产品${product_name}（主机名${hostname}）将于${product_end_time}到期.为了保证届时可以正常使用,请在产品到期之前先行续费','第二次产品到期续费提醒',0,'aliyun',1592208300,0),(33,'',0,'第一次续费提醒','您购买的产品${product_name}（主机名${hostname}）将于${product_end_time}到期.为了保证届时可以正常使用,请在产品到期之前先行续费','第一次续费提醒',0,'aliyun',1592209579,0),(34,'',0,'下单提醒','您已成功下单${product_name}产品,为期${product_binlly_cycle}.请及时付款,谢谢！','下单提醒',0,'aliyun',1592209957,0),(35,'',0,'续费成功提醒','您购买的产品（${product_name}）现已续费成功,服务将持续至${product_end_time}.感谢您对我们的信赖!','续费成功提醒',0,'aliyun',1592210336,0),(36,'',0,'未续费暂停提醒','您购买的产品：${product_name}，主机名（${hostname}）由于逾期未续费的缘故,现已被暂停所有功能.如需恢复使用，请尽快续费，否则产品将会在${product_end_time}日自动删除.','未续费暂停提醒',0,'aliyun',1592210476,0),(37,'',0,'工单开通提醒','我们已经收到您在${ticket_createtime}（时间）提交的工单:（${ticketnumber_tickettitle}）.团队将火速处理您的问题.请耐心等待.','工单开通提醒',0,'aliyun',1592210648,0),(38,'',0,'第一次支付未完成提醒','您在${product_first_time}订购的${product_name}产品(主机名：${hostname})支付尚未完成.暂时无法开通.为了避免订单过期,请您及时付款。','第一次支付未完成提醒',0,'aliyun',1592212054,0),(39,'',0,'第二次支付未完成提醒','您在${product_first_time}订购的${product_name}产品（主机名：${hostname}）支付尚未完成.暂时无法开通.为了避免订单过期,请您及时付款','第二次支付未完成提醒',0,'aliyun',1592212091,0),(40,'',0,'第三次支付未完成提醒','您在${product_first_time}订购的${product_name}产品(主机名:${hostname})支付尚未完成.暂时无法开通.为了避免订单过期,请您及时付款.','第三次支付未完成提醒',0,'aliyun',1592212179,0),(41,'',0,'删除产品','您购买的产品${product_name},主机名(${hostname})由于未能在指定时间内续费,已于${product_terminate_time}自动删除,对因此而造成的不便我们表示歉意,希望您可以选择我们的其它产品.','删除产品',0,'aliyun',1592217913,0),(42,'',0,'产品开通','您购买的产品${product_name}现已开通,感谢使用!购买时间:${product_first_time},到期时间:${product_end_time},付款周期:${product_binlly_cycle}','产品开通',0,'aliyun',1592218990,0),(43,'',0,'登录提醒','您好,您的账号${account}于${time}时间在以下${address}地址登录.如您未曾尝试登录,请立即更改登录密码,以防账号被盗.','登录提醒',0,'aliyun',1592274668,0),(44,'',0,'綁定提醒','您的账号${username}与此${epw_type}账号:（${epw_account}）已成功进行绑定.如有疑问,请联系客服.','綁定提醒',0,'aliyun',1592278563,0),(45,'',0,'未实名暂停产品','您购买的@var(product_name)（@var(hostname)）由于未实名认证的缘故,现已被暂停所有功能.如需恢复使用，请尽快进行实名认证，否则产品将会在@var(product_end_time)日自动删除.','未实名暂停产品',0,'submail',1605679231,0),(46,'',0,'未实名暂停产品','您购买的{product_name}（{hostname}）由于未实名认证的缘故,现已被暂停所有功能.如需恢复使用，请尽快进行实名认证，否则产品将会在{product_end_time}日自动删除.','未实名暂停产品',2,'smsbao',1605679348,0),(47,'',0,'未实名暂停产品','您购买的产品：${product_name}，主机名（${hostname}）由于为实名认证的缘故,现已被暂停所有功能.如需恢复使用，请尽快进行实名认证，否则产品将会在${product_end_time}日自动删除.','未实名暂停产品',0,'aliyun',1605679564,0),(48,'',0,'信用额账单提醒','您有一笔信用额账单产生:账单号#${invoiceid},金额${total},请及时付款，以免相关产品被暂停','信用额账单提醒',0,'aliyun',0,0),(49,'',0,'信用额账单提醒','您有一笔信用额账单产生:账单号#@var(invoiceid),金额@var(total),请及时付款，以免相关产品被暂停','信用额账单提醒',0,'submail',0,1616074614),(50,'',0,'信用额账单提醒','您有一笔信用额账单产生:账单号#{invoiceid},金额{total},请及时付款，以免相关产品被暂停','信用额账单提醒',0,'smsbao',0,0),(51,'',0,'信用额账单逾期提醒','您有一笔信用额账单#${invoiceid}，金额${total}逾期未支付，现已被暂停相关产品所有功能，请及时支付','信用额账单逾期提醒',0,'aliyun',0,0),(52,'',0,'信用额账单逾期提醒','您有一笔信用额账单#@var(invoiceid)，金额@var(total)逾期未支付，现已被暂停相关产品所有功能，请及时支付','信用额账单逾期提醒',0,'submail',0,1616070237),(53,'',0,'信用额账单逾期提醒','您有一笔信用额账单#{invoiceid}，金额{total}逾期未支付，现已被暂停相关产品所有功能，请及时支付','信用额账单逾期提醒',0,'smsbao',0,0),(54,'',0,'信用额账单未支付暂停产品','您购买的产品：${product_name}，主机名（${hostname}）由于未在有效期内支付信用额账单，现已被暂停所有功能.如需恢复使用，请尽快支付，否则产品将会在${product_end_time}日自动删除.','信用额账单未支付暂停产品',0,'aliyun',0,0),(55,'',0,'信用额账单未支付暂停产品','您购买的产品：@var(product_name)，主机名（@var(hostname)）由于未在有效期内支付信用额账单，现已被暂停所有功能.如需恢复使用，请尽快支付，否则产品将会在@var(product_end_time)日自动删除.','信用额账单未支付暂停产品',0,'submail',0,1616070239),(56,'',0,'信用额账单未支付暂停产品','您购买的产品：{product_name}，主机名（{hostname}）由于未在有效期内支付信用额账单，现已被暂停所有功能.如需恢复使用，请尽快支付，否则产品将会在{product_end_time}日自动删除.','信用额账单未支付暂停产品',0,'smsbao',0,0);
/*!40000 ALTER TABLE `shd_message_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_message_template_link`
--

DROP TABLE IF EXISTS `shd_message_template_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_message_template_link` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sms_temp_id` int(11) NOT NULL DEFAULT '0' COMMENT '短信模板ID',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '选中模板类型:1generated_invoice生成账单,2invoice_pay账单支付,3invoice_overdue_pay账单支付逾期,4submit_ticket提交工单,5ticket_reply工单回复,6host_suspend产品暂停提醒,7unpay_invoice未支付账单,8send_code发送验证码',
  `range_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0大陆，1非大陆',
  `sms_operator` varchar(20) NOT NULL DEFAULT '' COMMENT '短信运营商aliyun,submail',
  `is_use` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否启用',
  PRIMARY KEY (`id`),
  KEY ```type_range``` (`type`,`range_type`,`sms_operator`),
  KEY `sms_temp_id` (`sms_temp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1237 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_message_template_link`
--

LOCK TABLES `shd_message_template_link` WRITE;
/*!40000 ALTER TABLE `shd_message_template_link` DISABLE KEYS */;
INSERT INTO `shd_message_template_link` VALUES (1,1,2,0,'submail',1),(2,2,8,0,'submail',1),(3,3,3,0,'submail',1),(4,4,4,0,'submail',1),(5,5,5,0,'submail',1),(6,6,7,0,'submail',1),(7,7,33,0,'submail',1),(8,8,10,0,'submail',1),(9,9,13,0,'submail',0),(10,10,14,0,'submail',1),(11,11,15,0,'submail',1),(12,12,19,0,'submail',0),(13,13,27,0,'submail',1),(14,14,6,0,'submail',1),(15,15,31,0,'submail',1),(16,16,18,0,'submail',1),(17,17,17,0,'submail',1),(18,18,16,0,'submail',1),(19,19,26,0,'submail',1),(20,20,24,0,'submail',1),(21,21,9,0,'submail',1),(22,22,32,0,'submail',1),(23,23,2,0,'aliyun',1),(24,24,8,0,'aliyun',1),(25,25,3,0,'aliyun',1),(26,26,4,0,'aliyun',1),(27,27,5,0,'aliyun',1),(28,28,7,0,'aliyun',1),(29,29,33,0,'aliyun',1),(30,30,10,0,'aliyun',1),(31,31,13,0,'aliyun',0),(32,32,14,0,'aliyun',1),(33,33,18,0,'aliyun',1),(34,33,15,0,'aliyun',1),(35,34,19,0,'aliyun',0),(36,35,27,0,'aliyun',1),(37,36,6,0,'aliyun',1),(38,37,31,0,'aliyun',1),(39,39,17,0,'aliyun',1),(40,40,16,0,'aliyun',1),(41,41,26,0,'aliyun',1),(42,42,24,0,'aliyun',1),(43,43,9,0,'aliyun',1),(44,44,32,0,'aliyun',1),(1234,1367,28,0,'submail',1),(1235,1368,28,0,'smsbao',1),(1236,1369,28,0,'aliyun',1);
/*!40000 ALTER TABLE `shd_message_template_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_module_queue`
--

DROP TABLE IF EXISTS `shd_module_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_module_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `service_type` varchar(20) NOT NULL DEFAULT '',
  `service_id` int(10) unsigned NOT NULL DEFAULT '0',
  `module_name` varchar(64) NOT NULL DEFAULT '',
  `module_action` varchar(64) NOT NULL DEFAULT '',
  `last_attempt` int(11) NOT NULL DEFAULT '0',
  `last_attempt_error` text,
  `num_retries` smallint(5) unsigned NOT NULL DEFAULT '0',
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_module_queue`
--

LOCK TABLES `shd_module_queue` WRITE;
/*!40000 ALTER TABLE `shd_module_queue` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_module_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_nav`
--

DROP TABLE IF EXISTS `shd_nav`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上级id',
  `order` int(11) NOT NULL DEFAULT '0',
  `fa_icon` varchar(255) NOT NULL DEFAULT '',
  `nav_type` tinyint(7) NOT NULL DEFAULT '0' COMMENT '导航类型 0系统类型,1自定义页面,2产品中心',
  `relid` text NOT NULL COMMENT '关联的商品ID',
  `menuid` int(11) NOT NULL DEFAULT '0' COMMENT '菜单ID',
  `lang` text NOT NULL COMMENT '多语言',
  `plugin` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称:插件菜单,此值用于卸载时删除菜单',
  `menu_type` tinyint(7) NOT NULL DEFAULT '1' COMMENT '类型（这里的类型指的是哪里的菜单（会员和中心菜单，www头部菜单，底部菜单））',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `menuid` (`menuid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_nav`
--

LOCK TABLES `shd_nav` WRITE;
/*!40000 ALTER TABLE `shd_nav` DISABLE KEYS */;
INSERT INTO `shd_nav` VALUES (1,'用户中心','clientarea',0,0,'bx bx-home-circle',0,'1',1,'{\"chinese\":\"\\u7528\\u6237\\u4e2d\\u5fc3\",\"chinese_tw\":\"\\u7528\\u6236\\u4e2d\\u5fc3\",\"english\":\"User Center\"}','',1),(2,'产品与服务','',0,0,'bx bxs-grid-alt',0,'1',1,'{\"chinese\":\"\\u4ea7\\u54c1\\u4e0e\\u670d\\u52a1\",\"chinese_tw\":\"\\u7522\\u54c1\\u8207\\u670d\\u52d9\",\"english\":\"products and services\"}','',1),(3,'账户管理','',0,0,'bx bx-user',0,'1',1,'{\"chinese\":\"\\u8d26\\u6237\\u7ba1\\u7406\",\"chinese_tw\":\"\\u8cec\\u6236\\u7ba1\\u7406\",\"english\":\"Account management\"}','',1),(4,'财务管理','',0,0,'bx bx-dollar-circle',0,'1',1,'{\"chinese\":\"\\u8d22\\u52a1\\u7ba1\\u7406\",\"chinese_tw\":\"\\u8ca1\\u52d9\\u7ba1\\u7406\",\"english\":\"Financial Management\"}','',1),(5,'技术支持','',0,0,'bx bx-detail',0,'1',1,'{\"chinese\":\"\\u6280\\u672f\\u652f\\u6301\",\"chinese_tw\":\"\\u6280\\u8853\\u652f\\u6301\",\"english\":\"Technical Support\"}','',1),(7,'推介计划','affiliates',0,0,'bx bxs-paper-plane',0,'1',1,'{\"chinese\":\"\\u63a8\\u4ecb\\u8ba1\\u5212\",\"chinese_tw\":\"\\u63a8\\u4ecb\\u8a08\\u5283\",\"english\":\"Referral plan\"}','',1),(8,'订购产品','cart',2,0,'',0,'1',1,'{\"chinese\":\"\\u8ba2\\u8d2d\\u4ea7\\u54c1\",\"chinese_tw\":\"\\u8a02\\u8cfc\\u7522\\u54c1\",\"english\":\"Ordering Products\"}','',1),(12,'个人信息','details',3,0,'',0,'1',1,'{\"chinese\":\"\\u4e2a\\u4eba\\u4fe1\\u606f\",\"chinese_tw\":\"\\u500b\\u4eba\\u4fe1\\u606f\",\"english\":\"Personal information\"}','',1),(13,'安全中心','security',3,0,'',0,'1',1,'{\"chinese\":\"\\u5b89\\u5168\\u4e2d\\u5fc3\",\"chinese_tw\":\"\\u5b89\\u5168\\u4e2d\\u5fc3\",\"english\":\"Security center\"}','',1),(14,'实名认证','verified',3,0,'',0,'1',1,'{\"chinese\":\"\\u5b9e\\u540d\\u8ba4\\u8bc1\",\"chinese_tw\":\"\\u5be6\\u540d\\u8a8d\\u8b49\",\"english\":\"Verified\"}','',1),(15,'消息中心','message',3,0,'',0,'1',1,'{\"chinese\":\"\\u6d88\\u606f\\u4e2d\\u5fc3\",\"chinese_tw\":\"\\u6d88\\u606f\\u4e2d\\u5fc3\",\"english\":\"Message Center\"}','',1),(17,'系统日志','systemlog',3,0,'',0,'1',1,'{\"chinese\":\"\\u7cfb\\u7edf\\u65e5\\u5fd7\",\"chinese_tw\":\"\\u7cfb\\u7d71\\u65e5\\u8a8c\",\"english\":\"System log\"}','',1),(19,'账单列表','billing',4,0,'',0,'1',1,'{\"chinese\":\"\\u8d26\\u5355\\u5217\\u8868\",\"chinese_tw\":\"\\u8cec\\u55ae\\u5217\\u8868\",\"english\":\"Bill list\"}','',1),(20,'发票管理','',4,2,'',0,'1',1,'{\"chinese\":\"\\u53d1\\u7968\\u7ba1\\u7406\",\"chinese_tw\":\"\\u767c\\u7968\\u7ba1\\u7406\",\"english\":\"Invoice management\"}','',1),(21,'发票列表','invoicelist',20,0,'',0,'1',1,'{\"chinese\":\"\\u53d1\\u7968\\u5217\\u8868\",\"chinese_tw\":\"\\u767c\\u7968\\u5217\\u8868\",\"english\":\"Invoice list\"}','',1),(22,'发票抬头','invoicecompany',20,0,'',0,'1',1,'{\"chinese\":\"\\u53d1\\u7968\\u62ac\\u5934\",\"chinese_tw\":\"\\u767c\\u7968\\u62ac\\u982d\",\"english\":\"Invoice\"}','',1),(23,'收货地址','invoiceaddress',20,0,'',0,'1',1,'{\"chinese\":\"\\u6536\\u8d27\\u5730\\u5740\",\"chinese_tw\":\"\\u6536\\u8ca8\\u5730\\u5740\",\"english\":\"Shipping address\"}','',1),(24,'账户充值','addfunds',4,0,'',0,'1',1,'{\"chinese\":\"\\u8d26\\u6237\\u5145\\u503c\",\"chinese_tw\":\"\\u8cec\\u6236\\u5145\\u503c\",\"english\":\"Account recharge\"}','',1),(25,'工单列表','supporttickets',5,0,'',0,'1',1,'{\"chinese\":\"\\u5de5\\u5355\\u5217\\u8868\",\"chinese_tw\":\"\\u5de5\\u55ae\\u5217\\u8868\",\"english\":\"Work order list\"}','',1),(26,'提交工单','submitticket',5,0,'',0,'1',1,'{\"chinese\":\"\\u63d0\\u4ea4\\u5de5\\u5355\",\"chinese_tw\":\"\\u63d0\\u4ea4\\u5de5\\u55ae\",\"english\":\"Submit a work order\"}','',1),(27,'帮助中心','knowledgebase',5,0,'',0,'1',1,'{\"chinese\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\",\"chinese_tw\":\"\\u5e6b\\u52a9\\u4e2d\\u5fc3\",\"english\":\"Help center\"}','',1),(28,'新闻中心','news',5,0,'',0,'1',1,'{\"chinese\":\"\\u65b0\\u95fb\\u4e2d\\u5fc3\",\"chinese_tw\":\"\\u65b0\\u805e\\u4e2d\\u5fc3\",\"english\":\"News Center\"}','',1),(29,'资源下载','downloads',5,0,'',0,'1',1,'{\"chinese\":\"\\u8d44\\u6e90\\u4e0b\\u8f7d\",\"chinese_tw\":\"\\u8cc7\\u6e90\\u4e0b\\u8f09\",\"english\":\"Download\"}','',1),(35,'交易记录','transaction',4,1,'',0,'1',1,'{\"chinese\":\"\\u4ea4\\u6613\\u8bb0\\u5f55\",\"chinese_tw\":\"\\u4ea4\\u6613\\u8a18\\u9304\",\"english\":\"Transaction Record\"}','',1),(37,'信用管理','credit',4,0,'',0,'1',1,'{\"chinese\":\"\\u4fe1\\u7528\\u7ba1\\u7406\",\"chinese_tw\":\"\\u4fe1\\u7528\\u7ba1\\u7406\",\"english\":\"Credit management\"}','',1),(303,'API管理','apimanage',3,0,'',0,'1',1,'','',1),(304,'合同管理','contract',4,0,'',0,'1',1,'','',1),(305,'云服务器','service?groupid=305',2,0,'',2,'',0,'{\"chinese\":\"\\u4e91\\u670d\\u52a1\\u5668\",\"chinese_tw\":\"\\u96f2\\u670d\\u52d9\\u5668\",\"english\":\"Cloud\"}','',1),(306,'独立服务器','service?groupid=306',2,0,'',2,'',0,'{\"chinese\":\"\\u72ec\\u7acb\\u670d\\u52a1\\u5668\",\"chinese_tw\":\"\\u7368\\u7acb\\u670d\\u52d9\\u5668\",\"english\":\"Server\"}','',1),(307,'其他','service?groupid=307',2,0,'',2,'',0,'{\"chinese\":\"\\u5176\\u4ed6\",\"chinese_tw\":\"\\u5176\\u4ed6\",\"english\":\"Other\"}','',1),(308,'首页','index',0,0,'',0,'',1,'{\"chinese\":\"\\u9996\\u9875\",\"chinese_tw\":\"\\u9996\\u9801\",\"english\":\"home page\"}','',2),(309,'产品服务','',0,0,'',1,'',1,'{\"chinese\":\"\\u4ea7\\u54c1\\u670d\\u52a1\",\"chinese_tw\":\"\\u7522\\u54c1\\u670d\\u52d9\",\"english\":\"Product service\"}','',2),(310,'服务支持','',0,0,'',0,'',1,'{\"chinese\":\"\\u670d\\u52a1\\u652f\\u6301\",\"chinese_tw\":\"\\u670d\\u52d9\\u652f\\u63f4\",\"english\":\"Service support\"}','',2),(311,'帮助中心','help',310,0,'',0,'',1,'{\"chinese\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\",\"chinese_tw\":\"\\u5e6b\\u52a9\\u4e2d\\u5fc3\",\"english\":\"Help center\"}','',2),(312,'管家服务','management',310,0,'',0,'{\"chinese\":\"\\u7ba1\\u5bb6\\u670d\\u52a1\",\"chinese_tw\":\"\\u7ba1\\u5bb6\\u670d\\u52d9\",\"english\":\"butler service\"}',1,'','',2),(313,'新闻资讯','news',310,0,'',0,'',1,'{\"chinese\":\"\\u65b0\\u95fb\\u8d44\\u8baf\",\"chinese_tw\":\"\\u65b0\\u805e\\u8cc7\\u8a0a\",\"english\":\"News information\"}','',2),(314,'关于我们','about',0,0,'',0,'',1,'{\"chinese\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"chinese_tw\":\"\\u95dc\\u65bc\\u6211\\u5011\",\"english\":\"About us\"}','',2),(315,'联系我们','contact',314,0,'',0,'',1,'{\"chinese\":\"\\u8054\\u7cfb\\u6211\\u4eec\",\"chinese_tw\":\"\\u806f\\u7e6b\\u6211\\u5011\",\"english\":\"contact us\"}','',2),(316,'主要产品','',0,0,'',0,'',1,'{\"chinese\":\"\\u4e3b\\u8981\\u4ea7\\u54c1\",\"chinese_tw\":\"\\u4e3b\\u8981\\u7522\\u54c1\",\"english\":\"main products\"}','',3),(317,'云服务器','cloud',316,0,'',0,'',1,'{\"chinese\":\"\\u4e91\\u670d\\u52a1\\u5668\",\"chinese_tw\":\"\\u96f2\\u670d\\u52d9\\u5668\",\"english\":\"Cloud server\"}','',3),(318,'独立服务器','server',316,0,'',0,'',1,'{\"chinese\":\"\\u72ec\\u7acb\\u670d\\u52a1\\u5668\",\"chinese_tw\":\"\\u7368\\u7acb\\u670d\\u52d9\\u5668\",\"english\":\"Stand alone server\"}','',3),(319,'SSL证书代办','ssl',316,0,'',0,'',1,'{\"chinese\":\"SSL\\u8bc1\\u4e66\\u4ee3\\u529e\",\"chinese_tw\":\"SSL\\u8b49\\u66f8\\u4ee3\\u8fa6\",\"english\":\"SSL certificate agent\"}','',3),(320,'服务支持','',0,0,'',0,'',1,'{\"chinese\":\"\\u670d\\u52a1\\u652f\\u6301\",\"chinese_tw\":\"\\u670d\\u52d9\\u652f\\u63f4\",\"english\":\"Service support\"}','',3),(321,'帮助中心','help',320,0,'',0,'',1,'{\"chinese\":\"\\u5e2e\\u52a9\\u4e2d\\u5fc3\",\"chinese_tw\":\"\\u5e6b\\u52a9\\u4e2d\\u5fc3\",\"english\":\"Help center\"}','',3),(322,'管家服务','management',320,0,'',0,'{\"chinese\":\"\\u7ba1\\u5bb6\\u670d\\u52a1\",\"chinese_tw\":\"\\u7ba1\\u5bb6\\u670d\\u52d9\",\"english\":\"butler service\"}',1,'','',3),(323,'新闻资讯','news',320,0,'',0,'',1,'{\"chinese\":\"\\u65b0\\u95fb\\u8d44\\u8baf\",\"chinese_tw\":\"\\u65b0\\u805e\\u8cc7\\u8a0a\",\"english\":\"News information\"}','',3),(324,'其他','',0,0,'',0,'',1,'{\"chinese\":\"\\u5176\\u4ed6\",\"chinese_tw\":\"\\u5176\\u4ed6\",\"english\":\"other\"}','',3),(325,'关于我们','about',324,0,'',0,'',1,'{\"chinese\":\"\\u5173\\u4e8e\\u6211\\u4eec\",\"chinese_tw\":\"\\u95dc\\u65bc\\u6211\\u5011\",\"english\":\"About us\"}','',3),(326,'服务条款','tos',324,0,'',0,'',1,'{\"chinese\":\"\\u670d\\u52a1\\u6761\\u6b3e\",\"chinese_tw\":\"\\u670d\\u52d9\\u689d\\u6b3e\",\"english\":\"Terms of service\"}','',3),(327,'隐私政策','privacy',324,0,'',0,'',1,'{\"chinese\":\"\\u9690\\u79c1\\u653f\\u7b56\",\"chinese_tw\":\"\\u96b1\\u79c1\\u653f\\u7b56\",\"english\":\"Privacy policy\"}','',3);
/*!40000 ALTER TABLE `shd_nav` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_nav_group`
--

DROP TABLE IF EXISTS `shd_nav_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_nav_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(255) NOT NULL DEFAULT '' COMMENT '分组名',
  `fa_icon` varchar(255) NOT NULL DEFAULT '' COMMENT '图标',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_nav_group`
--

LOCK TABLES `shd_nav_group` WRITE;
/*!40000 ALTER TABLE `shd_nav_group` DISABLE KEYS */;
INSERT INTO `shd_nav_group` VALUES (1,'云服务器','el-icon-menu',0),(2,'独立服务器','el-icon-menu',0),(3,'其他','el-icon-menu',0);
/*!40000 ALTER TABLE `shd_nav_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_nav_group_user`
--

DROP TABLE IF EXISTS `shd_nav_group_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_nav_group_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `groupid` int(11) DEFAULT '0' COMMENT '分组id',
  `is_show` tinyint(11) DEFAULT '0' COMMENT '是否显示',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_nav_group_user`
--

LOCK TABLES `shd_nav_group_user` WRITE;
/*!40000 ALTER TABLE `shd_nav_group_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_nav_group_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_news`
--

DROP TABLE IF EXISTS `shd_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_news` (
  `relid` int(10) NOT NULL DEFAULT '0' COMMENT '关联的新闻id',
  `content` text COMMENT '内容',
  PRIMARY KEY (`relid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='新闻内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_news`
--

LOCK TABLES `shd_news` WRITE;
/*!40000 ALTER TABLE `shd_news` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_news_menu`
--

DROP TABLE IF EXISTS `shd_news_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_news_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) NOT NULL DEFAULT '0' COMMENT '编辑管理员id',
  `parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '父id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '展示图片',
  `read` int(10) NOT NULL DEFAULT '0' COMMENT '阅读量',
  `hidden` varchar(255) NOT NULL DEFAULT '' COMMENT '是否隐藏',
  `sort` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0',
  `push_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '发布时间',
  `label` text COMMENT '标签',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `push_time` (`push_time`),
  KEY `parent_id_hidden` (`hidden`,`parent_id`) USING BTREE,
  KEY `admin_id` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_news_menu`
--

LOCK TABLES `shd_news_menu` WRITE;
/*!40000 ALTER TABLE `shd_news_menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_news_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_news_type`
--

DROP TABLE IF EXISTS `shd_news_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_news_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `title` varchar(50) NOT NULL DEFAULT '0' COMMENT '父级名称',
  `sort` varchar(50) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0=禁用1=启用',
  `hidden` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏1=是0=否',
  `alias` varchar(100) NOT NULL DEFAULT '' COMMENT '别名',
  PRIMARY KEY (`id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_news_type`
--

LOCK TABLES `shd_news_type` WRITE;
/*!40000 ALTER TABLE `shd_news_type` DISABLE KEYS */;
INSERT INTO `shd_news_type` VALUES (1,0,'新闻公告','0',1,0,''),(2,0,'帮助中心','0',1,0,'');
/*!40000 ALTER TABLE `shd_news_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_option`
--

DROP TABLE IF EXISTS `shd_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_option` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `autoload` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否自动加载;1:自动加载;0:不自动加载',
  `option_name` varchar(64) NOT NULL DEFAULT '' COMMENT '配置名',
  `option_value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '配置值',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `option_name` (`option_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='全站配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_option`
--

LOCK TABLES `shd_option` WRITE;
/*!40000 ALTER TABLE `shd_option` DISABLE KEYS */;
INSERT INTO `shd_option` VALUES (1,1,'site_info','{\"site_name\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_title\":\"ThinkCMF\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"ThinkCMF\\u662f\\u7b80\\u7ea6\\u98ce\\u7f51\\u7edc\\u79d1\\u6280\\u53d1\\u5e03\\u7684\\u4e00\\u6b3e\\u7528\\u4e8e\\u5feb\\u901f\\u5f00\\u53d1\\u7684\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6\",\"site_icp\":\"\",\"site_gwa\":\"\",\"site_admin_email\":\"\",\"site_analytics\":\"\",\"company_name\":\"HFCloud\",\"domain\":\"https:\\/\\/cloud.hfz.pw\",\"admin_application\":\"Z5OtUlpd\"}'),(2,1,'cmf_settings','{\"open_registration\":\"0\",\"banned_usernames\":\"\"}'),(3,1,'cdn_settings','{\"cdn_static_root\":\"\"}'),(4,1,'admin_settings','{\"admin_password\":\"\",\"admin_theme\":\"admin_tpl\",\"admin_style\":\"simpleadmin\"}'),(5,1,'smtp_setting','{\"from_name\":\"wyh\",\"from\":\"12345@qq.com\",\"host\":\"smtp.qq.com\",\"smtp_secure\":\"ssl\",\"port\":\"465\",\"username\":\"1340863150@qq.com\",\"password\":\"\"}'),(6,1,'email_template_verification_code','{\"subject\":\"\\u9a8c\\u8bc1am\",\"template\":\"<p>\\u4f60\\u8bf7\\u6c42\\u7684\\u9a8c\\u8bc1\\u7801\\u4e3a{$code}<\\/p>\"}'),(7,1,'admin_dashboard_widgets','[{\"name\":\"CmfHub\",\"is_system\":1},{\"name\":\"Contributors\",\"is_system\":1},{\"name\":\"CmfDocuments\",\"is_system\":1},{\"name\":\"MainContributors\",\"is_system\":1},{\"name\":\"Custom1\",\"is_system\":1},{\"name\":\"Custom2\",\"is_system\":1},{\"name\":\"Custom3\",\"is_system\":1},{\"name\":\"Custom4\",\"is_system\":1},{\"name\":\"Custom5\",\"is_system\":1}]');
/*!40000 ALTER TABLE `shd_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_orders`
--

DROP TABLE IF EXISTS `shd_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `ordernum` varchar(100) NOT NULL DEFAULT '' COMMENT '订单号',
  `status` varchar(30) NOT NULL DEFAULT 'Pending' COMMENT '订单状态：Pending待审核，Active已激活，Completed已完成,Suspend已暂停,Terminated被删除,Cancelled被取消,Fraud有欺诈',
  `pay_time` int(11) NOT NULL DEFAULT '0' COMMENT '支付时间',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '订单总额',
  `payment` varchar(50) NOT NULL DEFAULT '' COMMENT '支付方式',
  `promo_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠码',
  `promo_type` varchar(30) NOT NULL DEFAULT '' COMMENT '优惠码类型',
  `promo_value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '优惠值',
  `invoiceid` int(10) NOT NULL DEFAULT '0' COMMENT '账单id',
  `delete_time` int(11) NOT NULL DEFAULT '0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_orders`
--

LOCK TABLES `shd_orders` WRITE;
/*!40000 ALTER TABLE `shd_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_pay_log`
--

DROP TABLE IF EXISTS `shd_pay_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_pay_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  `trans_id` int(11) NOT NULL DEFAULT '0' COMMENT '交易id',
  `payment` varchar(255) NOT NULL DEFAULT '' COMMENT '支付方式',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `currency` varchar(255) NOT NULL DEFAULT '' COMMENT '币种',
  `status` varchar(255) NOT NULL DEFAULT '' COMMENT '状态',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  `create_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_pay_log`
--

LOCK TABLES `shd_pay_log` WRITE;
/*!40000 ALTER TABLE `shd_pay_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_pay_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_payment_gateways`
--

DROP TABLE IF EXISTS `shd_payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_payment_gateways` (
  `gateway` text,
  `setting` text,
  `value` text,
  `order` int(1) NOT NULL DEFAULT '0',
  KEY `gateway_setting` (`gateway`(32),`setting`(32)) USING BTREE,
  KEY `setting_value` (`setting`(32),`value`(32)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_payment_gateways`
--

LOCK TABLES `shd_payment_gateways` WRITE;
/*!40000 ALTER TABLE `shd_payment_gateways` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_payment_gateways` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_plugin`
--

DROP TABLE IF EXISTS `shd_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '插件类型;1:网站;8:微信',
  `has_admin` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理,0:没有;1:有',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '状态;1:开启;0:禁用',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '插件标识名,英文字母(惟一)',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '插件名称',
  `url` text COMMENT '图标地址',
  `hooks` varchar(255) NOT NULL DEFAULT '' COMMENT '实现的钩子;以“,”分隔',
  `author` text COMMENT '作者',
  `author_url` text COMMENT '作者链接',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '插件版本号',
  `description` text COMMENT '插件描述',
  `config` text COMMENT '插件配置',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT '插件模块路径',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `help_url` varchar(2000) NOT NULL DEFAULT '' COMMENT '帮助文档',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='插件表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_plugin`
--

LOCK TABLES `shd_plugin` WRITE;
/*!40000 ALTER TABLE `shd_plugin` DISABLE KEYS */;
INSERT INTO `shd_plugin` VALUES (1,1,0,1,1590747921,'UserCustom','银行转账','','','顺戴网络','','1.0','银行转账','{\"module_name\":\"\\u94f6\\u884c\\u8f6c\\u8d26\",\"seller_id\":\"\\u5361\\u53f7\\uff1a12345678945612\"}','gateways',0,''),(2,1,0,1,0,'Smtp','Smtp',NULL,'','智简魔方',NULL,'1.0','Smtp','{\"charset\":\"utf-8\",\"port\":\"25\",\"host\":\"smtp.163.com\",\"username\":\"company@email.com\",\"password\":false,\"smtpsecure\":\"0\",\"fromname\":\"CompanyName\",\"systememail\":\"company@email.com\"}','mail',0,'');
/*!40000 ALTER TABLE `shd_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_pricing`
--

DROP TABLE IF EXISTS `shd_pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_pricing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` enum('product','addon','configoptions','domainregister','domaintransfer','domainrenew','domainaddons') NOT NULL COMMENT '产品价格类型',
  `currency` int(10) NOT NULL DEFAULT '0' COMMENT '货币ID',
  `relid` int(10) NOT NULL DEFAULT '0' COMMENT '父ID',
  `osetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '一次性初装费',
  `hsetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '周期小时初装费',
  `dsetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '周期天初装费',
  `ontrialfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '试用初装费',
  `msetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '周期月初装费',
  `qsetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '周期季度初装费',
  `ssetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '周期半年初装费',
  `asetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '周期年初装费',
  `bsetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '周期两年初装费',
  `tsetupfee` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '周期三年初装费',
  `foursetupfee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fivesetupfee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sixsetupfee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sevensetupfee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `eightsetupfee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ninesetupfee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tensetupfee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `onetime` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '一次性费用',
  `hour` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小时',
  `day` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '天',
  `ontrial` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '试用',
  `monthly` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '月',
  `quarterly` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '季度',
  `semiannually` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '半年',
  `annually` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '年',
  `biennially` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '两年',
  `triennially` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '三年',
  `fourly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fively` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sixly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `sevenly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `eightly` decimal(10,2) NOT NULL DEFAULT '0.00',
  `ninely` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tenly` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `typerelid` (`type`,`relid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_pricing`
--

LOCK TABLES `shd_pricing` WRITE;
/*!40000 ALTER TABLE `shd_pricing` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_config_groups`
--

DROP TABLE IF EXISTS `shd_product_config_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_config_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(50) NOT NULL DEFAULT '',
  `upstream_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应上游配置项组ID',
  `global` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否全局配置项组：1是，0否',
  PRIMARY KEY (`id`),
  KEY `upstream_id` (`upstream_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_config_groups`
--

LOCK TABLES `shd_product_config_groups` WRITE;
/*!40000 ALTER TABLE `shd_product_config_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_config_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_config_links`
--

DROP TABLE IF EXISTS `shd_product_config_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_config_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '配置组ID',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gpid` (`gid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_config_links`
--

LOCK TABLES `shd_product_config_links` WRITE;
/*!40000 ALTER TABLE `shd_product_config_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_config_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_config_options`
--

DROP TABLE IF EXISTS `shd_product_config_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_config_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `gid` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(500) NOT NULL DEFAULT '' COMMENT '可配置选项名称',
  `option_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配置类型：1Dropdown(默认)，2radio，3Yes/No，4quantity',
  `qty_minimum` int(11) NOT NULL DEFAULT '0' COMMENT 'quantity滑动拉条的最小值',
  `qty_maximum` int(11) NOT NULL DEFAULT '0' COMMENT 'quantity滑动拉条的最大值',
  `order` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0显示默认，1隐藏',
  `upgrade` int(11) NOT NULL DEFAULT '1' COMMENT '是否支持升降级',
  `upstream_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应上游配置项ID',
  `auto` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自动创建:1是(表示拉取上游数据)，0否默认(表示客户自定义)',
  `is_discount` tinyint(1) NOT NULL DEFAULT '1' COMMENT '折扣',
  `notes` varchar(5000) NOT NULL DEFAULT '' COMMENT '备注',
  `is_rebate` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否折扣',
  `qty_stage` int(11) NOT NULL DEFAULT '0' COMMENT '数量阶梯',
  `unit` varchar(255) NOT NULL DEFAULT '' COMMENT '单位',
  `senior` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否开启高级设置:1是，0否',
  `linkage_pid` int(11) NOT NULL DEFAULT '0',
  `linkage_top_pid` int(11) NOT NULL DEFAULT '0',
  `linkage_level` varchar(255) NOT NULL DEFAULT '0',
  `copy_id` int(11) NOT NULL DEFAULT '0' COMMENT '复制ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `productid` (`gid`,`hidden`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_config_options`
--

LOCK TABLES `shd_product_config_options` WRITE;
/*!40000 ALTER TABLE `shd_product_config_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_config_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_config_options_links`
--

DROP TABLE IF EXISTS `shd_product_config_options_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_config_options_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '高级配置项关联表',
  `config_id` int(11) NOT NULL DEFAULT '0' COMMENT '配置项ID',
  `sub_id` varchar(1024) NOT NULL DEFAULT '' COMMENT '子项ID,逗号分隔',
  `relation` varchar(25) NOT NULL DEFAULT '' COMMENT '条件:seq相等,sneq不等,用eq会出问题,关键字',
  `type` varchar(25) NOT NULL DEFAULT '' COMMENT '类型:condition条件,result结果',
  `relation_id` int(11) NOT NULL DEFAULT '0' COMMENT '条件ID',
  `upstream_id` int(11) NOT NULL DEFAULT '0' COMMENT '上游ID',
  PRIMARY KEY (`id`),
  KEY `config_id` (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_config_options_links`
--

LOCK TABLES `shd_product_config_options_links` WRITE;
/*!40000 ALTER TABLE `shd_product_config_options_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_config_options_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_config_options_sub`
--

DROP TABLE IF EXISTS `shd_product_config_options_sub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_config_options_sub` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `config_id` int(11) NOT NULL DEFAULT '0',
  `qty_minimum` int(11) NOT NULL DEFAULT '0',
  `qty_maximum` int(11) NOT NULL DEFAULT '0',
  `option_name` varchar(500) NOT NULL DEFAULT '',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0显示默认，1隐藏',
  `upstream_id` int(11) NOT NULL DEFAULT '0' COMMENT '对应上游配置项ID',
  `linkage_pid` int(11) NOT NULL DEFAULT '0',
  `linkage_top_pid` int(11) NOT NULL DEFAULT '0',
  `linkage_level` varchar(255) NOT NULL DEFAULT '0',
  `copy_id` int(11) NOT NULL DEFAULT '0' COMMENT '复制ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `configid` (`config_id`,`hidden`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_config_options_sub`
--

LOCK TABLES `shd_product_config_options_sub` WRITE;
/*!40000 ALTER TABLE `shd_product_config_options_sub` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_config_options_sub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_downloads`
--

DROP TABLE IF EXISTS `shd_product_downloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_downloads` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `download_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tblproduct_downloads_product_id_index` (`product_id`) USING BTREE,
  KEY `tblproduct_downloads_download_id_index` (`download_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_downloads`
--

LOCK TABLES `shd_product_downloads` WRITE;
/*!40000 ALTER TABLE `shd_product_downloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_downloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_first_groups`
--

DROP TABLE IF EXISTS `shd_product_first_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_first_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '一级组表ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '一级组名称',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认0，1：隐藏',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序，默认处理为添加自增长',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `is_upstream` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上游资源分组',
  `zjmf_api_id` int(11) NOT NULL DEFAULT '0' COMMENT '上游资源ID',
  PRIMARY KEY (`id`),
  KEY `order` (`order`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_first_groups`
--

LOCK TABLES `shd_product_first_groups` WRITE;
/*!40000 ALTER TABLE `shd_product_first_groups` DISABLE KEYS */;
INSERT INTO `shd_product_first_groups` VALUES (1,'默认分组',0,0,1603181353,1603181353,0,0);
/*!40000 ALTER TABLE `shd_product_first_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_first_groups_customfields`
--

DROP TABLE IF EXISTS `shd_product_first_groups_customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_first_groups_customfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `relid` int(11) NOT NULL DEFAULT '0' COMMENT '关联一级分组',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '值',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_first_groups_customfields`
--

LOCK TABLES `shd_product_first_groups_customfields` WRITE;
/*!40000 ALTER TABLE `shd_product_first_groups_customfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_first_groups_customfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_group_features`
--

DROP TABLE IF EXISTS `shd_product_group_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_group_features` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_group_id` int(11) NOT NULL DEFAULT '0',
  `feature` varchar(100) NOT NULL DEFAULT '',
  `order` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tblproduct_group_features_product_group_id_index` (`product_group_id`) USING BTREE,
  KEY `tblproduct_group_features_id_product_group_id_index` (`id`,`product_group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_group_features`
--

LOCK TABLES `shd_product_group_features` WRITE;
/*!40000 ALTER TABLE `shd_product_group_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_group_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_groups`
--

DROP TABLE IF EXISTS `shd_product_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品组表ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '产品组名称',
  `headline` varchar(100) NOT NULL DEFAULT '' COMMENT '产品组标题',
  `tagline` varchar(100) NOT NULL DEFAULT '' COMMENT '产品组标语',
  `order_frm_tpl` varchar(100) NOT NULL DEFAULT '' COMMENT 'uuid表示开发者应用，订购模板：为空时：使用系统默认，其他为订购模板名称',
  `disabled_gateways` varchar(255) NOT NULL DEFAULT '' COMMENT '隐藏的付款接口，以逗号分隔',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '默认0，1：隐藏',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序，默认处理为添加自增长',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '分类方式1=通用2=裸金属',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '修改时间',
  `gid` int(10) NOT NULL DEFAULT '0' COMMENT '一级组ID',
  `tpl_type` varchar(50) NOT NULL DEFAULT 'default' COMMENT '模板类型:default默认，custom自定义',
  `alias` varchar(100) NOT NULL DEFAULT '' COMMENT '别名',
  `is_upstream` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否上游资源',
  `zjfm_api_id` int(11) NOT NULL DEFAULT '0' COMMENT '接口id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `order` (`order`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_groups`
--

LOCK TABLES `shd_product_groups` WRITE;
/*!40000 ALTER TABLE `shd_product_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_groups_customfields`
--

DROP TABLE IF EXISTS `shd_product_groups_customfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_groups_customfields` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `relid` int(11) NOT NULL DEFAULT '0' COMMENT '关联商品分组',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '字段名称',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT '值',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `relid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_groups_customfields`
--

LOCK TABLES `shd_product_groups_customfields` WRITE;
/*!40000 ALTER TABLE `shd_product_groups_customfields` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_groups_customfields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_product_upgrade_products`
--

DROP TABLE IF EXISTS `shd_product_upgrade_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_product_upgrade_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `upgrade_product_id` int(11) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tblproduct_upgrade_products_product_id_index` (`product_id`) USING BTREE,
  KEY `tblproduct_upgrade_products_upgrade_product_id_index` (`upgrade_product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_product_upgrade_products`
--

LOCK TABLES `shd_product_upgrade_products` WRITE;
/*!40000 ALTER TABLE `shd_product_upgrade_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_product_upgrade_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_products`
--

DROP TABLE IF EXISTS `shd_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '产品表ID',
  `type` varchar(25) NOT NULL DEFAULT '' COMMENT '产品类型(shared hosting,reseller hosting,server/VPNS,other)',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '所属产品组ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '产品名称',
  `description` text COMMENT '产品描述',
  `host` varchar(1024) NOT NULL DEFAULT '' COMMENT '主机设置：host主机名,show是否显示主机名，modify是否允许修改主机名，rule规则',
  `is_domain` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否输入域名:1是，0否默认',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0显示默认，1隐藏',
  `password` varchar(1024) NOT NULL DEFAULT '' COMMENT '密码设置：password密码，show是否显示密码，modify是否允许修改密码，rule规则',
  `show_domain_options` tinyint(1) NOT NULL DEFAULT '0' COMMENT '显示域名配置(1:显示；0隐藏)',
  `welcome_email` int(11) NOT NULL DEFAULT '0' COMMENT '欢迎邮件(涉及邮件模板配置)默认为0',
  `stock_control` tinyint(1) NOT NULL DEFAULT '0' COMMENT '库存控制(1:启用)默认0',
  `qty` int(11) NOT NULL DEFAULT '0' COMMENT '库存数量(与stock_control有关)',
  `prorata_billing` tinyint(1) NOT NULL DEFAULT '0' COMMENT '自定义结算日期(1:启用)',
  `prorata_date` int(11) NOT NULL DEFAULT '0' COMMENT '结算日期(输入您希望从每月的几号开始结算费用)',
  `prorata_charge_next_month` int(11) NOT NULL DEFAULT '0' COMMENT '下月结算(输入从每月几号后订购的产品，将安排在下个月的账单中一起收费)',
  `pay_type` text COMMENT '付款类型(免费free，一次onetime，周期recurring，天:day，小时:hour，试用ontrial',
  `pay_method` enum('prepayment','postpaid') CHARACTER SET utf8 NOT NULL COMMENT '付费方式(预付费''prepayment'',''后付费：postpaid''，)',
  `allow_qty` int(1) NOT NULL DEFAULT '0' COMMENT '允许购买多个(1:选中复选框，如果客户在购买时，订购产品超过 1 个时，则允许客户自行指定（不需要单独配置）),默认0',
  `auto_setup` varchar(100) NOT NULL DEFAULT '' COMMENT '购买后动作设置(无：手动开通，on：手动审核通过后自动开通，payment：当收到客户首付款时自动开通，order：当客户下单之后（未付款）立即自动开通)，续费不考虑此情况？',
  `server_type` varchar(50) NOT NULL DEFAULT '' COMMENT '服务器模块类型',
  `server_group` int(11) NOT NULL DEFAULT '0' COMMENT '服务器组ID',
  `config_option1` varchar(500) NOT NULL DEFAULT '',
  `config_option2` varchar(500) NOT NULL DEFAULT '',
  `config_option3` varchar(500) NOT NULL DEFAULT '',
  `config_option4` varchar(500) NOT NULL DEFAULT '',
  `config_option5` varchar(500) NOT NULL DEFAULT '',
  `config_option6` varchar(500) NOT NULL DEFAULT '',
  `config_option7` varchar(500) NOT NULL DEFAULT '',
  `config_option8` varchar(500) NOT NULL DEFAULT '',
  `config_option9` varchar(500) NOT NULL DEFAULT '',
  `config_option10` varchar(500) NOT NULL DEFAULT '',
  `config_option11` varchar(500) NOT NULL DEFAULT '',
  `config_option12` varchar(500) NOT NULL DEFAULT '',
  `config_option13` varchar(500) NOT NULL DEFAULT '',
  `config_option14` varchar(500) NOT NULL DEFAULT '',
  `config_option15` varchar(500) NOT NULL DEFAULT '',
  `config_option16` varchar(500) NOT NULL DEFAULT '',
  `config_option17` varchar(500) NOT NULL DEFAULT '',
  `config_option18` varchar(500) NOT NULL DEFAULT '',
  `config_option19` varchar(500) NOT NULL DEFAULT '',
  `config_option20` varchar(500) NOT NULL DEFAULT '',
  `config_option21` varchar(500) NOT NULL DEFAULT '',
  `config_option22` varchar(500) NOT NULL DEFAULT '',
  `config_option23` varchar(500) NOT NULL DEFAULT '',
  `config_option24` varchar(500) NOT NULL DEFAULT '',
  `recurring_cycles` int(11) NOT NULL DEFAULT '0' COMMENT '循环周期限制(限制此产品仅循环固定的次数，输入账单的总数（0 为不限制）。)',
  `auto_terminate_days` int(11) NOT NULL DEFAULT '0' COMMENT '自动删除/固定周期(入您希望设置的天数 N，在产品开通后 N 天自动到期并删除相应产品账号。（可以作为产品试用时间、限时产品等等…）)',
  `auto_terminate_email` int(11) NOT NULL DEFAULT '0' COMMENT '自动终止邮件ID',
  `config_options_upgrade` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否升级可配置选项（）',
  `billing_cycle_upgrade` varchar(100) NOT NULL DEFAULT '' COMMENT '计费周期升级',
  `upgrade_email` int(11) NOT NULL DEFAULT '0' COMMENT '升降级邮件ID',
  `down_configoption_refund` tinyint(4) NOT NULL DEFAULT '0' COMMENT '降级是否可退款(1是，0否默认)',
  `overages_enabled` varchar(100) NOT NULL DEFAULT '' COMMENT '(格式1,MB,GB。对应启用超支账单，软限制磁盘使用单位，带宽单位)默认无',
  `overages_disk_limit` int(11) NOT NULL DEFAULT '0' COMMENT '磁盘使用限制（对应overages_enabled字段中的第二个参数）',
  `overages_bw_limit` int(11) NOT NULL DEFAULT '0' COMMENT '带宽使用限制(对应overages_enabled字段中的第三个参数)',
  `overages_disk_price` decimal(6,4) NOT NULL DEFAULT '0.0000' COMMENT '磁盘超支费用单价',
  `overages_bw_price` decimal(6,4) NOT NULL DEFAULT '0.0000' COMMENT '带宽超支费用单价',
  `tax` tinyint(1) NOT NULL DEFAULT '0' COMMENT '税(为1时需要收税)默认无',
  `affiliateonetime` tinyint(1) NOT NULL DEFAULT '0' COMMENT '一次性支付（1：一次性支付）默认为循环支付',
  `affiliate_pay_type` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义佣金设置（percentage：百分比，fixed：固定数额，none：无）默认根据推广设置。为空',
  `affiliate_pay_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额/百分比',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `retired` tinyint(1) NOT NULL DEFAULT '0' COMMENT '下架（选中复选框从管理区产品下拉菜单中隐藏（不适用于已用于此产品的服务））',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0' COMMENT '特性（在支持的订单上更加突出的显示此产品）',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `auto_create_config_options` tinyint(3) NOT NULL DEFAULT '0' COMMENT '0未创建 1已创建',
  `groupid` int(11) NOT NULL DEFAULT '0' COMMENT '分组id',
  `api_type` varchar(50) NOT NULL DEFAULT '' COMMENT '接口类型:zjmf_api(魔方财务api),manual(手动)，normal(通用),resource(资源池)',
  `location_version` int(11) NOT NULL DEFAULT '1' COMMENT '本地版本号',
  `upstream_version` int(11) NOT NULL DEFAULT '0' COMMENT '上游版本号',
  `upstream_price_type` varchar(20) NOT NULL DEFAULT 'percent' COMMENT '上游产品的价格类型：percent百分比,custom自定义金额',
  `upstream_price_value` decimal(10,2) NOT NULL DEFAULT '120.00' COMMENT 'percent百分比时的值',
  `zjmf_api_id` int(11) NOT NULL DEFAULT '0' COMMENT '魔方财务api的ID',
  `upstream_pid` int(11) NOT NULL DEFAULT '0' COMMENT '上游产品ID',
  `is_truename` tinyint(2) NOT NULL DEFAULT '0' COMMENT '是否需要实名',
  `uuid` text COMMENT '应用标识',
  `p_uid` int(11) NOT NULL DEFAULT '0' COMMENT '应用开发者',
  `rate` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '相对上游产品汇率',
  `clientscount` int(11) NOT NULL DEFAULT '0' COMMENT '单个用户购买数量-1不限制',
  `app_type` varchar(10) NOT NULL DEFAULT '' COMMENT '应用类型:addons插件，gateways支付接口，servers模块,systems官方应用',
  `product_shopping_url` text COMMENT '快速订购连接',
  `product_group_url` text COMMENT '产品组连接',
  `upper_reaches_id` int(11) NOT NULL DEFAULT '0' COMMENT '手动资源上游ID',
  `version_description` text COMMENT '版本描述',
  `app_version` text COMMENT '应用版本',
  `is_bind_phone` tinyint(4) NOT NULL DEFAULT '0' COMMENT '绑定手机',
  `app_hot_order` int(11) NOT NULL DEFAULT '0' COMMENT '热门应用排序',
  `app_hot_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:锁定热门应用排序',
  `app_hot_heat` int(11) NOT NULL DEFAULT '0' COMMENT '热度',
  `app_recommend_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:强烈推荐',
  `app_recommend_order` int(11) NOT NULL DEFAULT '0' COMMENT '强烈推荐排序',
  `app_recommend_lock` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:锁定强烈推荐排序',
  `app_pay_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1:免费应用',
  `app_score` float NOT NULL DEFAULT '0' COMMENT '应用评分',
  `app_images` text COMMENT '应用图片',
  `app_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '应用审核状态:2已驳回,1审核通过，0审核中',
  `upstream_qty` int(11) NOT NULL DEFAULT '0' COMMENT '上游库存',
  `upstream_product_shopping_url` text COMMENT '上游购物链接',
  `cancel_control` tinyint(1) NOT NULL DEFAULT '0' COMMENT '取消控制(1:启用)默认0',
  `unretired_time` int(11) NOT NULL DEFAULT '0' COMMENT '上架时间',
  `upstream_stock_control` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上游是否开启库存控制:1是，0否',
  `upstream_auto_setup` varchar(100) NOT NULL DEFAULT '' COMMENT '上游开通方式',
  `upstream_ontrial_status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '上游试用状态:1开启,0未开启',
  `upstream_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'v10价格',
  `upstream_cycle` varchar(25) NOT NULL DEFAULT '' COMMENT 'v10周期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gid` (`gid`) USING BTREE,
  KEY `type` (`type`),
  KEY `groupid` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_products`
--

LOCK TABLES `shd_products` WRITE;
/*!40000 ALTER TABLE `shd_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_promo_code`
--

DROP TABLE IF EXISTS `shd_promo_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_promo_code` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠码',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型 percent,fixed,override,free',
  `recurring` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否循环优惠',
  `value` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '价值',
  `cycles` text COMMENT '结算周期',
  `appliesto` text COMMENT '适用的产品id',
  `requires` text COMMENT '需要的产品id',
  `requires_exist` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否用于账户中的产品',
  `start_time` int(10) NOT NULL DEFAULT '0' COMMENT '开始时间',
  `expiration_time` int(10) NOT NULL DEFAULT '0' COMMENT '失效时间',
  `max_times` int(10) NOT NULL DEFAULT '0' COMMENT '最大使用次数',
  `used` int(10) NOT NULL DEFAULT '0' COMMENT '已使用次数',
  `lifelong` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否终身优惠',
  `one_time` tinyint(3) NOT NULL DEFAULT '0' COMMENT '是否一次性, 只能用于一个订单',
  `only_new_client` tinyint(3) NOT NULL DEFAULT '0' COMMENT '仅适用于新用户',
  `only_old_client` tinyint(3) NOT NULL DEFAULT '0' COMMENT '仅用于老客户',
  `once_per_client` tinyint(3) NOT NULL DEFAULT '0' COMMENT '每个用户只能用一次',
  `recurfor` int(3) NOT NULL DEFAULT '0' COMMENT '循环优惠执行次数',
  `upgrades` tinyint(3) NOT NULL DEFAULT '0' COMMENT '启用产品升级优惠',
  `upgrade_config` text COMMENT '升级降级配置',
  `notes` text COMMENT '备注',
  `is_discount` int(2) NOT NULL DEFAULT '1' COMMENT '是否与客户折扣一起使用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='优惠码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_promo_code`
--

LOCK TABLES `shd_promo_code` WRITE;
/*!40000 ALTER TABLE `shd_promo_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_promo_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_renew_cycle`
--

DROP TABLE IF EXISTS `shd_renew_cycle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_renew_cycle` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) NOT NULL DEFAULT '0',
  `type` enum('normal','cycle_to_mon_year') NOT NULL DEFAULT 'normal' COMMENT '类型',
  `relid` int(10) NOT NULL DEFAULT '0' COMMENT '子帐单id',
  `new_cycle` varchar(255) NOT NULL DEFAULT '' COMMENT '新周期',
  `new_recurring_amount` float(20,2) NOT NULL DEFAULT '0.00' COMMENT '新续费金额',
  `recurringchange` float(20,2) NOT NULL DEFAULT '0.00' COMMENT '周期切换的金额',
  `status` enum('Completed','Pending') NOT NULL DEFAULT 'Pending' COMMENT '状态完成或等待',
  `paid` enum('Y','N') NOT NULL DEFAULT 'N',
  `create_time` int(10) NOT NULL DEFAULT '0',
  `expire_time` int(10) NOT NULL DEFAULT '0',
  `delete_time` int(10) NOT NULL DEFAULT '0',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT 'v10周期：多少秒',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `relid` (`relid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_renew_cycle`
--

LOCK TABLES `shd_renew_cycle` WRITE;
/*!40000 ALTER TABLE `shd_renew_cycle` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_renew_cycle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_role`
--

DROP TABLE IF EXISTS `shd_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父角色ID',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态;0:禁用;1:正常',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `list_order` float NOT NULL DEFAULT '0' COMMENT '排序',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `auth_role` text COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parent_id` (`parent_id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_role`
--

LOCK TABLES `shd_role` WRITE;
/*!40000 ALTER TABLE `shd_role` DISABLE KEYS */;
INSERT INTO `shd_role` VALUES (1,0,1,1758904441,1758904441,0,'超级管理员','拥有网站最高管理员权限！','1,2,4,5,6,7,8,11,12,13,14,15,18,20,21,22,25,27,28,29,30,157,158,159,160,164,165,187,189,190,191,192,193,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,211,212,214,215,216,217,218,219,220,221,222,223,224,226,227,228,229,230,231,232,233,234,235,236,237,238,240,242,243,244,245,246,248,249,250,251,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,284,285,286,287,288,289,290,291,292,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,389,390,391,392,393,395,396,398,399,400,401,402,403,404,405,406,407,409,410,411,412,413,414,415,416,417,418,419,420,423,424,425,426,427,428,429,430,431,432,433,434,439,440,441,442,443,446,447,448,449,450,451,452,453,454,455,457,458,462,463,464,465,466,467,469,470,471,472,473,474,476,478,479,480,481,482,483,484,485,486,487,488,489,495,496,497,498,499,500,501,502,503,504,505,506,507,512,516,518,519,524,526,527,530,531,533,536,542,555,556,557,558,559,560,561,562,563,564,566,588,590,591,592,600,601,602,603,604,855,887,922,984,985,986,987,989,990,992,994,995,996,997,998,999,1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011,1012,1013,1014,1015,1016,1017,1018,1019,1020,1021,1035,1036,1037,1040,1041,1042,1043,1044,1045,1046,1047,1048,1049,1050,1051,1052,1053,1054,1055,1056,1057,1059,1060,1061,1062,1065,1066,1068,1069,1070,1174,1176,1177,1266,1267,1268,1269,1279,1280,1281,1282,1284,1285,1286,1287,1289,1290,1291,1292,1293,1294,1296,1297,1298,1299,1300,1302,1303,1305,1306,1307,1313,1316,1317,1318,1320,1321,1329,1330,1331,1332,1334,1335,1336,1337,1338,1339,1340,1341,1342,1343,1344,1346,1353,1354,1359,1360,1361,1362,1363,1364,1365,1366,1367,1368,1369,1370,1371,1372,1373,1374,1375,1376,1377,1378,1379,1380,1381,1382,1383,1384,1385,1386,1387,1388,1389,1391,1392,1393,1394,1395,1396,1397,1398,1399,1400,1401,1402,1403,1404,1405,1406,1407,1408,1409,1410,1412,1413,1414,1415,1416,1417,1418,1419,1420,1421,1422,1423,1424,1425,1426,1427,1428,1429,1430,1431,1432,1433,1434,1435,1436,1438,1439,1440,1441,1442,1443,1444,1445,1446,1447,1448,1449,1450,1451,1452,1453,1454,1455,1456,1457,1458,1459,1460,1461,1462,1463,1464,1465,1466,1467,1468,1469,1470,1471,1472,1473,1474,1475,1476,1477,1478,1479,1480,1481,1482,1483,1484,1485,1486,1489,1490,1491,1492,1493,1495,1496,1497,1498,1499,1500,1501,1502,1503,1504,1505,1506,1507,1590,1600,1601,1602,1603,1604,1605,1606,1607,1608,1609,1610,1611,1612,1613,1614,1615,1616,1617,1680,1681,1682,1683,1684,1686,1687,1688,1689,1690,1691,1692,1693,1695,1698,1699,1700,1701,1702,1703,1704,1705,1706,1707,1708,1709,1710,1711,1712,1713,1714,1715,1716,1717,1718,1719,1720,1721,1722,1723,1724,1725,1726,1727,1729,1731,1732,1733,1734,1735,1736,1737,1738,1739,1740,1741,1742,1743,1744,1745,1746,1747,1748,1749,1750,1751,1752,1753,1755,1756,1757,1758,1759,1760,1772,1773,1774,1776,1777,1778,1779,1780,1781,1783,1784,1785,1786,1787,1788,1789,1790,1791,1794,1795,1796,1797,1798,1799,1800,1801,1802,1803,1804,1805,1806,1807,1808,1809,1810,1811,1812,1813,1814,1815,1816,1817,1818,1819,1821,1822,1823,1824,1825,1826,1827,1828,1829,1831,1832,1833,1834,1835,1836,1837,1838,1839,1840,1841,1842,1843,1844,1845,1846,1847,1849,1850,1851,1852,1853,1854,1855,1857,3');
/*!40000 ALTER TABLE `shd_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_role_user`
--

DROP TABLE IF EXISTS `shd_role_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_role_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '角色 id',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `role_id` (`role_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='用户角色对应表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_role_user`
--

LOCK TABLES `shd_role_user` WRITE;
/*!40000 ALTER TABLE `shd_role_user` DISABLE KEYS */;
INSERT INTO `shd_role_user` VALUES (1,1,1);
/*!40000 ALTER TABLE `shd_role_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_run_croning`
--

DROP TABLE IF EXISTS `shd_run_croning`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_run_croning` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cron_type` int(11) NOT NULL DEFAULT '0' COMMENT '定时任务类型',
  `active_type` int(11) NOT NULL DEFAULT '0' COMMENT '对应队列操作类型id',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '执行状态',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `datetime` int(11) NOT NULL DEFAULT '0' COMMENT '时间范围YYYYMMDD',
  `unique_tab` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '任务唯一标识',
  PRIMARY KEY (`id`),
  KEY `sts_dat_unt_idx` (`status`,`datetime`,`unique_tab`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_run_croning`
--

LOCK TABLES `shd_run_croning` WRITE;
/*!40000 ALTER TABLE `shd_run_croning` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_run_croning` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_run_maping`
--

DROP TABLE IF EXISTS `shd_run_maping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_run_maping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '客户（产品拥有人）',
  `user` varchar(36) DEFAULT '' COMMENT '客户（产品拥有人）',
  `host_id` int(11) NOT NULL COMMENT '产品id',
  `description` varchar(320) DEFAULT '' COMMENT '描述（动作详情）',
  `from_type` int(11) DEFAULT NULL COMMENT '来源类型 （100定时任务、200手动任务、300异步触发、400对接上游、500下游发起）',
  `active_user` varchar(36) DEFAULT '' COMMENT '操作人 （Systeam、系统管理员、用户）',
  `active_type` int(11) NOT NULL COMMENT '操作类型（保存用于，发起重试时对应到操作方法 1开通、2暂停、3解除暂停、4删除、5续费、6升降级）',
  `active_type_param` text COMMENT '操作类型对应参数（保持重试，与首次发起的，请求情景一致性）',
  `status` tinyint(2) DEFAULT '0' COMMENT '状态 0 失败 1成功',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `last_execute_time` int(11) DEFAULT NULL COMMENT '最后执行时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_run_maping`
--

LOCK TABLES `shd_run_maping` WRITE;
/*!40000 ALTER TABLE `shd_run_maping` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_run_maping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_sale_ladder`
--

DROP TABLE IF EXISTS `shd_sale_ladder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_sale_ladder` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `turnover` int(10) DEFAULT '0' COMMENT '营业额',
  `bates` decimal(12,2) DEFAULT '0.00' COMMENT '提成比例',
  `is_flag` int(2) DEFAULT '0' COMMENT '是否开启  1开启  0  不开启',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_sale_ladder`
--

LOCK TABLES `shd_sale_ladder` WRITE;
/*!40000 ALTER TABLE `shd_sale_ladder` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_sale_ladder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_sale_products`
--

DROP TABLE IF EXISTS `shd_sale_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_sale_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0' COMMENT '产品id',
  `gid` int(10) DEFAULT '0' COMMENT '分组id',
  PRIMARY KEY (`id`),
  KEY `gpid` (`gid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_sale_products`
--

LOCK TABLES `shd_sale_products` WRITE;
/*!40000 ALTER TABLE `shd_sale_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_sale_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_sales_product_groups`
--

DROP TABLE IF EXISTS `shd_sales_product_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_sales_product_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL COMMENT '分组名',
  `bates` decimal(10,2) DEFAULT NULL COMMENT '提成比例',
  `is_renew` int(4) DEFAULT NULL COMMENT '是否包含续费计算',
  `updategrade` int(4) DEFAULT NULL COMMENT '是否计算升降级',
  `pids` text COMMENT '产品组列表',
  `renew_bates` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '续费比例',
  `upgrade_bates` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '升降级比例',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_sales_product_groups`
--

LOCK TABLES `shd_sales_product_groups` WRITE;
/*!40000 ALTER TABLE `shd_sales_product_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_sales_product_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_sendmsglimit`
--

DROP TABLE IF EXISTS `shd_sendmsglimit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_sendmsglimit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '手机',
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT 'ip',
  `time` varchar(255) NOT NULL DEFAULT '' COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_sendmsglimit`
--

LOCK TABLES `shd_sendmsglimit` WRITE;
/*!40000 ALTER TABLE `shd_sendmsglimit` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_sendmsglimit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_server_groups`
--

DROP TABLE IF EXISTS `shd_server_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_server_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '服务器组ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '组名称',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '服务器模块类型',
  `system_type` varchar(255) NOT NULL DEFAULT 'normal' COMMENT '组类型',
  `capacity` int(10) NOT NULL DEFAULT '0' COMMENT '最大接口容量',
  `mode` int(1) NOT NULL DEFAULT '1' COMMENT '分配方式（1：平均分配  2 满一个算一个）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_server_groups`
--

LOCK TABLES `shd_server_groups` WRITE;
/*!40000 ALTER TABLE `shd_server_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_server_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_server_groups_rel`
--

DROP TABLE IF EXISTS `shd_server_groups_rel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_server_groups_rel` (
  `group_id` int(11) DEFAULT NULL COMMENT '组ID',
  `server_id` int(11) DEFAULT NULL COMMENT '服务器ID'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_server_groups_rel`
--

LOCK TABLES `shd_server_groups_rel` WRITE;
/*!40000 ALTER TABLE `shd_server_groups_rel` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_server_groups_rel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_servers`
--

DROP TABLE IF EXISTS `shd_servers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_servers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '服务器配置ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '服务器组ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '名称',
  `ip_address` varchar(100) NOT NULL DEFAULT '' COMMENT 'ip地址',
  `assigned_ips` varchar(100) NOT NULL DEFAULT '' COMMENT '其他IP地址',
  `hostname` varchar(100) NOT NULL DEFAULT '' COMMENT '主机名',
  `monthly_cost` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '每月成本',
  `noc` varchar(100) NOT NULL DEFAULT '' COMMENT '数据中心',
  `status_address` varchar(100) NOT NULL DEFAULT '' COMMENT '服务器状态地址',
  `name_server1` varchar(100) NOT NULL DEFAULT '' COMMENT '主域名服务器',
  `name_server1_ip` varchar(100) NOT NULL DEFAULT '',
  `name_server2` varchar(100) NOT NULL DEFAULT '' COMMENT '次域名服务器',
  `name_server2_ip` varchar(100) NOT NULL DEFAULT '',
  `name_server3` varchar(100) NOT NULL DEFAULT '' COMMENT '第三域名服务器',
  `name_server3_ip` varchar(100) NOT NULL DEFAULT '',
  `name_server4` varchar(100) NOT NULL DEFAULT '' COMMENT '第四域名服务器',
  `name_server4_ip` varchar(100) NOT NULL DEFAULT '',
  `name_server5` varchar(100) NOT NULL DEFAULT '' COMMENT '第五域名服务器',
  `name_server5_ip` varchar(100) NOT NULL DEFAULT '',
  `max_accounts` int(11) NOT NULL DEFAULT '0' COMMENT '最大账号数量（默认为0）',
  `username` varchar(256) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(256) NOT NULL DEFAULT '' COMMENT '密码',
  `accesshash` varchar(256) NOT NULL DEFAULT '' COMMENT '访问散列值',
  `secure` tinyint(1) NOT NULL DEFAULT '0' COMMENT '安全，1:选中复选框使用 SSL 连接模式,0不选(默认)',
  `port` int(11) NOT NULL DEFAULT '0' COMMENT '访问端口',
  `active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1.当前模块类型激活的服务器(或默认服务器),0非默认',
  `disabled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1勾选禁用，0使用(默认)(单选框)',
  `server_type` varchar(255) NOT NULL DEFAULT 'normal' COMMENT '服务器类型',
  `link_status` tinyint(3) NOT NULL DEFAULT '1' COMMENT '服务器连接状态 0失败 1成功',
  `type` varchar(100) NOT NULL DEFAULT '' COMMENT '服务器模块类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gid` (`gid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_servers`
--

LOCK TABLES `shd_servers` WRITE;
/*!40000 ALTER TABLE `shd_servers` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_servers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_sms_country`
--

DROP TABLE IF EXISTS `shd_sms_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_sms_country` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `iso` varchar(80) NOT NULL DEFAULT '',
  `iso3` varchar(80) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `name_zh` varchar(80) NOT NULL DEFAULT '',
  `nicename` varchar(80) NOT NULL DEFAULT '',
  `num_code` smallint(6) NOT NULL DEFAULT '0',
  `phone_code` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=240 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_sms_country`
--

LOCK TABLES `shd_sms_country` WRITE;
/*!40000 ALTER TABLE `shd_sms_country` DISABLE KEYS */;
INSERT INTO `shd_sms_country` VALUES (1,'AF','AFG','AFGHANISTAN','阿富汗','Afghanistan',4,93),(2,'AL','ALB','ALBANIA','阿尔巴尼亚','Albania',8,355),(3,'DZ','DZA','ALGERIA','阿尔及利亚','Algeria',12,213),(4,'AS','ASM','AMERICAN SAMOA','美属萨摩亚','American Samoa',16,1684),(5,'AD','AND','ANDORRA','安道尔','Andorra',20,376),(6,'AO','AGO','ANGOLA','安哥拉','Angola',24,244),(7,'AI','AIA','ANGUILLA','安圭拉岛','Anguilla',660,1264),(8,'AQ','','ANTARCTICA','南极洲','Antarctica',0,0),(9,'AG','ATG','ANTIGUA AND BARBUDA','安提瓜岛和巴布达','Antigua and Barbuda',28,1268),(10,'AR','ARG','ARGENTINA','阿根廷','Argentina',32,54),(11,'AM','ARM','ARMENIA','亚美尼亚','Armenia',51,374),(12,'AW','ABW','ARUBA','阿鲁巴岛','Aruba',533,297),(13,'AU','AUS','AUSTRALIA','澳大利亚','Australia',36,61),(14,'AT','AUT','AUSTRIA','奥地利','Austria',40,43),(15,'AZ','AZE','AZERBAIJAN','阿塞拜疆','Azerbaijan',31,994),(16,'BS','BHS','BAHAMAS','巴哈马群岛','Bahamas',44,1242),(17,'BH','BHR','BAHRAIN','巴林','Bahrain',48,973),(18,'BD','BGD','BANGLADESH','孟加拉国','Bangladesh',50,880),(19,'BB','BRB','BARBADOS','巴巴多斯','Barbados',52,1246),(20,'BY','BLR','BELARUS','白俄罗斯','Belarus',112,375),(21,'BE','BEL','BELGIUM','比利时','Belgium',56,32),(22,'BZ','BLZ','BELIZE','伯利兹','Belize',84,501),(23,'BJ','BEN','BENIN','贝宁','Benin',204,229),(24,'BM','BMU','BERMUDA','百慕大','Bermuda',60,1441),(25,'BT','BTN','BHUTAN','不丹','Bhutan',64,975),(26,'BO','BOL','BOLIVIA','玻利维亚','Bolivia',68,591),(27,'BA','BIH','BOSNIA AND HERZEGOVINA','波斯尼亚和黑塞哥维那','Bosnia and Herzegovina',70,387),(28,'BW','BWA','BOTSWANA','博茨瓦纳','Botswana',72,267),(29,'BV','','BOUVET ISLAND','布维岛','Bouvet Island',0,0),(30,'BR','BRA','BRAZIL','巴西','Brazil',76,55),(31,'IO','','BRITISH INDIAN OCEAN TERRITORY','英属印度洋领地','British Indian Ocean Territory',0,246),(32,'BN','BRN','BRUNEI DARUSSALAM','文莱达鲁萨兰国','Brunei Darussalam',96,673),(33,'BG','BGR','BULGARIA','保加利亚','Bulgaria',100,359),(34,'BF','BFA','BURKINA FASO','布吉纳法索','Burkina Faso',854,226),(35,'BI','BDI','BURUNDI','布隆迪','Burundi',108,257),(36,'KH','KHM','CAMBODIA','柬埔寨','Cambodia',116,855),(37,'CM','CMR','CAMEROON','喀麦隆','Cameroon',120,237),(38,'CA','CAN','CANADA','加拿大','Canada',124,1),(39,'CV','CPV','CAPE VERDE','佛得角','Cape Verde',132,238),(40,'KY','CYM','CAYMAN ISLANDS','开曼群岛','Cayman Islands',136,1345),(41,'CF','CAF','CENTRAL AFRICAN REPUBLIC','中非共和国','Central African Republic',140,236),(42,'TD','TCD','CHAD','乍得','Chad',148,235),(43,'CL','CHL','CHILE','智利','Chile',152,56),(44,'CN','CHN','CHINA','中国','China',156,86),(45,'CX','','CHRISTMAS ISLAND','圣诞岛','Christmas Island',0,61),(46,'CC','','COCOS (KEELING) ISLANDS','COCOS(KEELING)岛','Cocos (Keeling) Islands',0,672),(47,'CO','COL','COLOMBIA','哥伦比亚','Colombia',170,57),(48,'KM','COM','COMOROS','科摩罗','Comoros',174,269),(49,'CG','COG','CONGO','刚果','Congo',178,242),(50,'CD','COD','CONGO, THE DEMOCRATIC REPUBLIC OF THE','刚果民主共和国的','Congo, the Democratic Republic of the',180,242),(51,'CK','COK','COOK ISLANDS','库克群岛','Cook Islands',184,682),(52,'CR','CRI','COSTA RICA','哥斯达黎加','Costa Rica',188,506),(53,'CI','CIV','COTE D\'IVOIRE','科特迪瓦','Cote D\'Ivoire',384,225),(54,'HR','HRV','CROATIA','克罗地亚','Croatia',191,385),(55,'CU','CUB','CUBA','古巴','Cuba',192,53),(56,'CY','CYP','CYPRUS','塞浦路斯','Cyprus',196,357),(57,'CZ','CZE','CZECH REPUBLIC','捷克共和国','Czech Republic',203,420),(58,'DK','DNK','DENMARK','丹麦','Denmark',208,45),(59,'DJ','DJI','DJIBOUTI','吉布提','Djibouti',262,253),(60,'DM','DMA','DOMINICA','多米尼加','Dominica',212,1767),(61,'DO','DOM','DOMINICAN REPUBLIC','多米尼加共和国','Dominican Republic',214,1809),(62,'EC','ECU','ECUADOR','厄瓜多尔','Ecuador',218,593),(63,'EG','EGY','EGYPT','埃及','Egypt',818,20),(64,'SV','SLV','EL SALVADOR','萨尔瓦多','El Salvador',222,503),(65,'GQ','GNQ','EQUATORIAL GUINEA','赤道几内亚','Equatorial Guinea',226,240),(66,'ER','ERI','ERITREA','厄立特里亚','Eritrea',232,291),(67,'EE','EST','ESTONIA','爱沙尼亚','Estonia',233,372),(68,'ET','ETH','ETHIOPIA','埃塞俄比亚','Ethiopia',231,251),(69,'FK','FLK','FALKLAND ISLANDS (MALVINAS)','福克兰群岛(马尔维纳斯)','Falkland Islands (Malvinas)',238,500),(70,'FO','FRO','FAROE ISLANDS','法罗群岛','Faroe Islands',234,298),(71,'FJ','FJI','FIJI','斐济','Fiji',242,679),(72,'FI','FIN','FINLAND','芬兰','Finland',246,358),(73,'FR','FRA','FRANCE','法国','France',250,33),(74,'GF','GUF','FRENCH GUIANA','法属圭亚那','French Guiana',254,594),(75,'PF','PYF','FRENCH POLYNESIA','法属波利尼西亚','French Polynesia',258,689),(76,'TF','','FRENCH SOUTHERN TERRITORIES','法国南部地区','French Southern Territories',0,0),(77,'GA','GAB','GABON','加蓬','Gabon',266,241),(78,'GM','GMB','GAMBIA','冈比亚','Gambia',270,220),(79,'GE','GEO','GEORGIA','乔治亚州','Georgia',268,995),(80,'DE','DEU','GERMANY','德国','Germany',276,49),(81,'GH','GHA','GHANA','加纳','Ghana',288,233),(82,'GI','GIB','GIBRALTAR','直布罗陀','Gibraltar',292,350),(83,'GR','GRC','GREECE','希腊','Greece',300,30),(84,'GL','GRL','GREENLAND','格陵兰岛','Greenland',304,299),(85,'GD','GRD','GRENADA','格林纳达','Grenada',308,1473),(86,'GP','GLP','GUADELOUPE','瓜德罗普岛','Guadeloupe',312,590),(87,'GU','GUM','GUAM','关岛','Guam',316,1671),(88,'GT','GTM','GUATEMALA','危地马拉','Guatemala',320,502),(89,'GN','GIN','GUINEA','几内亚','Guinea',324,224),(90,'GW','GNB','GUINEA-BISSAU','几内亚比绍','Guinea-Bissau',624,245),(91,'GY','GUY','GUYANA','圭亚那','Guyana',328,592),(92,'HT','HTI','HAITI','海地','Haiti',332,509),(93,'HM','','HEARD ISLAND AND MCDONALD ISLANDS','听到岛和麦当劳的岛屿','Heard Island and Mcdonald Islands',0,0),(94,'VA','VAT','HOLY SEE (VATICAN CITY STATE)','教廷(梵蒂冈)','Holy See (Vatican City State)',336,39),(95,'HN','HND','HONDURAS','洪都拉斯','Honduras',340,504),(96,'HK','HKG','HONG KONG','中国香港','Hong Kong',344,852),(97,'HU','HUN','HUNGARY','匈牙利','Hungary',348,36),(98,'IS','ISL','ICELAND','冰岛','Iceland',352,354),(99,'IN','IND','INDIA','印度','India',356,91),(100,'ID','IDN','INDONESIA','印尼','Indonesia',360,62),(101,'IR','IRN','IRAN, ISLAMIC REPUBLIC OF','伊朗伊斯兰共和国','Iran, Islamic Republic of',364,98),(102,'IQ','IRQ','IRAQ','伊拉克','Iraq',368,964),(103,'IE','IRL','IRELAND','爱尔兰','Ireland',372,353),(104,'IL','ISR','ISRAEL','以色列','Israel',376,972),(105,'IT','ITA','ITALY','意大利','Italy',380,39),(106,'JM','JAM','JAMAICA','牙买加','Jamaica',388,1876),(107,'JP','JPN','JAPAN','日本','Japan',392,81),(108,'JO','JOR','JORDAN','约旦','Jordan',400,962),(109,'KZ','KAZ','KAZAKHSTAN','哈萨克斯坦','Kazakhstan',398,7),(110,'KE','KEN','KENYA','肯尼亚','Kenya',404,254),(111,'KI','KIR','KIRIBATI','基里巴斯','Kiribati',296,686),(112,'KP','PRK','KOREA, DEMOCRATIC PEOPLE\'S REPUBLIC OF','朝鲜民主主义人民共和国','Korea, Democratic People\'s Republic of',408,850),(113,'KR','KOR','KOREA, REPUBLIC OF','朝鲜共和国','Korea, Republic of',410,82),(114,'KW','KWT','KUWAIT','科威特','Kuwait',414,965),(115,'KG','KGZ','KYRGYZSTAN','吉尔吉斯斯坦','Kyrgyzstan',417,996),(116,'LA','LAO','LAO PEOPLE\'S DEMOCRATIC REPUBLIC','老挝人民民主共和国','Lao People\'s Democratic Republic',418,856),(117,'LV','LVA','LATVIA','拉脱维亚','Latvia',428,371),(118,'LB','LBN','LEBANON','黎巴嫩','Lebanon',422,961),(119,'LS','LSO','LESOTHO','莱索托','Lesotho',426,266),(120,'LR','LBR','LIBERIA','利比里亚','Liberia',430,231),(121,'LY','LBY','LIBYAN ARAB JAMAHIRIYA','阿拉伯利比亚民众国','Libyan Arab Jamahiriya',434,218),(122,'LI','LIE','LIECHTENSTEIN','列支敦斯登','Liechtenstein',438,423),(123,'LT','LTU','LITHUANIA','立陶宛','Lithuania',440,370),(124,'LU','LUX','LUXEMBOURG','卢森堡','Luxembourg',442,352),(125,'MO','MAC','MACAO','澳门','Macao',446,853),(126,'MK','MKD','MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','前南斯拉夫马其顿共和国','Macedonia, the Former Yugoslav Republic of',807,389),(127,'MG','MDG','MADAGASCAR','马达加斯加','Madagascar',450,261),(128,'MW','MWI','MALAWI','马拉维','Malawi',454,265),(129,'MY','MYS','MALAYSIA','马来西亚','Malaysia',458,60),(130,'MV','MDV','MALDIVES','马尔代夫','Maldives',462,960),(131,'ML','MLI','MALI','马里','Mali',466,223),(132,'MT','MLT','MALTA','马耳他','Malta',470,356),(133,'MH','MHL','MARSHALL ISLANDS','马绍尔群岛','Marshall Islands',584,692),(134,'MQ','MTQ','MARTINIQUE','马提尼克岛','Martinique',474,596),(135,'MR','MRT','MAURITANIA','毛利塔尼亚','Mauritania',478,222),(136,'MU','MUS','MAURITIUS','毛里求斯','Mauritius',480,230),(137,'YT','','MAYOTTE','马约特岛','Mayotte',0,269),(138,'MX','MEX','MEXICO','墨西哥','Mexico',484,52),(139,'FM','FSM','MICRONESIA, FEDERATED STATES OF','密克罗尼西亚联邦','Micronesia, Federated States of',583,691),(140,'MD','MDA','MOLDOVA, REPUBLIC OF','摩尔多瓦共和国','Moldova, Republic of',498,373),(141,'MC','MCO','MONACO','摩纳哥','Monaco',492,377),(142,'MN','MNG','MONGOLIA','蒙古','Mongolia',496,976),(143,'MS','MSR','MONTSERRAT','蒙特塞拉特','Montserrat',500,1664),(144,'MA','MAR','MOROCCO','摩洛哥','Morocco',504,212),(145,'MZ','MOZ','MOZAMBIQUE','MOZAMBIQUE','Mozambique',508,258),(146,'MM','MMR','MYANMAR','缅甸','Myanmar',104,95),(147,'NA','NAM','NAMIBIA','纳米比亚','Namibia',516,264),(148,'NR','NRU','NAURU','瑙鲁','Nauru',520,674),(149,'NP','NPL','NEPAL','尼泊尔','Nepal',524,977),(150,'NL','NLD','NETHERLANDS','荷兰','Netherlands',528,31),(151,'AN','ANT','NETHERLANDS ANTILLES','荷属安的列斯群岛','Netherlands Antilles',530,599),(152,'NC','NCL','NEW CALEDONIA','新喀里多尼亚','New Caledonia',540,687),(153,'NZ','NZL','NEW ZEALAND','新西兰','New Zealand',554,64),(154,'NI','NIC','NICARAGUA','尼加拉瓜','Nicaragua',558,505),(155,'NE','NER','NIGER','尼日尔','Niger',562,227),(156,'NG','NGA','NIGERIA','尼日利亚','Nigeria',566,234),(157,'NU','NIU','NIUE','纽埃岛','Niue',570,683),(158,'NF','NFK','NORFOLK ISLAND','诺福克岛','Norfolk Island',574,672),(159,'MP','MNP','NORTHERN MARIANA ISLANDS','北马里亚纳群岛','Northern Mariana Islands',580,1670),(160,'NO','NOR','NORWAY','挪威','Norway',578,47),(161,'OM','OMN','OMAN','阿曼','Oman',512,968),(162,'PK','PAK','PAKISTAN','巴基斯坦','Pakistan',586,92),(163,'PW','PLW','PALAU','帕劳','Palau',585,680),(164,'PS','','PALESTINIAN TERRITORY, OCCUPIED','巴勒斯坦的领土,占领','Palestinian Territory, Occupied',0,970),(165,'PA','PAN','PANAMA','巴拿马','Panama',591,507),(166,'PG','PNG','PAPUA NEW GUINEA','巴布新几内亚','Papua New Guinea',598,675),(167,'PY','PRY','PARAGUAY','巴拉圭','Paraguay',600,595),(168,'PE','PER','PERU','秘鲁','Peru',604,51),(169,'PH','PHL','PHILIPPINES','菲律宾','Philippines',608,63),(170,'PN','PCN','PITCAIRN','皮特克恩','Pitcairn',612,0),(171,'PL','POL','POLAND','波兰','Poland',616,48),(172,'PT','PRT','PORTUGAL','葡萄牙','Portugal',620,351),(173,'PR','PRI','PUERTO RICO','波多黎各','Puerto Rico',630,1787),(174,'QA','QAT','QATAR','卡塔尔','Qatar',634,974),(175,'RE','REU','REUNION','团聚','Reunion',638,262),(176,'RO','ROM','ROMANIA','罗马尼亚','Romania',642,40),(177,'RU','RUS','RUSSIAN FEDERATION','俄罗斯联邦','Russian Federation',643,70),(178,'RW','RWA','RWANDA','卢旺达','Rwanda',646,250),(179,'SH','SHN','SAINT HELENA','圣赫勒拿','Saint Helena',654,290),(180,'KN','KNA','SAINT KITTS AND NEVIS','圣基茨和尼维斯','Saint Kitts and Nevis',659,1869),(181,'LC','LCA','SAINT LUCIA','圣卢西亚岛','Saint Lucia',662,1758),(182,'PM','SPM','SAINT PIERRE AND MIQUELON','圣皮埃尔和MIQUELON','Saint Pierre and Miquelon',666,508),(183,'VC','VCT','SAINT VINCENT AND THE GRENADINES','圣文森特和格林纳丁斯','Saint Vincent and the Grenadines',670,1784),(184,'WS','WSM','SAMOA','萨摩亚','Samoa',882,684),(185,'SM','SMR','SAN MARINO','圣马力诺','San Marino',674,378),(186,'ST','STP','SAO TOME AND PRINCIPE','圣多美和王子','Sao Tome and Principe',678,239),(187,'SA','SAU','SAUDI ARABIA','沙特阿拉伯','Saudi Arabia',682,966),(188,'SN','SEN','SENEGAL','塞内加尔','Senegal',686,221),(189,'CS','','SERBIA AND MONTENEGRO','塞尔维亚和黑山','Serbia and Montenegro',0,381),(190,'SC','SYC','SEYCHELLES','塞舌尔','Seychelles',690,248),(191,'SL','SLE','SIERRA LEONE','塞拉利昂','Sierra Leone',694,232),(192,'SG','SGP','SINGAPORE','新加坡','Singapore',702,65),(193,'SK','SVK','SLOVAKIA','斯洛伐克','Slovakia',703,421),(194,'SI','SVN','SLOVENIA','斯洛文尼亚','Slovenia',705,386),(195,'SB','SLB','SOLOMON ISLANDS','所罗门群岛','Solomon Islands',90,677),(196,'SO','SOM','SOMALIA','索马里','Somalia',706,252),(197,'ZA','ZAF','SOUTH AFRICA','南非','South Africa',710,27),(198,'GS','','SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS','南乔治亚岛和南桑威奇群岛','South Georgia and the South Sandwich Islands',0,0),(199,'ES','ESP','SPAIN','西班牙','Spain',724,34),(200,'LK','LKA','SRI LANKA','斯里兰卡','Sri Lanka',144,94),(201,'SD','SDN','SUDAN','苏丹','Sudan',736,249),(202,'SR','SUR','SURINAME','苏里南','Suriname',740,597),(203,'SJ','SJM','SVALBARD AND JAN MAYEN','斯瓦尔巴群岛和扬马延岛','Svalbard and Jan Mayen',744,47),(204,'SZ','SWZ','SWAZILAND','斯威士兰','Swaziland',748,268),(205,'SE','SWE','SWEDEN','瑞典','Sweden',752,46),(206,'CH','CHE','SWITZERLAND','瑞士','Switzerland',756,41),(207,'SY','SYR','SYRIAN ARAB REPUBLIC','阿拉伯叙利亚共和国','Syrian Arab Republic',760,963),(208,'TW','TWN','TAIWAN, PROVINCE OF CHINA','中国台湾地区','Taiwan, Province of China',158,886),(209,'TJ','TJK','TAJIKISTAN','塔吉克斯坦','Tajikistan',762,992),(210,'TZ','TZA','TANZANIA, UNITED REPUBLIC OF','坦桑尼亚联合共和国','Tanzania, United Republic of',834,255),(211,'TH','THA','THAILAND','泰国','Thailand',764,66),(212,'TL','','TIMOR-LESTE','东帝汶','Timor-Leste',0,670),(213,'TG','TGO','TOGO','多哥','Togo',768,228),(214,'TK','TKL','TOKELAU','托克劳','Tokelau',772,690),(215,'TO','TON','TONGA','汤加','Tonga',776,676),(216,'TT','TTO','TRINIDAD AND TOBAGO','特立尼达和多巴哥','Trinidad and Tobago',780,1868),(217,'TN','TUN','TUNISIA','突尼斯','Tunisia',788,216),(218,'TR','TUR','TURKEY','土耳其','Turkey',792,90),(219,'TM','TKM','TURKMENISTAN','土库曼斯坦','Turkmenistan',795,7370),(220,'TC','TCA','TURKS AND CAICOS ISLANDS','特克斯和凯科斯群岛','Turks and Caicos Islands',796,1649),(221,'TV','TUV','TUVALU','图瓦卢','Tuvalu',798,688),(222,'UG','UGA','UGANDA','乌干达','Uganda',800,256),(223,'UA','UKR','UKRAINE','乌克兰','Ukraine',804,380),(224,'AE','ARE','UNITED ARAB EMIRATES','阿拉伯联合酋长国','United Arab Emirates',784,971),(225,'GB','GBR','UNITED KINGDOM','联合王国','United Kingdom',826,44),(226,'US','USA','UNITED STATES','美国','United States',840,1),(227,'UM','','UNITED STATES MINOR OUTLYING ISLANDS','美国小离岛','United States Minor Outlying Islands',0,1),(228,'UY','URY','URUGUAY','乌拉圭','Uruguay',858,598),(229,'UZ','UZB','UZBEKISTAN','乌兹别克斯坦','Uzbekistan',860,998),(230,'VU','VUT','VANUATU','瓦努阿图','Vanuatu',548,678),(231,'VE','VEN','VENEZUELA','委内瑞拉','Venezuela',862,58),(232,'VN','VNM','VIET NAM','越南','Viet Nam',704,84),(233,'VG','VGB','VIRGIN ISLANDS, BRITISH','维尔京群岛,英国','Virgin Islands, British',92,1284),(234,'VI','VIR','VIRGIN ISLANDS, U.S.','维尔京群岛,美国','Virgin Islands, U.s.',850,1340),(235,'WF','WLF','WALLIS AND FUTUNA','瓦利斯群岛和富图纳群岛','Wallis and Futuna',876,681),(236,'EH','ESH','WESTERN SAHARA','西撒哈拉','Western Sahara',732,212),(237,'YE','YEM','YEMEN','也门','Yemen',887,967),(238,'ZM','ZMB','ZAMBIA','赞比亚','Zambia',894,260),(239,'ZW','ZWE','ZIMBABWE','津巴布韦','Zimbabwe',716,263);
/*!40000 ALTER TABLE `shd_sms_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_system_log`
--

DROP TABLE IF EXISTS `shd_system_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_system_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '时间',
  `description` text COMMENT '日志内容',
  `user` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '对应id',
  `user_type` tinyint(3) NOT NULL DEFAULT '0' COMMENT '用户类型 0管理员 1前台用户',
  `ip` varchar(30) NOT NULL DEFAULT '' COMMENT 'ip',
  `log_type` varchar(30) NOT NULL DEFAULT 'system' COMMENT '日志类型',
  `relid` int(10) NOT NULL DEFAULT '0' COMMENT '关联的id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userid` (`uid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_system_log`
--

LOCK TABLES `shd_system_log` WRITE;
/*!40000 ALTER TABLE `shd_system_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_system_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_system_message`
--

DROP TABLE IF EXISTS `shd_system_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_system_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '客户id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `obj` text COMMENT '消息对象相关信息，json存储',
  `attachment` text COMMENT '附件名称',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型：1-工单消息，2-产品消息，3-站内信，4-活动消息',
  `is_market` tinyint(1) NOT NULL DEFAULT '0' COMMENT '营销信息：0-否，1-是',
  `delete_time` int(10) NOT NULL DEFAULT '0' COMMENT '删除时间',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `read_time` int(10) NOT NULL DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统消息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_system_message`
--

LOCK TABLES `shd_system_message` WRITE;
/*!40000 ALTER TABLE `shd_system_message` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_system_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_theme`
--

DROP TABLE IF EXISTS `shd_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_theme` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后升级时间',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '模板状态,1:正在使用;0:未使用',
  `is_compiled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否为已编译模板',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '主题目录名，用于主题的维一标识',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '主题名称',
  `version` varchar(20) NOT NULL DEFAULT '' COMMENT '主题版本号',
  `demo_url` varchar(50) NOT NULL DEFAULT '' COMMENT '演示地址，带协议',
  `thumbnail` varchar(100) NOT NULL DEFAULT '' COMMENT '缩略图',
  `author` varchar(20) NOT NULL DEFAULT '' COMMENT '主题作者',
  `author_url` varchar(50) NOT NULL DEFAULT '' COMMENT '作者网站链接',
  `lang` varchar(10) NOT NULL DEFAULT '' COMMENT '支持语言',
  `keywords` varchar(50) NOT NULL DEFAULT '' COMMENT '主题关键字',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '主题描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_theme`
--

LOCK TABLES `shd_theme` WRITE;
/*!40000 ALTER TABLE `shd_theme` DISABLE KEYS */;
INSERT INTO `shd_theme` VALUES (1,0,1591066836,0,0,'default','default','1.0.0','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF默认模板','ThinkCMF默认模板'),(2,0,0,0,0,'simpleboot3','simpleboot3','1.0.2','http://demo.thinkcmf.com','','ThinkCMF','http://www.thinkcmf.com','zh-cn','ThinkCMF模板','ThinkCMF默认模板'),(3,0,0,0,0,'admin_tpl','admin_tpl','1.0','http://www.shundai.com','','shd','http://www.shundai.com','zh-cn','管理员模板','管理员默认模板');
/*!40000 ALTER TABLE `shd_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_theme_file`
--

DROP TABLE IF EXISTS `shd_theme_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_theme_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `is_public` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否公共的模板文件',
  `list_order` float NOT NULL DEFAULT '10000' COMMENT '排序',
  `theme` varchar(20) NOT NULL DEFAULT '' COMMENT '模板名称',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '模板文件名',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作',
  `file` varchar(50) NOT NULL DEFAULT '' COMMENT '模板文件，相对于模板根目录，如Portal/index.html',
  `description` varchar(100) NOT NULL DEFAULT '' COMMENT '模板文件描述',
  `more` text COMMENT '模板更多配置,用户自己后台设置的',
  `config_more` text COMMENT '模板更多配置,来源模板的配置文件',
  `draft_more` text COMMENT '模板更多配置,用户临时保存的配置',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_theme_file`
--

LOCK TABLES `shd_theme_file` WRITE;
/*!40000 ALTER TABLE `shd_theme_file` DISABLE KEYS */;
INSERT INTO `shd_theme_file` VALUES (1,0,10,'simpleboot3','文章页','portal/Article/index','portal/article','文章页模板文件','{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"hot_articles_category_id\":{\"title\":\"Hot Articles\\u5206\\u7c7bID\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}',NULL),(2,0,10,'simpleboot3','联系我们页','portal/Page/index','portal/contact','联系我们页模板文件','{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}','{\"vars\":{\"baidu_map_info_window_text\":{\"title\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57\",\"name\":\"baidu_map_info_window_text\",\"value\":\"ThinkCMF<br\\/><span class=\'\'>\\u5730\\u5740\\uff1a\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def2601\\u53f7<\\/span>\",\"type\":\"text\",\"tip\":\"\\u767e\\u5ea6\\u5730\\u56fe\\u6807\\u6ce8\\u6587\\u5b57,\\u652f\\u6301\\u7b80\\u5355html\\u4ee3\\u7801\",\"rule\":[]},\"company_location\":{\"title\":\"\\u516c\\u53f8\\u5750\\u6807\",\"value\":\"\",\"type\":\"location\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_cn\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\",\"value\":\"\\u4e0a\\u6d77\\u5e02\\u5f90\\u6c47\\u533a\\u659c\\u571f\\u8def0001\\u53f7\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"address_en\":{\"title\":\"\\u516c\\u53f8\\u5730\\u5740\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"NO.0001 Xie Tu Road, Shanghai China\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"email\":{\"title\":\"\\u516c\\u53f8\\u90ae\\u7bb1\",\"value\":\"catman@thinkcmf.com\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_cn\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\",\"value\":\"021 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"phone_en\":{\"title\":\"\\u516c\\u53f8\\u7535\\u8bdd\\uff08\\u82f1\\u6587\\uff09\",\"value\":\"+8621 1000 0001\",\"type\":\"text\",\"tip\":\"\",\"rule\":{\"require\":true}},\"qq\":{\"title\":\"\\u8054\\u7cfbQQ\",\"value\":\"478519726\",\"type\":\"text\",\"tip\":\"\\u591a\\u4e2a QQ\\u4ee5\\u82f1\\u6587\\u9017\\u53f7\\u9694\\u5f00\",\"rule\":{\"require\":true}}}}',NULL),(3,0,5,'simpleboot3','首页','portal/Index/index','portal/index','首页模板文件','{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"vars\":{\"top_slide\":{\"title\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"admin\\/Slide\\/index\",\"multi\":false},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"tip\":\"\\u9876\\u90e8\\u5e7b\\u706f\\u7247\",\"rule\":{\"require\":true}}},\"widgets\":{\"features\":{\"title\":\"\\u5feb\\u901f\\u4e86\\u89e3ThinkCMF\",\"display\":\"1\",\"vars\":{\"sub_title\":{\"title\":\"\\u526f\\u6807\\u9898\",\"value\":\"Quickly understand the ThinkCMF\",\"type\":\"text\",\"placeholder\":\"\\u8bf7\\u8f93\\u5165\\u526f\\u6807\\u9898\",\"tip\":\"\",\"rule\":{\"require\":true}},\"features\":{\"title\":\"\\u7279\\u6027\\u4ecb\\u7ecd\",\"value\":[{\"title\":\"MVC\\u5206\\u5c42\\u6a21\\u5f0f\",\"icon\":\"bars\",\"content\":\"\\u4f7f\\u7528MVC\\u5e94\\u7528\\u7a0b\\u5e8f\\u88ab\\u5206\\u6210\\u4e09\\u4e2a\\u6838\\u5fc3\\u90e8\\u4ef6\\uff1a\\u6a21\\u578b\\uff08M\\uff09\\u3001\\u89c6\\u56fe\\uff08V\\uff09\\u3001\\u63a7\\u5236\\u5668\\uff08C\\uff09\\uff0c\\u4ed6\\u4e0d\\u662f\\u4e00\\u4e2a\\u65b0\\u7684\\u6982\\u5ff5\\uff0c\\u53ea\\u662fThinkCMF\\u5c06\\u5176\\u53d1\\u6325\\u5230\\u4e86\\u6781\\u81f4\\u3002\"},{\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"group\",\"content\":\"ThinkCMF\\u5185\\u7f6e\\u4e86\\u7075\\u6d3b\\u7684\\u7528\\u6237\\u7ba1\\u7406\\u65b9\\u5f0f\\uff0c\\u5e76\\u53ef\\u76f4\\u63a5\\u4e0e\\u7b2c\\u4e09\\u65b9\\u7ad9\\u70b9\\u8fdb\\u884c\\u4e92\\u8054\\u4e92\\u901a\\uff0c\\u5982\\u679c\\u4f60\\u613f\\u610f\\u751a\\u81f3\\u53ef\\u4ee5\\u5bf9\\u5355\\u4e2a\\u7528\\u6237\\u6216\\u7fa4\\u4f53\\u7528\\u6237\\u7684\\u884c\\u4e3a\\u8fdb\\u884c\\u8bb0\\u5f55\\u53ca\\u5206\\u4eab\\uff0c\\u4e3a\\u60a8\\u7684\\u8fd0\\u8425\\u51b3\\u7b56\\u63d0\\u4f9b\\u6709\\u6548\\u53c2\\u8003\\u6570\\u636e\\u3002\"},{\"title\":\"\\u4e91\\u7aef\\u90e8\\u7f72\",\"icon\":\"cloud\",\"content\":\"\\u901a\\u8fc7\\u9a71\\u52a8\\u7684\\u65b9\\u5f0f\\u53ef\\u4ee5\\u8f7b\\u677e\\u652f\\u6301\\u4e91\\u5e73\\u53f0\\u7684\\u90e8\\u7f72\\uff0c\\u8ba9\\u4f60\\u7684\\u7f51\\u7ad9\\u65e0\\u7f1d\\u8fc1\\u79fb\\uff0c\\u5185\\u7f6e\\u5df2\\u7ecf\\u652f\\u6301SAE\\u3001BAE\\uff0c\\u6b63\\u5f0f\\u7248\\u5c06\\u5bf9\\u4e91\\u7aef\\u90e8\\u7f72\\u8fdb\\u884c\\u8fdb\\u4e00\\u6b65\\u4f18\\u5316\\u3002\"},{\"title\":\"\\u5b89\\u5168\\u7b56\\u7565\",\"icon\":\"heart\",\"content\":\"\\u63d0\\u4f9b\\u7684\\u7a33\\u5065\\u7684\\u5b89\\u5168\\u7b56\\u7565\\uff0c\\u5305\\u62ec\\u5907\\u4efd\\u6062\\u590d\\uff0c\\u5bb9\\u9519\\uff0c\\u9632\\u6cbb\\u6076\\u610f\\u653b\\u51fb\\u767b\\u9646\\uff0c\\u7f51\\u9875\\u9632\\u7be1\\u6539\\u7b49\\u591a\\u9879\\u5b89\\u5168\\u7ba1\\u7406\\u529f\\u80fd\\uff0c\\u4fdd\\u8bc1\\u7cfb\\u7edf\\u5b89\\u5168\\uff0c\\u53ef\\u9760\\uff0c\\u7a33\\u5b9a\\u7684\\u8fd0\\u884c\\u3002\"},{\"title\":\"\\u5e94\\u7528\\u6a21\\u5757\\u5316\",\"icon\":\"cubes\",\"content\":\"\\u63d0\\u51fa\\u5168\\u65b0\\u7684\\u5e94\\u7528\\u6a21\\u5f0f\\u8fdb\\u884c\\u6269\\u5c55\\uff0c\\u4e0d\\u7ba1\\u662f\\u4f60\\u5f00\\u53d1\\u4e00\\u4e2a\\u5c0f\\u529f\\u80fd\\u8fd8\\u662f\\u4e00\\u4e2a\\u5168\\u65b0\\u7684\\u7ad9\\u70b9\\uff0c\\u5728ThinkCMF\\u4e2d\\u4f60\\u53ea\\u662f\\u589e\\u52a0\\u4e86\\u4e00\\u4e2aAPP\\uff0c\\u6bcf\\u4e2a\\u72ec\\u7acb\\u8fd0\\u884c\\u4e92\\u4e0d\\u5f71\\u54cd\\uff0c\\u4fbf\\u4e8e\\u7075\\u6d3b\\u6269\\u5c55\\u548c\\u4e8c\\u6b21\\u5f00\\u53d1\\u3002\"},{\"title\":\"\\u514d\\u8d39\\u5f00\\u6e90\",\"icon\":\"certificate\",\"content\":\"\\u4ee3\\u7801\\u9075\\u5faaApache2\\u5f00\\u6e90\\u534f\\u8bae\\uff0c\\u514d\\u8d39\\u4f7f\\u7528\\uff0c\\u5bf9\\u5546\\u4e1a\\u7528\\u6237\\u4e5f\\u65e0\\u4efb\\u4f55\\u9650\\u5236\\u3002\"}],\"type\":\"array\",\"item\":{\"title\":{\"title\":\"\\u6807\\u9898\",\"value\":\"\",\"type\":\"text\",\"rule\":{\"require\":true}},\"icon\":{\"title\":\"\\u56fe\\u6807\",\"value\":\"\",\"type\":\"text\"},\"content\":{\"title\":\"\\u63cf\\u8ff0\",\"value\":\"\",\"type\":\"textarea\"}},\"tip\":\"\"}}},\"last_news\":{\"title\":\"\\u6700\\u65b0\\u8d44\\u8baf\",\"display\":\"1\",\"vars\":{\"last_news_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/Category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL),(4,0,10,'simpleboot3','文章列表页','portal/List/index','portal/list','文章列表模板文件','{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"vars\":[],\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL),(5,0,10,'simpleboot3','单页面','portal/Page/index','portal/page','单页面模板文件','{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}','{\"widgets\":{\"hottest_articles\":{\"title\":\"\\u70ed\\u95e8\\u6587\\u7ae0\",\"display\":\"1\",\"vars\":{\"hottest_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}},\"last_articles\":{\"title\":\"\\u6700\\u65b0\\u53d1\\u5e03\",\"display\":\"1\",\"vars\":{\"last_articles_category_id\":{\"title\":\"\\u6587\\u7ae0\\u5206\\u7c7bID\",\"value\":\"\",\"type\":\"text\",\"dataSource\":{\"api\":\"portal\\/category\\/index\",\"multi\":true},\"placeholder\":\"\\u8bf7\\u9009\\u62e9\\u5206\\u7c7b\",\"tip\":\"\",\"rule\":{\"require\":true}}}}}}',NULL),(6,0,10,'simpleboot3','搜索页面','portal/search/index','portal/search','搜索模板文件','{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}','{\"vars\":{\"varName1\":{\"title\":\"\\u70ed\\u95e8\\u641c\\u7d22\",\"value\":\"1\",\"type\":\"text\",\"tip\":\"\\u8fd9\\u662f\\u4e00\\u4e2atext\",\"rule\":{\"require\":true}}}}',NULL),(7,1,0,'simpleboot3','模板全局配置','public/Config','public/config','模板全局配置文件','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}','{\"vars\":{\"enable_mobile\":{\"title\":\"\\u624b\\u673a\\u6ce8\\u518c\",\"value\":1,\"type\":\"select\",\"options\":{\"1\":\"\\u5f00\\u542f\",\"0\":\"\\u5173\\u95ed\"},\"tip\":\"\"}}}',NULL),(8,1,1,'simpleboot3','导航条','public/Nav','public/nav','导航条模板文件','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}','{\"vars\":{\"company_name\":{\"title\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"name\":\"company_name\",\"value\":\"ThinkCMF\",\"type\":\"text\",\"tip\":\"\",\"rule\":[]}}}',NULL);
/*!40000 ALTER TABLE `shd_theme_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket`
--

DROP TABLE IF EXISTS `shd_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tid` varchar(128) NOT NULL DEFAULT '' COMMENT '工单号',
  `dptid` int(10) NOT NULL DEFAULT '0' COMMENT '部门id',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `host_id` int(11) NOT NULL DEFAULT '0' COMMENT '客户购买产品ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '姓名',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text COMMENT '正文',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '状态',
  `priority` varchar(30) NOT NULL DEFAULT '' COMMENT '优先级',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `admin_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `attachment` text COMMENT '附件',
  `last_reply_time` int(11) NOT NULL DEFAULT '0' COMMENT '上次回复时间',
  `client_unread` tinyint(1) NOT NULL DEFAULT '0' COMMENT '用户未读',
  `admin_unread` tinyint(1) NOT NULL DEFAULT '0' COMMENT '客户未读',
  `service` text,
  `merged_ticket_id` int(11) NOT NULL DEFAULT '0' COMMENT '合并工单id',
  `update_time` int(10) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `c` varchar(20) NOT NULL DEFAULT '' COMMENT '凭据',
  `cc` text COMMENT '收件人',
  `flag` int(10) NOT NULL DEFAULT '0' COMMENT '标记的管理员',
  `star` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '评价星1-5',
  `is_auto_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经自动回复',
  `is_deliver` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经推送',
  `upstream_tid` varchar(128) NOT NULL DEFAULT '' COMMENT '上游工单id',
  `is_receive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否接收',
  `handle` int(11) NOT NULL DEFAULT '0' COMMENT '处理人',
  `handle_time` int(11) NOT NULL DEFAULT '0' COMMENT '处理时间',
  `token` varchar(64) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tid_c` (`tid`) USING BTREE,
  KEY `userid` (`uid`) USING BTREE,
  KEY `date` (`create_time`) USING BTREE,
  KEY `did` (`dptid`) USING BTREE,
  KEY `merged_ticket_id` (`merged_ticket_id`,`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket`
--

LOCK TABLES `shd_ticket` WRITE;
/*!40000 ALTER TABLE `shd_ticket` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_deliver`
--

DROP TABLE IF EXISTS `shd_ticket_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_deliver` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_open_auto_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启自动回复',
  `bz` varchar(100) NOT NULL DEFAULT '' COMMENT '自动回复内容',
  `mask_keywords` text NOT NULL COMMENT '屏蔽关键字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_deliver`
--

LOCK TABLES `shd_ticket_deliver` WRITE;
/*!40000 ALTER TABLE `shd_ticket_deliver` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_deliver_department`
--

DROP TABLE IF EXISTS `shd_ticket_deliver_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_deliver_department` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tdid` int(11) NOT NULL DEFAULT '0',
  `dptid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_deliver_department`
--

LOCK TABLES `shd_ticket_deliver_department` WRITE;
/*!40000 ALTER TABLE `shd_ticket_deliver_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_deliver_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_deliver_products`
--

DROP TABLE IF EXISTS `shd_ticket_deliver_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_deliver_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tdid` int(11) NOT NULL DEFAULT '0',
  `pid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_deliver_products`
--

LOCK TABLES `shd_ticket_deliver_products` WRITE;
/*!40000 ALTER TABLE `shd_ticket_deliver_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_deliver_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_department`
--

DROP TABLE IF EXISTS `shd_ticket_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_department` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '部门名称',
  `description` text COMMENT '描述',
  `email` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `only_reg_client` tinyint(1) NOT NULL DEFAULT '0' COMMENT '仅客户',
  `only_client_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '仅管道回复',
  `no_auto_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '无自动回复',
  `hidden` tinyint(1) NOT NULL DEFAULT '0' COMMENT '隐藏',
  `order` int(1) NOT NULL DEFAULT '0' COMMENT '排序',
  `host` varchar(255) NOT NULL DEFAULT '' COMMENT '主机名',
  `port` varchar(5) NOT NULL DEFAULT '' COMMENT 'POP3端口',
  `login` varchar(255) NOT NULL DEFAULT '' COMMENT '邮件地址',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '邮箱密码',
  `feedback_request` tinyint(1) NOT NULL DEFAULT '0' COMMENT '反馈请求',
  `is_product_order` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否有产品',
  `is_open_auto_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '开启自动回复',
  `minutes` int(10) NOT NULL DEFAULT '0' COMMENT '分钟',
  `bz` text COMMENT '自动回复内容',
  `time_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0是秒1分钟',
  `is_related_upstream` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否关联上游',
  `is_certifi` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否实名认证,1是,0否',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`name`(64)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工单部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_department`
--

LOCK TABLES `shd_ticket_department` WRITE;
/*!40000 ALTER TABLE `shd_ticket_department` DISABLE KEYS */;
INSERT INTO `shd_ticket_department` VALUES (1,'技术部门','','',0,0,0,0,1,'','','','lVjQ+diAtguxCIgePpNrBdnl7R0=',0,0,0,0,'',0,0,0),(2,'财务部门','','',0,0,0,0,2,'','','','+OGhwmPwnLBq6FvRGtd4b2gfKxQ=',0,0,0,0,'',0,0,0),(3,'售前咨询','','',0,0,0,0,3,'','','','ro50KBs0/mHjiRkfQKYRt6EbIN0=',0,0,0,0,'',0,0,0);
/*!40000 ALTER TABLE `shd_ticket_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_department_admin`
--

DROP TABLE IF EXISTS `shd_ticket_department_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_department_admin` (
  `admin_id` int(10) NOT NULL DEFAULT '0',
  `dptid` int(10) NOT NULL DEFAULT '0',
  KEY `index_admin` (`admin_id`) USING BTREE,
  KEY `index_d` (`dptid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工单部门管理员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_department_admin`
--

LOCK TABLES `shd_ticket_department_admin` WRITE;
/*!40000 ALTER TABLE `shd_ticket_department_admin` DISABLE KEYS */;
INSERT INTO `shd_ticket_department_admin` VALUES (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `shd_ticket_department_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_department_upstream`
--

DROP TABLE IF EXISTS `shd_ticket_department_upstream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_department_upstream` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dptid` int(10) NOT NULL DEFAULT '0',
  `api_id` int(10) NOT NULL DEFAULT '0',
  `upstream_dptid` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_department_upstream`
--

LOCK TABLES `shd_ticket_department_upstream` WRITE;
/*!40000 ALTER TABLE `shd_ticket_department_upstream` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_department_upstream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_note`
--

DROP TABLE IF EXISTS `shd_ticket_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tid` int(10) NOT NULL DEFAULT '0' COMMENT '工单id',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `content` text COMMENT '备注内容',
  `attachment` text COMMENT '附件',
  `editor` enum('plain','markdown') NOT NULL DEFAULT 'plain',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ticketid_date` (`tid`,`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_note`
--

LOCK TABLES `shd_ticket_note` WRITE;
/*!40000 ALTER TABLE `shd_ticket_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_prereply`
--

DROP TABLE IF EXISTS `shd_ticket_prereply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_prereply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `cid` int(10) NOT NULL DEFAULT '0' COMMENT '预设回复分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '回复名称',
  `content` text COMMENT '回复内容',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cid` (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='预设回复内容表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_prereply`
--

LOCK TABLES `shd_ticket_prereply` WRITE;
/*!40000 ALTER TABLE `shd_ticket_prereply` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_prereply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_prereply_category`
--

DROP TABLE IF EXISTS `shd_ticket_prereply_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_prereply_category` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parentid` int(10) NOT NULL DEFAULT '0' COMMENT '父id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `parentid_name` (`parentid`,`name`(64)) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='预设回复分类表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_prereply_category`
--

LOCK TABLES `shd_ticket_prereply_category` WRITE;
/*!40000 ALTER TABLE `shd_ticket_prereply_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_prereply_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_reply`
--

DROP TABLE IF EXISTS `shd_ticket_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_reply` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tid` int(10) NOT NULL DEFAULT '0' COMMENT '工单id',
  `uid` int(10) NOT NULL DEFAULT '0' COMMENT '用户id',
  `contactid` int(10) NOT NULL DEFAULT '0',
  `create_time` int(10) NOT NULL DEFAULT '0' COMMENT '回复时间',
  `content` text COMMENT '回复信息',
  `admin` varchar(255) NOT NULL DEFAULT '' COMMENT '管理员名称',
  `admin_id` int(10) unsigned DEFAULT NULL COMMENT '管理员id',
  `attachment` text COMMENT '附件',
  `star` tinyint(7) NOT NULL DEFAULT '0' COMMENT '星级',
  `editor` enum('plain','markdown') NOT NULL DEFAULT 'plain',
  `is_deliver` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否推送',
  `is_receive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否接收',
  `source` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:下游1:上游',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tid_date` (`tid`,`create_time`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `admin_id` (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_reply`
--

LOCK TABLES `shd_ticket_reply` WRITE;
/*!40000 ALTER TABLE `shd_ticket_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_status`
--

DROP TABLE IF EXISTS `shd_ticket_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_status` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT '标题',
  `color` varchar(20) NOT NULL DEFAULT '' COMMENT 'css颜色代码',
  `order` int(2) NOT NULL DEFAULT '1' COMMENT '排序',
  `show_active` tinyint(1) NOT NULL DEFAULT '0' COMMENT '包括打开的工单',
  `show_await` tinyint(1) NOT NULL DEFAULT '0' COMMENT '包括等待回复',
  `auto_close` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否自动关闭',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='工单状态表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_status`
--

LOCK TABLES `shd_ticket_status` WRITE;
/*!40000 ALTER TABLE `shd_ticket_status` DISABLE KEYS */;
INSERT INTO `shd_ticket_status` VALUES (1,'待处理','#1881EB',5,1,1,1),(2,'已回复','#0BCF15',5,1,0,1),(3,'客户回复','#ff6600',2,1,1,1),(4,'关闭','#888888',3,1,1,1),(5,'处理中','#DDE01A',6,1,1,1);
/*!40000 ALTER TABLE `shd_ticket_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_ticket_transfer_log`
--

DROP TABLE IF EXISTS `shd_ticket_transfer_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_ticket_transfer_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT '工单ID',
  `desc` varchar(1000) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '描述',
  `remarks` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '备注',
  `mode` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:指定处理人1:移动部门',
  `old_handle` int(11) NOT NULL DEFAULT '0' COMMENT '原处理人ID',
  `handle` int(11) NOT NULL DEFAULT '0' COMMENT '处理人ID',
  `old_dptid` int(11) NOT NULL DEFAULT '0' COMMENT '原部门ID',
  `dptid` int(11) NOT NULL DEFAULT '0' COMMENT '部门ID',
  `admin` int(11) NOT NULL DEFAULT '0' COMMENT '操作人ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `admin` (`admin`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='工单转移日志';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_ticket_transfer_log`
--

LOCK TABLES `shd_ticket_transfer_log` WRITE;
/*!40000 ALTER TABLE `shd_ticket_transfer_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_ticket_transfer_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_transfer`
--

DROP TABLE IF EXISTS `shd_transfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_transfer` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `uid` int(10) DEFAULT NULL,
  `host_id` int(10) DEFAULT NULL COMMENT '机器id',
  `transfer_uid` int(10) DEFAULT NULL COMMENT '接受人uid',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `status` int(1) DEFAULT NULL COMMENT '0:提交转移,1:转移成功,2:拒绝,3.过期未接收',
  `create_time` int(10) DEFAULT NULL,
  `update_time` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`),
  KEY `host_id` (`host_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_transfer`
--

LOCK TABLES `shd_transfer` WRITE;
/*!40000 ALTER TABLE `shd_transfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_transfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_upgrades`
--

DROP TABLE IF EXISTS `shd_upgrades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_upgrades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `type` enum('service','addon','product','configoptions') NOT NULL,
  `date` int(11) NOT NULL DEFAULT '0',
  `relid` int(11) NOT NULL DEFAULT '0',
  `original_value` varchar(1000) NOT NULL DEFAULT '',
  `new_value` varchar(1000) NOT NULL DEFAULT '',
  `new_cycle` varchar(30) NOT NULL DEFAULT '',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `credit_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `days_remaining` int(11) NOT NULL DEFAULT '0',
  `total_days_in_cycle` int(11) NOT NULL DEFAULT '0',
  `new_recurring_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `recurring_change` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` enum('Pending','Completed') NOT NULL,
  `paid` enum('Y','N') NOT NULL,
  `description` varchar(1024) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orderid` (`order_id`) USING BTREE,
  KEY `relid` (`relid`) USING BTREE,
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_upgrades`
--

LOCK TABLES `shd_upgrades` WRITE;
/*!40000 ALTER TABLE `shd_upgrades` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_upgrades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_upper_manual_info`
--

DROP TABLE IF EXISTS `shd_upper_manual_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_upper_manual_info` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hid` int(11) NOT NULL DEFAULT '0' COMMENT '产品ID,host表id',
  `regate` text COMMENT '到期时间',
  `amount` text COMMENT '金额',
  `billingcycle` text COMMENT '周期',
  `dedicatedip` text COMMENT 'ip',
  `assignedips` text COMMENT '分配ip',
  `create_time` text COMMENT '开通时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `hid` (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_upper_manual_info`
--

LOCK TABLES `shd_upper_manual_info` WRITE;
/*!40000 ALTER TABLE `shd_upper_manual_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_upper_manual_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_upper_reaches`
--

DROP TABLE IF EXISTS `shd_upper_reaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_upper_reaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '上游名称',
  `phone` varchar(12) NOT NULL DEFAULT '' COMMENT '联系方式',
  `bz` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_upper_reaches`
--

LOCK TABLES `shd_upper_reaches` WRITE;
/*!40000 ALTER TABLE `shd_upper_reaches` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_upper_reaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_upper_reaches_ip`
--

DROP TABLE IF EXISTS `shd_upper_reaches_ip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_upper_reaches_ip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT '上游名称',
  `resid` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_upper_reaches_ip`
--

LOCK TABLES `shd_upper_reaches_ip` WRITE;
/*!40000 ALTER TABLE `shd_upper_reaches_ip` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_upper_reaches_ip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_upper_reaches_res`
--

DROP TABLE IF EXISTS `shd_upper_reaches_res`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_upper_reaches_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(255) NOT NULL DEFAULT '' COMMENT '上游名称',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT '上游id',
  `pz` varchar(255) NOT NULL DEFAULT '' COMMENT '配置',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `ipmi` varchar(255) NOT NULL DEFAULT '',
  `root` varchar(255) NOT NULL DEFAULT '',
  `pwd` varchar(255) NOT NULL DEFAULT '',
  `total` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '成本',
  `hid` int(11) NOT NULL DEFAULT '0' COMMENT '云主机id',
  `paid_time` int(11) NOT NULL DEFAULT '0' COMMENT '到期时间',
  `update_time` int(11) NOT NULL DEFAULT '0',
  `in_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '主ip',
  `ipmi_version` varchar(10) NOT NULL DEFAULT '1.5' COMMENT 'ipmi版本',
  `power_status` varchar(10) NOT NULL DEFAULT '' COMMENT '电源状态',
  `control_mode` varchar(255) NOT NULL DEFAULT 'ipmi' COMMENT '控制方式',
  `dcim_client_url` varchar(255) NOT NULL DEFAULT '' COMMENT 'DCIM客户端地址',
  `dcim_client_id` int(11) NOT NULL DEFAULT '0' COMMENT 'DCIM客户端服务器ID',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `mark` varchar(5000) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_upper_reaches_res`
--

LOCK TABLES `shd_upper_reaches_res` WRITE;
/*!40000 ALTER TABLE `shd_upper_reaches_res` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_upper_reaches_res` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_user`
--

DROP TABLE IF EXISTS `shd_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` tinyint(4) DEFAULT NULL COMMENT '用户类型',
  `sex` tinyint(2) NOT NULL DEFAULT '0' COMMENT '性别;0:保密,1:男,2:女',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `last_login_time` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `coin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '金币',
  `balance` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '注册时间',
  `user_status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '用户状态;0:禁用,1:正常,2:未验证',
  `user_login` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码;cmf_password加密',
  `user_nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户昵称',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '用户登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网址',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT '个性签名',
  `last_login_ip` varchar(255) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '中国手机不带国家代码，国际手机号格式为：国家代码-手机号',
  `more` text COMMENT '扩展属性',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '语言',
  `is_sale` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否销售0=默认 1=是',
  `sale_is_use` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否启用0=默认 1=启用',
  `last_act_time` int(11) NOT NULL DEFAULT '0' COMMENT '上次操作时间',
  `only_mine` tinyint(4) NOT NULL DEFAULT '0' COMMENT '只能查看自己的销售人员0关闭 1开启',
  `all_sale` tinyint(4) NOT NULL DEFAULT '0' COMMENT '查看所有销售',
  `is_receive` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否接受业务类邮件',
  `only_oneself_notice` tinyint(4) NOT NULL DEFAULT '0' COMMENT '仅自己客户的工单提醒邮件',
  `cat_ownerless` tinyint(4) NOT NULL DEFAULT '1' COMMENT '未分配客户所有人可见0关闭 1开启',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `user_login` (`user_login`),
  KEY `user_nickname` (`user_nickname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_user`
--

LOCK TABLES `shd_user` WRITE;
/*!40000 ALTER TABLE `shd_user` DISABLE KEYS */;
INSERT INTO `shd_user` VALUES (1,1,0,0,1758904557,0,0,0.00,1758904441,1,'admin','###a58b55e9a247bde1ce3508259a4e81b3','admin','1733206793a@gmail.com','','','','58.253.224.223','','',NULL,'CN',0,0,1758904597,0,0,0,0,1);
/*!40000 ALTER TABLE `shd_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_user_action_logs`
--

DROP TABLE IF EXISTS `shd_user_action_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_user_action_logs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `username` varchar(80) NOT NULL DEFAULT '',
  `method` varchar(50) NOT NULL DEFAULT '' COMMENT '请求方式',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '请求路径',
  `param` varchar(255) DEFAULT NULL COMMENT '请求参数',
  `url` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称;格式:应用名+控制器+操作名,也可自己定义格式只要不发生冲突且惟一;',
  `agent` varchar(50) NOT NULL DEFAULT '' COMMENT '访问端',
  `ip` varchar(15) NOT NULL DEFAULT '' COMMENT '用户ip',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后访问时间',
  `type` varchar(50) DEFAULT NULL COMMENT '类型(操作的主表名)',
  `mid` int(11) DEFAULT NULL COMMENT '变动的表id',
  `handle_id` int(11) DEFAULT NULL COMMENT '执行操作的管理员id',
  `delete_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_object_action` (`uid`,`url`,`action`) USING BTREE,
  KEY `user_object_action_ip` (`uid`,`url`,`action`,`ip`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户行为记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_user_action_logs`
--

LOCK TABLES `shd_user_action_logs` WRITE;
/*!40000 ALTER TABLE `shd_user_action_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_user_action_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_user_product_bates`
--

DROP TABLE IF EXISTS `shd_user_product_bates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_user_product_bates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(2) NOT NULL DEFAULT '0' COMMENT '1 比例  2固定金额  3 优惠',
  `bates` decimal(12,2) DEFAULT '0.00' COMMENT '数值',
  `products` int(11) DEFAULT '0' COMMENT '产品组id',
  `user` int(11) DEFAULT '0' COMMENT '客户组id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_user_product_bates`
--

LOCK TABLES `shd_user_product_bates` WRITE;
/*!40000 ALTER TABLE `shd_user_product_bates` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_user_product_bates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_user_product_groups`
--

DROP TABLE IF EXISTS `shd_user_product_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_user_product_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(255) DEFAULT NULL COMMENT '分组名',
  `pids` text COMMENT '产品组列表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_user_product_groups`
--

LOCK TABLES `shd_user_product_groups` WRITE;
/*!40000 ALTER TABLE `shd_user_product_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_user_product_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_user_products`
--

DROP TABLE IF EXISTS `shd_user_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_user_products` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT '0' COMMENT '产品id',
  `gid` int(10) DEFAULT '0' COMMENT '分组id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `gpid` (`gid`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_user_products`
--

LOCK TABLES `shd_user_products` WRITE;
/*!40000 ALTER TABLE `shd_user_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_user_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_user_tastes`
--

DROP TABLE IF EXISTS `shd_user_tastes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_user_tastes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '管理员id',
  `ticket_refresh` char(20) NOT NULL DEFAULT 'never' COMMENT '工单自动刷新',
  PRIMARY KEY (`id`),
  UNIQUE KEY `tastes_idx_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='管理员喜好';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_user_tastes`
--

LOCK TABLES `shd_user_tastes` WRITE;
/*!40000 ALTER TABLE `shd_user_tastes` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_user_tastes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_user_token`
--

DROP TABLE IF EXISTS `shd_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_user_token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户id',
  `expire_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT ' 过期时间',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `token` varchar(64) NOT NULL DEFAULT '' COMMENT 'token',
  `device_type` varchar(10) NOT NULL DEFAULT '' COMMENT '设备类型;mobile,android,iphone,ipad,web,pc,mac,wxapp',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='用户客户端登录 token 表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_user_token`
--

LOCK TABLES `shd_user_token` WRITE;
/*!40000 ALTER TABLE `shd_user_token` DISABLE KEYS */;
INSERT INTO `shd_user_token` VALUES (1,1,1774456547,1758904547,'e064d2fa253a570523596ec6097646cdb126a3aaf70b72143abdb22b36d5437f','web');
/*!40000 ALTER TABLE `shd_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_userdownloads`
--

DROP TABLE IF EXISTS `shd_userdownloads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_userdownloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '附件名',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件地址',
  `remarks` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '时间',
  `downame` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `adminid` int(11) NOT NULL DEFAULT '0' COMMENT '管理员id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_userdownloads`
--

LOCK TABLES `shd_userdownloads` WRITE;
/*!40000 ALTER TABLE `shd_userdownloads` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_userdownloads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_voucher`
--

DROP TABLE IF EXISTS `shd_voucher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_voucher` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `invoice_id` int(11) NOT NULL DEFAULT '0' COMMENT '新账单ID',
  `post_id` int(11) NOT NULL DEFAULT '0' COMMENT '邮寄地址ID',
  `type_id` int(11) NOT NULL DEFAULT '0' COMMENT '发票类型ID',
  `express_id` int(11) NOT NULL DEFAULT '0' COMMENT '快递ID',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `check_time` int(11) NOT NULL DEFAULT '0' COMMENT '审核时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` varchar(25) NOT NULL DEFAULT 'Pending' COMMENT '状态:Pending,Cancelled取消，Reject驳回，Unpaid待支付，Send已发出',
  `notes` varchar(500) NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `post_id` (`post_id`),
  KEY `type_id` (`type_id`),
  KEY `invoice_id` (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_voucher`
--

LOCK TABLES `shd_voucher` WRITE;
/*!40000 ALTER TABLE `shd_voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_voucher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_voucher_invoices`
--

DROP TABLE IF EXISTS `shd_voucher_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_voucher_invoices` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL DEFAULT '0',
  `invoice_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_voucher_invoices`
--

LOCK TABLES `shd_voucher_invoices` WRITE;
/*!40000 ALTER TABLE `shd_voucher_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_voucher_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_voucher_post`
--

DROP TABLE IF EXISTS `shd_voucher_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_voucher_post` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '收件人姓名',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `province` varchar(100) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(100) NOT NULL DEFAULT '' COMMENT '市',
  `region` varchar(100) NOT NULL DEFAULT '' COMMENT '区',
  `detail` varchar(500) NOT NULL DEFAULT '' COMMENT '详细地址',
  `post` varchar(50) NOT NULL DEFAULT '' COMMENT '邮编',
  `default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认：0否，1是',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_voucher_post`
--

LOCK TABLES `shd_voucher_post` WRITE;
/*!40000 ALTER TABLE `shd_voucher_post` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_voucher_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_voucher_type`
--

DROP TABLE IF EXISTS `shd_voucher_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_voucher_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '客户ID',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '抬头信息',
  `issue_type` varchar(50) NOT NULL DEFAULT '' COMMENT '开具类型person个人，company企业',
  `voucher_type` varchar(50) NOT NULL DEFAULT '' COMMENT '发票类型：common普通，dedicated专用',
  `tax_id` varchar(100) NOT NULL DEFAULT '' COMMENT '税务登记号',
  `bank` varchar(100) NOT NULL DEFAULT '' COMMENT '开户行名称',
  `account` varchar(100) NOT NULL DEFAULT '' COMMENT '开户银行账号',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '公司地址',
  `phone` varchar(100) NOT NULL DEFAULT '' COMMENT '联系电话',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_voucher_type`
--

LOCK TABLES `shd_voucher_type` WRITE;
/*!40000 ALTER TABLE `shd_voucher_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_voucher_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_wechat_user`
--

DROP TABLE IF EXISTS `shd_wechat_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_wechat_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL DEFAULT '',
  `nickname` varchar(30) NOT NULL DEFAULT '' COMMENT '昵称',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别 为未知,1 为男性,2 为女性',
  `province` varchar(30) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(30) DEFAULT '' COMMENT '城市',
  `country` varchar(30) NOT NULL DEFAULT '' COMMENT '国家',
  `language` varchar(60) DEFAULT NULL,
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户标识',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='微信用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_wechat_user`
--

LOCK TABLES `shd_wechat_user` WRITE;
/*!40000 ALTER TABLE `shd_wechat_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_wechat_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_withdraw`
--

DROP TABLE IF EXISTS `shd_withdraw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '金额',
  `relid` int(11) NOT NULL DEFAULT '0' COMMENT '支付方式ID',
  `admin` int(11) NOT NULL DEFAULT '0' COMMENT '操作管理员',
  `status` varchar(25) NOT NULL DEFAULT 'Pending' COMMENT '状态:Pending待审核，Cancelled已驳回，Active已通过',
  `cancelled_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '驳回原因',
  `type` varchar(25) NOT NULL DEFAULT 'credit' COMMENT '类型:credit余额提现,income收益提现',
  `account_id` int(11) NOT NULL DEFAULT '0' COMMENT '交易流水ID',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`),
  KEY `relid` (`relid`),
  KEY `account_id` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_withdraw`
--

LOCK TABLES `shd_withdraw` WRITE;
/*!40000 ALTER TABLE `shd_withdraw` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_withdraw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_withdraw_method`
--

DROP TABLE IF EXISTS `shd_withdraw_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_withdraw_method` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '收款方式:bank银行卡，alipay支付宝',
  `account_bank` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '开户银行',
  `account_name` varchar(25) NOT NULL DEFAULT '' COMMENT '开户姓名',
  `account_num` varchar(255) NOT NULL DEFAULT '' COMMENT '开户卡号',
  `account_address` varchar(255) NOT NULL DEFAULT '' COMMENT '开户行网点',
  `username` varchar(25) NOT NULL DEFAULT '' COMMENT '姓名',
  `alipay` varchar(255) NOT NULL DEFAULT '' COMMENT '支付宝账号',
  `default` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否默认:1默认，0否',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='提现方式';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_withdraw_method`
--

LOCK TABLES `shd_withdraw_method` WRITE;
/*!40000 ALTER TABLE `shd_withdraw_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_withdraw_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_zjmf_finance_api`
--

DROP TABLE IF EXISTS `shd_zjmf_finance_api`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_zjmf_finance_api` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `upstream_uid` int(11) NOT NULL DEFAULT '0' COMMENT '上游的clients ID',
  `hostname` varchar(255) NOT NULL DEFAULT '' COMMENT '接口地址',
  `username` varchar(255) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(255) NOT NULL DEFAULT '' COMMENT '密码',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '连接状态0异常,1正常',
  `product_num` int(11) NOT NULL DEFAULT '0' COMMENT '可售商品总数',
  `create_time` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `des` text COMMENT '描述备注',
  `contact_way` varchar(255) NOT NULL DEFAULT '' COMMENT '联系方式',
  `type` varchar(25) NOT NULL DEFAULT 'zjmf_api' COMMENT '上游类型:zjmf_api智简魔方，manual手动',
  `is_resource` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否资源池api:1是，0否默认',
  `ticket_open` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否开启工单传递：1时，0否默认',
  `is_using` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否正在使用的资源池账号',
  `auto_update` tinyint(1) NOT NULL DEFAULT '1' COMMENT '前台订购实时更新库存和商品,1开启默认,0关闭',
  PRIMARY KEY (`id`),
  KEY `upstream_uid` (`upstream_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_zjmf_finance_api`
--

LOCK TABLES `shd_zjmf_finance_api` WRITE;
/*!40000 ALTER TABLE `shd_zjmf_finance_api` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_zjmf_finance_api` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shd_zjmf_pushhost`
--

DROP TABLE IF EXISTS `shd_zjmf_pushhost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shd_zjmf_pushhost` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `host_id` int(10) NOT NULL COMMENT '主机ID',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '1成功,0失败',
  `url` text NOT NULL COMMENT 'url',
  `post_data` text NOT NULL COMMENT '推送给下游信息',
  `time` int(10) NOT NULL COMMENT '上一次推送时间',
  `num` tinyint(2) NOT NULL COMMENT '推送次数',
  PRIMARY KEY (`id`),
  KEY `ststus` (`status`),
  KEY `host_id` (`host_id`),
  KEY `num` (`num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shd_zjmf_pushhost`
--

LOCK TABLES `shd_zjmf_pushhost` WRITE;
/*!40000 ALTER TABLE `shd_zjmf_pushhost` DISABLE KEYS */;
/*!40000 ALTER TABLE `shd_zjmf_pushhost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'cloud2'
--

--
-- Dumping routines for database 'cloud2'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-23 14:40:27
