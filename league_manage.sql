/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.6.17 : Database - league_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`league_manage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `league_manage`;

/*Table structure for table `le_asset` */

DROP TABLE IF EXISTS `le_asset`;

CREATE TABLE `le_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

/*Data for the table `le_asset` */

/*Table structure for table `le_auth_access` */

DROP TABLE IF EXISTS `le_auth_access`;

CREATE TABLE `le_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

/*Data for the table `le_auth_access` */

insert  into `le_auth_access`(`role_id`,`rule_name`,`type`) values (2,'info/league/add','admin_url'),(2,'info/league/index','admin_url'),(2,'admin/league/default','admin_url'),(2,'admin/setting/password_post','admin_url'),(2,'admin/setting/password','admin_url'),(2,'admin/user/userinfo_post','admin_url'),(2,'admin/user/userinfo','admin_url'),(2,'admin/setting/userdefault','admin_url'),(2,'admin/setting/default','admin_url');

/*Table structure for table `le_auth_rule` */

DROP TABLE IF EXISTS `le_auth_rule`;

CREATE TABLE `le_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

/*Data for the table `le_auth_rule` */

insert  into `le_auth_rule`(`id`,`module`,`type`,`name`,`param`,`title`,`status`,`condition`) values (1,'Admin','admin_url','admin/content/default',NULL,'内容管理',1,''),(2,'Api','admin_url','api/guestbookadmin/index',NULL,'所有留言',1,''),(3,'Api','admin_url','api/guestbookadmin/delete',NULL,'删除网站留言',1,''),(4,'Comment','admin_url','comment/commentadmin/index',NULL,'评论管理',1,''),(5,'Comment','admin_url','comment/commentadmin/delete',NULL,'删除评论',1,''),(6,'Comment','admin_url','comment/commentadmin/check',NULL,'评论审核',1,''),(7,'Portal','admin_url','portal/adminpost/index',NULL,'文章管理',1,''),(8,'Portal','admin_url','portal/adminpost/listorders',NULL,'文章排序',1,''),(9,'Portal','admin_url','portal/adminpost/top',NULL,'文章置顶',1,''),(10,'Portal','admin_url','portal/adminpost/recommend',NULL,'文章推荐',1,''),(11,'Portal','admin_url','portal/adminpost/move',NULL,'批量移动',1,''),(12,'Portal','admin_url','portal/adminpost/check',NULL,'文章审核',1,''),(13,'Portal','admin_url','portal/adminpost/delete',NULL,'删除文章',1,''),(14,'Portal','admin_url','portal/adminpost/edit',NULL,'编辑文章',1,''),(15,'Portal','admin_url','portal/adminpost/edit_post',NULL,'提交编辑',1,''),(16,'Portal','admin_url','portal/adminpost/add',NULL,'添加文章',1,''),(17,'Portal','admin_url','portal/adminpost/add_post',NULL,'提交添加',1,''),(18,'Portal','admin_url','portal/adminterm/index',NULL,'分类管理',1,''),(19,'Portal','admin_url','portal/adminterm/listorders',NULL,'文章分类排序',1,''),(20,'Portal','admin_url','portal/adminterm/delete',NULL,'删除分类',1,''),(21,'Portal','admin_url','portal/adminterm/edit',NULL,'编辑分类',1,''),(22,'Portal','admin_url','portal/adminterm/edit_post',NULL,'提交编辑',1,''),(23,'Portal','admin_url','portal/adminterm/add',NULL,'添加分类',1,''),(24,'Portal','admin_url','portal/adminterm/add_post',NULL,'提交添加',1,''),(25,'Portal','admin_url','portal/adminpage/index',NULL,'页面管理',1,''),(26,'Portal','admin_url','portal/adminpage/listorders',NULL,'页面排序',1,''),(27,'Portal','admin_url','portal/adminpage/delete',NULL,'删除页面',1,''),(28,'Portal','admin_url','portal/adminpage/edit',NULL,'编辑页面',1,''),(29,'Portal','admin_url','portal/adminpage/edit_post',NULL,'提交编辑',1,''),(30,'Portal','admin_url','portal/adminpage/add',NULL,'添加页面',1,''),(31,'Portal','admin_url','portal/adminpage/add_post',NULL,'提交添加',1,''),(32,'Admin','admin_url','admin/recycle/default',NULL,'回收站',1,''),(33,'Portal','admin_url','portal/adminpost/recyclebin',NULL,'文章回收',1,''),(34,'Portal','admin_url','portal/adminpost/restore',NULL,'文章还原',1,''),(35,'Portal','admin_url','portal/adminpost/clean',NULL,'彻底删除',1,''),(36,'Portal','admin_url','portal/adminpage/recyclebin',NULL,'页面回收',1,''),(37,'Portal','admin_url','portal/adminpage/clean',NULL,'彻底删除',1,''),(38,'Portal','admin_url','portal/adminpage/restore',NULL,'页面还原',1,''),(39,'Admin','admin_url','admin/extension/default',NULL,'扩展工具',1,''),(40,'Admin','admin_url','admin/backup/default',NULL,'备份管理',1,''),(41,'Admin','admin_url','admin/backup/restore',NULL,'数据还原',1,''),(42,'Admin','admin_url','admin/backup/index',NULL,'数据备份',1,''),(43,'Admin','admin_url','admin/backup/index_post',NULL,'提交数据备份',1,''),(44,'Admin','admin_url','admin/backup/download',NULL,'下载备份',1,''),(45,'Admin','admin_url','admin/backup/del_backup',NULL,'删除备份',1,''),(46,'Admin','admin_url','admin/backup/import',NULL,'数据备份导入',1,''),(47,'Admin','admin_url','admin/plugin/index',NULL,'插件管理',1,''),(48,'Admin','admin_url','admin/plugin/toggle',NULL,'插件启用切换',1,''),(49,'Admin','admin_url','admin/plugin/setting',NULL,'插件设置',1,''),(50,'Admin','admin_url','admin/plugin/setting_post',NULL,'插件设置提交',1,''),(51,'Admin','admin_url','admin/plugin/install',NULL,'插件安装',1,''),(52,'Admin','admin_url','admin/plugin/uninstall',NULL,'插件卸载',1,''),(53,'Admin','admin_url','admin/slide/default',NULL,'幻灯片',1,''),(54,'Admin','admin_url','admin/slide/index',NULL,'幻灯片管理',1,''),(55,'Admin','admin_url','admin/slide/listorders',NULL,'幻灯片排序',1,''),(56,'Admin','admin_url','admin/slide/toggle',NULL,'幻灯片显示切换',1,''),(57,'Admin','admin_url','admin/slide/delete',NULL,'删除幻灯片',1,''),(58,'Admin','admin_url','admin/slide/edit',NULL,'编辑幻灯片',1,''),(59,'Admin','admin_url','admin/slide/edit_post',NULL,'提交编辑',1,''),(60,'Admin','admin_url','admin/slide/add',NULL,'添加幻灯片',1,''),(61,'Admin','admin_url','admin/slide/add_post',NULL,'提交添加',1,''),(62,'Admin','admin_url','admin/slidecat/index',NULL,'幻灯片分类',1,''),(63,'Admin','admin_url','admin/slidecat/delete',NULL,'删除分类',1,''),(64,'Admin','admin_url','admin/slidecat/edit',NULL,'编辑分类',1,''),(65,'Admin','admin_url','admin/slidecat/edit_post',NULL,'提交编辑',1,''),(66,'Admin','admin_url','admin/slidecat/add',NULL,'添加分类',1,''),(67,'Admin','admin_url','admin/slidecat/add_post',NULL,'提交添加',1,''),(68,'Admin','admin_url','admin/ad/index',NULL,'网站广告',1,''),(69,'Admin','admin_url','admin/ad/toggle',NULL,'广告显示切换',1,''),(70,'Admin','admin_url','admin/ad/delete',NULL,'删除广告',1,''),(71,'Admin','admin_url','admin/ad/edit',NULL,'编辑广告',1,''),(72,'Admin','admin_url','admin/ad/edit_post',NULL,'提交编辑',1,''),(73,'Admin','admin_url','admin/ad/add',NULL,'添加广告',1,''),(74,'Admin','admin_url','admin/ad/add_post',NULL,'提交添加',1,''),(75,'Admin','admin_url','admin/link/index',NULL,'友情链接',1,''),(76,'Admin','admin_url','admin/link/listorders',NULL,'友情链接排序',1,''),(77,'Admin','admin_url','admin/link/toggle',NULL,'友链显示切换',1,''),(78,'Admin','admin_url','admin/link/delete',NULL,'删除友情链接',1,''),(79,'Admin','admin_url','admin/link/edit',NULL,'编辑友情链接',1,''),(80,'Admin','admin_url','admin/link/edit_post',NULL,'提交编辑',1,''),(81,'Admin','admin_url','admin/link/add',NULL,'添加友情链接',1,''),(82,'Admin','admin_url','admin/link/add_post',NULL,'提交添加',1,''),(83,'Api','admin_url','api/oauthadmin/setting',NULL,'第三方登陆',1,''),(84,'Api','admin_url','api/oauthadmin/setting_post',NULL,'提交设置',1,''),(85,'Admin','admin_url','admin/menu/default',NULL,'菜单管理',1,''),(86,'Admin','admin_url','admin/navcat/default1',NULL,'前台菜单',1,''),(87,'Admin','admin_url','admin/nav/index',NULL,'菜单管理',1,''),(88,'Admin','admin_url','admin/nav/listorders',NULL,'前台导航排序',1,''),(89,'Admin','admin_url','admin/nav/delete',NULL,'删除菜单',1,''),(90,'Admin','admin_url','admin/nav/edit',NULL,'编辑菜单',1,''),(91,'Admin','admin_url','admin/nav/edit_post',NULL,'提交编辑',1,''),(92,'Admin','admin_url','admin/nav/add',NULL,'添加菜单',1,''),(93,'Admin','admin_url','admin/nav/add_post',NULL,'提交添加',1,''),(94,'Admin','admin_url','admin/navcat/index',NULL,'菜单分类',1,''),(95,'Admin','admin_url','admin/navcat/delete',NULL,'删除分类',1,''),(96,'Admin','admin_url','admin/navcat/edit',NULL,'编辑分类',1,''),(97,'Admin','admin_url','admin/navcat/edit_post',NULL,'提交编辑',1,''),(98,'Admin','admin_url','admin/navcat/add',NULL,'添加分类',1,''),(99,'Admin','admin_url','admin/navcat/add_post',NULL,'提交添加',1,''),(100,'Admin','admin_url','admin/menu/index',NULL,'后台菜单',1,''),(101,'Admin','admin_url','admin/menu/add',NULL,'添加菜单',1,''),(102,'Admin','admin_url','admin/menu/add_post',NULL,'提交添加',1,''),(103,'Admin','admin_url','admin/menu/listorders',NULL,'后台菜单排序',1,''),(104,'Admin','admin_url','admin/menu/export_menu',NULL,'菜单备份',1,''),(105,'Admin','admin_url','admin/menu/edit',NULL,'编辑菜单',1,''),(106,'Admin','admin_url','admin/menu/edit_post',NULL,'提交编辑',1,''),(107,'Admin','admin_url','admin/menu/delete',NULL,'删除菜单',1,''),(108,'Admin','admin_url','admin/menu/lists',NULL,'所有菜单',1,''),(109,'Admin','admin_url','admin/setting/default',NULL,'设置',1,''),(110,'Admin','admin_url','admin/setting/userdefault',NULL,'个人信息',1,''),(111,'Admin','admin_url','admin/user/userinfo',NULL,'修改信息',1,''),(112,'Admin','admin_url','admin/user/userinfo_post',NULL,'修改信息提交',1,''),(113,'Admin','admin_url','admin/setting/password',NULL,'修改密码',1,''),(114,'Admin','admin_url','admin/setting/password_post',NULL,'提交修改',1,''),(115,'Admin','admin_url','admin/setting/site',NULL,'网站信息',1,''),(116,'Admin','admin_url','admin/setting/site_post',NULL,'提交修改',1,''),(117,'Admin','admin_url','admin/route/index',NULL,'路由列表',1,''),(118,'Admin','admin_url','admin/route/add',NULL,'路由添加',1,''),(119,'Admin','admin_url','admin/route/add_post',NULL,'路由添加提交',1,''),(120,'Admin','admin_url','admin/route/edit',NULL,'路由编辑',1,''),(121,'Admin','admin_url','admin/route/edit_post',NULL,'路由编辑提交',1,''),(122,'Admin','admin_url','admin/route/delete',NULL,'路由删除',1,''),(123,'Admin','admin_url','admin/route/ban',NULL,'路由禁止',1,''),(124,'Admin','admin_url','admin/route/open',NULL,'路由启用',1,''),(125,'Admin','admin_url','admin/route/listorders',NULL,'路由排序',1,''),(126,'Admin','admin_url','admin/mailer/default',NULL,'邮箱配置',1,''),(127,'Admin','admin_url','admin/mailer/index',NULL,'SMTP配置',1,''),(128,'Admin','admin_url','admin/mailer/index_post',NULL,'提交配置',1,''),(129,'Admin','admin_url','admin/mailer/active',NULL,'注册邮件模板',1,''),(130,'Admin','admin_url','admin/mailer/active_post',NULL,'提交模板',1,''),(131,'Admin','admin_url','admin/setting/clearcache',NULL,'清除缓存',1,''),(132,'User','admin_url','user/indexadmin/default',NULL,'用户管理',1,''),(133,'User','admin_url','user/indexadmin/default1',NULL,'用户组',1,''),(134,'User','admin_url','user/indexadmin/index',NULL,'本站用户',1,''),(135,'User','admin_url','user/indexadmin/ban',NULL,'拉黑会员',1,''),(136,'User','admin_url','user/indexadmin/cancelban',NULL,'启用会员',1,''),(137,'User','admin_url','user/oauthadmin/index',NULL,'第三方用户',1,''),(138,'User','admin_url','user/oauthadmin/delete',NULL,'第三方用户解绑',1,''),(139,'User','admin_url','user/indexadmin/default3',NULL,'管理组',1,''),(140,'Admin','admin_url','admin/rbac/index',NULL,'角色管理',1,''),(141,'Admin','admin_url','admin/rbac/member',NULL,'成员管理',1,''),(142,'Admin','admin_url','admin/rbac/authorize',NULL,'权限设置',1,''),(143,'Admin','admin_url','admin/rbac/authorize_post',NULL,'提交设置',1,''),(144,'Admin','admin_url','admin/rbac/roleedit',NULL,'编辑角色',1,''),(145,'Admin','admin_url','admin/rbac/roleedit_post',NULL,'提交编辑',1,''),(146,'Admin','admin_url','admin/rbac/roledelete',NULL,'删除角色',1,''),(147,'Admin','admin_url','admin/rbac/roleadd',NULL,'添加角色',1,''),(148,'Admin','admin_url','admin/rbac/roleadd_post',NULL,'提交添加',1,''),(149,'Admin','admin_url','admin/user/index',NULL,'管理员',1,''),(150,'Admin','admin_url','admin/user/delete',NULL,'删除管理员',1,''),(151,'Admin','admin_url','admin/user/edit',NULL,'管理员编辑',1,''),(152,'Admin','admin_url','admin/user/edit_post',NULL,'编辑提交',1,''),(153,'Admin','admin_url','admin/user/add',NULL,'管理员添加',1,''),(154,'Admin','admin_url','admin/user/add_post',NULL,'添加提交',1,''),(155,'Admin','admin_url','admin/plugin/update',NULL,'插件更新',1,''),(156,'Admin','admin_url','admin/storage/index',NULL,'文件存储',1,''),(157,'Admin','admin_url','admin/storage/setting_post',NULL,'文件存储设置提交',1,''),(158,'Admin','admin_url','admin/slide/ban',NULL,'禁用幻灯片',1,''),(159,'Admin','admin_url','admin/slide/cancelban',NULL,'启用幻灯片',1,''),(160,'Admin','admin_url','admin/user/ban',NULL,'禁用管理员',1,''),(161,'Admin','admin_url','admin/user/cancelban',NULL,'启用管理员',1,''),(162,'Demo','admin_url','demo/adminindex/index',NULL,'',1,''),(163,'Demo','admin_url','demo/adminindex/last',NULL,'',1,''),(166,'Admin','admin_url','admin/mailer/test',NULL,'测试邮件',1,''),(167,'Admin','admin_url','admin/setting/upload',NULL,'上传设置',1,''),(168,'Admin','admin_url','admin/setting/upload_post',NULL,'上传设置提交',1,''),(169,'Portal','admin_url','portal/adminpost/copy',NULL,'文章批量复制',1,''),(170,'Admin','admin_url','admin/menu/backup_menu',NULL,'备份菜单',1,''),(171,'Admin','admin_url','admin/menu/export_menu_lang',NULL,'导出后台菜单多语言包',1,''),(172,'Admin','admin_url','admin/menu/restore_menu',NULL,'还原菜单',1,''),(173,'Admin','admin_url','admin/menu/getactions',NULL,'导入新菜单',1,''),(174,'Admin','admin_url','admin/league/default',NULL,'共青团信息管理',1,''),(175,'Info','admin_url','info/league/index',NULL,'共青团管理',1,''),(176,'Info','admin_url','info/league/add',NULL,'添加新团员',1,'');

/*Table structure for table `le_common_action_log` */

DROP TABLE IF EXISTS `le_common_action_log`;

CREATE TABLE `le_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

/*Data for the table `le_common_action_log` */

/*Table structure for table `le_dept` */

DROP TABLE IF EXISTS `le_dept`;

CREATE TABLE `le_dept` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT '科系名',
  `create_time` datetime NOT NULL DEFAULT '2010-01-01 12:03:05' COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT '2000-01-01 12:03:05' COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='科系表';

/*Data for the table `le_dept` */

insert  into `le_dept`(`id`,`name`,`create_time`,`update_time`) values (1,'计算机科学与网络安全学院','2017-04-06 11:03:05','2017-04-06 11:03:05'),(2,'通信学院','2017-04-06 11:03:05','2017-04-06 11:03:05'),(3,'微电子学院','2017-04-06 11:03:05','2017-04-06 11:03:05'),(4,'机械学院','2010-01-01 12:03:05','2000-01-01 12:03:05'),(5,'汽车学院','2010-01-01 12:03:05','2000-01-01 12:03:05'),(6,'经管学院','2010-01-01 12:03:05','2000-01-01 12:03:05');

/*Table structure for table `le_member` */

DROP TABLE IF EXISTS `le_member`;

CREATE TABLE `le_member` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) DEFAULT NULL COMMENT '名字',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `idcode` varchar(255) DEFAULT NULL COMMENT '身份证号',
  `native_place` varchar(50) DEFAULT NULL COMMENT '籍贯',
  `join_time` datetime DEFAULT '2012-01-01 10:06:20' COMMENT '入团时间',
  `status` int(2) DEFAULT '0' COMMENT '入团状态，1已审核，0未审核',
  `dept_id` int(11) DEFAULT '0' COMMENT '所属院系ID',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '所属院系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='共青团员信息表';

/*Data for the table `le_member` */

insert  into `le_member`(`id`,`user_name`,`sex`,`idcode`,`native_place`,`join_time`,`status`,`dept_id`,`dept_name`) values (1,'张超',1,'620523198802181255','甘肃天水','2017-04-08 10:01:14',1,1,'计算机科学与网络安全学院'),(2,'王莉莉',2,'610523198802181486','北京西城区','2017-04-07 10:12:00',1,1,'计算机科学与网络安全学院'),(3,'李梅',2,'620523198802281266','陕西西安','2017-04-08 10:02:27',0,1,'计算机科学与网络安全学院'),(4,'杨芳',2,'620523198802181200','甘肃天水','2017-04-08 10:13:10',0,1,'计算机科学与网络安全学院'),(10,'test1',2,'620523198802181200','甘肃天水','2017-04-08 12:02:00',0,1,'计算机科学与网络安全学院'),(11,'test2',2,'620523198802181255','甘肃天水','2017-04-06 12:02:00',0,1,'计算机科学与网络安全学院'),(9,'sfsd',1,'620523198802181255','甘肃天水','2017-04-07 12:02:00',0,1,'计算机科学与网络安全学院'),(12,'邓芳',2,'620523198802181255','陕西西安','2017-04-08 16:30:00',0,1,'计算机科学与网络安全学院');

/*Table structure for table `le_menu` */

DROP TABLE IF EXISTS `le_menu`;

CREATE TABLE `le_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` varchar(30) NOT NULL DEFAULT '' COMMENT '应用名称app',
  `model` varchar(30) NOT NULL DEFAULT '' COMMENT '控制器',
  `action` varchar(50) NOT NULL DEFAULT '' COMMENT '操作名称',
  `data` varchar(50) NOT NULL DEFAULT '' COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

/*Data for the table `le_menu` */

insert  into `le_menu`(`id`,`parentid`,`app`,`model`,`action`,`data`,`type`,`status`,`name`,`icon`,`remark`,`listorder`) values (109,0,'Admin','Setting','default','',0,1,'设置','cogs','',0),(110,109,'Admin','Setting','userdefault','',0,1,'个人信息','','',0),(111,110,'Admin','User','userinfo','',1,1,'修改信息','','',0),(112,111,'Admin','User','userinfo_post','',1,0,'修改信息提交','','',0),(113,110,'Admin','Setting','password','',1,1,'修改密码','','',0),(114,113,'Admin','Setting','password_post','',1,0,'提交修改','','',0),(131,109,'Admin','Setting','clearcache','',1,1,'清除缓存','','',1),(132,0,'User','Indexadmin','default','',1,1,'用户管理','group','',10),(133,132,'User','Indexadmin','default1','',1,1,'用户组','','',0),(134,133,'User','Indexadmin','index','',1,1,'本站用户','leaf','',0),(135,134,'User','Indexadmin','ban','',1,0,'拉黑会员','','',0),(136,134,'User','Indexadmin','cancelban','',1,0,'启用会员','','',0),(139,132,'User','Indexadmin','default3','',1,1,'管理组','','',0),(140,139,'Admin','Rbac','index','',1,1,'角色管理','','',0),(141,140,'Admin','Rbac','member','',1,0,'成员管理','','',1000),(142,140,'Admin','Rbac','authorize','',1,0,'权限设置','','',1000),(143,142,'Admin','Rbac','authorize_post','',1,0,'提交设置','','',0),(144,140,'Admin','Rbac','roleedit','',1,0,'编辑角色','','',1000),(145,144,'Admin','Rbac','roleedit_post','',1,0,'提交编辑','','',0),(146,140,'Admin','Rbac','roledelete','',1,1,'删除角色','','',1000),(147,140,'Admin','Rbac','roleadd','',1,1,'添加角色','','',1000),(148,147,'Admin','Rbac','roleadd_post','',1,0,'提交添加','','',0),(149,139,'Admin','User','index','',1,1,'管理员','','',0),(150,149,'Admin','User','delete','',1,0,'删除管理员','','',1000),(151,149,'Admin','User','edit','',1,0,'管理员编辑','','',1000),(152,151,'Admin','User','edit_post','',1,0,'编辑提交','','',0),(153,149,'Admin','User','add','',1,0,'管理员添加','','',1000),(154,153,'Admin','User','add_post','',1,0,'添加提交','','',0),(160,149,'Admin','User','ban','',1,0,'禁用管理员','','',0),(161,149,'Admin','User','cancelban','',1,0,'启用管理员','','',0),(187,0,'Admin','League','default','',0,1,'共青团信息管理','th','',0),(188,187,'Info','League','index','',1,1,'共青团管理','','',0),(189,187,'Info','League','add','',1,1,'添加新团员','','',0);

/*Table structure for table `le_oauth_user` */

DROP TABLE IF EXISTS `le_oauth_user`;

CREATE TABLE `le_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

/*Data for the table `le_oauth_user` */

/*Table structure for table `le_options` */

DROP TABLE IF EXISTS `le_options`;

CREATE TABLE `le_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

/*Data for the table `le_options` */

insert  into `le_options`(`option_id`,`option_name`,`option_value`,`autoload`) values (1,'member_email_active','{\"title\":\"ThinkCMF\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<strong style=\\\"white-space: normal;\\\">---<\\/strong><\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp; ThinkCMF \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}',1),(6,'site_options','            {\n            		\"site_name\":\"ThinkCMF内容管理框架\",\n            		\"site_host\":\"http://localhost/\",\n            		\"site_root\":\"\",\n            		\"site_icp\":\"\",\n            		\"site_admin_email\":\"1222222222@qq.com\",\n            		\"site_tongji\":\"\",\n            		\"site_copyright\":\"\",\n            		\"site_seo_title\":\"ThinkCMF内容管理框架\",\n            		\"site_seo_keywords\":\"ThinkCMF,php,内容管理框架,cmf,cms,简约风, simplewind,framework\",\n            		\"site_seo_description\":\"ThinkCMF是简约风网络科技发布的一款用于快速开发的内容管理框架\"\n        }',1);

/*Table structure for table `le_plugins` */

DROP TABLE IF EXISTS `le_plugins`;

CREATE TABLE `le_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

/*Data for the table `le_plugins` */

/*Table structure for table `le_role` */

DROP TABLE IF EXISTS `le_role`;

CREATE TABLE `le_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Data for the table `le_role` */

insert  into `le_role`(`id`,`name`,`pid`,`status`,`remark`,`create_time`,`update_time`,`listorder`) values (1,'超级管理员',0,1,'拥有网站最高管理员权限！',1329633709,1329633709,0),(2,'学院管理员',NULL,1,'只为学院分配相应的用户管理',1491545074,0,0);

/*Table structure for table `le_role_user` */

DROP TABLE IF EXISTS `le_role_user`;

CREATE TABLE `le_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

/*Data for the table `le_role_user` */

insert  into `le_role_user`(`role_id`,`user_id`) values (2,4),(2,6),(2,7);

/*Table structure for table `le_route` */

DROP TABLE IF EXISTS `le_route`;

CREATE TABLE `le_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

/*Data for the table `le_route` */

/*Table structure for table `le_users` */

DROP TABLE IF EXISTS `le_users`;

CREATE TABLE `le_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT '2000-01-01' COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `dept_id` int(11) DEFAULT '0' COMMENT '所属院系',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `le_users` */

insert  into `le_users`(`id`,`user_login`,`user_pass`,`user_nicename`,`user_email`,`user_url`,`avatar`,`sex`,`birthday`,`signature`,`last_login_ip`,`last_login_time`,`create_time`,`user_activation_key`,`user_status`,`score`,`user_type`,`coin`,`mobile`,`dept_id`) values (1,'admin','###d5a8a6e6cc33c3b9c2b930b69c36fbd0','admin','1222222222@qq.com','',NULL,0,'2000-01-01',NULL,'0.0.0.0','2017-04-08 16:22:25','2017-04-06 06:58:55','',1,0,1,0,'',0),(6,'11111111_qq_com','###d5a8a6e6cc33c3b9c2b930b69c36fbd0','11111111_qq_com','11111111@qq.com','',NULL,1,'1990-01-10','','0.0.0.0','2017-04-08 16:35:19','2017-04-07 19:13:16','',1,0,2,0,'',2),(4,'ying','###d5a8a6e6cc33c3b9c2b930b69c36fbd0','ying','1111111@qq.com','',NULL,0,'2000-01-01',NULL,'0.0.0.0','2017-04-08 14:21:02','2017-04-07 12:02:16','',1,0,2,0,'',1),(7,'122222222_qq_com','###d5a8a6e6cc33c3b9c2b930b69c36fbd0','122222222_qq_com','122222222@qq.com','',NULL,1,'1982-01-06','既要脚踏实地，又要仰望天空！','0.0.0.0','2017-04-08 16:28:32','2017-04-08 16:20:17','',1,0,2,0,'',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
