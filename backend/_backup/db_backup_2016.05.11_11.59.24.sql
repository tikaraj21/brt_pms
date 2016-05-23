-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `pms_auditlog`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_auditlog`;
CREATE TABLE IF NOT EXISTS `pms_auditlog` (
  `auditlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `datetime` datetime NOT NULL,
  `type` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `id` int(11) DEFAULT NULL,
  PRIMARY KEY (`auditlog_id`),
  KEY `user_id_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `pms_auth_assignment`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_auth_assignment`;
CREATE TABLE IF NOT EXISTS `pms_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pms_auth_assignment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pms_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pms_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `pms_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_auth_item`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_auth_item`;
CREATE TABLE IF NOT EXISTS `pms_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  CONSTRAINT `pms_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `pms_auth_rule` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_auth_item_child`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_auth_item_child`;
CREATE TABLE IF NOT EXISTS `pms_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `pms_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `pms_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pms_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `pms_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_auth_rule`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_auth_rule`;
CREATE TABLE IF NOT EXISTS `pms_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_checklist`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_checklist`;
CREATE TABLE IF NOT EXISTS `pms_checklist` (
  `cheklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` varchar(50) DEFAULT NULL,
  `cheklist_date` varchar(100) DEFAULT NULL,
  `cheklist_hour` varchar(50) DEFAULT NULL,
  `remarks` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `crtd_by` int(11) DEFAULT NULL,
  `crtd_dt` date DEFAULT NULL,
  `updt_dt` date DEFAULT NULL,
  `updt_by` int(11) DEFAULT NULL,
  `error` int(11) DEFAULT NULL,
  `chek_by` int(11) DEFAULT NULL,
  `cheklist_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cheklist_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- -------------------------------------------
-- TABLE `pms_client`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_client`;
CREATE TABLE IF NOT EXISTS `pms_client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(150) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `pms_media`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_media`;
CREATE TABLE IF NOT EXISTS `pms_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_author` int(11) NOT NULL,
  `media_post_id` int(11) DEFAULT NULL,
  `media_title` text NOT NULL,
  `media_excerpt` text,
  `media_content` text,
  `media_password` varchar(255) DEFAULT NULL,
  `media_date` datetime NOT NULL,
  `media_modified` datetime NOT NULL,
  `media_slug` varchar(255) NOT NULL,
  `media_mime_type` varchar(100) NOT NULL,
  `media_comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `media_comment_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `media_post_id` (`media_post_id`),
  KEY `media_author` (`media_author`),
  CONSTRAINT `pms_media_ibfk_1` FOREIGN KEY (`media_post_id`) REFERENCES `pms_post` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pms_media_ibfk_2` FOREIGN KEY (`media_author`) REFERENCES `pms_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_media_comment`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_media_comment`;
CREATE TABLE IF NOT EXISTS `pms_media_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_media_id` int(11) NOT NULL,
  `comment_author` text,
  `comment_author_email` varchar(100) DEFAULT NULL,
  `comment_author_url` varchar(255) DEFAULT NULL,
  `comment_author_ip` varchar(100) NOT NULL,
  `comment_date` datetime NOT NULL,
  `comment_content` text NOT NULL,
  `comment_approved` varchar(20) NOT NULL,
  `comment_agent` varchar(255) NOT NULL,
  `comment_parent` int(11) DEFAULT '0',
  `comment_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_media_id` (`comment_media_id`),
  CONSTRAINT `pms_media_comment_ibfk_1` FOREIGN KEY (`comment_media_id`) REFERENCES `pms_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_media_meta`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_media_meta`;
CREATE TABLE IF NOT EXISTS `pms_media_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) NOT NULL,
  `meta_name` varchar(255) NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `media_id` (`media_id`),
  CONSTRAINT `pms_media_meta_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `pms_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_menu`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_menu`;
CREATE TABLE IF NOT EXISTS `pms_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_title` varchar(255) NOT NULL,
  `menu_location` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_menu_item`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_menu_item`;
CREATE TABLE IF NOT EXISTS `pms_menu_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) NOT NULL,
  `menu_label` varchar(255) NOT NULL,
  `menu_url` text NOT NULL,
  `menu_description` text,
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `menu_parent` int(11) NOT NULL DEFAULT '0',
  `menu_options` text,
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  CONSTRAINT `pms_menu_item_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `pms_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_migration`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_migration`;
CREATE TABLE IF NOT EXISTS `pms_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `pms_module`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_module`;
CREATE TABLE IF NOT EXISTS `pms_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_name` varchar(64) NOT NULL,
  `module_title` text NOT NULL,
  `module_description` text,
  `module_config` text NOT NULL,
  `module_status` smallint(1) NOT NULL DEFAULT '0',
  `module_dir` varchar(128) NOT NULL,
  `module_bb` smallint(1) NOT NULL DEFAULT '0',
  `module_fb` smallint(1) NOT NULL DEFAULT '0',
  `module_date` datetime NOT NULL,
  `module_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_option`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_option`;
CREATE TABLE IF NOT EXISTS `pms_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` varchar(64) DEFAULT NULL,
  `option_group` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_post`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_post`;
CREATE TABLE IF NOT EXISTS `pms_post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_author` int(11) NOT NULL,
  `post_type` int(11) DEFAULT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text,
  `post_content` text,
  `post_date` datetime NOT NULL,
  `post_modified` datetime NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `post_password` varchar(255) DEFAULT NULL,
  `post_slug` varchar(255) NOT NULL,
  `post_comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_comment_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `post_type` (`post_type`),
  KEY `post_author` (`post_author`),
  CONSTRAINT `pms_post_ibfk_1` FOREIGN KEY (`post_type`) REFERENCES `pms_post_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `pms_post_ibfk_2` FOREIGN KEY (`post_author`) REFERENCES `pms_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_post_comment`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_post_comment`;
CREATE TABLE IF NOT EXISTS `pms_post_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_post_id` int(11) NOT NULL,
  `comment_author` text,
  `comment_author_email` varchar(100) DEFAULT NULL,
  `comment_author_url` varchar(255) DEFAULT NULL,
  `comment_author_ip` varchar(100) NOT NULL,
  `comment_date` datetime NOT NULL,
  `comment_content` text NOT NULL,
  `comment_approved` varchar(20) NOT NULL,
  `comment_agent` varchar(255) NOT NULL,
  `comment_parent` int(11) DEFAULT '0',
  `comment_user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_post_id` (`comment_post_id`),
  CONSTRAINT `pms_post_comment_ibfk_1` FOREIGN KEY (`comment_post_id`) REFERENCES `pms_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_post_meta`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_post_meta`;
CREATE TABLE IF NOT EXISTS `pms_post_meta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `meta_name` varchar(255) NOT NULL,
  `meta_value` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id` (`post_id`),
  CONSTRAINT `pms_post_meta_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pms_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_post_type`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_post_type`;
CREATE TABLE IF NOT EXISTS `pms_post_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_type_name` varchar(64) NOT NULL,
  `post_type_slug` varchar(64) NOT NULL,
  `post_type_description` text,
  `post_type_icon` varchar(255) DEFAULT NULL,
  `post_type_sn` varchar(255) NOT NULL,
  `post_type_pn` varchar(255) NOT NULL,
  `post_type_smb` smallint(1) NOT NULL DEFAULT '0',
  `post_type_permission` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_post_type_taxonomy`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_post_type_taxonomy`;
CREATE TABLE IF NOT EXISTS `pms_post_type_taxonomy` (
  `post_type_id` int(11) NOT NULL,
  `taxonomy_id` int(11) NOT NULL,
  PRIMARY KEY (`post_type_id`,`taxonomy_id`),
  KEY `taxonomy_id` (`taxonomy_id`),
  CONSTRAINT `pms_post_type_taxonomy_ibfk_1` FOREIGN KEY (`post_type_id`) REFERENCES `pms_post_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pms_post_type_taxonomy_ibfk_2` FOREIGN KEY (`taxonomy_id`) REFERENCES `pms_taxonomy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_project`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_project`;
CREATE TABLE IF NOT EXISTS `pms_project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_no` varchar(50) DEFAULT NULL,
  `project_title` varchar(100) DEFAULT NULL,
  `project_type` varchar(50) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `project_details` text,
  `project_date` date DEFAULT NULL,
  `project_due_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `complate_percent` varchar(50) DEFAULT NULL,
  `crtd_by` int(11) DEFAULT NULL,
  `crtd_dt` date DEFAULT NULL,
  `updt_dt` date DEFAULT NULL,
  `updt_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `pms_project_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `pms_client` (`client_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `pms_schedule`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_schedule`;
CREATE TABLE IF NOT EXISTS `pms_schedule` (
  `schedule_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_id` int(11) DEFAULT NULL,
  `schedule_date` varchar(100) DEFAULT NULL,
  `schedule_hour` varchar(50) DEFAULT NULL,
  `remarks` text,
  `status` int(11) DEFAULT NULL,
  `complate_percent` varchar(50) DEFAULT NULL,
  `crtd_by` int(11) DEFAULT NULL,
  `crtd_dt` date DEFAULT NULL,
  `updt_dt` date DEFAULT NULL,
  `updt_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- -------------------------------------------
-- TABLE `pms_task`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_task`;
CREATE TABLE IF NOT EXISTS `pms_task` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) DEFAULT NULL,
  `task_title` varchar(100) DEFAULT NULL,
  `task_type` varchar(50) DEFAULT NULL,
  `task_hour` int(11) DEFAULT NULL,
  `task_details` text,
  `task_date` date DEFAULT NULL,
  `task_due_date` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `complate_percent` varchar(50) DEFAULT NULL,
  `crtd_by` int(11) DEFAULT NULL,
  `crtd_dt` date DEFAULT NULL,
  `updt_dt` date DEFAULT NULL,
  `updt_by` int(11) DEFAULT NULL,
  `assign_to` int(11) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `project_id` (`project_id`),
  KEY `project_id_2` (`project_id`),
  CONSTRAINT `pms_task_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `pms_project` (`project_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- -------------------------------------------
-- TABLE `pms_taxonomy`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_taxonomy`;
CREATE TABLE IF NOT EXISTS `pms_taxonomy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxonomy_name` varchar(200) NOT NULL,
  `taxonomy_slug` varchar(200) NOT NULL,
  `taxonomy_hierarchical` smallint(1) NOT NULL DEFAULT '0',
  `taxonomy_sn` varchar(255) NOT NULL,
  `taxonomy_pn` varchar(255) NOT NULL,
  `taxonomy_smb` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_term`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_term`;
CREATE TABLE IF NOT EXISTS `pms_term` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taxonomy_id` int(11) NOT NULL,
  `term_name` varchar(200) NOT NULL,
  `term_slug` varchar(200) NOT NULL,
  `term_description` text,
  `term_parent` int(11) DEFAULT '0',
  `term_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `taxonomy_id` (`taxonomy_id`),
  CONSTRAINT `pms_term_ibfk_1` FOREIGN KEY (`taxonomy_id`) REFERENCES `pms_taxonomy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_term_relationship`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_term_relationship`;
CREATE TABLE IF NOT EXISTS `pms_term_relationship` (
  `post_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`term_id`),
  KEY `term_id` (`term_id`),
  CONSTRAINT `pms_term_relationship_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pms_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `pms_term_relationship_ibfk_2` FOREIGN KEY (`term_id`) REFERENCES `pms_term` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_timeline`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_timeline`;
CREATE TABLE IF NOT EXISTS `pms_timeline` (
  `timeline_id` int(11) NOT NULL AUTO_INCREMENT,
  `schedule_id` int(11) DEFAULT NULL,
  `timeline_date` varchar(100) DEFAULT NULL,
  `work_hour` varchar(50) DEFAULT NULL,
  `remarks` text,
  `status` int(11) DEFAULT NULL,
  `complate_percent` varchar(11) DEFAULT NULL,
  `crtd_by` int(11) DEFAULT NULL,
  `crtd_dt` date DEFAULT NULL,
  `updt_dt` date DEFAULT NULL,
  `updt_by` int(11) DEFAULT NULL,
  `error` text,
  `audit_by` int(11) DEFAULT NULL,
  `audit` varchar(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`timeline_id`),
  KEY `schedule_id` (`schedule_id`),
  KEY `schedule_id_2` (`schedule_id`),
  CONSTRAINT `pms_timeline_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `pms_task` (`task_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- -------------------------------------------
-- TABLE `pms_user`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_user`;
CREATE TABLE IF NOT EXISTS `pms_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `password_reset_token` varchar(255) DEFAULT NULL,
  `auth_key` varchar(32) NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '5',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `login_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `pms_visitor_tracker`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_visitor_tracker`;
CREATE TABLE IF NOT EXISTS `pms_visitor_tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `ip` varchar(20) NOT NULL,
  `web_page` varchar(255) NOT NULL,
  `query_string` varchar(255) NOT NULL,
  `http_referer` varchar(255) NOT NULL,
  `http_user_agent` varchar(255) NOT NULL,
  `is_bot` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- -------------------------------------------
-- TABLE `pms_widget`
-- -------------------------------------------
DROP TABLE IF EXISTS `pms_widget`;
CREATE TABLE IF NOT EXISTS `pms_widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `widget_title` varchar(255) NOT NULL,
  `widget_config` text NOT NULL,
  `widget_location` varchar(128) NOT NULL,
  `widget_order` int(11) NOT NULL DEFAULT '0',
  `widget_dir` varchar(128) NOT NULL,
  `widget_date` datetime NOT NULL,
  `widget_modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE DATA pms_auditlog
-- -------------------------------------------
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('1','2016-04-19 11:27:17','create','1','timeline','ABCD','::1','Tika','');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('2','2016-04-19 12:25:48','update','1','timeline','ABCD','::1','Tika','7');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('3','2016-04-19 12:35:09','update','1','timeline','NKTV CMS Intrigation,Date : 2016-04-21,Assign To= 4','::1','Tika','7');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('4','2016-04-19 15:22:43','update','1','project','WITTZY','::1','Tika','5');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('5','2016-04-19 15:30:06','create','1','timeline','Create TimelineMOS CMS Intrigation','::1','Tika','8');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('6','2016-04-19 15:33:36','create','1','task','Create Task ghjgjghj','::1','Tika','23');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('7','2016-04-28 09:41:56','update','1','task','Update Task abcd','::1','Tika','23');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('8','2016-04-28 13:57:29','create','1','project','Create project Nepal Hosting','::1','Tika','6');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('9','2016-04-28 13:58:06','update','1','project','Update project Nepal Hosting','::1','Tika','6');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('10','2016-04-28 14:04:01','update','1','project','Update project Department of Cottage & Small Industry','::1','Tika','1');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('11','2016-04-29 10:19:44','create','1','task','Create Task NH CMS Intrigation','::1','Tika','24');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('12','2016-04-29 10:20:30','create','1','timeline','Create Timeline ','::1','Tika','9');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('13','2016-04-29 10:28:12','create','1','timeline','Create Timeline NH CMS Intrigation','::1','Tika','10');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('14','2016-05-03 11:15:49','create','1','project','Create project ','::1','Tika','7');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('15','2016-05-04 13:03:12','update','1','project','Update project Department of Cottage & Small Industry','::1','Tika','1');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('16','2016-05-04 14:52:20','update','1','project','Update project Department of Cottage & Small Industry','::1','Tika','1');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('17','2016-05-04 15:04:50','update','1','project','Update project Edu Hub Nepal','::1','Tika','4');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('18','2016-05-04 15:05:14','update','1','project','Update project Department of Cottage & Small Industry','::1','Tika','1');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('19','2016-05-09 09:56:20','create','1','project','Create project Travel Beuren','::1','Tika','7');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('20','2016-05-09 09:57:22','create','1','task','Create Task CMS Intrigation Of Travel Beuren','::1','Tika','25');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('21','2016-05-09 10:29:04','create','1','timeline','Create Timeline CMS Intrigation Of Travel Beuren','::1','Tika','11');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('22','2016-05-10 09:24:19','update','1','timeline','Update Timeline CMS Intrigation Of Travel Beuren','::1','Tika','11');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('23','2016-05-10 09:31:38','create','1','timeline','Create Timeline k','::1','Tika','12');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('24','2016-05-10 09:32:43','create','1','timeline','Create Timeline frontend','::1','Tika','13');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('25','2016-05-10 16:41:58','create','1','timeline','Create Timeline abcd','::1','Tika','14');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('26','2016-05-11 11:47:12','create','1','project','Create project Suiren Travel','::1','Tika','8');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('27','2016-05-11 11:47:58','create','1','project','Create project Pacific Bank','::1','Tika','9');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('28','2016-05-11 11:48:41','update','1','project','Update project Suiren Travel','::1','Tika','8');;;
INSERT INTO `pms_auditlog` (`auditlog_id`,`datetime`,`type`,`user_id`,`module`,`description`,`ip_address`,`computer_name`,`id`) VALUES
('29','2016-05-11 11:49:30','create','1','task','Create Task PB CMS Intrigation','::1','Tika','26');;;



-- -------------------------------------------
-- TABLE DATA pms_auth_assignment
-- -------------------------------------------
INSERT INTO `pms_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('administrator','2','1455526559');;;
INSERT INTO `pms_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('administrator','4','1461831083');;;
INSERT INTO `pms_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('contributor','3','1456389374');;;
INSERT INTO `pms_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('superadmin','1','');;;



-- -------------------------------------------
-- TABLE DATA pms_auth_item
-- -------------------------------------------
INSERT INTO `pms_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('administrator','1','Administrator','','','0','0');;;
INSERT INTO `pms_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('author','1','Author','','','0','0');;;
INSERT INTO `pms_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('contributor','1','Contributor','','','0','0');;;
INSERT INTO `pms_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('editor','1','Editor','','','0','0');;;
INSERT INTO `pms_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('subscriber','1','Subscriber','','','0','0');;;
INSERT INTO `pms_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('superadmin','1','Super Administrator','','','0','0');;;



-- -------------------------------------------
-- TABLE DATA pms_auth_item_child
-- -------------------------------------------
INSERT INTO `pms_auth_item_child` (`parent`,`child`) VALUES
('superadmin','administrator');;;
INSERT INTO `pms_auth_item_child` (`parent`,`child`) VALUES
('editor','author');;;
INSERT INTO `pms_auth_item_child` (`parent`,`child`) VALUES
('author','contributor');;;
INSERT INTO `pms_auth_item_child` (`parent`,`child`) VALUES
('administrator','editor');;;
INSERT INTO `pms_auth_item_child` (`parent`,`child`) VALUES
('contributor','subscriber');;;



-- -------------------------------------------
-- TABLE DATA pms_client
-- -------------------------------------------
INSERT INTO `pms_client` (`client_id`,`client_name`,`mobile`,`email`,`phone`,`address`,`status`,`order`) VALUES
('1','Ramesh Gautam','98491645936','ramesh@gamil.com','093465353453','Ktm','1','3');;;
INSERT INTO `pms_client` (`client_id`,`client_name`,`mobile`,`email`,`phone`,`address`,`status`,`order`) VALUES
('6','Manoj Thapa','98564543','manoj@gmail.com','01345643534','Kalanki','1','1');;;
INSERT INTO `pms_client` (`client_id`,`client_name`,`mobile`,`email`,`phone`,`address`,`status`,`order`) VALUES
('8','Dipendra Sakya','9789678678','dipendra@gmail.com','01345643534','Lalitpur','1','2');;;
INSERT INTO `pms_client` (`client_id`,`client_name`,`mobile`,`email`,`phone`,`address`,`status`,`order`) VALUES
('9','Upendra Gurung','98564543','upendra@gmail.com','01345643534','Besisahar','1','2');;;
INSERT INTO `pms_client` (`client_id`,`client_name`,`mobile`,`email`,`phone`,`address`,`status`,`order`) VALUES
('10','Bent Ray','9849645936','tika.raj@bentraytech.com','01345643534','Lalitpur','1','3');;;
INSERT INTO `pms_client` (`client_id`,`client_name`,`mobile`,`email`,`phone`,`address`,`status`,`order`) VALUES
('11','Abdul','98491645936','abdul@gmail.com','01345643534','Lalitpur','1','5');;;



-- -------------------------------------------
-- TABLE DATA pms_menu
-- -------------------------------------------
INSERT INTO `pms_menu` (`id`,`menu_title`,`menu_location`) VALUES
('1','Menu','');;;



-- -------------------------------------------
-- TABLE DATA pms_menu_item
-- -------------------------------------------
INSERT INTO `pms_menu_item` (`id`,`menu_id`,`menu_label`,`menu_url`,`menu_description`,`menu_order`,`menu_parent`,`menu_options`) VALUES
('1','1','About','/pmsb/index.php/post/view?id=4','','1','0','');;;
INSERT INTO `pms_menu_item` (`id`,`menu_id`,`menu_label`,`menu_url`,`menu_description`,`menu_order`,`menu_parent`,`menu_options`) VALUES
('2','1','Contact','/pmsb/index.php/post/view?id=5','','2','0','');;;
INSERT INTO `pms_menu_item` (`id`,`menu_id`,`menu_label`,`menu_url`,`menu_description`,`menu_order`,`menu_parent`,`menu_options`) VALUES
('3','1','Home','/pmsb/','','0','0','');;;
INSERT INTO `pms_menu_item` (`id`,`menu_id`,`menu_label`,`menu_url`,`menu_description`,`menu_order`,`menu_parent`,`menu_options`) VALUES
('4','1','Photo','#','','0','5','');;;
INSERT INTO `pms_menu_item` (`id`,`menu_id`,`menu_label`,`menu_url`,`menu_description`,`menu_order`,`menu_parent`,`menu_options`) VALUES
('5','1','GALLERY','#','','3','0','');;;
INSERT INTO `pms_menu_item` (`id`,`menu_id`,`menu_label`,`menu_url`,`menu_description`,`menu_order`,`menu_parent`,`menu_options`) VALUES
('6','1','Video','#','','1','5','');;;



-- -------------------------------------------
-- TABLE DATA pms_migration
-- -------------------------------------------
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000000_base','1454664101');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000001_option','1454664106');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000002_user','1454664106');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000003_auth_rule','1454664107');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000004_auth_item','1454664107');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000005_auth_item_child','1454664108');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000006_auth_assignment','1454664108');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000007_post_type','1454664108');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000008_taxonomy','1454664109');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000009_post_type_taxonomy','1454664109');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000010_term','1454664110');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000011_post','1454664111');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000012_term_relationship','1454664111');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000013_post_meta','1454664111');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000014_post_comment','1454664112');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000015_media','1454664112');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000016_media_meta','1454664112');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000017_media_comment','1454664113');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000018_menu','1454664113');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000019_menu_item','1454664113');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000020_module','1454664113');;;
INSERT INTO `pms_migration` (`version`,`apply_time`) VALUES
('m000000_000021_widget','1454664115');;;



-- -------------------------------------------
-- TABLE DATA pms_module
-- -------------------------------------------
INSERT INTO `pms_module` (`id`,`module_name`,`module_title`,`module_description`,`module_config`,`module_status`,`module_dir`,`module_bb`,`module_fb`,`module_date`,`module_modified`) VALUES
('1','toolbar','Toolbar','','{\"frontend\":{\"class\":\"modules\\\\toolbar\\\\frontend\\\\Module\"}}','0','toolbar','0','1','2015-09-11 03:14:57','2015-09-11 03:14:57');;;
INSERT INTO `pms_module` (`id`,`module_name`,`module_title`,`module_description`,`module_config`,`module_status`,`module_dir`,`module_bb`,`module_fb`,`module_date`,`module_modified`) VALUES
('2','sitemap','Site Map','Module for sitemap','{\"backend\":{\"class\":\"modules\\\\sitemap\\\\backend\\\\Module\"},\"frontend\":{\"class\":\"modules\\\\sitemap\\\\frontend\\\\Module\"}}','0','sitemap','0','1','2015-09-11 03:38:25','2015-09-11 03:38:25');;;
INSERT INTO `pms_module` (`id`,`module_name`,`module_title`,`module_description`,`module_config`,`module_status`,`module_dir`,`module_bb`,`module_fb`,`module_date`,`module_modified`) VALUES
('3','feed','RSS Feed','','{\"frontend\":{\"class\":\"modules\\\\feed\\\\frontend\\\\Module\"}}','0','feed','0','0','2015-09-11 03:38:53','2015-09-11 03:38:53');;;



-- -------------------------------------------
-- TABLE DATA pms_option
-- -------------------------------------------
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('1','sitetitle','PROJECT MANAGEMENT SYSTEM','Site Title','general');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('2','tagline','Yii Framework','Tagline','general');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('3','admin_email','tika.raj@bentraytech.com','E-mail Address','general');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('4','allow_signup','0','Membership','general');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('5','default_role','subscriber','New User Default Role','general');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('6','time_zone','Asia/Kathmandu','Timezone','general');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('7','date_format','M d, Y','Date Format','general');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('8','time_format','g:i:s a','Time Format','general');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('9','show_on_front','posts','Front page displays','reading');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('10','front_post_type','all','Post type on front page','reading');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('11','front_page','','Front page','reading');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('12','posts_page','','Posts page','reading');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('13','posts_per_page','10','Posts Per Page','reading');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('14','posts_per_rss','10','Posts Per RSS','reading');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('15','rss_use_excerpt','0','For each article in a feed, show ','reading');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('16','disable_site_indexing','0','Search Engine Visibility ','reading');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('17','default_comment_status','open','Default article settings','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('18','require_name_email','1','Comment author must fill out name and e-mail ','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('19','comment_registration','0','Users must be registered and logged in to comment ','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('20','close_comments_for_old_posts','0','Automatically close comments on articles older','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('21','close_comments_days_old','14','Days when the comments of the article is closed','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('22','thread_comments','1','Enable threaded (nested) comments','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('23','page_comments','1','Break comments into pages with','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('24','thread_comments_depth','5','Thread Comments Depth','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('25','comments_per_page','10','Top level comments per page','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('26','default_comments_page','newest','page displayed by default\\nComments should be displayed with the','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('27','comments_notify','1','Notify when anyone posts a comment','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('28','moderation_notify','0','Notify when a comment is held for moderation','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('29','comment_moderation','1','Comment must be manually approved','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('30','comment_whitelist','0','Comment author must have a previously approved comment','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('31','show_avatars','1','Show Avatars','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('32','avatar_rating','G','Maximum Rating','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('33','avatar_default','monsterid','Default Avatar','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('34','comment_order','asc','comments at the top of each page','discussion');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('35','thumbnail_width','150','Width','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('36','thumbnail_height','150','Height','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('37','thumbnail_crop','1','Crop thumbnail to exact dimensions','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('38','medium_width','300','Max Width','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('39','medium_height','300','Max Height','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('40','large_width','1024','Max Width','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('41','large_height','1024','Max Height','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('42','uploads_yearmonth_based','1','Organize my uploads into month- and year-based folders','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('43','uploads_username_based','0','Organize my uploads into username-based folders','media');;;
INSERT INTO `pms_option` (`id`,`option_name`,`option_value`,`option_label`,`option_group`) VALUES
('44','theme','default','Theme','');;;



-- -------------------------------------------
-- TABLE DATA pms_post
-- -------------------------------------------
INSERT INTO `pms_post` (`id`,`post_author`,`post_type`,`post_title`,`post_excerpt`,`post_content`,`post_date`,`post_modified`,`post_status`,`post_password`,`post_slug`,`post_comment_status`,`post_comment_count`) VALUES
('1','1','1','Sample Post','Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.','<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p><p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.</p><p>Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus.</p>','2016-02-05 15:06:50','2016-02-05 15:06:50','publish','','sample-post','open','1');;;
INSERT INTO `pms_post` (`id`,`post_author`,`post_type`,`post_title`,`post_excerpt`,`post_content`,`post_date`,`post_modified`,`post_status`,`post_password`,`post_slug`,`post_comment_status`,`post_comment_count`) VALUES
('3','1','1','Abroad','asdsadas','<p>asdsadas</p>','2016-02-05 11:09:40','2016-04-28 13:50:01','publish','','abroad','open','0');;;
INSERT INTO `pms_post` (`id`,`post_author`,`post_type`,`post_title`,`post_excerpt`,`post_content`,`post_date`,`post_modified`,`post_status`,`post_password`,`post_slug`,`post_comment_status`,`post_comment_count`) VALUES
('4','1','2','About',' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into','<table class=\"table table-striped table-bordered\">
<tbody>
<tr data-key=\"3\">
<td>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</td>
</tr>
</tbody>
</table>
<table class=\"table table-striped table-bordered\">
<tbody>
<tr data-key=\"3\">
<td>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</td>
</tr>
</tbody>
</table>','2016-02-15 10:48:14','2016-04-28 14:43:39','publish','','about','open','0');;;
INSERT INTO `pms_post` (`id`,`post_author`,`post_type`,`post_title`,`post_excerpt`,`post_content`,`post_date`,`post_modified`,`post_status`,`post_password`,`post_slug`,`post_comment_status`,`post_comment_count`) VALUES
('5','1','2','Contact','Sales and Marketing Dept. Bent Ray Technologies (P.) Ltd.G.P.O. Box: 19504Jwagal, Lalitpur, NepalTel: +977-1-5526996Email: sales@bentraytech.comURL:&nbsp;www.bentraytech.com,www.nepalhosting.com.np','<p>Sales and Marketing Dept. <br />Bent Ray Technologies (P.) Ltd.<br />G.P.O. Box: 19504<br />Jwagal, Lalitpur, Nepal<br />Tel: +977-1-5526996<br />Email: <a href=\"mailto:sales@bentraytech.com\">sales@bentraytech.com</a><br />URL:&nbsp;<a href=\"http://www.bentraytech.com/\" target=\"_blank\">www.bentraytech.com</a>,<a href=\"http://www.nepalhosting.com.np/\">www.nepalhosting.com.np</a></p>','2016-02-16 16:37:42','2016-04-28 14:44:52','publish','','contact','open','0');;;



-- -------------------------------------------
-- TABLE DATA pms_post_comment
-- -------------------------------------------
INSERT INTO `pms_post_comment` (`id`,`comment_post_id`,`comment_author`,`comment_author_email`,`comment_author_url`,`comment_author_ip`,`comment_date`,`comment_content`,`comment_approved`,`comment_agent`,`comment_parent`,`comment_user_id`) VALUES
('1','1','WD, WritesDown','wd@writesdown.com','http://www.writesdown.com/','','2016-02-05 15:06:52','SAMPLE COMMENT: Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris.','approved','','0','');;;



-- -------------------------------------------
-- TABLE DATA pms_post_type
-- -------------------------------------------
INSERT INTO `pms_post_type` (`id`,`post_type_name`,`post_type_slug`,`post_type_description`,`post_type_icon`,`post_type_sn`,`post_type_pn`,`post_type_smb`,`post_type_permission`) VALUES
('1','post','post','','fa fa-thumb-tack','Post','Posts','0','contributor');;;
INSERT INTO `pms_post_type` (`id`,`post_type_name`,`post_type_slug`,`post_type_description`,`post_type_icon`,`post_type_sn`,`post_type_pn`,`post_type_smb`,`post_type_permission`) VALUES
('2','page','page','','fa fa-file-o','Page','Pages','1','editor');;;



-- -------------------------------------------
-- TABLE DATA pms_post_type_taxonomy
-- -------------------------------------------
INSERT INTO `pms_post_type_taxonomy` (`post_type_id`,`taxonomy_id`) VALUES
('1','1');;;
INSERT INTO `pms_post_type_taxonomy` (`post_type_id`,`taxonomy_id`) VALUES
('1','2');;;



-- -------------------------------------------
-- TABLE DATA pms_project
-- -------------------------------------------
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('1','111-DCSI','Department of Cottage & Small Industry','WebSite','1','Department of Cottage & Small Industry is government site.','2016-01-04','2016-01-29','3','100%','','','2016-05-04','1');;;
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('2','112-MOS','Ministry of Supplies','WebSite','1','Ministry of Supplies','2016-01-04','2016-01-29','2','80%','1','2016-02-16','2016-02-18','1');;;
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('3','113-NKTV','Nepal kala','WebSite','6','nepal kala','2016-01-04','2016-01-29','2','95%','1','2016-02-18','2016-02-18','1');;;
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('4','114-EDUHUB','Edu Hub Nepal','WebSite','6','Edu Hub Nepal','2016-01-04','2016-01-29','3','100%','1','2016-02-18','2016-05-04','1');;;
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('5','115-WITTZY','WITTZY','WebSite','6','movie portal','2016-04-04','2016-04-29','3','100%','1','2016-04-14','2016-04-19','1');;;
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('6','116-NH','Nepal Hosting','WebSite','10','abcd','2016-04-25','2016-04-29','1','100%','1','2016-04-28','2016-04-28','1');;;
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('7','117-TBNEPAL','Travel Beuren','WebSite','11','Travel Beuren Site','2016-05-01','2016-05-18','2','','1','2016-05-09','','');;;
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('8','117-SUIREN','Suiren Travel','WebSite','8','Suiren Travel website','2016-05-01','2016-05-31','2','','1','2016-05-11','2016-05-11','1');;;
INSERT INTO `pms_project` (`project_id`,`project_no`,`project_title`,`project_type`,`client_id`,`project_details`,`project_date`,`project_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('9','118-PB','Pacific Bank','WebSite','9','Pacific Bank website','2016-05-01','2016-05-19','1','','1','2016-05-11','','');;;



-- -------------------------------------------
-- TABLE DATA pms_schedule
-- -------------------------------------------
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('1','2','2016-02-26','4','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('2','1','2016-02-25','2','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('3','1','2016-02-25','2','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('4','8','2016-02-27','4','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('5','9','2016-02-27','5','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('6','10','2016-03-01','4','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('7','11','2016-02-01','3','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('8','12','2016-02-03','4','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('9','13','2016-02-03','5','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('10','14','2016-02-04','4','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('11','15','2016-02-04','5','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('12','16','2016-02-04','5','','','','','','','');;;
INSERT INTO `pms_schedule` (`schedule_id`,`task_id`,`schedule_date`,`schedule_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`) VALUES
('13','19','2016-02-03','4','','','','','','','');;;



-- -------------------------------------------
-- TABLE DATA pms_task
-- -------------------------------------------
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('2','2','MOS CMS Intrigation','WebSite','5','gh','2016-02-25','2016-02-25','1','0','','','','','2');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('3','4','EDUHUB CMS Intrigation','WebSite','4','f','2016-02-25','2016-02-25','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('4','4','CMS Intrigation','WebSite','4','f','2016-02-25','2016-02-25','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('5','3','NKTV CMS Intrigation','WebSite','4','fg','2016-02-25','2016-02-25','4','100%','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('7','4','k','WebSite','2','y','2016-02-25','2016-02-26','1','0','','','','','4');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('8','3','k','WebSite','4','4y','2016-02-25','2016-02-27','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('9','4','frontend','WebSite','9','abcd','2016-02-26','2016-02-27','1','0','','','','','4');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('10','4','abcd','WebSite','9','s','2016-02-29','2016-03-02','1','0','','','','','4');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('11','2','xyz','WebSite','8','da','2016-02-29','2016-02-02','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('12','2','opq','WebSite','9','jk','2016-02-29','2016-02-04','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('13','4','jkl','WebSite','8','h','2016-02-29','2016-02-03','1','0','','','','','4');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('14','4','def','WebSite','9','d','2016-02-29','2016-02-05','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('15','4','ghi','WebSite','9','b','2016-02-29','2016-02-04','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('16','2','mno','WebSite','9','j','2016-02-29','2016-02-04','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('17','4','g','WebSite','8','h','2016-02-29','2016-02-05','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('18','4','trs','WebSite','8','h','2016-02-29','2016-02-08','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('19','2','k','WebSite','9','j','2016-02-29','2016-02-04','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('20','4','CMS Intrigation','WebSite','9','dsf','2016-04-04','2016-04-23','4','100%','','','','','2');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('21','3','CMS Intrigation','WebSite','8','xzc','2016-04-04','2016-04-22','4','100%','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('22','5','WITTZY CMS Intrigation','WebSite','9','','2016-04-14','2016-04-29','1','0','','','','','2');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('23','4','abcd','WebSite','8','ghj','2016-04-19','2016-04-22','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('24','6','NH CMS Intrigation','WebSite','20','abcd','2016-04-29','2016-04-30','1','0','','','','','3');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('25','7','CMS Intrigation Of Travel Beuren','WebSite','20','sasa','2016-05-09','2016-05-26','1','','','','','','4');;;
INSERT INTO `pms_task` (`task_id`,`project_id`,`task_title`,`task_type`,`task_hour`,`task_details`,`task_date`,`task_due_date`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`assign_to`) VALUES
('26','9','PB CMS Intrigation','WebSite','20','acbd','2016-05-11','2016-05-11','3','','','','','','3');;;



-- -------------------------------------------
-- TABLE DATA pms_taxonomy
-- -------------------------------------------
INSERT INTO `pms_taxonomy` (`id`,`taxonomy_name`,`taxonomy_slug`,`taxonomy_hierarchical`,`taxonomy_sn`,`taxonomy_pn`,`taxonomy_smb`) VALUES
('1','category','category','1','Category','Categories','1');;;
INSERT INTO `pms_taxonomy` (`id`,`taxonomy_name`,`taxonomy_slug`,`taxonomy_hierarchical`,`taxonomy_sn`,`taxonomy_pn`,`taxonomy_smb`) VALUES
('2','tag','tag','0','Tag','Tags','0');;;



-- -------------------------------------------
-- TABLE DATA pms_term
-- -------------------------------------------
INSERT INTO `pms_term` (`id`,`taxonomy_id`,`term_name`,`term_slug`,`term_description`,`term_parent`,`term_count`) VALUES
('1','1','Sample Category','sample-category','Hello there, this is example of category.','0','1');;;
INSERT INTO `pms_term` (`id`,`taxonomy_id`,`term_name`,`term_slug`,`term_description`,`term_parent`,`term_count`) VALUES
('2','2','Sample Tag','sample-tag','Hello there, this is an example of tag.','0','1');;;



-- -------------------------------------------
-- TABLE DATA pms_term_relationship
-- -------------------------------------------
INSERT INTO `pms_term_relationship` (`post_id`,`term_id`) VALUES
('1','1');;;
INSERT INTO `pms_term_relationship` (`post_id`,`term_id`) VALUES
('1','2');;;



-- -------------------------------------------
-- TABLE DATA pms_timeline
-- -------------------------------------------
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('1','2','2016-04-21','6hr','hjk','1','50%','','','','','hjk','1','No','3');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('2','2','2016-04-21','6hr','rtyutyutyurtutuytu','1','50%','','','','','yutyutyutyutyutrutrutyutyutyutyutyutyruty','3','No','4');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('3','4','2016-04-19','6hr','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','1','50%','','','','','Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','1','No','4');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('4','4','2016-04-01','6hr','juhyj','1','50%','','','','','jgh','1','No','4');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('5','5','2016-04-13','6hr','hjgh','1','50%','','','','','fgyhfghartzdcf','1','No','1');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('6','5','2016-04-21','6hr','iy','1','50%','','','','','yi','1','No','4');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('7','5','2016-04-21','6hr','iy','1','50%','','','','','yi','1','No','4');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('8','2','2016-04-21','6hr','Z','1','50%','','','','','sad','3','No','4');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('10','24','2016-04-16','6','yi','1','50%','','','','','iyu','1','No','4');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('11','25','2016-05-12','20','task done','1','100%','','','','','no','1','Yes','3');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('12','8','2016-05-10','6hr','hjk','1','50%','','','','','yui','1','No','1');;;
INSERT INTO `pms_timeline` (`timeline_id`,`schedule_id`,`timeline_date`,`work_hour`,`remarks`,`status`,`complate_percent`,`crtd_by`,`crtd_dt`,`updt_dt`,`updt_by`,`error`,`audit_by`,`audit`,`user_id`) VALUES
('13','9','2016-05-10','6hr','tgtt','1','100%','','','','','fg','2','No','4');;;



-- -------------------------------------------
-- TABLE DATA pms_user
-- -------------------------------------------
INSERT INTO `pms_user` (`id`,`username`,`email`,`full_name`,`display_name`,`password_hash`,`password_reset_token`,`auth_key`,`status`,`created_at`,`updated_at`,`login_at`) VALUES
('1','superadmin','superadministrator@writesdown.com','Super Administrator','Super Admin','$2y$13$WJIxqq6WBZUw7tyfN2oiH.WJtPntvLMjs6NG9uW0M3Lh71lImaEyu','','7QvEmdZDvaSxM1-oYoWkKso0ws6AHTX1','10','2016-02-05 15:06:46','2016-02-05 15:06:46','2016-02-05 15:06:46');;;
INSERT INTO `pms_user` (`id`,`username`,`email`,`full_name`,`display_name`,`password_hash`,`password_reset_token`,`auth_key`,`status`,`created_at`,`updated_at`,`login_at`) VALUES
('2','admin','admin@hotmail.com','Admin','Admin','$2y$13$uEFd/sz4D6nQxUxOQUgDueM9xTKtAVAcRZZCHEmPWarEUgCl8.SY.','','w2gB5NBwTiz9e4Uj92EQ_BpbtkCVgJ4C','10','2016-02-15 14:40:59','2016-02-15 14:40:59','');;;
INSERT INTO `pms_user` (`id`,`username`,`email`,`full_name`,`display_name`,`password_hash`,`password_reset_token`,`auth_key`,`status`,`created_at`,`updated_at`,`login_at`) VALUES
('3','tikaraj','tika.raj@bentraytech.com','Tika Raj Shrestha','Tika','$2y$13$Q.JHqgDsKAzDsKi95RmYDu9.KqTnV0FEvZAXRuQzDNnZ3B6k1WcPa','TaDRrvsN6qCFTOkVzWYfe0FPWgqo-fpv_1461814291','jenr0dJdLGgsoqigEGZBMGB_sSCz-hL8','10','2016-02-25 14:21:14','2016-04-28 09:16:31','');;;
INSERT INTO `pms_user` (`id`,`username`,`email`,`full_name`,`display_name`,`password_hash`,`password_reset_token`,`auth_key`,`status`,`created_at`,`updated_at`,`login_at`) VALUES
('4','tika','tika@gmail.com','Tika Shrestha','Tika','$2y$13$8BxUlxJnutg.C3ctUh0xKubqmGcP6XbiChA2IiPmXU9XFOG9Jc7t6','','7A_hIvkaHSSEIXonSTVFlMB6PfRDh0Dc','10','2016-04-14 15:18:49','2016-04-28 13:56:23','');;;



-- -------------------------------------------
-- TABLE DATA pms_visitor_tracker
-- -------------------------------------------
INSERT INTO `pms_visitor_tracker` (`id`,`country`,`city`,`date`,`time`,`ip`,`web_page`,`query_string`,`http_referer`,`http_user_agent`,`is_bot`) VALUES
('1','','','2016-02-12','12:11:29','::1','/dcsi/index.php','','no referer','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36','0');;;
INSERT INTO `pms_visitor_tracker` (`id`,`country`,`city`,`date`,`time`,`ip`,`web_page`,`query_string`,`http_referer`,`http_user_agent`,`is_bot`) VALUES
('2','','','2016-02-12','12:17:14','::1','/dcsi/index.php','','no referer','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36','0');;;
INSERT INTO `pms_visitor_tracker` (`id`,`country`,`city`,`date`,`time`,`ip`,`web_page`,`query_string`,`http_referer`,`http_user_agent`,`is_bot`) VALUES
('3','','','2016-02-12','12:17:36','::1','/dcsi/index.php','','http://localhost/dcsi/en','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36','0');;;
INSERT INTO `pms_visitor_tracker` (`id`,`country`,`city`,`date`,`time`,`ip`,`web_page`,`query_string`,`http_referer`,`http_user_agent`,`is_bot`) VALUES
('4','','','2016-02-12','12:48:36','::1','/dcsi/index.php','','http://localhost/dcsi/post/view?post_slug=introduction','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36','0');;;
INSERT INTO `pms_visitor_tracker` (`id`,`country`,`city`,`date`,`time`,`ip`,`web_page`,`query_string`,`http_referer`,`http_user_agent`,`is_bot`) VALUES
('5','','','2016-02-12','12:57:21','::1','/dcsi/index.php','','http://localhost/dcsi/site/gallery','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36','0');;;
INSERT INTO `pms_visitor_tracker` (`id`,`country`,`city`,`date`,`time`,`ip`,`web_page`,`query_string`,`http_referer`,`http_user_agent`,`is_bot`) VALUES
('6','','','2016-02-12','13:03:52','::1','/dcsi/index.php','','no referer','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36','0');;;
INSERT INTO `pms_visitor_tracker` (`id`,`country`,`city`,`date`,`time`,`ip`,`web_page`,`query_string`,`http_referer`,`http_user_agent`,`is_bot`) VALUES
('7','','','2016-02-12','14:03:52','::1','/dcsi/index.php','','http://localhost/dcsi/files','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36','0');;;
INSERT INTO `pms_visitor_tracker` (`id`,`country`,`city`,`date`,`time`,`ip`,`web_page`,`query_string`,`http_referer`,`http_user_agent`,`is_bot`) VALUES
('8','','','2016-02-12','16:49:26','::1','/dcsi/index.php','','http://localhost/dcsi/site/publicationdetail?id=36','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36','0');;;



-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
