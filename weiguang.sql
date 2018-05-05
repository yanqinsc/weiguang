/*
Navicat MySQL Data Transfer

Source Server         : MaraDB
Source Server Version : 100214
Source Host           : localhost:3306
Source Database       : weiguang

Target Server Type    : MYSQL
Target Server Version : 100214
File Encoding         : 65001

Date: 2018-05-05 11:33:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wg_abilities
-- ----------------------------
DROP TABLE IF EXISTS `wg_abilities`;
CREATE TABLE `wg_abilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT 0,
  `scope` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abilities_scope_index` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_abilities
-- ----------------------------
INSERT INTO `wg_abilities` VALUES ('1', 'authorization', '授权管理', null, null, '0', null, '2018-04-30 08:54:32', '2018-05-03 00:07:31');
INSERT INTO `wg_abilities` VALUES ('2', 'ability-list', '权限管理', null, null, '0', null, '2018-04-30 08:55:27', '2018-05-03 21:35:08');
INSERT INTO `wg_abilities` VALUES ('3', 'create-ability', '添加权限', null, null, '0', null, '2018-04-30 08:57:06', '2018-05-03 21:13:28');
INSERT INTO `wg_abilities` VALUES ('5', 'edit-ability', '编辑权限', null, null, '0', null, '2018-05-03 20:59:57', '2018-05-03 21:14:01');
INSERT INTO `wg_abilities` VALUES ('6', 'destroy-ability', '删除权限', null, null, '0', null, '2018-05-03 21:02:09', '2018-05-03 21:14:21');
INSERT INTO `wg_abilities` VALUES ('7', 'role-list', '角色管理', null, null, '0', null, '2018-05-03 21:03:43', '2018-05-03 21:14:55');
INSERT INTO `wg_abilities` VALUES ('8', 'create-role', '添加角色', null, null, '0', null, '2018-05-03 21:04:21', '2018-05-03 21:04:21');
INSERT INTO `wg_abilities` VALUES ('9', 'edit-role', '编辑角色信息', null, null, '0', null, '2018-05-03 21:04:56', '2018-05-03 21:04:56');
INSERT INTO `wg_abilities` VALUES ('10', 'destroy-role', '删除角色', null, null, '0', null, '2018-05-03 21:05:34', '2018-05-03 21:05:34');
INSERT INTO `wg_abilities` VALUES ('11', 'role-permissions', '为角色分配权限', null, null, '0', null, '2018-05-03 21:10:41', '2018-05-03 21:10:41');

-- ----------------------------
-- Table structure for wg_ability_meta
-- ----------------------------
DROP TABLE IF EXISTS `wg_ability_meta`;
CREATE TABLE `wg_ability_meta` (
  `ability_id` int(11) unsigned NOT NULL DEFAULT 0,
  `pid` int(11) unsigned NOT NULL COMMENT '归属的菜单ID',
  `route_name` varchar(255) NOT NULL DEFAULT '' COMMENT '功能路由名称',
  `icon` varchar(255) NOT NULL COMMENT '菜单中显示的图标',
  `order` int(255) NOT NULL DEFAULT 0 COMMENT '排序 倒叙排列 数值越大排序越靠前',
  `is_menu` char(0) DEFAULT NULL,
  PRIMARY KEY (`ability_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='abilities表的扩展数据，与权限表一对一关系';

-- ----------------------------
-- Records of wg_ability_meta
-- ----------------------------
INSERT INTO `wg_ability_meta` VALUES ('1', '0', '#', 'fa-lock', '0', '');
INSERT INTO `wg_ability_meta` VALUES ('2', '1', 'ability.index', 'fa-key', '98', '');
INSERT INTO `wg_ability_meta` VALUES ('3', '2', 'ability.create', '', '99', null);
INSERT INTO `wg_ability_meta` VALUES ('5', '2', 'ability.edit', '', '98', null);
INSERT INTO `wg_ability_meta` VALUES ('6', '2', 'ability.destroy', '', '97', null);
INSERT INTO `wg_ability_meta` VALUES ('7', '1', 'role.index', 'fa-group', '98', '');
INSERT INTO `wg_ability_meta` VALUES ('8', '7', 'role.create', '', '99', null);
INSERT INTO `wg_ability_meta` VALUES ('9', '7', 'role.edit', '', '98', null);
INSERT INTO `wg_ability_meta` VALUES ('10', '7', 'role.destroy', '', '97', null);
INSERT INTO `wg_ability_meta` VALUES ('11', '7', 'role.permissions', '', '96', null);

-- ----------------------------
-- Table structure for wg_assigned_roles
-- ----------------------------
DROP TABLE IF EXISTS `wg_assigned_roles`;
CREATE TABLE `wg_assigned_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scope` int(11) DEFAULT NULL,
  KEY `assigned_roles_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `assigned_roles_role_id_index` (`role_id`),
  KEY `assigned_roles_scope_index` (`scope`),
  CONSTRAINT `assigned_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `wg_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_assigned_roles
-- ----------------------------
INSERT INTO `wg_assigned_roles` VALUES ('2', '1', 'App\\User', null);

-- ----------------------------
-- Table structure for wg_categories
-- ----------------------------
DROP TABLE IF EXISTS `wg_categories`;
CREATE TABLE `wg_categories` (
  `id` int(3) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `slug` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简称',
  `is_nav` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否作为导航栏频道',
  `desc` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类详情',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_categories
-- ----------------------------
INSERT INTO `wg_categories` VALUES ('1', '0', '佳作共赏', 'appreciate', '1', '学生优秀作文分享');

-- ----------------------------
-- Table structure for wg_class
-- ----------------------------
DROP TABLE IF EXISTS `wg_class`;
CREATE TABLE `wg_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `grade` year(4) NOT NULL,
  `class` tinyint(3) unsigned NOT NULL,
  `school_id` smallint(5) unsigned NOT NULL,
  `yuwen_teacher_id` int(10) unsigned NOT NULL COMMENT '语文老师的用户ID',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_class
-- ----------------------------

-- ----------------------------
-- Table structure for wg_migrations
-- ----------------------------
DROP TABLE IF EXISTS `wg_migrations`;
CREATE TABLE `wg_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_migrations
-- ----------------------------
INSERT INTO `wg_migrations` VALUES ('1', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `wg_migrations` VALUES ('4', '2018_04_16_000000_create_users_table', '2');
INSERT INTO `wg_migrations` VALUES ('5', '2018_04_17_214731_create_bouncer_tables', '3');

-- ----------------------------
-- Table structure for wg_password_resets
-- ----------------------------
DROP TABLE IF EXISTS `wg_password_resets`;
CREATE TABLE `wg_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for wg_permissions
-- ----------------------------
DROP TABLE IF EXISTS `wg_permissions`;
CREATE TABLE `wg_permissions` (
  `ability_id` int(10) unsigned NOT NULL,
  `entity_id` int(10) unsigned NOT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `forbidden` tinyint(1) NOT NULL DEFAULT 0,
  `scope` int(11) DEFAULT NULL,
  KEY `permissions_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `permissions_ability_id_index` (`ability_id`),
  KEY `permissions_scope_index` (`scope`),
  CONSTRAINT `permissions_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `wg_abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for wg_posts
-- ----------------------------
DROP TABLE IF EXISTS `wg_posts`;
CREATE TABLE `wg_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `author_id` varchar(30) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `excerpt` text NOT NULL COMMENT '文章摘要',
  `content` longtext NOT NULL,
  `view_count` int(10) unsigned NOT NULL,
  `comment_count` int(10) unsigned NOT NULL,
  `is_top` char(0) DEFAULT '' COMMENT '是否置顶  NULL|否',
  `is_hot` char(0) DEFAULT '' COMMENT '是否热门文章  NULL|否',
  `is_new` char(0) DEFAULT NULL COMMENT '是否最新文章 NULL|否',
  `category_id` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `publisher_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '编辑ID',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wg_posts
-- ----------------------------

-- ----------------------------
-- Table structure for wg_roles
-- ----------------------------
DROP TABLE IF EXISTS `wg_roles`;
CREATE TABLE `wg_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` int(10) unsigned DEFAULT NULL,
  `scope` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`,`scope`),
  KEY `roles_scope_index` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_roles
-- ----------------------------
INSERT INTO `wg_roles` VALUES ('1', 'admin', 'Admin', null, null, '2018-04-22 11:45:48', '2018-04-22 11:45:48');
INSERT INTO `wg_roles` VALUES ('2', 'teacher', 'Teacher', null, null, '2018-04-22 11:53:32', '2018-04-22 11:53:32');

-- ----------------------------
-- Table structure for wg_school
-- ----------------------------
DROP TABLE IF EXISTS `wg_school`;
CREATE TABLE `wg_school` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学校简称',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_school
-- ----------------------------

-- ----------------------------
-- Table structure for wg_students
-- ----------------------------
DROP TABLE IF EXISTS `wg_students`;
CREATE TABLE `wg_students` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned NOT NULL,
  `class_id` int(11) unsigned NOT NULL DEFAULT 0,
  `school_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `intro` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wg_students
-- ----------------------------

-- ----------------------------
-- Table structure for wg_teachers
-- ----------------------------
DROP TABLE IF EXISTS `wg_teachers`;
CREATE TABLE `wg_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0,
  `school_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `subject_id` tinyint(4) unsigned NOT NULL DEFAULT 0 COMMENT '学科ID',
  `intro` text DEFAULT NULL,
  `type` char(1) NOT NULL DEFAULT '1' COMMENT '1|初中 2|高中',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wg_teachers
-- ----------------------------

-- ----------------------------
-- Table structure for wg_users
-- ----------------------------
DROP TABLE IF EXISTS `wg_users`;
CREATE TABLE `wg_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tel` char(11) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `qq` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `score` int(11) NOT NULL DEFAULT 0,
  `type` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '类型 0|管理员 1|学生 2|教师',
  `motto` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '座右铭',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_name_unique` (`name`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_users
-- ----------------------------
INSERT INTO `wg_users` VALUES ('1', 'yanqinsc', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '', '小石', 'http://weiguang/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc@qq.com', '', '', '', '0', '0', '孜孜不倦，不紧不慢', 'XNZV5zgiwqpZpsWW7Qc6dJzsl56PyjStn0ZRudlFi74Gukw0FI7yYq7mEGia', '2018-04-16 23:49:09', '2018-04-16 23:49:09', null);
