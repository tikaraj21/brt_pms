-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2016 at 04:47 AM
-- Server version: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `writesdown`
--

-- --------------------------------------------------------

--
-- Table structure for table `wd_auth_assignment`
--

CREATE TABLE IF NOT EXISTS `wd_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_auth_assignment`
--

INSERT INTO `wd_auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('superadmin', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wd_auth_item`
--

CREATE TABLE IF NOT EXISTS `wd_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_auth_item`
--

INSERT INTO `wd_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('administrator', 1, 'Administrator', NULL, NULL, 0, 0),
('author', 1, 'Author', NULL, NULL, 0, 0),
('contributor', 1, 'Contributor', NULL, NULL, 0, 0),
('editor', 1, 'Editor', NULL, NULL, 0, 0),
('subscriber', 1, 'Subscriber', NULL, NULL, 0, 0),
('superadmin', 1, 'Super Administrator', NULL, NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wd_auth_item_child`
--

CREATE TABLE IF NOT EXISTS `wd_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_auth_item_child`
--

INSERT INTO `wd_auth_item_child` (`parent`, `child`) VALUES
('superadmin', 'administrator'),
('editor', 'author'),
('author', 'contributor'),
('administrator', 'editor'),
('contributor', 'subscriber');

-- --------------------------------------------------------

--
-- Table structure for table `wd_auth_rule`
--

CREATE TABLE IF NOT EXISTS `wd_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wd_media`
--

CREATE TABLE IF NOT EXISTS `wd_media` (
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
-- Table structure for table `wd_media_comment`
--

CREATE TABLE IF NOT EXISTS `wd_media_comment` (
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
-- Table structure for table `wd_media_meta`
--

CREATE TABLE IF NOT EXISTS `wd_media_meta` (
`id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `meta_name` varchar(255) NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wd_menu`
--

CREATE TABLE IF NOT EXISTS `wd_menu` (
`id` int(11) NOT NULL,
  `menu_title` varchar(255) NOT NULL,
  `menu_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_menu`
--

INSERT INTO `wd_menu` (`id`, `menu_title`, `menu_location`) VALUES
(1, 'Home', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wd_menu_item`
--

CREATE TABLE IF NOT EXISTS `wd_menu_item` (
`id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `menu_label` varchar(255) NOT NULL,
  `menu_url` text NOT NULL,
  `menu_description` text,
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `menu_parent` int(11) NOT NULL DEFAULT '0',
  `menu_options` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wd_migration`
--

CREATE TABLE IF NOT EXISTS `wd_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wd_migration`
--

INSERT INTO `wd_migration` (`version`, `apply_time`) VALUES
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
-- Table structure for table `wd_module`
--

CREATE TABLE IF NOT EXISTS `wd_module` (
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
-- Dumping data for table `wd_module`
--

INSERT INTO `wd_module` (`id`, `module_name`, `module_title`, `module_description`, `module_config`, `module_status`, `module_dir`, `module_bb`, `module_fb`, `module_date`, `module_modified`) VALUES
(1, 'toolbar', 'Toolbar', NULL, '{"frontend":{"class":"modules\\\\toolbar\\\\frontend\\\\Module"}}', 0, 'toolbar', 0, 1, '2015-09-11 03:14:57', '2015-09-11 03:14:57'),
(2, 'sitemap', 'Site Map', 'Module for sitemap', '{"backend":{"class":"modules\\\\sitemap\\\\backend\\\\Module"},"frontend":{"class":"modules\\\\sitemap\\\\frontend\\\\Module"}}', 0, 'sitemap', 0, 1, '2015-09-11 03:38:25', '2015-09-11 03:38:25'),
(3, 'feed', 'RSS Feed', NULL, '{"frontend":{"class":"modules\\\\feed\\\\frontend\\\\Module"}}', 0, 'feed', 0, 0, '2015-09-11 03:38:53', '2015-09-11 03:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `wd_option`
--

CREATE TABLE IF NOT EXISTS `wd_option` (
`id` int(11) NOT NULL,
  `option_name` varchar(64) NOT NULL,
  `option_value` text NOT NULL,
  `option_label` varchar(64) DEFAULT NULL,
  `option_group` varchar(64) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_option`
--

INSERT INTO `wd_option` (`id`, `option_name`, `option_value`, `option_label`, `option_group`) VALUES
(1, 'sitetitle', 'Bent Ray', 'Site Title', 'general'),
(2, 'tagline', 'CMS Built with Yii Framework', 'Tagline', 'general'),
(3, 'admin_email', 'superadmin@writesdown.com', 'E-mail Address', 'general'),
(4, 'allow_signup', '0', 'Membership', 'general'),
(5, 'default_role', 'subscriber', 'New User Default Role', 'general'),
(6, 'time_zone', 'Asia/Jakarta', 'Timezone', 'general'),
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
(23, 'page_comments', '5', 'Break comments into pages with', 'discussion'),
(24, 'thread_comments_depth', '5', 'Thread Comments Depth', 'discussion'),
(25, 'comments_per_page', '10', 'Top level comments per page', 'discussion'),
(26, 'default_comments_page', 'newest', 'page displayed by default\\nComments should be displayed with the', 'discussion'),
(27, 'comments_notify', '1', 'Notify when anyone posts a comment', 'discussion'),
(28, 'moderation_notify', '0', 'Notify when a comment is held for moderation', 'discussion'),
(29, 'comment_moderation', '1', 'Comment must be manually approved', 'discussion'),
(30, 'comment_whitelist', '0', 'Comment author must have a previously approved comment', 'discussion'),
(31, 'show_avatars', '1', 'Show Avatars', 'discussion'),
(32, 'avatar_rating', 'G', 'Maximum Rating', 'discussion'),
(33, 'avatar_default', 'mystery', 'Default Avatar', 'discussion'),
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
-- Table structure for table `wd_post`
--

CREATE TABLE IF NOT EXISTS `wd_post` (
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_post`
--

INSERT INTO `wd_post` (`id`, `post_author`, `post_type`, `post_title`, `post_excerpt`, `post_content`, `post_date`, `post_modified`, `post_status`, `post_password`, `post_slug`, `post_comment_status`, `post_comment_count`) VALUES
(1, 1, 1, 'Sample Post', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p><p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.</p><p>Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus.</p>', '2016-02-05 15:06:50', '2016-02-05 15:06:50', 'publish', NULL, 'sample-post', 'open', 1),
(2, 1, 2, 'Sample page', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.', '<p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu.</p><blockquote><p>In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet.</p></blockquote><p>Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus.</p>', '2016-02-05 15:06:50', '2016-02-05 15:06:50', 'publish', NULL, 'sample-page', 'close', 0),
(3, 1, 1, 'Abroad', 'asdsadas', '<p>asdsadas</p>', '2016-02-05 11:39:40', '2016-02-05 16:39:57', 'publish', '', 'abroad', 'open', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wd_post_comment`
--

CREATE TABLE IF NOT EXISTS `wd_post_comment` (
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
-- Dumping data for table `wd_post_comment`
--

INSERT INTO `wd_post_comment` (`id`, `comment_post_id`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_ip`, `comment_date`, `comment_content`, `comment_approved`, `comment_agent`, `comment_parent`, `comment_user_id`) VALUES
(1, 1, 'WD, WritesDown', 'wd@writesdown.com', 'http://www.writesdown.com/', '', '2016-02-05 15:06:52', 'SAMPLE COMMENT: Nullam accumsan lorem in dui. Cras ultricies mi eu turpis hendrerit fringilla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; In ac dui quis mi consectetuer lacinia. Nam pretium turpis et arcu. Duis arcu tortor, suscipit eget, imperdiet nec, imperdiet iaculis, ipsum. Sed aliquam ultrices mauris.', 'approved', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wd_post_meta`
--

CREATE TABLE IF NOT EXISTS `wd_post_meta` (
`id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `meta_name` varchar(255) NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `wd_post_type`
--

CREATE TABLE IF NOT EXISTS `wd_post_type` (
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
-- Dumping data for table `wd_post_type`
--

INSERT INTO `wd_post_type` (`id`, `post_type_name`, `post_type_slug`, `post_type_description`, `post_type_icon`, `post_type_sn`, `post_type_pn`, `post_type_smb`, `post_type_permission`) VALUES
(1, 'post', 'post', NULL, 'fa fa-thumb-tack', 'Post', 'Posts', 0, 'contributor'),
(2, 'page', 'page', NULL, 'fa fa-file-o', 'Page', 'Pages', 1, 'editor');

-- --------------------------------------------------------

--
-- Table structure for table `wd_post_type_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wd_post_type_taxonomy` (
  `post_type_id` int(11) NOT NULL,
  `taxonomy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_post_type_taxonomy`
--

INSERT INTO `wd_post_type_taxonomy` (`post_type_id`, `taxonomy_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wd_taxonomy`
--

CREATE TABLE IF NOT EXISTS `wd_taxonomy` (
`id` int(11) NOT NULL,
  `taxonomy_name` varchar(200) NOT NULL,
  `taxonomy_slug` varchar(200) NOT NULL,
  `taxonomy_hierarchical` smallint(1) NOT NULL DEFAULT '0',
  `taxonomy_sn` varchar(255) NOT NULL,
  `taxonomy_pn` varchar(255) NOT NULL,
  `taxonomy_smb` smallint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_taxonomy`
--

INSERT INTO `wd_taxonomy` (`id`, `taxonomy_name`, `taxonomy_slug`, `taxonomy_hierarchical`, `taxonomy_sn`, `taxonomy_pn`, `taxonomy_smb`) VALUES
(1, 'category', 'category', 1, 'Category', 'Categories', 1),
(2, 'tag', 'tag', 0, 'Tag', 'Tags', 0);

-- --------------------------------------------------------

--
-- Table structure for table `wd_term`
--

CREATE TABLE IF NOT EXISTS `wd_term` (
`id` int(11) NOT NULL,
  `taxonomy_id` int(11) NOT NULL,
  `term_name` varchar(200) NOT NULL,
  `term_slug` varchar(200) NOT NULL,
  `term_description` text,
  `term_parent` int(11) DEFAULT '0',
  `term_count` int(11) DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_term`
--

INSERT INTO `wd_term` (`id`, `taxonomy_id`, `term_name`, `term_slug`, `term_description`, `term_parent`, `term_count`) VALUES
(1, 1, 'Sample Category', 'sample-category', 'Hello there, this is example of category.', 0, 1),
(2, 2, 'Sample Tag', 'sample-tag', 'Hello there, this is an example of tag.', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `wd_term_relationship`
--

CREATE TABLE IF NOT EXISTS `wd_term_relationship` (
  `post_id` int(11) NOT NULL,
  `term_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_term_relationship`
--

INSERT INTO `wd_term_relationship` (`post_id`, `term_id`) VALUES
(1, 1),
(1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `wd_user`
--

CREATE TABLE IF NOT EXISTS `wd_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `wd_user`
--

INSERT INTO `wd_user` (`id`, `username`, `email`, `full_name`, `display_name`, `password_hash`, `password_reset_token`, `auth_key`, `status`, `created_at`, `updated_at`, `login_at`) VALUES
(1, 'superadmin', 'superadministrator@writesdown.com', 'Super Administrator', 'Super Admin', '$2y$13$WJIxqq6WBZUw7tyfN2oiH.WJtPntvLMjs6NG9uW0M3Lh71lImaEyu', NULL, '7QvEmdZDvaSxM1-oYoWkKso0ws6AHTX1', 10, '2016-02-05 15:06:46', '2016-02-05 15:06:46', '2016-02-05 15:06:46');

-- --------------------------------------------------------

--
-- Table structure for table `wd_widget`
--

CREATE TABLE IF NOT EXISTS `wd_widget` (
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
-- Indexes for table `wd_auth_assignment`
--
ALTER TABLE `wd_auth_assignment`
 ADD PRIMARY KEY (`item_name`,`user_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wd_auth_item`
--
ALTER TABLE `wd_auth_item`
 ADD PRIMARY KEY (`name`), ADD KEY `rule_name` (`rule_name`);

--
-- Indexes for table `wd_auth_item_child`
--
ALTER TABLE `wd_auth_item_child`
 ADD PRIMARY KEY (`parent`,`child`), ADD KEY `child` (`child`);

--
-- Indexes for table `wd_auth_rule`
--
ALTER TABLE `wd_auth_rule`
 ADD PRIMARY KEY (`name`);

--
-- Indexes for table `wd_media`
--
ALTER TABLE `wd_media`
 ADD PRIMARY KEY (`id`), ADD KEY `media_post_id` (`media_post_id`), ADD KEY `media_author` (`media_author`);

--
-- Indexes for table `wd_media_comment`
--
ALTER TABLE `wd_media_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `comment_media_id` (`comment_media_id`);

--
-- Indexes for table `wd_media_meta`
--
ALTER TABLE `wd_media_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `wd_menu`
--
ALTER TABLE `wd_menu`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_menu_item`
--
ALTER TABLE `wd_menu_item`
 ADD PRIMARY KEY (`id`), ADD KEY `menu_id` (`menu_id`);

--
-- Indexes for table `wd_migration`
--
ALTER TABLE `wd_migration`
 ADD PRIMARY KEY (`version`);

--
-- Indexes for table `wd_module`
--
ALTER TABLE `wd_module`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_option`
--
ALTER TABLE `wd_option`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_post`
--
ALTER TABLE `wd_post`
 ADD PRIMARY KEY (`id`), ADD KEY `post_type` (`post_type`), ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `wd_post_comment`
--
ALTER TABLE `wd_post_comment`
 ADD PRIMARY KEY (`id`), ADD KEY `comment_post_id` (`comment_post_id`);

--
-- Indexes for table `wd_post_meta`
--
ALTER TABLE `wd_post_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `wd_post_type`
--
ALTER TABLE `wd_post_type`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_post_type_taxonomy`
--
ALTER TABLE `wd_post_type_taxonomy`
 ADD PRIMARY KEY (`post_type_id`,`taxonomy_id`), ADD KEY `taxonomy_id` (`taxonomy_id`);

--
-- Indexes for table `wd_taxonomy`
--
ALTER TABLE `wd_taxonomy`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_term`
--
ALTER TABLE `wd_term`
 ADD PRIMARY KEY (`id`), ADD KEY `taxonomy_id` (`taxonomy_id`);

--
-- Indexes for table `wd_term_relationship`
--
ALTER TABLE `wd_term_relationship`
 ADD PRIMARY KEY (`post_id`,`term_id`), ADD KEY `term_id` (`term_id`);

--
-- Indexes for table `wd_user`
--
ALTER TABLE `wd_user`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wd_widget`
--
ALTER TABLE `wd_widget`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `wd_media`
--
ALTER TABLE `wd_media`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_media_comment`
--
ALTER TABLE `wd_media_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_media_meta`
--
ALTER TABLE `wd_media_meta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_menu`
--
ALTER TABLE `wd_menu`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wd_menu_item`
--
ALTER TABLE `wd_menu_item`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_module`
--
ALTER TABLE `wd_module`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wd_option`
--
ALTER TABLE `wd_option`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=45;
--
-- AUTO_INCREMENT for table `wd_post`
--
ALTER TABLE `wd_post`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `wd_post_comment`
--
ALTER TABLE `wd_post_comment`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wd_post_meta`
--
ALTER TABLE `wd_post_meta`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wd_post_type`
--
ALTER TABLE `wd_post_type`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wd_taxonomy`
--
ALTER TABLE `wd_taxonomy`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wd_term`
--
ALTER TABLE `wd_term`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `wd_user`
--
ALTER TABLE `wd_user`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `wd_widget`
--
ALTER TABLE `wd_widget`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `wd_auth_assignment`
--
ALTER TABLE `wd_auth_assignment`
ADD CONSTRAINT `wd_auth_assignment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `wd_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `wd_auth_assignment_ibfk_2` FOREIGN KEY (`item_name`) REFERENCES `wd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_auth_item`
--
ALTER TABLE `wd_auth_item`
ADD CONSTRAINT `wd_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `wd_auth_rule` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_auth_item_child`
--
ALTER TABLE `wd_auth_item_child`
ADD CONSTRAINT `wd_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `wd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `wd_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `wd_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_media`
--
ALTER TABLE `wd_media`
ADD CONSTRAINT `wd_media_ibfk_1` FOREIGN KEY (`media_post_id`) REFERENCES `wd_post` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `wd_media_ibfk_2` FOREIGN KEY (`media_author`) REFERENCES `wd_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_media_comment`
--
ALTER TABLE `wd_media_comment`
ADD CONSTRAINT `wd_media_comment_ibfk_1` FOREIGN KEY (`comment_media_id`) REFERENCES `wd_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_media_meta`
--
ALTER TABLE `wd_media_meta`
ADD CONSTRAINT `wd_media_meta_ibfk_1` FOREIGN KEY (`media_id`) REFERENCES `wd_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_menu_item`
--
ALTER TABLE `wd_menu_item`
ADD CONSTRAINT `wd_menu_item_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `wd_menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_post`
--
ALTER TABLE `wd_post`
ADD CONSTRAINT `wd_post_ibfk_1` FOREIGN KEY (`post_type`) REFERENCES `wd_post_type` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `wd_post_ibfk_2` FOREIGN KEY (`post_author`) REFERENCES `wd_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_post_comment`
--
ALTER TABLE `wd_post_comment`
ADD CONSTRAINT `wd_post_comment_ibfk_1` FOREIGN KEY (`comment_post_id`) REFERENCES `wd_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_post_meta`
--
ALTER TABLE `wd_post_meta`
ADD CONSTRAINT `wd_post_meta_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `wd_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_post_type_taxonomy`
--
ALTER TABLE `wd_post_type_taxonomy`
ADD CONSTRAINT `wd_post_type_taxonomy_ibfk_1` FOREIGN KEY (`post_type_id`) REFERENCES `wd_post_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `wd_post_type_taxonomy_ibfk_2` FOREIGN KEY (`taxonomy_id`) REFERENCES `wd_taxonomy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_term`
--
ALTER TABLE `wd_term`
ADD CONSTRAINT `wd_term_ibfk_1` FOREIGN KEY (`taxonomy_id`) REFERENCES `wd_taxonomy` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `wd_term_relationship`
--
ALTER TABLE `wd_term_relationship`
ADD CONSTRAINT `wd_term_relationship_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `wd_post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `wd_term_relationship_ibfk_2` FOREIGN KEY (`term_id`) REFERENCES `wd_term` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
