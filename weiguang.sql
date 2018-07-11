/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : weiguang

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 11/07/2018 17:36:10
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
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `wg_abilities` VALUES (26, 'school-list', '学校管理', NULL, NULL, 0, NULL, '2018-06-24 09:46:51', '2018-06-24 09:46:51');
INSERT INTO `wg_abilities` VALUES (27, 'school-create', '学校创建', NULL, NULL, 0, NULL, '2018-06-24 09:47:13', '2018-06-24 09:47:13');
INSERT INTO `wg_abilities` VALUES (28, 'school-edit', '学校编辑', NULL, NULL, 0, NULL, '2018-06-24 09:47:35', '2018-06-24 09:47:35');
INSERT INTO `wg_abilities` VALUES (29, 'class-list', '班级列表', NULL, NULL, 0, NULL, '2018-06-25 10:42:46', '2018-06-25 10:42:46');
INSERT INTO `wg_abilities` VALUES (30, 'class-create', '班级创建', NULL, NULL, 0, NULL, '2018-06-25 10:43:28', '2018-06-25 10:43:28');
INSERT INTO `wg_abilities` VALUES (31, 'class-edit', '班级编辑', NULL, NULL, 0, NULL, '2018-06-25 10:43:51', '2018-06-25 10:43:51');
INSERT INTO `wg_abilities` VALUES (32, 'category-list', '分类管理', NULL, NULL, 0, NULL, '2018-07-05 22:28:03', '2018-07-05 22:28:48');
INSERT INTO `wg_abilities` VALUES (33, 'category-create', '分类创建', NULL, NULL, 0, NULL, '2018-07-05 22:28:40', '2018-07-05 22:29:34');
INSERT INTO `wg_abilities` VALUES (34, 'category-edit', '分类编辑', NULL, NULL, 0, NULL, '2018-07-05 22:29:21', '2018-07-05 22:29:21');
INSERT INTO `wg_abilities` VALUES (35, 'category-destroy', '分类删除', NULL, NULL, 0, NULL, '2018-07-05 22:29:57', '2018-07-05 22:30:07');
INSERT INTO `wg_abilities` VALUES (36, 'comment-list', '评论管理', NULL, NULL, 0, NULL, '2018-07-08 11:15:21', '2018-07-08 11:15:21');
INSERT INTO `wg_abilities` VALUES (37, 'comment-review', '评论审核', NULL, NULL, 0, NULL, '2018-07-08 11:15:42', '2018-07-08 11:15:42');
INSERT INTO `wg_abilities` VALUES (38, 'comment-destroy', '评论删除', NULL, NULL, 0, NULL, '2018-07-08 11:16:05', '2018-07-08 11:16:05');

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
INSERT INTO `wg_admins` VALUES (1, 'yanqinsc', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '小石', '晏勤', '/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc@qq.com', '', '', '', '孜孜不倦，不紧不慢', 'pRDHrbs7FiZ3OgbIPcGQpbW3gRfZ1XEXYYubdfyoxrCyIHJlakrks63BF2u3', '2018-04-16 23:49:09', '2018-04-16 23:49:09', NULL);
INSERT INTO `wg_admins` VALUES (4, 'panda', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '盼盼', '史盼盼', '/admin/adminlte/dist/img/user2-160x160.jpg', 'panda@qq.com', '', '', '', '孜孜不倦，不紧不慢', 'm24t7MCM24pMQnYj7sjKtzmL6vPJeRYv9wlfPh9VuqE5Wb7WZEPDRszDt7Rl', '2018-04-16 23:49:09', '2018-04-16 23:49:09', NULL);
INSERT INTO `wg_admins` VALUES (5, 'xiuqing', '$2y$10$ZbXRoqHcHOv14BlvBP83Oe.RZmfUW7870alIdzRRTqwkiZgw.y.jW', '秀卿', '秀卿', '', 'xiuqing@qq.com', '12312421241', '', '', '', NULL, '2018-06-05 07:02:56', '2018-07-08 13:59:55', '2018-07-08 13:59:55');
INSERT INTO `wg_admins` VALUES (6, 'yanqinsc2', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '风云', '风雨', 'http://weiguang/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc8@qq.com', '12312421241', '', '', '千金散尽还复来', NULL, '2018-06-05 08:09:51', '2018-06-06 20:46:18', NULL);

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
  `category_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `publisher_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '编辑ID',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1' COMMENT '0|草稿 1|已发表',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 37 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_articles
-- ----------------------------
INSERT INTO `wg_articles` VALUES (35, '一生独一', '一生独一', '卢焱', 1, '营山中学', 'https://abc.2008php.com/2014_Website_appreciate/2014-04-25/20140425021147.jpg', '一生独一', '<p>我说我不会写诗我只是</p><p>在诗里刻画了你的影子</p><p>每到阳春的三月你穿着</p><p>随风起舞的花布裙子</p><p>予美的定义我只是想用</p><p>你的名字来造句来写词</p><p>告诉你这世上无二的诗</p><p>讲你是我独一的故事</p><p>一城烟雨一楼台</p><p>一花只为一树开</p><p>一颦一笑一知己</p><p>一点一点一滴一份情怀</p><p>一城烟雨一楼台</p><p>一花只为一树开</p><p>一颦一笑一知己</p><p>一点一滴一情怀</p><p>予美的定义我只是想用</p><p>你的名字来造句来写词</p><p>告诉你这世上无二的诗</p><p>讲你是我独一的故事</p><p>一城烟雨一楼台</p><p>一花只为一树开</p><p>一颦一笑一知己</p><p>一点一点一滴一份情怀</p><p>一城烟雨一楼台</p><p>一花只为一树开</p><p>一颦一笑一知己</p><p>一点一滴一情怀</p><p>一城烟雨一楼台</p><p>一花只为一树开</p><p>一颦一笑一知己</p><p>一点一点一滴一份情怀</p><p>一城烟雨一楼台</p><p>一花只为一树开</p><p>一颦一笑一知己</p><p>一点一滴一情怀</p><p>你是我一生最重要的事……</p><p><br/></p>', 3, 0, '', '', 1, 1, '1', '2018-07-04 00:14:06', '2018-07-05 22:24:15', NULL);
INSERT INTO `wg_articles` VALUES (36, '往后余生', '往后余生', '马良', 1, '营山中学', 'https://abc.2008php.com/2014_Website_appreciate/2014-04-25/20140425021147.jpg', '往后余生', '<p>在没风的地方找太阳</p><p>在你冷的地方做暖阳</p><p>人事纷纷</p><p>你总太天真</p><p>往后的余生</p><p>我只要你</p><p>往后余生</p><p>风雪是你</p><p>平淡是你</p><p>清贫也是你</p><p>荣华是你</p><p>心底温柔是你</p><p>目光所致</p><p>也是你</p><p>想带你去看晴空万里</p><p>想大声告诉你我为你着迷</p><p>往事匆匆</p><p>你总会被感动</p><p>往后的余生</p><p>我只要你</p><p>往后余生</p><p>冬雪是你</p><p>春华是你</p><p>夏雨也是你</p><p>秋黄是你</p><p>四季冷暖是你</p><p>目光所致</p><p>也是你</p><p>往后余生</p><p>风雪是你</p><p>平淡是你</p><p>清贫也是你</p><p>荣华是你</p><p>心底温柔是你</p><p>目光所致</p><p>也是你</p>', 3, 0, '', '', 12, 1, '1', '2018-07-05 21:30:11', '2018-07-06 09:55:10', NULL);

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
INSERT INTO `wg_assigned_roles` VALUES (3, 4, 'App\\Model\\Admin', NULL);
INSERT INTO `wg_assigned_roles` VALUES (2, 5, 'App\\Model\\Admin', NULL);

-- ----------------------------
-- Table structure for wg_categories
-- ----------------------------
DROP TABLE IF EXISTS `wg_categories`;
CREATE TABLE `wg_categories`  (
  `id` int(3) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT 0,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类名称',
  `slug` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简称',
  `is_nav` char(0) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否作为导航栏频道',
  `desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '分类详情',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `slug_unique`(`slug`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_categories
-- ----------------------------
INSERT INTO `wg_categories` VALUES (1, 0, '佳作共赏', 'appreciate', '', '学生优秀作文分享');
INSERT INTO `wg_categories` VALUES (12, 0, '歌词欣赏', 'lyrics', '', '歌词欣赏');
INSERT INTO `wg_categories` VALUES (14, 0, '阅读之路', 'readway', '', '');
INSERT INTO `wg_categories` VALUES (15, 0, '习作存珍', 'zhouji', '', '');
INSERT INTO `wg_categories` VALUES (16, 0, '关于我们', 'aboutus', '', '');

-- ----------------------------
-- Table structure for wg_classes
-- ----------------------------
DROP TABLE IF EXISTS `wg_classes`;
CREATE TABLE `wg_classes`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `grade` year NOT NULL,
  `class` tinyint(3) UNSIGNED NOT NULL,
  `school_id` smallint(5) UNSIGNED NOT NULL,
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1' COMMENT '1|初中 2|高中',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of wg_classes
-- ----------------------------
INSERT INTO `wg_classes` VALUES (1, 2020, 1, 1, '1');
INSERT INTO `wg_classes` VALUES (2, 2006, 24, 2, '2');

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
) ENGINE = MyISAM AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_comments
-- ----------------------------
INSERT INTO `wg_comments` VALUES (3, 36, 1, 0, '这首歌不错，我很喜欢。', '', '2018-07-06 16:06:17');
INSERT INTO `wg_comments` VALUES (2, 36, 1, 0, '这首歌不错，我很喜欢。', '', '2018-07-06 16:05:25');
INSERT INTO `wg_comments` VALUES (4, 36, 1, 0, '这首歌不错，我很喜欢。', '', '2018-07-06 16:06:19');
INSERT INTO `wg_comments` VALUES (26, 36, 1, 19, '@武当  排序我觉得默认排序就行了吧。', '', '2018-07-08 14:23:42');
INSERT INTO `wg_comments` VALUES (13, 36, 1, 0, '这首歌不错，我很喜欢。', '', '2018-07-06 16:13:09');
INSERT INTO `wg_comments` VALUES (14, 36, 2, 2, '@晏勤  这个想法不错', '', '2018-07-06 17:36:15');
INSERT INTO `wg_comments` VALUES (15, 36, 1, 14, '@武当  那当然了，很棒是吧', '', '2018-07-07 16:17:01');
INSERT INTO `wg_comments` VALUES (17, 36, 1, 14, '@武当  补充一句，哈哈哈哈', '', '2018-07-07 16:18:57');
INSERT INTO `wg_comments` VALUES (19, 36, 2, 0, '这个应该如何排序才好', '', '2018-07-07 19:18:51');
INSERT INTO `wg_comments` VALUES (22, 36, 1, 0, '@武当  想带你去看晴空万里', '', '2018-07-08 00:38:50');
INSERT INTO `wg_comments` VALUES (23, 35, 1, 0, '想起羽泉的一生有你。', '', '2018-07-08 00:59:15');
INSERT INTO `wg_comments` VALUES (24, 35, 1, 0, '这是第二条评论', '', '2018-07-08 01:02:20');
INSERT INTO `wg_comments` VALUES (27, 35, 1, 0, '这是第4条评论', '', '2018-07-09 10:55:50');

-- ----------------------------
-- Table structure for wg_configs
-- ----------------------------
DROP TABLE IF EXISTS `wg_configs`;
CREATE TABLE `wg_configs`  (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT 'key',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT ''
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_configs
-- ----------------------------
INSERT INTO `wg_configs` VALUES ('comment_review', 'off');

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
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `menu_name_unique`(`title`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `wg_menus` VALUES (11, 9, 99, '学校管理', 'fa-university', 'school.index', '2018-06-23 21:58:48', '2018-06-24 09:41:17', NULL);
INSERT INTO `wg_menus` VALUES (12, 9, 2, '班级管理', 'fa-graduation-cap', 'class.index', '2018-06-24 09:39:52', '2018-07-05 23:23:23', NULL);
INSERT INTO `wg_menus` VALUES (13, 4, 98, '分类', 'fa-paper-plane', 'category.index', '2018-07-05 22:33:15', '2018-07-08 13:59:29', NULL);

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
INSERT INTO `wg_menus_roles` VALUES (4, 2);
INSERT INTO `wg_menus_roles` VALUES (5, 1);
INSERT INTO `wg_menus_roles` VALUES (5, 2);
INSERT INTO `wg_menus_roles` VALUES (6, 1);
INSERT INTO `wg_menus_roles` VALUES (7, 1);
INSERT INTO `wg_menus_roles` VALUES (7, 2);
INSERT INTO `wg_menus_roles` VALUES (8, 1);
INSERT INTO `wg_menus_roles` VALUES (9, 1);
INSERT INTO `wg_menus_roles` VALUES (10, 1);
INSERT INTO `wg_menus_roles` VALUES (13, 1);

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
-- Records of wg_password_resets
-- ----------------------------
INSERT INTO `wg_password_resets` VALUES ('yanqinsc@qq.com', '$2y$10$CgNf2O4Khp5fx4gaCDCCbepaERGzQQ5DGRPIDDg5slV6d9jJpg8Ia', '2018-07-09 17:40:30');

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
INSERT INTO `wg_permissions` VALUES (22, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (24, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (25, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (23, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (26, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (28, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (27, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (29, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (30, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (31, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (32, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (33, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (34, 1, 'roles', 0, NULL);
INSERT INTO `wg_permissions` VALUES (35, 1, 'roles', 0, NULL);

-- ----------------------------
-- Table structure for wg_register_codes
-- ----------------------------
DROP TABLE IF EXISTS `wg_register_codes`;
CREATE TABLE `wg_register_codes`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_register_codes
-- ----------------------------
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@126.com', '995009', '2018-07-10 23:07:08');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@126.com', '919869', '2018-07-10 23:13:45');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@126.com', '149278', '2018-07-10 23:17:27');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@126.com', '528726', '2018-07-10 23:20:04');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@126.com', '280483', '2018-07-10 23:21:55');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@126.com', '746347', '2018-07-10 23:34:19');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@126.com', '186324', '2018-07-10 23:41:30');
INSERT INTO `wg_register_codes` VALUES ('yanqinsc@126.com', '207714', '2018-07-10 23:51:13');

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
-- Table structure for wg_schools
-- ----------------------------
DROP TABLE IF EXISTS `wg_schools`;
CREATE TABLE `wg_schools`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '学校简称',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_schools
-- ----------------------------
INSERT INTO `wg_schools` VALUES (1, '成都嘉祥外国语学校（达州校区）', '嘉祥达州', '达州通川区');
INSERT INTO `wg_schools` VALUES (2, '营山高级中学', '营山中学', '四川省营山县');
INSERT INTO `wg_schools` VALUES (3, '成都第七高级中学', '成都七中', '四川成都');
INSERT INTO `wg_schools` VALUES (4, '重庆第一中学', '重庆一中', '重庆市沙坪坝区');

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
INSERT INTO `wg_sessions` VALUES ('aLDp9MgH5jFvN9IoioFGGBHqRacoupP6wOGEs9RV', 50, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiV08yVDFhN1lHY2RvczZqRTVBZkRiSlJ6R3h0SjloNm9xRjlZSnlDeSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjA6Imh0dHA6Ly93ZWlndWFuZy9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6NTA7fQ==', 1531239276);
INSERT INTO `wg_sessions` VALUES ('t7GgiWzLZLXKROZfGgonTqutxX5jtYKw3qWCcz8c', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/67.0.3396.87 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiZFFoNFA5YzU0SEp6MlJBd0xhV0NDQWh5RDNWbWgwMDdyUTZoeEZhVyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjQ6Imh0dHA6Ly93ZWlndWFuZy9yZWdpc3RlciI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1531235022);

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
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '真实姓名',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '电话号码',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `class_id` int(11) UNSIGNED NOT NULL DEFAULT 0 COMMENT '所属班级',
  `motto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '座右铭',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 51 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wg_users
-- ----------------------------
INSERT INTO `wg_users` VALUES (1, 'yanqinsc', '$2y$10$XPajQE62fsQhWOMscqDWBes1qSOwZFiTTZx/GVwWuouGvSzN.hJhS', '小石', '小石', '/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc@qq.com', '', '', '李家沱马王坪正街立丹大厦李家沱马王坪正街立丹大厦李家沱马王坪正街立丹大厦李家沱马王坪正街立丹大厦李家沱马王坪正街立丹大厦李家沱马王坪正街立丹大厦李家沱马王坪正街立丹大厦', 2, '孜孜不倦，不紧不慢', 'ueMc2hshp1kVgoeK2mja0szZx44Cb5Jqq0bauyQ2sjuQYvwSLAPKi9WsrYyA', '2018-04-16 23:49:09', '2018-07-08 21:50:32', NULL);
INSERT INTO `wg_users` VALUES (2, 'uDrZQkQ8C2', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', 'HeGSb', '武当', '', 'RHHqtMy8Pv@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (3, 'hrqz0srhqs', '$2y$10$E3vTR6Q1KmTBosWT143.zuYXp40G06dTzADOt/En4dRpWajbkuOrC', 'UVypl', 'Lqxra', '', 'yvQipiD49A@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (4, 'iK8ELQlKg1', '$2y$10$Xtkx5ziztdM0Q.ulCUc7luyWaujbinPRyIKhNheYRCPxdyLt4dq/y', '8xnOd', 'SaJqm', '', 'yqLRdGYxCr@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (5, 'ornPJrp6ed', '$2y$10$cJGd3ch0jTuLNtrQXW4GfO0tbgpkjtSlHigvuZmhcx1PxvoScrO1i', 'w11rM', 'CYOn5', '', 'flcIsa1avs@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (6, 'kzMdapmz1N', '$2y$10$qGMhw3m5Dj/KcaunajApzeZMGaSRl0sA.X0hszBYO3OG2acm5HHYS', 'TynvP', 'CyckN', '', 'tWkMvk5bBr@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (7, '6Pl0QCxAN3', '$2y$10$Cm3657TG8Ppjan.gdd4qfOVHw7GMb7ao81MQKFqrZmGWA.hp84y7O', 'k1Hfl', 'yw5pE', '', 'ZT0B2EfEdN@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (8, 'GjWOakdTca', '$2y$10$QyHFIzyFT04JtzFYn6yWeeJ/ZWaB./JinbgHW4WlNI3No1Z.NL7mK', 'cH5uB', 'KFHOy', '', 'q6FhboaCRe@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (9, 'CaaDwZXzZp', '$2y$10$mLeCGyhjlY0U7erFA2RqLu9Xp3RkKTATydKZqEk.lN08DFcafB3b6', '80aOs', 'FOnu9', '', 'jrfw6mr0vD@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (10, 'LWvKUh0tJ5', '$2y$10$EUFUPX/w1odGCRdW4kBLAecKcqmNgj9JYZ8885P4oyW6yrQlJu8C.', 'DRai3', 'N0Vpg', '', 'wHSfGnY0hz@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (11, 'OtRC9jszIw', '$2y$10$xImBazzS11Z6ms.7VRhSVeofBmq32luD6caSDBOie1cxfR4SrMmvG', 'rXBTI', 'muXPb', '', 'tTqMP6pc4B@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (12, 'm3bL70QNOy', '$2y$10$c2vRNjF3pVbSCELphP0AZurCWFpGRX63Miaf03L2Ij2kl.JxIaOEC', '1df6N', 'jDKOB', '', 'ZC0yknCQxL@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (13, '57ZqwoUnpD', '$2y$10$caVvyrxs8gKFdiOIoUIDB.CeazzpAWUDt2.uvyuGvrVH3YIKN4Fl2', 'QA4k2', '75mmG', '', 'ztq6t4zoLQ@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (14, '6BeQUk2wso', '$2y$10$VzwZWwLrSm3g0QwAO3X0aepcdLYZM2DBk3IhD9hXtX1Qvbqud1FxG', 'moE3f', 'REJz4', '', 'EkPP1Ae4NI@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (15, 'NhiPzcZTBt', '$2y$10$H5p4eHFLUMgRHYjpH0PzbuIS1A1/O2Rr/qlY.QQd7Xt2opPnZ6rqq', 'mqZx2', 'IbS1r', '', 'sggstlq7MF@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (16, '9zGmVbSbWA', '$2y$10$CMwTe/LY1aWsSbCmBqdgz.Z2QqWKtMbmi.QufgAlJQGUXpil.TS0W', 'v5yas', 'szij7', '', '3SsUxrNlMP@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (17, 'jRSuDz29hJ', '$2y$10$8zg5XHqFDxNYFC2WTXcYzuvwWUCVuigmmNzlLqdhMWvQlxrX7ySpu', 'jyGCY', 'yEy5T', '', 'v7px8H79xJ@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (18, 'AFrdr18ncy', '$2y$10$kF3Lil/py3MlIbZWlWSS2.rHTrzwrO.fDuWjbZjCvYLh07rZSmgWS', 'Q6pw7', 'hJ6uM', '', 'nAJV9tEUC3@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (19, 'XAolrgtT0I', '$2y$10$Fg31ZBa6T3TlZhSQU0B9/uTBZNPiaOhY.jRTvgzD0ECMTKWpi5Usq', 'SYQ0w', '8oQiw', '', 'nVICfUKLYP@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (20, 'mz9vmLMszu', '$2y$10$xZE0.3veiXmKboA0T.uZqOifkTmDfmGjT2DATvACsQGfV.Dx88dTe', 'sLcFO', 'TQ4aS', '', '7OkATGBIUI@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (21, 'G0DeRdTB5B', '$2y$10$tg494Sy70YnMQkOFD0yjLelyU10hFGk9YRF2FU1ZH4sNxZfV/cpnq', 'Wlynz', '3ATtB', '', '1pu8qu9ysx@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (22, 'BLpqvvfnIn', '$2y$10$8fw3SvyVL3C4SSk8DgbBCObARVsI9wO95l5AOWkqQlVhypaGCZ5Xi', '83s29', 'xjJKY', '', 'EsjzzeDQ5N@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (23, '6MkOmScDdK', '$2y$10$RmOhZNpgKarbndkwTJPf/up5fpYJQnpBJ9XpAf18D5jVBqH1tg96u', 'slNRi', 'ALApY', '', 'xoW1qVfUPs@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (24, 'pMM71cFX2U', '$2y$10$Dq2cO1oumteKE7lCiMU/gO5Xq.uqpI3/E8WeeiFMAkNOIEzwK/8.O', 'l7DHP', 'Z9a7b', '', 'yzyJ8EvfHQ@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (25, '7Ra5q56j8P', '$2y$10$0OFtK.cr7SEzQ7Ubn6NlHeKvfXF61xHf1W420k/LShhdjn4r0lMKm', '7AsTd', 'i5NDW', '', 'Ym6Ve53lZb@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (26, 'LQ26tdYryl', '$2y$10$NlPvPHkj1v7atZOptILgQudm26Ll3FsEhzSWQ3yfChvXZPdRz9P1G', 'oOlf5', 'vAihw', '', 'T5e51ZC8iZ@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (27, '0QDWAMjepF', '$2y$10$ffEV/6sRc4vVHZWSu7E4BeIRpEEXL1UcqA3s7mPOp0rJZeiPBiQAW', 'ZuKDb', 'ynI8A', '', 'lrPEqJYPUC@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (28, '8R2yiKAX6I', '$2y$10$VeLNK2kdFDd5UV5WzNjPROvf1O/1nDGrqd5bq0XroD.PdelEVoyAy', 'Y4KyH', 'OFhGg', '', 'cSfYchAF3p@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (29, 'Zh5MDpoL5f', '$2y$10$BADrYO47wMpn5WLHyeStXevH2b5kqMM3EcSAANdJC59.WVY8ARnFm', '0F6TZ', 'wYKX9', '', 'ww7ZzAirzT@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (30, 'qaQDndpsjZ', '$2y$10$RGLvOnIL8hI75RNofLKhluLVzwtVL3FJzyWG1sYlLNw/kOZfak1Cq', 'QSi2v', '3oqV9', '', 'lD0miBZnlO@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (31, '9k7WyFphgk', '$2y$10$FIhjSo9CaxfY2I6AXwRlcuzZ470PJfdkLE7a60dXBi/8u/SFY7SOS', 'kVTEc', 'S7pFP', '', '2YXls5WWkg@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (32, 'CIFVliZPvW', '$2y$10$of.3SCBz178qPBmW5eZJdehgu2KaP3mCiithLwdPFnG/m8tALJ.yC', '2WcPg', 'RQgyK', '', 'LgNUpgjzsF@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (33, 'R7Ak5XCxOS', '$2y$10$ggL1lnaTiBeegMzmTVHJMu05/bSNDe3mBx27FitzjGQlSzuFGgv02', 'l2ZFT', 'BuAkD', '', 'xpmFDtxQNG@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (34, 'MtEhiKSXXq', '$2y$10$HU1W4HrXEPDmf6DchGPSb.aWUFTg8w1LBsM/pmGDopPBIbndEAIVy', 'QJQ08', 'wj4Rl', '', '2XImysmwRm@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (35, 'gzAcGsICIH', '$2y$10$OjX6JBcPRJ8DEb.lA3kjmeOBbblGBLenVxCpDVB8yX1RWe8muQ9Ri', 'wMPbz', 'NL7SD', '', 'RxZVQABCQ2@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (36, 'k5yjE5gQ5r', '$2y$10$jdrw2DD9Mj6NCGYTDYw6iuECclqHouTLc6WnF2hAyTMprXI2ddxwG', 'xl8Ap', 'L82t0', '', '2oQ0GOpTBg@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (37, 'UenAsbTzx5', '$2y$10$OBl0uM6vryRyRuwCU11v9OPq4PaO5CocxDayFxlbE1/mMEpJE95fq', 'iJu2E', 'UsAjs', '', 'Id3ZsgJUjt@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (38, 'sqRVNOdnA9', '$2y$10$vhve87fdi3k9ErXtv9KA1OpE.rxtul/oJnBQ7.BClD6Y5IpoeVMkq', 'PqkQM', '26yBi', '', 'CxQ0IQklRn@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (39, '0eioawfSUx', '$2y$10$q8xSIzveQforYbforN00de9s2aeOe.Fimn.kSa73xNtNXvuqj9Sxe', 'Dh2II', '2wtMn', '', 'pZr4gFM4h2@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (40, 'i480jahoH1', '$2y$10$hZDAf5S25wJOCLkJNUPgduip7.Bm4j2qa70M9Xob5AwuOgQLxgspu', 'wQ40z', 'tqpGV', '', 'tYaIIYB3ed@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (41, 'f9fQ55I8H6', '$2y$10$0VhFJiJDG7XlAlitqIjI7.uJeVBoRiI/4jLvnevs6MSlRwpfDCZ3K', 'tEdkg', 'NhF7r', '', '81Z9Z5K5Q4@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (42, '4TBvTa2f3h', '$2y$10$YV5QrJs0Kp5dI.NkA343e.CF4dfBOg1cfT9dDBX8mYh6/c.doaFkO', 'Mx7lG', 'D02s9', '', 'jCVjW1zORl@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (43, 'ya7mhcuvOv', '$2y$10$P65jeY8gTBKOUFh58nkiW.0cVQjtf6cXEj9vSQBEm5TkaR61z7oyi', 'BrllS', 'i9eMJ', '', 'bLmil0qCeK@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (44, 'tqPb13bOD9', '$2y$10$qaFWVb7ABtA84UhCNtdvduXrM/IdykZTx7UYfbY.dojKxh7SRdv6.', '6cq4Y', 'gs2nG', '', 'KuE3hrEayl@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (45, '5rkVBRLvxl', '$2y$10$R7fhnHKwWz8CnlWDP26zPudjAaIeigkafCrXTaUBGzd.yQhC7mxLa', 'foxVZ', 'rrD2m', '', 'VzSbmld4DM@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (46, 'K8jdHfk4rM', '$2y$10$f4L1UsO2xUBnXbvZrIsdb.XpTxQVwaZpAYGvTF02zEII5QbW7zkIq', 'ljHAS', 'TorMN', '', '5LxWJT25Pl@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (47, 'HnSATRQhdX', '$2y$10$weJmzrNbwatPTKidsnQn3OApFnn3mWPFhdAYS0EeSZgNyfeF53kX2', 'Y2xjG', 'bCJsX', '', 'pUqh6Nru74@gmail.com', '', '', '', 0, '', NULL, NULL, NULL, NULL);
INSERT INTO `wg_users` VALUES (48, 'SuaoR64YVe', '$2y$10$dqWkr5OUtY.X8efpEFMW1ue5z14lyp.7Q7v.BIF6.UqaKIO.6cczy', 'FUIJe', 't1TQ2', '', 'NkFW6azXBq@gmail.com', '', '', '', 0, '', NULL, NULL, '2018-06-23 21:20:46', '2018-06-23 21:20:46');
INSERT INTO `wg_users` VALUES (49, 'litstone', '$2y$10$j6RCcVg0NJy1qWxLG1MIguElxx1RJ5zhILn.0RB1q/R2l13nOG0O.', 'wgQ3Gr3LtA', '小石', '', 'litstone@qq.com', '15709896572', '', '', 0, '', NULL, NULL, '2018-06-23 21:19:48', NULL);
INSERT INTO `wg_users` VALUES (50, 'panda', '$2y$10$Q/Ugv.iQ/KBItGsbE2aSTuXSv0a3pXiiXCZjM70uQHOQ24IJQ5ifu', '', '', '', 'yanqinsc@126.com', '', '', '', 0, '', NULL, '2018-07-11 00:14:36', '2018-07-11 00:14:36', NULL);

-- ----------------------------
-- Triggers structure for table wg_comments
-- ----------------------------
DROP TRIGGER IF EXISTS `update_article_comment_count`;
delimiter ;;
CREATE TRIGGER `update_article_comment_count` AFTER INSERT ON `wg_comments` FOR EACH ROW UPDATE wg_articles SET comment_count=(SELECT COUNT(*) FROM wg_comments WHERE id=new.aid) WHERE id=new.aid
;
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
