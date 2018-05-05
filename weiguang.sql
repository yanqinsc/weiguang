/*
 Navicat Premium Data Transfer

 Source Server         : MariaDB
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : weiguang

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 06/05/2018 00:28:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for wg_abilities
-- ----------------------------
DROP TABLE IF EXISTS `wg_abilities`;
CREATE TABLE `wg_abilities`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `entity_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `entity_type` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT 0,
  `scope` int(11) NULL DEFAULT NULL,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(10) UNSIGNED NOT NULL,
  `is_menu` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `abilities_scope_index`(`scope`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_abilities
-- ----------------------------
INSERT INTO `wg_abilities` VALUES (1, 0, 'authorization', '授权管理', NULL, NULL, 0, NULL, '#', 'fa-lock', 0, '', '2018-04-30 08:54:32', '2018-05-03 00:07:31');
INSERT INTO `wg_abilities` VALUES (2, 1, 'ability-list', '权限管理', NULL, NULL, 0, NULL, 'ability.index', 'fa-key', 98, '', '2018-04-30 08:55:27', '2018-05-03 21:35:08');
INSERT INTO `wg_abilities` VALUES (3, 2, 'create-ability', '添加权限', NULL, NULL, 0, NULL, 'ability.create', '', 99, NULL, '2018-04-30 08:57:06', '2018-05-03 21:13:28');
INSERT INTO `wg_abilities` VALUES (4, 2, 'edit-ability', '编辑权限', NULL, NULL, 0, NULL, 'ability.edit', '', 98, NULL, '2018-05-03 20:59:57', '2018-05-03 21:14:01');
INSERT INTO `wg_abilities` VALUES (5, 2, 'destroy-ability', '删除权限', NULL, NULL, 0, NULL, 'ability.destroy', '', 97, NULL, '2018-05-03 21:02:09', '2018-05-03 21:14:21');
INSERT INTO `wg_abilities` VALUES (6, 1, 'role-list', '角色管理', NULL, NULL, 0, NULL, 'role.index', 'fa-group', 98, '', '2018-05-03 21:03:43', '2018-05-03 21:14:55');
INSERT INTO `wg_abilities` VALUES (7, 6, 'create-role', '添加角色', NULL, NULL, 0, NULL, 'role.create', '', 99, NULL, '2018-05-03 21:04:21', '2018-05-03 21:04:21');
INSERT INTO `wg_abilities` VALUES (8, 6, 'edit-role', '编辑角色信息', NULL, NULL, 0, NULL, 'role.edit', '', 98, NULL, '2018-05-03 21:04:56', '2018-05-03 21:04:56');
INSERT INTO `wg_abilities` VALUES (9, 6, 'destroy-role', '删除角色', NULL, NULL, 0, NULL, 'role.destroy', '', 97, NULL, '2018-05-03 21:05:34', '2018-05-03 21:05:34');
INSERT INTO `wg_abilities` VALUES (10, 6, 'role-permissions', '为角色分配权限', NULL, NULL, 0, NULL, 'role.permissions', '', 96, NULL, '2018-05-03 21:10:41', '2018-05-03 21:10:41');
INSERT INTO `wg_abilities` VALUES (11, 0, 'article', '文章管理', NULL, NULL, 0, NULL, '#', 'fa-files-o', 99, '', '2018-05-05 14:12:29', '2018-05-05 14:12:29');
INSERT INTO `wg_abilities` VALUES (12, 11, 'article-index', '文章列表', NULL, NULL, 0, NULL, 'article.index', 'fa-list-ul', 99, '', '2018-05-05 14:15:26', '2018-05-05 14:15:26');
INSERT INTO `wg_abilities` VALUES (13, 11, 'create-article', '添加文章', NULL, NULL, 0, NULL, 'article.create', 'fa-edit', 99, '', '2018-05-05 14:29:23', '2018-05-05 14:29:23');
INSERT INTO `wg_abilities` VALUES (14, 12, 'edit-article', '编辑文章', NULL, NULL, 0, NULL, 'article.edit', 'fa-edit', 98, NULL, '2018-05-05 14:30:36', '2018-05-05 14:30:36');

-- ----------------------------
-- Table structure for wg_ability_meta
-- ----------------------------
DROP TABLE IF EXISTS `wg_ability_meta`;
CREATE TABLE `wg_ability_meta`  (
  `ability_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `pid` int(11) UNSIGNED NOT NULL COMMENT '归属的菜单ID',
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '功能路由名称',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单中显示的图标',
  `order` int(255) NOT NULL DEFAULT 0 COMMENT '排序 倒叙排列 数值越大排序越靠前',
  `is_menu` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ability_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'abilities表的扩展数据，与权限表一对一关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_ability_meta
-- ----------------------------
INSERT INTO `wg_ability_meta` VALUES (1, 0, '#', 'fa-lock', 0, '');
INSERT INTO `wg_ability_meta` VALUES (2, 1, 'ability.index', 'fa-key', 98, '');
INSERT INTO `wg_ability_meta` VALUES (3, 2, 'ability.create', '', 99, NULL);
INSERT INTO `wg_ability_meta` VALUES (5, 2, 'ability.edit', '', 98, NULL);
INSERT INTO `wg_ability_meta` VALUES (6, 2, 'ability.destroy', '', 97, NULL);
INSERT INTO `wg_ability_meta` VALUES (7, 1, 'role.index', 'fa-group', 98, '');
INSERT INTO `wg_ability_meta` VALUES (8, 7, 'role.create', '', 99, NULL);
INSERT INTO `wg_ability_meta` VALUES (9, 7, 'role.edit', '', 98, NULL);
INSERT INTO `wg_ability_meta` VALUES (10, 7, 'role.destroy', '', 97, NULL);
INSERT INTO `wg_ability_meta` VALUES (11, 7, 'role.permissions', '', 96, NULL);
INSERT INTO `wg_ability_meta` VALUES (12, 0, '#', 'fa-files-o', 99, '');
INSERT INTO `wg_ability_meta` VALUES (13, 12, 'article.index', 'fa-list-ul', 99, '');
INSERT INTO `wg_ability_meta` VALUES (14, 13, 'article.create', 'fa-edit', 99, '');
INSERT INTO `wg_ability_meta` VALUES (15, 13, 'article.edit', 'fa-edit', 98, NULL);

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
INSERT INTO `wg_assigned_roles` VALUES (2, 1, 'App\\User', NULL);

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
-- Table structure for wg_migrations
-- ----------------------------
DROP TABLE IF EXISTS `wg_migrations`;
CREATE TABLE `wg_migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_migrations
-- ----------------------------
INSERT INTO `wg_migrations` VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `wg_migrations` VALUES (4, '2018_04_16_000000_create_users_table', 2);
INSERT INTO `wg_migrations` VALUES (5, '2018_04_17_214731_create_bouncer_tables', 3);

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
-- Table structure for wg_posts
-- ----------------------------
DROP TABLE IF EXISTS `wg_posts`;
CREATE TABLE `wg_posts`  (
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
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_roles
-- ----------------------------
INSERT INTO `wg_roles` VALUES (1, 'admin', 'Admin', NULL, NULL, '2018-04-22 11:45:48', '2018-04-22 11:45:48');
INSERT INTO `wg_roles` VALUES (2, 'teacher', 'Teacher', NULL, NULL, '2018-04-22 11:53:32', '2018-04-22 11:53:32');

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
-- Table structure for wg_students
-- ----------------------------
DROP TABLE IF EXISTS `wg_students`;
CREATE TABLE `wg_students`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `class_id` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `school_id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `intro` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `wg_users` VALUES (1, 'yanqinsc', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '', '小石', '/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc@qq.com', '', '', '', 0, '0', '孜孜不倦，不紧不慢', 'd1gZQThZpmYXeLOdSlg7N0o1Rz9R9JB69zC6AsQrmcSWeE4RYr5uHvPOXhDb', '2018-04-16 23:49:09', '2018-04-16 23:49:09', NULL);

SET FOREIGN_KEY_CHECKS = 1;
