/*
Navicat MySQL Data Transfer

Source Server         : MaraDB
Source Server Version : 100214
Source Host           : localhost:3306
Source Database       : weiguang

Target Server Type    : MYSQL
Target Server Version : 100214
File Encoding         : 65001

Date: 2018-04-22 22:30:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wg_abilities
-- ----------------------------
DROP TABLE IF EXISTS `wg_abilities`;
CREATE TABLE `wg_abilities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '该权限的上级ID，用于对权限分组',
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `entity_id` int(10) unsigned DEFAULT NULL,
  `entity_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `only_owned` tinyint(1) NOT NULL DEFAULT 0,
  `scope` int(11) DEFAULT NULL,
  `icon` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '在菜单中显示的图标',
  `is_menu` char(0) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `abilities_scope_index` (`scope`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_abilities
-- ----------------------------
INSERT INTO `wg_abilities` VALUES ('1', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('2', '0', 'ability-list', '权限管理', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-21 17:56:00');
INSERT INTO `wg_abilities` VALUES ('3', '0', 'edit-ability', '编辑权限', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-21 18:02:03');
INSERT INTO `wg_abilities` VALUES ('4', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-21 18:00:44');
INSERT INTO `wg_abilities` VALUES ('5', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-21 17:47:28');
INSERT INTO `wg_abilities` VALUES ('6', '0', 'edit-role', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-21 18:01:38');
INSERT INTO `wg_abilities` VALUES ('7', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('8', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('9', '0', 'edit-user', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-21 18:02:23');
INSERT INTO `wg_abilities` VALUES ('10', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('11', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 18:03:05');
INSERT INTO `wg_abilities` VALUES ('12', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('13', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('14', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('15', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('16', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('17', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('18', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('19', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('20', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('21', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('22', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('23', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('24', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('25', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('26', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('27', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('28', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('29', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('30', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('31', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('32', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('33', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('34', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('35', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('36', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('37', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('38', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('39', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('40', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('41', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('42', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('43', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('44', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('45', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('46', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('47', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('48', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('49', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('50', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('51', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('52', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('53', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('54', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('55', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('56', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('57', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('58', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('59', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('60', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('61', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('62', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('63', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('64', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('65', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('66', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('67', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('68', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('69', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('70', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('71', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('72', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('73', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('74', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('75', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('76', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('77', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('78', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('79', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('80', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('81', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('82', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('83', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('84', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('85', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('86', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('87', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('88', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('89', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('90', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('91', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('92', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('93', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('94', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('95', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('96', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('97', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('98', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('99', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('100', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('101', '0', 'ability-list', '查看权限列表', null, null, '0', null, '', null, '2018-04-19 11:39:04', '2018-04-19 11:39:04');
INSERT INTO `wg_abilities` VALUES ('102', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('103', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('104', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('105', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('106', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('107', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('108', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('109', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('110', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('111', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('113', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('114', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('115', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('116', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('117', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('118', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('119', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('120', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('121', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('122', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('124', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('125', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('126', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('127', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');
INSERT INTO `wg_abilities` VALUES ('128', '0', 'create-user', '添加用户', null, null, '0', null, '', null, '2018-04-20 10:06:43', '2018-04-20 10:06:43');
INSERT INTO `wg_abilities` VALUES ('129', '0', 'user-list', '用户管理', null, null, '0', null, '', null, '2018-04-20 10:06:59', '2018-04-20 10:06:59');
INSERT INTO `wg_abilities` VALUES ('130', '0', 'user-edit', '编辑用户信息', null, null, '0', null, '', null, '2018-04-20 10:07:19', '2018-04-20 10:07:19');
INSERT INTO `wg_abilities` VALUES ('131', '0', 'user-forbid', '用户禁用', null, null, '0', null, '', null, '2018-04-21 13:25:16', '2018-04-21 13:25:16');
INSERT INTO `wg_abilities` VALUES ('132', '0', 'ability-remove', '删除权限', null, null, '0', null, '', null, '2018-04-21 13:26:02', '2018-04-21 13:26:02');
INSERT INTO `wg_abilities` VALUES ('133', '0', 'create-ability', '创建新的操作权限', null, null, '0', null, '', null, '2018-04-19 09:29:22', '2018-04-19 09:29:22');
INSERT INTO `wg_abilities` VALUES ('135', '0', 'ability-edit', '编辑权限信息', null, null, '0', null, '', null, '2018-04-19 11:40:32', '2018-04-19 11:40:32');
INSERT INTO `wg_abilities` VALUES ('136', '0', 'create-role', '创建用户角色', null, null, '0', null, '', null, '2018-04-20 09:59:03', '2018-04-20 09:59:03');
INSERT INTO `wg_abilities` VALUES ('137', '0', 'role-list', '角色管理页', null, null, '0', null, '', null, '2018-04-20 10:00:36', '2018-04-20 10:00:36');
INSERT INTO `wg_abilities` VALUES ('138', '0', 'role-edit', '编辑角色信息', null, null, '0', null, '', null, '2018-04-20 10:04:55', '2018-04-20 10:04:55');

-- ----------------------------
-- Table structure for wg_articles
-- ----------------------------
DROP TABLE IF EXISTS `wg_articles`;
CREATE TABLE `wg_articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `author` varchar(30) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图',
  `summary` text NOT NULL COMMENT '文章摘要',
  `views` int(10) unsigned NOT NULL,
  `comments` int(10) unsigned NOT NULL,
  `is_top` char(0) DEFAULT '' COMMENT '是否置顶  NULL|否',
  `is_hot` char(0) DEFAULT '' COMMENT '是否热门文章  NULL|否',
  `is_new` char(0) DEFAULT NULL COMMENT '是否最新文章 NULL|否',
  `category_id` tinyint(3) unsigned NOT NULL DEFAULT 0,
  `assoc_id` int(10) unsigned DEFAULT NULL COMMENT '作者的关联ID，一般为学生id',
  `publisher_id` int(11) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of wg_articles
-- ----------------------------
INSERT INTO `wg_articles` VALUES ('1', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, '1', '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('2', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '1', '', '', '', '1', null, '1', '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('3', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, '1', '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('4', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('5', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('6', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('7', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('8', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('9', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('10', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('11', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('12', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('13', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('14', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('15', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('16', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('17', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('18', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('19', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('20', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('21', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('22', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('23', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('24', '细小的春天', '小石', 'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1522254714601&di=b0a3976233696994b6776fb04b6273d0&imgtype=0&src=http%3A%2F%2Fuploads.oh100.com%2Fallimg%2F1712%2F198-1G226143122.jpg', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '0', '0', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);
INSERT INTO `wg_articles` VALUES ('25', '细小的春天', '小石', '', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。', '99', '15', '', '', '', '1', null, null, '2018-04-09 21:20:32', '2018-04-09 21:20:37', null);

-- ----------------------------
-- Table structure for wg_article_bodies
-- ----------------------------
DROP TABLE IF EXISTS `wg_article_bodies`;
CREATE TABLE `wg_article_bodies` (
  `aid` int(10) unsigned NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章正文'
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of wg_article_bodies
-- ----------------------------
INSERT INTO `wg_article_bodies` VALUES ('1', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('2', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('3', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('4', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('5', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('6', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('7', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('8', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('9', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('10', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('11', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('12', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('13', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('14', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('15', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('16', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('17', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('18', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('19', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('20', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('21', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('22', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('23', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');
INSERT INTO `wg_article_bodies` VALUES ('24', '春天是细小的嫩芽，是细小的花蕾，是细小的雨丝，是细小的虫鸣。');

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
  `abbreviation` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '简称',
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
  `phone` char(11) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(255) NOT NULL DEFAULT '',
  `class_id` int(11) unsigned NOT NULL DEFAULT 0,
  `school_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL DEFAULT '',
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
  `phone` char(11) NOT NULL DEFAULT '',
  `email` varchar(255) NOT NULL DEFAULT '',
  `qq` varchar(255) NOT NULL DEFAULT '',
  `class_ids` varchar(255) NOT NULL DEFAULT '0',
  `school_id` smallint(5) unsigned NOT NULL DEFAULT 0,
  `address` varchar(255) NOT NULL DEFAULT '',
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
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `real_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '真实姓名',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
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
INSERT INTO `wg_users` VALUES ('1', 'yanqinsc', '小石', 'http://weiguang/admin/adminlte/dist/img/user2-160x160.jpg', 'yanqinsc@qq.com', '$2y$10$hipe3dXnOMqEjPmHG2HV/uOHfumA0lD5lqpqyrGJ3oll2q4f7nnj2', '0', '0', '孜孜不倦，不紧不慢', 'XNZV5zgiwqpZpsWW7Qc6dJzsl56PyjStn0ZRudlFi74Gukw0FI7yYq7mEGia', '2018-04-16 23:49:09', '2018-04-16 23:49:09', null);
