/*
 Navicat Premium Data Transfer

 Source Server         : MaraDB
 Source Server Type    : MySQL
 Source Server Version : 100214
 Source Host           : localhost:3306
 Source Schema         : weiguang

 Target Server Type    : MySQL
 Target Server Version : 100214
 File Encoding         : 65001

 Date: 11/06/2018 20:03:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wg_abilities
-- ----------------------------
DROP TABLE IF EXISTS `wg_abilities`;
CREATE TABLE `wg_abilities`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `entity_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `entity_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT 0,
  `scope` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `abilities_name_unique`(`name`) USING BTREE,
  INDEX `abilities_scope_index`(`scope`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_abilities
-- ----------------------------
INSERT INTO `wg_abilities` VALUES (1, 'ability-list', '权限管理', NULL, NULL, 0, NULL, '2018-04-30 08:55:27', '2018-05-07 22:53:44');
INSERT INTO `wg_abilities` VALUES (2, 'ability-create', '权限添加', NULL, NULL, 0, NULL, '2018-04-30 08:57:06', '2018-05-03 21:13:28');
INSERT INTO `wg_abilities` VALUES (3, 'ability-edit', '权限编辑', NULL, NULL, 0, NULL, '2018-05-03 20:59:57', '2018-05-03 21:14:01');
INSERT INTO `wg_abilities` VALUES (4, 'ability-destroy', '权限删除', NULL, NULL, 0, NULL, '2018-05-03 21:02:09', '2018-05-03 21:14:21');
INSERT INTO `wg_abilities` VALUES (5, 'role-list', '角色管理', NULL, NULL, 0, NULL, '2018-05-03 21:03:43', '2018-05-07 22:53:55');
INSERT INTO `wg_abilities` VALUES (6, 'role-create', '角色添加', NULL, NULL, 0, NULL, '2018-05-03 21:04:21', '2018-05-03 21:04:21');
INSERT INTO `wg_abilities` VALUES (7, 'role-edit', '角色编辑', NULL, NULL, 0, NULL, '2018-05-03 21:04:56', '2018-05-06 22:40:42');
INSERT INTO `wg_abilities` VALUES (8, 'role-destroy', '角色删除', NULL, NULL, 0, NULL, '2018-05-03 21:05:34', '2018-05-03 21:05:34');
INSERT INTO `wg_abilities` VALUES (9, 'role-permissions', '权限分配', NULL, NULL, 0, NULL, '2018-05-03 21:10:41', '2018-05-06 22:21:26');
INSERT INTO `wg_abilities` VALUES (10, 'article-list', '文章管理', NULL, NULL, 0, NULL, '2018-05-05 14:15:26', '2018-06-04 21:51:38');
INSERT INTO `wg_abilities` VALUES (11, 'article-create', '文章添加', NULL, NULL, 0, NULL, '2018-05-05 14:29:23', '2018-05-05 14:29:23');
INSERT INTO `wg_abilities` VALUES (12, 'article-edit', '文章编辑', NULL, NULL, 0, NULL, '2018-05-05 14:30:36', '2018-05-05 14:30:36');
INSERT INTO `wg_abilities` VALUES (13, 'article-destroy', '文章删除', NULL, NULL, 0, NULL, '2018-05-07 23:27:09', '2018-05-07 23:27:09');
INSERT INTO `wg_abilities` VALUES (14, 'admin-list', '管理员列表', NULL, NULL, 0, NULL, '2018-05-07 23:27:09', NULL);
INSERT INTO `wg_abilities` VALUES (15, 'admin-create', '管理员添加', NULL, NULL, 0, NULL, '2018-05-07 23:27:09', '2018-06-04 21:54:10');
INSERT INTO `wg_abilities` VALUES (16, 'admin-edit', '管理员编辑', NULL, NULL, 0, NULL, '2018-05-07 23:27:09', NULL);
INSERT INTO `wg_abilities` VALUES (17, 'admin-forbiden', '管理员禁用', NULL, NULL, 0, NULL, '2018-05-07 23:27:09', '2018-06-05 06:11:40');
INSERT INTO `wg_abilities` VALUES (18, 'menu-list', '菜单管理', NULL, NULL, 0, NULL, '2018-06-10 18:51:17', '2018-06-10 18:51:17');
INSERT INTO `wg_abilities` VALUES (19, 'menu-create', '菜单添加', NULL, NULL, 0, NULL, '2018-06-10 18:51:39', '2018-06-10 18:51:39');
INSERT INTO `wg_abilities` VALUES (20, 'menu-edit', '菜单编辑', NULL, NULL, 0, NULL, '2018-06-10 18:53:44', '2018-06-10 18:53:44');
INSERT INTO `wg_abilities` VALUES (21, 'menu-destroy', '菜单删除', NULL, NULL, 0, NULL, '2018-06-10 18:53:59', '2018-06-10 18:53:59');

-- ----------------------------
-- Table structure for wg_admins
-- ----------------------------
DROP TABLE IF EXISTS `wg_admins`;
CREATE TABLE `wg_admins`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `motto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '座右铭',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_admins
-- ----------------------------
INSERT INTO `wg_admins` VALUES (1, 'yanqinsc', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '小石', '晏勤', '/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc@qq.com', '', '', '', '孜孜不倦，不紧不慢', 'fsx4Q3gssCAcBVFO4RrOfNqaNUQJzVgrHtz0SUbC8RyalCcsCymIh7e8le02', '2018-04-16 23:49:09', '2018-04-16 23:49:09', NULL);
INSERT INTO `wg_admins` VALUES (4, 'panda', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '盼盼', '史盼盼', '/admin/adminlte/dist/img/user2-160x160.jpg', 'panda@qq.com', '', '', '', '孜孜不倦，不紧不慢', 'm24t7MCM24pMQnYj7sjKtzmL6vPJeRYv9wlfPh9VuqE5Wb7WZEPDRszDt7Rl', '2018-04-16 23:49:09', '2018-04-16 23:49:09', NULL);
INSERT INTO `wg_admins` VALUES (5, 'xiuqing', '$2y$10$ZbXRoqHcHOv14BlvBP83Oe.RZmfUW7870alIdzRRTqwkiZgw.y.jW', '秀卿', '秀卿', '', 'xiuqing@qq.com', '12312421241', '', '', '', NULL, '2018-06-05 07:02:56', '2018-06-05 07:02:56', NULL);
INSERT INTO `wg_admins` VALUES (6, 'yanqinsc2', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '风云', '风雨', 'http://weiguang/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc8@qq.com', '12312421241', '', '', '千金散尽还复来', NULL, '2018-06-05 08:09:51', '2018-06-06 20:46:18', NULL);

-- ----------------------------
-- Table structure for wg_articles
-- ----------------------------
DROP TABLE IF EXISTS `wg_articles`;
CREATE TABLE `wg_articles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `author_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章摘要',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view_count` int(10) UNSIGNED NOT NULL,
  `comment_count` int(10) UNSIGNED NOT NULL,
  `is_top` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '是否置顶  NULL|否',
  `is_hot` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '是否热门文章  NULL|否',
  `is_new` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否最新文章 NULL|否',
  `category_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `publisher_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '编辑ID',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 27 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_articles
-- ----------------------------
INSERT INTO `wg_articles` VALUES (26, '春天里', '1', 'http://f.hiphotos.baidu.com/image/pic/item/c9fcc3cec3fdfc03777b0d1ad83f8794a4c22615.jpg', '春天里', '春天里春天里春天里春天里春天里春天里春天里', 3, 4, NULL, NULL, NULL, 1, 6, '2018-05-28 08:07:58', NULL, NULL);

-- ----------------------------
-- Table structure for wg_assigned_roles
-- ----------------------------
DROP TABLE IF EXISTS `wg_assigned_roles`;
CREATE TABLE `wg_assigned_roles`  (
  `role_id` int(10) UNSIGNED NOT NULL,
  `entity_id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` int(11) NULL DEFAULT NULL,
  INDEX `assigned_roles_entity_index`(`entity_id`, `entity_type`, `scope`) USING BTREE,
  INDEX `assigned_roles_role_id_index`(`role_id`) USING BTREE,
  INDEX `assigned_roles_scope_index`(`scope`) USING BTREE,
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `wg_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_assigned_roles
-- ----------------------------
INSERT INTO `wg_assigned_roles` VALUES (1, 1, 'App\\Model\\Admin', NULL);
INSERT INTO `wg_assigned_roles` VALUES (1, 6, 'App\\Model\\Admin', NULL);

-- ----------------------------
-- Table structure for wg_categories
-- ----------------------------
DROP TABLE IF EXISTS `wg_categories`;
CREATE TABLE `wg_categories`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NULL DEFAULT NULL,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `slug` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简称',
  `is_nav` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否作为导航栏频道',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类详情',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_categories
-- ----------------------------
INSERT INTO `wg_categories` VALUES (1, 0, '佳作共赏', 'appreciate', '1', '学生优秀作文分享');

-- ----------------------------
-- Table structure for wg_class
-- ----------------------------
DROP TABLE IF EXISTS `wg_class`;
CREATE TABLE `wg_class`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grade` year NOT NULL,
  `class` tinyint(3) UNSIGNED NOT NULL,
  `school_id` smallint(5) UNSIGNED NOT NULL,
  `yuwen_teacher_id` int(10) UNSIGNED NOT NULL COMMENT '语文老师的用户ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Table structure for wg_menus
-- ----------------------------
DROP TABLE IF EXISTS `wg_menus`;
CREATE TABLE `wg_menus`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL,
  `order` int(11) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `disable` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '禁用‘’',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_name_unique`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_menus
-- ----------------------------
INSERT INTO `wg_menus` VALUES (1, 0, 0, '权限管理', 'fa-lock', '#', NULL, '2018-04-30 08:54:32', '2018-06-10 22:29:22');
INSERT INTO `wg_menus` VALUES (2, 1, 99, '权限', 'fa-key', 'ability.index', NULL, '2018-04-30 08:55:27', '2018-06-04 08:08:47');
INSERT INTO `wg_menus` VALUES (3, 1, 98, '角色', 'fa-group', 'role.index', NULL, '2018-05-03 21:03:43', '2018-06-04 08:08:52');
INSERT INTO `wg_menus` VALUES (4, 0, 1, '内容管理', 'fa-files-o', '#', NULL, '2018-05-05 14:12:29', '2018-06-10 19:03:17');
INSERT INTO `wg_menus` VALUES (5, 4, 99, '文章', 'fa-file-text', 'article.index', NULL, '2018-05-05 14:15:26', '2018-06-04 21:12:01');
INSERT INTO `wg_menus` VALUES (6, 1, 96, '管理员', 'fa-user', 'admins.index', NULL, '2018-06-04 08:03:31', '2018-06-10 19:03:45');
INSERT INTO `wg_menus` VALUES (7, 4, 98, '评论', ' fa-comments', 'ability.index', NULL, '2018-06-04 08:13:24', '2018-06-04 08:15:24');
INSERT INTO `wg_menus` VALUES (8, 1, 97, '菜单', ' fa-th-large', 'menu.index', NULL, '2018-06-10 19:00:52', '2018-06-10 19:03:48');
INSERT INTO `wg_menus` VALUES (9, 0, 2, '会员管理', 'fa-user', 'admins_index', '', '2018-06-10 22:03:03', '2018-06-10 22:42:09');

-- ----------------------------
-- Table structure for wg_menus_roles
-- ----------------------------
DROP TABLE IF EXISTS `wg_menus_roles`;
CREATE TABLE `wg_menus_roles`  (
  `menu_id` int(6) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `menus_roles_unique`(`menu_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_menus_roles
-- ----------------------------
INSERT INTO `wg_menus_roles` VALUES (1, 1);
INSERT INTO `wg_menus_roles` VALUES (2, 1);
INSERT INTO `wg_menus_roles` VALUES (3, 1);
INSERT INTO `wg_menus_roles` VALUES (4, 1);
INSERT INTO `wg_menus_roles` VALUES (5, 1);
INSERT INTO `wg_menus_roles` VALUES (6, 1);
INSERT INTO `wg_menus_roles` VALUES (7, 1);
INSERT INTO `wg_menus_roles` VALUES (8, 1);
INSERT INTO `wg_menus_roles` VALUES (9, 1);

-- ----------------------------
-- Table structure for wg_migrations
-- ----------------------------
DROP TABLE IF EXISTS `wg_migrations`;
CREATE TABLE `wg_migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_migrations
-- ----------------------------
INSERT INTO `wg_migrations` VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `wg_migrations` VALUES (4, '2018_04_16_000000_create_users_table', 2);
INSERT INTO `wg_migrations` VALUES (5, '2018_04_17_214731_create_bouncer_tables', 3);
INSERT INTO `wg_migrations` VALUES (6, '2018_05_18_065039_create_sessions_table', 4);

-- ----------------------------
-- Table structure for wg_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `wg_password_resets`;
CREATE TABLE `wg_password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wg_permissions
-- ----------------------------
DROP TABLE IF EXISTS `wg_permissions`;
CREATE TABLE `wg_permissions`  (
  `ability_id` int(10) UNSIGNED NOT NULL,
  `entity_id` int(10) UNSIGNED NOT NULL,
  `entity_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `scope` int(11) NULL DEFAULT NULL,
  INDEX `permissions_entity_index`(`entity_id`, `entity_type`, `scope`) USING BTREE,
  INDEX `permissions_ability_id_index`(`ability_id`) USING BTREE,
  INDEX `permissions_scope_index`(`scope`) USING BTREE,
  CONSTRAINT `permissions_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `wg_abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_permissions
-- ----------------------------
INSERT INTO `wg_permissions` VALUES (11, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (7, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (3, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (4, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (5, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (8, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (10, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (12, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (1, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (9, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (2, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (13, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (14, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (15, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (16, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (17, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (10, 2, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (11, 2, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (12, 2, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (13, 2, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (6, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (19, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (20, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (21, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (18, 1, 'roles', 0, NULL);

-- ----------------------------
-- Table structure for wg_roles
-- ----------------------------
DROP TABLE IF EXISTS `wg_roles`;
CREATE TABLE `wg_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `level` int(10) UNSIGNED NULL DEFAULT NULL,
  `scope` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `roles_name_unique`(`name`, `scope`) USING BTREE,
  INDEX `roles_scope_index`(`scope`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_roles
-- ----------------------------
INSERT INTO `wg_roles` VALUES (1, 'admin', '管理员', NULL, NULL, '2018-04-22 11:45:48', '2018-05-08 21:00:41');
INSERT INTO `wg_roles` VALUES (2, 'teacher', '教师', NULL, NULL, '2018-04-22 11:53:32', '2018-05-08 20:52:47');
INSERT INTO `wg_roles` VALUES (3, 'editor', '编辑', NULL, NULL, '2018-05-08 09:35:38', '2018-05-08 09:35:38');

-- ----------------------------
-- Table structure for wg_school
-- ----------------------------
DROP TABLE IF EXISTS `wg_school`;
CREATE TABLE `wg_school`  (
  `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学校简称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wg_sessions
-- ----------------------------
DROP TABLE IF EXISTS `wg_sessions`;
CREATE TABLE `wg_sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE INDEX `sessions_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_sessions
-- ----------------------------
INSERT INTO `wg_sessions` VALUES ('ATkxHYggUYqsuAJkGAVM3klyPYeffJDgLYFgohFq', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiYkkzY0hSWGlWYURFV05aeDFBNEFISVFUZHpSd1I1U1ZiRXE4UTZVRiI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI2OiJodHRwOi8vd2VpZ3VhbmcvcGFuZWwvbWVudSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTI6ImxvZ2luX2FkbWluXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1528641742);

-- ----------------------------
-- Table structure for wg_teachers
-- ----------------------------
DROP TABLE IF EXISTS `wg_teachers`;
CREATE TABLE `wg_teachers`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0,
  `school_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `subject_id` tinyint(4) UNSIGNED NOT NULL DEFAULT 0 COMMENT '学科ID',
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '1|初中 2|高中',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wg_users
-- ----------------------------
DROP TABLE IF EXISTS `wg_users`;
CREATE TABLE `wg_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT 0,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '类型 0|管理员 1|学生 2|教师',
  `motto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '座右铭',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_users
-- ----------------------------
INSERT INTO `wg_users` VALUES (1, 'yanqinsc', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '', '小石', '/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc@qq.com', '', '', '', 0, '0', '孜孜不倦，不紧不慢', 'zfjG8PxyrO4UrDAcV3JDodBKCDXp6WSdmtnWVzeDoz2ZwWN8GB2EuEf9Dys3', '2018-04-16 23:49:09', '2018-04-16 23:49:09', NULL);

SET FOREIGN_KEY_CHECKS = 1;
