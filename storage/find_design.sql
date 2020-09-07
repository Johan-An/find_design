-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主机： 192.168.1.8
-- 生成日期： 2020-09-07 15:36:32
-- 服务器版本： 8.0.20
-- PHP 版本： 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 数据库： `find_design`
--
CREATE DATABASE IF NOT EXISTS `find_design` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `find_design`;

-- --------------------------------------------------------

--
-- 表的结构 `fb_enterprises_business_columns`
--

CREATE TABLE `fb_enterprises_business_columns` (
  `id` int NOT NULL COMMENT 'ID',
  `enterprise_id` int NOT NULL COMMENT '企业ID',
  `business_column_id` int NOT NULL COMMENT '栏目ID',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业栏目表';

-- --------------------------------------------------------

--
-- 表的结构 `fb_enterprises_images`
--

CREATE TABLE `fb_enterprises_images` (
  `id` int NOT NULL COMMENT 'ID',
  `enterprise_id` int NOT NULL COMMENT '企业ID',
  `image_url` varchar(255) NOT NULL COMMENT '图片连接',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业详情图片';

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_menu`
--

CREATE TABLE `fd_admin_menu` (
  `id` int UNSIGNED NOT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `order` int NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_admin_menu`
--

INSERT INTO `fd_admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'Dashboard', 'fa-bar-chart', '/', NULL, NULL, NULL),
(2, 0, 2, '管理员', 'fa-tasks', NULL, NULL, NULL, '2020-08-16 12:57:32'),
(3, 2, 3, '用户管理', 'fa-users', 'auth/users', NULL, NULL, '2020-08-16 13:00:13'),
(4, 2, 4, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, '2020-08-16 13:00:32'),
(5, 2, 5, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, '2020-08-16 13:00:51'),
(6, 2, 6, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2020-08-16 13:01:09'),
(7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2020-08-16 13:01:28'),
(8, 0, 8, '企业', 'fa-home', NULL, NULL, '2020-08-16 12:28:29', '2020-08-23 23:06:56'),
(9, 8, 0, '企业管理', 'fa-book', 'http://finddesign:8083/admin/enterprises', NULL, '2020-08-23 23:08:09', '2020-08-23 23:08:09'),
(10, 8, 0, '业务栏目管理', 'fa-bars', 'http://finddesign:8083/admin/business-columns', NULL, '2020-08-23 23:09:56', '2020-08-23 23:09:56');

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_operation_log`
--

CREATE TABLE `fd_admin_operation_log` (
  `id` int UNSIGNED NOT NULL,
  `user_id` int NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_admin_operation_log`
--


-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_permissions`
--

CREATE TABLE `fd_admin_permissions` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_admin_permissions`
--

INSERT INTO `fd_admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`) VALUES
(1, 'All permission', '*', '', '*', NULL, NULL),
(2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL),
(3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL),
(4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL),
(5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_roles`
--

CREATE TABLE `fd_admin_roles` (
  `id` int UNSIGNED NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_admin_roles`
--

INSERT INTO `fd_admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'administrator', '2020-08-16 11:40:36', '2020-08-16 11:40:36');

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_role_menu`
--

CREATE TABLE `fd_admin_role_menu` (
  `role_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_admin_role_menu`
--

INSERT INTO `fd_admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`) VALUES
(1, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_role_permissions`
--

CREATE TABLE `fd_admin_role_permissions` (
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_admin_role_permissions`
--

INSERT INTO `fd_admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_role_users`
--

CREATE TABLE `fd_admin_role_users` (
  `role_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_admin_role_users`
--

INSERT INTO `fd_admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_users`
--

CREATE TABLE `fd_admin_users` (
  `id` int UNSIGNED NOT NULL,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_admin_users`
--

INSERT INTO `fd_admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$s//waB92Sq3SQah2ZLv6MeVt.6m8gNvNQHaWh8nlLCFzUkJoZyug6', 'Administrator', NULL, 'rh9H5qGJ0mfkRws5K336ObENaRVZf0nNgSVyQ3dkbk4x1KLIZjBxfXz2iaq1', '2020-08-16 11:40:36', '2020-08-16 11:40:36');

-- --------------------------------------------------------

--
-- 表的结构 `fd_admin_user_permissions`
--

CREATE TABLE `fd_admin_user_permissions` (
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `fd_banners`
--

CREATE TABLE `fd_banners` (
  `id` int NOT NULL COMMENT 'ID',
  `image_url` varchar(255) NOT NULL COMMENT '图片链接',
  `jump_url` varchar(255) DEFAULT NULL COMMENT '跳转链接',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='banner 表';

-- --------------------------------------------------------

--
-- 表的结构 `fd_business_columns`
--

CREATE TABLE `fd_business_columns` (
  `id` int NOT NULL COMMENT 'ID',
  `name` varchar(31) NOT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='业务类型表';

--
-- 转存表中的数据 `fd_business_columns`
--

INSERT INTO `fd_business_columns` (`id`, `name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '品牌设计', '2020-08-23 23:11:25', '2020-08-23 23:11:25', NULL),
(2, '包装设计', '2020-08-23 23:11:45', '2020-08-23 23:11:45', NULL),
(3, '插画设计', '2020-08-23 23:12:13', '2020-08-23 23:12:13', NULL),
(4, '电商设计', '2020-08-23 23:12:35', '2020-08-23 23:12:35', NULL),
(5, 'UI设计', '2020-08-23 23:12:50', '2020-08-23 23:12:50', NULL),
(6, '网站设计', '2020-08-23 23:13:11', '2020-08-23 23:13:11', NULL),
(7, '工业/产品', '2020-08-23 23:13:38', '2020-08-23 23:13:38', NULL),
(8, '影视动漫', '2020-08-23 23:13:54', '2020-08-23 23:13:54', NULL),
(9, '游戏设计', '2020-08-24 21:49:02', '2020-08-24 21:49:02', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fd_enterprises`
--

CREATE TABLE `fd_enterprises` (
  `id` int NOT NULL COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '企业名称',
  `logo` varchar(255) NOT NULL COMMENT 'logo链接',
  `head_image` varchar(255) DEFAULT NULL COMMENT '头图链接',
  `province` varchar(30) NOT NULL COMMENT '省份',
  `city` varchar(30) NOT NULL COMMENT '城市',
  `introduction` text COMMENT '介绍',
  `web_url` varchar(255) DEFAULT NULL COMMENT '官网链接',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '上架状态：1-上架，2-下架',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted_at` timestamp NULL DEFAULT NULL COMMENT '删除时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='企业表';

--
-- 转存表中的数据 `fd_enterprises`
--

INSERT INTO `fd_enterprises` (`id`, `name`, `logo`, `head_image`, `province`, `city`, `introduction`, `web_url`, `status`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, '企业1', 'images/u=2067848209,3798121629&fm=26&gp=0.jpg', 'images/aec8afeabf44028b50c48be0dbcd630b.jpg', '上海市', '上海市', '简介', 'https://www.baidu.com/', 1, '2020-08-16 13:24:33', '2020-08-16 13:26:25', NULL);

-- --------------------------------------------------------

--
-- 表的结构 `fd_failed_jobs`
--

CREATE TABLE `fd_failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `fd_migrations`
--

CREATE TABLE `fd_migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转存表中的数据 `fd_migrations`
--

INSERT INTO `fd_migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_01_04_173148_create_admin_tables', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- 表的结构 `fd_password_resets`
--

CREATE TABLE `fd_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- 表的结构 `fd_users`
--

CREATE TABLE `fd_users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- 转储表的索引
--

--
-- 表的索引 `fb_enterprises_business_columns`
--
ALTER TABLE `fb_enterprises_business_columns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `column_enterprise_id` (`business_column_id`,`enterprise_id`) USING BTREE;

--
-- 表的索引 `fb_enterprises_images`
--
ALTER TABLE `fb_enterprises_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `enterprise_id` (`enterprise_id`);

--
-- 表的索引 `fd_admin_menu`
--
ALTER TABLE `fd_admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fd_admin_operation_log`
--
ALTER TABLE `fd_admin_operation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fd_admin_operation_log_user_id_index` (`user_id`);

--
-- 表的索引 `fd_admin_permissions`
--
ALTER TABLE `fd_admin_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fd_admin_permissions_name_unique` (`name`),
  ADD UNIQUE KEY `fd_admin_permissions_slug_unique` (`slug`);

--
-- 表的索引 `fd_admin_roles`
--
ALTER TABLE `fd_admin_roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fd_admin_roles_name_unique` (`name`),
  ADD UNIQUE KEY `fd_admin_roles_slug_unique` (`slug`);

--
-- 表的索引 `fd_admin_role_menu`
--
ALTER TABLE `fd_admin_role_menu`
  ADD KEY `fd_admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`);

--
-- 表的索引 `fd_admin_role_permissions`
--
ALTER TABLE `fd_admin_role_permissions`
  ADD KEY `fd_admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`);

--
-- 表的索引 `fd_admin_role_users`
--
ALTER TABLE `fd_admin_role_users`
  ADD KEY `fd_admin_role_users_role_id_user_id_index` (`role_id`,`user_id`);

--
-- 表的索引 `fd_admin_users`
--
ALTER TABLE `fd_admin_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fd_admin_users_username_unique` (`username`);

--
-- 表的索引 `fd_admin_user_permissions`
--
ALTER TABLE `fd_admin_user_permissions`
  ADD KEY `fd_admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`);

--
-- 表的索引 `fd_banners`
--
ALTER TABLE `fd_banners`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fd_business_columns`
--
ALTER TABLE `fd_business_columns`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fd_enterprises`
--
ALTER TABLE `fd_enterprises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `status_name_pro_cit` (`status`,`name`,`province`,`city`);

--
-- 表的索引 `fd_failed_jobs`
--
ALTER TABLE `fd_failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fd_migrations`
--
ALTER TABLE `fd_migrations`
  ADD PRIMARY KEY (`id`);

--
-- 表的索引 `fd_password_resets`
--
ALTER TABLE `fd_password_resets`
  ADD KEY `fd_password_resets_email_index` (`email`);

--
-- 表的索引 `fd_users`
--
ALTER TABLE `fd_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `fd_users_email_unique` (`email`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `fb_enterprises_business_columns`
--
ALTER TABLE `fb_enterprises_business_columns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `fb_enterprises_images`
--
ALTER TABLE `fb_enterprises_images`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `fd_admin_menu`
--
ALTER TABLE `fd_admin_menu`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用表AUTO_INCREMENT `fd_admin_operation_log`
--
ALTER TABLE `fd_admin_operation_log`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- 使用表AUTO_INCREMENT `fd_admin_permissions`
--
ALTER TABLE `fd_admin_permissions`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- 使用表AUTO_INCREMENT `fd_admin_roles`
--
ALTER TABLE `fd_admin_roles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fd_admin_users`
--
ALTER TABLE `fd_admin_users`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fd_banners`
--
ALTER TABLE `fd_banners`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID';

--
-- 使用表AUTO_INCREMENT `fd_business_columns`
--
ALTER TABLE `fd_business_columns`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=10;

--
-- 使用表AUTO_INCREMENT `fd_enterprises`
--
ALTER TABLE `fd_enterprises`
  MODIFY `id` int NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=2;

--
-- 使用表AUTO_INCREMENT `fd_failed_jobs`
--
ALTER TABLE `fd_failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- 使用表AUTO_INCREMENT `fd_migrations`
--
ALTER TABLE `fd_migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- 使用表AUTO_INCREMENT `fd_users`
--
ALTER TABLE `fd_users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
