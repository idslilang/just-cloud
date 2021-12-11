/*
 Navicat Premium Data Transfer

 Source Server         : eladmin
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : just

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 11/12/2021 15:53:49
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `del_flag` char(1) DEFAULT '0' COMMENT '是否删除  -1：已删除  0：正常',
  `parent_id` int(11) DEFAULT NULL COMMENT '父节点',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (1, '总经办', 0, '0', 0, '2020-03-13 13:13:16', NULL, '2020-03-13 13:14:31', NULL);
INSERT INTO `sys_dept` VALUES (2, '行政中心', 1, '0', 1, '2020-03-13 13:13:30', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (3, '技术中心', 2, '0', 1, '2020-03-13 13:14:55', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (4, '运营中心', 3, '0', 1, '2020-03-13 13:15:15', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (5, '研发中心', 5, '0', 3, '2020-03-13 13:15:34', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (6, '产品中心', 6, '0', 3, '2020-03-13 13:15:49', NULL, NULL, NULL);
INSERT INTO `sys_dept` VALUES (7, '测试中心', 7, '0', 3, '2020-03-13 13:16:02', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dept_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_relation`;
CREATE TABLE `sys_dept_relation` (
  `ancestor` int(11) NOT NULL COMMENT '祖先节点',
  `descendant` int(11) NOT NULL COMMENT '后代节点',
  PRIMARY KEY (`ancestor`,`descendant`),
  KEY `idx1` (`ancestor`),
  KEY `idx2` (`descendant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='部门关系表';

-- ----------------------------
-- Records of sys_dept_relation
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept_relation` VALUES (1, 1);
INSERT INTO `sys_dept_relation` VALUES (1, 2);
INSERT INTO `sys_dept_relation` VALUES (1, 3);
INSERT INTO `sys_dept_relation` VALUES (1, 4);
INSERT INTO `sys_dept_relation` VALUES (1, 5);
INSERT INTO `sys_dept_relation` VALUES (1, 6);
INSERT INTO `sys_dept_relation` VALUES (1, 7);
INSERT INTO `sys_dept_relation` VALUES (2, 2);
INSERT INTO `sys_dept_relation` VALUES (3, 3);
INSERT INTO `sys_dept_relation` VALUES (3, 5);
INSERT INTO `sys_dept_relation` VALUES (3, 6);
INSERT INTO `sys_dept_relation` VALUES (3, 7);
INSERT INTO `sys_dept_relation` VALUES (4, 4);
INSERT INTO `sys_dept_relation` VALUES (5, 5);
INSERT INTO `sys_dept_relation` VALUES (6, 6);
INSERT INTO `sys_dept_relation` VALUES (7, 7);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` varchar(100) DEFAULT NULL COMMENT '类型',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `system` char(1) DEFAULT '0' COMMENT '是否是系统内置',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict` VALUES (1, 'dict_type', '字典类型', '系统类不能修改', '1', '0', '2019-05-16 14:16:20', NULL, NULL, '2019-05-16 14:20:16');
INSERT INTO `sys_dict` VALUES (2, 'log_type', '日志类型', '0-正常 1 异常', '1', '0', '2020-03-13 14:21:01', NULL, NULL, '2020-03-13 14:21:01');
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_item`;
CREATE TABLE `sys_dict_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `dict_id` int(11) NOT NULL COMMENT '字典ID',
  `value` varchar(100) DEFAULT NULL COMMENT '值',
  `label` varchar(100) DEFAULT NULL COMMENT '标签',
  `type` varchar(100) DEFAULT NULL COMMENT '字典类型',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序（升序）',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sys_dict_value` (`value`) USING BTREE,
  KEY `sys_dict_label` (`label`) USING BTREE,
  KEY `sys_dict_del_flag` (`del_flag`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='字典项';

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_item` VALUES (1, 1, '1', '系统类', 'dict_type', '系统类字典', 0, '不能修改删除', '0', '2019-05-16 14:20:40', NULL, NULL, '2019-05-16 14:20:40');
INSERT INTO `sys_dict_item` VALUES (2, 1, '0', '业务类', 'dict_type', '业务类字典', 0, '可以修改', '0', '2019-05-16 14:20:59', NULL, NULL, '2019-05-16 14:20:59');
INSERT INTO `sys_dict_item` VALUES (3, 2, '0', '正常', 'log_type', '正常', 0, '正常', '0', '2020-03-13 14:23:22', NULL, NULL, '2020-03-13 14:23:22');
INSERT INTO `sys_dict_item` VALUES (4, 2, '9', '异常', 'log_type', '异常', 1, '异常', '0', '2020-03-13 14:23:35', NULL, NULL, '2020-03-13 14:23:35');
COMMIT;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `service_id` varchar(32) DEFAULT NULL COMMENT '服务ID',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(1000) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(10) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `time` mediumtext COMMENT '执行时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标记',
  `exception` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_log` VALUES (1, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B48281631327700406%5D&code=%5B3%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-11 10:35:32', '2021-09-11 10:35:32', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (2, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B58161631334406166%5D&code=%5B4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-11 12:26:54', '2021-09-11 12:26:54', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (3, '0', '登录成功', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B74461631425368775%5D&code=%5B4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-12 13:43:17', '2021-09-12 13:43:17', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (4, '0', '登录成功', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B73581631425391537%5D&code=%5B4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-12 13:43:17', '2021-09-12 13:43:17', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (5, '0', '更新菜单', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/menu', 'PUT', '', '73', '0', NULL, '2021-09-12 13:44:20', '2021-09-12 13:44:20', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (6, '0', '更新角色菜单', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/role/menu', 'PUT', '', '275', '0', NULL, '2021-09-12 13:45:23', '2021-09-12 13:45:23', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (7, '0', '更新角色菜单', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/role/menu', 'PUT', '', '253', '0', NULL, '2021-09-12 13:45:43', '2021-09-12 13:45:43', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (8, '0', '更新角色菜单', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/role/menu', 'PUT', '', '232', '0', NULL, '2021-09-12 13:46:01', '2021-09-12 13:46:01', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (9, '0', '更新角色菜单', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/role/menu', 'PUT', '', '242', '0', NULL, '2021-09-12 13:46:45', '2021-09-12 13:46:45', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (10, '0', '更新用户信息', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/user', 'PUT', '', '88', '0', NULL, '2021-09-12 13:46:54', '2021-09-12 13:46:54', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (11, '0', '更新角色菜单', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/role/menu', 'PUT', '', '355', '0', NULL, '2021-09-12 13:47:12', '2021-09-12 13:47:12', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (12, '0', '更新角色菜单', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/role/menu', 'PUT', '', '232', '0', NULL, '2021-09-12 13:47:58', '2021-09-12 13:47:58', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (13, '0', '添加用户', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/user', 'POST', '', '193', '0', NULL, '2021-09-12 13:48:22', '2021-09-12 13:48:22', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (14, '0', '更新角色菜单', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/role/menu', 'PUT', '', '206', '0', NULL, '2021-09-12 13:48:42', '2021-09-12 13:48:42', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (15, '0', '退出成功', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/token/logout', 'DELETE', NULL, '0', '0', NULL, '2021-09-12 13:49:04', '2021-09-12 13:49:04', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (16, '0', '登录成功', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B96721631425743693%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-12 13:49:08', '2021-09-12 13:49:08', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (17, '0', '登录成功', 'pig', '192.168.1.102', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.159 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B36351631425790927%5D&code=%5B7%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-12 13:49:54', '2021-09-12 13:49:54', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (18, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:32:08', '2021-09-19 11:32:08', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (19, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:40:19', '2021-09-19 11:40:19', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (20, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:40:48', '2021-09-19 11:40:48', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (21, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:40:49', '2021-09-19 11:40:49', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (22, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:40:50', '2021-09-19 11:40:50', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (23, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:40:51', '2021-09-19 11:40:51', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (24, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:41:18', '2021-09-19 11:41:18', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (25, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:42:33', '2021-09-19 11:42:33', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (26, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:45:09', '2021-09-19 11:45:09', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (27, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:49:15', '2021-09-19 11:49:15', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (28, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:51:40', '2021-09-19 11:51:40', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (29, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:57:13', '2021-09-19 11:57:13', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (30, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 11:59:23', '2021-09-19 11:59:23', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (31, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 12:04:51', '2021-09-19 12:04:51', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (32, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 13:15:56', '2021-09-19 13:15:56', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (33, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 13:50:42', '2021-09-19 13:50:42', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (34, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-19 13:56:33', '2021-09-19 13:56:33', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (35, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B64271632103844713%5D&code=%5B0%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 10:11:13', '2021-09-20 10:11:13', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (36, '0', '退出成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/token/logout', 'DELETE', NULL, '0', '0', NULL, '2021-09-20 10:18:13', '2021-09-20 10:18:13', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (37, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B31641632104292922%5D&code=%5B-2%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 10:18:29', '2021-09-20 10:18:29', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (38, '0', '退出成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/token/logout', 'DELETE', NULL, '0', '0', NULL, '2021-09-20 10:19:47', '2021-09-20 10:19:47', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (39, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B73791632104387282%5D&code=%5B6%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 10:19:53', '2021-09-20 10:19:53', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (40, '0', '退出成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/token/logout', 'DELETE', NULL, '0', '0', NULL, '2021-09-20 10:47:36', '2021-09-20 10:47:36', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (41, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B93221632106056348%5D&code=%5B49%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 10:55:10', '2021-09-20 10:55:10', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (42, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B35371632106613518%5D&code=%5B14%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 10:57:11', '2021-09-20 10:57:11', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (43, '0', '退出成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/token/logout', 'DELETE', NULL, '0', '0', NULL, '2021-09-20 10:57:17', '2021-09-20 10:57:17', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (44, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B24841632106670313%5D&code=%5B6%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 10:59:59', '2021-09-20 10:59:59', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (45, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B45881632106806382%5D&code=%5B-6%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 11:03:39', '2021-09-20 11:03:39', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (46, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B41911632107026644%5D&code=%5B14%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 11:05:48', '2021-09-20 11:05:48', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (47, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B24411632107152283%5D&code=%5B7%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 11:05:57', '2021-09-20 11:05:57', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (48, '0', '退出成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/token/logout', 'DELETE', NULL, '0', '0', NULL, '2021-09-20 11:06:13', '2021-09-20 11:06:13', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (49, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B57331632107175570%5D&code=%5B7%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 11:12:46', '2021-09-20 11:12:46', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (50, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B78711632107570166%5D&code=%5B27%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 11:12:56', '2021-09-20 11:12:56', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (51, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B36311632113339849%5D&code=%5B16%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 12:49:59', '2021-09-20 12:49:59', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (52, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B10941632113494734%5D&code=%5B10%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 12:55:52', '2021-09-20 12:55:52', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (53, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B31601632113759843%5D&code=%5B7%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 12:56:13', '2021-09-20 12:56:13', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (54, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B32701632113854438%5D&code=%5B1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 12:59:21', '2021-09-20 12:59:21', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (55, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B74331632113967984%5D&code=%5B7%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:18:13', '2021-09-20 13:18:13', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (56, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B72601632115438574%5D&code=%5B4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:24:23', '2021-09-20 13:24:23', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (57, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B92461632116789135%5D&code=%5B15%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:51:40', '2021-09-20 13:51:40', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (58, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B34271632117103513%5D&code=%5B4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:51:49', '2021-09-20 13:51:49', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (59, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B57141632117124467%5D&code=%5B30%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:52:08', '2021-09-20 13:52:08', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (60, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B28351632117178525%5D&code=%5B20%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:53:03', '2021-09-20 13:53:03', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (61, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B14031632117195089%5D&code=%5B6%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:53:18', '2021-09-20 13:53:18', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (62, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B67121632117261056%5D&code=%5B4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:54:27', '2021-09-20 13:54:27', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (63, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B77631632117265427%5D&code=%5B11%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-20 13:54:29', '2021-09-20 13:54:29', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (64, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B14481632192966865%5D&code=%5B-5%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:00:27', '2021-09-21 11:00:27', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (65, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B11631632193124604%5D&code=%5B16%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:00:27', '2021-09-21 11:00:27', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (66, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B62671632193220905%5D&code=%5B5%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:02:08', '2021-09-21 11:02:08', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (67, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B58431632193614120%5D&code=%5B16%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:27:56', '2021-09-21 11:27:56', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (68, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B53801632194860742%5D&code=%5B-1%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:28:01', '2021-09-21 11:28:01', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (69, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B71211632194882715%5D&code=%5B9%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:28:06', '2021-09-21 11:28:06', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (70, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:48:20', '2021-09-21 11:48:20', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (71, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:48:24', '2021-09-21 11:48:24', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (72, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:48:59', '2021-09-21 11:48:59', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (73, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:00', '2021-09-21 11:49:00', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (74, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:00', '2021-09-21 11:49:00', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (75, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:01', '2021-09-21 11:49:01', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (76, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:01', '2021-09-21 11:49:01', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (77, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:02', '2021-09-21 11:49:02', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (78, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:04', '2021-09-21 11:49:04', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (79, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:05', '2021-09-21 11:49:05', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (80, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:05', '2021-09-21 11:49:05', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (81, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:06', '2021-09-21 11:49:06', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (82, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-21 11:49:07', '2021-09-21 11:49:07', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (83, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-25 17:57:24', '2021-09-25 17:57:24', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (84, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 22:53:49', '2021-09-26 22:53:49', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (85, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 22:54:01', '2021-09-26 22:54:01', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (86, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 22:59:27', '2021-09-26 22:59:27', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (87, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 22:59:53', '2021-09-26 22:59:53', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (88, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:00:18', '2021-09-26 23:00:18', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (89, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:00:32', '2021-09-26 23:00:32', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (90, '9', '登录失败', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', '用户名或密码错误', '2021-09-26 23:14:14', '2021-09-26 23:14:14', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (91, '9', '登录失败', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '1', '0', '用户名或密码错误', '2021-09-26 23:14:14', '2021-09-26 23:14:14', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (92, '9', '登录失败', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', '用户名或密码错误', '2021-09-26 23:19:20', '2021-09-26 23:19:20', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (93, '9', '登录失败', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', '用户名或密码错误', '2021-09-26 23:19:44', '2021-09-26 23:19:44', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (94, '0', '登录成功', 'test', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:19:59', '2021-09-26 23:19:59', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (95, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:21:08', '2021-09-26 23:21:08', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (96, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:21:21', '2021-09-26 23:21:21', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (97, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:21:28', '2021-09-26 23:21:28', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (98, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:22:30', '2021-09-26 23:22:30', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (99, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:22:52', '2021-09-26 23:22:52', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (100, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B77091632670965084%5D&code=%5B12%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:43:25', '2021-09-26 23:43:25', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (101, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B18891632671003264%5D&code=%5B-3%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:43:29', '2021-09-26 23:43:29', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (102, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B18891632671003264%5D&code=%5B-3%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:43:31', '2021-09-26 23:43:31', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (103, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:51:02', '2021-09-26 23:51:02', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (104, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:54:45', '2021-09-26 23:54:45', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (105, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-26 23:55:42', '2021-09-26 23:55:42', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (106, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:20:10', '2021-09-27 00:20:10', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (107, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:23:02', '2021-09-27 00:23:02', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (108, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B88031632673610419%5D&code=%5B-4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:26:56', '2021-09-27 00:26:56', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (109, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:28:24', '2021-09-27 00:28:24', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (110, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:28:27', '2021-09-27 00:28:27', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (111, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:28:29', '2021-09-27 00:28:29', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (112, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:28:49', '2021-09-27 00:28:49', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (113, '0', '编辑终端', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/client', 'PUT', '', '288', '0', NULL, '2021-09-27 00:30:43', '2021-09-27 00:30:43', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (114, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:44:12', '2021-09-27 00:44:12', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (115, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:44:20', '2021-09-27 00:44:20', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (116, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:44:27', '2021-09-27 00:44:27', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (117, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:47:29', '2021-09-27 00:47:29', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (118, '9', '登录失败', NULL, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', 'Bad credentials', '2021-09-27 00:52:05', '2021-09-27 00:52:05', 'user', 'user');
INSERT INTO `sys_log` VALUES (119, '9', '登录失败', NULL, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5Bpig%5D&username=%5Bpig%5D', '0', '0', 'Bad credentials', '2021-09-27 00:52:11', '2021-09-27 00:52:11', 'user', 'user');
INSERT INTO `sys_log` VALUES (120, '9', '登录失败', NULL, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', 'Bad credentials', '2021-09-27 00:52:32', '2021-09-27 00:52:32', 'user', 'user');
INSERT INTO `sys_log` VALUES (121, '9', '登录失败', NULL, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', 'Bad credentials', '2021-09-27 00:53:01', '2021-09-27 00:53:01', 'user', 'user');
INSERT INTO `sys_log` VALUES (122, '9', '登录失败', NULL, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', 'Bad credentials', '2021-09-27 00:53:41', '2021-09-27 00:53:41', 'user', 'user');
INSERT INTO `sys_log` VALUES (123, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:57:26', '2021-09-27 00:57:26', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (124, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 00:57:51', '2021-09-27 00:57:51', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (125, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B96911632675705467%5D&code=%5B0%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 01:01:52', '2021-09-27 01:01:52', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (126, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B96911632675705467%5D&code=%5B0%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 01:01:53', '2021-09-27 01:01:53', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (127, '0', '登录成功', NULL, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '/token/form', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 01:39:21', '2021-09-27 01:39:21', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (128, '0', '登录成功', NULL, '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/token/form', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 01:40:03', '2021-09-27 01:40:03', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (129, '0', '登录成功', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/token/form', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 01:44:48', '2021-09-27 01:44:48', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (130, '0', '登录成功', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 01:47:13', '2021-09-27 01:47:13', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (131, '0', '登录成功', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 01:55:42', '2021-09-27 01:55:42', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (132, '0', '登录成功', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 02:04:10', '2021-09-27 02:04:10', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (133, '0', '登录成功', NULL, '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 02:09:53', '2021-09-27 02:09:53', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (134, '0', '登录成功', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 02:11:01', '2021-09-27 02:11:01', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (135, '0', '登录成功', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 02:21:16', '2021-09-27 02:21:16', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (136, '0', '登录成功', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 02:44:25', '2021-09-27 02:44:25', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (137, '0', '登录成功', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.0 Safari/605.1.15', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 02:47:48', '2021-09-27 02:47:48', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (138, '0', '登录成功', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/login', 'POST', 'password=%5B123456%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 02:49:41', '2021-09-27 02:49:41', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (139, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B26921632757208530%5D&code=%5B40%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 23:40:23', '2021-09-27 23:40:23', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (140, '0', '登录成功', 'pig', '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.63 Safari/537.36', '/oauth/token', 'POST', 'password=%5B123456%5D&randomStr=%5B43101632757796779%5D&code=%5B-4%5D&grant_type=%5Bpassword%5D&scope=%5Bserver%5D&username=%5Badmin%5D', '0', '0', NULL, '2021-09-27 23:50:34', '2021-09-27 23:50:34', 'admin', 'admin');
INSERT INTO `sys_log` VALUES (141, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/95.0.4638.69 Safari/537.36', '/menu/2500', 'DELETE', '', '808', '0', NULL, '2021-11-14 18:46:57', '2021-11-14 18:46:57', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (142, '9', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3000', 'DELETE', '', '389', '0', '菜单含有下级不能删除', '2021-12-11 15:49:36', '2021-12-11 15:49:36', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (143, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3400', 'DELETE', '', '426', '0', NULL, '2021-12-11 15:49:40', '2021-12-11 15:49:40', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (144, '9', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3300', 'DELETE', '', '31', '0', '菜单含有下级不能删除', '2021-12-11 15:49:47', '2021-12-11 15:49:47', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (145, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3303', 'DELETE', '', '47', '0', NULL, '2021-12-11 15:49:51', '2021-12-11 15:49:51', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (146, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3302', 'DELETE', '', '65', '0', NULL, '2021-12-11 15:49:53', '2021-12-11 15:49:53', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (147, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3301', 'DELETE', '', '49', '0', NULL, '2021-12-11 15:49:56', '2021-12-11 15:49:56', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (148, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3300', 'DELETE', '', '73', '0', NULL, '2021-12-11 15:49:57', '2021-12-11 15:49:57', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (149, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3200', 'DELETE', '', '68', '0', NULL, '2021-12-11 15:49:59', '2021-12-11 15:49:59', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (150, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3100', 'DELETE', '', '53', '0', NULL, '2021-12-11 15:50:02', '2021-12-11 15:50:02', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (151, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/3000', 'DELETE', '', '64', '0', NULL, '2021-12-11 15:50:07', '2021-12-11 15:50:07', 'nihao ', 'nihao ');
INSERT INTO `sys_log` VALUES (152, '0', '删除菜单', NULL, '127.0.0.1', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.45 Safari/537.36', '/menu/9999', 'DELETE', '', '79', '0', NULL, '2021-12-11 15:50:11', '2021-12-11 15:50:11', 'nihao ', 'nihao ');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `name` varchar(32) NOT NULL COMMENT '菜单名称',
  `permission` varchar(32) DEFAULT NULL COMMENT '菜单权限标识',
  `path` varchar(128) DEFAULT NULL COMMENT '前端URL',
  `parent_id` int(11) DEFAULT NULL COMMENT '父菜单ID',
  `icon` varchar(32) DEFAULT NULL COMMENT '图标',
  `component` varchar(64) DEFAULT NULL COMMENT 'VUE页面',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序值',
  `keep_alive` char(1) DEFAULT '0' COMMENT '0-开启，1- 关闭',
  `type` char(1) DEFAULT NULL COMMENT '菜单类型 （0菜单 1按钮）',
  `del_flag` char(1) DEFAULT '0' COMMENT '逻辑删除标记(0--正常 1--删除)',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '修改人',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10000 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1000, '权限管理', NULL, '/admin', -1, 'icon-quanxianguanli', NULL, 0, '0', '0', '0', NULL, '2018-09-28 08:29:53', NULL, '2020-03-11 23:58:18');
INSERT INTO `sys_menu` VALUES (1100, '用户管理', NULL, '/admin/user/index', 1000, 'icon-yonghuguanli', NULL, 1, '0', '0', '0', NULL, '2017-11-02 22:24:37', NULL, '2020-03-12 00:12:57');
INSERT INTO `sys_menu` VALUES (1101, '用户新增', 'sys_user_add', NULL, 1100, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 09:52:09', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1102, '用户修改', 'sys_user_edit', NULL, 1100, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 09:52:48', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1103, '用户删除', 'sys_user_del', NULL, 1100, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 09:54:01', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1104, '导入导出', 'sys_user_import_export', NULL, 1100, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 09:54:01', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1200, '菜单管理', NULL, '/admin/menu/index', 1000, 'icon-caidanguanli', NULL, 2, '0', '0', '0', NULL, '2017-11-08 09:57:27', NULL, '2020-03-12 00:13:52');
INSERT INTO `sys_menu` VALUES (1201, '菜单新增', 'sys_menu_add', NULL, 1200, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 10:15:53', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1202, '菜单修改', 'sys_menu_edit', NULL, 1200, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 10:16:23', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1203, '菜单删除', 'sys_menu_del', NULL, 1200, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 10:16:43', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1300, '角色管理', NULL, '/admin/role/index', 1000, 'icon-jiaoseguanli', NULL, 3, '0', '0', '0', NULL, '2017-11-08 10:13:37', NULL, '2020-03-12 00:15:40');
INSERT INTO `sys_menu` VALUES (1301, '角色新增', 'sys_role_add', NULL, 1300, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 10:14:18', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1302, '角色修改', 'sys_role_edit', NULL, 1300, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 10:14:41', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1303, '角色删除', 'sys_role_del', NULL, 1300, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 10:14:59', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1304, '分配权限', 'sys_role_perm', NULL, 1300, NULL, NULL, 1, '0', '1', '0', NULL, '2018-04-20 07:22:55', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1400, '部门管理', NULL, '/admin/dept/index', 1000, 'icon-web-icon-', NULL, 4, '0', '0', '0', NULL, '2018-01-20 13:17:19', NULL, '2020-03-12 00:15:44');
INSERT INTO `sys_menu` VALUES (1401, '部门新增', 'sys_dept_add', NULL, 1400, NULL, NULL, 1, '0', '1', '0', NULL, '2018-01-20 14:56:16', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1402, '部门修改', 'sys_dept_edit', NULL, 1400, NULL, NULL, 1, '0', '1', '0', NULL, '2018-01-20 14:56:59', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (1403, '部门删除', 'sys_dept_del', NULL, 1400, NULL, NULL, 1, '0', '1', '0', NULL, '2018-01-20 14:57:28', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (2000, '系统管理', NULL, '/setting', -1, 'icon-xitongguanli', NULL, 1, '0', '0', '0', NULL, '2017-11-07 20:56:00', NULL, '2020-03-11 23:52:53');
INSERT INTO `sys_menu` VALUES (2100, '日志管理', NULL, '/admin/log/index', 2000, 'icon-rizhiguanli', NULL, 5, '0', '0', '0', NULL, '2017-11-20 14:06:22', NULL, '2020-03-12 00:15:49');
INSERT INTO `sys_menu` VALUES (2101, '日志删除', 'sys_log_del', NULL, 2100, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-20 20:37:37', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (2102, '导入导出', 'sys_log_import_export', NULL, 2100, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-08 09:54:01', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (2200, '字典管理', NULL, '/admin/dict/index', 2000, 'icon-navicon-zdgl', NULL, 6, '0', '0', '0', NULL, '2017-11-29 11:30:52', NULL, '2020-03-12 00:15:58');
INSERT INTO `sys_menu` VALUES (2201, '字典删除', 'sys_dict_del', NULL, 2200, NULL, NULL, 1, '0', '1', '0', NULL, '2017-11-29 11:30:11', 'admin', '2021-09-12 13:44:19');
INSERT INTO `sys_menu` VALUES (2202, '字典新增', 'sys_dict_add', NULL, 2200, NULL, NULL, 1, '0', '1', '0', NULL, '2018-05-11 22:34:55', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (2203, '字典修改', 'sys_dict_edit', NULL, 2200, NULL, NULL, 1, '0', '1', '0', NULL, '2018-05-11 22:36:03', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (2300, '令牌管理', NULL, '/admin/token/index', 2000, 'icon-denglvlingpai', NULL, 11, '0', '0', '0', NULL, '2018-09-04 05:58:41', NULL, '2020-03-13 12:57:25');
INSERT INTO `sys_menu` VALUES (2301, '令牌删除', 'sys_token_del', NULL, 2300, NULL, NULL, 1, '0', '1', '0', NULL, '2018-09-04 05:59:50', NULL, '2020-03-13 12:57:34');
INSERT INTO `sys_menu` VALUES (2400, '终端管理', '', '/admin/client/index', 2000, 'icon-shouji', NULL, 9, '0', '0', '0', NULL, '2018-01-20 13:17:19', NULL, '2020-03-12 00:15:54');
INSERT INTO `sys_menu` VALUES (2401, '客户端新增', 'sys_client_add', NULL, 2400, '1', NULL, 1, '0', '1', '0', NULL, '2018-05-15 21:35:18', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (2402, '客户端修改', 'sys_client_edit', NULL, 2400, NULL, NULL, 1, '0', '1', '0', NULL, '2018-05-15 21:37:06', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (2403, '客户端删除', 'sys_client_del', NULL, 2400, NULL, NULL, 1, '0', '1', '0', NULL, '2018-05-15 21:39:16', NULL, '2021-05-25 06:48:34');
INSERT INTO `sys_menu` VALUES (2500, '服务监控', NULL, 'http://localhost:5001', 2000, 'icon-server', NULL, 10, '0', '0', '1', NULL, '2018-06-26 10:50:32', NULL, '2019-02-01 20:41:30');
INSERT INTO `sys_menu` VALUES (3000, '开发平台', NULL, '/gen', -1, 'icon-shejiyukaifa-', NULL, 3, '1', '0', '1', NULL, '2020-03-11 22:15:40', NULL, '2020-03-11 23:52:54');
INSERT INTO `sys_menu` VALUES (3100, '数据源管理', NULL, '/gen/datasource', 3000, 'icon-mysql', NULL, 1, '1', '0', '1', NULL, '2020-03-11 22:17:05', NULL, '2020-03-12 00:16:09');
INSERT INTO `sys_menu` VALUES (3200, '代码生成', NULL, '/gen/index', 3000, 'icon-weibiaoti46', NULL, 2, '0', '0', '1', NULL, '2020-03-11 22:23:42', NULL, '2020-03-12 00:16:14');
INSERT INTO `sys_menu` VALUES (3300, '表单管理', NULL, '/gen/form', 3000, 'icon-record', NULL, 3, '1', '0', '1', NULL, '2020-03-11 22:19:32', NULL, '2020-03-12 00:16:18');
INSERT INTO `sys_menu` VALUES (3301, '表单新增', 'gen_form_add', NULL, 3300, '', NULL, 0, '0', '1', '1', NULL, '2018-05-15 21:35:18', NULL, '2020-03-11 22:39:08');
INSERT INTO `sys_menu` VALUES (3302, '表单修改', 'gen_form_edit', NULL, 3300, '', NULL, 1, '0', '1', '1', NULL, '2018-05-15 21:35:18', NULL, '2020-03-11 22:39:09');
INSERT INTO `sys_menu` VALUES (3303, '表单删除', 'gen_form_del', NULL, 3300, '', NULL, 2, '0', '1', '1', NULL, '2018-05-15 21:35:18', NULL, '2020-03-11 22:39:11');
INSERT INTO `sys_menu` VALUES (3400, '表单设计', NULL, '/gen/design', 3000, 'icon-biaodanbiaoqian', NULL, 4, '1', '0', '1', NULL, '2020-03-11 22:18:05', NULL, '2020-03-12 00:16:25');
INSERT INTO `sys_menu` VALUES (9999, '系统官网', NULL, 'https://just4cloud.com/#/', -1, 'icon-guanwangfangwen', NULL, 9, '0', '0', '1', NULL, '2019-01-17 17:05:19', 'admin', '2020-03-11 23:52:57');
COMMIT;

-- ----------------------------
-- Table structure for sys_oauth_client_details
-- ----------------------------
DROP TABLE IF EXISTS `sys_oauth_client_details`;
CREATE TABLE `sys_oauth_client_details` (
  `client_id` varchar(32) NOT NULL COMMENT '客户端ID',
  `resource_ids` varchar(256) DEFAULT NULL COMMENT '资源列表',
  `client_secret` varchar(256) DEFAULT NULL COMMENT '客户端密钥',
  `scope` varchar(256) DEFAULT NULL COMMENT '域',
  `authorized_grant_types` varchar(256) DEFAULT NULL COMMENT '认证类型',
  `web_server_redirect_uri` varchar(256) DEFAULT NULL COMMENT '重定向地址',
  `authorities` varchar(256) DEFAULT NULL COMMENT '角色列表',
  `access_token_validity` int(11) DEFAULT NULL COMMENT 'token 有效期',
  `refresh_token_validity` int(11) DEFAULT NULL COMMENT '刷新令牌有效期',
  `additional_information` varchar(4096) DEFAULT NULL COMMENT '令牌扩展字段JSON',
  `autoapprove` varchar(256) DEFAULT NULL COMMENT '是否自动放行',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='终端信息表';

-- ----------------------------
-- Records of sys_oauth_client_details
-- ----------------------------
BEGIN;
INSERT INTO `sys_oauth_client_details` VALUES ('app', NULL, 'app', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('daemon', NULL, 'daemon', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('gen', NULL, 'gen', 'server', 'password,refresh_token', NULL, NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('pig', NULL, 'pig', 'server', 'password,refresh_token,authorization_code,client_credentials', 'https://www.baidu.com/', NULL, NULL, NULL, NULL, 'true', NULL, NULL, NULL, NULL);
INSERT INTO `sys_oauth_client_details` VALUES ('test', NULL, 'test', 'server', 'password,refresh_token, client_credentials', NULL, NULL, NULL, NULL, NULL, 'true', NULL, '2021-09-27 00:30:41', NULL, 'admin');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(64) NOT NULL,
  `role_code` varchar(64) NOT NULL,
  `role_desc` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标识（0-正常,1-删除）',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '修改人',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_idx1_role_code` (`role_code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', 'ROLE_ADMIN', '管理员', '0', '2017-10-29 15:45:51', '2018-12-26 14:09:11', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='角色菜单表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (1, 1000);
INSERT INTO `sys_role_menu` VALUES (1, 1100);
INSERT INTO `sys_role_menu` VALUES (1, 1101);
INSERT INTO `sys_role_menu` VALUES (1, 1102);
INSERT INTO `sys_role_menu` VALUES (1, 1103);
INSERT INTO `sys_role_menu` VALUES (1, 1104);
INSERT INTO `sys_role_menu` VALUES (1, 1200);
INSERT INTO `sys_role_menu` VALUES (1, 1201);
INSERT INTO `sys_role_menu` VALUES (1, 1202);
INSERT INTO `sys_role_menu` VALUES (1, 1203);
INSERT INTO `sys_role_menu` VALUES (1, 1300);
INSERT INTO `sys_role_menu` VALUES (1, 1301);
INSERT INTO `sys_role_menu` VALUES (1, 1302);
INSERT INTO `sys_role_menu` VALUES (1, 1303);
INSERT INTO `sys_role_menu` VALUES (1, 1304);
INSERT INTO `sys_role_menu` VALUES (1, 1400);
INSERT INTO `sys_role_menu` VALUES (1, 1401);
INSERT INTO `sys_role_menu` VALUES (1, 1402);
INSERT INTO `sys_role_menu` VALUES (1, 1403);
INSERT INTO `sys_role_menu` VALUES (1, 2000);
INSERT INTO `sys_role_menu` VALUES (1, 2100);
INSERT INTO `sys_role_menu` VALUES (1, 2101);
INSERT INTO `sys_role_menu` VALUES (1, 2102);
INSERT INTO `sys_role_menu` VALUES (1, 2200);
INSERT INTO `sys_role_menu` VALUES (1, 2201);
INSERT INTO `sys_role_menu` VALUES (1, 2202);
INSERT INTO `sys_role_menu` VALUES (1, 2203);
INSERT INTO `sys_role_menu` VALUES (1, 2300);
INSERT INTO `sys_role_menu` VALUES (1, 2301);
INSERT INTO `sys_role_menu` VALUES (1, 2400);
INSERT INTO `sys_role_menu` VALUES (1, 2401);
INSERT INTO `sys_role_menu` VALUES (1, 2402);
INSERT INTO `sys_role_menu` VALUES (1, 2403);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(64) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `salt` varchar(255) DEFAULT NULL COMMENT '随机盐',
  `phone` varchar(20) DEFAULT NULL COMMENT '简介',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `lock_flag` char(1) DEFAULT '0' COMMENT '0-正常，9-锁定',
  `del_flag` char(1) DEFAULT '0' COMMENT '0-正常，1-删除',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新人',
  PRIMARY KEY (`user_id`),
  KEY `user_idx1_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', NULL, '17034642999', '', 1, '0', '0', '2018-04-20 07:15:18', '2021-09-12 13:46:54', NULL, 'admin');
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户角色表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (7, 1);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
