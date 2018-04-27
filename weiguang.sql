/*
Navicat MySQL Data Transfer

Source Server         : Localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : weiguang

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2018-04-27 08:59:16
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
  `only_owned` tinyint(1) NOT NULL DEFAULT '0',
  `scope` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abilities_scope_index` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_abilities
-- ----------------------------
INSERT INTO `wg_abilities` VALUES ('1', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('2', 'ability-list', '权限管理', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-21 17:56:00');
INSERT INTO `wg_abilities` VALUES ('3', 'edit-ability', '编辑权限', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-21 18:02:03');
INSERT INTO `wg_abilities` VALUES ('4', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-21 18:00:44');
INSERT INTO `wg_abilities` VALUES ('5', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-21 17:47:28');
INSERT INTO `wg_abilities` VALUES ('6', 'edit-role', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-21 18:01:38');
INSERT INTO `wg_abilities` VALUES ('7', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('8', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('9', 'edit-user', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-21 18:02:23');
INSERT INTO `wg_abilities` VALUES ('10', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('11', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 18:03:05');
INSERT INTO `wg_abilities` VALUES ('12', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('13', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('14', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('15', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('16', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('17', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('18', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('19', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('20', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('21', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('22', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('23', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('24', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('25', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('26', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('27', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('28', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('29', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('30', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('31', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('32', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('33', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('34', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('35', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('36', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('37', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('38', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('39', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('40', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('41', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('42', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('43', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('44', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('45', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('46', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('47', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('48', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('49', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('50', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('51', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('52', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('53', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('54', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('55', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('56', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('57', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('58', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('59', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('60', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('61', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('62', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('63', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('64', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('65', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('66', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('67', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('68', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('69', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('70', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('71', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('72', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('73', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('74', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('75', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('76', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('77', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('78', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('79', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('80', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('81', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('82', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('83', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('84', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('85', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('86', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('87', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('88', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('89', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('90', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('91', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('92', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('93', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('94', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('95', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('96', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('97', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('98', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('99', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('100', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('101', 'ability-list', '查看权限列表', null, null, '0', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('102', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('103', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('104', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('105', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('106', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('107', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('108', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('109', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('110', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('111', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('113', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('114', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('115', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('116', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('117', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('118', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('119', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('120', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('121', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('122', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('124', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('125', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('126', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('127', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('128', 'create-user', '添加用户', null, null, '0', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('129', 'user-list', '用户管理', null, null, '0', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('130', 'user-edit', '编辑用户信息', null, null, '0', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('131', 'user-forbid', '用户禁用', null, null, '0', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('132', 'ability-remove', '删除权限', null, null, '0', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('133', 'create-ability', '创建新的操作权限', null, null, '0', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('135', 'ability-edit', '编辑权限信息', null, null, '0', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('136', 'create-role', '创建用户角色', null, null, '0', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('137', 'role-list', '角色管理页', null, null, '0', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('138', 'role-edit', '编辑角色信息', null, null, '0', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');

-- ----------------------------
-- Table structure for wg_abilitymeta
-- ----------------------------
DROP TABLE IF EXISTS `wg_abilitymeta`;
CREATE TABLE `wg_abilitymeta` (
  `meta_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ability_id` int(11) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) NOT NULL DEFAULT '',
  `meta_value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`meta_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wg_abilitymeta
-- ----------------------------

-- ----------------------------
-- Table structure for wg_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `wg_admin_menu`;
CREATE TABLE `wg_admin_menu` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '描述',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COMMENT='后台管理导航主菜单，与权限关联，用于对权限进行分类并显示。';

-- ----------------------------
-- Records of wg_admin_menu
-- ----------------------------

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
-- Table structure for wg_menu_ability
-- ----------------------------
DROP TABLE IF EXISTS `wg_menu_ability`;
CREATE TABLE `wg_menu_ability` (
  `ability_id` int(11) unsigned NOT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ability_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wg_menu_ability
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
  `forbidden` tinyint(1) NOT NULL DEFAULT '0',
  `scope` int(11) DEFAULT NULL,
  KEY `permissions_entity_index` (`entity_id`,`entity_type`,`scope`),
  KEY `permissions_ability_id_index` (`ability_id`),
  KEY `permissions_scope_index` (`scope`),
  CONSTRAINT `permissions_ability_id_foreign` FOREIGN KEY (`ability_id`) REFERENCES `wg_abilities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_permissions
-- ----------------------------
INSERT INTO `wg_permissions` VALUES ('1', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('12', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('23', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('34', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('45', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('56', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('67', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('78', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('89', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('100', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('111', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('122', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('133', '1', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('2', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('13', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('24', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('35', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('46', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('57', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('68', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('79', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('90', '2', 'roles', '0', null);
INSERT INTO `wg_permissions` VALUES ('101', '2', 'roles', '0', null);

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
  `category_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `publisher_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '编辑ID',
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
  `class_id` int(11) unsigned NOT NULL DEFAULT '0',
  `school_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `intro` text,
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
  `uid` int(11) NOT NULL DEFAULT '0',
  `school_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `subject_id` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '学科ID',
  `intro` text,
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
  `score` int(11) NOT NULL DEFAULT '0',
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
