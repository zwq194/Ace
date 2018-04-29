/*
Navicat MySQL Data Transfer

Source Server         : mysql-Chloe
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : chloe

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-04-29 11:01:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` varchar(50) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `IP` varchar(50) DEFAULT NULL,
  `IPAddress` varchar(50) DEFAULT NULL,
  `ModuleId` varchar(50) DEFAULT NULL,
  `ModuleName` varchar(50) DEFAULT NULL,
  `Result` bit(1) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `CreationTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_org
-- ----------------------------
DROP TABLE IF EXISTS `sys_org`;
CREATE TABLE `sys_org` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `OrgType` int(11) DEFAULT NULL,
  `ManagerId` varchar(50) DEFAULT NULL,
  `ParentId` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `CreationTime` datetime NOT NULL,
  `IsDeleted` int(11) NOT NULL,
  `DeletionTime` datetime DEFAULT NULL,
  `DeleteUserId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_org
-- ----------------------------
INSERT INTO `sys_org` VALUES ('975257850106482688', 'Chloe', '1', null, null, null, '2018-03-18 14:29:00', '0', null, null);
INSERT INTO `sys_org` VALUES ('975258020424585216', '开发部', '2', null, '975257850106482688', null, '2018-03-18 14:30:00', '0', null, null);
INSERT INTO `sys_org` VALUES ('975258520352067584', '产品部', '2', null, '975257850106482688', null, '2018-03-18 14:32:00', '0', null, null);

-- ----------------------------
-- Table structure for sys_orgpermission
-- ----------------------------
DROP TABLE IF EXISTS `sys_orgpermission`;
CREATE TABLE `sys_orgpermission` (
  `Id` varchar(50) NOT NULL,
  `OrgId` varchar(50) NOT NULL,
  `PermissionId` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_orgpermission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_orgtype
-- ----------------------------
DROP TABLE IF EXISTS `sys_orgtype`;
CREATE TABLE `sys_orgtype` (
  `Id` int(11) NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `ParentId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_orgtype
-- ----------------------------
INSERT INTO `sys_orgtype` VALUES ('1', '公司', null);
INSERT INTO `sys_orgtype` VALUES ('2', '部门', '1');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Code` varchar(50) DEFAULT NULL,
  `ParentId` varchar(50) DEFAULT NULL,
  `Type` int(11) NOT NULL,
  `Url` varchar(50) DEFAULT NULL,
  `Icon` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `SortCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES ('975247111765495809', '系统管理', null, null, '4', null, 'fa fa-gears', null, '1');
INSERT INTO `sys_permission` VALUES ('975247111765495810', 'Wiki管理', null, null, '4', null, 'fa fa-gears', null, '32');
INSERT INTO `sys_permission` VALUES ('975247111765495812', '组织管理', 'system.org', '976093351549997056', '1', '/System/Org/Index', null, null, '11');
INSERT INTO `sys_permission` VALUES ('975247111765495817', '文档管理', 'wiki.document', '976094603197419520', '1', '/Wiki/Document/Index', null, null, '34');
INSERT INTO `sys_permission` VALUES ('975247111765495818', '新闻中心', null, null, '2', 'http://www.52chloe.com/', null, null, '43');
INSERT INTO `sys_permission` VALUES ('975247111769690113', '用户管理', 'system.user', '976092881406267392', '1', '/System/User/Index', null, null, '3');
INSERT INTO `sys_permission` VALUES ('975247111769690114', '角色管理', 'system.role', '976094018385612800', '1', '/System/Role/Index', null, null, '22');
INSERT INTO `sys_permission` VALUES ('975247111769690117', '权限管理', 'system.permission', '976094340222947328', '1', '/System/Permission/Index', null, null, '28');
INSERT INTO `sys_permission` VALUES ('975247111769690119', '岗位管理', 'system.post', '976093808829796352', '1', '/System/Post/Index', null, null, '17');
INSERT INTO `sys_permission` VALUES ('975247111769690122', '菜单管理', 'wiki.menu', '976094863944716288', '1', '/Wiki/Menu/Index', null, null, '39');
INSERT INTO `sys_permission` VALUES ('975302681314856960', '添加权限', 'system.permission.add', '976094340222947328', '3', null, null, null, '29');
INSERT INTO `sys_permission` VALUES ('975302907190710272', '更新权限', 'system.permission.update', '976094340222947328', '3', null, null, null, '30');
INSERT INTO `sys_permission` VALUES ('975303061264273408', '删除权限', 'system.permission.delete', '976094340222947328', '3', null, null, null, '31');
INSERT INTO `sys_permission` VALUES ('975303702510440448', '添加用户', 'system.user.add', '976092881406267392', '3', null, null, null, '4');
INSERT INTO `sys_permission` VALUES ('975303794801905664', '修改用户', 'system.user.update', '976092881406267392', '3', null, null, null, '5');
INSERT INTO `sys_permission` VALUES ('975304146464935936', '重置用户密码', 'system.user.revise_password', '976092881406267392', '3', null, null, null, '6');
INSERT INTO `sys_permission` VALUES ('975304246784299008', '设置用户权限', 'system.user.set_permission', '976092881406267392', '3', null, null, null, '7');
INSERT INTO `sys_permission` VALUES ('975304393958232064', '修改用户状态', 'system.user.change_state', '976092881406267392', '3', null, null, null, '8');
INSERT INTO `sys_permission` VALUES ('975304681167392768', '切换用户部门权限状态', 'system.user.change_user_org_permission_state', '976092881406267392', '3', null, null, null, '9');
INSERT INTO `sys_permission` VALUES ('975305328730181632', '添加角色', 'system.role.add', '976094018385612800', '3', null, null, null, '23');
INSERT INTO `sys_permission` VALUES ('975305551389003776', '修改角色', 'system.role.update', '976094018385612800', '3', null, null, null, '24');
INSERT INTO `sys_permission` VALUES ('975305767588597760', '删除角色', 'system.role.delete', '976094018385612800', '3', null, null, null, '25');
INSERT INTO `sys_permission` VALUES ('975305860647620608', '设置权限', 'system.role.set_permission', '976094018385612800', '3', null, null, null, '26');
INSERT INTO `sys_permission` VALUES ('975306168010412032', '添加组织', 'system.org.add', '976093351549997056', '3', null, null, null, '12');
INSERT INTO `sys_permission` VALUES ('975306251208626176', '更新组织', 'system.org.update', '976093351549997056', '3', null, null, null, '13');
INSERT INTO `sys_permission` VALUES ('975306444578623488', '删除组织', 'system.org.delete', '976093351549997056', '3', null, null, null, '14');
INSERT INTO `sys_permission` VALUES ('975306615915941888', '设置权限', 'system.org.set_permission', '976093351549997056', '3', null, null, null, '15');
INSERT INTO `sys_permission` VALUES ('975306875098763264', '添加岗位', 'system.post.add', '976093808829796352', '3', null, null, null, '18');
INSERT INTO `sys_permission` VALUES ('975306937950408704', '更新岗位', 'system.post.update', '976093808829796352', '3', null, null, null, '19');
INSERT INTO `sys_permission` VALUES ('975307061833371648', '删除岗位', 'system.post.delete', '976093808829796352', '3', null, null, null, '20');
INSERT INTO `sys_permission` VALUES ('975307311394459648', '添加文档', 'wiki.document.add', '976094603197419520', '3', null, null, null, '35');
INSERT INTO `sys_permission` VALUES ('975307390251569152', '更新文档', 'wiki.document.update', '976094603197419520', '3', null, null, null, '36');
INSERT INTO `sys_permission` VALUES ('975307454827073536', '删除文档', 'wiki.document.delete', '976094603197419520', '3', null, null, null, '37');
INSERT INTO `sys_permission` VALUES ('975307558929698816', '添加菜单', 'wiki.menu.add', '976094863944716288', '3', null, null, null, '40');
INSERT INTO `sys_permission` VALUES ('975307639187705856', '更新菜单', 'wiki.menu.update', '976094863944716288', '3', null, null, null, '41');
INSERT INTO `sys_permission` VALUES ('975307712265064448', '删除菜单', 'wiki.menu.delete', '976094863944716288', '3', null, null, null, '42');
INSERT INTO `sys_permission` VALUES ('976092881406267392', '用户模块', null, '975247111765495809', '4', null, null, null, '2');
INSERT INTO `sys_permission` VALUES ('976093351549997056', '组织模块', null, '975247111765495809', '4', null, null, null, '10');
INSERT INTO `sys_permission` VALUES ('976093808829796352', '岗位模块', null, '975247111765495809', '4', null, null, null, '16');
INSERT INTO `sys_permission` VALUES ('976094018385612800', '角色模块', null, '975247111765495809', '4', null, null, null, '21');
INSERT INTO `sys_permission` VALUES ('976094340222947328', '权限模块', null, '975247111765495809', '4', null, null, null, '27');
INSERT INTO `sys_permission` VALUES ('976094603197419520', '文档模块', null, '975247111765495810', '4', null, null, null, '33');
INSERT INTO `sys_permission` VALUES ('976094863944716288', '菜单模块', null, '975247111765495810', '4', null, null, null, '38');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `OrgId` varchar(50) DEFAULT NULL,
  `Description` varchar(200) DEFAULT NULL,
  `CreationTime` datetime NOT NULL,
  `IsDeleted` int(1) NOT NULL,
  `DeletionTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('975258691823603712', '.net工程师', '975258020424585216', null, '2018-03-18 14:32:00', '0', null);
INSERT INTO `sys_post` VALUES ('975258734123159552', '产品经理', '975258520352067584', null, '2018-03-18 14:32:00', '0', null);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `Id` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `SortCode` int(11) DEFAULT NULL,
  `IsEnabled` bit(1) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `CreationTime` datetime DEFAULT NULL,
  `CreateUserId` varchar(50) DEFAULT NULL,
  `LastModifyTime` datetime DEFAULT NULL,
  `LastModifyUserId` varchar(50) DEFAULT NULL,
  `IsDeleted` int(1) DEFAULT NULL,
  `DeletionTime` datetime DEFAULT NULL,
  `DeleteUserId` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('975256202294464512', '群友', null, '', null, '2018-03-18 14:22:00', '975247111765495808', null, null, '0', null, null);

-- ----------------------------
-- Table structure for sys_rolepermission
-- ----------------------------
DROP TABLE IF EXISTS `sys_rolepermission`;
CREATE TABLE `sys_rolepermission` (
  `Id` varchar(50) NOT NULL,
  `RoleId` varchar(50) NOT NULL,
  `PermissionId` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_rolepermission
-- ----------------------------
INSERT INTO `sys_rolepermission` VALUES ('975308019413946368', '975256202294464512', '975247111765495809');
INSERT INTO `sys_rolepermission` VALUES ('975308019413946369', '975256202294464512', '975247111769690113');
INSERT INTO `sys_rolepermission` VALUES ('975308019413946370', '975256202294464512', '975247111765495812');
INSERT INTO `sys_rolepermission` VALUES ('975308019413946371', '975256202294464512', '975247111769690119');
INSERT INTO `sys_rolepermission` VALUES ('975308019413946372', '975256202294464512', '975247111769690114');
INSERT INTO `sys_rolepermission` VALUES ('975308019413946373', '975256202294464512', '975247111769690117');
INSERT INTO `sys_rolepermission` VALUES ('975308019413946374', '975256202294464512', '975247111765495810');
INSERT INTO `sys_rolepermission` VALUES ('975308019413946375', '975256202294464512', '975247111765495817');
INSERT INTO `sys_rolepermission` VALUES ('975308019413946376', '975256202294464512', '975247111769690122');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `Id` varchar(50) NOT NULL,
  `AccountName` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `HeadIcon` varchar(50) DEFAULT NULL,
  `Gender` int(11) DEFAULT NULL,
  `Birthday` datetime DEFAULT NULL,
  `MobilePhone` varchar(50) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `WeChat` varchar(50) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `CreationTime` datetime NOT NULL,
  `CreateUserId` varchar(50) DEFAULT NULL,
  `LastModifyTime` datetime DEFAULT NULL,
  `LastModifyUserId` varchar(50) DEFAULT NULL,
  `State` int(11) NOT NULL,
  `OrgIds` varchar(1024) DEFAULT NULL,
  `PostIds` varchar(1024) DEFAULT NULL,
  `RoleIds` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('975247111765495808', 'admin', '超级管理员', null, '1', '2016-11-29 00:00:00', '1557985464', 'so_while@163.com', 'so9527', '系统内置账户', '2016-07-20 00:00:00', null, null, null, '1', null, null, null);
INSERT INTO `sys_user` VALUES ('975308390198808576', '52chloe', '克洛伊', null, null, '2018-04-21 00:00:00', null, null, null, null, '2018-03-18 17:50:00', '975247111765495808', null, null, '1', '975258520352067584', '', '975256202294464512');

-- ----------------------------
-- Table structure for sys_userlogon
-- ----------------------------
DROP TABLE IF EXISTS `sys_userlogon`;
CREATE TABLE `sys_userlogon` (
  `Id` varchar(50) NOT NULL,
  `UserId` varchar(50) DEFAULT NULL,
  `UserPassword` varchar(50) DEFAULT NULL,
  `UserSecretkey` varchar(50) DEFAULT NULL,
  `PreviousVisitTime` datetime DEFAULT NULL,
  `LastVisitTime` datetime DEFAULT NULL,
  `LogOnCount` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userlogon
-- ----------------------------
INSERT INTO `sys_userlogon` VALUES ('975247111765495808', '975247111765495808', '53e3cc847459b7ebac01dbdaeeecc7c8', '6e2ca8a0f5f78fbc', '2018-04-29 09:04:07', '2018-04-29 11:00:12', '372');
INSERT INTO `sys_userlogon` VALUES ('975308390207197184', '975308390198808576', 'aba0332a719569ac4b1ab0014c10b8d1', '3514657aecc61c74', '2018-03-21 17:06:00', '2018-03-21 20:44:00', '91');

-- ----------------------------
-- Table structure for sys_userorg
-- ----------------------------
DROP TABLE IF EXISTS `sys_userorg`;
CREATE TABLE `sys_userorg` (
  `Id` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `OrgId` varchar(50) NOT NULL,
  `DisablePermission` int(11) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userorg
-- ----------------------------
INSERT INTO `sys_userorg` VALUES ('990423540840927232', '975308390198808576', '975258520352067584', '0');

-- ----------------------------
-- Table structure for sys_userpermission
-- ----------------------------
DROP TABLE IF EXISTS `sys_userpermission`;
CREATE TABLE `sys_userpermission` (
  `Id` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `PermissionId` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userpermission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_userpost
-- ----------------------------
DROP TABLE IF EXISTS `sys_userpost`;
CREATE TABLE `sys_userpost` (
  `Id` varchar(50) NOT NULL,
  `UserId` varchar(50) DEFAULT NULL,
  `PostId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userpost
-- ----------------------------
INSERT INTO `sys_userpost` VALUES ('975259300899459072', '975259300828155904', '975258691823603712');

-- ----------------------------
-- Table structure for sys_userrole
-- ----------------------------
DROP TABLE IF EXISTS `sys_userrole`;
CREATE TABLE `sys_userrole` (
  `Id` varchar(50) NOT NULL,
  `UserId` varchar(50) NOT NULL,
  `RoleId` varchar(50) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userrole
-- ----------------------------
INSERT INTO `sys_userrole` VALUES ('990423540828344320', '975308390198808576', '975256202294464512');

-- ----------------------------
-- Table structure for wikidocument
-- ----------------------------
DROP TABLE IF EXISTS `wikidocument`;
CREATE TABLE `wikidocument` (
  `Id` varchar(100) NOT NULL,
  `Title` varchar(100) DEFAULT NULL,
  `Summary` varchar(500) DEFAULT NULL,
  `Tag` varchar(100) DEFAULT NULL,
  `HtmlContent` text,
  `MarkdownCode` text,
  `CreationTime` datetime NOT NULL,
  `UpdationTime` datetime DEFAULT NULL,
  `IsDeleted` int(11) NOT NULL,
  `DeletionTime` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wikidocument
-- ----------------------------

-- ----------------------------
-- Table structure for wikimenuitem
-- ----------------------------
DROP TABLE IF EXISTS `wikimenuitem`;
CREATE TABLE `wikimenuitem` (
  `Id` varchar(50) NOT NULL,
  `ParentId` varchar(50) DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `DocumentId` varchar(100) DEFAULT NULL,
  `SortCode` int(11) DEFAULT NULL,
  `IsEnabled` int(11) NOT NULL,
  `CreationTime` datetime NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wikimenuitem
-- ----------------------------
