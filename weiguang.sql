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

 Date: 23/07/2018 21:41:52
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
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

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
INSERT INTO `wg_abilities` VALUES (22, 'user-list', '用户管理', NULL, NULL, 0, NULL, '2018-06-23 21:22:57', '2018-06-23 21:22:57');
INSERT INTO `wg_abilities` VALUES (23, 'user-create', '用户添加', NULL, NULL, 0, NULL, '2018-06-23 21:23:28', '2018-06-23 21:23:28');
INSERT INTO `wg_abilities` VALUES (24, 'user-edit', '用户编辑', NULL, NULL, 0, NULL, '2018-06-23 21:24:18', '2018-06-23 21:24:18');
INSERT INTO `wg_abilities` VALUES (25, 'user-forbiden', '用户禁用', NULL, NULL, 0, NULL, '2018-06-23 21:24:53', '2018-06-23 21:24:53');
INSERT INTO `wg_abilities` VALUES (26, 'category-list', '分类管理', NULL, NULL, 0, NULL, '2018-07-05 22:28:03', '2018-07-05 22:28:48');
INSERT INTO `wg_abilities` VALUES (27, 'category-create', '分类创建', NULL, NULL, 0, NULL, '2018-07-05 22:28:40', '2018-07-05 22:29:34');
INSERT INTO `wg_abilities` VALUES (28, 'category-edit', '分类编辑', NULL, NULL, 0, NULL, '2018-07-05 22:29:21', '2018-07-05 22:29:21');
INSERT INTO `wg_abilities` VALUES (29, 'category-destroy', '分类删除', NULL, NULL, 0, NULL, '2018-07-05 22:29:57', '2018-07-05 22:30:07');
INSERT INTO `wg_abilities` VALUES (30, 'comment-list', '评论管理', NULL, NULL, 0, NULL, '2018-07-08 11:15:21', '2018-07-08 11:15:21');
INSERT INTO `wg_abilities` VALUES (31, 'comment-review', '评论审核', NULL, NULL, 0, NULL, '2018-07-08 11:15:42', '2018-07-08 11:15:42');
INSERT INTO `wg_abilities` VALUES (32, 'comment-destroy', '评论删除', NULL, NULL, 0, NULL, '2018-07-08 11:16:05', '2018-07-08 11:16:05');
INSERT INTO `wg_abilities` VALUES (33, 'admin-center', '个人中心', NULL, NULL, 0, NULL, '2018-07-19 23:35:19', '2018-07-19 23:35:19');

-- ----------------------------
-- Table structure for wg_admins
-- ----------------------------
DROP TABLE IF EXISTS `wg_admins`;
CREATE TABLE `wg_admins`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(55) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电话号码',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `motto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '座右铭',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wg_admins
-- ----------------------------
INSERT INTO `wg_admins` VALUES (1, 'yanqinsc', '$2y$10$9rEUdYPGBpiF1C/E242iPuKFdBtKbUgHQW9TyFys81iGGY31q3rwC', '小石', '晏勤', '', 'yanqinsc@qq.com', '15730192872', '498412563', '重庆马王坪正街17-7', '孜孜不倦，不紧不慢', 'NFepvuA28gc8XhrDxXQ7r0EwprB7yMaJuZ958sgNM9G73oRHrzZUAg9Hi0e6', '2018-04-16 23:49:09', '2018-07-18 17:23:04', NULL);
INSERT INTO `wg_admins` VALUES (2, 'panda', '$2y$10$xaIMO0sN9E6JFyItCM.pcO/Ii0Y/E.nDbL1QOb68N3a9B88Z0yMYW', '盼盼', '史盼盼', '', '97503939@qq.com', NULL, '', '', '', 'ZxmWv9Zzbuv2fznahsKsjKf1BC4Kyli9kkTWhmBbXMMrXhxbfBDUoqqnfOnv', '2018-07-20 02:36:40', '2018-07-20 02:44:51', NULL);

-- ----------------------------
-- Table structure for wg_articles
-- ----------------------------
DROP TABLE IF EXISTS `wg_articles`;
CREATE TABLE `wg_articles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `key_words` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '',
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者',
  `author_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `from` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '作者单位',
  `thumb` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '缩略图',
  `excerpt` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章摘要',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `comment_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `is_top` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否置顶  NULL|否',
  `is_hot` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否热门文章  NULL|否',
  `is_original` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否原创 NULL|否',
  `category_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `publisher_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '编辑ID',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '0|草稿 1|已发表 2|来稿',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_articles
-- ----------------------------
INSERT INTO `wg_articles` VALUES (1, '写给过去的岁月', '岁月,农民,生活', '小石', 51, '', '/uploads/thumb/2.png', '一首小诗写给过去的那些岁月', '<p>母亲把泡胀的种子</p><p>放在衣兜里</p><p>夜里梦见满地新绿&nbsp;­<br/></p><p><br/></p>', 11, 1, NULL, NULL, '', 1, 1, '1', '2009-02-17 21:12:47', '2018-07-23 02:40:30', NULL);
INSERT INTO `wg_articles` VALUES (2, '读《青铜葵花》', '青铜葵花,曹文轩,少儿文学', '盼盼', 0, '成都嘉祥外国语学校', '/uploads/thumb/3.png', '以往都说读一本书不应跳过作者的自序。而曹文轩的序言我倒以为真该读完小说后再读他的序言，方能真正懂他再说什么，方能被这序言打动。', '<p><br/></p><p><img src=\"/uploads/ueditor/images/20180720/1532020683147719.jpeg\" title=\"1532020683147719.jpeg\"/></p><p><br/></p><p><img src=\"https://litlight.cn/uploads/ueditor/images/20180720/1532020683695990.jpeg\" title=\"1532020683695990.jpeg\"/></p><p><br/></p>', 8, 0, NULL, NULL, '', 2, 1, '1', '2018-01-07 01:18:59', '2018-07-23 02:40:30', NULL);
INSERT INTO `wg_articles` VALUES (3, '与生书', '书信,学生,严氏家训,青铜葵花', '盼盼', 0, '成都嘉祥外国语学校', '/uploads/thumb/4.png', '又是一年将尽时。这时我总觉得应该有种仪式可以让我郑重地告别过去一年。我选择给你们写一封信，因为你们是我过去一年中生活的重心。', '<p><img src=\"/uploads/ueditor/images/20180720/1532021154247301.jpeg\" title=\"1532021154247301.jpeg\" alt=\"微信图片_20180720012543.jpg\"/></p>', 10, 1, NULL, NULL, '', 3, 1, '1', '2017-12-26 01:26:04', '2018-07-23 15:08:09', NULL);

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wg_assigned_roles
-- ----------------------------
INSERT INTO `wg_assigned_roles` VALUES (3, 1, 'App\\Model\\Admin', NULL);
INSERT INTO `wg_assigned_roles` VALUES (1, 2, 'App\\Model\\Admin', NULL);

-- ----------------------------
-- Table structure for wg_categories
-- ----------------------------
DROP TABLE IF EXISTS `wg_categories`;
CREATE TABLE `wg_categories`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `slug` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简称',
  `is_nav` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否作为导航栏频道 null|否',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类详情',
  `order` int(2) UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `allow_post` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '允许投稿 null|否',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_categories
-- ----------------------------
INSERT INTO `wg_categories` VALUES (1, 0, '习作欣赏', 'practices', '', '', 99, '');
INSERT INTO `wg_categories` VALUES (2, 0, '阅读同行', 'read', '', '', 98, NULL);
INSERT INTO `wg_categories` VALUES (3, 0, '盼盼来信', 'letters', '', '', 97, NULL);

-- ----------------------------
-- Table structure for wg_comments
-- ----------------------------
DROP TABLE IF EXISTS `wg_comments`;
CREATE TABLE `wg_comments`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `aid` int(11) UNSIGNED NOT NULL COMMENT '文章ID',
  `uid` int(11) UNSIGNED NOT NULL COMMENT '用户ID',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '评论内容',
  `reviewed` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '已审核 null|否',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_comments
-- ----------------------------
INSERT INTO `wg_comments` VALUES (39, 1, 51, 0, '放衣兜里可以让种子更快发芽🤔', '', '2018-07-19 19:58:00');
INSERT INTO `wg_comments` VALUES (40, 3, 51, 0, 'Time flies,we are here.🙂', '', '2018-07-20 08:36:22');

-- ----------------------------
-- Table structure for wg_jobs
-- ----------------------------
DROP TABLE IF EXISTS `wg_jobs`;
CREATE TABLE `wg_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED NULL DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for wg_menus
-- ----------------------------
DROP TABLE IF EXISTS `wg_menus`;
CREATE TABLE `wg_menus`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) UNSIGNED NOT NULL,
  `order` int(11) UNSIGNED NULL DEFAULT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `route_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_name_unique`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wg_menus
-- ----------------------------
INSERT INTO `wg_menus` VALUES (1, 0, 0, '权限管理', 'fa-lock', '#', '2018-04-30 08:54:32', '2018-07-05 23:23:28', NULL);
INSERT INTO `wg_menus` VALUES (2, 1, 99, '权限', 'fa-key', 'ability.index', '2018-04-30 08:55:27', '2018-06-04 08:08:47', NULL);
INSERT INTO `wg_menus` VALUES (3, 1, 98, '角色', 'fa-group', 'role.index', '2018-05-03 21:03:43', '2018-06-04 08:08:52', NULL);
INSERT INTO `wg_menus` VALUES (4, 0, 1, '内容管理', 'fa-files-o', '#', '2018-05-05 14:12:29', '2018-06-10 19:03:17', NULL);
INSERT INTO `wg_menus` VALUES (5, 4, 99, '文章', 'fa-file-text', 'article.index', '2018-05-05 14:15:26', '2018-06-04 21:12:01', NULL);
INSERT INTO `wg_menus` VALUES (6, 1, 96, '管理员', 'fa-user', 'admins.index', '2018-06-04 08:03:31', '2018-06-10 19:03:45', NULL);
INSERT INTO `wg_menus` VALUES (7, 4, 97, '评论', ' fa-comments', 'comment.index', '2018-06-04 08:13:24', '2018-07-08 13:59:37', NULL);
INSERT INTO `wg_menus` VALUES (8, 1, 97, '菜单', ' fa-th-large', 'menu.index', '2018-06-10 19:00:52', '2018-06-10 19:03:48', NULL);
INSERT INTO `wg_menus` VALUES (9, 0, 2, '用户管理', 'fa-users', '#', '2018-06-10 22:03:03', '2018-06-13 16:39:17', NULL);
INSERT INTO `wg_menus` VALUES (10, 9, 99, '用户列表', 'fa-user', 'user.index', '2018-06-12 20:47:24', '2018-06-13 16:52:30', NULL);
INSERT INTO `wg_menus` VALUES (11, 4, 98, '分类', 'fa-paper-plane', 'category.index', '2018-07-05 22:33:15', '2018-07-23 14:57:25', NULL);
INSERT INTO `wg_menus` VALUES (12, 0, 99, '个人中心', 'fa-user', '#', '2018-07-15 15:07:50', '2018-07-23 14:57:28', NULL);
INSERT INTO `wg_menus` VALUES (13, 12, 99, '基本资料', 'fa-file', 'admin.info', '2018-07-15 15:13:25', '2018-07-23 15:05:15', NULL);
INSERT INTO `wg_menus` VALUES (14, 12, 98, '修改密码', 'fa-lock', 'admin.changePassword', '2018-07-15 15:14:53', '2018-07-23 15:05:17', NULL);

-- ----------------------------
-- Table structure for wg_menus_roles
-- ----------------------------
DROP TABLE IF EXISTS `wg_menus_roles`;
CREATE TABLE `wg_menus_roles`  (
  `menu_id` int(6) NOT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  UNIQUE INDEX `menus_roles_unique`(`menu_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wg_menus_roles
-- ----------------------------
INSERT INTO `wg_menus_roles` VALUES (1, 1);
INSERT INTO `wg_menus_roles` VALUES (1, 3);
INSERT INTO `wg_menus_roles` VALUES (2, 1);
INSERT INTO `wg_menus_roles` VALUES (2, 3);
INSERT INTO `wg_menus_roles` VALUES (3, 1);
INSERT INTO `wg_menus_roles` VALUES (3, 3);
INSERT INTO `wg_menus_roles` VALUES (4, 1);
INSERT INTO `wg_menus_roles` VALUES (4, 2);
INSERT INTO `wg_menus_roles` VALUES (4, 3);
INSERT INTO `wg_menus_roles` VALUES (5, 1);
INSERT INTO `wg_menus_roles` VALUES (5, 2);
INSERT INTO `wg_menus_roles` VALUES (5, 3);
INSERT INTO `wg_menus_roles` VALUES (6, 1);
INSERT INTO `wg_menus_roles` VALUES (6, 3);
INSERT INTO `wg_menus_roles` VALUES (7, 1);
INSERT INTO `wg_menus_roles` VALUES (7, 2);
INSERT INTO `wg_menus_roles` VALUES (7, 3);
INSERT INTO `wg_menus_roles` VALUES (8, 1);
INSERT INTO `wg_menus_roles` VALUES (8, 3);
INSERT INTO `wg_menus_roles` VALUES (9, 1);
INSERT INTO `wg_menus_roles` VALUES (9, 3);
INSERT INTO `wg_menus_roles` VALUES (10, 1);
INSERT INTO `wg_menus_roles` VALUES (10, 3);
INSERT INTO `wg_menus_roles` VALUES (11, 1);
INSERT INTO `wg_menus_roles` VALUES (11, 3);
INSERT INTO `wg_menus_roles` VALUES (12, 1);
INSERT INTO `wg_menus_roles` VALUES (12, 3);
INSERT INTO `wg_menus_roles` VALUES (13, 1);
INSERT INTO `wg_menus_roles` VALUES (13, 3);
INSERT INTO `wg_menus_roles` VALUES (14, 1);
INSERT INTO `wg_menus_roles` VALUES (14, 3);

-- ----------------------------
-- Table structure for wg_migrations
-- ----------------------------
DROP TABLE IF EXISTS `wg_migrations`;
CREATE TABLE `wg_migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

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
  INDEX `password_resets_email_index`(`email`(191)) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

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
INSERT INTO `wg_permissions` VALUES (10, 2, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (11, 2, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (12, 2, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (13, 2, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (6, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (19, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (20, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (21, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (18, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (22, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (24, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (25, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (23, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (26, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (27, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (28, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (29, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (30, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (31, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (32, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (33, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (1, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (2, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (3, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (4, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (5, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (7, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (6, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (8, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (9, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (10, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (11, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (12, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (13, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (14, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (15, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (16, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (17, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (18, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (19, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (20, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (21, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (22, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (23, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (24, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (25, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (17, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (16, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (33, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (32, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (31, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (30, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (29, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (28, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (27, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (26, 3, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (33, 2, 'roles', 0, NULL);

-- ----------------------------
-- Table structure for wg_register_codes
-- ----------------------------
DROP TABLE IF EXISTS `wg_register_codes`;
CREATE TABLE `wg_register_codes`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`(191)) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wg_register_codes
-- ----------------------------
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@qq.com', '133908', '2018-07-18 15:37:25');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@qq.com', '236731', '2018-07-18 15:49:11');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@qq.com', '551274', '2018-07-18 15:53:07');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@hotmail.com', '331401', '2018-07-20 08:50:37');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@qq.com', '198730', '2018-07-20 21:29:41');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@qq.com', '369264', '2018-07-20 21:31:31');

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wg_roles
-- ----------------------------
INSERT INTO `wg_roles` VALUES (1, 'admin', '管理员', NULL, NULL, '2018-04-22 11:45:48', '2018-05-08 21:00:41');
INSERT INTO `wg_roles` VALUES (2, 'editor', '编辑', NULL, NULL, '2018-05-08 09:35:38', '2018-05-08 09:35:38');
INSERT INTO `wg_roles` VALUES (3, 'super', '超级管理员', NULL, NULL, '2018-07-20 02:05:48', '2018-07-20 02:05:48');

-- ----------------------------
-- Table structure for wg_sessions
-- ----------------------------
DROP TABLE IF EXISTS `wg_sessions`;
CREATE TABLE `wg_sessions`  (
  `id` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE INDEX `sessions_id_unique`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wg_sessions
-- ----------------------------
INSERT INTO `wg_sessions` VALUES ('2NrXxn1FsTwMAMFhJ3URh88htYNRwK0tillrX2iF', 51, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSFk0S3hQRzBFQlQwQ2FQRGdNUEZ0UVlpYVc1c0phZWNmMG9JU2NpWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjk6Imh0dHA6Ly93ZWlndWFuZy9ob21lL2FydGljbGVzIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTE7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cDovL3dlaWd1YW5nL3BhbmVsL2FydGljbGUiO319', 1532353264);

-- ----------------------------
-- Table structure for wg_teams
-- ----------------------------
DROP TABLE IF EXISTS `wg_teams`;
CREATE TABLE `wg_teams`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '队伍名称',
  `discribe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '队伍描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for wg_users
-- ----------------------------
DROP TABLE IF EXISTS `wg_users`;
CREATE TABLE `wg_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号码 预留字段',
  `email` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `team_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属班级',
  `motto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '座右铭',
  `is_captain` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'null | 否  ‘’|是',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of wg_users
-- ----------------------------
INSERT INTO `wg_users` VALUES (51, 'yanqinsc', '$2y$10$2DfAQ6TRsurL3fiFmowAbe6NcJRqTDIYiSwu0Qa.OYUniWNACiLWe', '小石', '', 'https://litlight.cn/uploads/avatars/users/51.png', '', 'yanqinsc@qq.com', '', '', 0, '孜孜不倦，不紧不慢', NULL, 'ma2TTW7XTUxlXeTU0cIUAXsFf5MyP8ppihDWV1QyyY89QPwXTGskpaVMxrw6', '2018-07-18 15:54:22', '2018-07-20 14:01:04', NULL);

SET FOREIGN_KEY_CHECKS = 1;
