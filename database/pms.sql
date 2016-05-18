-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 11, 2016 at 08:09 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pms`
--

-- --------------------------------------------------------

--
-- Table structure for table `pms_auditlog`
--

CREATE TABLE IF NOT EXISTS `pms_auditlog` (
`auditlog_id` int(11) NOT NULL,
  `datetime` datetime NOT NULL,
  `type` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `ip_address` varchar(100) NOT NULL,
  `computer_name` varchar(255) NOT NULL,
  `id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_auditlog`
--

INSERT INTO `pms_auditlog` (`auditlog_id`, `datetime`, `type`, `user_id`, `module`, `description`, `ip_address`, `computer_name`, `id`) VALUES
(1, '2016-04-19 11:27:17', 'create', 1, 'timeline', 'ABCD', '::1', 'Tika', NULL),
(2, '2016-04-19 12:25:48', 'update', 1, 'timeline', 'ABCD', '::1', 'Tika', 7),
(3, '2016-04-19 12:35:09', 'update', 1, 'timeline', 'NKTV CMS Intrigation,Date : 2016-04-21,Assign To= 4', '::1', 'Tika', 7),
(4, '2016-04-19 15:22:43', 'update', 1, 'project', 'WITTZY', '::1', 'Tika', 5),
(5, '2016-04-19 15:30:06', 'create', 1, 'timeline', 'Create TimelineMOS CMS Intrigation', '::1', 'Tika', 8),
(6, '2016-04-19 15:33:36', 'create', 1, 'task', 'Create Task ghjgjghj', '::1', 'Tika', 23),
(7, '2016-04-28 09:41:56', 'update', 1, 'task', 'Update Task abcd', '::1', 'Tika', 23),
(8, '2016-04-28 13:57:29', 'create', 1, 'project', 'Create project Nepal Hosting', '::1', 'Tika', 6),
(9, '2016-04-28 13:58:06', 'update', 1, 'project', 'Update project Nepal Hosting', '::1', 'Tika', 6),
(10, '2016-04-28 14:04:01', 'update', 1, 'project', 'Update project Department of Cottage & Small Industry', '::1', 'Tika', 1),
(11, '2016-04-29 10:19:44', 'create', 1, 'task', 'Create Task NH CMS Intrigation', '::1', 'Tika', 24),
(12, '2016-04-29 10:20:30', 'create', 1, 'timeline', 'Create Timeline ', '::1', 'Tika', 9),
(13, '2016-04-29 10:28:12', 'create', 1, 'timeline', 'Create Timeline NH CMS Intrigation', '::1', 'Tika', 10),
(14, '2016-05-03 11:15:49', 'create', 1, 'project', 'Create project ', '::1', 'Tika', 7),
(15, '2016-05-04 13:03:12', 'update', 1, 'project', 'Update project Department of Cottage & Small Industry', '::1', 'Tika', 1),
(16, '2016-05-04 14:52:20', 'update', 1, 'project', 'Update project Department of Cottage & Small Industry', '::1', 'Tika', 1),
(17, '2016-05-04 15:04:50', 'update', 1, 'project', 'Update project Edu Hub Nepal', '::1', 'Tika', 4),
(18, '2016-05-04 15:05:14', 'update', 1, 'project', 'Update project Department of Cottage & Small Industry', '::1', 'Tika', 1),
(19, '2016-05-09 09:56:20', 'create', 1, 'project', 'Create project Travel Beuren', '::1', 'Tika', 7),
(20, '2016-05-09 09:57:22', 'create', 1, 'task', 'Create Task CMS Intrigation Of Travel Beuren', '::1', 'Tika', 25),
(21, '2016-05-09 10:29:04', 'create', 1, 'timeline', 'Create Timeline CMS Intrigation Of Travel Beuren', '::1', 'Tika', 11),
(22, '2016-05-10 09:24:19', 'update', 1, 'timeline', 'Update Timeline CMS Intrigation Of Travel Beuren', '::1', 'Tika', 11),
(23, '2016-05-10 09:31:38', 'create', 1, 'timeline', 'Create Timeline k', '::1', 'Tika', 12),
(24, '2016-05-10 09:32:43', 'create', 1, 'timeline', 'Create Timeline frontend', '::1', 'Tika', 13),
(25, '2016-05-10 16:41:58', 'create', 1, 'timeline', 'Create Timeline abcd', '::1', 'Tika', 14),
(26, '2016-05-11 11:47:12', 'create', 1, 'project', 'Create project Suiren Travel', '::1', 'Tika', 8),
(27, '2016-05-11 11:47:58', 'create', 1, 'project', 'Create project Pacific Bank', '::1', 'Tika', 9),
(28, '2016-05-11 11:48:41', 'update', 1, 'project', 'Update project Suiren Travel', '::1', 'Tika', 8),
(29, '2016-05-11 11:49:30', 'create', 1, 'task', 'Create Task PB CMS Intrigation', '::1', 'Tika', 26);

-- --------------------------------------------------------

--
-- Table structure for table `pms_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `pms_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_auth_assignment`
--

INSERT INTO `pms_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('administrator', 2, 1455526559),
('administrator', 4, 1461831083),
('contributor', 3, 1456389374),
('superadmin', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pms_auth_item`
--

CREATE TABLE IF NOT EXISTS `pms_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_auth_item`
--

INSERT INTO `pms_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrator', 1, 'Administrator', NULL, NULL, 0, 0),
('author', 1, 'Author', NULL, NULL, 0, 0),
('contributor', 1, 'Contributor', NULL, NULL, 0, 0),
('editor', 1, 'Editor', NULL, NULL, 0, 0),
('subscriber', 1, 'Subscriber', NULL, NULL, 0, 0),
('superadmin', 1, 'Super Administrator', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `pms_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `pms_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_auth_item_child`
--

INSERT INTO `pms_auth_item_child` (`parent`, `child`) VALUES
('superadmin', 'administrator'),
('editor', 'author'),
('author', 'contributor'),
('administrator', 'editor'),
('contributor', 'subscriber');

-- --------------------------------------------------------

--
-- Table structure for table `pms_auth_rule`
--

CREATE TABLE IF NOT EXISTS `pms_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pms_checklist`
--

CREATE TABLE IF NOT EXISTS `pms_checklist` (
`cheklist_id` int(11) NOT NULL,
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
  `cheklist_title` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `pms_client`
--

CREATE TABLE IF NOT EXISTS `pms_client` (
`client_id` int(11) NOT NULL,
  `client_name` varchar(150) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_client`
--

INSERT INTO `pms_client` (`client_id`, `client_name`, `mobile`, `email`, `phone`, `address`, `status`, `order`) VALUES
(1, 'Ramesh Gautam', '98491645936', 'ramesh@gamil.com', '093465353453', 'Ktm', 1, 3),
(6, 'Manoj Thapa', '98564543', 'manoj@gmail.com', '01345643534', 'Kalanki', 1, 1),
(8, 'Dipendra Sakya', '9789678678', 'dipendra@gmail.com', '01345643534', 'Lalitpur', 1, 2),
(9, 'Upendra Gurung', '98564543', 'upendra@gmail.com', '01345643534', 'Besisahar', 1, 2),
(10, 'Bent Ray', '9849645936', 'tika.raj@bentraytech.com', '01345643534', 'Lalitpur', 1, 3),
(11, 'Abdul', '98491645936', 'abdul@gmail.com', '01345643534', 'Lalitpur', 1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pms_media`
--

CREATE TABLE IF NOT EXISTS `pms_media` (
`id` int(11) NOT NULL,
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
  `media_comment_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pms_media_comment`
--

CREATE TABLE IF NOT EXISTS `pms_media_comment` (
`id` int(11) NOT NULL,
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
  `comment_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pms_media_meta`
--

CREATE TABLE IF NOT EXISTS `pms_media_meta` (
`id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `meta_name` varchar(255) NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pms_menu`
--

CREATE TABLE IF NOT EXISTS `pms_menu` (
`id` int(11) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `menu_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_menu`
--

INSERT INTO `pms_menu` (`id`, `menu_title`, `menu_location`) VALUES
(1, 'Menu', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pms_menu_item`
--

CREATE TABLE IF NOT EXISTS `pms_menu_item` (
`id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_label` varchar(255) NOT NULL,
  `menu_url` text NOT NULL,
  `menu_description` text,
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `menu_parent` int(11) NOT NULL DEFAULT '0',
  `menu_options` text
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_menu_item`
--

INSERT INTO `pms_menu_item` (`id`, `menu_id`, `menu_label`, `menu_url`, `menu_description`, `menu_order`, `menu_parent`, `menu_options`) VALUES
(1, 1, 'About', '/pmsb/index.php/post/view?id=4', '', 1, 0, NULL),
(2, 1, 'Contact', '/pmsb/index.php/post/view?id=5', '', 2, 0, NULL),
(3, 1, 'Home', '/pmsb/', '', 0, 0, NULL),
(4, 1, 'Photo', '#', '', 0, 5, NULL),
(5, 1, 'GALLERY', '#', '', 3, 0, NULL),
(6, 1, 'Video', '#', '', 1, 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pms_migration`
--

CREATE TABLE IF NOT EXISTS `pms_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_migration`
--

INSERT INTO `pms_migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1454664101),
('m000000_000001_option', 1454664106),
('m000000_000002_user', 1454664106),
('m000000_000003_auth_rule', 1454664107),
('m000000_000004_auth_item', 1454664107),
('m000000_000005_auth_item_child', 1454664108),
('m000000_000006_auth_assignment', 1454664108),
('m000000_000007_post_type', 1454664108),
('m000000_000008_taxonomy', 1454664109),
('m000000_000009_post_type_taxonomy', 1454664109),
('m000000_000010_term', 1454664110),
('m000000_000011_post', 1454664111),
('m000000_000012_term_relationship', 1454664111),
('m000000_000013_post_meta', 1454664111),
('m000000_000014_post_comment', 1454664112),
('m000000_000015_media', 1454664112),
('m000000_000016_media_meta', 1454664112),
('m000000_000017_media_comment', 1454664113),
('m000000_000018_menu', 1454664113),
('m000000_000019_menu_item', 1454664113),
('m000000_000020_module', 1454664113),
('m000000_000021_widget', 1454664115);

-- --------------------------------------------------------

--
-- Table structure for table `pms_module`
--

CREATE TABLE IF NOT EXISTS `pms_module` (
`id` int(11) NOT NULL,
  `module_name` varchar(64) NOT NULL,
  `module_title` text NOT NULL,
  `module_description` text,
  `module_config` text NOT NULL,
  `module_status` smallint(1) NOT NULL DEFAULT '0',
  `module_dir` varchar(128) NOT NULL,
  `module_bb` smallint(1) NOT NULL DEFAULT '0',
  `module_fb` smallint(1) NOT NULL DEFAULT '0',
  `module_date` datetime NOT NULL,
  `module_modified` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_module`
--

INSERT INTO `pms_module` (`id`, `module_name`, `module_title`, `module_description`, `module_config`, `module_status`, `module_dir`, `module_bb`, `module_fb`, `module_date`, `module_modified`) VALUES
(1, 'toolbar', 'Toolbar', NULL, '{"frontend":{"class":"modules\\\\toolbar\\\\frontend\\\\Module"}}', 0, 'toolbar', 0, 1, '2015-09-11 03:14:57', '2015-09-11 03:14:57'),
(2, 'sitemap', 'Site Map', 'Module for sitemap', '{"backend":{"class":"modules\\\\sitemap\\\\backend\\\\Module"},"frontend":{"class":"modules\\\\sitemap\\\\frontend\\\\Module"}}', 0, 'sitemap', 0, 1, '2015-09-11 03:38:25', '2015-09-11 03:38:25'),
(3, 'feed', 'RSS Feed', NULL, '{"frontend":{"class":"modules\\\\feed\\\\frontend\\\\Module"}}', 0, 'feed', 0, 0, '2015-09-11 03:38:53', '2015-09-11 03:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `pms_option`
--

CREATE TABLE IF NOT EXISTS `pms_option` (
`id` int(11) NOT NULL,
  `option_name` varchar(64) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` varchar(64) DEFAULT NULL,
  `option_group` varchar(64) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_option`
--

INSERT INTO `pms_option` (`id`, `option_name`, `option_value`, `option_label`, `option_group`) VALUES
(1, 'sitetitle', 'PROJECT MANAGEMENT SYSTEM', 'Site Title', 'general'),
(2, 'tagline', 'Yii Framework', 'Tagline', 'general'),
(3, 'admin_email', 'tika.raj@bentraytech.com', 'E-mail Address', 'general'),
(4, 'allow_signup', '0', 'Membership', 'general'),
(5, 'default_role', 'subscriber', 'New User Default Role', 'general'),
(6, 'time_zone', 'Asia/Kathmandu', 'Timezone', 'general'),
(7, 'date_format', 'M d, Y', 'Date Format', 'general'),
(8, 'time_format', 'g:i:s a', 'Time Format', 'general'),
(9, 'show_on_front', 'posts', 'Front page displays', 'reading'),
(10, 'front_post_type', 'all', 'Post type on front page', 'reading'),
(11, 'front_page', '', 'Front page', 'reading'),
(12, 'posts_page', '', 'Posts page', 'reading'),
(13, 'posts_per_page', '10', 'Posts Per Page', 'reading'),
(14, 'posts_per_rss', '10', 'Posts Per RSS', 'reading'),
(15, 'rss_use_excerpt', '0', 'For each article in a feed, show ', 'reading'),
(16, 'disable_site_indexing', '0', 'Search Engine Visibility ', 'reading'),
(17, 'default_comment_status', 'open', 'Default article settings', 'discussion'),
(18, 'require_name_email', '1', 'Comment author must fill out name and e-mail ', 'discussion'),
(19, 'comment_registration', '0', 'Users must be registered and logged in to comment ', 'discussion'),
(20, 'close_comments_for_old_posts', '0', 'Automatically close comments on articles older', 'discussion'),
(21, 'close_comments_days_old', '14', 'Days when the comments of the article is closed', 'discussion'),
(22, 'thread_comments', '1', 'Enable threaded (nested) comments', 'discussion'),
(23, 'page_comments', '1', 'Break comments into pages with', 'discussion'),
(24, 'thread_comments_depth', '5', 'Thread Comments Depth', 'discussion'),
(25, 'comments_per_page', '10', 'Top level comments per page', 'discussion'),
(26, 'default_comments_page', 'newest', 'page displayed by default\\nComments should be displayed with the', 'discussion'),
(27, 'comments_notify', '1', 'Notify when anyone posts a comment', 'discussion'),
(28, 'moderation_notify', '0', 'Notify when a comment is held for moderation', 'discussion'),
(29, 'comment_moderation', '1', 'Comment must be manually approved', 'discussion'),
(30, 'comment_whitelist', '0', 'Comment author must have a previously approved comment', 'discussion'),
(31, 'show_avatars', '1', 'Show Avatars', 'discussion'),
(32, 'avatar_rating', 'G', 'Maximum Rating', 'discussion'),
(33, 'avatar_default', 'monsterid', 'Default Avatar', 'discussion'),
(34, 'comment_order', 'asc', 'comments at the top of each page', 'discussion'),
(35, 'thumbnail_width', '150', 'Width', 'media'),
(36, 'thumbnail_height', '150', 'Height', 'media'),
(37, 'thumbnail_crop', '1', 'Crop thumbnail to exact dimensions', 'media'),
(38, 'medium_width', '300', 'Max Width', 'media'),
(39, 'medium_height', '300', 'Max Height', 'media'),
(40, 'large_width', '1024', 'Max Width', 'media'),
(41, 'large_height', '1024', 'Max Height', 'media'),
(42, 'uploads_yearmonth_based', '1', 'Organize my uploads into month- and year-based folders', 'media'),
(43, 'uploads_username_based', '0', 'Organize my uploads into username-based folders', 'media'),
(44, 'theme', 'default', 'Theme', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pms_post`
--

CREATE TABLE IF NOT EXISTS `pms_post` (
`id` int(11) NOT NULL,
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
  `post_comment_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_post`
--

INSERT INTO `pms_post` (`id`, `post_author`, `post_type`, `post_title`, `post_excerpt`, `post_content`, `post_date`, `post_modified`, `post_status`, `post_password`, `post_slug`, `post_comment_status`, `post_comment_count`) VALUES
(1, 1, 1, 'Sample Post', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p><p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.</p><p>Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus.</p>', '2016-02-05 15:06:50', '2016-02-05 15:06:50', 'publish', NULL, 'sample-post', 'open', 1),
(3, 1, 1, 'Abroad', 'asdsadas', '<p>asdsadas</p>', '2016-02-05 11:09:40', '2016-04-28 13:50:01', 'publish', '', 'abroad', 'open', 0),
(4, 1, 2, 'About', ' Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into', '<table class="table table-striped table-bordered">\r\n<tbody>\r\n<tr data-key="3">\r\n<td>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</td>\r\n</tr>\r\n</tbody>\r\n</table>\r\n<table class="table table-striped table-bordered">\r\n<tbody>\r\n<tr data-key="3">\r\n<td>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</td>\r\n</tr>\r\n</tbody>\r\n</table>', '2016-02-15 10:48:14', '2016-04-28 14:43:39', 'publish', '', 'about', 'open', 0),
(5, 1, 2, 'Contact', 'Sales and Marketing Dept. Bent Ray Technologies (P.) Ltd.G.P.O. Box: 19504Jwagal, Lalitpur, NepalTel: +977-1-5526996Email: sales@bentraytech.comURL:&nbsp;www.bentraytech.com,www.nepalhosting.com.np', '<p>Sales and Marketing Dept. <br />Bent Ray Technologies (P.) Ltd.<br />G.P.O. Box: 19504<br />Jwagal, Lalitpur, Nepal<br />Tel: +977-1-5526996<br />Email: <a href="mailto:sales@bentraytech.com">sales@bentraytech.com</a><br />URL:&nbsp;<a href="http://www.bentraytech.com/" target="_blank">www.bentraytech.com</a>,<a href="http://www.nepalhosting.com.np/">www.nepalhosting.com.np</a></p>', '2016-02-16 16:37:42', '2016-04-28 14:44:52', 'publish', '', 'contact', 'open', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pms_post_comment`
--

CREATE TABLE IF NOT EXISTS `pms_post_comment` (
`id` int(11) NOT NULL,
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
  `comment_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_post_comment`
--

INSERT INTO `pms_post_comment` (`id`, `comment_post_id`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_ip`, `comment_date`, `comment_content`, `comment_approved`, `comment_agent`, `comment_parent`, `comment_user_id`) VALUES
(1, 1, 'WD, WritesDown', 'wd@writesdown.com', 'http://www.writesdown.com/', '', '2016-02-05 15:06:52', 'SAMPLE COMMENT: Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris.', 'approved', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pms_post_meta`
--

CREATE TABLE IF NOT EXISTS `pms_post_meta` (
`id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `meta_name` varchar(255) NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pms_post_type`
--

CREATE TABLE IF NOT EXISTS `pms_post_type` (
`id` int(11) NOT NULL,
  `post_type_name` varchar(64) NOT NULL,
  `post_type_slug` varchar(64) NOT NULL,
  `post_type_description` text,
  `post_type_icon` varchar(255) DEFAULT NULL,
  `post_type_sn` varchar(255) NOT NULL,
  `post_type_pn` varchar(255) NOT NULL,
  `post_type_smb` smallint(1) NOT NULL DEFAULT '0',
  `post_type_permission` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_post_type`
--

INSERT INTO `pms_post_type` (`id`, `post_type_name`, `post_type_slug`, `post_type_description`, `post_type_icon`, `post_type_sn`, `post_type_pn`, `post_type_smb`, `post_type_permission`) VALUES
(1, 'post', 'post', NULL, 'fa fa-thumb-tack', 'Post', 'Posts', 0, 'contributor'),
(2, 'page', 'page', NULL, 'fa fa-file-o', 'Page', 'Pages', 1, 'editor');

-- --------------------------------------------------------

--
-- Table structure for table `pms_post_type_taxonomy`
--

CREATE TABLE IF NOT EXISTS `pms_post_type_taxonomy` (
  `post_type_id` int(11) NOT NULL,
  `taxonomy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_post_type_taxonomy`
--

INSERT INTO `pms_post_type_taxonomy` (`post_type_id`, `taxonomy_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pms_project`
--

CREATE TABLE IF NOT EXISTS `pms_project` (
`project_id` int(11) NOT NULL,
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
  `updt_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_project`
--

INSERT INTO `pms_project` (`project_id`, `project_no`, `project_title`, `project_type`, `client_id`, `project_details`, `project_date`, `project_due_date`, `status`, `complate_percent`, `crtd_by`, `crtd_dt`, `updt_dt`, `updt_by`) VALUES
(1, '111-DCSI', 'Department of Cottage & Small Industry', 'WebSite', 1, 'Department of Cottage & Small Industry is government site.', '2016-01-04', '2016-01-29', 3, '100%', NULL, NULL, '2016-05-04', 1),
(2, '112-MOS', 'Ministry of Supplies', 'WebSite', 1, 'Ministry of Supplies', '2016-01-04', '2016-01-29', 2, '80%', 1, '2016-02-16', '2016-02-18', 1),
(3, '113-NKTV', 'Nepal kala', 'WebSite', 6, 'nepal kala', '2016-01-04', '2016-01-29', 2, '95%', 1, '2016-02-18', '2016-02-18', 1),
(4, '114-EDUHUB', 'Edu Hub Nepal', 'WebSite', 6, 'Edu Hub Nepal', '2016-01-04', '2016-01-29', 3, '100%', 1, '2016-02-18', '2016-05-04', 1),
(5, '115-WITTZY', 'WITTZY', 'WebSite', 6, 'movie portal', '2016-04-04', '2016-04-29', 3, '100%', 1, '2016-04-14', '2016-04-19', 1),
(6, '116-NH', 'Nepal Hosting', 'WebSite', 10, 'abcd', '2016-04-25', '2016-04-29', 1, '100%', 1, '2016-04-28', '2016-04-28', 1),
(7, '117-TBNEPAL', 'Travel Beuren', 'WebSite', 11, 'Travel Beuren Site', '2016-05-01', '2016-05-18', 2, NULL, 1, '2016-05-09', NULL, NULL),
(8, '117-SUIREN', 'Suiren Travel', 'WebSite', 8, 'Suiren Travel website', '2016-05-01', '2016-05-31', 2, NULL, 1, '2016-05-11', '2016-05-11', 1),
(9, '118-PB', 'Pacific Bank', 'WebSite', 9, 'Pacific Bank website', '2016-05-01', '2016-05-19', 1, NULL, 1, '2016-05-11', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pms_schedule`
--

CREATE TABLE IF NOT EXISTS `pms_schedule` (
`schedule_id` int(11) NOT NULL,
  `task_id` int(11) DEFAULT NULL,
  `schedule_date` varchar(100) DEFAULT NULL,
  `schedule_hour` varchar(50) DEFAULT NULL,
  `remarks` text,
  `status` int(11) DEFAULT NULL,
  `complate_percent` varchar(50) DEFAULT NULL,
  `crtd_by` int(11) DEFAULT NULL,
  `crtd_dt` date DEFAULT NULL,
  `updt_dt` date DEFAULT NULL,
  `updt_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pms_schedule`
--

INSERT INTO `pms_schedule` (`schedule_id`, `task_id`, `schedule_date`, `schedule_hour`, `remarks`, `status`, `complate_percent`, `crtd_by`, `crtd_dt`, `updt_dt`, `updt_by`) VALUES
(1, 2, '2016-02-26', '4', NULL, NULL, '', NULL, NULL, NULL, NULL),
(2, 1, '2016-02-25', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 1, '2016-02-25', '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 8, '2016-02-27', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 9, '2016-02-27', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 10, '2016-03-01', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 11, '2016-02-01', '3', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(8, 12, '2016-02-03', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 13, '2016-02-03', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 14, '2016-02-04', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(11, 15, '2016-02-04', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(12, 16, '2016-02-04', '5', NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(13, 19, '2016-02-03', '4', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pms_task`
--

CREATE TABLE IF NOT EXISTS `pms_task` (
`task_id` int(11) NOT NULL,
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
  `assign_to` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pms_task`
--

INSERT INTO `pms_task` (`task_id`, `project_id`, `task_title`, `task_type`, `task_hour`, `task_details`, `task_date`, `task_due_date`, `status`, `complate_percent`, `crtd_by`, `crtd_dt`, `updt_dt`, `updt_by`, `assign_to`) VALUES
(2, 2, 'MOS CMS Intrigation', 'WebSite', 5, 'gh', '2016-02-25', '2016-02-25', 1, '0', NULL, NULL, NULL, NULL, 2),
(3, 4, 'EDUHUB CMS Intrigation', 'WebSite', 4, 'f', '2016-02-25', '2016-02-25', 1, '0', NULL, NULL, NULL, NULL, 3),
(4, 4, 'CMS Intrigation', 'WebSite', 4, 'f', '2016-02-25', '2016-02-25', 1, '0', NULL, NULL, NULL, NULL, 3),
(5, 3, 'NKTV CMS Intrigation', 'WebSite', 4, 'fg', '2016-02-25', '2016-02-25', 4, '100%', NULL, NULL, NULL, NULL, 3),
(7, 4, 'k', 'WebSite', 2, 'y', '2016-02-25', '2016-02-26', 1, '0', NULL, NULL, NULL, NULL, 4),
(8, 3, 'k', 'WebSite', 4, '4y', '2016-02-25', '2016-02-27', 1, '0', NULL, NULL, NULL, NULL, 3),
(9, 4, 'frontend', 'WebSite', 9, 'abcd', '2016-02-26', '2016-02-27', 1, '0', NULL, NULL, NULL, NULL, 4),
(10, 4, 'abcd', 'WebSite', 9, 's', '2016-02-29', '2016-03-02', 1, '0', NULL, NULL, NULL, NULL, 4),
(11, 2, 'xyz', 'WebSite', 8, 'da', '2016-02-29', '2016-02-02', 1, '0', NULL, NULL, NULL, NULL, 3),
(12, 2, 'opq', 'WebSite', 9, 'jk', '2016-02-29', '2016-02-04', 1, '0', NULL, NULL, NULL, NULL, 3),
(13, 4, 'jkl', 'WebSite', 8, 'h', '2016-02-29', '2016-02-03', 1, '0', NULL, NULL, NULL, NULL, 4),
(14, 4, 'def', 'WebSite', 9, 'd', '2016-02-29', '2016-02-05', 1, '0', NULL, NULL, NULL, NULL, 3),
(15, 4, 'ghi', 'WebSite', 9, 'b', '2016-02-29', '2016-02-04', 1, '0', NULL, NULL, NULL, NULL, 3),
(16, 2, 'mno', 'WebSite', 9, 'j', '2016-02-29', '2016-02-04', 1, '0', NULL, NULL, NULL, NULL, 3),
(17, 4, 'g', 'WebSite', 8, 'h', '2016-02-29', '2016-02-05', 1, '0', NULL, NULL, NULL, NULL, 3),
(18, 4, 'trs', 'WebSite', 8, 'h', '2016-02-29', '2016-02-08', 1, '0', NULL, NULL, NULL, NULL, 3),
(19, 2, 'k', 'WebSite', 9, 'j', '2016-02-29', '2016-02-04', 1, '0', NULL, NULL, NULL, NULL, 3),
(20, 4, 'CMS Intrigation', 'WebSite', 9, 'dsf', '2016-04-04', '2016-04-23', 4, '100%', NULL, NULL, NULL, NULL, 2),
(21, 3, 'CMS Intrigation', 'WebSite', 8, 'xzc', '2016-04-04', '2016-04-22', 4, '100%', NULL, NULL, NULL, NULL, 3),
(22, 5, 'WITTZY CMS Intrigation', 'WebSite', 9, '', '2016-04-14', '2016-04-29', 1, '0', NULL, NULL, NULL, NULL, 2),
(23, 4, 'abcd', 'WebSite', 8, 'ghj', '2016-04-19', '2016-04-22', 1, '0', NULL, NULL, NULL, NULL, 3),
(24, 6, 'NH CMS Intrigation', 'WebSite', 20, 'abcd', '2016-04-29', '2016-04-30', 1, '0', NULL, NULL, NULL, NULL, 3),
(25, 7, 'CMS Intrigation Of Travel Beuren', 'WebSite', 20, 'sasa', '2016-05-09', '2016-05-26', 1, NULL, NULL, NULL, NULL, NULL, 4),
(26, 9, 'PB CMS Intrigation', 'WebSite', 20, 'acbd', '2016-05-11', '2016-05-11', 3, NULL, NULL, NULL, NULL, NULL, 3);

-- --------------------------------------------------------

--
-- Table structure for table `pms_taxonomy`
--

CREATE TABLE IF NOT EXISTS `pms_taxonomy` (
`id` int(11) NOT NULL,
  `taxonomy_name` varchar(200) NOT NULL,
  `taxonomy_slug` varchar(200) NOT NULL,
  `taxonomy_hierarchical` smallint(1) NOT NULL DEFAULT '0',
  `taxonomy_sn` varchar(255) NOT NULL,
  `taxonomy_pn` varchar(255) NOT NULL,
  `taxonomy_smb` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_taxonomy`
--

INSERT INTO `pms_taxonomy` (`id`, `taxonomy_name`, `taxonomy_slug`, `taxonomy_hierarchical`, `taxonomy_sn`, `taxonomy_pn`, `taxonomy_smb`) VALUES
(1, 'category', 'category', 1, 'Category', 'Categories', 1),
(2, 'tag', 'tag', 0, 'Tag', 'Tags', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pms_term`
--

CREATE TABLE IF NOT EXISTS `pms_term` (
`id` int(11) NOT NULL,
  `taxonomy_id` int(11) NOT NULL,
  `term_name` varchar(200) NOT NULL,
  `term_slug` varchar(200) NOT NULL,
  `term_description` text,
  `term_parent` int(11) DEFAULT '0',
  `term_count` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_term`
--

INSERT INTO `pms_term` (`id`, `taxonomy_id`, `term_name`, `term_slug`, `term_description`, `term_parent`, `term_count`) VALUES
(1, 1, 'Sample Category', 'sample-category', 'Hello there, this is example of category.', 0, 1),
(2, 2, 'Sample Tag', 'sample-tag', 'Hello there, this is an example of tag.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pms_term_relationship`
--

CREATE TABLE IF NOT EXISTS `pms_term_relationship` (
  `post_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_term_relationship`
--

INSERT INTO `pms_term_relationship` (`post_id`, `term_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `pms_timeline`
--

CREATE TABLE IF NOT EXISTS `pms_timeline` (
`timeline_id` int(11) NOT NULL,
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
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `pms_timeline`
--

INSERT INTO `pms_timeline` (`timeline_id`, `schedule_id`, `timeline_date`, `work_hour`, `remarks`, `status`, `complate_percent`, `crtd_by`, `crtd_dt`, `updt_dt`, `updt_by`, `error`, `audit_by`, `audit`, `user_id`) VALUES
(1, 2, '2016-04-21', '6hr', 'hjk', 1, '50%', NULL, NULL, NULL, NULL, 'hjk', 1, 'No', 3),
(2, 2, '2016-04-21', '6hr', 'rtyutyutyurtutuytu', 1, '50%', NULL, NULL, NULL, NULL, 'yutyutyutyutyutrutrutyutyutyutyutyutyruty', 3, 'No', 4),
(3, 4, '2016-04-19', '6hr', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, '50%', NULL, NULL, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 'No', 4),
(4, 4, '2016-04-01', '6hr', 'juhyj', 1, '50%', NULL, NULL, NULL, NULL, 'jgh', 1, 'No', 4),
(5, 5, '2016-04-13', '6hr', 'hjgh', 1, '50%', NULL, NULL, NULL, NULL, 'fgyhfghartzdcf', 1, 'No', 1),
(6, 5, '2016-04-21', '6hr', 'iy', 1, '50%', NULL, NULL, NULL, NULL, 'yi', 1, 'No', 4),
(7, 5, '2016-04-21', '6hr', 'iy', 1, '50%', NULL, NULL, NULL, NULL, 'yi', 1, 'No', 4),
(8, 2, '2016-04-21', '6hr', 'Z', 1, '50%', NULL, NULL, NULL, NULL, 'sad', 3, 'No', 4),
(10, 24, '2016-04-16', '6', 'yi', 1, '50%', NULL, NULL, NULL, NULL, 'iyu', 1, 'No', 4),
(11, 25, '2016-05-12', '20', 'task done', 1, '100%', NULL, NULL, NULL, NULL, 'no', 1, 'Yes', 3),
(12, 8, '2016-05-10', '6hr', 'hjk', 1, '50%', NULL, NULL, NULL, NULL, 'yui', 1, 'No', 1),
(13, 9, '2016-05-10', '6hr', 'tgtt', 1, '100%', NULL, NULL, NULL, NULL, 'fg', 2, 'No', 4);

-- --------------------------------------------------------

--
-- Table structure for table `pms_user`
--

CREATE TABLE IF NOT EXISTS `pms_user` (
`id` int(11) NOT NULL,
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
  `login_at` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pms_user`
--

INSERT INTO `pms_user` (`id`, `username`, `email`, `full_name`, `display_name`, `password_hash`, `password_reset_token`, `auth_key`, `status`, `created_at`, `updated_at`, `login_at`) VALUES
(1, 'superadmin', 'superadministrator@writesdown.com', 'Super Administrator', 'Super Admin', '$2y$13$WJIxqq6WBZUw7tyfN2oiH.WJtPntvLMjs6NG9uW0M3Lh71lImaEyu', NULL, '7QvEmdZDvaSxM1-oYoWkKso0ws6AHTX1', 10, '2016-02-05 15:06:46', '2016-02-05 15:06:46', '2016-02-05 15:06:46'),
(2, 'admin', 'admin@hotmail.com', 'Admin', 'Admin', '$2y$13$uEFd/sz4D6nQxUxOQUgDueM9xTKtAVAcRZZCHEmPWarEUgCl8.SY.', NULL, 'w2gB5NBwTiz9e4Uj92EQ_BpbtkCVgJ4C', 10, '2016-02-15 14:40:59', '2016-02-15 14:40:59', NULL),
(3, 'tikaraj', 'tika.raj@bentraytech.com', 'Tika Raj Shrestha', 'Tika', '$2y$13$Q.JHqgDsKAzDsKi95RmYDu9.KqTnV0FEvZAXRuQzDNnZ3B6k1WcPa', 'TaDRrvsN6qCFTOkVzWYfe0FPWgqo-fpv_1461814291', 'jenr0dJdLGgsoqigEGZBMGB_sSCz-hL8', 10, '2016-02-25 14:21:14', '2016-04-28 09:16:31', NULL),
(4, 'tika', 'tika@gmail.com', 'Tika Shrestha', 'Tika', '$2y$13$8BxUlxJnutg.C3ctUh0xKubqmGcP6XbiChA2IiPmXU9XFOG9Jc7t6', NULL, '7A_hIvkaHSSEIXonSTVFlMB6PfRDh0Dc', 10, '2016-04-14 15:18:49', '2016-04-28 13:56:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pms_visitor_tracker`
--

CREATE TABLE IF NOT EXISTS `pms_visitor_tracker` (
`id` int(11) NOT NULL,
  `country` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `ip` varchar(20) NOT NULL,
  `web_page` varchar(255) NOT NULL,
  `query_string` varchar(255) NOT NULL,
  `http_referer` varchar(255) NOT NULL,
  `http_user_agent` varchar(255) NOT NULL,
  `is_bot` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pms_visitor_tracker`
--

INSERT INTO `pms_visitor_tracker` (`id`, `country`, `city`, `date`, `time`, `ip`, `web_page`, `query_string`, `http_referer`, `http_user_agent`, `is_bot`) VALUES
(1, '', '', '2016-02-12', '12:11:29', '::1', '/dcsi/index.php', '', 'no referer', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36', 0),
(2, '', '', '2016-02-12', '12:17:14', '::1', '/dcsi/index.php', '', 'no referer', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36', 0),
(3, '', '', '2016-02-12', '12:17:36', '::1', '/dcsi/index.php', '', 'http://localhost/dcsi/en', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36', 0),
(4, '', '', '2016-02-12', '12:48:36', '::1', '/dcsi/index.php', '', 'http://localhost/dcsi/post/view?post_slug=introduction', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36', 0),
(5, '', '', '2016-02-12', '12:57:21', '::1', '/dcsi/index.php', '', 'http://localhost/dcsi/site/gallery', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36', 0),
(6, '', '', '2016-02-12', '13:03:52', '::1', '/dcsi/index.php', '', 'no referer', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36', 0),
(7, '', '', '2016-02-12', '14:03:52', '::1', '/dcsi/index.php', '', 'http://localhost/dcsi/files', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36', 0),
(8, '', '', '2016-02-12', '16:49:26', '::1', '/dcsi/index.php', '', 'http://localhost/dcsi/site/publicationdetail?id=36', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.109 Safari/537.36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pms_widget`
--

CREATE TABLE IF NOT EXISTS `pms_widget` (
`id` int(11) NOT NULL,
  `widget_title` varchar(255) NOT NULL,
  `widget_config` text NOT NULL,
  `widget_location` varchar(128) NOT NULL,
  `widget_order` int(11) NOT NULL DEFAULT '0',
  `widget_dir` varchar(128) NOT NULL,
  `widget_date` datetime NOT NULL,
  `widget_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pms_auditlog`
--
ALTER TABLE `pms_auditlog`
 ADD PRIMARY KEY (`auditlog_id`), ADD KEY `user_id_idx` (`user_id`);

--
-- Indexes for table `pms_auth_assignment`
--
ALTER TABLE `pms_auth_assignment`
 ADD PRIMARY KEY (`item_name`,`user_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `pms_auth_item`
--
ALTER TABLE `pms_auth_item`
 ADD PRIMARY KEY (`name`), ADD KEY `rule_name` (`rule_name`);

--
-- Indexes for table `pms_auth_item_child`
--
ALTER TABLE `pms_auth_item_child`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indexes for table `pms_auth_rule`
--
ALTER TABLE `pms_auth_rule`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `pms_checklist`
--
ALTER TABLE `pms_checklist`
 ADD PRIMARY KEY (`cheklist_id`);

--
-- Indexes for table `pms_client`
--
ALTER TABLE `pms_client`
 ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `pms_media`
--
ALTER TABLE `pms_media`
 ADD PRIMARY KEY (`id`), ADD KEY `media_post_id` (`media_post_id`), ADD KEY `media_author` (`media_author`);

--
-- Indexes for table `pms_media_comment`
--
ALTER TABLE `pms_media_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `comment_media_id` (`comment_media_id`);

--
-- Indexes for table `pms_media_meta`
--
ALTER TABLE `pms_media_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `pms_menu`
--
ALTER TABLE `pms_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pms_menu_item`
--
ALTER TABLE `pms_menu_item`
 ADD PRIMARY KEY (`id`), ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `pms_migration`
--
ALTER TABLE `pms_migration`
 ADD PRIMARY KEY (`version`);

--
-- Indexes for table `pms_module`
--
ALTER TABLE `pms_module`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pms_option`
--
ALTER TABLE `pms_option`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pms_post`
--
ALTER TABLE `pms_post`
 ADD PRIMARY KEY (`id`), ADD KEY `post_type` (`post_type`), ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `pms_post_comment`
--
ALTER TABLE `pms_post_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `comment_post_id` (`comment_post_id`);

--
-- Indexes for table `pms_post_meta`
--
ALTER TABLE `pms_post_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `pms_post_type`
--
ALTER TABLE `pms_post_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pms_post_type_taxonomy`
--
ALTER TABLE `pms_post_type_taxonomy`
 ADD PRIMARY KEY (`post_type_id`,`taxonomy_id`), ADD KEY `taxonomy_id` (`taxonomy_id`);

--
-- Indexes for table `pms_project`
--
ALTER TABLE `pms_project`
 ADD PRIMARY KEY (`project_id`), ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `pms_schedule`
--
ALTER TABLE `pms_schedule`
 ADD PRIMARY KEY (`schedule_id`);

--
-- Indexes for table `pms_task`
--
ALTER TABLE `pms_task`
 ADD PRIMARY KEY (`task_id`), ADD KEY `project_id` (`project_id`), ADD KEY `project_id_2` (`project_id`);

--
-- Indexes for table `pms_taxonomy`
--
ALTER TABLE `pms_taxonomy`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pms_term`
--
ALTER TABLE `pms_term`
 ADD PRIMARY KEY (`id`), ADD KEY `taxonomy_id` (`taxonomy_id`);

--
-- Indexes for table `pms_term_relationship`
--
ALTER TABLE `pms_term_relationship`
 ADD PRIMARY KEY (`post_id`,`term_id`), ADD KEY `term_id` (`term_id`);

--
-- Indexes for table `pms_timeline`
--
ALTER TABLE `pms_timeline`
 ADD PRIMARY KEY (`timeline_id`), ADD KEY `schedule_id` (`schedule_id`), ADD KEY `schedule_id_2` (`schedule_id`);

--
-- Indexes for table `pms_user`
--
ALTER TABLE `pms_user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pms_visitor_tracker`
--
ALTER TABLE `pms_visitor_tracker`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pms_widget`
--
ALTER TABLE `pms_widget`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pms_auditlog`
--
ALTER TABLE `pms_auditlog`
MODIFY `auditlog_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `pms_checklist`
--
ALTER TABLE `pms_checklist`
MODIFY `cheklist_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pms_client`
--
ALTER TABLE `pms_client`
MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `pms_media`
--
ALTER TABLE `pms_media`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pms_media_comment`
--
ALTER TABLE `pms_media_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pms_media_meta`
--
ALTER TABLE `pms_media_meta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pms_menu`
--
ALTER TABLE `pms_menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pms_menu_item`
--
ALTER TABLE `pms_menu_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `pms_module`
--
ALTER TABLE `pms_module`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `pms_option`
--
ALTER TABLE `pms_option`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `pms_post`
--
ALTER TABLE `pms_post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `pms_post_comment`
--
ALTER TABLE `pms_post_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pms_post_meta`
--
ALTER TABLE `pms_post_meta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `pms_post_type`
--
ALTER TABLE `pms_post_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pms_project`
--
ALTER TABLE `pms_project`
MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `pms_schedule`
--
ALTER TABLE `pms_schedule`
MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `pms_task`
--
ALTER TABLE `pms_task`
MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `pms_taxonomy`
--
ALTER TABLE `pms_taxonomy`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pms_term`
--
ALTER TABLE `pms_term`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pms_timeline`
--
ALTER TABLE `pms_timeline`
MODIFY `timeline_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `pms_user`
--
ALTER TABLE `pms_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `pms_visitor_tracker`
--
ALTER TABLE `pms_visitor_tracker`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `pms_widget`
--
ALTER TABLE `pms_widget`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `pms_auth_assignment`
--
ALTER TABLE `pms_auth_assignment`
ADD CONSTRAINT `pms_auth_assignment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `pms_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pms_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `pms_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_auth_item`
--
ALTER TABLE `pms_auth_item`
ADD CONSTRAINT `pms_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `pms_auth_rule` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_auth_item_child`
--
ALTER TABLE `pms_auth_item_child`
ADD CONSTRAINT `pms_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `pms_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pms_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `pms_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_media`
--
ALTER TABLE `pms_media`
ADD CONSTRAINT `pms_media_ibfk_1` FOREIGN KEY (`media_post_id`) REFERENCES `pms_post` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `pms_media_ibfk_2` FOREIGN KEY (`media_author`) REFERENCES `pms_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_media_comment`
--
ALTER TABLE `pms_media_comment`
ADD CONSTRAINT `pms_media_comment_ibfk_1` FOREIGN KEY (`comment_media_id`) REFERENCES `pms_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_media_meta`
--
ALTER TABLE `pms_media_meta`
ADD CONSTRAINT `pms_media_meta_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `pms_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_menu_item`
--
ALTER TABLE `pms_menu_item`
ADD CONSTRAINT `pms_menu_item_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `pms_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_post`
--
ALTER TABLE `pms_post`
ADD CONSTRAINT `pms_post_ibfk_1` FOREIGN KEY (`post_type`) REFERENCES `pms_post_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `pms_post_ibfk_2` FOREIGN KEY (`post_author`) REFERENCES `pms_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_post_comment`
--
ALTER TABLE `pms_post_comment`
ADD CONSTRAINT `pms_post_comment_ibfk_1` FOREIGN KEY (`comment_post_id`) REFERENCES `pms_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_post_meta`
--
ALTER TABLE `pms_post_meta`
ADD CONSTRAINT `pms_post_meta_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pms_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_post_type_taxonomy`
--
ALTER TABLE `pms_post_type_taxonomy`
ADD CONSTRAINT `pms_post_type_taxonomy_ibfk_1` FOREIGN KEY (`post_type_id`) REFERENCES `pms_post_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pms_post_type_taxonomy_ibfk_2` FOREIGN KEY (`taxonomy_id`) REFERENCES `pms_taxonomy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_project`
--
ALTER TABLE `pms_project`
ADD CONSTRAINT `pms_project_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `pms_client` (`client_id`);

--
-- Constraints for table `pms_task`
--
ALTER TABLE `pms_task`
ADD CONSTRAINT `pms_task_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `pms_project` (`project_id`);

--
-- Constraints for table `pms_term`
--
ALTER TABLE `pms_term`
ADD CONSTRAINT `pms_term_ibfk_1` FOREIGN KEY (`taxonomy_id`) REFERENCES `pms_taxonomy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_term_relationship`
--
ALTER TABLE `pms_term_relationship`
ADD CONSTRAINT `pms_term_relationship_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `pms_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `pms_term_relationship_ibfk_2` FOREIGN KEY (`term_id`) REFERENCES `pms_term` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pms_timeline`
--
ALTER TABLE `pms_timeline`
ADD CONSTRAINT `pms_timeline_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `pms_task` (`task_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
