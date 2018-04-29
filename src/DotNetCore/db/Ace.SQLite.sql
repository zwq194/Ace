/*
Navicat SQLite Data Transfer

Source Server         : chloe
Source Server Version : 30802
Source Host           : :0

Target Server Type    : SQLite
Target Server Version : 30802
File Encoding         : 65001

Date: 2018-04-29 11:03:03
*/

PRAGMA foreign_keys = OFF;

-- ----------------------------
-- Table structure for Sys_Log
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_Log";
CREATE TABLE "Sys_Log" (
"Id"  INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
"UserId"  varchar(50),
"UserName"  nvarchar(50),
"Type"  int NOT NULL,
"IP"  nvarchar(50),
"IPAddress"  nvarchar(50),
"ModuleId"  nvarchar(50),
"ModuleName"  nvarchar(50),
"Result"  BOOL,
"Description"  nvarchar(500),
"CreationTime"  datetime NOT NULL
);

-- ----------------------------
-- Records of Sys_Log
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_Org
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_Org";
CREATE TABLE "Sys_Org" (
"Id"  varchar(50) NOT NULL,
"Name"  nvarchar(50),
"OrgType"  INTEGER,
"ManagerId"  varchar(50),
"ParentId"  varchar(50),
"Description"  nvarchar(100),
"CreationTime"  datetime NOT NULL,
"IsDeleted"  INTEGER NOT NULL,
"DeletionTime"  datetime,
"DeleteUserId"  varchar(50),
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_Org
-- ----------------------------
INSERT INTO "main"."Sys_Org" VALUES (975257850106482688, 'Chloe', 1, null, null, null, '2018-03-18 14:29:25.5407338', 0, null, null);
INSERT INTO "main"."Sys_Org" VALUES (975258020424585216, '开发部', 2, null, 975257850106482688, null, '2018-03-18 14:30:06.1449527', 0, null, null);
INSERT INTO "main"."Sys_Org" VALUES (975258520352067584, '产品部', 2, null, 975257850106482688, null, '2018-03-18 14:32:05.3366687', 0, null, null);

-- ----------------------------
-- Table structure for Sys_OrgPermission
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_OrgPermission";
CREATE TABLE "Sys_OrgPermission" (
"Id"  varchar(50) NOT NULL,
"OrgId"  varchar(50) NOT NULL,
"PermissionId"  varchar(50) NOT NULL,
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_OrgPermission
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_OrgType
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_OrgType";
CREATE TABLE "Sys_OrgType" (
"Id"  INTEGER NOT NULL,
"Name"  nvarchar(100),
"ParentId"  INTEGER,
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_OrgType
-- ----------------------------
INSERT INTO "main"."Sys_OrgType" VALUES (1, '公司', null);
INSERT INTO "main"."Sys_OrgType" VALUES (2, '部门', 1);

-- ----------------------------
-- Table structure for Sys_Permission
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_Permission";
CREATE TABLE "Sys_Permission" (
"Id"  varchar(50) NOT NULL,
"Name"  nvarchar(50),
"Code"  nvarchar(50),
"ParentId"  varchar(50),
"Type"  INTEGER NOT NULL,
"Url"  nvarchar(50),
"Icon"  nvarchar(50),
"Description"  nvarchar(50),
"SortCode"  INTEGER,
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_Permission
-- ----------------------------
INSERT INTO "main"."Sys_Permission" VALUES (975247111765495809, '系统管理', null, null, 4, null, 'fa fa-gears', null, 1);
INSERT INTO "main"."Sys_Permission" VALUES (975247111765495812, '组织管理', 'system.org', 976093351549997056, 1, '/System/Org/Index', null, null, 11);
INSERT INTO "main"."Sys_Permission" VALUES (975247111765495810, 'Wiki管理', null, null, 4, null, 'fa fa-gears', null, 32);
INSERT INTO "main"."Sys_Permission" VALUES (975247111765495817, '文档管理', 'wiki.document', 976094603197419520, 1, '/Wiki/Document/Index', null, null, 34);
INSERT INTO "main"."Sys_Permission" VALUES (975247111765495818, '新闻中心', null, null, 2, 'http://www.52chloe.com/', null, null, 43);
INSERT INTO "main"."Sys_Permission" VALUES (975247111769690114, '角色管理', 'system.role', 976094018385612800, 1, '/System/Role/Index', null, null, 22);
INSERT INTO "main"."Sys_Permission" VALUES (975247111769690113, '用户管理', 'system.user', 976092881406267392, 1, '/System/User/Index', null, null, 3);
INSERT INTO "main"."Sys_Permission" VALUES (975247111769690117, '权限管理', 'system.permission', 976094340222947328, 1, '/System/Permission/Index', null, null, 28);
INSERT INTO "main"."Sys_Permission" VALUES (975247111769690119, '岗位管理', 'system.post', 976093808829796352, 1, '/System/Post/Index', null, null, 17);
INSERT INTO "main"."Sys_Permission" VALUES (975247111769690122, '菜单管理', 'wiki.menu', 976094863944716288, 1, '/Wiki/Menu/Index', null, null, 39);
INSERT INTO "main"."Sys_Permission" VALUES (975302681314856960, '添加权限', 'system.permission.add', 976094340222947328, 3, null, null, null, 29);
INSERT INTO "main"."Sys_Permission" VALUES (975302907190710272, '更新权限', 'system.permission.update', 976094340222947328, 3, null, null, null, 30);
INSERT INTO "main"."Sys_Permission" VALUES (975303061264273408, '删除权限', 'system.permission.delete', 976094340222947328, 3, null, null, null, 31);
INSERT INTO "main"."Sys_Permission" VALUES (975303702510440448, '添加用户', 'system.user.add', 976092881406267392, 3, null, null, null, 4);
INSERT INTO "main"."Sys_Permission" VALUES (975303794801905664, '修改用户', 'system.user.update', 976092881406267392, 3, null, null, null, 5);
INSERT INTO "main"."Sys_Permission" VALUES (975304146464935936, '重置用户密码', 'system.user.revise_password', 976092881406267392, 3, null, null, null, 6);
INSERT INTO "main"."Sys_Permission" VALUES (975304246784299008, '设置用户权限', 'system.user.set_permission', 976092881406267392, 3, null, null, null, 7);
INSERT INTO "main"."Sys_Permission" VALUES (975304393958232064, '修改用户状态', 'system.user.change_state', 976092881406267392, 3, null, null, null, 8);
INSERT INTO "main"."Sys_Permission" VALUES (975304681167392768, '切换用户部门权限状态', 'system.user.change_user_org_permission_state', 976092881406267392, 3, null, null, null, 9);
INSERT INTO "main"."Sys_Permission" VALUES (975305328730181632, '添加角色', 'system.role.add', 976094018385612800, 3, null, null, null, 23);
INSERT INTO "main"."Sys_Permission" VALUES (975305551389003776, '修改角色', 'system.role.update', 976094018385612800, 3, null, null, null, 24);
INSERT INTO "main"."Sys_Permission" VALUES (975305767588597760, '删除角色', 'system.role.delete', 976094018385612800, 3, null, null, null, 25);
INSERT INTO "main"."Sys_Permission" VALUES (975305860647620608, '设置权限', 'system.role.set_permission', 976094018385612800, 3, null, null, null, 26);
INSERT INTO "main"."Sys_Permission" VALUES (975306168010412032, '添加组织', 'system.org.add', 976093351549997056, 3, null, null, null, 12);
INSERT INTO "main"."Sys_Permission" VALUES (975306251208626176, '更新组织', 'system.org.update', 976093351549997056, 3, null, null, null, 13);
INSERT INTO "main"."Sys_Permission" VALUES (975306444578623488, '删除组织', 'system.org.delete', 976093351549997056, 3, null, null, null, 14);
INSERT INTO "main"."Sys_Permission" VALUES (975306615915941888, '设置权限', 'system.org.set_permission', 976093351549997056, 3, null, null, null, 15);
INSERT INTO "main"."Sys_Permission" VALUES (975306875098763264, '添加岗位', 'system.post.add', 976093808829796352, 3, null, null, null, 18);
INSERT INTO "main"."Sys_Permission" VALUES (975306937950408704, '更新岗位', 'system.post.update', 976093808829796352, 3, null, null, null, 19);
INSERT INTO "main"."Sys_Permission" VALUES (975307061833371648, '删除岗位', 'system.post.delete', 976093808829796352, 3, null, null, null, 20);
INSERT INTO "main"."Sys_Permission" VALUES (975307311394459648, '添加文档', 'wiki.document.add', 976094603197419520, 3, null, null, null, 35);
INSERT INTO "main"."Sys_Permission" VALUES (975307390251569152, '更新文档', 'wiki.document.update', 976094603197419520, 3, null, null, null, 36);
INSERT INTO "main"."Sys_Permission" VALUES (975307454827073536, '删除文档', 'wiki.document.delete', 976094603197419520, 3, null, null, null, 37);
INSERT INTO "main"."Sys_Permission" VALUES (975307558929698816, '添加菜单', 'wiki.menu.add', 976094863944716288, 3, null, null, null, 40);
INSERT INTO "main"."Sys_Permission" VALUES (975307639187705856, '更新菜单', 'wiki.menu.update', 976094863944716288, 3, null, null, null, 41);
INSERT INTO "main"."Sys_Permission" VALUES (975307712265064448, '删除菜单', 'wiki.menu.delete', 976094863944716288, 3, null, null, null, 42);
INSERT INTO "main"."Sys_Permission" VALUES (976092881406267392, '用户模块', null, 975247111765495809, 4, null, null, null, 2);
INSERT INTO "main"."Sys_Permission" VALUES (976093351549997056, '组织模块', null, 975247111765495809, 4, null, null, null, 10);
INSERT INTO "main"."Sys_Permission" VALUES (976093808829796352, '岗位模块', null, 975247111765495809, 4, null, null, null, 16);
INSERT INTO "main"."Sys_Permission" VALUES (976094018385612800, '角色模块', null, 975247111765495809, 4, null, null, null, 21);
INSERT INTO "main"."Sys_Permission" VALUES (976094340222947328, '权限模块', null, 975247111765495809, 4, null, null, null, 27);
INSERT INTO "main"."Sys_Permission" VALUES (976094603197419520, '文档模块', null, 975247111765495810, 4, null, null, null, 33);
INSERT INTO "main"."Sys_Permission" VALUES (976094863944716288, '菜单模块', null, 975247111765495810, 4, null, null, null, 38);
INSERT INTO "main"."Sys_Permission" VALUES (977192391880609792, 'g', null, 976094340222947328, 4, null, null, null, null);
INSERT INTO "main"."Sys_Permission" VALUES (977192733158543360, 'g1', null, 977192391880609792, 1, null, null, null, null);

-- ----------------------------
-- Table structure for Sys_Post
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_Post";
CREATE TABLE "Sys_Post" (
"Id"  varchar(50) NOT NULL,
"Name"  nvarchar(50),
"OrgId"  varchar(50),
"Description"  nvarchar(200),
"CreationTime"  datetime NOT NULL,
"IsDeleted"  INTEGER NOT NULL,
"DeletionTime"  datetime,
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_Post
-- ----------------------------
INSERT INTO "main"."Sys_Post" VALUES (975258691823603712, '.net工程师', 975258020424585216, null, '2018-03-18 14:32:46.2196487', 0, null);
INSERT INTO "main"."Sys_Post" VALUES (975258734123159552, '产品经理', 975258520352067584, null, '2018-03-18 14:32:56.3035904', 0, null);

-- ----------------------------
-- Table structure for Sys_Role
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_Role";
CREATE TABLE "Sys_Role" (
"Id"  varchar(50) NOT NULL,
"Name"  varchar(50),
"SortCode"  int,
"IsEnabled"  BOOL,
"Description"  varchar(500),
"CreationTime"  datetime,
"CreateUserId"  varchar(50),
"LastModifyTime"  datetime,
"LastModifyUserId"  varchar(50),
"IsDeleted"  BOOL,
"DeletionTime"  datetime,
"DeleteUserId"  varchar(500),
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_Role
-- ----------------------------
INSERT INTO "main"."Sys_Role" VALUES (975256202294464512, '群友', null, 1, null, '2018-03-18 14:22:52.6711752', 975247111765495808, null, null, 0, null, null);

-- ----------------------------
-- Table structure for Sys_RolePermission
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_RolePermission";
CREATE TABLE "Sys_RolePermission" (
"Id"  varchar(50) NOT NULL,
"RoleId"  varchar(50) NOT NULL,
"PermissionId"  varchar(50) NOT NULL,
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_RolePermission
-- ----------------------------
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946368, 975256202294464512, 975247111765495809);
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946369, 975256202294464512, 975247111769690113);
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946370, 975256202294464512, 975247111765495812);
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946371, 975256202294464512, 975247111769690119);
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946372, 975256202294464512, 975247111769690114);
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946373, 975256202294464512, 975247111769690117);
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946374, 975256202294464512, 975247111765495810);
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946375, 975256202294464512, 975247111765495817);
INSERT INTO "main"."Sys_RolePermission" VALUES (975308019413946376, 975256202294464512, 975247111769690122);

-- ----------------------------
-- Table structure for Sys_User
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_User";
CREATE TABLE "Sys_User" (
"Id"  varchar(50) NOT NULL,
"AccountName"  nvarchar(50),
"Name"  nvarchar(50),
"HeadIcon"  nvarchar(50),
"Gender"  int,
"Birthday"  datetime,
"MobilePhone"  nvarchar(50),
"Email"  nvarchar(50),
"WeChat"  nvarchar(50),
"Description"  nvarchar(500),
"CreationTime"  datetime NOT NULL,
"CreateUserId"  nvarchar(50),
"LastModifyTime"  datetime,
"LastModifyUserId"  nvarchar(50),
"State"  INTEGER NOT NULL,
"OrgIds"  varchar(1024),
"PostIds"  varchar(1024),
"RoleIds"  varchar(1024),
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_User
-- ----------------------------
INSERT INTO "main"."Sys_User" VALUES (975247111765495808, 'admin', '超级管理员', null, 1, '2016-11-29 00:00:00', 1557985464, 'so_while@163.com', 'so9527', '系统内置账户', '2016-07-20 00:00:00', null, null, null, 1, null, null, null);
INSERT INTO "main"."Sys_User" VALUES (975308390198808576, '52chloe', '克洛伊', null, null, '2018-04-21 00:00:00', null, null, null, null, '2018-03-18 17:50:15.2357287', 975247111765495808, null, null, 1, 975258520352067584, 975258734123159552, 975256202294464512);

-- ----------------------------
-- Table structure for Sys_UserLogOn
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_UserLogOn";
CREATE TABLE [Sys_UserLogOn](
	[Id] varchar(50) PRIMARY KEY NOT NULL,
	[UserId] varchar(50) NULL,
	[UserPassword] varchar(50) NULL,
	[UserSecretkey] varchar(50) NULL,
	[PreviousVisitTime] datetime NULL,
	[LastVisitTime] datetime NULL,
	[LogOnCount] int NOT NULL);

-- ----------------------------
-- Records of Sys_UserLogOn
-- ----------------------------
INSERT INTO "main"."Sys_UserLogOn" VALUES (975247111765495808, 975247111765495808, '127c86ed1f673ccb41f7a6880d5be6d2', 'bb973a252d28076a', '2018-04-21 18:58:34.2031767', '2018-04-21 22:30:48.6720352', 369);
INSERT INTO "main"."Sys_UserLogOn" VALUES (975308390207197184, 975308390198808576, 'aba0332a719569ac4b1ab0014c10b8d1', '3514657aecc61c74', '2018-03-21 17:06:41.8841339', '2018-03-21 20:44:35.8003019', 91);

-- ----------------------------
-- Table structure for Sys_UserOrg
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_UserOrg";
CREATE TABLE "Sys_UserOrg" (
"Id"  varchar(50) NOT NULL,
"UserId"  varchar(50) NOT NULL,
"OrgId"  varchar(50) NOT NULL,
"DisablePermission"  INTEGER NOT NULL,
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_UserOrg
-- ----------------------------
INSERT INTO "main"."Sys_UserOrg" VALUES (987706249984479232, 975308390198808576, 975258520352067584, 0);

-- ----------------------------
-- Table structure for Sys_UserPermission
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_UserPermission";
CREATE TABLE "Sys_UserPermission" (
"Id"  varchar(50) NOT NULL,
"UserId"  varchar(50) NOT NULL,
"PermissionId"  varchar(50) NOT NULL,
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_UserPermission
-- ----------------------------

-- ----------------------------
-- Table structure for Sys_UserPost
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_UserPost";
CREATE TABLE "Sys_UserPost" (
"Id"  varchar(50) NOT NULL,
"UserId"  varchar(50),
"PostId"  varchar(50),
PRIMARY KEY ("Id")
);

-- ----------------------------
-- Records of Sys_UserPost
-- ----------------------------
INSERT INTO "main"."Sys_UserPost" VALUES (975259300899459072, 975259300828155904, 975258691823603712);
INSERT INTO "main"."Sys_UserPost" VALUES (987706249988673536, 975308390198808576, 975258734123159552);

-- ----------------------------
-- Table structure for Sys_UserRole
-- ----------------------------
DROP TABLE IF EXISTS "main"."Sys_UserRole";
CREATE TABLE "Sys_UserRole" (
"Id"  varchar(50) NOT NULL,
"UserId"  varchar(50) NOT NULL,
"RoleId"  varchar(50) NOT NULL,
PRIMARY KEY ("Id" ASC)
);

-- ----------------------------
-- Records of Sys_UserRole
-- ----------------------------
INSERT INTO "main"."Sys_UserRole" VALUES (987706249963507712, 975308390198808576, 975256202294464512);

-- ----------------------------
-- Table structure for WikiDocument
-- ----------------------------
DROP TABLE IF EXISTS "main"."WikiDocument";
CREATE TABLE [WikiDocument](
    [Id] varchar(100) PRIMARY KEY NOT NULL, 
    [Title] nvarchar(100), 
    [Summary] nvarchar(500), 
    [Tag] nvarchar(100), 
    [HtmlContent] ntext, 
    [MarkdownCode] ntext, 
    [CreationTime] datetime NOT NULL, 
    [UpdationTime] datetime, 
    [IsDeleted] BOOL NOT NULL, 
    [DeletionTime] datetime);

-- ----------------------------
-- Records of WikiDocument
-- ----------------------------
INSERT INTO "main"."WikiDocument" VALUES (3324756912431431680, 'IDbContext', 'IDbContext接口介绍', 'IDbContext', '<h1 id="h1-idbcontext"><a name="IDbContext" class="reference-link"></a><span class="header-link octicon octicon-link"></span>IDbContext</h1><p>数据库上下文接口，包含创建查询对象（IQuery）、插入数据、更新数据和删除数据等基本操作。</p>
<pre><code class="lang-csharp">public interface IDbContext : IDisposable
{
    /* 获取关联的会话，通过该对象可以执行基本的 ado.net 操作（包括事务） */
    IDbSession Session { get; }

    /* 获取 IQuery 对象。主要数据查询的入口 */
    IQuery&lt;TEntity&gt; Query&lt;TEntity&gt;();
    IQuery&lt;TEntity&gt; Query&lt;TEntity&gt;(string table);

    /* 
     * 根据主键查询数据 
     * 如果实体是单一主键，可以传入的 key 与主键属性类型相同的值，亦可以传一个包含了与实体主键类型相同的属性的对象，如：new { Id = 1 }
     * 如果实体是多主键，则传入的 key 须是包含了与实体主键类型相同的属性的对象，如：new { Key1 = &quot;1&quot;, Key2 = &quot;2&quot; }
     */
    TEntity QueryByKey&lt;TEntity&gt;(object key, bool tracking = false);
    TEntity QueryByKey&lt;TEntity&gt;(object key, string table, bool tracking = false);

    /* 快捷多表连接 */
    IJoiningQuery&lt;T1, T2&gt; JoinQuery&lt;T1, T2&gt;(Expression&lt;Func&lt;T1, T2, object[]&gt;&gt; joinInfo);
    IJoiningQuery&lt;T1, T2, T3&gt; JoinQuery&lt;T1, T2, T3&gt;(Expression&lt;Func&lt;T1, T2, T3, object[]&gt;&gt; joinInfo);
    IJoiningQuery&lt;T1, T2, T3, T4&gt; JoinQuery&lt;T1, T2, T3, T4&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, object[]&gt;&gt; joinInfo);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; JoinQuery&lt;T1, T2, T3, T4, T5&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, T5, object[]&gt;&gt; joinInfo);

    /* 原生 sql 查询，支持存储过程 */
    IEnumerable&lt;T&gt; SqlQuery&lt;T&gt;(string sql, params DbParam[] parameters);
    IEnumerable&lt;T&gt; SqlQuery&lt;T&gt;(string sql, CommandType cmdType, params DbParam[] parameters);

    /* 传入一个实体对象，插入数据。返回传入的实体对象（如果实体拥有自增列，会自动将自增值设置到实体相应的属性上） */
    TEntity Insert&lt;TEntity&gt;(TEntity entity);
    TEntity Insert&lt;TEntity&gt;(TEntity entity, string table);

    /* 传入一个 lambda 表达式树，向表插入指定的字段数据，返回主键值（如果主键是自增，则返回的就是自增值） */
    object Insert&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity&gt;&gt; content);
    object Insert&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity&gt;&gt; content, string table);

    /* 将一个实体集合插入数据库（批量处理）*/
    void InsertRange&lt;TEntity&gt;(List&lt;TEntity&gt; entities, bool keepIdentity = false);

    /* 传入一个实体，更新单条数据。返回受影响的行数 */
    int Update&lt;TEntity&gt;(TEntity entity);
    int Update&lt;TEntity&gt;(TEntity entity, string table);

    /* 传入 condition 条件和 body 表达式树，更新满足 condition 条件的指定的字段。返回受影响的行数 */
    int Update&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity, bool&gt;&gt; condition, Expression&lt;Func&lt;TEntity, TEntity&gt;&gt; content);
    int Update&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity, bool&gt;&gt; condition, Expression&lt;Func&lt;TEntity, TEntity&gt;&gt; content, string table);

    /* 传入一个实体，删除单条数据。返回受影响的行数 */
    int Delete&lt;TEntity&gt;(TEntity entity);
    int Delete&lt;TEntity&gt;(TEntity entity, string table);

    /* 传入 condition 条件表达式树，删除满足 condition 条件的数据。返回受影响的行数 */
    int Delete&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity, bool&gt;&gt; condition);
    int Delete&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity, bool&gt;&gt; condition, string table);

    /* 根据主键删除数据 */
    int DeleteByKey&lt;TEntity&gt;(object key);
    int DeleteByKey&lt;TEntity&gt;(object key, string table);

    /* 传入一个实体，让当前上下文跟踪该实体的属性变化。调用 &#39;int Update&lt;TEntity&gt;(TEntity entity)&#39; 方法更新数据时，只会更新实体被修改过的属性。 */
    void TrackEntity(object entity);
}
</code></pre>
', '# IDbContext
数据库上下文接口，包含创建查询对象（IQuery）、插入数据、更新数据和删除数据等基本操作。
```csharp
public interface IDbContext : IDisposable
{
    /* 获取关联的会话，通过该对象可以执行基本的 ado.net 操作（包括事务） */
    IDbSession Session { get; }

    /* 获取 IQuery 对象。主要数据查询的入口 */
    IQuery<TEntity> Query<TEntity>();
	IQuery<TEntity> Query<TEntity>(string table);
	
    /* 
	 * 根据主键查询数据 
	 * 如果实体是单一主键，可以传入的 key 与主键属性类型相同的值，亦可以传一个包含了与实体主键类型相同的属性的对象，如：new { Id = 1 }
	 * 如果实体是多主键，则传入的 key 须是包含了与实体主键类型相同的属性的对象，如：new { Key1 = "1", Key2 = "2" }
	 */
    TEntity QueryByKey<TEntity>(object key, bool tracking = false);
	TEntity QueryByKey<TEntity>(object key, string table, bool tracking = false);
    
    /* 快捷多表连接 */
    IJoiningQuery<T1, T2> JoinQuery<T1, T2>(Expression<Func<T1, T2, object[]>> joinInfo);
    IJoiningQuery<T1, T2, T3> JoinQuery<T1, T2, T3>(Expression<Func<T1, T2, T3, object[]>> joinInfo);
    IJoiningQuery<T1, T2, T3, T4> JoinQuery<T1, T2, T3, T4>(Expression<Func<T1, T2, T3, T4, object[]>> joinInfo);
    IJoiningQuery<T1, T2, T3, T4, T5> JoinQuery<T1, T2, T3, T4, T5>(Expression<Func<T1, T2, T3, T4, T5, object[]>> joinInfo);

    /* 原生 sql 查询，支持存储过程 */
    IEnumerable<T> SqlQuery<T>(string sql, params DbParam[] parameters);
    IEnumerable<T> SqlQuery<T>(string sql, CommandType cmdType, params DbParam[] parameters);

    /* 传入一个实体对象，插入数据。返回传入的实体对象（如果实体拥有自增列，会自动将自增值设置到实体相应的属性上） */
    TEntity Insert<TEntity>(TEntity entity);
	TEntity Insert<TEntity>(TEntity entity, string table);

    /* 传入一个 lambda 表达式树，向表插入指定的字段数据，返回主键值（如果主键是自增，则返回的就是自增值） */
    object Insert<TEntity>(Expression<Func<TEntity>> content);
	object Insert<TEntity>(Expression<Func<TEntity>> content, string table);
	
	/* 将一个实体集合插入数据库（批量处理）*/
	void InsertRange<TEntity>(List<TEntity> entities, bool keepIdentity = false);

    /* 传入一个实体，更新单条数据。返回受影响的行数 */
    int Update<TEntity>(TEntity entity);
	int Update<TEntity>(TEntity entity, string table);

    /* 传入 condition 条件和 body 表达式树，更新满足 condition 条件的指定的字段。返回受影响的行数 */
    int Update<TEntity>(Expression<Func<TEntity, bool>> condition, Expression<Func<TEntity, TEntity>> content);
	int Update<TEntity>(Expression<Func<TEntity, bool>> condition, Expression<Func<TEntity, TEntity>> content, string table);

    /* 传入一个实体，删除单条数据。返回受影响的行数 */
    int Delete<TEntity>(TEntity entity);
	int Delete<TEntity>(TEntity entity, string table);
	
    /* 传入 condition 条件表达式树，删除满足 condition 条件的数据。返回受影响的行数 */
    int Delete<TEntity>(Expression<Func<TEntity, bool>> condition);
	int Delete<TEntity>(Expression<Func<TEntity, bool>> condition, string table);
	
    /* 根据主键删除数据 */
    int DeleteByKey<TEntity>(object key);
	int DeleteByKey<TEntity>(object key, string table);

    /* 传入一个实体，让当前上下文跟踪该实体的属性变化。调用 ''int Update<TEntity>(TEntity entity)'' 方法更新数据时，只会更新实体被修改过的属性。 */
    void TrackEntity(object entity);
}
```
', '2016-12-01 13:56:59.94', '2017-06-18 17:59:28.8007748', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324760360224817152, 'IQuery', 'IQuery 接口介绍', 'IQuery', '<h1 id="h1-iquery"><a name="IQuery" class="reference-link"></a><span class="header-link octicon octicon-link"></span>IQuery</h1><p>强类型对象化查询接口，包含条件筛选、排序、分组查询、聚合查询、多表连接查询和分页等功能。</p>
<pre><code class="lang-csharp">public interface IQuery&lt;T&gt; : IQuery
{
    /* 在上下文中跟踪实体 */
    IQuery&lt;T&gt; AsTracking();
    IEnumerable&lt;T&gt; AsEnumerable();
    /* 投影选择数据（支持匿名类型） */
    IQuery&lt;TResult&gt; Select&lt;TResult&gt;(Expression&lt;Func&lt;T, TResult&gt;&gt; selector);

    /* 筛选条件，和 linq 一样的用法 */
    IQuery&lt;T&gt; Where(Expression&lt;Func&lt;T, bool&gt;&gt; predicate);

    /* 排序，和 linq 一样的用法 */
    IOrderedQuery&lt;T&gt; OrderBy&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);
    IOrderedQuery&lt;T&gt; OrderByDesc&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);

    IQuery&lt;T&gt; Skip(int count);
    IQuery&lt;T&gt; Take(int count);
    /* 分页 */
    IQuery&lt;T&gt; TakePage(int pageNumber, int pageSize);

    /* 获取分组查询对象 */
    IGroupingQuery&lt;T&gt; GroupBy&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);

    IQuery&lt;T&gt; Distinct();

    /* 多表连接 */
    IJoiningQuery&lt;T, TOther&gt; Join&lt;TOther&gt;(JoinType joinType, Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);
    IJoiningQuery&lt;T, TOther&gt; Join&lt;TOther&gt;(IQuery&lt;TOther&gt; q, JoinType joinType, Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);

    /* 多表内连接 */
    IJoiningQuery&lt;T, TOther&gt; InnerJoin&lt;TOther&gt;(Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);
    /* 多表左连接 */
    IJoiningQuery&lt;T, TOther&gt; LeftJoin&lt;TOther&gt;(Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);
    /* 多表右连接 */
    IJoiningQuery&lt;T, TOther&gt; RightJoin&lt;TOther&gt;(Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);
    /* 多表全连接 */
    IJoiningQuery&lt;T, TOther&gt; FullJoin&lt;TOther&gt;(Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);

    /* 多表内连接 */
    IJoiningQuery&lt;T, TOther&gt; InnerJoin&lt;TOther&gt;(IQuery&lt;TOther&gt; q, Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);
    /* 多表左连接 */
    IJoiningQuery&lt;T, TOther&gt; LeftJoin&lt;TOther&gt;(IQuery&lt;TOther&gt; q, Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);
    /* 多表右连接 */
    IJoiningQuery&lt;T, TOther&gt; RightJoin&lt;TOther&gt;(IQuery&lt;TOther&gt; q, Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);
    /* 多表全连接 */
    IJoiningQuery&lt;T, TOther&gt; FullJoin&lt;TOther&gt;(IQuery&lt;TOther&gt; q, Expression&lt;Func&lt;T, TOther, bool&gt;&gt; on);

    T First();
    T First(Expression&lt;Func&lt;T, bool&gt;&gt; predicate);
    T FirstOrDefault();
    T FirstOrDefault(Expression&lt;Func&lt;T, bool&gt;&gt; predicate);

    /* 查询数据，返回 List 集合 */
    List&lt;T&gt; ToList();

    /* 判断满足条件的数据是否存在 */
    bool Any();
    bool Any(Expression&lt;Func&lt;T, bool&gt;&gt; predicate);

    /* 获取总条数 */
    int Count();
    long LongCount();

    /* 求最大值和最小值 */
    TResult Max&lt;TResult&gt;(Expression&lt;Func&lt;T, TResult&gt;&gt; selector);
    TResult Min&lt;TResult&gt;(Expression&lt;Func&lt;T, TResult&gt;&gt; selector);

    /* 求和 */
    int Sum(Expression&lt;Func&lt;T, int&gt;&gt; selector);
    int? Sum(Expression&lt;Func&lt;T, int?&gt;&gt; selector);
    long Sum(Expression&lt;Func&lt;T, long&gt;&gt; selector);
    long? Sum(Expression&lt;Func&lt;T, long?&gt;&gt; selector);
    decimal Sum(Expression&lt;Func&lt;T, decimal&gt;&gt; selector);
    decimal? Sum(Expression&lt;Func&lt;T, decimal?&gt;&gt; selector);
    double Sum(Expression&lt;Func&lt;T, double&gt;&gt; selector);
    double? Sum(Expression&lt;Func&lt;T, double?&gt;&gt; selector);
    float Sum(Expression&lt;Func&lt;T, float&gt;&gt; selector);
    float? Sum(Expression&lt;Func&lt;T, float?&gt;&gt; selector);

    /* 求平均值 */
    double Average(Expression&lt;Func&lt;T, int&gt;&gt; selector);
    double? Average(Expression&lt;Func&lt;T, int?&gt;&gt; selector);
    double Average(Expression&lt;Func&lt;T, long&gt;&gt; selector);
    double? Average(Expression&lt;Func&lt;T, long?&gt;&gt; selector);
    decimal Average(Expression&lt;Func&lt;T, decimal&gt;&gt; selector);
    decimal? Average(Expression&lt;Func&lt;T, decimal?&gt;&gt; selector);
    double Average(Expression&lt;Func&lt;T, double&gt;&gt; selector);
    double? Average(Expression&lt;Func&lt;T, double?&gt;&gt; selector);
    float Average(Expression&lt;Func&lt;T, float&gt;&gt; selector);
    float? Average(Expression&lt;Func&lt;T, float?&gt;&gt; selector);
}
</code></pre>
', '# IQuery
强类型对象化查询接口，包含条件筛选、排序、分组查询、聚合查询、多表连接查询和分页等功能。
```csharp
public interface IQuery<T> : IQuery
{
    /* 在上下文中跟踪实体 */
    IQuery<T> AsTracking();
    IEnumerable<T> AsEnumerable();
    /* 投影选择数据（支持匿名类型） */
    IQuery<TResult> Select<TResult>(Expression<Func<T, TResult>> selector);

    /* 筛选条件，和 linq 一样的用法 */
    IQuery<T> Where(Expression<Func<T, bool>> predicate);

    /* 排序，和 linq 一样的用法 */
    IOrderedQuery<T> OrderBy<K>(Expression<Func<T, K>> keySelector);
    IOrderedQuery<T> OrderByDesc<K>(Expression<Func<T, K>> keySelector);

    IQuery<T> Skip(int count);
    IQuery<T> Take(int count);
    /* 分页 */
    IQuery<T> TakePage(int pageNumber, int pageSize);

    /* 获取分组查询对象 */
    IGroupingQuery<T> GroupBy<K>(Expression<Func<T, K>> keySelector);

	IQuery<T> Distinct();

    /* 多表连接 */
    IJoiningQuery<T, TOther> Join<TOther>(JoinType joinType, Expression<Func<T, TOther, bool>> on);
    IJoiningQuery<T, TOther> Join<TOther>(IQuery<TOther> q, JoinType joinType, Expression<Func<T, TOther, bool>> on);

    /* 多表内连接 */
    IJoiningQuery<T, TOther> InnerJoin<TOther>(Expression<Func<T, TOther, bool>> on);
    /* 多表左连接 */
    IJoiningQuery<T, TOther> LeftJoin<TOther>(Expression<Func<T, TOther, bool>> on);
    /* 多表右连接 */
    IJoiningQuery<T, TOther> RightJoin<TOther>(Expression<Func<T, TOther, bool>> on);
    /* 多表全连接 */
    IJoiningQuery<T, TOther> FullJoin<TOther>(Expression<Func<T, TOther, bool>> on);

    /* 多表内连接 */
    IJoiningQuery<T, TOther> InnerJoin<TOther>(IQuery<TOther> q, Expression<Func<T, TOther, bool>> on);
    /* 多表左连接 */
    IJoiningQuery<T, TOther> LeftJoin<TOther>(IQuery<TOther> q, Expression<Func<T, TOther, bool>> on);
    /* 多表右连接 */
    IJoiningQuery<T, TOther> RightJoin<TOther>(IQuery<TOther> q, Expression<Func<T, TOther, bool>> on);
    /* 多表全连接 */
    IJoiningQuery<T, TOther> FullJoin<TOther>(IQuery<TOther> q, Expression<Func<T, TOther, bool>> on);

    T First();
    T First(Expression<Func<T, bool>> predicate);
    T FirstOrDefault();
    T FirstOrDefault(Expression<Func<T, bool>> predicate);

    /* 查询数据，返回 List 集合 */
    List<T> ToList();

    /* 判断满足条件的数据是否存在 */
    bool Any();
    bool Any(Expression<Func<T, bool>> predicate);

    /* 获取总条数 */
    int Count();
    long LongCount();

    /* 求最大值和最小值 */
    TResult Max<TResult>(Expression<Func<T, TResult>> selector);
    TResult Min<TResult>(Expression<Func<T, TResult>> selector);

    /* 求和 */
    int Sum(Expression<Func<T, int>> selector);
    int? Sum(Expression<Func<T, int?>> selector);
    long Sum(Expression<Func<T, long>> selector);
    long? Sum(Expression<Func<T, long?>> selector);
    decimal Sum(Expression<Func<T, decimal>> selector);
    decimal? Sum(Expression<Func<T, decimal?>> selector);
    double Sum(Expression<Func<T, double>> selector);
    double? Sum(Expression<Func<T, double?>> selector);
    float Sum(Expression<Func<T, float>> selector);
    float? Sum(Expression<Func<T, float?>> selector);

    /* 求平均值 */
    double Average(Expression<Func<T, int>> selector);
    double? Average(Expression<Func<T, int?>> selector);
    double Average(Expression<Func<T, long>> selector);
    double? Average(Expression<Func<T, long?>> selector);
    decimal Average(Expression<Func<T, decimal>> selector);
    decimal? Average(Expression<Func<T, decimal?>> selector);
    double Average(Expression<Func<T, double>> selector);
    double? Average(Expression<Func<T, double?>> selector);
    float Average(Expression<Func<T, float>> selector);
    float? Average(Expression<Func<T, float?>> selector);
}
```', '2016-12-01 14:10:41.96', '2017-06-18 18:01:40.6635201', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324761124187930624, 'IOrderedQuery', 'IOrderedQuery 接口介绍', 'IOrderedQuery', '<h1 id="h1-iorderedquery"><a name="IOrderedQuery" class="reference-link"></a><span class="header-link octicon octicon-link"></span>IOrderedQuery</h1><p>支持多个排序字段接口。</p>
<pre><code class="lang-csharp">public interface IOrderedQuery&lt;T&gt; : IQuery&lt;T&gt;
{
    IOrderedQuery&lt;T&gt; ThenBy&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);
    IOrderedQuery&lt;T&gt; ThenByDesc&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);
}
</code></pre>
', '# IOrderedQuery
支持多个排序字段接口。
```csharp
public interface IOrderedQuery<T> : IQuery<T>
{
    IOrderedQuery<T> ThenBy<K>(Expression<Func<T, K>> keySelector);
    IOrderedQuery<T> ThenByDesc<K>(Expression<Func<T, K>> keySelector);
}
```', '2016-12-01 14:13:44.1', '2016-12-09 14:09:11.4248864', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324765409034371072, 'IGroupingQuery', 'IGroupingQuery 接口介绍', 'IGroupingQuery', '<h1 id="h1-igroupingquery"><a name="IGroupingQuery" class="reference-link"></a><span class="header-link octicon octicon-link"></span>IGroupingQuery</h1><p>分组查询接口。</p>
<pre><code class="lang-csharp">public interface IGroupingQuery&lt;T&gt;
{
    /* 支持多个字段分组，即 group by Age，Id... */
    IGroupingQuery&lt;T&gt; AndBy&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);

    /* 增加 having 条件： select Age from Users group by Age having count(Age)&gt;1  */
    IGroupingQuery&lt;T&gt; Having(Expression&lt;Func&lt;T, bool&gt;&gt; predicate);

    /* 分组后排序 */
    IOrderedGroupingQuery&lt;T&gt; OrderBy&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);
    IOrderedGroupingQuery&lt;T&gt; OrderByDesc&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);

    /* select 数据：g.Select(a =&gt; new { a.Age, Count = AggregateFunctions.Count() }) --&gt; select Age,COUNT(1) from Users group by Age having count(Age)&gt;1  */
    IQuery&lt;TResult&gt; Select&lt;TResult&gt;(Expression&lt;Func&lt;T, TResult&gt;&gt; selector);
}

public interface IOrderedGroupingQuery&lt;T&gt; : IGroupingQuery&lt;T&gt;
{
    IOrderedGroupingQuery&lt;T&gt; ThenBy&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);
    IOrderedGroupingQuery&lt;T&gt; ThenByDesc&lt;K&gt;(Expression&lt;Func&lt;T, K&gt;&gt; keySelector);
}
</code></pre>
', '# IGroupingQuery
分组查询接口。
```csharp
public interface IGroupingQuery<T>
{
    /* 支持多个字段分组，即 group by Age，Id... */
    IGroupingQuery<T> AndBy<K>(Expression<Func<T, K>> keySelector);

    /* 增加 having 条件： select Age from Users group by Age having count(Age)>1  */
    IGroupingQuery<T> Having(Expression<Func<T, bool>> predicate);

    /* 分组后排序 */
    IOrderedGroupingQuery<T> OrderBy<K>(Expression<Func<T, K>> keySelector);
    IOrderedGroupingQuery<T> OrderByDesc<K>(Expression<Func<T, K>> keySelector);

    /* select 数据：g.Select(a => new { a.Age, Count = AggregateFunctions.Count() }) --> select Age,COUNT(1) from Users group by Age having count(Age)>1  */
    IQuery<TResult> Select<TResult>(Expression<Func<T, TResult>> selector);
}

public interface IOrderedGroupingQuery<T> : IGroupingQuery<T>
{
    IOrderedGroupingQuery<T> ThenBy<K>(Expression<Func<T, K>> keySelector);
    IOrderedGroupingQuery<T> ThenByDesc<K>(Expression<Func<T, K>> keySelector);
}
```', '2016-12-01 14:30:45.69', '2017-04-09 21:15:35.6967203', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324766621741875200, 'IJoiningQuery', 'IJoiningQuery 接口介绍', 'IJoiningQuery', '<h1 id="h1-ijoiningquery"><a name="IJoiningQuery" class="reference-link"></a><span class="header-link octicon octicon-link"></span>IJoiningQuery</h1><p>该接口用于基本的多表连接操作。</p>
<pre><code class="lang-csharp">public interface IJoiningQuery&lt;T1, T2&gt;
{
    IJoiningQuery&lt;T1, T2&gt; Where(Expression&lt;Func&lt;T1, T2, bool&gt;&gt; predicate);

    IJoiningQuery&lt;T1, T2, T3&gt; Join&lt;T3&gt;(JoinType joinType, Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3&gt; Join&lt;T3&gt;(IQuery&lt;T3&gt; q, JoinType joinType, Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);

    IJoiningQuery&lt;T1, T2, T3&gt; InnerJoin&lt;T3&gt;(Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3&gt; LeftJoin&lt;T3&gt;(Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3&gt; RightJoin&lt;T3&gt;(Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3&gt; FullJoin&lt;T3&gt;(Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);

    /* 多表内连接 */
    IJoiningQuery&lt;T1, T2, T3&gt; InnerJoin&lt;T3&gt;(IQuery&lt;T3&gt; q, Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);
    /* 多表左连接 */
    IJoiningQuery&lt;T1, T2, T3&gt; LeftJoin&lt;T3&gt;(IQuery&lt;T3&gt; q, Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);
    /* 多表右连接 */
    IJoiningQuery&lt;T1, T2, T3&gt; RightJoin&lt;T3&gt;(IQuery&lt;T3&gt; q, Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);
    /* 多表全连接 */
    IJoiningQuery&lt;T1, T2, T3&gt; FullJoin&lt;T3&gt;(IQuery&lt;T3&gt; q, Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; on);

    /* 投影选择数据（支持匿名类型） */
    IQuery&lt;TResult&gt; Select&lt;TResult&gt;(Expression&lt;Func&lt;T1, T2, TResult&gt;&gt; selector);
}

public interface IJoiningQuery&lt;T1, T2, T3&gt;
{
    IJoiningQuery&lt;T1, T2, T3&gt; Where(Expression&lt;Func&lt;T1, T2, T3, bool&gt;&gt; predicate);

    IJoiningQuery&lt;T1, T2, T3, T4&gt; Join&lt;T4&gt;(JoinType joinType, Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4&gt; Join&lt;T4&gt;(IQuery&lt;T4&gt; q, JoinType joinType, Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);

    IJoiningQuery&lt;T1, T2, T3, T4&gt; InnerJoin&lt;T4&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4&gt; LeftJoin&lt;T4&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4&gt; RightJoin&lt;T4&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4&gt; FullJoin&lt;T4&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);

    IJoiningQuery&lt;T1, T2, T3, T4&gt; InnerJoin&lt;T4&gt;(IQuery&lt;T4&gt; q, Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4&gt; LeftJoin&lt;T4&gt;(IQuery&lt;T4&gt; q, Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4&gt; RightJoin&lt;T4&gt;(IQuery&lt;T4&gt; q, Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4&gt; FullJoin&lt;T4&gt;(IQuery&lt;T4&gt; q, Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; on);

    IQuery&lt;TResult&gt; Select&lt;TResult&gt;(Expression&lt;Func&lt;T1, T2, T3, TResult&gt;&gt; selector);
}

public interface IJoiningQuery&lt;T1, T2, T3, T4&gt;
{
    IJoiningQuery&lt;T1, T2, T3, T4&gt; Where(Expression&lt;Func&lt;T1, T2, T3, T4, bool&gt;&gt; predicate);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; Join&lt;T5&gt;(JoinType joinType, Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; Join&lt;T5&gt;(IQuery&lt;T5&gt; q, JoinType joinType, Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);

    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; InnerJoin&lt;T5&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; LeftJoin&lt;T5&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; RightJoin&lt;T5&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; FullJoin&lt;T5&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);

    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; InnerJoin&lt;T5&gt;(IQuery&lt;T5&gt; q, Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; LeftJoin&lt;T5&gt;(IQuery&lt;T5&gt; q, Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; RightJoin&lt;T5&gt;(IQuery&lt;T5&gt; q, Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; FullJoin&lt;T5&gt;(IQuery&lt;T5&gt; q, Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; on);

    IQuery&lt;TResult&gt; Select&lt;TResult&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, TResult&gt;&gt; selector);
}

/* IJoiningQuery 接口最多支持 5 个泛型参数，如需连接更多表，可以调用 Select 方法得到 IQuery 对象后继续连接即可 */
public interface IJoiningQuery&lt;T1, T2, T3, T4, T5&gt;
{
    IJoiningQuery&lt;T1, T2, T3, T4, T5&gt; Where(Expression&lt;Func&lt;T1, T2, T3, T4, T5, bool&gt;&gt; predicate);
    IQuery&lt;TResult&gt; Select&lt;TResult&gt;(Expression&lt;Func&lt;T1, T2, T3, T4, T5, TResult&gt;&gt; selector);
}
</code></pre>
', '# IJoiningQuery
该接口用于基本的多表连接操作。
```csharp
public interface IJoiningQuery<T1, T2>
{
    IJoiningQuery<T1, T2> Where(Expression<Func<T1, T2, bool>> predicate);

    IJoiningQuery<T1, T2, T3> Join<T3>(JoinType joinType, Expression<Func<T1, T2, T3, bool>> on);
    IJoiningQuery<T1, T2, T3> Join<T3>(IQuery<T3> q, JoinType joinType, Expression<Func<T1, T2, T3, bool>> on);

    IJoiningQuery<T1, T2, T3> InnerJoin<T3>(Expression<Func<T1, T2, T3, bool>> on);
    IJoiningQuery<T1, T2, T3> LeftJoin<T3>(Expression<Func<T1, T2, T3, bool>> on);
    IJoiningQuery<T1, T2, T3> RightJoin<T3>(Expression<Func<T1, T2, T3, bool>> on);
    IJoiningQuery<T1, T2, T3> FullJoin<T3>(Expression<Func<T1, T2, T3, bool>> on);

    /* 多表内连接 */
    IJoiningQuery<T1, T2, T3> InnerJoin<T3>(IQuery<T3> q, Expression<Func<T1, T2, T3, bool>> on);
    /* 多表左连接 */
    IJoiningQuery<T1, T2, T3> LeftJoin<T3>(IQuery<T3> q, Expression<Func<T1, T2, T3, bool>> on);
    /* 多表右连接 */
    IJoiningQuery<T1, T2, T3> RightJoin<T3>(IQuery<T3> q, Expression<Func<T1, T2, T3, bool>> on);
    /* 多表全连接 */
    IJoiningQuery<T1, T2, T3> FullJoin<T3>(IQuery<T3> q, Expression<Func<T1, T2, T3, bool>> on);

    /* 投影选择数据（支持匿名类型） */
    IQuery<TResult> Select<TResult>(Expression<Func<T1, T2, TResult>> selector);
}

public interface IJoiningQuery<T1, T2, T3>
{
    IJoiningQuery<T1, T2, T3> Where(Expression<Func<T1, T2, T3, bool>> predicate);

    IJoiningQuery<T1, T2, T3, T4> Join<T4>(JoinType joinType, Expression<Func<T1, T2, T3, T4, bool>> on);
    IJoiningQuery<T1, T2, T3, T4> Join<T4>(IQuery<T4> q, JoinType joinType, Expression<Func<T1, T2, T3, T4, bool>> on);

    IJoiningQuery<T1, T2, T3, T4> InnerJoin<T4>(Expression<Func<T1, T2, T3, T4, bool>> on);
    IJoiningQuery<T1, T2, T3, T4> LeftJoin<T4>(Expression<Func<T1, T2, T3, T4, bool>> on);
    IJoiningQuery<T1, T2, T3, T4> RightJoin<T4>(Expression<Func<T1, T2, T3, T4, bool>> on);
    IJoiningQuery<T1, T2, T3, T4> FullJoin<T4>(Expression<Func<T1, T2, T3, T4, bool>> on);

    IJoiningQuery<T1, T2, T3, T4> InnerJoin<T4>(IQuery<T4> q, Expression<Func<T1, T2, T3, T4, bool>> on);
    IJoiningQuery<T1, T2, T3, T4> LeftJoin<T4>(IQuery<T4> q, Expression<Func<T1, T2, T3, T4, bool>> on);
    IJoiningQuery<T1, T2, T3, T4> RightJoin<T4>(IQuery<T4> q, Expression<Func<T1, T2, T3, T4, bool>> on);
    IJoiningQuery<T1, T2, T3, T4> FullJoin<T4>(IQuery<T4> q, Expression<Func<T1, T2, T3, T4, bool>> on);

    IQuery<TResult> Select<TResult>(Expression<Func<T1, T2, T3, TResult>> selector);
}

public interface IJoiningQuery<T1, T2, T3, T4>
{
    IJoiningQuery<T1, T2, T3, T4> Where(Expression<Func<T1, T2, T3, T4, bool>> predicate);
    IJoiningQuery<T1, T2, T3, T4, T5> Join<T5>(JoinType joinType, Expression<Func<T1, T2, T3, T4, T5, bool>> on);
    IJoiningQuery<T1, T2, T3, T4, T5> Join<T5>(IQuery<T5> q, JoinType joinType, Expression<Func<T1, T2, T3, T4, T5, bool>> on);

    IJoiningQuery<T1, T2, T3, T4, T5> InnerJoin<T5>(Expression<Func<T1, T2, T3, T4, T5, bool>> on);
    IJoiningQuery<T1, T2, T3, T4, T5> LeftJoin<T5>(Expression<Func<T1, T2, T3, T4, T5, bool>> on);
    IJoiningQuery<T1, T2, T3, T4, T5> RightJoin<T5>(Expression<Func<T1, T2, T3, T4, T5, bool>> on);
    IJoiningQuery<T1, T2, T3, T4, T5> FullJoin<T5>(Expression<Func<T1, T2, T3, T4, T5, bool>> on);

    IJoiningQuery<T1, T2, T3, T4, T5> InnerJoin<T5>(IQuery<T5> q, Expression<Func<T1, T2, T3, T4, T5, bool>> on);
    IJoiningQuery<T1, T2, T3, T4, T5> LeftJoin<T5>(IQuery<T5> q, Expression<Func<T1, T2, T3, T4, T5, bool>> on);
    IJoiningQuery<T1, T2, T3, T4, T5> RightJoin<T5>(IQuery<T5> q, Expression<Func<T1, T2, T3, T4, T5, bool>> on);
    IJoiningQuery<T1, T2, T3, T4, T5> FullJoin<T5>(IQuery<T5> q, Expression<Func<T1, T2, T3, T4, T5, bool>> on);

    IQuery<TResult> Select<TResult>(Expression<Func<T1, T2, T3, T4, TResult>> selector);
}

/* IJoiningQuery 接口最多支持 5 个泛型参数，如需连接更多表，可以调用 Select 方法得到 IQuery 对象后继续连接即可 */
public interface IJoiningQuery<T1, T2, T3, T4, T5>
{
    IJoiningQuery<T1, T2, T3, T4, T5> Where(Expression<Func<T1, T2, T3, T4, T5, bool>> predicate);
    IQuery<TResult> Select<TResult>(Expression<Func<T1, T2, T3, T4, T5, TResult>> selector);
}
```', '2016-12-01 14:35:34.82', '2017-06-18 18:04:05.4484911', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324773693170647040, 'IDbSession', 'IDbSession 接口介绍', 'IDbSession', '<h1 id="h1-idbsession"><a name="IDbSession" class="reference-link"></a><span class="header-link octicon octicon-link"></span>IDbSession</h1><p>DbContext 上下文会话接口，包含基本的 ado.net 操作（支持存储过程及 output 参数）。</p>
<pre><code class="lang-csharp">public interface IDbSession : IDisposable
{
    /* 获取关联的上下文 */
    IDbContext DbContext { get; }

    /* 获取关联的 DbConnection */
    IDbConnection CurrentConnection { get; }
    /// &lt;summary&gt;
    /// 如果未开启事务，则返回 null
    /// &lt;/summary&gt;
    IDbTransaction CurrentTransaction { get; }

    /* 判断当前会话是否开启了事务 */
    bool IsInTransaction { get; }
    /* 获取或设置在终止执行命令的尝试并生成错误之前的等待时间（以秒为单位）。默认值为 30 秒 */
    int CommandTimeout { get; set; }

    /* 下面这些方法，你懂的... */
    int ExecuteNonQuery(string cmdText, params DbParam[] parameters);
    int ExecuteNonQuery(string cmdText, CommandType cmdType, params DbParam[] parameters);

    object ExecuteScalar(string cmdText, params DbParam[] parameters);
    object ExecuteScalar(string cmdText, CommandType cmdType, params DbParam[] parameters);

    IDataReader ExecuteReader(string cmdText, params DbParam[] parameters);
    IDataReader ExecuteReader(string cmdText, CommandType cmdType, params DbParam[] parameters);

    void BeginTransaction();
    void BeginTransaction(IsolationLevel il);
    void CommitTransaction();
    void RollbackTransaction();

    /* 给当前会话添加拦截器 */
    void AddInterceptor(IDbCommandInterceptor interceptor);
    void RemoveInterceptor(IDbCommandInterceptor interceptor);
}
</code></pre>
', '# IDbSession
DbContext 上下文会话接口，包含基本的 ado.net 操作（支持存储过程及 output 参数）。
```csharp
public interface IDbSession : IDisposable
{
    /* 获取关联的上下文 */
    IDbContext DbContext { get; }

    /* 获取关联的 DbConnection */
    IDbConnection CurrentConnection { get; }
    /// <summary>
    /// 如果未开启事务，则返回 null
    /// </summary>
    IDbTransaction CurrentTransaction { get; }

    /* 判断当前会话是否开启了事务 */
    bool IsInTransaction { get; }
    /* 获取或设置在终止执行命令的尝试并生成错误之前的等待时间（以秒为单位）。默认值为 30 秒 */
    int CommandTimeout { get; set; }

    /* 下面这些方法，你懂的... */
    int ExecuteNonQuery(string cmdText, params DbParam[] parameters);
    int ExecuteNonQuery(string cmdText, CommandType cmdType, params DbParam[] parameters);

    object ExecuteScalar(string cmdText, params DbParam[] parameters);
    object ExecuteScalar(string cmdText, CommandType cmdType, params DbParam[] parameters);

    IDataReader ExecuteReader(string cmdText, params DbParam[] parameters);
    IDataReader ExecuteReader(string cmdText, CommandType cmdType, params DbParam[] parameters);

    void BeginTransaction();
    void BeginTransaction(IsolationLevel il);
    void CommitTransaction();
    void RollbackTransaction();
	
	/* 给当前会话添加拦截器 */
	void AddInterceptor(IDbCommandInterceptor interceptor);
	void RemoveInterceptor(IDbCommandInterceptor interceptor);
}
```', '2016-12-01 15:03:40.78', '2017-01-10 13:00:47.4729778', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324786622028840960, 'AggregateFunctions', 'AggregateFunctions 接口介绍', 'AggregateFunctions', '<h1 id="h1-aggregatefunctions"><a name="AggregateFunctions" class="reference-link"></a><span class="header-link octicon octicon-link"></span>AggregateFunctions</h1><p>该系列方法用在 Where、Select、Having 等方法的表达式树中，用于表示数据库对应的聚合函数。</p>
<pre><code class="lang-csharp">public static class AggregateFunctions
{
    /* 对应数据库中的 COUNT() 函数 */
    public static int Count();
    public static long LongCount();

    /* 对应数据库中的 MAX(exp) 函数 */
    public static TResult Max&lt;TResult&gt;(TResult p);
    /* 对应数据库中的 MIN(exp) 函数 */
    public static TResult Min&lt;TResult&gt;(TResult p);

    /* 对应数据库中的 SUM(exp) 函数 */
    public static int Sum(int p);
    public static int? Sum(int? p);
    public static long Sum(long p);
    public static long? Sum(long? p);
    public static decimal Sum(decimal p);
    public static decimal? Sum(decimal? p);
    public static double Sum(double p);
    public static double? Sum(double? p);
    public static float Sum(float p);
    public static float? Sum(float? p);

    /* 对应数据库中的 AVG(exp) 函数 */
    public static double Average(int p);
    public static double? Average(int? p);
    public static double Average(long p);
    public static double? Average(long? p);
    public static decimal Average(decimal p);
    public static decimal? Average(decimal? p);
    public static double Average(double p);
    public static double? Average(double? p);
    public static float Average(float p);
    public static float? Average(float? p);
}
</code></pre>
', '# AggregateFunctions
该系列方法用在 Where、Select、Having 等方法的表达式树中，用于表示数据库对应的聚合函数。
```csharp
public static class AggregateFunctions
{
    /* 对应数据库中的 COUNT() 函数 */
    public static int Count();
    public static long LongCount();

    /* 对应数据库中的 MAX(exp) 函数 */
    public static TResult Max<TResult>(TResult p);
    /* 对应数据库中的 MIN(exp) 函数 */
    public static TResult Min<TResult>(TResult p);

    /* 对应数据库中的 SUM(exp) 函数 */
    public static int Sum(int p);
    public static int? Sum(int? p);
    public static long Sum(long p);
    public static long? Sum(long? p);
    public static decimal Sum(decimal p);
    public static decimal? Sum(decimal? p);
    public static double Sum(double p);
    public static double? Sum(double? p);
    public static float Sum(float p);
    public static float? Sum(float? p);

    /* 对应数据库中的 AVG(exp) 函数 */
    public static double Average(int p);
    public static double? Average(int? p);
    public static double Average(long p);
    public static double? Average(long? p);
    public static decimal Average(decimal p);
    public static decimal? Average(decimal? p);
    public static double Average(double p);
    public static double? Average(double? p);
    public static float Average(float p);
    public static float? Average(float? p);
}
```
', '2016-12-01 15:55:03.26', '2017-07-06 21:00:49.294331', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324788085501198336, 'DbFunctions', 'DbFunctions 接口介绍', 'DbFunctions', '<h1 id="h1-dbfunctions"><a name="DbFunctions" class="reference-link"></a><span class="header-link octicon octicon-link"></span>DbFunctions</h1><p>表示与数据库对应函数的一系列方法，可用在 Where、Select 等方法的表达式树中。</p>
<pre><code class="lang-csharp">public static class DbFunctions
{
    /* 求两个时间的年差，对应 SqlServer 的 DATEDIFF(YEAR,dateTime1,dateTime2) */
    public static int? DiffYears(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的月差，对应 SqlServer 的 DATEDIFF(MONTH,dateTime1,dateTime2) */
    public static int? DiffMonths(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的日差，对应 SqlServer 的 DATEDIFF(DAY,dateTime1,dateTime2) */
    public static int? DiffDays(DateTime? dateTime1, DateTime? ddateTime2);

    /* 求两个时间的时差，对应 SqlServer 的 DATEDIFF(HOUR,dateTime1,dateTime2) */
    public static int? DiffHours(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的分钟差，对应 SqlServer 的 DATEDIFF(MINUTE,dateTime1,dateTime2) */
    public static int? DiffMinutes(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的秒差，对应 SqlServer 的 DATEDIFF(SECOND,dateTime1,dateTime2) */
    public static int? DiffSeconds(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的毫秒差，对应 SqlServer 的 DATEDIFF(DATEDIFF,dateTime1,dateTime2) */
    public static int? DiffMilliseconds(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的微毫秒差，对应 SqlServer 的 DATEDIFF(MICROSECOND,dateTime1,dateTime2) */
    public static int? DiffMicroseconds(DateTime? dateTime1, DateTime? dateTime2);
}
</code></pre>
', '# DbFunctions
表示与数据库对应函数的一系列方法，可用在 Where、Select 等方法的表达式树中。
```csharp
public static class DbFunctions
{
    /* 求两个时间的年差，对应 SqlServer 的 DATEDIFF(YEAR,dateTime1,dateTime2) */
    public static int? DiffYears(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的月差，对应 SqlServer 的 DATEDIFF(MONTH,dateTime1,dateTime2) */
    public static int? DiffMonths(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的日差，对应 SqlServer 的 DATEDIFF(DAY,dateTime1,dateTime2) */
    public static int? DiffDays(DateTime? dateTime1, DateTime? ddateTime2);

    /* 求两个时间的时差，对应 SqlServer 的 DATEDIFF(HOUR,dateTime1,dateTime2) */
    public static int? DiffHours(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的分钟差，对应 SqlServer 的 DATEDIFF(MINUTE,dateTime1,dateTime2) */
    public static int? DiffMinutes(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的秒差，对应 SqlServer 的 DATEDIFF(SECOND,dateTime1,dateTime2) */
    public static int? DiffSeconds(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的毫秒差，对应 SqlServer 的 DATEDIFF(DATEDIFF,dateTime1,dateTime2) */
    public static int? DiffMilliseconds(DateTime? dateTime1, DateTime? dateTime2);

    /* 求两个时间的微毫秒差，对应 SqlServer 的 DATEDIFF(MICROSECOND,dateTime1,dateTime2) */
    public static int? DiffMicroseconds(DateTime? dateTime1, DateTime? dateTime2);
}
```', '2016-12-01 16:00:52.18', '2017-07-06 21:01:50.916322', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324793835434803200, 'SqlServer-实体特性', 'SqlServer-实体特性', 'SqlServer-实体特性', '<h1 id="h1-u5B9Eu4F53u7279u6027"><a name="实体特性" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实体特性</h1><p>实体特性位于命名空间 <strong>Chloe.Entity</strong> 下。<br><strong>TableAttribute：</strong><br>Name：映射的表名。<br>实体对应的表默认是实体类名，如实体类型名与表名不一致，可通过该特性指定映射的表名。</p>
<pre><code class="lang-csharp">public class TableAttribute : Attribute
{
    public TableAttribute();
    public TableAttribute(string name);

    public string Name { get; set; }
    public string Schema { get; set; }
}
</code></pre>
<p><strong>ColumnAttribute：</strong><br>Name：映射的列名，如不指定，则默认使用属性名。<br>IsPrimaryKey：指示列是否为主键，默认为 false。<br><strong>当一个实体没显示指定主键的时候，Chloe 默认选择名为 Id 的属性（如果存在）作为主键列，与此同时，如果该实体也没有显式指定任何自增列并且 Id 属性为 Int16、Int32 或者 Int64 类型，则也会默认其为自增列。如若不是自增列，可使用特性 NonAutoIncrementAttribute 标记</strong>。</p>
<pre><code class="lang-csharp">public class ColumnAttribute : Attribute
{
    public ColumnAttribute();
    public ColumnAttribute(string name);

    public string Name { get; set; }
    public bool IsPrimaryKey { get; set; }
    public DbType DbType { get; set; }
    public int Length { get; set; }
}
</code></pre>
<p><strong>AutoIncrementAttribute：</strong><br>标记属性为自增列。在 SqlServer 中，一个实体不能指定多个自增列，否则会报异常提示。</p>
<pre><code class="lang-csharp">public class AutoIncrementAttribute : Attribute
{
    public AutoIncrementAttribute();
}
</code></pre>
<p><strong>NonAutoIncrementAttribute：</strong><br>标记属性为非自增列。</p>
<pre><code class="lang-csharp">public class NonAutoIncrementAttribute : Attribute
{
    public NonAutoIncrementAttribute();
}
</code></pre>
<p><strong>NotMappedAttribute：</strong><br>指示属性不映射任何列。</p>
<pre><code class="lang-csharp">public class NotMappedAttribute : Attribute
{
    public NotMappedAttribute();
}
</code></pre>
', '# 实体特性
实体特性位于命名空间 **Chloe.Entity** 下。
**TableAttribute：**
Name：映射的表名。
实体对应的表默认是实体类名，如实体类型名与表名不一致，可通过该特性指定映射的表名。
```csharp
public class TableAttribute : Attribute
{
    public TableAttribute();
    public TableAttribute(string name);

    public string Name { get; set; }
    public string Schema { get; set; }
}
```
**ColumnAttribute：**
Name：映射的列名，如不指定，则默认使用属性名。
IsPrimaryKey：指示列是否为主键，默认为 false。
**当一个实体没显示指定主键的时候，Chloe 默认选择名为 Id 的属性（如果存在）作为主键列，与此同时，如果该实体也没有显式指定任何自增列并且 Id 属性为 Int16、Int32 或者 Int64 类型，则也会默认其为自增列。如若不是自增列，可使用特性 NonAutoIncrementAttribute 标记**。
```csharp
public class ColumnAttribute : Attribute
{
    public ColumnAttribute();
    public ColumnAttribute(string name);

    public string Name { get; set; }
    public bool IsPrimaryKey { get; set; }
    public DbType DbType { get; set; }
    public int Length { get; set; }
}
```
**AutoIncrementAttribute：**
标记属性为自增列。在 SqlServer 中，一个实体不能指定多个自增列，否则会报异常提示。
```csharp
public class AutoIncrementAttribute : Attribute
{
    public AutoIncrementAttribute();
}
```
**NonAutoIncrementAttribute：**
标记属性为非自增列。
```csharp
public class NonAutoIncrementAttribute : Attribute
{
    public NonAutoIncrementAttribute();
}
```
**NotMappedAttribute：**
指示属性不映射任何列。
```csharp
public class NotMappedAttribute : Attribute
{
    public NotMappedAttribute();
}
```', '2016-12-01 16:23:43.073', '2017-07-06 21:08:15.304565', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324795934096752640, 'SqlServer-实体定义', 'SqlServer-实体定义', 'SqlServer-实体定义', '<h1 id="h1-u5B9Eu4F53u5B9Au4E49"><a name="实体定义" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实体定义</h1><p>实体为纯 POCO，支持可空类型以及枚举类型映射。</p>
<pre><code class="lang-csharp">public enum Gender
{
    Man = 1,
    Woman
}
</code></pre>
<pre><code class="lang-csharp">[TableAttribute(&quot;Users&quot;)]
public class User
{
    [ColumnAttribute(&quot;Id&quot;, IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }

    [NotMappedAttribute]
    public string NotMappedProperty { get; set; }
}
</code></pre>
<pre><code class="lang-csharp">public class City
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}
</code></pre>
<pre><code class="lang-csharp">public class Province
{
    public int Id { get; set; }
    public string Name { get; set; }
}
</code></pre>
', '# 实体定义
实体为纯 POCO，支持可空类型以及枚举类型映射。
```csharp
public enum Gender
{
    Man = 1,
    Woman
}
```
```csharp
[TableAttribute("Users")]
public class User
{
    [ColumnAttribute("Id", IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }

    [NotMappedAttribute]
    public string NotMappedProperty { get; set; }
}
```
```csharp
public class City
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}
```
```csharp
public class Province
{
    public int Id { get; set; }
    public string Name { get; set; }
}
```', '2016-12-01 16:32:03.43', '2016-12-01 16:39:30.447', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324798423210655744, 'SqlServer-创建DbContext', 'SqlServer-创建DbContext', 'SqlServer-创建DbContext', '<h1 id="h1--dbcontext"><a name="创建 DbContext" class="reference-link"></a><span class="header-link octicon octicon-link"></span>创建 DbContext</h1><p>对于 SqlServer 数据库，需要引用程序集 Chloe.dll 和 Chloe.SqlServer.dll，然后使用 Chloe.SqlServer.MsSqlContext 创建上下文实例。<strong>注意：DbContext 实例非线程安全，不能设置为单例。同时，用完务必要将 DbContext 释放。</strong></p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
MsSqlContext context = new MsSqlContext(connString);
</code></pre>
<p>MsSqlContext 对象默认使用 ROWNUMBER 的分页方式，如果您的数据库是 SqlServer2012 或更高版本，可以切换使用 OFFSET FETCH 分页方式。</p>
<pre><code class="lang-csharp">context.PagingMode = PagingMode.OFFSET_FETCH;
</code></pre>
<p>ASP.NET CORE 配置 Service：</p>
<pre><code class="lang-csharp">public void ConfigureServices(IServiceCollection services)
{
    //...

    services.AddScoped&lt;Chloe.IDbContext&gt;((serviceProvider) =&gt;
    {
        return new Chloe.SqlServer.MsSqlContext(&quot;Your connection string&quot;);
    });

    //...
}
</code></pre>
', '# 创建 DbContext
对于 SqlServer 数据库，需要引用程序集 Chloe.dll 和 Chloe.SqlServer.dll，然后使用 Chloe.SqlServer.MsSqlContext 创建上下文实例。**注意：DbContext 实例非线程安全，不能设置为单例。同时，用完务必要将 DbContext 释放。**
```csharp
string connString = "Your connection string";
MsSqlContext context = new MsSqlContext(connString);
```
MsSqlContext 对象默认使用 ROWNUMBER 的分页方式，如果您的数据库是 SqlServer2012 或更高版本，可以切换使用 OFFSET FETCH 分页方式。
```csharp
context.PagingMode = PagingMode.OFFSET_FETCH;
```
ASP.NET CORE 配置 Service：
```csharp
public void ConfigureServices(IServiceCollection services)
{
	//...
	
    services.AddScoped<Chloe.IDbContext>((serviceProvider) =>
    {
        return new Chloe.SqlServer.MsSqlContext("Your connection string");
    });
   
    //...
}
```', '2016-12-01 16:41:56.88', '2016-12-01 19:39:45.053', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324802610879266816, 'SqlServer-基本查询', 'SqlServer-基本查询', 'SqlServer-基本查询', '<h1 id="h1-u57FAu672Cu67E5u8BE2"><a name="基本查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>基本查询</h1><p><strong>根据 Id 查询出一个 User 对象：</strong></p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
MsSqlContext context = new MsSqlContext(connString);
context.PagingMode = PagingMode.OFFSET_FETCH;
IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

q.Where(a =&gt; a.Id == 1).FirstOrDefault();
/*
 *生成的 sql：
 * SELECT TOP (1) [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] = 1
 */
</code></pre>
<p><strong>like 查询：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Name.Contains(&quot;so&quot;) || a.Name.StartsWith(&quot;s&quot;) || a.Name.EndsWith(&quot;o&quot;)).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name]
 * FROM [Users] AS [Users] 
 * WHERE ([Users].[Name] LIKE &#39;%&#39; + N&#39;so&#39; + &#39;%&#39; OR [Users].[Name] LIKE N&#39;s&#39; + &#39;%&#39; OR [Users].[Name] LIKE &#39;%&#39; + N&#39;o&#39;)
 */
</code></pre>
<p><strong>in 查询：</strong></p>
<pre><code class="lang-csharp">List&lt;int&gt; ids = new List&lt;int&gt;() { 1, 2, 3 };
q.Where(a =&gt; ids.Contains(a.Id)).ToList();
/*
 * Int32 @P_0 = 1;
   Int32 @P_1 = 2;
   Int32 @P_2 = 3;
   SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] IN (@P_0,@P_1,@P_2)
 */

/* in 子查询 */
/* IQuery&lt;T&gt;.ToList().Contains() 方法组合就会生成 in 子查询 sql 语句 */
users = q.Where(a =&gt; context.Query&lt;City&gt;().Select(c =&gt; c.Id).ToList().Contains((int)a.CityId)).ToList(); 
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name]
 * FROM [Users] AS [Users] 
 * WHERE [Users].[CityId] IN (SELECT [City].[Id] AS [C] FROM [City] AS [City])
 */
</code></pre>
<p><strong>可以选取指定的字段，返回一个匿名类型：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id == 1).Select(a =&gt; new { a.Id, a.Name }).FirstOrDefault();
/*
 * 只会生成包含 Id 和 Name 两个字段的 sql 语句：
 * SELECT TOP (1) [Users].[Id] AS [Id],[Users].[Name] AS [Name] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] = 1
 */
</code></pre>
<p><strong>排序：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).ThenBy(a =&gt; a.Id).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] &gt; 0 
   ORDER BY [Age] ASC,[Id] ASC
 */
</code></pre>
<p><strong>分页：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).TakePage(1, 20).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] WHERE [Users].[Id] &gt; 0 
   ORDER BY [Users].[Age] ASC 
   OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY
 */
</code></pre>
<p><strong>distinct 查询：</strong></p>
<pre><code class="lang-csharp">q.Select(a =&gt; new { a.Name }).Distinct().ToList();
/*
 * SELECT DISTINCT [Users].[Name] AS [Name] FROM [Users] AS [Users]
 */
</code></pre>
<p><strong>exists 查询：</strong></p>
<pre><code class="lang-csharp">/* IQuery&lt;T&gt;.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query&lt;User&gt;().Where(a =&gt; context.Query&lt;City&gt;().Where(c =&gt; c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users] 
 * WHERE Exists (SELECT N&#39;1&#39; AS [C] FROM [City] AS [City] WHERE [City].[Id] = [Users].[CityId])
 */
</code></pre>
<p>更多用法请查看<a href="/Wiki/Document/3325507078541279232" title="使用进阶">使用进阶</a>。</p>
', '# 基本查询
**根据 Id 查询出一个 User 对象：**
```csharp
string connString = "Your connection string";
MsSqlContext context = new MsSqlContext(connString);
context.PagingMode = PagingMode.OFFSET_FETCH;
IQuery<User> q = context.Query<User>();

q.Where(a => a.Id == 1).FirstOrDefault();
/*
 *生成的 sql：
 * SELECT TOP (1) [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] = 1
 */
```
**like 查询：**
```csharp
q.Where(a => a.Name.Contains("so") || a.Name.StartsWith("s") || a.Name.EndsWith("o")).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name]
 * FROM [Users] AS [Users] 
 * WHERE ([Users].[Name] LIKE ''%'' + N''so'' + ''%'' OR [Users].[Name] LIKE N''s'' + ''%'' OR [Users].[Name] LIKE ''%'' + N''o'')
 */
```
**in 查询：**
```csharp
List<int> ids = new List<int>() { 1, 2, 3 };
q.Where(a => ids.Contains(a.Id)).ToList();
/*
 * Int32 @P_0 = 1;
   Int32 @P_1 = 2;
   Int32 @P_2 = 3;
   SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] IN (@P_0,@P_1,@P_2)
 */
 
/* in 子查询 */
/* IQuery<T>.ToList().Contains() 方法组合就会生成 in 子查询 sql 语句 */
users = q.Where(a => context.Query<City>().Select(c => c.Id).ToList().Contains((int)a.CityId)).ToList(); 
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name]
 * FROM [Users] AS [Users] 
 * WHERE [Users].[CityId] IN (SELECT [City].[Id] AS [C] FROM [City] AS [City])
 */
```
**可以选取指定的字段，返回一个匿名类型：**
```csharp
q.Where(a => a.Id == 1).Select(a => new { a.Id, a.Name }).FirstOrDefault();
/*
 * 只会生成包含 Id 和 Name 两个字段的 sql 语句：
 * SELECT TOP (1) [Users].[Id] AS [Id],[Users].[Name] AS [Name] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] = 1
 */
```
**排序：**
```csharp
q.Where(a => a.Id > 0).OrderBy(a => a.Age).ThenBy(a => a.Id).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] > 0 
   ORDER BY [Age] ASC,[Id] ASC
 */
```
**分页：**
```csharp
q.Where(a => a.Id > 0).OrderBy(a => a.Age).TakePage(1, 20).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] WHERE [Users].[Id] > 0 
   ORDER BY [Users].[Age] ASC 
   OFFSET 0 ROWS FETCH NEXT 20 ROWS ONLY
 */
```
**distinct 查询：**
```csharp
q.Select(a => new { a.Name }).Distinct().ToList();
/*
 * SELECT DISTINCT [Users].[Name] AS [Name] FROM [Users] AS [Users]
 */
```
**exists 查询：**
```csharp
/* IQuery<T>.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query<User>().Where(a => context.Query<City>().Where(c => c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users] 
 * WHERE Exists (SELECT N''1'' AS [C] FROM [City] AS [City] WHERE [City].[Id] = [Users].[CityId])
 */
```
更多用法请查看[使用进阶](/Wiki/Document/3325507078541279232 "使用进阶")。', '2016-12-01 16:58:35.3', '2016-12-08 11:39:19.8886706', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324809512287731712, 'SqlServer-连接查询', 'SqlServer-连接查询', 'SqlServer-连接查询', '<h1 id="h1-u8FDEu63A5u67E5u8BE2"><a name="连接查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>连接查询</h1><p>Chloe 友好支持多表连接查询，一切都可以用 lambda 表达式操作，返回类型可以是自定义类型，也可以是匿名类型。强类型开发，编译可见错误，容错率高。<br><strong>1.建立连接：</strong></p>
<pre><code class="lang-csharp">var user_city_province = context.Query&lt;User&gt;()
                         .InnerJoin&lt;City&gt;((user, city) =&gt; user.CityId == city.Id)
                         .InnerJoin&lt;Province&gt;((user, city, province) =&gt; city.ProvinceId == province.Id);
</code></pre>
<p><strong>2.得到一个 IJoiningQuery 对象，就可以 Select 所需要的数据返回一个 IQuery 对象，然后就可以进行 Where、OrderBy、GroupBy、分页、聚合查询等操作：</strong><br>查出一个用户及其隶属的城市和省份的所有信息：</p>
<pre><code class="lang-csharp">/* 调用 Select 方法返回一个泛型为包含 User、City、Province 匿名类型的 IQuery 对象。
 * Select 方法也可以返回自定义类型 。
 */
var qq = user_city_province.Select((user, city, province) =&gt; new
{
    User = user,
    City = city,
    Province = province
});

/* 根据条件筛选，然后调用 ToList 就会返回一个泛型为 new { User = user, City = city, Province = province } 的 List 集合 */
var result = qq.Where(a =&gt; a.User.Id == 1).ToList();

/*
 * 生成的 sql：
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[City].[Id] AS [Id0],[City].[Name] AS [Name0],[City].[ProvinceId] AS [ProvinceId],[Province].[Id] AS [Id1],[Province].[Name] AS [Name1] 
   FROM [Users] AS [Users] 
   INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
   WHERE [Users].[Id] = 1
 */

 /* 如果不想返回所有字段，得到 IQuery 对象后可以进一步 Select 指定的字段提高查询性能 
  * ##推荐使用此方式##
  */
var result1 = qq.Where(a =&gt; a.User.Id == 1)
                .Select(a =&gt; new { UserId = a.User.Id, UserName = a.User.Name, CityName = a.City.Name, ProvinceName = a.Province.Name })
                .ToList();
</code></pre>
<p>可以只获取指定的字段信息：</p>
<pre><code class="lang-csharp">user_city_province.Select((user, city, province) =&gt; new
{
    UserId = user.Id,
    UserName = user.Name,
    CityName = city.Name,
    ProvinceName = province.Name
}).Where(a =&gt; a.UserId == 1).ToList();

/*
 * 生成的 sql 只会包含 UserId、UserName、CityName、ProvinceName 四个字段
 * SELECT [Users].[Id] AS [UserId],[Users].[Name] AS [UserName],[City].[Name] AS [CityName],[Province].[Name] AS [ProvinceName] 
   FROM [Users] AS [Users] 
   INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
   WHERE [Users].[Id] = 1
 */
</code></pre>
<p><strong>快捷连接</strong><br>框架提供了快捷连接的接口：</p>
<pre><code class="lang-csharp">context.JoinQuery&lt;User, City, Province&gt;((user, city, province) =&gt; new object[] 
{
    JoinType.LeftJoin, user.CityId == city.Id,          /* 表 User 和 City 进行Left连接 */
    JoinType.LeftJoin, city.ProvinceId == province.Id   /* 表 City 和 Province 进行Left连接 */
})
.Select((user, city, province) =&gt; new { User = user, City = city, Province = province })  /* 投影成匿名对象 */
.Where(a =&gt; a.User.Id &gt; -1)     /* 进行条件过滤 */
.OrderByDesc(a =&gt; a.User.Age)   /* 排序 */
.TakePage(1, 20)                /* 分页 */
.ToList();
</code></pre>
<p>框架亦支持左连接、右连接和Full连接查询，用法和内连接相同。</p>
', '# 连接查询
Chloe 友好支持多表连接查询，一切都可以用 lambda 表达式操作，返回类型可以是自定义类型，也可以是匿名类型。强类型开发，编译可见错误，容错率高。
**1.建立连接：**
```csharp
var user_city_province = context.Query<User>()
                         .InnerJoin<City>((user, city) => user.CityId == city.Id)
                         .InnerJoin<Province>((user, city, province) => city.ProvinceId == province.Id);
```
**2.得到一个 IJoiningQuery 对象，就可以 Select 所需要的数据返回一个 IQuery 对象，然后就可以进行 Where、OrderBy、GroupBy、分页、聚合查询等操作：**
查出一个用户及其隶属的城市和省份的所有信息：
```csharp
/* 调用 Select 方法返回一个泛型为包含 User、City、Province 匿名类型的 IQuery 对象。
 * Select 方法也可以返回自定义类型 。
 */
var qq = user_city_province.Select((user, city, province) => new
{
    User = user,
    City = city,
    Province = province
});

/* 根据条件筛选，然后调用 ToList 就会返回一个泛型为 new { User = user, City = city, Province = province } 的 List 集合 */
var result = qq.Where(a => a.User.Id == 1).ToList();

/*
 * 生成的 sql：
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[City].[Id] AS [Id0],[City].[Name] AS [Name0],[City].[ProvinceId] AS [ProvinceId],[Province].[Id] AS [Id1],[Province].[Name] AS [Name1] 
   FROM [Users] AS [Users] 
   INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
   WHERE [Users].[Id] = 1
 */
 
 /* 如果不想返回所有字段，得到 IQuery 对象后可以进一步 Select 指定的字段提高查询性能 
  * ##推荐使用此方式##
  */
var result1 = qq.Where(a => a.User.Id == 1)
                .Select(a => new { UserId = a.User.Id, UserName = a.User.Name, CityName = a.City.Name, ProvinceName = a.Province.Name })
                .ToList();
```
可以只获取指定的字段信息：
```csharp
user_city_province.Select((user, city, province) => new
{
    UserId = user.Id,
    UserName = user.Name,
    CityName = city.Name,
    ProvinceName = province.Name
}).Where(a => a.UserId == 1).ToList();

/*
 * 生成的 sql 只会包含 UserId、UserName、CityName、ProvinceName 四个字段
 * SELECT [Users].[Id] AS [UserId],[Users].[Name] AS [UserName],[City].[Name] AS [CityName],[Province].[Name] AS [ProvinceName] 
   FROM [Users] AS [Users] 
   INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
   WHERE [Users].[Id] = 1
 */
```
**快捷连接**
框架提供了快捷连接的接口：
```csharp
context.JoinQuery<User, City, Province>((user, city, province) => new object[] 
{
    JoinType.LeftJoin, user.CityId == city.Id,          /* 表 User 和 City 进行Left连接 */
    JoinType.LeftJoin, city.ProvinceId == province.Id   /* 表 City 和 Province 进行Left连接 */
})
.Select((user, city, province) => new { User = user, City = city, Province = province })  /* 投影成匿名对象 */
.Where(a => a.User.Id > -1)     /* 进行条件过滤 */
.OrderByDesc(a => a.User.Age)   /* 排序 */
.TakePage(1, 20)                /* 分页 */
.ToList();
```
框架亦支持左连接、右连接和Full连接查询，用法和内连接相同。', '2016-12-01 17:26:00.723', '2017-06-18 18:20:18.9422395', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324832206215446528, 'SqlServer-分组查询', 'SqlServer-分组查询', 'SqlServer-分组查询', '<h1 id="h1-u5206u7EC4u67E5u8BE2"><a name="分组查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>分组查询</h1><p>Chloe 支持分组查询以及分组后 Having 过滤和聚合查询。</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

IGroupingQuery&lt;User&gt; g = q.Where(a =&gt; a.Id &gt; 0).GroupBy(a =&gt; a.Age);
// g = g.AndBy(a =&gt; a.Id);  //多个字段分组
g = g.Having(a =&gt; a.Age &gt; 1 &amp;&amp; Sql.Count() &gt; 0);

g.Select(a =&gt; new
{
    a.Age,
    Count = Sql.Count(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Avg = Sql.Average(a.Age)
}).ToList();
/*
 * SELECT [Users].[Age] AS [Age],COUNT(1) AS [Count],CAST(SUM([Users].[Age]) AS INT) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS FLOAT) AS [Avg] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] &gt; 0 
   GROUP BY [Users].[Age] 
   HAVING ([Users].[Age] &gt; 1 AND COUNT(1) &gt; 0)
 */
</code></pre>
', '# 分组查询
Chloe 支持分组查询以及分组后 Having 过滤和聚合查询。
```csharp
IQuery<User> q = context.Query<User>();

IGroupingQuery<User> g = q.Where(a => a.Id > 0).GroupBy(a => a.Age);
// g = g.AndBy(a => a.Id);  //多个字段分组
g = g.Having(a => a.Age > 1 && Sql.Count() > 0);

g.Select(a => new
{
    a.Age,
    Count = Sql.Count(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Avg = Sql.Average(a.Age)
}).ToList();
/*
 * SELECT [Users].[Age] AS [Age],COUNT(1) AS [Count],CAST(SUM([Users].[Age]) AS INT) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS FLOAT) AS [Avg] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] > 0 
   GROUP BY [Users].[Age] 
   HAVING ([Users].[Age] > 1 AND COUNT(1) > 0)
 */
```', '2016-12-01 18:56:11.377', '2016-12-02 19:11:06.997', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324833832581988352, 'SqlServer-聚合查询', 'SqlServer-聚合查询', 'SqlServer-聚合查询', '<h1 id="h1-u805Au5408u67E5u8BE2"><a name="聚合查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>聚合查询</h1><p>Chloe 可以像写 sql 一样实现聚合查询。</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

q.Select(a =&gt; AggregateFunctions.Count()).First();
/*
 * SELECT TOP (1) COUNT(1) AS [C] FROM [Users] AS [Users]
 */

/* 支持多个聚合函数 */
q.Select(a =&gt; new
{
    Count = Sql.Count(),
    LongCount = Sql.LongCount(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Average = Sql.Average(a.Age)
}).First();
/*
 * SELECT TOP (1) COUNT(1) AS [Count],COUNT_BIG(1) AS [LongCount],CAST(SUM([Users].[Age]) AS INT) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS FLOAT) AS [Average] 
   FROM [Users] AS [Users]
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users]
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT_BIG(1) AS [C] FROM [Users] AS [Users]
 */

var sum = q.Sum(a =&gt; a.Age);
/*
 * SELECT CAST(SUM([Users].[Age]) AS INT) AS [C] FROM [Users] AS [Users]
 */

var max = q.Max(a =&gt; a.Age);
/*
 * SELECT MAX([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var min = q.Min(a =&gt; a.Age);
/*
 * SELECT MIN([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var avg = q.Average(a =&gt; a.Age);
/*
 * SELECT CAST(AVG([Users].[Age]) AS FLOAT) AS [C] FROM [Users] AS [Users]
 */
</code></pre>
', '# 聚合查询
Chloe 可以像写 sql 一样实现聚合查询。
```csharp
IQuery<User> q = context.Query<User>();

q.Select(a => AggregateFunctions.Count()).First();
/*
 * SELECT TOP (1) COUNT(1) AS [C] FROM [Users] AS [Users]
 */

/* 支持多个聚合函数 */
q.Select(a => new
{
    Count = Sql.Count(),
    LongCount = Sql.LongCount(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Average = Sql.Average(a.Age)
}).First();
/*
 * SELECT TOP (1) COUNT(1) AS [Count],COUNT_BIG(1) AS [LongCount],CAST(SUM([Users].[Age]) AS INT) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS FLOAT) AS [Average] 
   FROM [Users] AS [Users]
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users]
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT_BIG(1) AS [C] FROM [Users] AS [Users]
 */

var sum = q.Sum(a => a.Age);
/*
 * SELECT CAST(SUM([Users].[Age]) AS INT) AS [C] FROM [Users] AS [Users]
 */

var max = q.Max(a => a.Age);
/*
 * SELECT MAX([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var min = q.Min(a => a.Age);
/*
 * SELECT MIN([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var avg = q.Average(a => a.Age);
/*
 * SELECT CAST(AVG([Users].[Age]) AS FLOAT) AS [C] FROM [Users] AS [Users]
 */
```', '2016-12-01 19:02:39.133', '2016-12-01 19:05:32.787', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324834901575860224, 'SqlServer-执行Sql', 'SqlServer-执行Sql', 'SqlServer-执行Sql', '<h1 id="h1--sql"><a name="执行Sql" class="reference-link"></a><span class="header-link octicon octicon-link"></span>执行Sql</h1><p>对于一些极其复杂的 sql 查询，还是得依赖原生 sql，因此，Chloe 提供了原生 sql 查询接口。<br><strong>获取满足条件的用户信息，将结果映射到 User 类上：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;select * from Users where Age&gt;@age&quot;, new DbParam(&quot;@age&quot;, 18)).ToList();
</code></pre>
<p><strong>获取满足条件的用户 Id：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;int&gt;(&quot;select Id from Users where Age&gt;@age&quot;, new DbParam(&quot;@age&quot;, 18)).ToList();
</code></pre>
<p><strong>支持存储过程：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;Proc_Test&quot;, CommandType.StoredProcedure, new DbParam(&quot;@age&quot;, 18)).ToList();
</code></pre>
<p><strong>支持dynamic：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;dynamic&gt;(&quot;select Id,Name from Users where Age&gt;@age&quot;, new DbParam(&quot;@age&quot;, 18)).ToList();
</code></pre>
<p><strong>传参方式2：</strong><br>该方法为扩展方法，定义在 Chloe.Extension.dll 中。</p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;select * from Users where Id=@Id&quot;, new { Id = 1 }).ToList();
</code></pre>
<p><strong>获取 DataTable：</strong><br>ExecuteDataTable 扩展方法位于 <a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs</a> 类中。</p>
<pre><code class="lang-csharp">DataTable dt = context.Session.ExecuteDataTable(&quot;select * from users where age&gt;=@age&quot;, new { age = 18 });
</code></pre>
<p><strong>FormatSqlQuery（仅.NET Core版本支持）：</strong><br>FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化，方法定义位于 <a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs</a> 类中。</p>
<pre><code class="lang-csharp">int age = 18;
List&lt;User&gt; users = context.FormatSqlQuery&lt;User&gt;($&quot;select * from Users where age&gt;={age}&quot;).ToList();

//或者
FormattableString sql = $&quot;select * from Users where age&gt;={age}&quot;; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery&lt;User&gt;(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 @P_0 = 18;
   select * from Users where age&gt;=@P_0
 */
</code></pre>
<p><strong>ado.net：</strong><br>基本的 ado.net 接口定义在 DbContext.Session 对象中。</p>
<pre><code class="lang-csharp">int rowsAffected = context.Session.ExecuteNonQuery(&quot;update Users set Age=18 where Id=1&quot;);
IDataReader dataReader = context.Session.ExecuteReader(&quot;select * from Users where Age&gt;18&quot;);
</code></pre>
', '# 执行Sql
对于一些极其复杂的 sql 查询，还是得依赖原生 sql，因此，Chloe 提供了原生 sql 查询接口。
**获取满足条件的用户信息，将结果映射到 User 类上：**
```csharp
context.SqlQuery<User>("select * from Users where Age>@age", new DbParam("@age", 18)).ToList();
```
**获取满足条件的用户 Id：**
```csharp
context.SqlQuery<int>("select Id from Users where Age>@age", new DbParam("@age", 18)).ToList();
```
**支持存储过程：**
```csharp
context.SqlQuery<User>("Proc_Test", CommandType.StoredProcedure, new DbParam("@age", 18)).ToList();
```
**支持dynamic：**
```csharp
context.SqlQuery<dynamic>("select Id,Name from Users where Age>@age", new DbParam("@age", 18)).ToList();
```
**传参方式2：**
该方法为扩展方法，定义在 Chloe.Extension.dll 中。
```csharp
context.SqlQuery<User>("select * from Users where Id=@Id", new { Id = 1 }).ToList();
```
**获取 DataTable：**
ExecuteDataTable 扩展方法位于 https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs 类中。
```csharp
DataTable dt = context.Session.ExecuteDataTable("select * from users where age>=@age", new { age = 18 });
```
**FormatSqlQuery（仅.NET Core版本支持）：**
FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化，方法定义位于 https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs 类中。
```csharp
int age = 18;
List<User> users = context.FormatSqlQuery<User>($"select * from Users where age>={age}").ToList();

//或者
FormattableString sql = $"select * from Users where age>={age}"; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery<User>(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 @P_0 = 18;
   select * from Users where age>=@P_0
 */
```
**ado.net：**
基本的 ado.net 接口定义在 DbContext.Session 对象中。
```csharp
int rowsAffected = context.Session.ExecuteNonQuery("update Users set Age=18 where Id=1");
IDataReader dataReader = context.Session.ExecuteReader("select * from Users where Age>18");
```', '2016-12-01 19:06:54.003', '2016-12-01 19:16:32.583', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324837619082199040, 'SqlServer-插入数据', 'SqlServer-插入数据', 'SqlServer-插入数据', '<h1 id="h1-u63D2u5165u6570u636E"><a name="插入数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>插入数据</h1><p>Chloe 具备多种插入数据的方式。<br><strong>1.实体插入：</strong><br>该方式插入，如果一个实体存在自增列，会自动将自增列设置到相应的属性上。</p>
<pre><code class="lang-csharp">User user = new User();
user.Name = &quot;lu&quot;;
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = DateTime.Now;

/* 会自动将自增 Id 设置到 user 的 Id 属性上 */
user = context.Insert(user);
/*
 * String @P_0 = &#39;lu&#39;;
   Gender @P_1 = Man;
   Int32 @P_2 = 18;
   Int32 @P_3 = 1;
   DateTime @P_4 = &#39;2016/8/26 18:41:08&#39;;
   INSERT INTO [Users]([Name],[Gender],[Age],[CityId],[OpTime]) 
   VALUES(@P_0,@P_1,@P_2,@P_3,@P_4);SELECT @@IDENTITY
 */
</code></pre>
<p><strong>2.lambda 方式插入：</strong><br>此种方式插入的好处是，可以指定列插入，就像写 sql 一样简单。<br>同时，该方式插入返回表主键值。如果实体主键是自增列，返回值就会是自增值。</p>
<pre><code class="lang-csharp">/* 返回主键 Id */
int id = (int)context.Insert&lt;User&gt;(() =&gt; new User()
{
    Name = &quot;lu&quot;,
    Age = 18,
    Gender = Gender.Man,
    CityId = 1,
    OpTime = DateTime.Now
});
/*
 * INSERT INTO [Users]([Name],[Age],[Gender],[CityId],[OpTime]) 
   VALUES(N&#39;lu&#39;,18,1,1,GETDATE());SELECT @@IDENTITY
 */
</code></pre>
<p><strong>BulkInsert：</strong><br>Chloe.SqlServer.BulkInsert() 方法可以将大批量的数据插入 SqlServer，内部实现基于 SqlBulkCopy。方法定义位于<a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.SqlServer/MsSqlContext.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.SqlServer/MsSqlContext.cs</a> 。<br>使用方式如下：</p>
<pre><code class="lang-csharp">List&lt;TestEntity&gt; entities = new List&lt;TestEntity&gt;();
for (int i = 0; i &lt; 100000; i++)
{
    entities.Add(new TestEntity()
    {
        F_Byte = 1,
        F_Int16 = 1,
        F_Int32 = i,
        F_Int64 = i,
        F_Double = i,
        F_Float = i,
        F_Decimal = i,
        F_Bool = true,
        F_DateTime = DateTime.Now,
        F_String = &quot;lu&quot; + i.ToString()
    });
}

using (MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString))
{
    context.BulkInsert(entities);
}
</code></pre>
', '# 插入数据
Chloe 具备多种插入数据的方式。
**1.实体插入：**
该方式插入，如果一个实体存在自增列，会自动将自增列设置到相应的属性上。
```csharp
User user = new User();
user.Name = "lu";
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = DateTime.Now;

/* 会自动将自增 Id 设置到 user 的 Id 属性上 */
user = context.Insert(user);
/*
 * String @P_0 = ''lu'';
   Gender @P_1 = Man;
   Int32 @P_2 = 18;
   Int32 @P_3 = 1;
   DateTime @P_4 = ''2016/8/26 18:41:08'';
   INSERT INTO [Users]([Name],[Gender],[Age],[CityId],[OpTime]) 
   VALUES(@P_0,@P_1,@P_2,@P_3,@P_4);SELECT @@IDENTITY
 */
```
**2.lambda 方式插入：**
此种方式插入的好处是，可以指定列插入，就像写 sql 一样简单。
同时，该方式插入返回表主键值。如果实体主键是自增列，返回值就会是自增值。
```csharp
/* 返回主键 Id */
int id = (int)context.Insert<User>(() => new User()
{
    Name = "lu",
    Age = 18,
    Gender = Gender.Man,
    CityId = 1,
    OpTime = DateTime.Now
});
/*
 * INSERT INTO [Users]([Name],[Age],[Gender],[CityId],[OpTime]) 
   VALUES(N''lu'',18,1,1,GETDATE());SELECT @@IDENTITY
 */
```
**BulkInsert：**
Chloe.SqlServer.BulkInsert() 方法可以将大批量的数据插入 SqlServer，内部实现基于 SqlBulkCopy。方法定义位于https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.SqlServer/MsSqlContext.cs 。
使用方式如下：
```csharp
List<TestEntity> entities = new List<TestEntity>();
for (int i = 0; i < 100000; i++)
{
    entities.Add(new TestEntity()
    {
        F_Byte = 1,
        F_Int16 = 1,
        F_Int32 = i,
        F_Int64 = i,
        F_Double = i,
        F_Float = i,
        F_Decimal = i,
        F_Bool = true,
        F_DateTime = DateTime.Now,
        F_String = "lu" + i.ToString()
    });
}

using (MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString))
{
    context.BulkInsert(entities);
}
```', '2016-12-01 19:17:41.907', '2016-12-04 11:55:02.9987851', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324837696316112896, 'SqlServer-更新数据', 'SqlServer-更新数据', 'SqlServer-更新数据', '<h1 id="h1-u66F4u65B0u6570u636E"><a name="更新数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>更新数据</h1><p>Chloe 支持两种数据更新方式。<br><strong>1.实体更新：</strong></p>
<pre><code class="lang-csharp">User user = new User();
user.Id = 1;
user.Name = &quot;lu&quot;;
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

/* 更新所有映射的字段 */
context.Update(user);
/*
 * String @P_0 = &#39;lu&#39;;
   Gender @P_1 = Man;
   Int32 @P_2 = 28;
   Nullable&lt;Int32&gt; @P_3 = NULL;
   DateTime @P_4 = &#39;2016/8/26 18:18:36&#39;;
   Int32 @P_5 = 1;
   UPDATE [Users] SET [Name]=@P_0,[Gender]=@P_1,[Age]=@P_2,[CityId]=@P_3,[OpTime]=@P_4 
   WHERE [Users].[Id] = @P_5
 */
</code></pre>
<p>由于 user 对象未被上下文跟踪，这会使所有的映射列都会被更新。Chloe 也支持类似 EF 一样只更新被修改过的属性。</p>
<pre><code class="lang-csharp">/*
 * 支持只更新属性值已变的属性
 */

/* 在修改实体属性前让上下文跟踪实体 */
context.TrackEntity(user);

/* 然后再修改实体属性 */
user.Name = user.Name + &quot;1&quot;;

/* 然后调用 Update 方法，这时只会更新被修改过的属性 */
context.Update(user);
/*
 * String @P_0 = &#39;lu1&#39;;
   Int32 @P_1 = 1;
   UPDATE [Users] SET [Name]=@P_0 WHERE [Users].[Id] = @P_1
 */
</code></pre>
<p><strong>2.lambda 方式更新：</strong><br>该方式解决的问题是：1.指定列更新；2.批量更新；3.支持类似 Age=Age + 100 这样更新字段。用法如下：</p>
<pre><code class="lang-csharp">context.Update&lt;User&gt;(a =&gt; a.Age &gt; 18, a =&gt; new User()
{
    Name = a.Name,
    Age = a.Age + 100,
    Gender = Gender.Man,
    OpTime = DateTime.Now
});
/*
 * UPDATE [Users] SET [Name]=[Users].[Name],[Age]=([Users].[Age] + 100),[Gender]=1,[OpTime]=GETDATE() 
   WHERE [Users].[Age] &gt; 18
 */
</code></pre>
', '# 更新数据
Chloe 支持两种数据更新方式。
**1.实体更新：**
```csharp
User user = new User();
user.Id = 1;
user.Name = "lu";
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

/* 更新所有映射的字段 */
context.Update(user);
/*
 * String @P_0 = ''lu'';
   Gender @P_1 = Man;
   Int32 @P_2 = 28;
   Nullable<Int32> @P_3 = NULL;
   DateTime @P_4 = ''2016/8/26 18:18:36'';
   Int32 @P_5 = 1;
   UPDATE [Users] SET [Name]=@P_0,[Gender]=@P_1,[Age]=@P_2,[CityId]=@P_3,[OpTime]=@P_4 
   WHERE [Users].[Id] = @P_5
 */
```
由于 user 对象未被上下文跟踪，这会使所有的映射列都会被更新。Chloe 也支持类似 EF 一样只更新被修改过的属性。
```csharp
/*
 * 支持只更新属性值已变的属性
 */

/* 在修改实体属性前让上下文跟踪实体 */
context.TrackEntity(user);

/* 然后再修改实体属性 */
user.Name = user.Name + "1";

/* 然后调用 Update 方法，这时只会更新被修改过的属性 */
context.Update(user);
/*
 * String @P_0 = ''lu1'';
   Int32 @P_1 = 1;
   UPDATE [Users] SET [Name]=@P_0 WHERE [Users].[Id] = @P_1
 */
```
**2.lambda 方式更新：**
该方式解决的问题是：1.指定列更新；2.批量更新；3.支持类似 Age=Age + 100 这样更新字段。用法如下：
```csharp
context.Update<User>(a => a.Age > 18, a => new User()
{
    Name = a.Name,
    Age = a.Age + 100,
    Gender = Gender.Man,
    OpTime = DateTime.Now
});
/*
 * UPDATE [Users] SET [Name]=[Users].[Name],[Age]=([Users].[Age] + 100),[Gender]=1,[OpTime]=GETDATE() 
   WHERE [Users].[Age] > 18
 */
```', '2016-12-01 19:18:00.32', '2016-12-02 19:20:01.823', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324837762527395840, 'SqlServer-删除数据', 'SqlServer-删除数据', 'SqlServer-删除数据', '<h1 id="h1-u5220u9664u6570u636E"><a name="删除数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>删除数据</h1><p>Chloe 支持两种数据删除方式。<br><strong>1.实体删除：</strong><br>该方式删除必须要求实体拥有一个主键，否则会报异常提示。</p>
<pre><code class="lang-csharp">User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 @P_0 = 1;
   DELETE [Users] WHERE [Users].[Id] = @P_0
 */
</code></pre>
<p><strong>2.lambda 方式删除：</strong><br>使用该方式可以删除单条数据，也可以删除多条数据。</p>
<pre><code class="lang-csharp">/* 删除单条数据 */
context.Delete&lt;User&gt;(a =&gt; a.Id == 1);
/*
 * DELETE [Users] WHERE [Users].[Id] = 1
 */

/* 批量删除满足条件的数据 */
context.Delete&lt;User&gt;(a =&gt; a.Age &gt; 18);
/*
 * DELETE [Users] WHERE [Users].[Age] &gt; 18
 */
</code></pre>
', '# 删除数据
Chloe 支持两种数据删除方式。
**1.实体删除：**
该方式删除必须要求实体拥有一个主键，否则会报异常提示。
```csharp
User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 @P_0 = 1;
   DELETE [Users] WHERE [Users].[Id] = @P_0
 */
```
**2.lambda 方式删除：**
使用该方式可以删除单条数据，也可以删除多条数据。
```csharp
/* 删除单条数据 */
context.Delete<User>(a => a.Id == 1);
/*
 * DELETE [Users] WHERE [Users].[Id] = 1
 */

/* 批量删除满足条件的数据 */
context.Delete<User>(a => a.Age > 18);
/*
 * DELETE [Users] WHERE [Users].[Age] > 18
 */
```', '2016-12-01 19:18:16.107', '2016-12-02 11:19:15.613', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324837828717707264, 'SqlServer-存储过程', 'SqlServer-存储过程', 'SqlServer-存储过程', '<h1 id="h1-u5B58u50A8u8FC7u7A0B"><a name="存储过程" class="reference-link"></a><span class="header-link octicon octicon-link"></span>存储过程</h1><p>Chloe 支持存储过程以及 output 参数。<br><strong>通过存储过程获取一个 User 信息：</strong></p>
<pre><code class="lang-csharp">DbParam id = new DbParam(&quot;@id&quot;, 1);
User user = context.SqlQuery&lt;User&gt;(&quot;Proc_GetUser&quot;, CommandType.StoredProcedure, id).FirstOrDefault();
</code></pre>
<p><strong>通过存储过程的 output 参数获取一个用户的 name：</strong></p>
<pre><code class="lang-csharp">DbParam id = new DbParam(&quot;@id&quot;, 1);
DbParam outputName = new DbParam(&quot;@name&quot;, null, typeof(string)) { Direction = ParamDirection.Output };
context.Session.ExecuteNonQuery(&quot;Proc_GetUserName&quot;, CommandType.StoredProcedure, id, outputName);
</code></pre>
', '# 存储过程
Chloe 支持存储过程以及 output 参数。
**通过存储过程获取一个 User 信息：**
```csharp
DbParam id = new DbParam("@id", 1);
User user = context.SqlQuery<User>("Proc_GetUser", CommandType.StoredProcedure, id).FirstOrDefault();
```
**通过存储过程的 output 参数获取一个用户的 name：**
```csharp
DbParam id = new DbParam("@id", 1);
DbParam outputName = new DbParam("@name", null, typeof(string)) { Direction = ParamDirection.Output };
context.Session.ExecuteNonQuery("Proc_GetUserName", CommandType.StoredProcedure, id, outputName);
```', '2016-12-01 19:18:31.887', '2016-12-02 14:19:29.897', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3324837890621440000, 'SqlServer-事务', 'SqlServer-事务', 'SqlServer-事务', '<h1 id="h1-u4E8Bu52A1u652Fu6301"><a name="事务支持" class="reference-link"></a><span class="header-link octicon octicon-link"></span>事务支持</h1><p><strong>基本用法：</strong></p>
<pre><code class="lang-csharp">using (MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString))
{
    try
    {
        context.Session.BeginTransaction();

        /* do some things here */
        context.Update(user);
        context.Delete&lt;User&gt;(a =&gt; a.Gender == null);

        context.Session.CommitTransaction();
    }
    catch
    {
        if (context.Session.IsInTransaction)
            context.Session.RollbackTransaction();
        throw;
    }
}
</code></pre>
', '# 事务支持
**基本用法：**
```csharp
using (MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString))
{
    try
    {
        context.Session.BeginTransaction();

        /* do some things here */
        context.Update(user);
        context.Delete<User>(a => a.Gender == null);

        context.Session.CommitTransaction();
    }
    catch
    {
        if (context.Session.IsInTransaction)
            context.Session.RollbackTransaction();
        throw;
    }
}
```', '2016-12-01 19:18:46.647', '2016-12-02 14:24:54.48', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325141727961939968, 'SqlServer-常用函数', 'SqlServer-常用函数', 'SqlServer-常用函数', '<h1 id="h1-u5E38u7528u51FDu6570"><a name="常用函数" class="reference-link"></a><span class="header-link octicon octicon-link"></span>常用函数</h1><p><strong>Chloe 对很多数据库函数支持很丰富，具体用法如下：</strong></p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

var space = new char[] { &#39; &#39; };

DateTime startTime = DateTime.Now;
DateTime endTime = DateTime.Now.AddDays(1);
q.Select(a =&gt; new
{
    Id = a.Id,

    String_Length = (int?)a.Name.Length,//LEN([Users].[Name])
    Substring = a.Name.Substring(0),//SUBSTRING([Users].[Name],0 + 1,LEN([Users].[Name]))
    Substring1 = a.Name.Substring(1),//SUBSTRING([Users].[Name],1 + 1,LEN([Users].[Name]))
    Substring1_2 = a.Name.Substring(1, 2),//SUBSTRING([Users].[Name],1 + 1,2)
    ToLower = a.Name.ToLower(),//LOWER([Users].[Name])
    ToUpper = a.Name.ToUpper(),//UPPER([Users].[Name])
    IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//too long
    Contains = (bool?)a.Name.Contains(&quot;s&quot;),//
    Trim = a.Name.Trim(),//RTRIM(LTRIM([Users].[Name]))
    TrimStart = a.Name.TrimStart(space),//LTRIM([Users].[Name])
    TrimEnd = a.Name.TrimEnd(space),//RTRIM([Users].[Name])
    StartsWith = (bool?)a.Name.StartsWith(&quot;s&quot;),//
    EndsWith = (bool?)a.Name.EndsWith(&quot;s&quot;),//

    DiffYears = DbFunctions.DiffYears(startTime, endTime),//DATEDIFF(YEAR,@P_0,@P_1)
    DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//DATEDIFF(MONTH,@P_0,@P_1)
    DiffDays = DbFunctions.DiffDays(startTime, endTime),//DATEDIFF(DAY,@P_0,@P_1)
    DiffHours = DbFunctions.DiffHours(startTime, endTime),//DATEDIFF(HOUR,@P_0,@P_1)
    DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//DATEDIFF(MINUTE,@P_0,@P_1)
    DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//DATEDIFF(SECOND,@P_0,@P_1)
    DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//DATEDIFF(MILLISECOND,@P_0,@P_1)
    //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//DATEDIFF(MICROSECOND,@P_0,@P_1)  Exception

    AddYears = startTime.AddYears(1),//DATEADD(YEAR,1,@P_0)
    AddMonths = startTime.AddMonths(1),//DATEADD(MONTH,1,@P_0)
    AddDays = startTime.AddDays(1),//DATEADD(DAY,1,@P_0)
    AddHours = startTime.AddHours(1),//DATEADD(HOUR,1,@P_0)
    AddMinutes = startTime.AddMinutes(2),//DATEADD(MINUTE,2,@P_0)
    AddSeconds = startTime.AddSeconds(120),//DATEADD(SECOND,120,@P_0)
    AddMilliseconds = startTime.AddMilliseconds(20000),//DATEADD(MILLISECOND,20000,@P_0)

    Now = DateTime.Now,//GETDATE()
    UtcNow = DateTime.UtcNow,//GETUTCDATE()
    Today = DateTime.Today,//CAST(GETDATE() AS DATE)
    Date = DateTime.Now.Date,//CAST(GETDATE() AS DATE)
    Year = DateTime.Now.Year,//DATEPART(YEAR,GETDATE())
    Month = DateTime.Now.Month,//DATEPART(MONTH,GETDATE())
    Day = DateTime.Now.Day,//DATEPART(DAY,GETDATE())
    Hour = DateTime.Now.Hour,//DATEPART(HOUR,GETDATE())
    Minute = DateTime.Now.Minute,//DATEPART(MINUTE,GETDATE())
    Second = DateTime.Now.Second,//DATEPART(SECOND,GETDATE())
    Millisecond = DateTime.Now.Millisecond,//DATEPART(MILLISECOND,GETDATE())
    DayOfWeek = DateTime.Now.DayOfWeek,//(DATEPART(WEEKDAY,GETDATE()) - 1)

    Int_Parse = int.Parse(&quot;1&quot;),//CAST(N&#39;1&#39; AS INT)
    Int16_Parse = Int16.Parse(&quot;11&quot;),//CAST(N&#39;11&#39; AS SMALLINT)
    Long_Parse = long.Parse(&quot;2&quot;),//CAST(N&#39;2&#39; AS BIGINT)
    Double_Parse = double.Parse(&quot;3&quot;),//CAST(N&#39;3&#39; AS FLOAT)
    Float_Parse = float.Parse(&quot;4&quot;),//CAST(N&#39;4&#39; AS REAL)
    //Decimal_Parse = decimal.Parse(&quot;5&quot;),//CAST(N&#39;5&#39; AS DECIMAL)  ps: &#39;Decimal.Parse(string s)&#39; is not supported now,because we don&#39;t know the precision and scale information.
    Guid_Parse = Guid.Parse(&quot;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&quot;),//CAST(N&#39;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&#39; AS UNIQUEIDENTIFIER) AS [Guid_Parse]

    Bool_Parse = bool.Parse(&quot;1&quot;),//CASE WHEN CAST(N&#39;1&#39; AS BIT) = CAST(1 AS BIT) THEN CAST(1 AS BIT) WHEN NOT (CAST(N&#39;1&#39; AS BIT) = CAST(1 AS BIT)) THEN CAST(0 AS BIT) ELSE NULL END AS [Bool_Parse]
    DateTime_Parse = DateTime.Parse(&quot;1992-1-16&quot;),//CAST(N&#39;1992-1-16&#39; AS DATETIME) AS [DateTime_Parse]

    B = a.Age == null ? false : a.Age &gt; 1,
}).ToList();
</code></pre>
<p>上述的函数可以用于 Select 方法，亦可用在 Where 或其它方法的 lambda 表达式树中，最终都会翻译成数据库函数。</p>
', '# 常用函数
**Chloe 对很多数据库函数支持很丰富，具体用法如下：**
```csharp
IQuery<User> q = context.Query<User>();

var space = new char[] { '' '' };

DateTime startTime = DateTime.Now;
DateTime endTime = DateTime.Now.AddDays(1);
q.Select(a => new
{
    Id = a.Id,

    String_Length = (int?)a.Name.Length,//LEN([Users].[Name])
    Substring = a.Name.Substring(0),//SUBSTRING([Users].[Name],0 + 1,LEN([Users].[Name]))
    Substring1 = a.Name.Substring(1),//SUBSTRING([Users].[Name],1 + 1,LEN([Users].[Name]))
    Substring1_2 = a.Name.Substring(1, 2),//SUBSTRING([Users].[Name],1 + 1,2)
    ToLower = a.Name.ToLower(),//LOWER([Users].[Name])
    ToUpper = a.Name.ToUpper(),//UPPER([Users].[Name])
    IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//too long
    Contains = (bool?)a.Name.Contains("s"),//
    Trim = a.Name.Trim(),//RTRIM(LTRIM([Users].[Name]))
    TrimStart = a.Name.TrimStart(space),//LTRIM([Users].[Name])
    TrimEnd = a.Name.TrimEnd(space),//RTRIM([Users].[Name])
    StartsWith = (bool?)a.Name.StartsWith("s"),//
    EndsWith = (bool?)a.Name.EndsWith("s"),//

    DiffYears = DbFunctions.DiffYears(startTime, endTime),//DATEDIFF(YEAR,@P_0,@P_1)
    DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//DATEDIFF(MONTH,@P_0,@P_1)
    DiffDays = DbFunctions.DiffDays(startTime, endTime),//DATEDIFF(DAY,@P_0,@P_1)
    DiffHours = DbFunctions.DiffHours(startTime, endTime),//DATEDIFF(HOUR,@P_0,@P_1)
    DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//DATEDIFF(MINUTE,@P_0,@P_1)
    DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//DATEDIFF(SECOND,@P_0,@P_1)
    DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//DATEDIFF(MILLISECOND,@P_0,@P_1)
    //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//DATEDIFF(MICROSECOND,@P_0,@P_1)  Exception

    AddYears = startTime.AddYears(1),//DATEADD(YEAR,1,@P_0)
    AddMonths = startTime.AddMonths(1),//DATEADD(MONTH,1,@P_0)
    AddDays = startTime.AddDays(1),//DATEADD(DAY,1,@P_0)
    AddHours = startTime.AddHours(1),//DATEADD(HOUR,1,@P_0)
    AddMinutes = startTime.AddMinutes(2),//DATEADD(MINUTE,2,@P_0)
    AddSeconds = startTime.AddSeconds(120),//DATEADD(SECOND,120,@P_0)
    AddMilliseconds = startTime.AddMilliseconds(20000),//DATEADD(MILLISECOND,20000,@P_0)

    Now = DateTime.Now,//GETDATE()
    UtcNow = DateTime.UtcNow,//GETUTCDATE()
    Today = DateTime.Today,//CAST(GETDATE() AS DATE)
    Date = DateTime.Now.Date,//CAST(GETDATE() AS DATE)
    Year = DateTime.Now.Year,//DATEPART(YEAR,GETDATE())
    Month = DateTime.Now.Month,//DATEPART(MONTH,GETDATE())
    Day = DateTime.Now.Day,//DATEPART(DAY,GETDATE())
    Hour = DateTime.Now.Hour,//DATEPART(HOUR,GETDATE())
    Minute = DateTime.Now.Minute,//DATEPART(MINUTE,GETDATE())
    Second = DateTime.Now.Second,//DATEPART(SECOND,GETDATE())
    Millisecond = DateTime.Now.Millisecond,//DATEPART(MILLISECOND,GETDATE())
    DayOfWeek = DateTime.Now.DayOfWeek,//(DATEPART(WEEKDAY,GETDATE()) - 1)

    Int_Parse = int.Parse("1"),//CAST(N''1'' AS INT)
    Int16_Parse = Int16.Parse("11"),//CAST(N''11'' AS SMALLINT)
    Long_Parse = long.Parse("2"),//CAST(N''2'' AS BIGINT)
    Double_Parse = double.Parse("3"),//CAST(N''3'' AS FLOAT)
    Float_Parse = float.Parse("4"),//CAST(N''4'' AS REAL)
    //Decimal_Parse = decimal.Parse("5"),//CAST(N''5'' AS DECIMAL)  ps: ''Decimal.Parse(string s)'' is not supported now,because we don''t know the precision and scale information.
    Guid_Parse = Guid.Parse("D544BC4C-739E-4CD3-A3D3-7BF803FCE179"),//CAST(N''D544BC4C-739E-4CD3-A3D3-7BF803FCE179'' AS UNIQUEIDENTIFIER) AS [Guid_Parse]

    Bool_Parse = bool.Parse("1"),//CASE WHEN CAST(N''1'' AS BIT) = CAST(1 AS BIT) THEN CAST(1 AS BIT) WHEN NOT (CAST(N''1'' AS BIT) = CAST(1 AS BIT)) THEN CAST(0 AS BIT) ELSE NULL END AS [Bool_Parse]
    DateTime_Parse = DateTime.Parse("1992-1-16"),//CAST(N''1992-1-16'' AS DATETIME) AS [DateTime_Parse]

    B = a.Age == null ? false : a.Age > 1,
}).ToList();
```
上述的函数可以用于 Select 方法，亦可用在 Where 或其它方法的 lambda 表达式树中，最终都会翻译成数据库函数。', '2016-12-02 15:26:07.113', '2016-12-02 15:26:20.973', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325145692988506112, 'MySql-实体特性', 'MySql-实体特性', 'MySql-实体特性', '<h1 id="h1-u5B9Eu4F53u7279u6027"><a name="实体特性" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实体特性</h1><p>实体特性位于命名空间 <strong>Chloe.Entity</strong> 下。<br><strong>TableAttribute：</strong><br>Name：映射的表名。<br>实体对应的表默认是实体类名，如实体类型名与表名不一致，可通过该特性指定映射的表名。</p>
<pre><code class="lang-csharp">public class TableAttribute : Attribute
{
    public TableAttribute();
    public TableAttribute(string name);

    public string Name { get; set; }
    public string Schema { get; set; }
}
</code></pre>
<p><strong>ColumnAttribute：</strong><br>Name：映射的列名，如不指定，则默认使用属性名。<br>IsPrimaryKey：指示列是否为主键，默认为 false。<br><strong>当一个实体没显示指定主键的时候，Chloe 默认选择名为 Id 的属性（如果存在）作为主键列，与此同时，如果该实体也没有显式指定任何自增列并且 Id 属性为 Int16、Int32 或者 Int64 类型，则也会默认其为自增列。如若不是自增列，可使用特性 NonAutoIncrementAttribute 标记</strong>。</p>
<pre><code class="lang-csharp">public class ColumnAttribute : Attribute
{
    public ColumnAttribute();
    public ColumnAttribute(string name);

    public string Name { get; set; }
    public bool IsPrimaryKey { get; set; }
    public DbType DbType { get; set; }
    public int Length { get; set; }
}
</code></pre>
<p><strong>AutoIncrementAttribute：</strong><br>标记属性为自增列。在 MySql 中，一个实体不能指定多个自增列，否则会报异常提示。</p>
<pre><code class="lang-csharp">public class AutoIncrementAttribute : Attribute
{
    public AutoIncrementAttribute();
}
</code></pre>
<p><strong>NonAutoIncrementAttribute：</strong><br>标记属性为非自增列。</p>
<pre><code class="lang-csharp">public class NonAutoIncrementAttribute : Attribute
{
    public NonAutoIncrementAttribute();
}
</code></pre>
<p><strong>NotMappedAttribute：</strong><br>指示属性不映射任何列。</p>
<pre><code class="lang-csharp">public class NotMappedAttribute : Attribute
{
    public NotMappedAttribute();
}
</code></pre>
', '# 实体特性
实体特性位于命名空间 **Chloe.Entity** 下。
**TableAttribute：**
Name：映射的表名。
实体对应的表默认是实体类名，如实体类型名与表名不一致，可通过该特性指定映射的表名。
```csharp
public class TableAttribute : Attribute
{
    public TableAttribute();
    public TableAttribute(string name);

    public string Name { get; set; }
    public string Schema { get; set; }
}
```
**ColumnAttribute：**
Name：映射的列名，如不指定，则默认使用属性名。
IsPrimaryKey：指示列是否为主键，默认为 false。
**当一个实体没显示指定主键的时候，Chloe 默认选择名为 Id 的属性（如果存在）作为主键列，与此同时，如果该实体也没有显式指定任何自增列并且 Id 属性为 Int16、Int32 或者 Int64 类型，则也会默认其为自增列。如若不是自增列，可使用特性 NonAutoIncrementAttribute 标记**。
```csharp
public class ColumnAttribute : Attribute
{
    public ColumnAttribute();
    public ColumnAttribute(string name);

    public string Name { get; set; }
    public bool IsPrimaryKey { get; set; }
    public DbType DbType { get; set; }
    public int Length { get; set; }
}
```
**AutoIncrementAttribute：**
标记属性为自增列。在 MySql 中，一个实体不能指定多个自增列，否则会报异常提示。
```csharp
public class AutoIncrementAttribute : Attribute
{
    public AutoIncrementAttribute();
}
```
**NonAutoIncrementAttribute：**
标记属性为非自增列。
```csharp
public class NonAutoIncrementAttribute : Attribute
{
    public NonAutoIncrementAttribute();
}
```
**NotMappedAttribute：**
指示属性不映射任何列。
```csharp
public class NotMappedAttribute : Attribute
{
    public NotMappedAttribute();
}
```', '2016-12-02 15:41:52.447', '2017-07-06 21:10:02.044444', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325145777671503872, 'MySql-实体定义', 'MySql-实体定义', 'MySql-实体定义', '<h1 id="h1-u5B9Eu4F53u5B9Au4E49"><a name="实体定义" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实体定义</h1><p>实体为纯 POCO，支持可空类型以及枚举类型映射。</p>
<pre><code class="lang-csharp">public enum Gender
{
    Man = 1,
    Woman
}
</code></pre>
<pre><code class="lang-csharp">[TableAttribute(&quot;Users&quot;)]
public class User
{
    [ColumnAttribute(&quot;Id&quot;, IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }

    [NotMappedAttribute]
    public string NotMappedProperty { get; set; }
}
</code></pre>
<pre><code class="lang-csharp">public class City
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}
</code></pre>
<pre><code class="lang-csharp">public class Province
{
    public int Id { get; set; }
    public string Name { get; set; }
}
</code></pre>
', '# 实体定义
实体为纯 POCO，支持可空类型以及枚举类型映射。
```csharp
public enum Gender
{
    Man = 1,
    Woman
}
```
```csharp
[TableAttribute("Users")]
public class User
{
    [ColumnAttribute("Id", IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }

    [NotMappedAttribute]
    public string NotMappedProperty { get; set; }
}
```
```csharp
public class City
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}
```
```csharp
public class Province
{
    public int Id { get; set; }
    public string Name { get; set; }
}
```', '2016-12-02 15:42:12.637', '2016-12-02 16:33:40.963', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325145866628497408, 'MySql-创建DbContext', 'MySql-创建DbContext', 'MySql-创建DbContext', '<h1 id="h1--dbcontext"><a name="创建 DbContext" class="reference-link"></a><span class="header-link octicon octicon-link"></span>创建 DbContext</h1><p>对于 MySql 数据库，需要引用程序集 Chloe.dll 和 Chloe.MySql.dll 以及 <strong>MySql 的驱动</strong>，然后使用 Chloe.MySql.MySqlContext 创建上下文实例。<strong>注意：DbContext 实例非线程安全，不能设置为单例。同时，用完务必要将 DbContext 释放。</strong><br>因为框架本身需要与具体的数据库驱动解耦，所以 MySqlContext 构造函数需要一个 IDbConnectionFactory 的参数，IDbConnectionFactory 接口只有一个 CreateConnection() 方法，必须先建个类，实现 CreateConnection 方法。</p>
<pre><code class="lang-csharp">public class MySqlConnectionFactory : IDbConnectionFactory
{
    string _connString = null;
    public MySqlConnectionFactory(string connString)
    {
        this._connString = connString;
    }
    public IDbConnection CreateConnection()
    {
        IDbConnection conn = new MySqlConnection(this._connString);
        /*如果有必要需要包装一下驱动的 MySqlConnection*/
        //conn = new Chloe.MySql.ChloeMySqlConnection(conn); 
        return conn;

    }
}
</code></pre>
<p>接下来就可以创建 MySqlContext：</p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
MySqlContext context = new MySqlContext(new MySqlConnectionFactory(connString));
</code></pre>
<p>ASP.NET CORE 配置 Service：</p>
<pre><code class="lang-csharp">public void ConfigureServices(IServiceCollection services)
{
    //...

    services.AddScoped&lt;Chloe.IDbContext&gt;((serviceProvider) =&gt;
    {
        return new Chloe.MySql.MySqlContext(new MySqlConnectionFactory(&quot;Your connection string&quot;));
    });

    //...
}
</code></pre>
', '# 创建 DbContext
对于 MySql 数据库，需要引用程序集 Chloe.dll 和 Chloe.MySql.dll 以及 **MySql 的驱动**，然后使用 Chloe.MySql.MySqlContext 创建上下文实例。**注意：DbContext 实例非线程安全，不能设置为单例。同时，用完务必要将 DbContext 释放。**
因为框架本身需要与具体的数据库驱动解耦，所以 MySqlContext 构造函数需要一个 IDbConnectionFactory 的参数，IDbConnectionFactory 接口只有一个 CreateConnection() 方法，必须先建个类，实现 CreateConnection 方法。
```csharp
public class MySqlConnectionFactory : IDbConnectionFactory
{
    string _connString = null;
    public MySqlConnectionFactory(string connString)
    {
        this._connString = connString;
    }
    public IDbConnection CreateConnection()
    {
        IDbConnection conn = new MySqlConnection(this._connString);
        /*如果有必要需要包装一下驱动的 MySqlConnection*/
        //conn = new Chloe.MySql.ChloeMySqlConnection(conn); 
        return conn;

    }
}
```
接下来就可以创建 MySqlContext：
```csharp
string connString = "Your connection string";
MySqlContext context = new MySqlContext(new MySqlConnectionFactory(connString));
```
ASP.NET CORE 配置 Service：
```csharp
public void ConfigureServices(IServiceCollection services)
{
	//...
	
    services.AddScoped<Chloe.IDbContext>((serviceProvider) =>
    {
        return new Chloe.MySql.MySqlContext(new MySqlConnectionFactory("Your connection string"));
    });
   
    //...
}
```', '2016-12-02 15:42:33.847', '2016-12-02 19:00:13.09', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325145930688102400, 'MySql-基本查询', 'MySql-基本查询', 'MySql-基本查询', '<h1 id="h1-u57FAu672Cu67E5u8BE2"><a name="基本查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>基本查询</h1><p><strong>根据 Id 查询出一个 User 对象：</strong></p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
MySqlContext context = new MySqlContext(new MySqlConnectionFactory(connString));
IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

q.Where(a =&gt; a.Id == 1).FirstOrDefault();
/*
 *生成的 sql：
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` = 1 
   LIMIT 0,1
 */
</code></pre>
<p><strong>like 查询：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Name.Contains(&quot;so&quot;) || a.Name.StartsWith(&quot;s&quot;) || a.Name.EndsWith(&quot;o&quot;)).ToList();
/*
 * SELECT 
 *      `Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`,`Users`.`Id` AS `Id`,`Users`.`Name` AS `Name` 
 * FROM `Users` AS `Users` 
 * WHERE (`Users`.`Name` LIKE CONCAT(&#39;%&#39;,N&#39;so&#39;,&#39;%&#39;) OR `Users`.`Name` LIKE CONCAT(N&#39;s&#39;,&#39;%&#39;) OR `Users`.`Name` LIKE CONCAT(&#39;%&#39;,N&#39;o&#39;))
 */
</code></pre>
<p><strong>in 查询：</strong></p>
<pre><code class="lang-csharp">List&lt;int&gt; ids = new List&lt;int&gt;() { 1, 2, 3 };
q.Where(a =&gt; ids.Contains(a.Id)).ToList();
/*
 * Int32 ?P_0 = 1;
   Int32 ?P_1 = 2;
   Int32 ?P_2 = 3;
   SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` IN (?P_0,?P_1,?P_2)
 */

/* in 子查询 */
/* IQuery&lt;T&gt;.ToList().Contains() 方法组合就会生成 in 子查询 sql 语句 */
users = q.Where(a =&gt; context.Query&lt;City&gt;().Select(c =&gt; c.Id).ToList().Contains((int)a.CityId)).ToList(); 
/*
 * SELECT 
 *      `Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`,`Users`.`Id` AS `Id`,`Users`.`Name` AS `Name` 
 * FROM `Users` AS `Users` 
 * WHERE `Users`.`CityId` IN (SELECT `City`.`Id` AS `C` FROM `City` AS `City`)
 */
</code></pre>
<p><strong>可以选取指定的字段，返回一个匿名类型：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id == 1).Select(a =&gt; new { a.Id, a.Name }).FirstOrDefault();
/*
 * 只会生成包含 Id 和 Name 两个字段的 sql 语句：
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` = 1 
   LIMIT 0,1
 */
</code></pre>
<p><strong>排序：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).ThenBy(a =&gt; a.Id).ToList();
/*
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` &gt; 0 
   ORDER BY `Users`.`Age` ASC，`Id` ASC
 */
</code></pre>
<p><strong>分页：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).TakePage(1, 20).ToList();
/*
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` &gt; 0 
   ORDER BY `Users`.`Age` ASC 
   LIMIT 0,20
 */
</code></pre>
<p><strong>distinct 查询：</strong></p>
<pre><code class="lang-csharp">q.Select(a =&gt; new { a.Name }).Distinct().ToList();
/*
 * SELECT DISTINCT `Users`.`Name` AS `Name` FROM `Users` AS `Users`
 */
</code></pre>
<p><strong>exists 查询：</strong></p>
<pre><code class="lang-csharp">/* IQuery&lt;T&gt;.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query&lt;User&gt;().Where(a =&gt; context.Query&lt;City&gt;().Where(c =&gt; c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      `Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`,`Users`.`Id` AS `Id`,`Users`.`Name` AS `Name` 
 * FROM `Users` AS `Users` 
 * WHERE Exists (SELECT N&#39;1&#39; AS `C` FROM `City` AS `City` WHERE `City`.`Id` = `Users`.`CityId`)
 */
</code></pre>
<p>更多用法请查看<a href="/Wiki/Document/3325507078541279232" title="使用进阶">使用进阶</a>。</p>
', '# 基本查询
**根据 Id 查询出一个 User 对象：**
```csharp
string connString = "Your connection string";
MySqlContext context = new MySqlContext(new MySqlConnectionFactory(connString));
IQuery<User> q = context.Query<User>();

q.Where(a => a.Id == 1).FirstOrDefault();
/*
 *生成的 sql：
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` = 1 
   LIMIT 0,1
 */
```
**like 查询：**
```csharp
q.Where(a => a.Name.Contains("so") || a.Name.StartsWith("s") || a.Name.EndsWith("o")).ToList();
/*
 * SELECT 
 *      `Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`,`Users`.`Id` AS `Id`,`Users`.`Name` AS `Name` 
 * FROM `Users` AS `Users` 
 * WHERE (`Users`.`Name` LIKE CONCAT(''%'',N''so'',''%'') OR `Users`.`Name` LIKE CONCAT(N''s'',''%'') OR `Users`.`Name` LIKE CONCAT(''%'',N''o''))
 */
```
**in 查询：**
```csharp
List<int> ids = new List<int>() { 1, 2, 3 };
q.Where(a => ids.Contains(a.Id)).ToList();
/*
 * Int32 ?P_0 = 1;
   Int32 ?P_1 = 2;
   Int32 ?P_2 = 3;
   SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` IN (?P_0,?P_1,?P_2)
 */
 
/* in 子查询 */
/* IQuery<T>.ToList().Contains() 方法组合就会生成 in 子查询 sql 语句 */
users = q.Where(a => context.Query<City>().Select(c => c.Id).ToList().Contains((int)a.CityId)).ToList(); 
/*
 * SELECT 
 *      `Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`,`Users`.`Id` AS `Id`,`Users`.`Name` AS `Name` 
 * FROM `Users` AS `Users` 
 * WHERE `Users`.`CityId` IN (SELECT `City`.`Id` AS `C` FROM `City` AS `City`)
 */
```
**可以选取指定的字段，返回一个匿名类型：**
```csharp
q.Where(a => a.Id == 1).Select(a => new { a.Id, a.Name }).FirstOrDefault();
/*
 * 只会生成包含 Id 和 Name 两个字段的 sql 语句：
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` = 1 
   LIMIT 0,1
 */
```
**排序：**
```csharp
q.Where(a => a.Id > 0).OrderBy(a => a.Age).ThenBy(a => a.Id).ToList();
/*
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` > 0 
   ORDER BY `Users`.`Age` ASC，`Id` ASC
 */
```
**分页：**
```csharp
q.Where(a => a.Id > 0).OrderBy(a => a.Age).TakePage(1, 20).ToList();
/*
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` > 0 
   ORDER BY `Users`.`Age` ASC 
   LIMIT 0,20
 */
```
**distinct 查询：**
```csharp
q.Select(a => new { a.Name }).Distinct().ToList();
/*
 * SELECT DISTINCT `Users`.`Name` AS `Name` FROM `Users` AS `Users`
 */
```
**exists 查询：**
```csharp
/* IQuery<T>.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query<User>().Where(a => context.Query<City>().Where(c => c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      `Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`,`Users`.`Id` AS `Id`,`Users`.`Name` AS `Name` 
 * FROM `Users` AS `Users` 
 * WHERE Exists (SELECT N''1'' AS `C` FROM `City` AS `City` WHERE `City`.`Id` = `Users`.`CityId`)
 */
```
更多用法请查看[使用进阶](/Wiki/Document/3325507078541279232 "使用进阶")。', '2016-12-02 15:42:49.12', '2016-12-08 11:40:33.859356', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146061768491008, 'MySql-连接查询', 'MySql-连接查询', 'MySql-连接查询', '<h1 id="h1-u8FDEu63A5u67E5u8BE2"><a name="连接查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>连接查询</h1><p>Chloe 友好支持多表连接查询，一切都可以用 lambda 表达式操作，返回类型可以是自定义类型，也可以是匿名类型。强类型开发，编译可见错误，容错率高。<br><strong>1.建立连接：</strong></p>
<pre><code class="lang-csharp">var user_city_province = context.Query&lt;User&gt;()
                         .InnerJoin&lt;City&gt;((user, city) =&gt; user.CityId == city.Id)
                         .InnerJoin&lt;Province&gt;((user, city, province) =&gt; city.ProvinceId == province.Id);
</code></pre>
<p><strong>2.得到一个 IJoiningQuery 对象，就可以 Select 所需要的数据返回一个 IQuery 对象，然后就可以进行 Where、OrderBy、GroupBy、分页、聚合查询等操作：</strong><br>查出一个用户及其隶属的城市和省份的所有信息：</p>
<pre><code class="lang-csharp">/* 调用 Select 方法返回一个泛型为包含 User、City、Province 匿名类型的 IQuery 对象。
 * Select 方法也可以返回自定义类型 。
 */
var qq = user_city_province.Select((user, city, province) =&gt; new
{
    User = user,
    City = city,
    Province = province
});

/* 根据条件筛选，然后调用 ToList 就会返回一个泛型为 new { User = user, City = city, Province = province } 的 List 集合 */
var result = qq.Where(a =&gt; a.User.Id == 1).ToList();

/*
 * 生成的 sql：
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`,`City`.`Id` AS `Id0`,`City`.`Name` AS `Name0`,`City`.`ProvinceId` AS `ProvinceId`,`Province`.`Id` AS `Id1`,`Province`.`Name` AS `Name1` 
   FROM `Users` AS `Users` 
   INNER JOIN `City` AS `City` ON `Users`.`CityId` = `City`.`Id` 
   INNER JOIN `Province` AS `Province` ON `City`.`ProvinceId` = `Province`.`Id` 
   WHERE `Users`.`Id` = 1
 */

/* 如果不想返回所有字段，得到 IQuery 对象后可以进一步 Select 指定的字段提高查询性能 
 * ##推荐使用此方式##
 */
var result1 = qq.Where(a =&gt; a.User.Id == 1)
                .Select(a =&gt; new { UserId = a.User.Id, UserName = a.User.Name, CityName = a.City.Name, ProvinceName = a.Province.Name })
                .ToList();
</code></pre>
<p>可以只获取指定的字段信息：</p>
<pre><code class="lang-csharp">user_city_province.Select((user, city, province) =&gt; new
{
    UserId = user.Id,
    UserName = user.Name,
    CityName = city.Name,
    ProvinceName = province.Name
}).Where(a =&gt; a.UserId == 1).ToList();

/*
 * 生成的 sql 只会包含 UserId、UserName、CityName、ProvinceName 四个字段
 * SELECT `Users`.`Id` AS `UserId`,`Users`.`Name` AS `UserName`,`City`.`Name` AS `CityName`,`Province`.`Name` AS `ProvinceName` 
   FROM `Users` AS `Users` 
   INNER JOIN `City` AS `City` ON `Users`.`CityId` = `City`.`Id` 
   INNER JOIN `Province` AS `Province` ON `City`.`ProvinceId` = `Province`.`Id` 
   WHERE `Users`.`Id` = 1
 */
</code></pre>
<p><strong>快捷连接</strong><br>框架提供了快捷连接的接口：</p>
<pre><code class="lang-csharp">context.JoinQuery&lt;User, City, Province&gt;((user, city, province) =&gt; new object[] 
{
    JoinType.LeftJoin, user.CityId == city.Id,          /* 表 User 和 City 进行Left连接 */
    JoinType.LeftJoin, city.ProvinceId == province.Id   /* 表 City 和 Province 进行Left连接 */
})
.Select((user, city, province) =&gt; new { User = user, City = city, Province = province })  /* 投影成匿名对象 */
.Where(a =&gt; a.User.Id &gt; -1)     /* 进行条件过滤 */
.OrderByDesc(a =&gt; a.User.Age)   /* 排序 */
.TakePage(1, 20)                /* 分页 */
.ToList();
</code></pre>
<p>框架亦支持左连接、右连接查询，用法和内连接相同。</p>
', '# 连接查询
Chloe 友好支持多表连接查询，一切都可以用 lambda 表达式操作，返回类型可以是自定义类型，也可以是匿名类型。强类型开发，编译可见错误，容错率高。
**1.建立连接：**
```csharp
var user_city_province = context.Query<User>()
                         .InnerJoin<City>((user, city) => user.CityId == city.Id)
                         .InnerJoin<Province>((user, city, province) => city.ProvinceId == province.Id);
```
**2.得到一个 IJoiningQuery 对象，就可以 Select 所需要的数据返回一个 IQuery 对象，然后就可以进行 Where、OrderBy、GroupBy、分页、聚合查询等操作：**
查出一个用户及其隶属的城市和省份的所有信息：
```csharp
/* 调用 Select 方法返回一个泛型为包含 User、City、Province 匿名类型的 IQuery 对象。
 * Select 方法也可以返回自定义类型 。
 */
var qq = user_city_province.Select((user, city, province) => new
{
    User = user,
    City = city,
    Province = province
});

/* 根据条件筛选，然后调用 ToList 就会返回一个泛型为 new { User = user, City = city, Province = province } 的 List 集合 */
var result = qq.Where(a => a.User.Id == 1).ToList();

/*
 * 生成的 sql：
 * SELECT `Users`.`Id` AS `Id`,`Users`.`Name` AS `Name`,`Users`.`Gender` AS `Gender`,`Users`.`Age` AS `Age`,`Users`.`CityId` AS `CityId`,`Users`.`OpTime` AS `OpTime`,`City`.`Id` AS `Id0`,`City`.`Name` AS `Name0`,`City`.`ProvinceId` AS `ProvinceId`,`Province`.`Id` AS `Id1`,`Province`.`Name` AS `Name1` 
   FROM `Users` AS `Users` 
   INNER JOIN `City` AS `City` ON `Users`.`CityId` = `City`.`Id` 
   INNER JOIN `Province` AS `Province` ON `City`.`ProvinceId` = `Province`.`Id` 
   WHERE `Users`.`Id` = 1
 */
 
/* 如果不想返回所有字段，得到 IQuery 对象后可以进一步 Select 指定的字段提高查询性能 
 * ##推荐使用此方式##
 */
var result1 = qq.Where(a => a.User.Id == 1)
                .Select(a => new { UserId = a.User.Id, UserName = a.User.Name, CityName = a.City.Name, ProvinceName = a.Province.Name })
                .ToList();
```
可以只获取指定的字段信息：
```csharp
user_city_province.Select((user, city, province) => new
{
    UserId = user.Id,
    UserName = user.Name,
    CityName = city.Name,
    ProvinceName = province.Name
}).Where(a => a.UserId == 1).ToList();

/*
 * 生成的 sql 只会包含 UserId、UserName、CityName、ProvinceName 四个字段
 * SELECT `Users`.`Id` AS `UserId`,`Users`.`Name` AS `UserName`,`City`.`Name` AS `CityName`,`Province`.`Name` AS `ProvinceName` 
   FROM `Users` AS `Users` 
   INNER JOIN `City` AS `City` ON `Users`.`CityId` = `City`.`Id` 
   INNER JOIN `Province` AS `Province` ON `City`.`ProvinceId` = `Province`.`Id` 
   WHERE `Users`.`Id` = 1
 */
```
**快捷连接**
框架提供了快捷连接的接口：
```csharp
context.JoinQuery<User, City, Province>((user, city, province) => new object[] 
{
    JoinType.LeftJoin, user.CityId == city.Id,          /* 表 User 和 City 进行Left连接 */
    JoinType.LeftJoin, city.ProvinceId == province.Id   /* 表 City 和 Province 进行Left连接 */
})
.Select((user, city, province) => new { User = user, City = city, Province = province })  /* 投影成匿名对象 */
.Where(a => a.User.Id > -1)     /* 进行条件过滤 */
.OrderByDesc(a => a.User.Age)   /* 排序 */
.TakePage(1, 20)                /* 分页 */
.ToList();
```
框架亦支持左连接、右连接查询，用法和内连接相同。', '2016-12-02 15:43:20.373', '2017-06-18 18:20:58.5213967', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146123546394624, 'MySql-分组查询', 'MySql-分组查询', 'MySql-分组查询', '<h1 id="h1-u5206u7EC4u67E5u8BE2"><a name="分组查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>分组查询</h1><p>Chloe 支持分组查询以及分组后 Having 过滤和聚合查询。</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

IGroupingQuery&lt;User&gt; g = q.Where(a =&gt; a.Id &gt; 0).GroupBy(a =&gt; a.Age);
// g = g.AndBy(a =&gt; a.Id);  //多个字段分组
g = g.Having(a =&gt; a.Age &gt; 1 &amp;&amp; Sql.Count() &gt; 0);

g.Select(a =&gt; new
{
    a.Age,
    Count = Sql.Count(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Avg = Sql.Average(a.Age)
}).ToList();
/*
 * SELECT `Users`.`Age` AS `Age`,COUNT(1) AS `Count`,CAST(SUM(`Users`.`Age`) AS SIGNED) AS `Sum`,MAX(`Users`.`Age`) AS `Max`,MIN(`Users`.`Age`) AS `Min`,AVG(`Users`.`Age`) AS `Avg` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` &gt; 0 
   GROUP BY `Users`.`Age` 
   HAVING (`Users`.`Age` &gt; 1 AND COUNT(1) &gt; 0)
 */
</code></pre>
', '# 分组查询
Chloe 支持分组查询以及分组后 Having 过滤和聚合查询。
```csharp
IQuery<User> q = context.Query<User>();

IGroupingQuery<User> g = q.Where(a => a.Id > 0).GroupBy(a => a.Age);
// g = g.AndBy(a => a.Id);  //多个字段分组
g = g.Having(a => a.Age > 1 && Sql.Count() > 0);

g.Select(a => new
{
    a.Age,
    Count = Sql.Count(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Avg = Sql.Average(a.Age)
}).ToList();
/*
 * SELECT `Users`.`Age` AS `Age`,COUNT(1) AS `Count`,CAST(SUM(`Users`.`Age`) AS SIGNED) AS `Sum`,MAX(`Users`.`Age`) AS `Max`,MIN(`Users`.`Age`) AS `Min`,AVG(`Users`.`Age`) AS `Avg` 
   FROM `Users` AS `Users` 
   WHERE `Users`.`Id` > 0 
   GROUP BY `Users`.`Age` 
   HAVING (`Users`.`Age` > 1 AND COUNT(1) > 0)
 */
```', '2016-12-02 15:43:35.103', '2016-12-02 19:11:01.03', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146192995680256, 'MySql-聚合查询', 'MySql-聚合查询', 'MySql-聚合查询', '<h1 id="h1-u805Au5408u67E5u8BE2"><a name="聚合查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>聚合查询</h1><p>Chloe 可以像写 sql 一样实现聚合查询。</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

q.Select(a =&gt; Sql.Count()).First();
/*
 * SELECT COUNT(1) AS `C` FROM `Users` AS `Users` LIMIT 0,1
 */

/* 支持多个聚合函数 */
q.Select(a =&gt; new
{
    Count = Sql.Count(),
    LongCount = Sql.LongCount(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Average = Sql.Average(a.Age)
}).First();
/*
 * SELECT COUNT(1) AS `Count`,COUNT(1) AS `LongCount`,CAST(SUM(`Users`.`Age`) AS SIGNED) AS `Sum`,MAX(`Users`.`Age`) AS `Max`,MIN(`Users`.`Age`) AS `Min`,AVG(`Users`.`Age`) AS `Average` 
   FROM `Users` AS `Users` LIMIT 0,1
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS `C` FROM `Users` AS `Users`
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT(1) AS `C` FROM `Users` AS `Users`
 */

var sum = q.Sum(a =&gt; a.Age);
/*
 * SELECT CAST(SUM(`Users`.`Age`) AS SIGNED) AS `C` FROM `Users` AS `Users`
 */

var max = q.Max(a =&gt; a.Age);
/*
 * SELECT MAX(`Users`.`Age`) AS `C` FROM `Users` AS `Users`
 */

var min = q.Min(a =&gt; a.Age);
/*
 * SELECT MIN(`Users`.`Age`) AS `C` FROM `Users` AS `Users`
 */

var avg = q.Average(a =&gt; a.Age);
/*
 * SELECT AVG(`Users`.`Age`) AS `C` FROM `Users` AS `Users`
 */
</code></pre>
', '# 聚合查询
Chloe 可以像写 sql 一样实现聚合查询。
```csharp
IQuery<User> q = context.Query<User>();

q.Select(a => Sql.Count()).First();
/*
 * SELECT COUNT(1) AS `C` FROM `Users` AS `Users` LIMIT 0,1
 */

/* 支持多个聚合函数 */
q.Select(a => new
{
    Count = Sql.Count(),
    LongCount = Sql.LongCount(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Average = Sql.Average(a.Age)
}).First();
/*
 * SELECT COUNT(1) AS `Count`,COUNT(1) AS `LongCount`,CAST(SUM(`Users`.`Age`) AS SIGNED) AS `Sum`,MAX(`Users`.`Age`) AS `Max`,MIN(`Users`.`Age`) AS `Min`,AVG(`Users`.`Age`) AS `Average` 
   FROM `Users` AS `Users` LIMIT 0,1
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS `C` FROM `Users` AS `Users`
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT(1) AS `C` FROM `Users` AS `Users`
 */

var sum = q.Sum(a => a.Age);
/*
 * SELECT CAST(SUM(`Users`.`Age`) AS SIGNED) AS `C` FROM `Users` AS `Users`
 */

var max = q.Max(a => a.Age);
/*
 * SELECT MAX(`Users`.`Age`) AS `C` FROM `Users` AS `Users`
 */

var min = q.Min(a => a.Age);
/*
 * SELECT MIN(`Users`.`Age`) AS `C` FROM `Users` AS `Users`
 */

var avg = q.Average(a => a.Age);
/*
 * SELECT AVG(`Users`.`Age`) AS `C` FROM `Users` AS `Users`
 */
```', '2016-12-02 15:43:51.66', '2016-12-02 19:12:42.517', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146263711645696, 'MySql-执行Sql', 'MySql-执行Sql', 'MySql-执行Sql', '<h1 id="h1--sql"><a name="执行Sql" class="reference-link"></a><span class="header-link octicon octicon-link"></span>执行Sql</h1><p>对于一些极其复杂的 sql 查询，还是得依赖原生 sql，因此，Chloe 提供了原生 sql 查询接口。<br><strong>获取满足条件的用户信息，将结果映射到 User 类上：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;select * from Users where Age&gt;?age&quot;, new DbParam(&quot;?age&quot;, 18)).ToList();
</code></pre>
<p><strong>获取满足条件的用户 Id：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;int&gt;(&quot;select Id from Users where Age&gt;?age&quot;, new DbParam(&quot;?age&quot;, 18)).ToList();
</code></pre>
<p><strong>支持存储过程：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;Proc_Test&quot;, CommandType.StoredProcedure, new DbParam(&quot;?age&quot;, 18)).ToList();
</code></pre>
<p><strong>支持dynamic：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;dynamic&gt;(&quot;select Id,Name from Users where Age&gt;?age&quot;, new DbParam(&quot;?age&quot;, 18)).ToList();
</code></pre>
<p><strong>传参方式2：</strong><br>该方法为扩展方法，定义在 Chloe.Extension.dll 中。</p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;select * from Users where Id=?Id&quot;, new { Id = 1 }).ToList();
</code></pre>
<p><strong>获取 DataTable：</strong><br>ExecuteDataTable 扩展方法位于 <a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs</a> 类中。</p>
<pre><code class="lang-csharp">DataTable dt = context.Session.ExecuteDataTable(&quot;select * from users where age&gt;=@age&quot;, new { age = 18 });
</code></pre>
<p><strong>FormatSqlQuery（仅.NET Core版本支持）：</strong><br>FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化，方法定义位于 <a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs</a> 类中。</p>
<pre><code class="lang-csharp">int age = 18;
List&lt;User&gt; users = context.FormatSqlQuery&lt;User&gt;($&quot;select * from Users where age&gt;={age}&quot;).ToList();

//或者
FormattableString sql = $&quot;select * from Users where age&gt;={age}&quot;; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery&lt;User&gt;(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 ?P_0 = 18;
   select * from Users where age&gt;=?P_0
 */
</code></pre>
<p><strong>ado.net：</strong><br>基本的 ado.net 接口定义在 DbContext.Session 对象中。</p>
<pre><code class="lang-csharp">int rowsAffected = context.Session.ExecuteNonQuery(&quot;update Users set Age=18 where Id=1&quot;);
IDataReader dataReader = context.Session.ExecuteReader(&quot;select * from Users where Age&gt;18&quot;);
</code></pre>
', '# 执行Sql
对于一些极其复杂的 sql 查询，还是得依赖原生 sql，因此，Chloe 提供了原生 sql 查询接口。
**获取满足条件的用户信息，将结果映射到 User 类上：**
```csharp
context.SqlQuery<User>("select * from Users where Age>?age", new DbParam("?age", 18)).ToList();
```
**获取满足条件的用户 Id：**
```csharp
context.SqlQuery<int>("select Id from Users where Age>?age", new DbParam("?age", 18)).ToList();
```
**支持存储过程：**
```csharp
context.SqlQuery<User>("Proc_Test", CommandType.StoredProcedure, new DbParam("?age", 18)).ToList();
```
**支持dynamic：**
```csharp
context.SqlQuery<dynamic>("select Id,Name from Users where Age>?age", new DbParam("?age", 18)).ToList();
```
**传参方式2：**
该方法为扩展方法，定义在 Chloe.Extension.dll 中。
```csharp
context.SqlQuery<User>("select * from Users where Id=?Id", new { Id = 1 }).ToList();
```
**获取 DataTable：**
ExecuteDataTable 扩展方法位于 https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs 类中。
```csharp
DataTable dt = context.Session.ExecuteDataTable("select * from users where age>=@age", new { age = 18 });
```
**FormatSqlQuery（仅.NET Core版本支持）：**
FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化，方法定义位于 https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs 类中。
```csharp
int age = 18;
List<User> users = context.FormatSqlQuery<User>($"select * from Users where age>={age}").ToList();

//或者
FormattableString sql = $"select * from Users where age>={age}"; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery<User>(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 ?P_0 = 18;
   select * from Users where age>=?P_0
 */
```
**ado.net：**
基本的 ado.net 接口定义在 DbContext.Session 对象中。
```csharp
int rowsAffected = context.Session.ExecuteNonQuery("update Users set Age=18 where Id=1");
IDataReader dataReader = context.Session.ExecuteReader("select * from Users where Age>18");
```', '2016-12-02 15:44:08.52', '2016-12-02 19:13:57.143', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146327683170304, 'MySql-插入数据', 'MySql-插入数据', 'MySql-插入数据', '<h1 id="h1-u63D2u5165u6570u636E"><a name="插入数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>插入数据</h1><p>Chloe 具备多种插入数据的方式。<br><strong>1.实体插入：</strong><br>该方式插入，如果一个实体存在自增列，会自动将自增列设置到相应的属性上。</p>
<pre><code class="lang-csharp">User user = new User();
user.Name = &quot;lu&quot;;
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = DateTime.Now;

/* 会自动将自增 Id 设置到 user 的 Id 属性上 */
user = context.Insert(user);
/*
 * String ?P_0 = &#39;lu&#39;;
   Gender ?P_1 = Man;
   Int32 ?P_2 = 18;
   Int32 ?P_3 = 1;
   DateTime ?P_4 = &#39;2016/8/26 18:11:26&#39;;
   INSERT INTO `Users`(`Name`,`Gender`,`Age`,`CityId`,`OpTime`) 
   VALUES(?P_0,?P_1,?P_2,?P_3,?P_4);SELECT @@IDENTITY
 */
</code></pre>
<p><strong>2.lambda 方式插入：</strong><br>此种方式插入的好处是，可以指定列插入，就像写 sql 一样简单。<br>同时，该方式插入返回表主键值。如果实体主键是自增列，返回值就会是自增值。</p>
<pre><code class="lang-csharp">/* 返回主键 Id */
int id = (int)context.Insert&lt;User&gt;(() =&gt; new User()
{
    Name = &quot;lu&quot;,
    Age = 18,
    Gender = Gender.Man,
    CityId = 1,
    OpTime = DateTime.Now
});
/*
 * INSERT INTO `Users`(`Name`,`Age`,`Gender`,`CityId`,`OpTime`) 
   VALUES(N&#39;lu&#39;,18,1,1,NOW());SELECT @@IDENTITY
 */
</code></pre>
', '# 插入数据
Chloe 具备多种插入数据的方式。
**1.实体插入：**
该方式插入，如果一个实体存在自增列，会自动将自增列设置到相应的属性上。
```csharp
User user = new User();
user.Name = "lu";
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = DateTime.Now;

/* 会自动将自增 Id 设置到 user 的 Id 属性上 */
user = context.Insert(user);
/*
 * String ?P_0 = ''lu'';
   Gender ?P_1 = Man;
   Int32 ?P_2 = 18;
   Int32 ?P_3 = 1;
   DateTime ?P_4 = ''2016/8/26 18:11:26'';
   INSERT INTO `Users`(`Name`,`Gender`,`Age`,`CityId`,`OpTime`) 
   VALUES(?P_0,?P_1,?P_2,?P_3,?P_4);SELECT @@IDENTITY
 */
```
**2.lambda 方式插入：**
此种方式插入的好处是，可以指定列插入，就像写 sql 一样简单。
同时，该方式插入返回表主键值。如果实体主键是自增列，返回值就会是自增值。
```csharp
/* 返回主键 Id */
int id = (int)context.Insert<User>(() => new User()
{
    Name = "lu",
    Age = 18,
    Gender = Gender.Man,
    CityId = 1,
    OpTime = DateTime.Now
});
/*
 * INSERT INTO `Users`(`Name`,`Age`,`Gender`,`CityId`,`OpTime`) 
   VALUES(N''lu'',18,1,1,NOW());SELECT @@IDENTITY
 */
```', '2016-12-02 15:44:23.773', '2016-12-03 15:12:00.447', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146391176544256, 'MySql-更新数据', 'MySql-更新数据', 'MySql-更新数据', '<h1 id="h1-u66F4u65B0u6570u636E"><a name="更新数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>更新数据</h1><p>Chloe 支持两种数据更新方式。<br><strong>1.实体更新：</strong></p>
<pre><code class="lang-csharp">User user = new User();
user.Id = 1;
user.Name = &quot;lu&quot;;
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

/* 更新所有映射的字段 */
context.Update(user);
/*
 * String ?P_0 = &#39;lu&#39;;
   Gender ?P_1 = Man;
   Int32 ?P_2 = 28;
   Nullable&lt;Int32&gt; ?P_3 = NULL;
   DateTime ?P_4 = &#39;2016/8/26 18:18:36&#39;;
   Int32 ?P_5 = 1;
   UPDATE `Users` SET `Name`=?P_0,`Gender`=?P_1,`Age`=?P_2,`CityId`=?P_3,`OpTime`=?P_4 
   WHERE `Users`.`Id` = ?P_5
 */
</code></pre>
<p>由于 user 对象未被上下文跟踪，这会使所有的映射列都会被更新。Chloe 也支持类似 EF 一样只更新被修改过的属性。</p>
<pre><code class="lang-csharp">/*
 * 支持只更新属性值已变的属性
 */

/* 在修改实体属性前让上下文跟踪实体 */
context.TrackEntity(user);

/* 然后再修改实体属性 */
user.Name = user.Name + &quot;1&quot;;

/* 然后调用 Update 方法，这时只会更新被修改过的属性 */
context.Update(user);
/*
 * String ?P_0 = &#39;lu1&#39;;
   Int32 ?P_1 = 1;
   UPDATE `Users` SET `Name`=?P_0 WHERE `Users`.`Id` = ?P_1
 */
</code></pre>
<p><strong>2.lambda 方式更新：</strong><br>该方式解决的问题是：1.指定列更新；2.批量更新；3.支持类似 Age=Age + 100 这样更新字段。用法如下：</p>
<pre><code class="lang-csharp">context.Update&lt;User&gt;(a =&gt; a.Age &gt; 18, a =&gt; new User()
{
    Name = a.Name,
    Age = a.Age + 100,
    Gender = Gender.Man,
    OpTime = DateTime.Now
});
/*
 * UPDATE `Users` SET `Name`=`Users`.`Name`,`Age`=(`Users`.`Age` + 100),`Gender`=1,`OpTime`=NOW() 
   WHERE `Users`.`Age` &gt; 18
 */
</code></pre>
', '# 更新数据
Chloe 支持两种数据更新方式。
**1.实体更新：**
```csharp
User user = new User();
user.Id = 1;
user.Name = "lu";
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

/* 更新所有映射的字段 */
context.Update(user);
/*
 * String ?P_0 = ''lu'';
   Gender ?P_1 = Man;
   Int32 ?P_2 = 28;
   Nullable<Int32> ?P_3 = NULL;
   DateTime ?P_4 = ''2016/8/26 18:18:36'';
   Int32 ?P_5 = 1;
   UPDATE `Users` SET `Name`=?P_0,`Gender`=?P_1,`Age`=?P_2,`CityId`=?P_3,`OpTime`=?P_4 
   WHERE `Users`.`Id` = ?P_5
 */
```
由于 user 对象未被上下文跟踪，这会使所有的映射列都会被更新。Chloe 也支持类似 EF 一样只更新被修改过的属性。
```csharp
/*
 * 支持只更新属性值已变的属性
 */

/* 在修改实体属性前让上下文跟踪实体 */
context.TrackEntity(user);

/* 然后再修改实体属性 */
user.Name = user.Name + "1";

/* 然后调用 Update 方法，这时只会更新被修改过的属性 */
context.Update(user);
/*
 * String ?P_0 = ''lu1'';
   Int32 ?P_1 = 1;
   UPDATE `Users` SET `Name`=?P_0 WHERE `Users`.`Id` = ?P_1
 */
```
**2.lambda 方式更新：**
该方式解决的问题是：1.指定列更新；2.批量更新；3.支持类似 Age=Age + 100 这样更新字段。用法如下：
```csharp
context.Update<User>(a => a.Age > 18, a => new User()
{
    Name = a.Name,
    Age = a.Age + 100,
    Gender = Gender.Man,
    OpTime = DateTime.Now
});
/*
 * UPDATE `Users` SET `Name`=`Users`.`Name`,`Age`=(`Users`.`Age` + 100),`Gender`=1,`OpTime`=NOW() 
   WHERE `Users`.`Age` > 18
 */
```', '2016-12-02 15:44:38.91', '2016-12-02 19:21:37.63', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146449968103424, 'MySql-删除数据', 'MySql-删除数据', 'MySql-删除数据', '<h1 id="h1-u5220u9664u6570u636E"><a name="删除数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>删除数据</h1><p>Chloe 支持两种数据删除方式。<br><strong>1.实体删除：</strong><br>该方式删除必须要求实体拥有一个主键，否则会报异常提示。</p>
<pre><code class="lang-csharp">User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 ?P_0 = 1;
   DELETE `Users` FROM `Users` WHERE `Users`.`Id` = ?P_0
 */
</code></pre>
<p><strong>2.lambda 方式删除：</strong><br>使用该方式可以删除单条数据，也可以删除多条数据。</p>
<pre><code class="lang-csharp">/* 删除单条数据 */
context.Delete&lt;User&gt;(a =&gt; a.Id == 1);
/*
 * DELETE `Users` FROM `Users` WHERE `Users`.`Id` = 1
 */

/* 批量删除满足条件的数据 */
context.Delete&lt;User&gt;(a =&gt; a.Age &gt; 18);
/*
 * DELETE `Users` FROM `Users` WHERE `Users`.`Age` &gt; 18
 */
</code></pre>
', '# 删除数据
Chloe 支持两种数据删除方式。
**1.实体删除：**
该方式删除必须要求实体拥有一个主键，否则会报异常提示。
```csharp
User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 ?P_0 = 1;
   DELETE `Users` FROM `Users` WHERE `Users`.`Id` = ?P_0
 */
```
**2.lambda 方式删除：**
使用该方式可以删除单条数据，也可以删除多条数据。
```csharp
/* 删除单条数据 */
context.Delete<User>(a => a.Id == 1);
/*
 * DELETE `Users` FROM `Users` WHERE `Users`.`Id` = 1
 */

/* 批量删除满足条件的数据 */
context.Delete<User>(a => a.Age > 18);
/*
 * DELETE `Users` FROM `Users` WHERE `Users`.`Age` > 18
 */
```', '2016-12-02 15:44:52.927', '2016-12-02 19:24:17.923', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146546785222656, 'MySql-存储过程', 'MySql-存储过程', 'MySql-存储过程', '<h1 id="h1-u5B58u50A8u8FC7u7A0B"><a name="存储过程" class="reference-link"></a><span class="header-link octicon octicon-link"></span>存储过程</h1><p>Chloe 支持存储过程以及 output 参数。<br><strong>通过存储过程获取一个 User 信息：</strong></p>
<pre><code class="lang-csharp">DbParam id = new DbParam(&quot;?id&quot;, 1);
User user = context.SqlQuery&lt;User&gt;(&quot;Proc_GetUser&quot;, CommandType.StoredProcedure, id).FirstOrDefault();
</code></pre>
<p><strong>通过存储过程的 output 参数获取一个用户的 name：</strong></p>
<pre><code class="lang-csharp">DbParam id = new DbParam(&quot;?id&quot;, 1);
DbParam outputName = new DbParam(&quot;?name&quot;, null, typeof(string)) { Direction = ParamDirection.Output };
context.Session.ExecuteNonQuery(&quot;Proc_GetUserName&quot;, CommandType.StoredProcedure, id, outputName);
</code></pre>
', '# 存储过程
Chloe 支持存储过程以及 output 参数。
**通过存储过程获取一个 User 信息：**
```csharp
DbParam id = new DbParam("?id", 1);
User user = context.SqlQuery<User>("Proc_GetUser", CommandType.StoredProcedure, id).FirstOrDefault();
```
**通过存储过程的 output 参数获取一个用户的 name：**
```csharp
DbParam id = new DbParam("?id", 1);
DbParam outputName = new DbParam("?name", null, typeof(string)) { Direction = ParamDirection.Output };
context.Session.ExecuteNonQuery("Proc_GetUserName", CommandType.StoredProcedure, id, outputName);
```', '2016-12-02 15:45:16.01', '2016-12-02 19:25:10.75', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146606914764800, 'MySql-事务', 'MySql-事务', 'MySql-事务', '<h1 id="h1-u4E8Bu52A1u652Fu6301"><a name="事务支持" class="reference-link"></a><span class="header-link octicon octicon-link"></span>事务支持</h1><p><strong>基本用法：</strong></p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
using (MySqlContext context = new MySqlContext(new MySqlConnectionFactory(connString)))
{
    try
    {
        context.Session.BeginTransaction();

        /* do some things here */
        context.Update(user);
        context.Delete&lt;User&gt;(a =&gt; a.Gender == null);

        context.Session.CommitTransaction();
    }
    catch
    {
        if (context.Session.IsInTransaction)
            context.Session.RollbackTransaction();
        throw;
    }
}
</code></pre>
', '# 事务支持
**基本用法：**
```csharp
string connString = "Your connection string";
using (MySqlContext context = new MySqlContext(new MySqlConnectionFactory(connString)))
{
    try
    {
        context.Session.BeginTransaction();

        /* do some things here */
        context.Update(user);
        context.Delete<User>(a => a.Gender == null);

        context.Session.CommitTransaction();
    }
    catch
    {
        if (context.Session.IsInTransaction)
            context.Session.RollbackTransaction();
        throw;
    }
}
```', '2016-12-02 15:45:30.347', '2016-12-02 19:26:16', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325146654268456960, 'MySql-常用函数', 'MySql-常用函数', 'MySql-常用函数', '<h1 id="h1-u5E38u7528u51FDu6570"><a name="常用函数" class="reference-link"></a><span class="header-link octicon octicon-link"></span>常用函数</h1><p><strong>Chloe 对很多数据库函数支持很丰富，具体用法如下：</strong></p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

var space = new char[] { &#39; &#39; };

DateTime startTime = DateTime.Now;
DateTime endTime = DateTime.Now.AddDays(1);

var ret = q.Select(a =&gt; new
{
    Id = a.Id,

    String_Length = (int?)a.Name.Length,//LENGTH(`Users`.`Name`)
    Substring = a.Name.Substring(0),//SUBSTRING(`Users`.`Name`,0 + 1,LENGTH(`Users`.`Name`))
    Substring1 = a.Name.Substring(1),//SUBSTRING(`Users`.`Name`,1 + 1,LENGTH(`Users`.`Name`))
    Substring1_2 = a.Name.Substring(1, 2),//SUBSTRING(`Users`.`Name`,1 + 1,2)
    ToLower = a.Name.ToLower(),//LOWER(`Users`.`Name`)
    ToUpper = a.Name.ToUpper(),//UPPER(`Users`.`Name`)
    IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//CASE WHEN (`Users`.`Name` IS NULL OR `Users`.`Name` = N&#39;&#39;) THEN 1 ELSE 0 END = 1
    Contains = (bool?)a.Name.Contains(&quot;s&quot;),//`Users`.`Name` LIKE CONCAT(&#39;%&#39;,N&#39;s&#39;,&#39;%&#39;)
    Trim = a.Name.Trim(),//TRIM(`Users`.`Name`)
    TrimStart = a.Name.TrimStart(space),//LTRIM(`Users`.`Name`)
    TrimEnd = a.Name.TrimEnd(space),//RTRIM(`Users`.`Name`)
    StartsWith = (bool?)a.Name.StartsWith(&quot;s&quot;),//`Users`.`Name` LIKE CONCAT(N&#39;s&#39;,&#39;%&#39;)
    EndsWith = (bool?)a.Name.EndsWith(&quot;s&quot;),//`Users`.`Name` LIKE CONCAT(&#39;%&#39;,N&#39;s&#39;)

    DiffYears = DbFunctions.DiffYears(startTime, endTime),//TIMESTAMPDIFF(YEAR,?P_0,?P_1)
    DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//TIMESTAMPDIFF(MONTH,?P_0,?P_1)
    DiffDays = DbFunctions.DiffDays(startTime, endTime),//TIMESTAMPDIFF(DAY,?P_0,?P_1)
    DiffHours = DbFunctions.DiffHours(startTime, endTime),//TIMESTAMPDIFF(HOUR,?P_0,?P_1)
    DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//TIMESTAMPDIFF(MINUTE,?P_0,?P_1)
    DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//TIMESTAMPDIFF(SECOND,?P_0,?P_1)
    //DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//MySql 不支持 Millisecond
    //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//ex

    Now = DateTime.Now,//NOW()
    UtcNow = DateTime.UtcNow,//UTC_TIMESTAMP()
    Today = DateTime.Today,//CURDATE()
    Date = DateTime.Now.Date,//DATE(NOW())
    Year = DateTime.Now.Year,//YEAR(NOW())
    Month = DateTime.Now.Month,//MONTH(NOW())
    Day = DateTime.Now.Day,//DAY(NOW())
    Hour = DateTime.Now.Hour,//HOUR(NOW())
    Minute = DateTime.Now.Minute,//MINUTE(NOW())
    Second = DateTime.Now.Second,//SECOND(NOW())
    Millisecond = DateTime.Now.Millisecond,//?P_2 AS `Millisecond`
    DayOfWeek = DateTime.Now.DayOfWeek,//(DAYOFWEEK(NOW()) - 1)

    //Byte_Parse = byte.Parse(&quot;1&quot;),//不支持
    Int_Parse = int.Parse(&quot;1&quot;),//CAST(N&#39;1&#39; AS SIGNED)
    Int16_Parse = Int16.Parse(&quot;11&quot;),//CAST(N&#39;11&#39; AS SIGNED)
    Long_Parse = long.Parse(&quot;2&quot;),//CAST(N&#39;2&#39; AS SIGNED)
    //Double_Parse = double.Parse(&quot;3&quot;),//N&#39;3&#39; 不支持，否则可能会成为BUG
    //Float_Parse = float.Parse(&quot;4&quot;),//N&#39;4&#39; 不支持，否则可能会成为BUG
    //Decimal_Parse = decimal.Parse(&quot;5&quot;),//不支持
    Guid_Parse = Guid.Parse(&quot;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&quot;),//N&#39;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&#39;

    Bool_Parse = bool.Parse(&quot;1&quot;),//CAST(N&#39;1&#39; AS SIGNED)
    DateTime_Parse = DateTime.Parse(&quot;2014-1-1&quot;),//CAST(N&#39;2014-1-1&#39; AS DATETIME)
}).ToList();
</code></pre>
<p>上述的函数可以用于 Select 方法，亦可用在 Where 或其它方法的 lambda 表达式树中，最终都会翻译成数据库函数。</p>
', '# 常用函数
**Chloe 对很多数据库函数支持很丰富，具体用法如下：**
```csharp
IQuery<User> q = context.Query<User>();

var space = new char[] { '' '' };

DateTime startTime = DateTime.Now;
DateTime endTime = DateTime.Now.AddDays(1);

var ret = q.Select(a => new
{
    Id = a.Id,

    String_Length = (int?)a.Name.Length,//LENGTH(`Users`.`Name`)
    Substring = a.Name.Substring(0),//SUBSTRING(`Users`.`Name`,0 + 1,LENGTH(`Users`.`Name`))
    Substring1 = a.Name.Substring(1),//SUBSTRING(`Users`.`Name`,1 + 1,LENGTH(`Users`.`Name`))
    Substring1_2 = a.Name.Substring(1, 2),//SUBSTRING(`Users`.`Name`,1 + 1,2)
    ToLower = a.Name.ToLower(),//LOWER(`Users`.`Name`)
    ToUpper = a.Name.ToUpper(),//UPPER(`Users`.`Name`)
    IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//CASE WHEN (`Users`.`Name` IS NULL OR `Users`.`Name` = N'''') THEN 1 ELSE 0 END = 1
    Contains = (bool?)a.Name.Contains("s"),//`Users`.`Name` LIKE CONCAT(''%'',N''s'',''%'')
    Trim = a.Name.Trim(),//TRIM(`Users`.`Name`)
    TrimStart = a.Name.TrimStart(space),//LTRIM(`Users`.`Name`)
    TrimEnd = a.Name.TrimEnd(space),//RTRIM(`Users`.`Name`)
    StartsWith = (bool?)a.Name.StartsWith("s"),//`Users`.`Name` LIKE CONCAT(N''s'',''%'')
    EndsWith = (bool?)a.Name.EndsWith("s"),//`Users`.`Name` LIKE CONCAT(''%'',N''s'')

    DiffYears = DbFunctions.DiffYears(startTime, endTime),//TIMESTAMPDIFF(YEAR,?P_0,?P_1)
    DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//TIMESTAMPDIFF(MONTH,?P_0,?P_1)
    DiffDays = DbFunctions.DiffDays(startTime, endTime),//TIMESTAMPDIFF(DAY,?P_0,?P_1)
    DiffHours = DbFunctions.DiffHours(startTime, endTime),//TIMESTAMPDIFF(HOUR,?P_0,?P_1)
    DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//TIMESTAMPDIFF(MINUTE,?P_0,?P_1)
    DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//TIMESTAMPDIFF(SECOND,?P_0,?P_1)
    //DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//MySql 不支持 Millisecond
    //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//ex

    Now = DateTime.Now,//NOW()
    UtcNow = DateTime.UtcNow,//UTC_TIMESTAMP()
    Today = DateTime.Today,//CURDATE()
    Date = DateTime.Now.Date,//DATE(NOW())
    Year = DateTime.Now.Year,//YEAR(NOW())
    Month = DateTime.Now.Month,//MONTH(NOW())
    Day = DateTime.Now.Day,//DAY(NOW())
    Hour = DateTime.Now.Hour,//HOUR(NOW())
    Minute = DateTime.Now.Minute,//MINUTE(NOW())
    Second = DateTime.Now.Second,//SECOND(NOW())
    Millisecond = DateTime.Now.Millisecond,//?P_2 AS `Millisecond`
    DayOfWeek = DateTime.Now.DayOfWeek,//(DAYOFWEEK(NOW()) - 1)

    //Byte_Parse = byte.Parse("1"),//不支持
    Int_Parse = int.Parse("1"),//CAST(N''1'' AS SIGNED)
    Int16_Parse = Int16.Parse("11"),//CAST(N''11'' AS SIGNED)
    Long_Parse = long.Parse("2"),//CAST(N''2'' AS SIGNED)
    //Double_Parse = double.Parse("3"),//N''3'' 不支持，否则可能会成为BUG
    //Float_Parse = float.Parse("4"),//N''4'' 不支持，否则可能会成为BUG
    //Decimal_Parse = decimal.Parse("5"),//不支持
    Guid_Parse = Guid.Parse("D544BC4C-739E-4CD3-A3D3-7BF803FCE179"),//N''D544BC4C-739E-4CD3-A3D3-7BF803FCE179''

    Bool_Parse = bool.Parse("1"),//CAST(N''1'' AS SIGNED)
    DateTime_Parse = DateTime.Parse("2014-1-1"),//CAST(N''2014-1-1'' AS DATETIME)
}).ToList();
```
上述的函数可以用于 Select 方法，亦可用在 Where 或其它方法的 lambda 表达式树中，最终都会翻译成数据库函数。', '2016-12-02 15:45:41.637', '2016-12-02 19:27:18.32', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149150596562944, 'Oracle-实体特性', 'Oracle-实体特性', 'Oracle-实体特性', '<h1 id="h1-u5B9Eu4F53u7279u6027"><a name="实体特性" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实体特性</h1><p><strong>Chloe.Entity.TableAttribute：</strong><br>Name：映射的表名。<br>实体对应的表默认是实体类名，如实体类型名与表名不一致，可通过该特性指定映射的表名。</p>
<pre><code class="lang-csharp">public class TableAttribute : Attribute
{
    public TableAttribute();
    public TableAttribute(string name);

    public string Name { get; set; }
    public string Schema { get; set; }
}
</code></pre>
<p><strong>Chloe.Entity.ColumnAttribute：</strong><br>Name：映射的列名，如不指定，则默认使用属性名。<br>IsPrimaryKey：指示列是否为主键，默认为 false。<br><strong>当一个实体没显式指定主键的时候，Chloe 默认选择名为 Id 的属性（如果存在）作为主键列</strong>。</p>
<pre><code class="lang-csharp">public class ColumnAttribute : Attribute
{
    public ColumnAttribute();
    public ColumnAttribute(string name);

    public string Name { get; set; }
    public bool IsPrimaryKey { get; set; }
    public DbType DbType { get; set; }
    public int Length { get; set; }
}
</code></pre>
<p><strong>Chloe.Entity.SequenceAttribute：</strong><br>标记属性通过序列实现自增，需要指定序列名称。</p>
<pre><code class="lang-csharp">public class SequenceAttribute : Attribute
{
    public SequenceAttribute(string name);

    public string Name { get; }
}
</code></pre>
<p><strong>Chloe.Entity.NotMappedAttribute：</strong><br>指示属性不映射任何列。</p>
<pre><code class="lang-csharp">public class NotMappedAttribute : Attribute
{
    public NotMappedAttribute();
}
</code></pre>
', '# 实体特性
**Chloe.Entity.TableAttribute：**
Name：映射的表名。
实体对应的表默认是实体类名，如实体类型名与表名不一致，可通过该特性指定映射的表名。
```csharp
public class TableAttribute : Attribute
{
    public TableAttribute();
    public TableAttribute(string name);

    public string Name { get; set; }
    public string Schema { get; set; }
}
```
**Chloe.Entity.ColumnAttribute：**
Name：映射的列名，如不指定，则默认使用属性名。
IsPrimaryKey：指示列是否为主键，默认为 false。
**当一个实体没显式指定主键的时候，Chloe 默认选择名为 Id 的属性（如果存在）作为主键列**。
```csharp
public class ColumnAttribute : Attribute
{
    public ColumnAttribute();
    public ColumnAttribute(string name);

    public string Name { get; set; }
    public bool IsPrimaryKey { get; set; }
    public DbType DbType { get; set; }
    public int Length { get; set; }
}
```
**Chloe.Entity.SequenceAttribute：**
标记属性通过序列实现自增，需要指定序列名称。
```csharp
public class SequenceAttribute : Attribute
{
    public SequenceAttribute(string name);

    public string Name { get; }
}
```
**Chloe.Entity.NotMappedAttribute：**
指示属性不映射任何列。
```csharp
public class NotMappedAttribute : Attribute
{
    public NotMappedAttribute();
}
```', '2016-12-02 15:55:36.807', '2017-07-06 21:12:01.754923', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149206355640320, 'Oracle-实体定义', 'Oracle-实体定义', 'Oracle-实体定义', '<h1 id="h1-u5B9Eu4F53u5B9Au4E49"><a name="实体定义" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实体定义</h1><p>实体为纯 POCO，支持可空类型以及枚举类型映射。</p>
<pre><code class="lang-csharp">public enum Gender
{
    Man = 1,
    Woman
}
</code></pre>
<pre><code class="lang-csharp">[TableAttribute(&quot;Users&quot;)]
public class User
{
    [ColumnAttribute(&quot;ID&quot;, IsPrimaryKey = true)]
    [Sequence(&quot;USERS_AUTOID&quot;)]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }

    [NotMappedAttribute]
    public string NotMappedProperty { get; set; }
}
</code></pre>
<pre><code class="lang-csharp">public class City
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}
</code></pre>
<pre><code class="lang-csharp">public class Province
{
    public int Id { get; set; }
    public string Name { get; set; }
}
</code></pre>
', '# 实体定义
实体为纯 POCO，支持可空类型以及枚举类型映射。
```csharp
public enum Gender
{
    Man = 1,
    Woman
}
```
```csharp
[TableAttribute("Users")]
public class User
{
    [ColumnAttribute("ID", IsPrimaryKey = true)]
    [Sequence("USERS_AUTOID")]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }

    [NotMappedAttribute]
    public string NotMappedProperty { get; set; }
}
```
```csharp
public class City
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}
```
```csharp
public class Province
{
    public int Id { get; set; }
    public string Name { get; set; }
}
```', '2016-12-02 15:55:50.1', '2016-12-03 13:57:47.61', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149282020884480, 'Oracle-创建DbContext', 'Oracle-创建DbContext', 'Oracle-创建DbContext', '<h1 id="h1--dbcontext"><a name="创建 DbContext" class="reference-link"></a><span class="header-link octicon octicon-link"></span>创建 DbContext</h1><p>对于 Oracle 数据库，需要引用程序集 Chloe.dll 和 Chloe.Oracle.dll 以及 <strong>Oracle 的驱动</strong>，然后使用 Chloe.Oracle.OracleContext 创建上下文实例。<strong>注意：DbContext 实例非线程安全，不能设置为单例。同时，用完务必要将 DbContext 释放。</strong><br>因为框架本身需要与具体的数据库驱动解耦，所以 OracleContext 构造函数需要一个 IDbConnectionFactory 的参数，IDbConnectionFactory 接口只有一个 CreateConnection() 方法，必须先建个类，实现 CreateConnection 方法。</p>
<pre><code class="lang-csharp">public class OracleConnectionFactory : IDbConnectionFactory
{
    string _connString = null;
    public OracleConnectionFactory(string connString)
    {
        this._connString = connString;
    }
    public IDbConnection CreateConnection()
    {
        OracleConnection oracleConnection = new OracleConnection(this._connString);
        OracleConnectionDecorator conn = new OracleConnectionDecorator(oracleConnection);
        return conn;
    }
}
</code></pre>
<p>由于笔者使用的是 Oracle.ManagedDataAccess 数据库驱动，OracleConnection 创建的 DbCommand 默认是以顺序方式绑定参数，所以，上述例子使用了装饰者模式对 OracleConnection 封装了一遍，主要就是修改 DbCommand 参数绑定方式。OracleConnectionDecorator 定义如下：</p>
<pre><code class="lang-csharp">class OracleConnectionDecorator : IDbConnection, IDisposable
{
    private OracleConnection _oracleConnection;
    public OracleConnectionDecorator(OracleConnection oracleConnection)
    {
        if (oracleConnection == null)
            throw new Exception(&quot;Please call 911.&quot;);
        _oracleConnection = oracleConnection;
    }

    public string ConnectionString
    {
        get { return _oracleConnection.ConnectionString; }
        set { _oracleConnection.ConnectionString = value; }
    }
    public int ConnectionTimeout
    {
        get { return _oracleConnection.ConnectionTimeout; }
    }
    public string Database
    {
        get { return _oracleConnection.Database; }
    }
    public ConnectionState State
    {
        get { return _oracleConnection.State; }
    }

    public IDbTransaction BeginTransaction()
    {
        return _oracleConnection.BeginTransaction();
    }
    public IDbTransaction BeginTransaction(IsolationLevel il)
    {
        return _oracleConnection.BeginTransaction(il);
    }
    public void ChangeDatabase(string databaseName)
    {
        _oracleConnection.ChangeDatabase(databaseName);
    }
    public void Close()
    {
        _oracleConnection.Close();
    }
    public IDbCommand CreateCommand()
    {
        var cmd = _oracleConnection.CreateCommand();
        cmd.BindByName = true;
        return cmd;
    }
    public void Open()
    {
        _oracleConnection.Open();
    }

    public void Dispose()
    {
        _oracleConnection.Dispose();
    }
}
</code></pre>
<p>接下来就可以创建 OracleContext：</p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
OracleContext context = new OracleContext(new OracleConnectionFactory(connString));
</code></pre>
<p>OracleContext 生成 sql 语句时默认将所有字段转成大写形式，如需要修改该默认设置，操作如下：</p>
<pre><code class="lang-csharp">context.ConvertToUppercase = false;
</code></pre>
<p>ASP.NET CORE 配置 Service：</p>
<pre><code class="lang-csharp">public void ConfigureServices(IServiceCollection services)
{
    //...

    services.AddScoped&lt;Chloe.IDbContext&gt;((serviceProvider) =&gt;
    {
        return new Chloe.Oracle.OracleContext(new OracleConnectionFactory(&quot;Your connection string&quot;));
    });

    //...
}
</code></pre>
', '# 创建 DbContext
对于 Oracle 数据库，需要引用程序集 Chloe.dll 和 Chloe.Oracle.dll 以及 **Oracle 的驱动**，然后使用 Chloe.Oracle.OracleContext 创建上下文实例。**注意：DbContext 实例非线程安全，不能设置为单例。同时，用完务必要将 DbContext 释放。**
因为框架本身需要与具体的数据库驱动解耦，所以 OracleContext 构造函数需要一个 IDbConnectionFactory 的参数，IDbConnectionFactory 接口只有一个 CreateConnection() 方法，必须先建个类，实现 CreateConnection 方法。
```csharp
public class OracleConnectionFactory : IDbConnectionFactory
{
    string _connString = null;
    public OracleConnectionFactory(string connString)
    {
        this._connString = connString;
    }
    public IDbConnection CreateConnection()
    {
        OracleConnection oracleConnection = new OracleConnection(this._connString);
        OracleConnectionDecorator conn = new OracleConnectionDecorator(oracleConnection);
        return conn;
    }
}
```
由于笔者使用的是 Oracle.ManagedDataAccess 数据库驱动，OracleConnection 创建的 DbCommand 默认是以顺序方式绑定参数，所以，上述例子使用了装饰者模式对 OracleConnection 封装了一遍，主要就是修改 DbCommand 参数绑定方式。OracleConnectionDecorator 定义如下：
```csharp
class OracleConnectionDecorator : IDbConnection, IDisposable
{
    private OracleConnection _oracleConnection;
    public OracleConnectionDecorator(OracleConnection oracleConnection)
    {
        if (oracleConnection == null)
            throw new Exception("Please call 911.");
        _oracleConnection = oracleConnection;
    }

    public string ConnectionString
    {
        get { return _oracleConnection.ConnectionString; }
        set { _oracleConnection.ConnectionString = value; }
    }
    public int ConnectionTimeout
    {
        get { return _oracleConnection.ConnectionTimeout; }
    }
    public string Database
    {
        get { return _oracleConnection.Database; }
    }
    public ConnectionState State
    {
        get { return _oracleConnection.State; }
    }

    public IDbTransaction BeginTransaction()
    {
        return _oracleConnection.BeginTransaction();
    }
    public IDbTransaction BeginTransaction(IsolationLevel il)
    {
        return _oracleConnection.BeginTransaction(il);
    }
    public void ChangeDatabase(string databaseName)
    {
        _oracleConnection.ChangeDatabase(databaseName);
    }
    public void Close()
    {
        _oracleConnection.Close();
    }
    public IDbCommand CreateCommand()
    {
        var cmd = _oracleConnection.CreateCommand();
        cmd.BindByName = true;
        return cmd;
    }
    public void Open()
    {
        _oracleConnection.Open();
    }

    public void Dispose()
    {
        _oracleConnection.Dispose();
    }
}
```
接下来就可以创建 OracleContext：
```csharp
string connString = "Your connection string";
OracleContext context = new OracleContext(new OracleConnectionFactory(connString));
```
OracleContext 生成 sql 语句时默认将所有字段转成大写形式，如需要修改该默认设置，操作如下：
```csharp
context.ConvertToUppercase = false;
```
ASP.NET CORE 配置 Service：
```csharp
public void ConfigureServices(IServiceCollection services)
{
	//...
	
    services.AddScoped<Chloe.IDbContext>((serviceProvider) =>
    {
        return new Chloe.Oracle.OracleContext(new OracleConnectionFactory("Your connection string"));
    });
   
    //...
}
```', '2016-12-02 15:56:08.14', '2016-12-04 22:09:57.99134', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149327977873408, 'Oracle-基本查询', 'Oracle-基本查询', 'Oracle-基本查询', '<h1 id="h1-u57FAu672Cu67E5u8BE2"><a name="基本查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>基本查询</h1><p><strong>根据 Id 查询出一个 User 对象：</strong></p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
OracleContext context = new OracleContext(new OracleConnectionFactory(connString));
IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

q.Where(a =&gt; a.Id == 1).FirstOrDefault();
/*
 *生成的 sql：
 * SELECT &quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot;,&quot;USERS&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;USERS&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;USERS&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot; 
   FROM &quot;USERS&quot; &quot;USERS&quot; 
   WHERE (&quot;USERS&quot;.&quot;ID&quot; = 1 AND ROWNUM &lt; 2)
 */
</code></pre>
<p><strong>like 查询：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Name.Contains(&quot;so&quot;) || a.Name.StartsWith(&quot;s&quot;) || a.Name.EndsWith(&quot;o&quot;)).ToList();
/*
 * SELECT 
 *      &quot;USERS&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;USERS&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;USERS&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot;,&quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot;
 * FROM &quot;USERS&quot; &quot;USERS&quot; 
 * WHERE (&quot;USERS&quot;.&quot;NAME&quot; LIKE &#39;%&#39; || N&#39;so&#39; || &#39;%&#39; OR &quot;USERS&quot;.&quot;NAME&quot; LIKE N&#39;s&#39; || &#39;%&#39; OR &quot;USERS&quot;.&quot;NAME&quot; LIKE &#39;%&#39; || N&#39;o&#39;)
 */
</code></pre>
<p><strong>in 查询：</strong></p>
<pre><code class="lang-csharp">List&lt;int&gt; ids = new List&lt;int&gt;() { 1, 2, 3 };
q.Where(a =&gt; ids.Contains(a.Id)).ToList();
/*
 * Int32 :P_0 = 1;
   Int32 :P_1 = 2;
   Int32 :P_2 = 3;
   SELECT &quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot;,&quot;USERS&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;USERS&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;USERS&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot; 
   FROM &quot;USERS&quot; &quot;USERS&quot; 
   WHERE &quot;USERS&quot;.&quot;ID&quot; IN (:P_0,:P_1,:P_2)
 */

/* in 子查询 */
/* IQuery&lt;T&gt;.ToList().Contains() 方法组合就会生成 in 子查询 sql 语句 */
users = q.Where(a =&gt; context.Query&lt;City&gt;().Select(c =&gt; c.Id).ToList().Contains((int)a.CityId)).ToList(); 
/*
 * SELECT 
 *      &quot;USERS&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;USERS&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;USERS&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot;,&quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot;
 * FROM &quot;USERS&quot; &quot;USERS&quot; 
 * WHERE &quot;USERS&quot;.&quot;CITYID&quot; IN (SELECT &quot;CITY&quot;.&quot;ID&quot; AS &quot;C&quot; FROM &quot;CITY&quot; &quot;CITY&quot;)
 */
</code></pre>
<p><strong>可以选取指定的字段，返回一个匿名类型：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id == 1).Select(a =&gt; new { a.Id, a.Name }).FirstOrDefault();
/*
 * 只会生成包含 Id 和 Name 两个字段的 sql 语句：
 * SELECT &quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot; 
   FROM &quot;USERS&quot; &quot;USERS&quot; 
   WHERE (&quot;USERS&quot;.&quot;ID&quot; = 1 AND ROWNUM &lt; 2)
 */
</code></pre>
<p><strong>排序：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).ThenBy(a =&gt; a.Id).ToList();
/*
 * SELECT &quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot;,&quot;USERS&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;USERS&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;USERS&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot; 
   FROM &quot;USERS&quot; &quot;USERS&quot; 
   WHERE &quot;USERS&quot;.&quot;ID&quot; &gt; 0 
   ORDER BY &quot;USERS&quot;.&quot;AGE&quot; ASC,&quot;USERS&quot;.&quot;ID&quot; ASC
 */
</code></pre>
<p><strong>分页：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).TakePage(1, 20).ToList();
/*
 * SELECT &quot;T&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;T&quot;.&quot;NAME&quot; AS &quot;NAME&quot;,&quot;T&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;T&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;T&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;T&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot; FROM (SELECT &quot;TTAKE&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;TTAKE&quot;.&quot;NAME&quot; AS &quot;NAME&quot;,&quot;TTAKE&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;TTAKE&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;TTAKE&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;TTAKE&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot;,ROWNUM AS &quot;ROW_NUMBER_0&quot; FROM (SELECT &quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot;,&quot;USERS&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;USERS&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;USERS&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot; FROM &quot;USERS&quot; &quot;USERS&quot; WHERE &quot;USERS&quot;.&quot;ID&quot; &gt; 0 ORDER BY &quot;USERS&quot;.&quot;AGE&quot; ASC) &quot;TTAKE&quot; WHERE ROWNUM &lt; 21) &quot;T&quot; WHERE &quot;T&quot;.&quot;ROW_NUMBER_0&quot; &gt; 0
 */
</code></pre>
<p><strong>distinct 查询：</strong></p>
<pre><code class="lang-csharp">q.Select(a =&gt; new { a.Name }).Distinct().ToList();
/*
 * SELECT DISTINCT &quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot; FROM &quot;USERS&quot; &quot;USERS&quot;
 */
</code></pre>
<p><strong>exists 查询：</strong></p>
<pre><code class="lang-csharp">/* IQuery&lt;T&gt;.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query&lt;User&gt;().Where(a =&gt; context.Query&lt;City&gt;().Where(c =&gt; c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      &quot;USERS&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;USERS&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;USERS&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot;,&quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot;
 * FROM &quot;USERS&quot; &quot;USERS&quot; 
 * WHERE Exists (SELECT N&#39;1&#39; AS &quot;C&quot; FROM &quot;CITY&quot; &quot;CITY&quot; WHERE &quot;CITY&quot;.&quot;ID&quot; = &quot;USERS&quot;.&quot;CITYID&quot;)
 */
</code></pre>
<p>更多用法请查看<a href="/Wiki/Document/3325507078541279232" title="使用进阶">使用进阶</a>。</p>
', '# 基本查询
**根据 Id 查询出一个 User 对象：**
```csharp
string connString = "Your connection string";
OracleContext context = new OracleContext(new OracleConnectionFactory(connString));
IQuery<User> q = context.Query<User>();

q.Where(a => a.Id == 1).FirstOrDefault();
/*
 *生成的 sql：
 * SELECT "USERS"."ID" AS "ID","USERS"."NAME" AS "NAME","USERS"."GENDER" AS "GENDER","USERS"."AGE" AS "AGE","USERS"."CITYID" AS "CITYID","USERS"."OPTIME" AS "OPTIME" 
   FROM "USERS" "USERS" 
   WHERE ("USERS"."ID" = 1 AND ROWNUM < 2)
 */
```
**like 查询：**
```csharp
q.Where(a => a.Name.Contains("so") || a.Name.StartsWith("s") || a.Name.EndsWith("o")).ToList();
/*
 * SELECT 
 *      "USERS"."GENDER" AS "GENDER","USERS"."AGE" AS "AGE","USERS"."CITYID" AS "CITYID","USERS"."OPTIME" AS "OPTIME","USERS"."ID" AS "ID","USERS"."NAME" AS "NAME"
 * FROM "USERS" "USERS" 
 * WHERE ("USERS"."NAME" LIKE ''%'' || N''so'' || ''%'' OR "USERS"."NAME" LIKE N''s'' || ''%'' OR "USERS"."NAME" LIKE ''%'' || N''o'')
 */
```
**in 查询：**
```csharp
List<int> ids = new List<int>() { 1, 2, 3 };
q.Where(a => ids.Contains(a.Id)).ToList();
/*
 * Int32 :P_0 = 1;
   Int32 :P_1 = 2;
   Int32 :P_2 = 3;
   SELECT "USERS"."ID" AS "ID","USERS"."NAME" AS "NAME","USERS"."GENDER" AS "GENDER","USERS"."AGE" AS "AGE","USERS"."CITYID" AS "CITYID","USERS"."OPTIME" AS "OPTIME" 
   FROM "USERS" "USERS" 
   WHERE "USERS"."ID" IN (:P_0,:P_1,:P_2)
 */
 
/* in 子查询 */
/* IQuery<T>.ToList().Contains() 方法组合就会生成 in 子查询 sql 语句 */
users = q.Where(a => context.Query<City>().Select(c => c.Id).ToList().Contains((int)a.CityId)).ToList(); 
/*
 * SELECT 
 *      "USERS"."GENDER" AS "GENDER","USERS"."AGE" AS "AGE","USERS"."CITYID" AS "CITYID","USERS"."OPTIME" AS "OPTIME","USERS"."ID" AS "ID","USERS"."NAME" AS "NAME"
 * FROM "USERS" "USERS" 
 * WHERE "USERS"."CITYID" IN (SELECT "CITY"."ID" AS "C" FROM "CITY" "CITY")
 */
```
**可以选取指定的字段，返回一个匿名类型：**
```csharp
q.Where(a => a.Id == 1).Select(a => new { a.Id, a.Name }).FirstOrDefault();
/*
 * 只会生成包含 Id 和 Name 两个字段的 sql 语句：
 * SELECT "USERS"."ID" AS "ID","USERS"."NAME" AS "NAME" 
   FROM "USERS" "USERS" 
   WHERE ("USERS"."ID" = 1 AND ROWNUM < 2)
 */
```
**排序：**
```csharp
q.Where(a => a.Id > 0).OrderBy(a => a.Age).ThenBy(a => a.Id).ToList();
/*
 * SELECT "USERS"."ID" AS "ID","USERS"."NAME" AS "NAME","USERS"."GENDER" AS "GENDER","USERS"."AGE" AS "AGE","USERS"."CITYID" AS "CITYID","USERS"."OPTIME" AS "OPTIME" 
   FROM "USERS" "USERS" 
   WHERE "USERS"."ID" > 0 
   ORDER BY "USERS"."AGE" ASC,"USERS"."ID" ASC
 */
```
**分页：**
```csharp
q.Where(a => a.Id > 0).OrderBy(a => a.Age).TakePage(1, 20).ToList();
/*
 * SELECT "T"."ID" AS "ID","T"."NAME" AS "NAME","T"."GENDER" AS "GENDER","T"."AGE" AS "AGE","T"."CITYID" AS "CITYID","T"."OPTIME" AS "OPTIME" FROM (SELECT "TTAKE"."ID" AS "ID","TTAKE"."NAME" AS "NAME","TTAKE"."GENDER" AS "GENDER","TTAKE"."AGE" AS "AGE","TTAKE"."CITYID" AS "CITYID","TTAKE"."OPTIME" AS "OPTIME",ROWNUM AS "ROW_NUMBER_0" FROM (SELECT "USERS"."ID" AS "ID","USERS"."NAME" AS "NAME","USERS"."GENDER" AS "GENDER","USERS"."AGE" AS "AGE","USERS"."CITYID" AS "CITYID","USERS"."OPTIME" AS "OPTIME" FROM "USERS" "USERS" WHERE "USERS"."ID" > 0 ORDER BY "USERS"."AGE" ASC) "TTAKE" WHERE ROWNUM < 21) "T" WHERE "T"."ROW_NUMBER_0" > 0
 */
```
**distinct 查询：**
```csharp
q.Select(a => new { a.Name }).Distinct().ToList();
/*
 * SELECT DISTINCT "USERS"."NAME" AS "NAME" FROM "USERS" "USERS"
 */
```
**exists 查询：**
```csharp
/* IQuery<T>.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query<User>().Where(a => context.Query<City>().Where(c => c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      "USERS"."GENDER" AS "GENDER","USERS"."AGE" AS "AGE","USERS"."CITYID" AS "CITYID","USERS"."OPTIME" AS "OPTIME","USERS"."ID" AS "ID","USERS"."NAME" AS "NAME"
 * FROM "USERS" "USERS" 
 * WHERE Exists (SELECT N''1'' AS "C" FROM "CITY" "CITY" WHERE "CITY"."ID" = "USERS"."CITYID")
 */
```
更多用法请查看[使用进阶](/Wiki/Document/3325507078541279232 "使用进阶")。', '2016-12-02 15:56:19.097', '2016-12-08 11:33:52.6174115', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149375134433280, 'Oracle-连接查询', 'Oracle-连接查询', 'Oracle-连接查询', '<h1 id="h1-u8FDEu63A5u67E5u8BE2"><a name="连接查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>连接查询</h1><p>Chloe 友好支持多表连接查询，一切都可以用 lambda 表达式操作，返回类型可以是自定义类型，也可以是匿名类型。强类型开发，编译可见错误，容错率高。<br><strong>1.建立连接：</strong></p>
<pre><code class="lang-csharp">var user_city_province = context.Query&lt;User&gt;()
                         .InnerJoin&lt;City&gt;((user, city) =&gt; user.CityId == city.Id)
                         .InnerJoin&lt;Province&gt;((user, city, province) =&gt; city.ProvinceId == province.Id);
</code></pre>
<p><strong>2.得到一个 IJoiningQuery 对象，就可以 Select 所需要的数据返回一个 IQuery 对象，然后就可以进行 Where、OrderBy、GroupBy、分页、聚合查询等操作：</strong><br>查出一个用户及其隶属的城市和省份的所有信息：</p>
<pre><code class="lang-csharp">/* 调用 Select 方法返回一个泛型为包含 User、City、Province 匿名类型的 IQuery 对象。
 * Select 方法也可以返回自定义类型 。
 */
var qq = user_city_province.Select((user, city, province) =&gt; new
{
    User = user,
    City = city,
    Province = province
});

/* 根据条件筛选，然后调用 ToList 就会返回一个泛型为 new { User = user, City = city, Province = province } 的 List 集合 */
var result = qq.Where(a =&gt; a.User.Id == 1).ToList();

/*
 * 生成的 sql：
 * SELECT &quot;USERS&quot;.&quot;ID&quot; AS &quot;ID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;NAME&quot;,&quot;USERS&quot;.&quot;GENDER&quot; AS &quot;GENDER&quot;,&quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,&quot;USERS&quot;.&quot;CITYID&quot; AS &quot;CITYID&quot;,&quot;USERS&quot;.&quot;OPTIME&quot; AS &quot;OPTIME&quot;,&quot;CITY&quot;.&quot;ID&quot; AS &quot;ID0&quot;,&quot;CITY&quot;.&quot;NAME&quot; AS &quot;NAME0&quot;,&quot;CITY&quot;.&quot;PROVINCEID&quot; AS &quot;PROVINCEID&quot;,&quot;PROVINCE&quot;.&quot;ID&quot; AS &quot;ID1&quot;,&quot;PROVINCE&quot;.&quot;NAME&quot; AS &quot;NAME1&quot; 
   FROM &quot;USERS&quot; &quot;USERS&quot; 
   INNER JOIN &quot;CITY&quot; &quot;CITY&quot; ON &quot;USERS&quot;.&quot;CITYID&quot; = &quot;CITY&quot;.&quot;ID&quot; 
   INNER JOIN &quot;PROVINCE&quot; &quot;PROVINCE&quot; ON &quot;CITY&quot;.&quot;PROVINCEID&quot; = &quot;PROVINCE&quot;.&quot;ID&quot; 
   WHERE &quot;USERS&quot;.&quot;ID&quot; = 1
 */

/* 如果不想返回所有字段，得到 IQuery 对象后可以进一步 Select 指定的字段提高查询性能 
 * ##推荐使用此方式##
 */
var result1 = qq.Where(a =&gt; a.User.Id == 1)
                .Select(a =&gt; new { UserId = a.User.Id, UserName = a.User.Name, CityName = a.City.Name, ProvinceName = a.Province.Name })
                .ToList();
</code></pre>
<p>可以只获取指定的字段信息：</p>
<pre><code class="lang-csharp">user_city_province.Select((user, city, province) =&gt; new
{
    UserId = user.Id,
    UserName = user.Name,
    CityName = city.Name,
    ProvinceName = province.Name
}).Where(a =&gt; a.UserId == 1).ToList();

/*
 * 生成的 sql 只会包含 UserId、UserName、CityName、ProvinceName 四个字段
 * SELECT &quot;USERS&quot;.&quot;ID&quot; AS &quot;USERID&quot;,&quot;USERS&quot;.&quot;NAME&quot; AS &quot;USERNAME&quot;,&quot;CITY&quot;.&quot;NAME&quot; AS &quot;CITYNAME&quot;,&quot;PROVINCE&quot;.&quot;NAME&quot; AS &quot;PROVINCENAME&quot; 
   FROM &quot;USERS&quot; &quot;USERS&quot; 
   INNER JOIN &quot;CITY&quot; &quot;CITY&quot; ON &quot;USERS&quot;.&quot;CITYID&quot; = &quot;CITY&quot;.&quot;ID&quot; 
   INNER JOIN &quot;PROVINCE&quot; &quot;PROVINCE&quot; ON &quot;CITY&quot;.&quot;PROVINCEID&quot; = &quot;PROVINCE&quot;.&quot;ID&quot; 
   WHERE &quot;USERS&quot;.&quot;ID&quot; = 1
 */
</code></pre>
<p><strong>快捷连接</strong><br>框架提供了快捷连接的接口：</p>
<pre><code class="lang-csharp">context.JoinQuery&lt;User, City, Province&gt;((user, city, province) =&gt; new object[] 
{
    JoinType.LeftJoin, user.CityId == city.Id,          /* 表 User 和 City 进行Left连接 */
    JoinType.LeftJoin, city.ProvinceId == province.Id   /* 表 City 和 Province 进行Left连接 */
})
.Select((user, city, province) =&gt; new { User = user, City = city, Province = province })  /* 投影成匿名对象 */
.Where(a =&gt; a.User.Id &gt; -1)     /* 进行条件过滤 */
.OrderByDesc(a =&gt; a.User.Age)   /* 排序 */
.TakePage(1, 20)                /* 分页 */
.ToList();
</code></pre>
<p>框架亦支持左连接、右连接和Full连接查询，用法和内连接相同。</p>
', '# 连接查询
Chloe 友好支持多表连接查询，一切都可以用 lambda 表达式操作，返回类型可以是自定义类型，也可以是匿名类型。强类型开发，编译可见错误，容错率高。
**1.建立连接：**
```csharp
var user_city_province = context.Query<User>()
                         .InnerJoin<City>((user, city) => user.CityId == city.Id)
                         .InnerJoin<Province>((user, city, province) => city.ProvinceId == province.Id);
```
**2.得到一个 IJoiningQuery 对象，就可以 Select 所需要的数据返回一个 IQuery 对象，然后就可以进行 Where、OrderBy、GroupBy、分页、聚合查询等操作：**
查出一个用户及其隶属的城市和省份的所有信息：
```csharp
/* 调用 Select 方法返回一个泛型为包含 User、City、Province 匿名类型的 IQuery 对象。
 * Select 方法也可以返回自定义类型 。
 */
var qq = user_city_province.Select((user, city, province) => new
{
    User = user,
    City = city,
    Province = province
});

/* 根据条件筛选，然后调用 ToList 就会返回一个泛型为 new { User = user, City = city, Province = province } 的 List 集合 */
var result = qq.Where(a => a.User.Id == 1).ToList();

/*
 * 生成的 sql：
 * SELECT "USERS"."ID" AS "ID","USERS"."NAME" AS "NAME","USERS"."GENDER" AS "GENDER","USERS"."AGE" AS "AGE","USERS"."CITYID" AS "CITYID","USERS"."OPTIME" AS "OPTIME","CITY"."ID" AS "ID0","CITY"."NAME" AS "NAME0","CITY"."PROVINCEID" AS "PROVINCEID","PROVINCE"."ID" AS "ID1","PROVINCE"."NAME" AS "NAME1" 
   FROM "USERS" "USERS" 
   INNER JOIN "CITY" "CITY" ON "USERS"."CITYID" = "CITY"."ID" 
   INNER JOIN "PROVINCE" "PROVINCE" ON "CITY"."PROVINCEID" = "PROVINCE"."ID" 
   WHERE "USERS"."ID" = 1
 */

/* 如果不想返回所有字段，得到 IQuery 对象后可以进一步 Select 指定的字段提高查询性能 
 * ##推荐使用此方式##
 */
var result1 = qq.Where(a => a.User.Id == 1)
                .Select(a => new { UserId = a.User.Id, UserName = a.User.Name, CityName = a.City.Name, ProvinceName = a.Province.Name })
                .ToList();
```
可以只获取指定的字段信息：
```csharp
user_city_province.Select((user, city, province) => new
{
    UserId = user.Id,
    UserName = user.Name,
    CityName = city.Name,
    ProvinceName = province.Name
}).Where(a => a.UserId == 1).ToList();

/*
 * 生成的 sql 只会包含 UserId、UserName、CityName、ProvinceName 四个字段
 * SELECT "USERS"."ID" AS "USERID","USERS"."NAME" AS "USERNAME","CITY"."NAME" AS "CITYNAME","PROVINCE"."NAME" AS "PROVINCENAME" 
   FROM "USERS" "USERS" 
   INNER JOIN "CITY" "CITY" ON "USERS"."CITYID" = "CITY"."ID" 
   INNER JOIN "PROVINCE" "PROVINCE" ON "CITY"."PROVINCEID" = "PROVINCE"."ID" 
   WHERE "USERS"."ID" = 1
 */
```
**快捷连接**
框架提供了快捷连接的接口：
```csharp
context.JoinQuery<User, City, Province>((user, city, province) => new object[] 
{
    JoinType.LeftJoin, user.CityId == city.Id,          /* 表 User 和 City 进行Left连接 */
    JoinType.LeftJoin, city.ProvinceId == province.Id   /* 表 City 和 Province 进行Left连接 */
})
.Select((user, city, province) => new { User = user, City = city, Province = province })  /* 投影成匿名对象 */
.Where(a => a.User.Id > -1)     /* 进行条件过滤 */
.OrderByDesc(a => a.User.Age)   /* 排序 */
.TakePage(1, 20)                /* 分页 */
.ToList();
```
框架亦支持左连接、右连接和Full连接查询，用法和内连接相同。', '2016-12-02 15:56:30.34', '2017-06-18 18:21:22.0844612', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149450531241984, 'Oracle-分组查询', 'Oracle-分组查询', 'Oracle-分组查询', '<h1 id="h1-u5206u7EC4u67E5u8BE2"><a name="分组查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>分组查询</h1><p>Chloe 支持分组查询以及分组后 Having 过滤和聚合查询。</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

IGroupingQuery&lt;User&gt; g = q.Where(a =&gt; a.Id &gt; 0).GroupBy(a =&gt; a.Age);
// g = g.AndBy(a =&gt; a.Id);  //多个字段分组
g = g.Having(a =&gt; a.Age &gt; 1 &amp;&amp; AggregateFunctions.Count() &gt; 0);

g.Select(a =&gt; new
{
    a.Age,
    Count = AggregateFunctions.Count(),
    Sum = AggregateFunctions.Sum(a.Age),
    Max = AggregateFunctions.Max(a.Age),
    Min = AggregateFunctions.Min(a.Age),
    Avg = AggregateFunctions.Average(a.Age)
}).ToList();
/*
 * SELECT &quot;USERS&quot;.&quot;AGE&quot; AS &quot;AGE&quot;,COUNT(1) AS &quot;COUNT&quot;,SUM(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;SUM&quot;,MAX(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;MAX&quot;,MIN(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;MIN&quot;,AVG(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;AVG&quot; 
   FROM &quot;USERS&quot; &quot;USERS&quot; 
   WHERE &quot;USERS&quot;.&quot;ID&quot; &gt; 0 
   GROUP BY &quot;USERS&quot;.&quot;AGE&quot; 
   HAVING (&quot;USERS&quot;.&quot;AGE&quot; &gt; 1 AND COUNT(1) &gt; 0)
 */
</code></pre>
', '# 分组查询
Chloe 支持分组查询以及分组后 Having 过滤和聚合查询。
```csharp
IQuery<User> q = context.Query<User>();

IGroupingQuery<User> g = q.Where(a => a.Id > 0).GroupBy(a => a.Age);
// g = g.AndBy(a => a.Id);  //多个字段分组
g = g.Having(a => a.Age > 1 && AggregateFunctions.Count() > 0);

g.Select(a => new
{
    a.Age,
    Count = AggregateFunctions.Count(),
    Sum = AggregateFunctions.Sum(a.Age),
    Max = AggregateFunctions.Max(a.Age),
    Min = AggregateFunctions.Min(a.Age),
    Avg = AggregateFunctions.Average(a.Age)
}).ToList();
/*
 * SELECT "USERS"."AGE" AS "AGE",COUNT(1) AS "COUNT",SUM("USERS"."AGE") AS "SUM",MAX("USERS"."AGE") AS "MAX",MIN("USERS"."AGE") AS "MIN",AVG("USERS"."AGE") AS "AVG" 
   FROM "USERS" "USERS" 
   WHERE "USERS"."ID" > 0 
   GROUP BY "USERS"."AGE" 
   HAVING ("USERS"."AGE" > 1 AND COUNT(1) > 0)
 */
```', '2016-12-02 15:56:48.317', '2016-12-03 14:22:09.113', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149550670249984, 'Oracle-聚合查询', 'Oracle-聚合查询', 'Oracle-聚合查询', '<h1 id="h1-u805Au5408u67E5u8BE2"><a name="聚合查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>聚合查询</h1><p>Chloe 可以像写 sql 一样实现聚合查询。</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

q.Select(a =&gt; AggregateFunctions.Count()).First();
/*
 * SELECT COUNT(1) AS &quot;C&quot; FROM &quot;USERS&quot; &quot;USERS&quot; WHERE ROWNUM &lt; 2
 */

/* 支持多个聚合函数 */
q.Select(a =&gt; new
{
    Count = AggregateFunctions.Count(),
    LongCount = AggregateFunctions.LongCount(),
    Sum = AggregateFunctions.Sum(a.Age),
    Max = AggregateFunctions.Max(a.Age),
    Min = AggregateFunctions.Min(a.Age),
    Average = AggregateFunctions.Average(a.Age)
}).First();
/*
 * SELECT COUNT(1) AS &quot;COUNT&quot;,COUNT(1) AS &quot;LONGCOUNT&quot;,SUM(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;SUM&quot;,MAX(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;MAX&quot;,MIN(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;MIN&quot;,AVG(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;AVERAGE&quot; 
   FROM &quot;USERS&quot; &quot;USERS&quot; 
   WHERE ROWNUM &lt; 2
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS &quot;C&quot; FROM &quot;USERS&quot; &quot;USERS&quot;
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT(1) AS &quot;C&quot; FROM &quot;USERS&quot; &quot;USERS&quot;
 */

var sum = q.Sum(a =&gt; a.Age);
/*
 * SELECT SUM(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;C&quot; FROM &quot;USERS&quot; &quot;USERS&quot;
 */

var max = q.Max(a =&gt; a.Age);
/*
 * SELECT MAX(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;C&quot; FROM &quot;USERS&quot; &quot;USERS&quot;
 */

var min = q.Min(a =&gt; a.Age);
/*
 * SELECT MIN(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;C&quot; FROM &quot;USERS&quot; &quot;USERS&quot;
 */

var avg = q.Average(a =&gt; a.Age);
/*
 * SELECT AVG(&quot;USERS&quot;.&quot;AGE&quot;) AS &quot;C&quot; FROM &quot;USERS&quot; &quot;USERS&quot;
 */
</code></pre>
', '# 聚合查询
Chloe 可以像写 sql 一样实现聚合查询。
```csharp
IQuery<User> q = context.Query<User>();

q.Select(a => AggregateFunctions.Count()).First();
/*
 * SELECT COUNT(1) AS "C" FROM "USERS" "USERS" WHERE ROWNUM < 2
 */

/* 支持多个聚合函数 */
q.Select(a => new
{
    Count = AggregateFunctions.Count(),
    LongCount = AggregateFunctions.LongCount(),
    Sum = AggregateFunctions.Sum(a.Age),
    Max = AggregateFunctions.Max(a.Age),
    Min = AggregateFunctions.Min(a.Age),
    Average = AggregateFunctions.Average(a.Age)
}).First();
/*
 * SELECT COUNT(1) AS "COUNT",COUNT(1) AS "LONGCOUNT",SUM("USERS"."AGE") AS "SUM",MAX("USERS"."AGE") AS "MAX",MIN("USERS"."AGE") AS "MIN",AVG("USERS"."AGE") AS "AVERAGE" 
   FROM "USERS" "USERS" 
   WHERE ROWNUM < 2
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS "C" FROM "USERS" "USERS"
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT(1) AS "C" FROM "USERS" "USERS"
 */

var sum = q.Sum(a => a.Age);
/*
 * SELECT SUM("USERS"."AGE") AS "C" FROM "USERS" "USERS"
 */

var max = q.Max(a => a.Age);
/*
 * SELECT MAX("USERS"."AGE") AS "C" FROM "USERS" "USERS"
 */

var min = q.Min(a => a.Age);
/*
 * SELECT MIN("USERS"."AGE") AS "C" FROM "USERS" "USERS"
 */

var avg = q.Average(a => a.Age);
/*
 * SELECT AVG("USERS"."AGE") AS "C" FROM "USERS" "USERS"
 */
```', '2016-12-02 15:57:12.19', '2016-12-03 14:23:21.67', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149605842124800, 'Oracle-执行Sql', 'Oracle-执行Sql', 'Oracle-执行Sql', '<h1 id="h1--sql"><a name="执行Sql" class="reference-link"></a><span class="header-link octicon octicon-link"></span>执行Sql</h1><p>对于一些极其复杂的 sql 查询，还是得依赖原生 sql，因此，Chloe 提供了原生 sql 查询接口。<br><strong>获取满足条件的用户信息，将结果映射到 User 类上：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;select * from Users where Age&gt;:age&quot;, new DbParam(&quot;:age&quot;, 18)).ToList();
</code></pre>
<p><strong>获取满足条件的用户 Id：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;int&gt;(&quot;select Id from Users where Age&gt;:age&quot;, new DbParam(&quot;:age&quot;, 18)).ToList();
</code></pre>
<p><strong>支持存储过程：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;Proc_Test&quot;, CommandType.StoredProcedure, new DbParam(&quot;:age&quot;, 18)).ToList();
</code></pre>
<p><strong>支持dynamic：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;dynamic&gt;(&quot;select Id,Name from Users where Age&gt;:age&quot;, new DbParam(&quot;:age&quot;, 18)).ToList();
</code></pre>
<p><strong>传参方式2：</strong><br>该方法为扩展方法，定义在 Chloe.Extension.dll 中。</p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;select * from Users where Id=:Id&quot;, new { Id = 1 }).ToList();
</code></pre>
<p><strong>获取 DataTable：</strong><br>ExecuteDataTable 扩展方法位于 <a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs</a> 类中。</p>
<pre><code class="lang-csharp">DataTable dt = context.Session.ExecuteDataTable(&quot;select * from users where age&gt;=@age&quot;, new { age = 18 });
</code></pre>
<p><strong>FormatSqlQuery（仅.NET Core版本支持）：</strong><br>FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化，方法定义位于 <a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs</a> 类中。</p>
<pre><code class="lang-csharp">int age = 18;
List&lt;User&gt; users = context.FormatSqlQuery&lt;User&gt;($&quot;select * from Users where age&gt;={age}&quot;).ToList();

//或者
FormattableString sql = $&quot;select * from Users where age&gt;={age}&quot;; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery&lt;User&gt;(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 :P_0 = 18;
   select * from Users where age&gt;=:P_0
 */
</code></pre>
<p><strong>ado.net：</strong><br>基本的 ado.net 接口定义在 DbContext.Session 对象中。</p>
<pre><code class="lang-csharp">int rowsAffected = context.Session.ExecuteNonQuery(&quot;update Users set Age=18 where Id=1&quot;);
IDataReader dataReader = context.Session.ExecuteReader(&quot;select * from Users where Age&gt;18&quot;);
</code></pre>
', '# 执行Sql
对于一些极其复杂的 sql 查询，还是得依赖原生 sql，因此，Chloe 提供了原生 sql 查询接口。
**获取满足条件的用户信息，将结果映射到 User 类上：**
```csharp
context.SqlQuery<User>("select * from Users where Age>:age", new DbParam(":age", 18)).ToList();
```
**获取满足条件的用户 Id：**
```csharp
context.SqlQuery<int>("select Id from Users where Age>:age", new DbParam(":age", 18)).ToList();
```
**支持存储过程：**
```csharp
context.SqlQuery<User>("Proc_Test", CommandType.StoredProcedure, new DbParam(":age", 18)).ToList();
```
**支持dynamic：**
```csharp
context.SqlQuery<dynamic>("select Id,Name from Users where Age>:age", new DbParam(":age", 18)).ToList();
```
**传参方式2：**
该方法为扩展方法，定义在 Chloe.Extension.dll 中。
```csharp
context.SqlQuery<User>("select * from Users where Id=:Id", new { Id = 1 }).ToList();
```
**获取 DataTable：**
ExecuteDataTable 扩展方法位于 https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs 类中。
```csharp
DataTable dt = context.Session.ExecuteDataTable("select * from users where age>=@age", new { age = 18 });
```
**FormatSqlQuery（仅.NET Core版本支持）：**
FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化，方法定义位于 https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs 类中。
```csharp
int age = 18;
List<User> users = context.FormatSqlQuery<User>($"select * from Users where age>={age}").ToList();

//或者
FormattableString sql = $"select * from Users where age>={age}"; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery<User>(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 :P_0 = 18;
   select * from Users where age>=:P_0
 */
```
**ado.net：**
基本的 ado.net 接口定义在 DbContext.Session 对象中。
```csharp
int rowsAffected = context.Session.ExecuteNonQuery("update Users set Age=18 where Id=1");
IDataReader dataReader = context.Session.ExecuteReader("select * from Users where Age>18");
```', '2016-12-02 15:57:25.347', '2016-12-03 14:25:01.94', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149662540726272, 'Oracle-插入数据', 'Oracle-插入数据', 'Oracle-插入数据', '<h1 id="h1-u63D2u5165u6570u636E"><a name="插入数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>插入数据</h1><p>Chloe 具备多种插入数据的方式。<br><strong>1.实体插入：</strong><br>该方式插入，如果一个实体存在自增列（序列），会自动将自增列设置到相应的属性上。</p>
<pre><code class="lang-csharp">User user = new User();
user.Name = &quot;lu&quot;;
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = DateTime.Now;

/* 会自动将自增 Id 设置到 user 的 Id 属性上 */
user = context.Insert(user);
/*
 * SELECT &quot;USERS_AUTOID&quot;.&quot;NEXTVAL&quot; FROM &quot;DUAL&quot;
 * Int32 :P_0 = 15;
   String :P_1 = &#39;lu&#39;;
   Int32 :P_2 = 1;
   Int32 :P_3 = 18;
   DateTime :P_4 = &#39;2016/9/5 9:16:59&#39;;
   INSERT INTO &quot;USERS&quot;(&quot;ID&quot;,&quot;NAME&quot;,&quot;GENDER&quot;,&quot;AGE&quot;,&quot;CITYID&quot;,&quot;OPTIME&quot;)     
   VALUES(:P_0,:P_1,:P_2,:P_3,:P_2,:P_4)
 */
</code></pre>
<p><strong>2.lambda 方式插入：</strong><br>此种方式插入的好处是，可以指定列插入，就像写 sql 一样简单。<br>同时，该方式插入返回表主键值。如果实体主键是自增列，返回值就会是自增值。</p>
<pre><code class="lang-csharp">/* 返回主键 Id */
int id = (int)context.Insert&lt;User&gt;(() =&gt; new User()
{
    Name = &quot;lu&quot;,
    Age = 18,
    Gender = Gender.Man,
    CityId = 1,
    OpTime = DateTime.Now
});
/*
 * SELECT &quot;USERS_AUTOID&quot;.&quot;NEXTVAL&quot; FROM &quot;DUAL&quot;
 * Int32 :P_0 = 14;
   INSERT INTO &quot;USERS&quot;(&quot;NAME&quot;,&quot;AGE&quot;,&quot;GENDER&quot;,&quot;CITYID&quot;,&quot;OPTIME&quot;,&quot;ID&quot;) 
   VALUES(N&#39;lu&#39;,18,1,1,SYSTIMESTAMP,:P_0)
 */
</code></pre>
', '# 插入数据
Chloe 具备多种插入数据的方式。
**1.实体插入：**
该方式插入，如果一个实体存在自增列（序列），会自动将自增列设置到相应的属性上。
```csharp
User user = new User();
user.Name = "lu";
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = DateTime.Now;

/* 会自动将自增 Id 设置到 user 的 Id 属性上 */
user = context.Insert(user);
/*
 * SELECT "USERS_AUTOID"."NEXTVAL" FROM "DUAL"
 * Int32 :P_0 = 15;
   String :P_1 = ''lu'';
   Int32 :P_2 = 1;
   Int32 :P_3 = 18;
   DateTime :P_4 = ''2016/9/5 9:16:59'';
   INSERT INTO "USERS"("ID","NAME","GENDER","AGE","CITYID","OPTIME")     
   VALUES(:P_0,:P_1,:P_2,:P_3,:P_2,:P_4)
 */
```
**2.lambda 方式插入：**
此种方式插入的好处是，可以指定列插入，就像写 sql 一样简单。
同时，该方式插入返回表主键值。如果实体主键是自增列，返回值就会是自增值。
```csharp
/* 返回主键 Id */
int id = (int)context.Insert<User>(() => new User()
{
    Name = "lu",
    Age = 18,
    Gender = Gender.Man,
    CityId = 1,
    OpTime = DateTime.Now
});
/*
 * SELECT "USERS_AUTOID"."NEXTVAL" FROM "DUAL"
 * Int32 :P_0 = 14;
   INSERT INTO "USERS"("NAME","AGE","GENDER","CITYID","OPTIME","ID") 
   VALUES(N''lu'',18,1,1,SYSTIMESTAMP,:P_0)
 */
```', '2016-12-02 15:57:38.863', '2016-12-04 22:22:24.0033189', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149712301948928, 'Oracle-更新数据', 'Oracle-更新数据', 'Oracle-更新数据', '<h1 id="h1-u66F4u65B0u6570u636E"><a name="更新数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>更新数据</h1><p>Chloe 支持两种数据更新方式。<br><strong>1.实体更新：</strong></p>
<pre><code class="lang-csharp">User user = new User();
user.Id = 1;
user.Name = &quot;lu&quot;;
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

/* 更新所有映射的字段 */
context.Update(user);
/*
 * String :P_0 = &#39;lu&#39;;
   Int32 :P_1 = 1;
   Int32 :P_2 = 28;
   Nullable&lt;Int32&gt; :P_3 = NULL;
   DateTime :P_4 = &#39;2016/9/5 9:20:07&#39;;
   UPDATE &quot;USERS&quot; SET &quot;NAME&quot;=:P_0,&quot;GENDER&quot;=:P_1,&quot;AGE&quot;=:P_2,&quot;CITYID&quot;=:P_3,&quot;OPTIME&quot;=:P_4 
   WHERE &quot;USERS&quot;.&quot;ID&quot; = :P_1
 */
</code></pre>
<p>由于 user 对象未被上下文跟踪，这会使所有的映射列都会被更新。Chloe 也支持类似 EF 一样只更新被修改过的属性。</p>
<pre><code class="lang-csharp">/*
 * 支持只更新属性值已变的属性
 */

/* 在修改实体属性前让上下文跟踪实体 */
context.TrackEntity(user);

/* 然后再修改实体属性 */
user.Name = user.Name + &quot;1&quot;;

/* 然后调用 Update 方法，这时只会更新被修改过的属性 */
context.Update(user);
/*
 * String :P_0 = &#39;lu1&#39;;
   Int32 :P_1 = 1;
   UPDATE &quot;USERS&quot; SET &quot;NAME&quot;=:P_0 WHERE &quot;USERS&quot;.&quot;ID&quot; = :P_1
 */
</code></pre>
<p><strong>2.lambda 方式更新：</strong><br>该方式解决的问题是：1.指定列更新；2.批量更新；3.支持类似 Age=Age + 100 这样更新字段。用法如下：</p>
<pre><code class="lang-csharp">context.Update&lt;User&gt;(a =&gt; a.Age &gt; 18, a =&gt; new User()
{
    Name = a.Name,
    Age = a.Age + 100,
    Gender = Gender.Man,
    OpTime = DateTime.Now
});
/*
 * UPDATE &quot;USERS&quot; SET &quot;NAME&quot;=&quot;USERS&quot;.&quot;NAME&quot;,&quot;AGE&quot;=(&quot;USERS&quot;.&quot;AGE&quot; + 100),&quot;GENDER&quot;=1,&quot;OPTIME&quot;=SYSTIMESTAMP 
   WHERE &quot;USERS&quot;.&quot;AGE&quot; &gt; 18
 */
</code></pre>
', '# 更新数据
Chloe 支持两种数据更新方式。
**1.实体更新：**
```csharp
User user = new User();
user.Id = 1;
user.Name = "lu";
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

/* 更新所有映射的字段 */
context.Update(user);
/*
 * String :P_0 = ''lu'';
   Int32 :P_1 = 1;
   Int32 :P_2 = 28;
   Nullable<Int32> :P_3 = NULL;
   DateTime :P_4 = ''2016/9/5 9:20:07'';
   UPDATE "USERS" SET "NAME"=:P_0,"GENDER"=:P_1,"AGE"=:P_2,"CITYID"=:P_3,"OPTIME"=:P_4 
   WHERE "USERS"."ID" = :P_1
 */
```
由于 user 对象未被上下文跟踪，这会使所有的映射列都会被更新。Chloe 也支持类似 EF 一样只更新被修改过的属性。
```csharp
/*
 * 支持只更新属性值已变的属性
 */

/* 在修改实体属性前让上下文跟踪实体 */
context.TrackEntity(user);

/* 然后再修改实体属性 */
user.Name = user.Name + "1";

/* 然后调用 Update 方法，这时只会更新被修改过的属性 */
context.Update(user);
/*
 * String :P_0 = ''lu1'';
   Int32 :P_1 = 1;
   UPDATE "USERS" SET "NAME"=:P_0 WHERE "USERS"."ID" = :P_1
 */
```
**2.lambda 方式更新：**
该方式解决的问题是：1.指定列更新；2.批量更新；3.支持类似 Age=Age + 100 这样更新字段。用法如下：
```csharp
context.Update<User>(a => a.Age > 18, a => new User()
{
    Name = a.Name,
    Age = a.Age + 100,
    Gender = Gender.Man,
    OpTime = DateTime.Now
});
/*
 * UPDATE "USERS" SET "NAME"="USERS"."NAME","AGE"=("USERS"."AGE" + 100),"GENDER"=1,"OPTIME"=SYSTIMESTAMP 
   WHERE "USERS"."AGE" > 18
 */
```', '2016-12-02 15:57:50.727', '2016-12-03 14:34:21.477', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325149761299808256, 'Oracle-删除数据', 'Oracle-删除数据', 'Oracle-删除数据', '<h1 id="h1-u5220u9664u6570u636E"><a name="删除数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>删除数据</h1><p>Chloe 支持两种数据删除方式。<br><strong>1.实体删除：</strong><br>该方式删除必须要求实体拥有一个主键，否则会报异常提示。</p>
<pre><code class="lang-csharp">User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 :P_0 = 1;
   DELETE FROM &quot;USERS&quot; WHERE &quot;USERS&quot;.&quot;ID&quot; = :P_0
 */
</code></pre>
<p><strong>2.lambda 方式删除：</strong><br>使用该方式可以删除单条数据，也可以删除多条数据。</p>
<pre><code class="lang-csharp">/* 删除单条数据 */
context.Delete&lt;User&gt;(a =&gt; a.Id == 1);
/*
 * DELETE FROM &quot;USERS&quot; WHERE &quot;USERS&quot;.&quot;ID&quot; = 1
 */

/* 批量删除满足条件的数据 */
context.Delete&lt;User&gt;(a =&gt; a.Age &gt; 18);
/*
 * DELETE FROM &quot;USERS&quot; WHERE &quot;USERS&quot;.&quot;AGE&quot; &gt; 18
 */
</code></pre>
', '# 删除数据
Chloe 支持两种数据删除方式。
**1.实体删除：**
该方式删除必须要求实体拥有一个主键，否则会报异常提示。
```csharp
User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 :P_0 = 1;
   DELETE FROM "USERS" WHERE "USERS"."ID" = :P_0
 */
```
**2.lambda 方式删除：**
使用该方式可以删除单条数据，也可以删除多条数据。
```csharp
/* 删除单条数据 */
context.Delete<User>(a => a.Id == 1);
/*
 * DELETE FROM "USERS" WHERE "USERS"."ID" = 1
 */

/* 批量删除满足条件的数据 */
context.Delete<User>(a => a.Age > 18);
/*
 * DELETE FROM "USERS" WHERE "USERS"."AGE" > 18
 */
```', '2016-12-02 15:58:02.41', '2016-12-03 15:17:53.79', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325150100572864512, 'Oracle-存储过程', 'Oracle-存储过程', 'Oracle-存储过程', '<h1 id="h1-u5B58u50A8u8FC7u7A0B"><a name="存储过程" class="reference-link"></a><span class="header-link octicon octicon-link"></span>存储过程</h1><p>Chloe 支持存储过程以及 output 参数。<br><strong>通过存储过程获取一个 User 信息：</strong><br>Oracle 数据库中，如果一个存储过程需要返回结果集，需要借助 RefCursor output 参数特性。用法如下：</p>
<pre><code class="lang-csharp">/* 必须先自定义 RefCursor 参数 */
OracleParameter p_cur = new OracleParameter();
p_cur.ParameterName = &quot;p_cur&quot;;
p_cur.OracleDbType = OracleDbType.RefCursor;
p_cur.Direction = ParameterDirection.Output;

DbParam refCursorParam = new DbParam();
/* 将自定义 RefCursor 参数设置到 DbParam 的 ExplicitParameter 属性 */
refCursorParam.ExplicitParameter = p_cur;

DbParam id = new DbParam(&quot;id&quot;, 1);
User user = context.SqlQuery&lt;User&gt;(&quot;Proc_GetUser&quot;, CommandType.StoredProcedure, id，refCursorParam).FirstOrDefault();
</code></pre>
<p><strong>通过存储过程的 output 参数获取一个用户的 name：</strong></p>
<pre><code class="lang-csharp">DbParam id = new DbParam(&quot;id&quot;, 1);
DbParam outputName = new DbParam(&quot;name&quot;, null, typeof(string)) { Direction = ParamDirection.Output };
context.Session.ExecuteNonQuery(&quot;Proc_GetUserName&quot;, CommandType.StoredProcedure, id, outputName);
</code></pre>
', '# 存储过程
Chloe 支持存储过程以及 output 参数。
**通过存储过程获取一个 User 信息：**
Oracle 数据库中，如果一个存储过程需要返回结果集，需要借助 RefCursor output 参数特性。用法如下：
```csharp
/* 必须先自定义 RefCursor 参数 */
OracleParameter p_cur = new OracleParameter();
p_cur.ParameterName = "p_cur";
p_cur.OracleDbType = OracleDbType.RefCursor;
p_cur.Direction = ParameterDirection.Output;

DbParam refCursorParam = new DbParam();
/* 将自定义 RefCursor 参数设置到 DbParam 的 ExplicitParameter 属性 */
refCursorParam.ExplicitParameter = p_cur;

DbParam id = new DbParam("id", 1);
User user = context.SqlQuery<User>("Proc_GetUser", CommandType.StoredProcedure, id，refCursorParam).FirstOrDefault();
```
**通过存储过程的 output 参数获取一个用户的 name：**
```csharp
DbParam id = new DbParam("id", 1);
DbParam outputName = new DbParam("name", null, typeof(string)) { Direction = ParamDirection.Output };
context.Session.ExecuteNonQuery("Proc_GetUserName", CommandType.StoredProcedure, id, outputName);
```', '2016-12-02 15:59:23.297', '2016-12-05 23:11:55.726044', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325150155606327296, 'Oracle-事务', 'Oracle-事务', 'Oracle-事务', '<h1 id="h1-u4E8Bu52A1u652Fu6301"><a name="事务支持" class="reference-link"></a><span class="header-link octicon octicon-link"></span>事务支持</h1><p><strong>基本用法：</strong></p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
using (OracleContext context = new OracleContext(new OracleConnectionFactory(connString)))
{
    try
    {
        context.Session.BeginTransaction();

        /* do some things here */
        context.Update(user);
        context.Delete&lt;User&gt;(a =&gt; a.Gender == null);

        context.Session.CommitTransaction();
    }
    catch
    {
        if (context.Session.IsInTransaction)
            context.Session.RollbackTransaction();
        throw;
    }
}
</code></pre>
', '# 事务支持
**基本用法：**
```csharp
string connString = "Your connection string";
using (OracleContext context = new OracleContext(new OracleConnectionFactory(connString)))
{
    try
    {
        context.Session.BeginTransaction();

        /* do some things here */
        context.Update(user);
        context.Delete<User>(a => a.Gender == null);

        context.Session.CommitTransaction();
    }
    catch
    {
        if (context.Session.IsInTransaction)
            context.Session.RollbackTransaction();
        throw;
    }
}
```', '2016-12-02 15:59:36.42', '2016-12-03 14:56:42.617', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325150214624378880, 'Oracle-常用函数', 'Oracle-常用函数', 'Oracle-常用函数', '<h1 id="h1-u5E38u7528u51FDu6570"><a name="常用函数" class="reference-link"></a><span class="header-link octicon octicon-link"></span>常用函数</h1><p><strong>Chloe 对很多数据库函数支持很丰富，具体用法如下：</strong></p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

var space = new char[] { &#39; &#39; };

DateTime startTime = DateTime.Now;
DateTime endTime = startTime.AddDays(1);
var ret = q.Select(a =&gt; new
     {
         Id = a.Id,

         String_Length = (int?)a.Name.Length,//LENGTH(&quot;USERS&quot;.&quot;NAME&quot;)
         Substring = a.Name.Substring(0),//SUBSTR(&quot;USERS&quot;.&quot;NAME&quot;,0 + 1,LENGTH(&quot;USERS&quot;.&quot;NAME&quot;))
         Substring1 = a.Name.Substring(1),//SUBSTR(&quot;USERS&quot;.&quot;NAME&quot;,1 + 1,LENGTH(&quot;USERS&quot;.&quot;NAME&quot;))
         Substring1_2 = a.Name.Substring(1, 2),//SUBSTR(&quot;USERS&quot;.&quot;NAME&quot;,1 + 1,2)
         ToLower = a.Name.ToLower(),//LOWER(&quot;USERS&quot;.&quot;NAME&quot;)
         ToUpper = a.Name.ToUpper(),//UPPER(&quot;USERS&quot;.&quot;NAME&quot;)
         IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//too long
         Contains = (bool?)a.Name.Contains(&quot;s&quot;),//
         Trim = a.Name.Trim(),//TRIM(&quot;USERS&quot;.&quot;NAME&quot;)
         TrimStart = a.Name.TrimStart(space),//LTRIM(&quot;USERS&quot;.&quot;NAME&quot;)
         TrimEnd = a.Name.TrimEnd(space),//RTRIM(&quot;USERS&quot;.&quot;NAME&quot;)
         StartsWith = (bool?)a.Name.StartsWith(&quot;s&quot;),//
         EndsWith = (bool?)a.Name.EndsWith(&quot;s&quot;),//

         /* oracle is not supported DbFunctions.Diffxx. */
         //DiffYears = DbFunctions.DiffYears(startTime, endTime),//
         //DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//
         //DiffDays = DbFunctions.DiffDays(startTime, endTime),//
         //DiffHours = DbFunctions.DiffHours(startTime, endTime),//
         //DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//
         //DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//
         //DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//
         //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//

         /* ((CAST(:P_0 AS DATE)-CAST(:P_1 AS DATE)) * 86400000 + CAST(TO_CHAR(CAST(:P_0 AS TIMESTAMP),&#39;ff3&#39;) AS NUMBER) - CAST(TO_CHAR(CAST(:P_1 AS TIMESTAMP),&#39;ff3&#39;) AS NUMBER)) / 86400000 */
         SubtractTotalDays = endTime.Subtract(startTime).TotalDays,//
         SubtractTotalHours = endTime.Subtract(startTime).TotalHours,//...
         SubtractTotalMinutes = endTime.Subtract(startTime).TotalMinutes,//...
         SubtractTotalSeconds = endTime.Subtract(startTime).TotalSeconds,//...
         SubtractTotalMilliseconds = endTime.Subtract(startTime).TotalMilliseconds,//...

         AddYears = startTime.AddYears(1),//ADD_MONTHS(:P_0,12 * 1)
         AddMonths = startTime.AddMonths(1),//ADD_MONTHS(:P_0,1)
         AddDays = startTime.AddDays(1),//(:P_0 + 1)
         AddHours = startTime.AddHours(1),//(:P_0 + NUMTODSINTERVAL(1,&#39;HOUR&#39;))
         AddMinutes = startTime.AddMinutes(2),//(:P_0 + NUMTODSINTERVAL(2,&#39;MINUTE&#39;))
         AddSeconds = startTime.AddSeconds(120),//(:P_0 + NUMTODSINTERVAL(120,&#39;SECOND&#39;))
         //AddMilliseconds = startTime.AddMilliseconds(20000),//不支持

         Now = DateTime.Now,//SYSTIMESTAMP
         UtcNow = DateTime.UtcNow,//SYS_EXTRACT_UTC(SYSTIMESTAMP)
         Today = DateTime.Today,//TRUNC(SYSDATE,&#39;DD&#39;)
         Date = DateTime.Now.Date,//TRUNC(SYSTIMESTAMP,&#39;DD&#39;)
         Year = DateTime.Now.Year,//CAST(TO_CHAR(SYSTIMESTAMP,&#39;yyyy&#39;) AS NUMBER)
         Month = DateTime.Now.Month,//CAST(TO_CHAR(SYSTIMESTAMP,&#39;mm&#39;) AS NUMBER)
         Day = DateTime.Now.Day,//CAST(TO_CHAR(SYSTIMESTAMP,&#39;dd&#39;) AS NUMBER)
         Hour = DateTime.Now.Hour,//CAST(TO_CHAR(SYSTIMESTAMP,&#39;hh24&#39;) AS NUMBER)
         Minute = DateTime.Now.Minute,//CAST(TO_CHAR(SYSTIMESTAMP,&#39;mi&#39;) AS NUMBER)
         Second = DateTime.Now.Second,//CAST(TO_CHAR(SYSTIMESTAMP,&#39;ss&#39;) AS NUMBER)
         Millisecond = DateTime.Now.Millisecond,//CAST(TO_CHAR(SYSTIMESTAMP,&#39;ff3&#39;) AS NUMBER)
         DayOfWeek = DateTime.Now.DayOfWeek,//(CAST(TO_CHAR(SYSTIMESTAMP,&#39;D&#39;) AS NUMBER) - 1)

         Int_Parse = int.Parse(&quot;1&quot;),//CAST(N&#39;1&#39; AS NUMBER)
         Int16_Parse = Int16.Parse(&quot;11&quot;),//CAST(N&#39;11&#39; AS NUMBER)
         Long_Parse = long.Parse(&quot;2&quot;),//CAST(N&#39;2&#39; AS NUMBER)
         Double_Parse = double.Parse(&quot;3&quot;),//CAST(N&#39;3&#39; AS BINARY_DOUBLE)
         Float_Parse = float.Parse(&quot;4&quot;),//CAST(N&#39;4&#39; AS BINARY_FLOAT)
         Decimal_Parse = decimal.Parse(&quot;5&quot;),//CAST(N&#39;5&#39; AS NUMBER)
         //Guid_Parse = Guid.Parse(&quot;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&quot;),//不支持

         Bool_Parse = bool.Parse(&quot;1&quot;),//
         DateTime_Parse = DateTime.Parse(&quot;1992-1-16&quot;),//TO_TIMESTAMP(N&#39;1992-1-16&#39;,&#39;yyyy-mm-dd hh24:mi:ssxff&#39;)

         B = a.Age == null ? false : a.Age &gt; 1,
     }).ToList();
</code></pre>
<p>上述的函数可以用于 Select 方法，亦可用在 Where 或其它方法的 lambda 表达式树中，最终都会翻译成数据库函数。</p>
', '# 常用函数
**Chloe 对很多数据库函数支持很丰富，具体用法如下：**
```csharp
IQuery<User> q = context.Query<User>();

var space = new char[] { '' '' };

DateTime startTime = DateTime.Now;
DateTime endTime = startTime.AddDays(1);
var ret = q.Select(a => new
     {
         Id = a.Id,

         String_Length = (int?)a.Name.Length,//LENGTH("USERS"."NAME")
         Substring = a.Name.Substring(0),//SUBSTR("USERS"."NAME",0 + 1,LENGTH("USERS"."NAME"))
         Substring1 = a.Name.Substring(1),//SUBSTR("USERS"."NAME",1 + 1,LENGTH("USERS"."NAME"))
         Substring1_2 = a.Name.Substring(1, 2),//SUBSTR("USERS"."NAME",1 + 1,2)
         ToLower = a.Name.ToLower(),//LOWER("USERS"."NAME")
         ToUpper = a.Name.ToUpper(),//UPPER("USERS"."NAME")
         IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//too long
         Contains = (bool?)a.Name.Contains("s"),//
         Trim = a.Name.Trim(),//TRIM("USERS"."NAME")
         TrimStart = a.Name.TrimStart(space),//LTRIM("USERS"."NAME")
         TrimEnd = a.Name.TrimEnd(space),//RTRIM("USERS"."NAME")
         StartsWith = (bool?)a.Name.StartsWith("s"),//
         EndsWith = (bool?)a.Name.EndsWith("s"),//

         /* oracle is not supported DbFunctions.Diffxx. */
         //DiffYears = DbFunctions.DiffYears(startTime, endTime),//
         //DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//
         //DiffDays = DbFunctions.DiffDays(startTime, endTime),//
         //DiffHours = DbFunctions.DiffHours(startTime, endTime),//
         //DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//
         //DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//
         //DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//
         //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//

         /* ((CAST(:P_0 AS DATE)-CAST(:P_1 AS DATE)) * 86400000 + CAST(TO_CHAR(CAST(:P_0 AS TIMESTAMP),''ff3'') AS NUMBER) - CAST(TO_CHAR(CAST(:P_1 AS TIMESTAMP),''ff3'') AS NUMBER)) / 86400000 */
         SubtractTotalDays = endTime.Subtract(startTime).TotalDays,//
         SubtractTotalHours = endTime.Subtract(startTime).TotalHours,//...
         SubtractTotalMinutes = endTime.Subtract(startTime).TotalMinutes,//...
         SubtractTotalSeconds = endTime.Subtract(startTime).TotalSeconds,//...
         SubtractTotalMilliseconds = endTime.Subtract(startTime).TotalMilliseconds,//...

         AddYears = startTime.AddYears(1),//ADD_MONTHS(:P_0,12 * 1)
         AddMonths = startTime.AddMonths(1),//ADD_MONTHS(:P_0,1)
         AddDays = startTime.AddDays(1),//(:P_0 + 1)
         AddHours = startTime.AddHours(1),//(:P_0 + NUMTODSINTERVAL(1,''HOUR''))
         AddMinutes = startTime.AddMinutes(2),//(:P_0 + NUMTODSINTERVAL(2,''MINUTE''))
         AddSeconds = startTime.AddSeconds(120),//(:P_0 + NUMTODSINTERVAL(120,''SECOND''))
         //AddMilliseconds = startTime.AddMilliseconds(20000),//不支持

         Now = DateTime.Now,//SYSTIMESTAMP
         UtcNow = DateTime.UtcNow,//SYS_EXTRACT_UTC(SYSTIMESTAMP)
         Today = DateTime.Today,//TRUNC(SYSDATE,''DD'')
         Date = DateTime.Now.Date,//TRUNC(SYSTIMESTAMP,''DD'')
         Year = DateTime.Now.Year,//CAST(TO_CHAR(SYSTIMESTAMP,''yyyy'') AS NUMBER)
         Month = DateTime.Now.Month,//CAST(TO_CHAR(SYSTIMESTAMP,''mm'') AS NUMBER)
         Day = DateTime.Now.Day,//CAST(TO_CHAR(SYSTIMESTAMP,''dd'') AS NUMBER)
         Hour = DateTime.Now.Hour,//CAST(TO_CHAR(SYSTIMESTAMP,''hh24'') AS NUMBER)
         Minute = DateTime.Now.Minute,//CAST(TO_CHAR(SYSTIMESTAMP,''mi'') AS NUMBER)
         Second = DateTime.Now.Second,//CAST(TO_CHAR(SYSTIMESTAMP,''ss'') AS NUMBER)
         Millisecond = DateTime.Now.Millisecond,//CAST(TO_CHAR(SYSTIMESTAMP,''ff3'') AS NUMBER)
         DayOfWeek = DateTime.Now.DayOfWeek,//(CAST(TO_CHAR(SYSTIMESTAMP,''D'') AS NUMBER) - 1)

         Int_Parse = int.Parse("1"),//CAST(N''1'' AS NUMBER)
         Int16_Parse = Int16.Parse("11"),//CAST(N''11'' AS NUMBER)
         Long_Parse = long.Parse("2"),//CAST(N''2'' AS NUMBER)
         Double_Parse = double.Parse("3"),//CAST(N''3'' AS BINARY_DOUBLE)
         Float_Parse = float.Parse("4"),//CAST(N''4'' AS BINARY_FLOAT)
         Decimal_Parse = decimal.Parse("5"),//CAST(N''5'' AS NUMBER)
         //Guid_Parse = Guid.Parse("D544BC4C-739E-4CD3-A3D3-7BF803FCE179"),//不支持

         Bool_Parse = bool.Parse("1"),//
         DateTime_Parse = DateTime.Parse("1992-1-16"),//TO_TIMESTAMP(N''1992-1-16'',''yyyy-mm-dd hh24:mi:ssxff'')

         B = a.Age == null ? false : a.Age > 1,
     }).ToList();
```
上述的函数可以用于 Select 方法，亦可用在 Where 或其它方法的 lambda 表达式树中，最终都会翻译成数据库函数。', '2016-12-02 15:59:50.49', '2016-12-03 14:57:49.843', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155467776229376, 'SQLite-实体特性', 'SQLite-实体特性', 'SQLite-实体特性', '<h1 id="h1-u5B9Eu4F53u7279u6027"><a name="实体特性" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实体特性</h1><p>实体特性位于命名空间 <strong>Chloe.Entity</strong> 下。<br><strong>TableAttribute：</strong><br>Name：映射的表名。<br>实体对应的表默认是实体类名，如实体类型名与表名不一致，可通过该特性指定映射的表名。</p>
<pre><code class="lang-csharp">public class TableAttribute : Attribute
{
    public TableAttribute();
    public TableAttribute(string name);

    public string Name { get; set; }
    public string Schema { get; set; }
}
</code></pre>
<p><strong>ColumnAttribute：</strong><br>Name：映射的列名，如不指定，则默认使用属性名。<br>IsPrimaryKey：指示列是否为主键，默认为 false。<br><strong>当一个实体没显示指定主键的时候，Chloe 默认选择名为 Id 的属性（如果存在）作为主键列，与此同时，如果该实体也没有显式指定任何自增列并且 Id 属性为 Int16、Int32 或者 Int64 类型，则也会默认其为自增列。如若不是自增列，可使用特性 NonAutoIncrementAttribute 标记</strong>。</p>
<pre><code class="lang-csharp">public class ColumnAttribute : Attribute
{
    public ColumnAttribute();
    public ColumnAttribute(string name);

    public string Name { get; set; }
    public bool IsPrimaryKey { get; set; }
    public DbType DbType { get; set; }
    public int Length { get; set; }
}
</code></pre>
<p><strong>AutoIncrementAttribute：</strong><br>标记属性为自增列。在 SQLite 中，一个实体不能指定多个自增列，否则会报异常提示。</p>
<pre><code class="lang-csharp">public class AutoIncrementAttribute : Attribute
{
    public AutoIncrementAttribute();
}
</code></pre>
<p><strong>NonAutoIncrementAttribute：</strong><br>标记属性为非自增列。</p>
<pre><code class="lang-csharp">public class NonAutoIncrementAttribute : Attribute
{
    public NonAutoIncrementAttribute();
}
</code></pre>
<p><strong>NotMappedAttribute：</strong><br>指示属性不映射任何列。</p>
<pre><code class="lang-csharp">public class NotMappedAttribute : Attribute
{
    public NotMappedAttribute();
}
</code></pre>
', '# 实体特性
实体特性位于命名空间 **Chloe.Entity** 下。
**TableAttribute：**
Name：映射的表名。
实体对应的表默认是实体类名，如实体类型名与表名不一致，可通过该特性指定映射的表名。
```csharp
public class TableAttribute : Attribute
{
    public TableAttribute();
    public TableAttribute(string name);

    public string Name { get; set; }
    public string Schema { get; set; }
}
```
**ColumnAttribute：**
Name：映射的列名，如不指定，则默认使用属性名。
IsPrimaryKey：指示列是否为主键，默认为 false。
**当一个实体没显示指定主键的时候，Chloe 默认选择名为 Id 的属性（如果存在）作为主键列，与此同时，如果该实体也没有显式指定任何自增列并且 Id 属性为 Int16、Int32 或者 Int64 类型，则也会默认其为自增列。如若不是自增列，可使用特性 NonAutoIncrementAttribute 标记**。
```csharp
public class ColumnAttribute : Attribute
{
    public ColumnAttribute();
    public ColumnAttribute(string name);

    public string Name { get; set; }
    public bool IsPrimaryKey { get; set; }
    public DbType DbType { get; set; }
    public int Length { get; set; }
}
```
**AutoIncrementAttribute：**
标记属性为自增列。在 SQLite 中，一个实体不能指定多个自增列，否则会报异常提示。
```csharp
public class AutoIncrementAttribute : Attribute
{
    public AutoIncrementAttribute();
}
```
**NonAutoIncrementAttribute：**
标记属性为非自增列。
```csharp
public class NonAutoIncrementAttribute : Attribute
{
    public NonAutoIncrementAttribute();
}
```
**NotMappedAttribute：**
指示属性不映射任何列。
```csharp
public class NotMappedAttribute : Attribute
{
    public NotMappedAttribute();
}
```', '2016-12-02 16:20:42.94', '2017-07-06 21:14:55.001501', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155511531208704, 'SQLite-实体定义', 'SQLite-实体定义', 'SQLite-实体定义', '<h1 id="h1-u5B9Eu4F53u5B9Au4E49"><a name="实体定义" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实体定义</h1><p>实体为纯 POCO，支持可空类型以及枚举类型映射。</p>
<pre><code class="lang-csharp">public enum Gender
{
    Man = 1,
    Woman
}
</code></pre>
<pre><code class="lang-csharp">[TableAttribute(&quot;Users&quot;)]
public class User
{
    [ColumnAttribute(&quot;Id&quot;, IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }

    [NotMappedAttribute]
    public string NotMappedProperty { get; set; }
}
</code></pre>
<pre><code class="lang-csharp">public class City
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}
</code></pre>
<pre><code class="lang-csharp">public class Province
{
    public int Id { get; set; }
    public string Name { get; set; }
}
</code></pre>
', '# 实体定义
实体为纯 POCO，支持可空类型以及枚举类型映射。
```csharp
public enum Gender
{
    Man = 1,
    Woman
}
```
```csharp
[TableAttribute("Users")]
public class User
{
    [ColumnAttribute("Id", IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }

    [NotMappedAttribute]
    public string NotMappedProperty { get; set; }
}
```
```csharp
public class City
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}
```
```csharp
public class Province
{
    public int Id { get; set; }
    public string Name { get; set; }
}
```', '2016-12-02 16:20:53.37', '2016-12-03 15:00:24.057', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155568988979200, 'SQLite-创建DbContext', 'SQLite-创建DbContext', 'SQLite-创建DbContext', '<h1 id="h1--dbcontext"><a name="创建 DbContext" class="reference-link"></a><span class="header-link octicon octicon-link"></span>创建 DbContext</h1><p>对于 SQLite 数据库，需要引用程序集 Chloe.dll 和 Chloe.SQLite.dll 以及 <strong>SQLite 的驱动</strong>，然后使用 Chloe.SQLite.SQLiteContext 创建上下文实例。<strong>注意：DbContext 实例非线程安全，不能设置为单例。同时，用完务必要将 DbContext 释放。</strong><br>因为框架本身需要与具体的数据库驱动解耦，所以 SQLiteContext 构造函数需要一个 IDbConnectionFactory 的参数，IDbConnectionFactory 接口只有一个 CreateConnection() 方法，必须先建个类，实现 CreateConnection 方法。</p>
<pre><code class="lang-csharp">public class SQLiteConnectionFactory : IDbConnectionFactory
{
    string _connString = null;
    public SQLiteConnectionFactory(string connString)
    {
        this._connString = connString;
    }
    public IDbConnection CreateConnection()
    {
        SQLiteConnection conn = new SQLiteConnection(this._connString);
        return conn;
    }
}
</code></pre>
<p>接下来就可以创建 SQLiteContext：</p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
SQLiteContext context = new SQLiteContext(new SQLiteConnectionFactory(connString));
</code></pre>
<p>ASP.NET CORE 配置 Service：</p>
<pre><code class="lang-csharp">public void ConfigureServices(IServiceCollection services)
{
    //...

    services.AddScoped&lt;Chloe.IDbContext&gt;((serviceProvider) =&gt;
    {
        return new Chloe.SQLite.SQLiteContext(new SQLiteConnectionFactory(&quot;Your connection string&quot;));
    });

    //...
}
</code></pre>
', '# 创建 DbContext
对于 SQLite 数据库，需要引用程序集 Chloe.dll 和 Chloe.SQLite.dll 以及 **SQLite 的驱动**，然后使用 Chloe.SQLite.SQLiteContext 创建上下文实例。**注意：DbContext 实例非线程安全，不能设置为单例。同时，用完务必要将 DbContext 释放。**
因为框架本身需要与具体的数据库驱动解耦，所以 SQLiteContext 构造函数需要一个 IDbConnectionFactory 的参数，IDbConnectionFactory 接口只有一个 CreateConnection() 方法，必须先建个类，实现 CreateConnection 方法。
```csharp
public class SQLiteConnectionFactory : IDbConnectionFactory
{
    string _connString = null;
    public SQLiteConnectionFactory(string connString)
    {
        this._connString = connString;
    }
    public IDbConnection CreateConnection()
    {
        SQLiteConnection conn = new SQLiteConnection(this._connString);
        return conn;
    }
}
```
接下来就可以创建 SQLiteContext：
```csharp
string connString = "Your connection string";
SQLiteContext context = new SQLiteContext(new SQLiteConnectionFactory(connString));
```
ASP.NET CORE 配置 Service：
```csharp
public void ConfigureServices(IServiceCollection services)
{
	//...
	
    services.AddScoped<Chloe.IDbContext>((serviceProvider) =>
    {
        return new Chloe.SQLite.SQLiteContext(new SQLiteConnectionFactory("Your connection string"));
    });
   
    //...
}
```', '2016-12-02 16:21:07.07', '2016-12-03 15:01:53.85', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155613347938304, 'SQLite-基本查询', 'SQLite-基本查询', 'SQLite-基本查询', '<h1 id="h1-u57FAu672Cu67E5u8BE2"><a name="基本查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>基本查询</h1><p><strong>根据 Id 查询出一个 User 对象：</strong></p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
SQLiteContext context = new SQLiteContext(new SQLiteConnectionFactory(connString));
IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

q.Where(a =&gt; a.Id == 1).FirstOrDefault();
/*
 *生成的 sql：
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] = 1 
   LIMIT 1 OFFSET 0
 */
</code></pre>
<p><strong>like 查询：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Name.Contains(&quot;so&quot;) || a.Name.StartsWith(&quot;s&quot;) || a.Name.EndsWith(&quot;o&quot;)).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users] 
 * WHERE ([Users].[Name] LIKE &#39;%&#39; || &#39;so&#39; || &#39;%&#39; OR [Users].[Name] LIKE &#39;s&#39; || &#39;%&#39; OR [Users].[Name] LIKE &#39;%&#39; || &#39;o&#39;)
 */
</code></pre>
<p><strong>in 查询：</strong></p>
<pre><code class="lang-csharp">List&lt;int&gt; ids = new List&lt;int&gt;() { 1, 2, 3 };
q.Where(a =&gt; ids.Contains(a.Id)).ToList();
/*
 * Int32 @P_0 = 1;
   Int32 @P_1 = 2;
   Int32 @P_2 = 3;
   SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] IN (@P_0,@P_1,@P_2)
 */

/* in 子查询 */
/* IQuery&lt;T&gt;.ToList().Contains() 方法组合就会生成 in 子查询 sql 语句 */
users = q.Where(a =&gt; context.Query&lt;City&gt;().Select(c =&gt; c.Id).ToList().Contains((int)a.CityId)).ToList(); 
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name]
 * FROM [Users] AS [Users] 
 * WHERE [Users].[CityId] IN (SELECT [City].[Id] AS [C] FROM [City] AS [City])
 */
</code></pre>
<p><strong>可以选取指定的字段，返回一个匿名类型：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id == 1).Select(a =&gt; new { a.Id, a.Name }).FirstOrDefault();
/*
 * 只会生成包含 Id 和 Name 两个字段的 sql 语句：
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] = 1 
   LIMIT 1 OFFSET 0
 */
</code></pre>
<p><strong>排序：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).ThenBy(a =&gt; a.Id).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] &gt; 0 
   ORDER BY [Users].[Age] ASC,[Users].[Id] ASC
 */
</code></pre>
<p><strong>分页：</strong></p>
<pre><code class="lang-csharp">q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).TakePage(1, 20).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] &gt; 0 
   ORDER BY [Users].[Age] ASC 
   LIMIT 20 OFFSET 0
 */
</code></pre>
<p><strong>distinct 查询：</strong></p>
<pre><code class="lang-csharp">q.Select(a =&gt; new { a.Name }).Distinct().ToList();
/*
 * SELECT DISTINCT [Users].[Name] AS [Name] FROM [Users] AS [Users]
 */
</code></pre>
<p><strong>exists 查询：</strong></p>
<pre><code class="lang-csharp">/* IQuery&lt;T&gt;.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query&lt;User&gt;().Where(a =&gt; context.Query&lt;City&gt;().Where(c =&gt; c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users] 
 * WHERE Exists (SELECT &#39;1&#39; AS [C] FROM [City] AS [City] WHERE [City].[Id] = [Users].[CityId])
 */
</code></pre>
<p>更多用法请查看<a href="/Wiki/Document/3325507078541279232" title="使用进阶">使用进阶</a>。</p>
', '# 基本查询
**根据 Id 查询出一个 User 对象：**
```csharp
string connString = "Your connection string";
SQLiteContext context = new SQLiteContext(new SQLiteConnectionFactory(connString));
IQuery<User> q = context.Query<User>();

q.Where(a => a.Id == 1).FirstOrDefault();
/*
 *生成的 sql：
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] = 1 
   LIMIT 1 OFFSET 0
 */
```
**like 查询：**
```csharp
q.Where(a => a.Name.Contains("so") || a.Name.StartsWith("s") || a.Name.EndsWith("o")).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users] 
 * WHERE ([Users].[Name] LIKE ''%'' || ''so'' || ''%'' OR [Users].[Name] LIKE ''s'' || ''%'' OR [Users].[Name] LIKE ''%'' || ''o'')
 */
```
**in 查询：**
```csharp
List<int> ids = new List<int>() { 1, 2, 3 };
q.Where(a => ids.Contains(a.Id)).ToList();
/*
 * Int32 @P_0 = 1;
   Int32 @P_1 = 2;
   Int32 @P_2 = 3;
   SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] IN (@P_0,@P_1,@P_2)
 */
 
/* in 子查询 */
/* IQuery<T>.ToList().Contains() 方法组合就会生成 in 子查询 sql 语句 */
users = q.Where(a => context.Query<City>().Select(c => c.Id).ToList().Contains((int)a.CityId)).ToList(); 
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name]
 * FROM [Users] AS [Users] 
 * WHERE [Users].[CityId] IN (SELECT [City].[Id] AS [C] FROM [City] AS [City])
 */
```
**可以选取指定的字段，返回一个匿名类型：**
```csharp
q.Where(a => a.Id == 1).Select(a => new { a.Id, a.Name }).FirstOrDefault();
/*
 * 只会生成包含 Id 和 Name 两个字段的 sql 语句：
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] = 1 
   LIMIT 1 OFFSET 0
 */
```
**排序：**
```csharp
q.Where(a => a.Id > 0).OrderBy(a => a.Age).ThenBy(a => a.Id).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] > 0 
   ORDER BY [Users].[Age] ASC,[Users].[Id] ASC
 */
```
**分页：**
```csharp
q.Where(a => a.Id > 0).OrderBy(a => a.Age).TakePage(1, 20).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
   FROM [Users] AS [Users] 
   WHERE [Users].[Id] > 0 
   ORDER BY [Users].[Age] ASC 
   LIMIT 20 OFFSET 0
 */
```
**distinct 查询：**
```csharp
q.Select(a => new { a.Name }).Distinct().ToList();
/*
 * SELECT DISTINCT [Users].[Name] AS [Name] FROM [Users] AS [Users]
 */
```
**exists 查询：**
```csharp
/* IQuery<T>.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query<User>().Where(a => context.Query<City>().Where(c => c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users] 
 * WHERE Exists (SELECT ''1'' AS [C] FROM [City] AS [City] WHERE [City].[Id] = [Users].[CityId])
 */
```
更多用法请查看[使用进阶](/Wiki/Document/3325507078541279232 "使用进阶")。', '2016-12-02 16:21:17.647', '2016-12-08 11:32:48.768084', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155661880229888, 'SQLite-连接查询', 'SQLite-连接查询', 'SQLite-连接查询', '<h1 id="h1-u8FDEu63A5u67E5u8BE2"><a name="连接查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>连接查询</h1><p>Chloe 友好支持多表连接查询，一切都可以用 lambda 表达式操作，返回类型可以是自定义类型，也可以是匿名类型。强类型开发，编译可见错误，容错率高。<br><strong>1.建立连接：</strong></p>
<pre><code class="lang-csharp">var user_city_province = context.Query&lt;User&gt;()
                         .InnerJoin&lt;City&gt;((user, city) =&gt; user.CityId == city.Id)
                         .InnerJoin&lt;Province&gt;((user, city, province) =&gt; city.ProvinceId == province.Id);
</code></pre>
<p><strong>2.得到一个 IJoiningQuery 对象，就可以 Select 所需要的数据返回一个 IQuery 对象，然后就可以进行 Where、OrderBy、GroupBy、分页、聚合查询等操作：</strong><br>查出一个用户及其隶属的城市和省份的所有信息：</p>
<pre><code class="lang-csharp">/* 调用 Select 方法返回一个泛型为包含 User、City、Province 匿名类型的 IQuery 对象。
 * Select 方法也可以返回自定义类型 。
 */
var qq = user_city_province.Select((user, city, province) =&gt; new
{
    User = user,
    City = city,
    Province = province
});

/* 根据条件筛选，然后调用 ToList 就会返回一个泛型为 new { User = user, City = city, Province = province } 的 List 集合 */
var result = qq.Where(a =&gt; a.User.Id == 1).ToList();

/*
 * 生成的 sql：
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[City].[Id] AS [Id0],[City].[Name] AS [Name0],[City].[ProvinceId] AS [ProvinceId],[Province].[Id] AS [Id1],[Province].[Name] AS [Name1] 
   FROM [Users] AS [Users] 
   INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
   WHERE [Users].[Id] = 1
 */

/* 如果不想返回所有字段，得到 IQuery 对象后可以进一步 Select 指定的字段提高查询性能 
 * ##推荐使用此方式##
 */
var result1 = qq.Where(a =&gt; a.User.Id == 1)
                .Select(a =&gt; new { UserId = a.User.Id, UserName = a.User.Name, CityName = a.City.Name, ProvinceName = a.Province.Name })
                .ToList();
</code></pre>
<p>可以只获取指定的字段信息：</p>
<pre><code class="lang-csharp">user_city_province.Select((user, city, province) =&gt; new
{
    UserId = user.Id,
    UserName = user.Name,
    CityName = city.Name,
    ProvinceName = province.Name
}).Where(a =&gt; a.UserId == 1).ToList();

/*
 * 生成的 sql 只会包含 UserId、UserName、CityName、ProvinceName 四个字段
 * SELECT [Users].[Id] AS [UserId],[Users].[Name] AS [UserName],[City].[Name] AS [CityName],[Province].[Name] AS [ProvinceName] 
   FROM [Users] AS [Users] 
   INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
   WHERE [Users].[Id] = 1
 */
</code></pre>
<p><strong>快捷连接</strong><br>框架提供了快捷连接的接口：</p>
<pre><code class="lang-csharp">context.JoinQuery&lt;User, City, Province&gt;((user, city, province) =&gt; new object[] 
{
    JoinType.LeftJoin, user.CityId == city.Id,          /* 表 User 和 City 进行Left连接 */
    JoinType.LeftJoin, city.ProvinceId == province.Id   /* 表 City 和 Province 进行Left连接 */
})
.Select((user, city, province) =&gt; new { User = user, City = city, Province = province })  /* 投影成匿名对象 */
.Where(a =&gt; a.User.Id &gt; -1)     /* 进行条件过滤 */
.OrderByDesc(a =&gt; a.User.Age)   /* 排序 */
.TakePage(1, 20)                /* 分页 */
.ToList();
</code></pre>
<p>框架亦支持左连接，用法和内连接相同。</p>
', '# 连接查询
Chloe 友好支持多表连接查询，一切都可以用 lambda 表达式操作，返回类型可以是自定义类型，也可以是匿名类型。强类型开发，编译可见错误，容错率高。
**1.建立连接：**
```csharp
var user_city_province = context.Query<User>()
                         .InnerJoin<City>((user, city) => user.CityId == city.Id)
                         .InnerJoin<Province>((user, city, province) => city.ProvinceId == province.Id);
```
**2.得到一个 IJoiningQuery 对象，就可以 Select 所需要的数据返回一个 IQuery 对象，然后就可以进行 Where、OrderBy、GroupBy、分页、聚合查询等操作：**
查出一个用户及其隶属的城市和省份的所有信息：
```csharp
/* 调用 Select 方法返回一个泛型为包含 User、City、Province 匿名类型的 IQuery 对象。
 * Select 方法也可以返回自定义类型 。
 */
var qq = user_city_province.Select((user, city, province) => new
{
    User = user,
    City = city,
    Province = province
});

/* 根据条件筛选，然后调用 ToList 就会返回一个泛型为 new { User = user, City = city, Province = province } 的 List 集合 */
var result = qq.Where(a => a.User.Id == 1).ToList();

/*
 * 生成的 sql：
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[City].[Id] AS [Id0],[City].[Name] AS [Name0],[City].[ProvinceId] AS [ProvinceId],[Province].[Id] AS [Id1],[Province].[Name] AS [Name1] 
   FROM [Users] AS [Users] 
   INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
   WHERE [Users].[Id] = 1
 */

/* 如果不想返回所有字段，得到 IQuery 对象后可以进一步 Select 指定的字段提高查询性能 
 * ##推荐使用此方式##
 */
var result1 = qq.Where(a => a.User.Id == 1)
                .Select(a => new { UserId = a.User.Id, UserName = a.User.Name, CityName = a.City.Name, ProvinceName = a.Province.Name })
                .ToList();
```
可以只获取指定的字段信息：
```csharp
user_city_province.Select((user, city, province) => new
{
    UserId = user.Id,
    UserName = user.Name,
    CityName = city.Name,
    ProvinceName = province.Name
}).Where(a => a.UserId == 1).ToList();

/*
 * 生成的 sql 只会包含 UserId、UserName、CityName、ProvinceName 四个字段
 * SELECT [Users].[Id] AS [UserId],[Users].[Name] AS [UserName],[City].[Name] AS [CityName],[Province].[Name] AS [ProvinceName] 
   FROM [Users] AS [Users] 
   INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
   WHERE [Users].[Id] = 1
 */
```
**快捷连接**
框架提供了快捷连接的接口：
```csharp
context.JoinQuery<User, City, Province>((user, city, province) => new object[] 
{
    JoinType.LeftJoin, user.CityId == city.Id,          /* 表 User 和 City 进行Left连接 */
    JoinType.LeftJoin, city.ProvinceId == province.Id   /* 表 City 和 Province 进行Left连接 */
})
.Select((user, city, province) => new { User = user, City = city, Province = province })  /* 投影成匿名对象 */
.Where(a => a.User.Id > -1)     /* 进行条件过滤 */
.OrderByDesc(a => a.User.Age)   /* 排序 */
.TakePage(1, 20)                /* 分页 */
.ToList();
```
框架亦支持左连接，用法和内连接相同。', '2016-12-02 16:21:29.217', '2017-06-18 18:21:36.9598469', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155712383844352, 'SQLite-分组查询', 'SQLite-分组查询', 'SQLite-分组查询', '<h1 id="h1-u5206u7EC4u67E5u8BE2"><a name="分组查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>分组查询</h1><p>Chloe 支持分组查询以及分组后 Having 过滤和聚合查询。</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

IGroupingQuery&lt;User&gt; g = q.Where(a =&gt; a.Id &gt; 0).GroupBy(a =&gt; a.Age);
// g = g.AndBy(a =&gt; a.Id);  //多个字段分组
g = g.Having(a =&gt; a.Age &gt; 1 &amp;&amp; Sql.Count() &gt; 0);

g.Select(a =&gt; new
{
    a.Age,
    Count = Sql.Count(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Avg = Sql.Average(a.Age)
}).ToList();
/*
 * SELECT [Users].[Age] AS [Age],COUNT(1) AS [Count],CAST(SUM([Users].[Age]) AS INTEGER) AS [Sum],CAST(MAX([Users].[Age]) AS INTEGER) AS [Max],CAST(MIN([Users].[Age]) AS INTEGER) AS [Min],CAST(AVG([Users].[Age]) AS REAL) AS [Avg] 
   FROM [Users] AS [Users] WHERE [Users].[Id] &gt; 0 
   GROUP BY [Users].[Age] 
   HAVING ([Users].[Age] &gt; 1 AND COUNT(1) &gt; 0)
 */
</code></pre>
', '# 分组查询
Chloe 支持分组查询以及分组后 Having 过滤和聚合查询。
```csharp
IQuery<User> q = context.Query<User>();

IGroupingQuery<User> g = q.Where(a => a.Id > 0).GroupBy(a => a.Age);
// g = g.AndBy(a => a.Id);  //多个字段分组
g = g.Having(a => a.Age > 1 && Sql.Count() > 0);

g.Select(a => new
{
    a.Age,
    Count = Sql.Count(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Avg = Sql.Average(a.Age)
}).ToList();
/*
 * SELECT [Users].[Age] AS [Age],COUNT(1) AS [Count],CAST(SUM([Users].[Age]) AS INTEGER) AS [Sum],CAST(MAX([Users].[Age]) AS INTEGER) AS [Max],CAST(MIN([Users].[Age]) AS INTEGER) AS [Min],CAST(AVG([Users].[Age]) AS REAL) AS [Avg] 
   FROM [Users] AS [Users] WHERE [Users].[Id] > 0 
   GROUP BY [Users].[Age] 
   HAVING ([Users].[Age] > 1 AND COUNT(1) > 0)
 */
```', '2016-12-02 16:21:41.26', '2016-12-03 15:08:44.08', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155763537575936, 'SQLite-聚合查询', 'SQLite-聚合查询', 'SQLite-聚合查询', '<h1 id="h1-u805Au5408u67E5u8BE2"><a name="聚合查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>聚合查询</h1><p>Chloe 可以像写 sql 一样实现聚合查询。</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

q.Select(a =&gt; Sql.Count()).First();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users] LIMIT 1 OFFSET 0
 */

/* 支持多个聚合函数 */
q.Select(a =&gt; new
{
    Count = Sql.Count(),
    LongCount = Sql.LongCount(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Average = Sql.Average(a.Age)
}).First();
/*
 * SELECT COUNT(1) AS [Count],COUNT(1) AS [LongCount],CAST(SUM([Users].[Age]) AS INTEGER) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS REAL) AS [Average] 
   FROM [Users] AS [Users] 
   LIMIT 1 OFFSET 0
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users]
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users]
 */

var sum = q.Sum(a =&gt; a.Age);
/*
 * SELECT CAST(SUM([Users].[Age]) AS INTEGER) AS [C] FROM [Users] AS [Users]
 */

var max = q.Max(a =&gt; a.Age);
/*
 * SELECT MAX([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var min = q.Min(a =&gt; a.Age);
/*
 * SELECT MIN([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var avg = q.Average(a =&gt; a.Age);
/*
 * SELECT CAST(AVG([Users].[Age]) AS REAL) AS [C] FROM [Users] AS [Users]
 */
</code></pre>
', '# 聚合查询
Chloe 可以像写 sql 一样实现聚合查询。
```csharp
IQuery<User> q = context.Query<User>();

q.Select(a => Sql.Count()).First();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users] LIMIT 1 OFFSET 0
 */

/* 支持多个聚合函数 */
q.Select(a => new
{
    Count = Sql.Count(),
    LongCount = Sql.LongCount(),
    Sum = Sql.Sum(a.Age),
    Max = Sql.Max(a.Age),
    Min = Sql.Min(a.Age),
    Average = Sql.Average(a.Age)
}).First();
/*
 * SELECT COUNT(1) AS [Count],COUNT(1) AS [LongCount],CAST(SUM([Users].[Age]) AS INTEGER) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS REAL) AS [Average] 
   FROM [Users] AS [Users] 
   LIMIT 1 OFFSET 0
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users]
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users]
 */

var sum = q.Sum(a => a.Age);
/*
 * SELECT CAST(SUM([Users].[Age]) AS INTEGER) AS [C] FROM [Users] AS [Users]
 */

var max = q.Max(a => a.Age);
/*
 * SELECT MAX([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var min = q.Min(a => a.Age);
/*
 * SELECT MIN([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var avg = q.Average(a => a.Age);
/*
 * SELECT CAST(AVG([Users].[Age]) AS REAL) AS [C] FROM [Users] AS [Users]
 */
```', '2016-12-02 16:21:53.453', '2016-12-03 15:09:42.68', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155811822403584, 'SQLite-执行Sql', 'SQLite-执行Sql', 'SQLite-执行Sql', '<h1 id="h1--sql"><a name="执行Sql" class="reference-link"></a><span class="header-link octicon octicon-link"></span>执行Sql</h1><p>对于一些极其复杂的 sql 查询，还是得依赖原生 sql，因此，Chloe 提供了原生 sql 查询接口。<br><strong>获取满足条件的用户信息，将结果映射到 User 类上：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;select * from Users where Age&gt;@age&quot;, new DbParam(&quot;@age&quot;, 18)).ToList();
</code></pre>
<p><strong>获取满足条件的用户 Id：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;int&gt;(&quot;select Id from Users where Age&gt;@age&quot;, new DbParam(&quot;@age&quot;, 18)).ToList();
</code></pre>
<p><strong>支持存储过程：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;Proc_Test&quot;, CommandType.StoredProcedure, new DbParam(&quot;@age&quot;, 18)).ToList();
</code></pre>
<p><strong>支持dynamic：</strong></p>
<pre><code class="lang-csharp">context.SqlQuery&lt;dynamic&gt;(&quot;select Id,Name from Users where Age&gt;@age&quot;, new DbParam(&quot;@age&quot;, 18)).ToList();
</code></pre>
<p><strong>传参方式2：</strong><br>该方法为扩展方法，定义在 Chloe.Extension.dll 中。</p>
<pre><code class="lang-csharp">context.SqlQuery&lt;User&gt;(&quot;select * from Users where Id=@Id&quot;, new { Id = 1 }).ToList();
</code></pre>
<p><strong>获取 DataTable：</strong><br>ExecuteDataTable 扩展方法位于 <a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs</a> 类中。</p>
<pre><code class="lang-csharp">DataTable dt = context.Session.ExecuteDataTable(&quot;select * from users where age&gt;=@age&quot;, new { age = 18 });
</code></pre>
<p><strong>FormatSqlQuery（仅.NET Core版本支持）：</strong><br>FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化，方法定义位于 <a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs</a> 类中。</p>
<pre><code class="lang-csharp">int age = 18;
List&lt;User&gt; users = context.FormatSqlQuery&lt;User&gt;($&quot;select * from Users where age&gt;={age}&quot;).ToList();

//或者
FormattableString sql = $&quot;select * from Users where age&gt;={age}&quot;; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery&lt;User&gt;(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 @P_0 = 18;
   select * from Users where age&gt;=@P_0
 */
</code></pre>
<p><strong>ado.net：</strong><br>基本的 ado.net 接口定义在 DbContext.Session 对象中。</p>
<pre><code class="lang-csharp">int rowsAffected = context.Session.ExecuteNonQuery(&quot;update Users set Age=18 where Id=1&quot;);
IDataReader dataReader = context.Session.ExecuteReader(&quot;select * from Users where Age&gt;18&quot;);
</code></pre>
', '# 执行Sql
对于一些极其复杂的 sql 查询，还是得依赖原生 sql，因此，Chloe 提供了原生 sql 查询接口。
**获取满足条件的用户信息，将结果映射到 User 类上：**
```csharp
context.SqlQuery<User>("select * from Users where Age>@age", new DbParam("@age", 18)).ToList();
```
**获取满足条件的用户 Id：**
```csharp
context.SqlQuery<int>("select Id from Users where Age>@age", new DbParam("@age", 18)).ToList();
```
**支持存储过程：**
```csharp
context.SqlQuery<User>("Proc_Test", CommandType.StoredProcedure, new DbParam("@age", 18)).ToList();
```
**支持dynamic：**
```csharp
context.SqlQuery<dynamic>("select Id,Name from Users where Age>@age", new DbParam("@age", 18)).ToList();
```
**传参方式2：**
该方法为扩展方法，定义在 Chloe.Extension.dll 中。
```csharp
context.SqlQuery<User>("select * from Users where Id=@Id", new { Id = 1 }).ToList();
```
**获取 DataTable：**
ExecuteDataTable 扩展方法位于 https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbSessionExtension.cs 类中。
```csharp
DataTable dt = context.Session.ExecuteDataTable("select * from users where age>=@age", new { age = 18 });
```
**FormatSqlQuery（仅.NET Core版本支持）：**
FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化，方法定义位于 https://github.com/shuxinqin/Chloe/blob/master/src/DotNetCore/Chloe.Extension/DbContextExtension_NETCORE.cs 类中。
```csharp
int age = 18;
List<User> users = context.FormatSqlQuery<User>($"select * from Users where age>={age}").ToList();

//或者
FormattableString sql = $"select * from Users where age>={age}"; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery<User>(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 @P_0 = 18;
   select * from Users where age>=@P_0
 */
```
**ado.net：**
基本的 ado.net 接口定义在 DbContext.Session 对象中。
```csharp
int rowsAffected = context.Session.ExecuteNonQuery("update Users set Age=18 where Id=1");
IDataReader dataReader = context.Session.ExecuteReader("select * from Users where Age>18");
```', '2016-12-02 16:22:04.967', '2016-12-03 15:10:32.847', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155856416243712, 'SQLite-插入数据', 'SQLite-插入数据', 'SQLite-插入数据', '<h1 id="h1-u63D2u5165u6570u636E"><a name="插入数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>插入数据</h1><p>Chloe 具备多种插入数据的方式。<br><strong>1.实体插入：</strong><br>该方式插入，如果一个实体存在自增列，会自动将自增列设置到相应的属性上。</p>
<pre><code class="lang-csharp">User user = new User();
user.Name = &quot;lu&quot;;
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = DateTime.Now;

/* 会自动将自增 Id 设置到 user 的 Id 属性上 */
user = context.Insert(user);
/*
 * String @P_0 = &#39;lu&#39;;
   Gender @P_1 = Man;
   Int32 @P_2 = 18;
   Int32 @P_3 = 1;
   DateTime @P_4 = &#39;2016/8/6 22:03:42&#39;;
   INSERT INTO [Users]([Name],[Gender],[Age],[CityId],[OpTime]) 
   VALUES(@P_0,@P_1,@P_2,@P_3,@P_4);SELECT LAST_INSERT_ROWID()
 */
</code></pre>
<p><strong>2.lambda 方式插入：</strong><br>此种方式插入的好处是，可以指定列插入，就像写 sql 一样简单。<br>同时，该方式插入返回表主键值。如果实体主键是自增列，返回值就会是自增值。</p>
<pre><code class="lang-csharp">/* 返回主键 Id */
int id = (int)context.Insert&lt;User&gt;(() =&gt; new User()
{
    Name = &quot;lu&quot;,
    Age = 18,
    Gender = Gender.Man,
    CityId = 1,
    OpTime = DateTime.Now
});
/*
 * INSERT INTO [Users]([Name],[Age],[Gender],[CityId],[OpTime]) 
   VALUES(&#39;lu&#39;,18,1,1,DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;));SELECT LAST_INSERT_ROWID()
 */
</code></pre>
', '# 插入数据
Chloe 具备多种插入数据的方式。
**1.实体插入：**
该方式插入，如果一个实体存在自增列，会自动将自增列设置到相应的属性上。
```csharp
User user = new User();
user.Name = "lu";
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = DateTime.Now;

/* 会自动将自增 Id 设置到 user 的 Id 属性上 */
user = context.Insert(user);
/*
 * String @P_0 = ''lu'';
   Gender @P_1 = Man;
   Int32 @P_2 = 18;
   Int32 @P_3 = 1;
   DateTime @P_4 = ''2016/8/6 22:03:42'';
   INSERT INTO [Users]([Name],[Gender],[Age],[CityId],[OpTime]) 
   VALUES(@P_0,@P_1,@P_2,@P_3,@P_4);SELECT LAST_INSERT_ROWID()
 */
```
**2.lambda 方式插入：**
此种方式插入的好处是，可以指定列插入，就像写 sql 一样简单。
同时，该方式插入返回表主键值。如果实体主键是自增列，返回值就会是自增值。
```csharp
/* 返回主键 Id */
int id = (int)context.Insert<User>(() => new User()
{
    Name = "lu",
    Age = 18,
    Gender = Gender.Man,
    CityId = 1,
    OpTime = DateTime.Now
});
/*
 * INSERT INTO [Users]([Name],[Age],[Gender],[CityId],[OpTime]) 
   VALUES(''lu'',18,1,1,DATETIME(''NOW'',''LOCALTIME''));SELECT LAST_INSERT_ROWID()
 */
```', '2016-12-02 16:22:15.6', '2016-12-03 15:11:56.117', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155899147812864, 'SQLite-更新数据', 'SQLite-更新数据', 'SQLite-更新数据', '<h1 id="h1-u66F4u65B0u6570u636E"><a name="更新数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>更新数据</h1><p>Chloe 支持两种数据更新方式。<br><strong>1.实体更新：</strong></p>
<pre><code class="lang-csharp">User user = new User();
user.Id = 1;
user.Name = &quot;lu&quot;;
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

/* 更新所有映射的字段 */
context.Update(user);
/*
 * String @P_0 = &#39;lu&#39;;
   Gender @P_1 = Man;
   Int32 @P_2 = 28;
   Nullable&lt;Int32&gt; @P_3 = NULL;
   DateTime @P_4 = &#39;2016/8/6 22:05:02&#39;;
   Int32 @P_5 = 1;
   UPDATE [Users] SET [Name]=@P_0,[Gender]=@P_1,[Age]=@P_2,[CityId]=@P_3,[OpTime]=@P_4 
   WHERE [Users].[Id] = @P_5
 */
</code></pre>
<p>由于 user 对象未被上下文跟踪，这会使所有的映射列都会被更新。Chloe 也支持类似 EF 一样只更新被修改过的属性。</p>
<pre><code class="lang-csharp">/*
 * 支持只更新属性值已变的属性
 */

/* 在修改实体属性前让上下文跟踪实体 */
context.TrackEntity(user);

/* 然后再修改实体属性 */
user.Name = user.Name + &quot;1&quot;;

/* 然后调用 Update 方法，这时只会更新被修改过的属性 */
context.Update(user);
/*
 * String @P_0 = &#39;lu1&#39;;
   Int32 @P_1 = 1;
   UPDATE [Users] SET [Name]=@P_0 WHERE [Users].[Id] = @P_1
 */
</code></pre>
<p><strong>2.lambda 方式更新：</strong><br>该方式解决的问题是：1.指定列更新；2.批量更新；3.支持类似 Age=Age + 100 这样更新字段。用法如下：</p>
<pre><code class="lang-csharp">context.Update&lt;User&gt;(a =&gt; a.Age &gt; 18, a =&gt; new User()
{
    Name = a.Name,
    Age = a.Age + 100,
    Gender = Gender.Man,
    OpTime = DateTime.Now
});
/*
 * UPDATE [Users] SET [Name]=[Users].[Name],[Age]=([Users].[Age] + 100),[Gender]=1,[OpTime]=DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;) 
   WHERE [Users].[Id] &gt; 18
 */
</code></pre>
', '# 更新数据
Chloe 支持两种数据更新方式。
**1.实体更新：**
```csharp
User user = new User();
user.Id = 1;
user.Name = "lu";
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

/* 更新所有映射的字段 */
context.Update(user);
/*
 * String @P_0 = ''lu'';
   Gender @P_1 = Man;
   Int32 @P_2 = 28;
   Nullable<Int32> @P_3 = NULL;
   DateTime @P_4 = ''2016/8/6 22:05:02'';
   Int32 @P_5 = 1;
   UPDATE [Users] SET [Name]=@P_0,[Gender]=@P_1,[Age]=@P_2,[CityId]=@P_3,[OpTime]=@P_4 
   WHERE [Users].[Id] = @P_5
 */
```
由于 user 对象未被上下文跟踪，这会使所有的映射列都会被更新。Chloe 也支持类似 EF 一样只更新被修改过的属性。
```csharp
/*
 * 支持只更新属性值已变的属性
 */

/* 在修改实体属性前让上下文跟踪实体 */
context.TrackEntity(user);

/* 然后再修改实体属性 */
user.Name = user.Name + "1";

/* 然后调用 Update 方法，这时只会更新被修改过的属性 */
context.Update(user);
/*
 * String @P_0 = ''lu1'';
   Int32 @P_1 = 1;
   UPDATE [Users] SET [Name]=@P_0 WHERE [Users].[Id] = @P_1
 */
```
**2.lambda 方式更新：**
该方式解决的问题是：1.指定列更新；2.批量更新；3.支持类似 Age=Age + 100 这样更新字段。用法如下：
```csharp
context.Update<User>(a => a.Age > 18, a => new User()
{
    Name = a.Name,
    Age = a.Age + 100,
    Gender = Gender.Man,
    OpTime = DateTime.Now
});
/*
 * UPDATE [Users] SET [Name]=[Users].[Name],[Age]=([Users].[Age] + 100),[Gender]=1,[OpTime]=DATETIME(''NOW'',''LOCALTIME'') 
   WHERE [Users].[Id] > 18
 */
```', '2016-12-02 16:22:25.787', '2016-12-03 15:13:36.627', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155947889819648, 'SQLite-删除数据', 'SQLite-删除数据', 'SQLite-删除数据', '<h1 id="h1-u5220u9664u6570u636E"><a name="删除数据" class="reference-link"></a><span class="header-link octicon octicon-link"></span>删除数据</h1><p>Chloe 支持两种数据删除方式。<br><strong>1.实体删除：</strong><br>该方式删除必须要求实体拥有一个主键，否则会报异常提示。</p>
<pre><code class="lang-csharp">User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 @P_0 = 1;
   DELETE FROM [Users] WHERE [Users].[Id] = @P_0
 */
</code></pre>
<p><strong>2.lambda 方式删除：</strong><br>使用该方式可以删除单条数据，也可以删除多条数据。</p>
<pre><code class="lang-csharp">/* 删除单条数据 */
context.Delete&lt;User&gt;(a =&gt; a.Id == 1);
/*
 * DELETE FROM [Users] WHERE [Users].[Id] = 1
 */

/* 批量删除满足条件的数据 */
context.Delete&lt;User&gt;(a =&gt; a.Age &gt; 18);
/*
 * DELETE FROM [Users] WHERE [Users].[Age] &gt; 18
 */
</code></pre>
', '# 删除数据
Chloe 支持两种数据删除方式。
**1.实体删除：**
该方式删除必须要求实体拥有一个主键，否则会报异常提示。
```csharp
User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 @P_0 = 1;
   DELETE FROM [Users] WHERE [Users].[Id] = @P_0
 */
```
**2.lambda 方式删除：**
使用该方式可以删除单条数据，也可以删除多条数据。
```csharp
/* 删除单条数据 */
context.Delete<User>(a => a.Id == 1);
/*
 * DELETE FROM [Users] WHERE [Users].[Id] = 1
 */

/* 批量删除满足条件的数据 */
context.Delete<User>(a => a.Age > 18);
/*
 * DELETE FROM [Users] WHERE [Users].[Age] > 18
 */
```', '2016-12-02 16:22:37.407', '2016-12-03 15:15:01.497', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325155999823691776, 'SQLite-存储过程', 'SQLite-存储过程', 'SQLite-存储过程', '<p>SQLite 不支持存储过程。</p>
', 'SQLite 不支持存储过程。', '2016-12-02 16:22:49.79', '2016-12-03 15:16:06.117', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325156054349643776, 'SQLite-事务', 'SQLite-事务', 'SQLite-事务', '<h1 id="h1-u4E8Bu52A1u652Fu6301"><a name="事务支持" class="reference-link"></a><span class="header-link octicon octicon-link"></span>事务支持</h1><p><strong>基本用法：</strong></p>
<pre><code class="lang-csharp">string connString = &quot;Your connection string&quot;;
using (SQLiteContext context = new SQLiteContext(new SQLiteConnectionFactory(connString)))
{
    try
    {
        context.Session.BeginTransaction();

        /* do some things here */
        context.Update(user);
        context.Delete&lt;User&gt;(a =&gt; a.Gender == null);

        context.Session.CommitTransaction();
    }
    catch
    {
        if (context.Session.IsInTransaction)
            context.Session.RollbackTransaction();
        throw;
    }
}
</code></pre>
', '# 事务支持
**基本用法：**
```csharp
string connString = "Your connection string";
using (SQLiteContext context = new SQLiteContext(new SQLiteConnectionFactory(connString)))
{
    try
    {
        context.Session.BeginTransaction();

        /* do some things here */
        context.Update(user);
        context.Delete<User>(a => a.Gender == null);

        context.Session.CommitTransaction();
    }
    catch
    {
        if (context.Session.IsInTransaction)
            context.Session.RollbackTransaction();
        throw;
    }
}
```', '2016-12-02 16:23:02.79', '2016-12-03 15:15:43.01', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325156110087749632, 'SQLite-常用函数', 'SQLite-常用函数', 'SQLite-常用函数', '<h1 id="h1-u5E38u7528u51FDu6570"><a name="常用函数" class="reference-link"></a><span class="header-link octicon octicon-link"></span>常用函数</h1><p><strong>Chloe 对很多数据库函数支持很丰富，具体用法如下：</strong></p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; q = context.Query&lt;User&gt;();

var space = new char[] { &#39; &#39; };

DateTime startTime = DateTime.Now;
DateTime endTime = DateTime.Now.AddDays(1);

var ret = q.Select(a =&gt; new
{
    Id = a.Id,

    String_Length = (int?)a.Name.Length,//LENGTH([Users].[Name])
    Substring = a.Name.Substring(0),//SUBSTR([Users].[Name],0 + 1)
    Substring1 = a.Name.Substring(1),//SUBSTR([Users].[Name],1 + 1)
    Substring1_2 = a.Name.Substring(1, 2),//SUBSTR([Users].[Name],1 + 1,2)
    ToLower = a.Name.ToLower(),//LOWER([Users].[Name])
    ToUpper = a.Name.ToUpper(),//UPPER([Users].[Name])
    IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//CASE WHEN ([Users].[Name] IS NULL OR [Users].[Name] = &#39;&#39;) THEN 1 ELSE 0 END = 1
    Contains = (bool?)a.Name.Contains(&quot;s&quot;),//[Users].[Name] LIKE &#39;%&#39; || &#39;s&#39; || &#39;%&#39;
    StartsWith = (bool?)a.Name.StartsWith(&quot;s&quot;),//[Users].[Name] LIKE &#39;s&#39; || &#39;%&#39;
    EndsWith = (bool?)a.Name.EndsWith(&quot;s&quot;),//[Users].[Name] LIKE &#39;%&#39; || &#39;s&#39;
    Trim = a.Name.Trim(),//TRIM([Users].[Name])
    TrimStart = a.Name.TrimStart(space),//LTRIM([Users].[Name])
    TrimEnd = a.Name.TrimEnd(space),//RTRIM([Users].[Name])

    DiffYears = DbFunctions.DiffYears(startTime, endTime),//(CAST(STRFTIME(&#39;%Y&#39;,@P_0) AS INTEGER) - CAST(STRFTIME(&#39;%Y&#39;,@P_1) AS INTEGER))
    DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//((CAST(STRFTIME(&#39;%Y&#39;,@P_0) AS INTEGER) - CAST(STRFTIME(&#39;%Y&#39;,@P_1) AS INTEGER)) * 12 + (CAST(STRFTIME(&#39;%m&#39;,@P_0) AS INTEGER) - CAST(STRFTIME(&#39;%m&#39;,@P_1) AS INTEGER)))
    DiffDays = DbFunctions.DiffDays(startTime, endTime),//CAST((JULIANDAY(@P_0) - JULIANDAY(@P_1)) AS INTEGER)
    DiffHours = DbFunctions.DiffHours(startTime, endTime),//CAST((JULIANDAY(@P_0) - JULIANDAY(@P_1)) * 24 AS INTEGER)
    DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//CAST((JULIANDAY(@P_0) - JULIANDAY(@P_1)) * 1440 AS INTEGER)
    DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//CAST((JULIANDAY(@P_0) - JULIANDAY(@P_1)) * 86400 AS INTEGER)
    //DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//不支持 Millisecond
    //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//不支持 Microseconds

    AddYears = startTime.AddYears(1),//DATETIME(@P_0,&#39;+&#39; || 1 || &#39; years&#39;)
    AddMonths = startTime.AddMonths(1),//DATETIME(@P_0,&#39;+&#39; || 1 || &#39; months&#39;)
    AddDays = startTime.AddDays(1),//DATETIME(@P_0,&#39;+&#39; || 1 || &#39; days&#39;)
    AddHours = startTime.AddHours(1),//DATETIME(@P_0,&#39;+&#39; || 1 || &#39; hours&#39;)
    AddMinutes = startTime.AddMinutes(2),//DATETIME(@P_0,&#39;+&#39; || 2 || &#39; minutes&#39;)
    AddSeconds = startTime.AddSeconds(120),//DATETIME(@P_0,&#39;+&#39; || 120 || &#39; seconds&#39;)
    //AddMilliseconds = startTime.AddMilliseconds(2000),//不支持

    Now = DateTime.Now,//DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;)
    UtcNow = DateTime.UtcNow,//DATETIME()
    Today = DateTime.Today,//DATE(&#39;NOW&#39;,&#39;LOCALTIME&#39;)
    Date = DateTime.Now.Date,//DATE(&#39;NOW&#39;,&#39;LOCALTIME&#39;)
    Year = DateTime.Now.Year,//CAST(STRFTIME(&#39;%Y&#39;,DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;)) AS INTEGER)
    Month = DateTime.Now.Month,//CAST(STRFTIME(&#39;%m&#39;,DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;)) AS INTEGER)
    Day = DateTime.Now.Day,//CAST(STRFTIME(&#39;%d&#39;,DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;)) AS INTEGER)
    Hour = DateTime.Now.Hour,//CAST(STRFTIME(&#39;%H&#39;,DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;)) AS INTEGER)
    Minute = DateTime.Now.Minute,//CAST(STRFTIME(&#39;%M&#39;,DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;)) AS INTEGER)
    Second = DateTime.Now.Second,//CAST(STRFTIME(&#39;%S&#39;,DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;)) AS INTEGER)
    Millisecond = DateTime.Now.Millisecond,//@P_2 直接计算 DateTime.Now.Millisecond 的值 
    DayOfWeek = DateTime.Now.DayOfWeek,//CAST(STRFTIME(&#39;%w&#39;,DATETIME(&#39;NOW&#39;,&#39;LOCALTIME&#39;)) AS INTEGER)

    Byte_Parse = byte.Parse(&quot;1&quot;),//CAST(&#39;1&#39; AS INTEGER)
    Int_Parse = int.Parse(&quot;1&quot;),//CAST(&#39;1&#39; AS INTEGER)
    Int16_Parse = Int16.Parse(&quot;11&quot;),//CAST(&#39;11&#39; AS INTEGER)
    Long_Parse = long.Parse(&quot;2&quot;),//CAST(&#39;2&#39; AS INTEGER)
    Double_Parse = double.Parse(&quot;3.1&quot;),//CAST(&#39;3.1&#39; AS REAL)
    Float_Parse = float.Parse(&quot;4.1&quot;),//CAST(&#39;4.1&#39; AS REAL)
    //Decimal_Parse = decimal.Parse(&quot;5&quot;),//不支持
    //Guid_Parse = Guid.Parse(&quot;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&quot;),//不支持 &#39;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&#39;

    Bool_Parse = bool.Parse(&quot;1&quot;),//CAST(&#39;1&#39; AS INTEGER)
    DateTime_Parse = DateTime.Parse(&quot;2014-01-01&quot;),//DATETIME(&#39;2014-01-01&#39;)
}).ToList();
</code></pre>
<p>上述的函数可以用于 Select 方法，亦可用在 Where 或其它方法的 lambda 表达式树中，最终都会翻译成数据库函数。</p>
', '# 常用函数
**Chloe 对很多数据库函数支持很丰富，具体用法如下：**
```csharp
IQuery<User> q = context.Query<User>();

var space = new char[] { '' '' };

DateTime startTime = DateTime.Now;
DateTime endTime = DateTime.Now.AddDays(1);

var ret = q.Select(a => new
{
    Id = a.Id,

    String_Length = (int?)a.Name.Length,//LENGTH([Users].[Name])
    Substring = a.Name.Substring(0),//SUBSTR([Users].[Name],0 + 1)
    Substring1 = a.Name.Substring(1),//SUBSTR([Users].[Name],1 + 1)
    Substring1_2 = a.Name.Substring(1, 2),//SUBSTR([Users].[Name],1 + 1,2)
    ToLower = a.Name.ToLower(),//LOWER([Users].[Name])
    ToUpper = a.Name.ToUpper(),//UPPER([Users].[Name])
    IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//CASE WHEN ([Users].[Name] IS NULL OR [Users].[Name] = '''') THEN 1 ELSE 0 END = 1
    Contains = (bool?)a.Name.Contains("s"),//[Users].[Name] LIKE ''%'' || ''s'' || ''%''
    StartsWith = (bool?)a.Name.StartsWith("s"),//[Users].[Name] LIKE ''s'' || ''%''
    EndsWith = (bool?)a.Name.EndsWith("s"),//[Users].[Name] LIKE ''%'' || ''s''
    Trim = a.Name.Trim(),//TRIM([Users].[Name])
    TrimStart = a.Name.TrimStart(space),//LTRIM([Users].[Name])
    TrimEnd = a.Name.TrimEnd(space),//RTRIM([Users].[Name])

    DiffYears = DbFunctions.DiffYears(startTime, endTime),//(CAST(STRFTIME(''%Y'',@P_0) AS INTEGER) - CAST(STRFTIME(''%Y'',@P_1) AS INTEGER))
    DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//((CAST(STRFTIME(''%Y'',@P_0) AS INTEGER) - CAST(STRFTIME(''%Y'',@P_1) AS INTEGER)) * 12 + (CAST(STRFTIME(''%m'',@P_0) AS INTEGER) - CAST(STRFTIME(''%m'',@P_1) AS INTEGER)))
    DiffDays = DbFunctions.DiffDays(startTime, endTime),//CAST((JULIANDAY(@P_0) - JULIANDAY(@P_1)) AS INTEGER)
    DiffHours = DbFunctions.DiffHours(startTime, endTime),//CAST((JULIANDAY(@P_0) - JULIANDAY(@P_1)) * 24 AS INTEGER)
    DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//CAST((JULIANDAY(@P_0) - JULIANDAY(@P_1)) * 1440 AS INTEGER)
    DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//CAST((JULIANDAY(@P_0) - JULIANDAY(@P_1)) * 86400 AS INTEGER)
    //DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//不支持 Millisecond
    //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//不支持 Microseconds

    AddYears = startTime.AddYears(1),//DATETIME(@P_0,''+'' || 1 || '' years'')
    AddMonths = startTime.AddMonths(1),//DATETIME(@P_0,''+'' || 1 || '' months'')
    AddDays = startTime.AddDays(1),//DATETIME(@P_0,''+'' || 1 || '' days'')
    AddHours = startTime.AddHours(1),//DATETIME(@P_0,''+'' || 1 || '' hours'')
    AddMinutes = startTime.AddMinutes(2),//DATETIME(@P_0,''+'' || 2 || '' minutes'')
    AddSeconds = startTime.AddSeconds(120),//DATETIME(@P_0,''+'' || 120 || '' seconds'')
    //AddMilliseconds = startTime.AddMilliseconds(2000),//不支持

    Now = DateTime.Now,//DATETIME(''NOW'',''LOCALTIME'')
    UtcNow = DateTime.UtcNow,//DATETIME()
    Today = DateTime.Today,//DATE(''NOW'',''LOCALTIME'')
    Date = DateTime.Now.Date,//DATE(''NOW'',''LOCALTIME'')
    Year = DateTime.Now.Year,//CAST(STRFTIME(''%Y'',DATETIME(''NOW'',''LOCALTIME'')) AS INTEGER)
    Month = DateTime.Now.Month,//CAST(STRFTIME(''%m'',DATETIME(''NOW'',''LOCALTIME'')) AS INTEGER)
    Day = DateTime.Now.Day,//CAST(STRFTIME(''%d'',DATETIME(''NOW'',''LOCALTIME'')) AS INTEGER)
    Hour = DateTime.Now.Hour,//CAST(STRFTIME(''%H'',DATETIME(''NOW'',''LOCALTIME'')) AS INTEGER)
    Minute = DateTime.Now.Minute,//CAST(STRFTIME(''%M'',DATETIME(''NOW'',''LOCALTIME'')) AS INTEGER)
    Second = DateTime.Now.Second,//CAST(STRFTIME(''%S'',DATETIME(''NOW'',''LOCALTIME'')) AS INTEGER)
    Millisecond = DateTime.Now.Millisecond,//@P_2 直接计算 DateTime.Now.Millisecond 的值 
    DayOfWeek = DateTime.Now.DayOfWeek,//CAST(STRFTIME(''%w'',DATETIME(''NOW'',''LOCALTIME'')) AS INTEGER)

    Byte_Parse = byte.Parse("1"),//CAST(''1'' AS INTEGER)
    Int_Parse = int.Parse("1"),//CAST(''1'' AS INTEGER)
    Int16_Parse = Int16.Parse("11"),//CAST(''11'' AS INTEGER)
    Long_Parse = long.Parse("2"),//CAST(''2'' AS INTEGER)
    Double_Parse = double.Parse("3.1"),//CAST(''3.1'' AS REAL)
    Float_Parse = float.Parse("4.1"),//CAST(''4.1'' AS REAL)
    //Decimal_Parse = decimal.Parse("5"),//不支持
    //Guid_Parse = Guid.Parse("D544BC4C-739E-4CD3-A3D3-7BF803FCE179"),//不支持 ''D544BC4C-739E-4CD3-A3D3-7BF803FCE179''

    Bool_Parse = bool.Parse("1"),//CAST(''1'' AS INTEGER)
    DateTime_Parse = DateTime.Parse("2014-01-01"),//DATETIME(''2014-01-01'')
}).ToList();
```
上述的函数可以用于 Select 方法，亦可用在 Where 或其它方法的 lambda 表达式树中，最终都会翻译成数据库函数。', '2016-12-02 16:23:16.08', '2016-12-03 15:16:51.38', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325175022200291328, 'Chloe.ORM-更新记录', 'Chloe.ORM-更新记录', 'Chloe.ORM-更新记录', '<ul>
<li><strong>2018-3-11</strong><ul>
<li>修改在lambda中使用子查询作为相等判断的操作数时生成复杂的sql影响效率问题，如q.Where(a =&gt; a.Id == context.Query&lt;TestEntity&gt;().First().Id)</li><li>版本更新至 v2.25.0</li></ul>
</li><li><strong>2018-2-3</strong><ul>
<li>新增API：IDbContext.SqlQuery&lt;T&gt;(string sql, object parameter)</li><li>IDbContextServiceProvider -&gt; IDatabaseProvider</li><li>版本更新至 v2.24.0</li></ul>
</li><li><strong>2018-1-6</strong><ul>
<li>修改 IQuery.Average 部分方法的返回类型（所有Average方法将返回可空类型，避免当数据量为空时报错）</li><li>标记 AggregateFunctions 和 DbFunctions 类 ObsoleteAttribute，取而代之使用 Chloe.Sql</li><li>版本更新至 v2.23.0</li></ul>
</li><li><strong>2017-11-20</strong><ul>
<li>新增api：IJoiningQuery.Where()</li><li>lambda中使用相等(==)或不相等(!=)判断考虑数据库null值问题，如 a.Name == a.XName 会被翻译成 a.Name == a.XName or (a.Name is null and a.XName is null)；a.Name != a.XName 会被翻译成 a.Name &lt;&gt; a.XName or (a.Name is null and a.XName is not null) or (a.Name is not null and a.XName is null)</li><li>增加判断相等和不等api：Sql.Equals&lt;T&gt;(T value1, T value2)，Sql.NotEquals&lt;T&gt;(T value1, T value2)，此两个接口不会考虑数据库null值问题</li><li>整合 .NET CORE 和 .NET Framework nuget安装包，统一使用安装命令 Install-Package Chloe.xxx，即 .NET CORE 版不再使用额外的安装包 ChloeCore.xxx</li><li>版本更新至 v2.22.0</li></ul>
</li><li><strong>2017-10-27</strong><ul>
<li>支持 string.Replace()</li><li>版本更新至 v2.21.1</li></ul>
</li><li><strong>2017-10-20</strong><ul>
<li>支持数据库 int64 类型数据映射到枚举</li><li>优化 ‘IN’ 查询</li><li>性能优化</li><li>版本更新至 v2.21.0</li></ul>
</li><li><strong>2017-10-11</strong><ul>
<li>fix bug：对于实体包含类型为double，float，decimal的属性，调用 IDbContext.InsertRange() 方法插入数据时，生成错误sql导致插入数据有误。</li><li>版本更新至 v2.19.0</li></ul>
</li><li><strong>2017-9-25</strong><ul>
<li>支持Distinct：IQuery&lt;T&gt;.Distinct()</li><li>支持取负操作：a=&gt; -a.Id</li><li>修改查询如：query.Take(10).GroupBy(a =&gt; a.Id) ，先Take或Skip，然后在GroupBy操作，生成错误sql的bug</li><li>丰富子查询，支持 exists(select id from …)，in(select id from …) 等操作，具体用法：<a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/ChloeDemo/MsSqlDemo.cs#L212">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/ChloeDemo/MsSqlDemo.cs#L212</a></li><li>版本更新至 v2.18.0</li></ul>
</li><li><strong>2017-9-18</strong><ul>
<li>新增api：IDbContext.InsertRange()</li><li>Chloe.SqlServer：支持 SqlBulkCopy 批量插入数据接口，MsSqlContext.BulkInsert()</li><li>Chloe.Oracle：对于 a =&gt; a.Name == “” 将被翻译成 Name is null</li><li>版本更新至 v2.17.0</li></ul>
</li><li><strong>2017-9-3</strong><ul>
<li>api ‘IDbContext.SqlQuery&lt;dynamic&gt;()’ 的泛型参数支持 dynamic 类型</li><li>在 lambda 中支持使用’ToString()’方法（仅部分类型）</li><li>版本更新至 v2.16.0</li></ul>
</li><li><strong>2017-8-24</strong><ul>
<li>支持 .NET Core2.0</li><li>版本更新至 v2.15.0</li></ul>
</li><li><strong>2017-8-12</strong><ul>
<li>新增api：IGroupingQuery&lt;T&gt;.OrderBy() 和 IGroupingQuery&lt;T&gt;.OrderByDesc()</li><li>版本更新至 v2.14.0</li></ul>
</li><li><strong>2017-8-10</strong><ul>
<li>lambda 表达式中支持 decimal 类型数值相加</li><li>版本更新至 v2.13.0</li></ul>
</li><li><strong>2017-7-9</strong><ul>
<li>实体支持多主键</li><li>版本更新至 v2.12.0</li></ul>
</li><li><strong>2017-7-6</strong><ul>
<li>issue#18：支持数据库 byte 类型映射到枚举</li><li>修改Chloe.MySql、ChloeSQLite BUG：在 lambda 表达式树中使用 ‘bool.Parse(“1”)’ 方法时生成错误 sql</li><li>版本更新至 v2.11.0</li></ul>
</li><li><strong>2017-6-18</strong><ul>
<li>增加更易用的多表连接查询接口 DbContext.JoinQuery</li><li>修改连续调用 Skip 方法时生成错误的 sql 语句 bug，如 IQuery.Skip(10).Skip(5)</li><li>版本更新至 v2.10.0</li></ul>
</li><li><strong>2017-6-15</strong><ul>
<li>支持插入无主键的实体</li><li>将特性 SequenceAttribute 命名空间修改为 Chloe.Entity，同时将其移到 Chloe/Entity 文件夹下</li><li>增加 Add DbExpressionType.Coalesce，修改 ?? 操作符生成sql策略: 如 a.Age??18 将会被翻译成相应的数据库函数，如 ISNULL(Age,18)</li><li>修改 IDbSession.BeginTransaction() 的实现：之前版本其内部统一使用 IsolationLevel.ReadCommitted，现修改为调用数据库驱动的无参方法，即 DbConnection.BeginTransaction()</li><li>版本更新至 v2.9.0</li></ul>
</li><li><strong>2017-6-4</strong><ul>
<li>CURD 支持指定表名</li><li>Chloe.SQLite 增加读写锁</li><li>修改BUG：当枚举类型不是 int 类型时，将枚举值转换为数据库值报错</li><li>版本更新至 v2.8.0</li></ul>
</li><li><strong>2017-5-21</strong><ul>
<li>特性 TableAttribute 支持设置 Schema</li><li>修改issue#14 Query().Sum 的bug</li><li>略微调整字符串相加生成的sql策略</li><li>版本更新至 v2.7.0</li></ul>
</li><li><strong>2017-4-8</strong><ul>
<li>特性 ColumnAttribute 增加 DbType 和 Length</li><li>支持注册映射类型</li><li>在lambda表达式树中支持取模运算符</li><li>DbContext.SqlQuery&lt;T&gt;() 移除对泛型 T 的 new() 约束</li><li>支持数据库 int16 类型映射到 C# 枚举类型</li><li>Chloe.Oracle：支持数据库 int16 类型映射到 C# 的 bool 类型</li><li>IGroupingQuery&lt;T&gt;.ThenBy() 更改为 IGroupingQuery&lt;T&gt;.AndBy()</li><li>版本更新至 v2.6.0</li></ul>
</li><li><strong>2017-3-3</strong><ul>
<li>简化连接查询操作#9：IJoiningQuery 接口增加多个重载方法，支持 query.LeftJoin((a, b) =&gt; a.SN == b.UserSN).LeftJoin((a,b,c) =&gt; b.Id==c.BId)… 写法</li><li>移除 DbContext.Query&lt;TEntity&gt;() 和 DbContext.QueryByKey&lt;TEntity&gt;(object key, bool tracking = false) 的泛型 TEntity 约束(where TEntity : new())，改为抛出异常的方式，即当传入的 TEntity 泛型不含有空构造函数时会报异常提示</li><li>修复bug：执行分组查询如 g = g.Having(a =&gt; true); 时，解析 a =&gt; true lambda表达式树生成错误 sql 问题</li><li>移除废弃的接口，DbContext.CurrentSession 和 DbContext.Update&lt;TEntity&gt;(Expression&lt;Func&lt;TEntity, TEntity&gt;&gt; body, Expression&lt;Func&lt;TEntity, bool&gt;&gt; condition)</li><li>更改开源协议：由 apache 2.0 更改为更加宽松的 MIT 开源协议</li><li>版本更新至 v2.5.0</li></ul>
</li><li><strong>2017-1-19</strong><ul>
<li>支持在lambda中使用Nullable&lt;T&gt;.HasValue 和 obj.Equals(object obj)</li><li>版本更新至 v2.4.0</li></ul>
</li><li><strong>2017-1-6</strong><ul>
<li>增加 sql 拦截器功能</li><li>修复问题：.Net Core 版本中通过 DbContext.SqlQuery() 或 IDbSession.ExecuteReader() 方法调用存储过程，如果有输出参数（output），方法执行完得不到返回的参数值</li><li>版本更新至 v2.3.0</li></ul>
</li><li><strong>2016-12-20</strong><ul>
<li>Fixes bug: 执行查询如 context.Query&lt;User&gt;().Select(a =&gt; new User() { Id = a.Id, Age = a.Age }).Where(a =&gt; a.Id == 1).ToList();，其中，User.Id 是继承属性，当调用投影映射 Select 方法 Id=a.Id 后，后续的Where或其它方法lambda中用到Id这个属性，会出现异常问题。</li><li>版本更新至 v2.2.1</li></ul>
</li><li><strong>2016-12-18</strong><ul>
<li>修改内容：增加API IDbContext.QueryByKey(object key) 和 IDbContext.DeleteByKey(object key)</li><li>版本更新至 v2.2.0</li></ul>
</li><li><strong>2016-12-10</strong><ul>
<li>修改内容：如果一个继承属性出现在 IQuery.Select 方法的 lambda 中，会出现空引用异常，现已修复</li><li>版本更新至 v2.1.2</li></ul>
</li><li><strong>2016-12-7</strong><ul>
<li>修改内容：InternalDbSession 中的 IDbCommand 是单例可重用的，所以，每次调用 PrepareCommand 方法时需要清掉上次执行的残留参数，即执行 cmd.Parameters.Clear()（主要防止以下“特俗”情况：当执行 sql 过程出现异常，会来不及调用 cmd.Parameters.Clear()，就会出现残留的参数，为了保证每次使用 IDbCommand 不受上次异常情况下的影响，所以得清除一下上次残留的参数）</li><li>版本更新至 v2.1.1</li></ul>
</li><li><p><strong>2016-12-4</strong></p>
<ul>
<li>支持 Oracle 数据库</li><li>实体支持继承</li><li>支持存储过程</li><li>重命名：NotAutoIncrementAttribute —&gt; NonAutoIncrementAttribute</li><li>废弃 DbContext.CurrentSession 属性，取而代之 DbContext.Session</li><li>IQuery 接口增加 TakePage 方法</li><li>内部代码结构调整</li><li>版本升级至 v2.1.0</li></ul>
</li><li><p><strong>2016-8-26</strong></p>
<ul>
<li>版本升级至 v2.0.0</li><li>发布 ChloeCore.MySql NuGet 包</li></ul>
</li><li><p><strong>2016-8-8</strong></p>
<ul>
<li>支持 SQLite 数据库</li><li>.NET Ver update: v1.0.2</li><li>.NET Core Ver update: v1.0.4</li></ul>
</li><li><p><strong>2016-8-1</strong></p>
<ul>
<li>支持 .NET Core</li><li>发行 NuGet 包<ul>
<li>.NET Ver: v1.0.1</li><li>.NET Core Ver: v1.0.3</li></ul>
</li></ul>
</li><li><p><strong>2016-7-25</strong></p>
<ul>
<li>支持 MySql 数据库</li></ul>
</li><li><p><strong>2016-7-4</strong></p>
<ul>
<li>正式开源</li></ul>
</li></ul>
', '* **2018-3-11**
	* 修改在lambda中使用子查询作为相等判断的操作数时生成复杂的sql影响效率问题，如q.Where(a => a.Id == context.Query<TestEntity>().First().Id)
	* 版本更新至 v2.25.0
* **2018-2-3**
	* 新增API：IDbContext.SqlQuery<T>(string sql, object parameter)
	* IDbContextServiceProvider -> IDatabaseProvider
	* 版本更新至 v2.24.0
* **2018-1-6**
	* 修改 IQuery.Average 部分方法的返回类型（所有Average方法将返回可空类型，避免当数据量为空时报错）
	* 标记 AggregateFunctions 和 DbFunctions 类 ObsoleteAttribute，取而代之使用 Chloe.Sql
	* 版本更新至 v2.23.0
* **2017-11-20**
	* 新增api：IJoiningQuery.Where()
	* lambda中使用相等(==)或不相等(!=)判断考虑数据库null值问题，如 a.Name == a.XName 会被翻译成 a.Name == a.XName or (a.Name is null and a.XName is null)；a.Name != a.XName 会被翻译成 a.Name <> a.XName or (a.Name is null and a.XName is not null) or (a.Name is not null and a.XName is null)
	* 增加判断相等和不等api：Sql.Equals<T>(T value1, T value2)，Sql.NotEquals<T>(T value1, T value2)，此两个接口不会考虑数据库null值问题
	* 整合 .NET CORE 和 .NET Framework nuget安装包，统一使用安装命令 Install-Package Chloe.xxx，即 .NET CORE 版不再使用额外的安装包 ChloeCore.xxx
	* 版本更新至 v2.22.0
* **2017-10-27**
	* 支持 string.Replace()
	* 版本更新至 v2.21.1
* **2017-10-20**
	* 支持数据库 int64 类型数据映射到枚举
	* 优化 ''IN'' 查询
	* 性能优化
	* 版本更新至 v2.21.0
* **2017-10-11**
	* fix bug：对于实体包含类型为double，float，decimal的属性，调用 IDbContext.InsertRange() 方法插入数据时，生成错误sql导致插入数据有误。
	* 版本更新至 v2.19.0
* **2017-9-25**
	* 支持Distinct：IQuery<T>.Distinct()
	* 支持取负操作：a=> -a.Id
	* 修改查询如：query.Take(10).GroupBy(a => a.Id) ，先Take或Skip，然后在GroupBy操作，生成错误sql的bug
	* 丰富子查询，支持 exists(select id from ...)，in(select id from ...) 等操作，具体用法：https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/ChloeDemo/MsSqlDemo.cs#L212
	* 版本更新至 v2.18.0
* **2017-9-18**
	* 新增api：IDbContext.InsertRange()
	* Chloe.SqlServer：支持 SqlBulkCopy 批量插入数据接口，MsSqlContext.BulkInsert()
	* Chloe.Oracle：对于 a => a.Name == "" 将被翻译成 Name is null
	* 版本更新至 v2.17.0
* **2017-9-3**
	* api ''IDbContext.SqlQuery<dynamic>()'' 的泛型参数支持 dynamic 类型
	* 在 lambda 中支持使用'ToString()''方法（仅部分类型）
	* 版本更新至 v2.16.0
* **2017-8-24**
	* 支持 .NET Core2.0
	* 版本更新至 v2.15.0
* **2017-8-12**
	* 新增api：IGroupingQuery<T>.OrderBy() 和 IGroupingQuery<T>.OrderByDesc()
	* 版本更新至 v2.14.0
* **2017-8-10**
	* lambda 表达式中支持 decimal 类型数值相加
	* 版本更新至 v2.13.0
* **2017-7-9**
	* 实体支持多主键
	* 版本更新至 v2.12.0
* **2017-7-6**
	* issue#18：支持数据库 byte 类型映射到枚举
	* 修改Chloe.MySql、ChloeSQLite BUG：在 lambda 表达式树中使用 ''bool.Parse("1")'' 方法时生成错误 sql
	* 版本更新至 v2.11.0
* **2017-6-18**
	* 增加更易用的多表连接查询接口 DbContext.JoinQuery
	* 修改连续调用 Skip 方法时生成错误的 sql 语句 bug，如 IQuery.Skip(10).Skip(5)
	* 版本更新至 v2.10.0
* **2017-6-15**
	* 支持插入无主键的实体
	* 将特性 SequenceAttribute 命名空间修改为 Chloe.Entity，同时将其移到 Chloe/Entity 文件夹下
	* 增加 Add DbExpressionType.Coalesce，修改 ?? 操作符生成sql策略: 如 a.Age??18 将会被翻译成相应的数据库函数，如 ISNULL(Age,18)
	* 修改 IDbSession.BeginTransaction() 的实现：之前版本其内部统一使用 IsolationLevel.ReadCommitted，现修改为调用数据库驱动的无参方法，即 DbConnection.BeginTransaction()
	* 版本更新至 v2.9.0
* **2017-6-4**
	* CURD 支持指定表名
	* Chloe.SQLite 增加读写锁
	* 修改BUG：当枚举类型不是 int 类型时，将枚举值转换为数据库值报错
	* 版本更新至 v2.8.0
* **2017-5-21**
	* 特性 TableAttribute 支持设置 Schema
	* 修改issue#14 Query().Sum 的bug
	* 略微调整字符串相加生成的sql策略
	* 版本更新至 v2.7.0
* **2017-4-8**
	* 特性 ColumnAttribute 增加 DbType 和 Length
	* 支持注册映射类型
	* 在lambda表达式树中支持取模运算符
	* DbContext.SqlQuery<T>() 移除对泛型 T 的 new() 约束
	* 支持数据库 int16 类型映射到 C# 枚举类型
	* Chloe.Oracle：支持数据库 int16 类型映射到 C# 的 bool 类型
	* IGroupingQuery<T>.ThenBy() 更改为 IGroupingQuery<T>.AndBy()
	* 版本更新至 v2.6.0
* **2017-3-3**
	* 简化连接查询操作#9：IJoiningQuery 接口增加多个重载方法，支持 query.LeftJoin((a, b) => a.SN == b.UserSN).LeftJoin((a,b,c) => b.Id==c.BId)... 写法
	* 移除 DbContext.Query<TEntity>() 和 DbContext.QueryByKey<TEntity>(object key, bool tracking = false) 的泛型 TEntity 约束(where TEntity : new())，改为抛出异常的方式，即当传入的 TEntity 泛型不含有空构造函数时会报异常提示
	* 修复bug：执行分组查询如 g = g.Having(a => true); 时，解析 a => true lambda表达式树生成错误 sql 问题
	* 移除废弃的接口，DbContext.CurrentSession 和 DbContext.Update<TEntity>(Expression<Func<TEntity, TEntity>> body, Expression<Func<TEntity, bool>> condition)
	* 更改开源协议：由 apache 2.0 更改为更加宽松的 MIT 开源协议
	* 版本更新至 v2.5.0
* **2017-1-19**
	* 支持在lambda中使用Nullable<T>.HasValue 和 obj.Equals(object obj)
	* 版本更新至 v2.4.0
* **2017-1-6**
	* 增加 sql 拦截器功能
	* 修复问题：.Net Core 版本中通过 DbContext.SqlQuery() 或 IDbSession.ExecuteReader() 方法调用存储过程，如果有输出参数（output），方法执行完得不到返回的参数值
	* 版本更新至 v2.3.0
* **2016-12-20**
	* Fixes bug: 执行查询如 context.Query<User>().Select(a => new User() { Id = a.Id, Age = a.Age }).Where(a => a.Id == 1).ToList();，其中，User.Id 是继承属性，当调用投影映射 Select 方法 Id=a.Id 后，后续的Where或其它方法lambda中用到Id这个属性，会出现异常问题。
	* 版本更新至 v2.2.1
* **2016-12-18**
	* 修改内容：增加API IDbContext.QueryByKey(object key) 和 IDbContext.DeleteByKey(object key)
	* 版本更新至 v2.2.0
* **2016-12-10**
	* 修改内容：如果一个继承属性出现在 IQuery.Select 方法的 lambda 中，会出现空引用异常，现已修复
	* 版本更新至 v2.1.2
* **2016-12-7**
	* 修改内容：InternalDbSession 中的 IDbCommand 是单例可重用的，所以，每次调用 PrepareCommand 方法时需要清掉上次执行的残留参数，即执行 cmd.Parameters.Clear()（主要防止以下“特俗”情况：当执行 sql 过程出现异常，会来不及调用 cmd.Parameters.Clear()，就会出现残留的参数，为了保证每次使用 IDbCommand 不受上次异常情况下的影响，所以得清除一下上次残留的参数）
	* 版本更新至 v2.1.1
* **2016-12-4**
	* 支持 Oracle 数据库
	* 实体支持继承
	* 支持存储过程
	* 重命名：NotAutoIncrementAttribute --> NonAutoIncrementAttribute
	* 废弃 DbContext.CurrentSession 属性，取而代之 DbContext.Session
	* IQuery 接口增加 TakePage 方法
	* 内部代码结构调整
	* 版本升级至 v2.1.0

* **2016-8-26**
	* 版本升级至 v2.0.0
	* 发布 ChloeCore.MySql NuGet 包

* **2016-8-8**
	* 支持 SQLite 数据库
	* .NET Ver update: v1.0.2
	* .NET Core Ver update: v1.0.4

* **2016-8-1**
	* 支持 .NET Core
    * 发行 NuGet 包
      * .NET Ver: v1.0.1
      * .NET Core Ver: v1.0.3

* **2016-7-25**
    * 支持 MySql 数据库

* **2016-7-4**
	* 正式开源
', '2016-12-02 17:38:25.077', '2017-07-09 09:31:51.670567', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325507078541279232, '使用进阶-复杂查询', '使用进阶-复杂查询', '使用进阶-复杂查询', '<h1 id="h1-u590Du6742u67E5u8BE2"><a name="复杂查询" class="reference-link"></a><span class="header-link octicon octicon-link"></span>复杂查询</h1><p>IQuery&lt;T&gt; 接口支持多表连接查询、聚合查询、分组查询，这几个接口配合使用可以让我们开发达到事半功倍的效果。对于一般的复杂查询，Chloe 还是游刃有余的。<br><strong>example 1：</strong><br>连接子查询：</p>
<pre><code class="lang-csharp">var userQuery = context.Query&lt;User&gt;();

var cityIdsQuery = context.Query&lt;City&gt;().Where(a =&gt; a.Name.Contains(&quot;北京&quot;)).Select(a =&gt; a.Id);

/* 建立连接 */
var view = userQuery.InnerJoin(cityIdsQuery, (user, cityId) =&gt; user.CityId == cityId).Select((user, cityId) =&gt; user);

/* 执行查询 */
List&lt;User&gt; userList = view.ToList();

/*
 * 生成的 sql：
 * SELECT [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
   FROM [Users] AS [Users] 
   INNER JOIN 
   (SELECT [City].[Id] AS [C] FROM [City] AS [City] WHERE [City].[Name] LIKE &#39;%&#39; + N&#39;北京&#39; + &#39;%&#39;) AS [T] 
   ON [Users].[CityId] = [T].[C]
 */
</code></pre>
<p><strong>example 2：连接、分组、聚合查询结合</strong><br>现有 Users 表、City 表，他们的关系是一个 User 隶属一个 City，一个 City 有多个用户。假设，现在有需求要查出 City 的信息，<strong>同时也要把该 City 下用户最小的年龄输出</strong>，如果用原生 sql 写的话大概是：</p>
<pre><code class="lang-sql">select City.*,T.MinAge from City left join (select CityId,Min(Users.Age) as MinAge 
from Users group by Users.CityId) as T on City.Id=T.CityId
</code></pre>
<p>这类的查询 Chloe 也完全可以做到：</p>
<pre><code class="lang-csharp">IQuery&lt;User&gt; users = context.Query&lt;User&gt;();
IQuery&lt;City&gt; cities = context.Query&lt;City&gt;();
var gq = users.GroupBy(a =&gt; a.CityId).Select(a =&gt; new { a.CityId, MinAge = AggregateFunctions.Min(a.Age) });

cities.LeftJoin(gq, (city, g) =&gt; city.Id == g.CityId).Select((city, g) =&gt; new { City = city, MinAge = g.MinAge }).ToList();
/*
 * SELECT [T].[MinAge] AS [MinAge],[City].[Id] AS [Id],[City].[Name] AS [Name],[City].[ProvinceId] AS [ProvinceId] 
   FROM [City] AS [City] 
   LEFT JOIN (SELECT [Users].[CityId] AS [CityId],MIN([Users].[Age]) AS [MinAge] 
   FROM [Users] AS [Users] GROUP BY [Users].[CityId]) AS [T] ON [City].[Id] = [T].[CityId]
 */
</code></pre>
<p><strong>exists 查询：</strong></p>
<pre><code class="lang-csharp">/* IQuery&lt;T&gt;.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query&lt;User&gt;().Where(a =&gt; context.Query&lt;City&gt;().Where(c =&gt; c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users] 
 * WHERE Exists (SELECT N&#39;1&#39; AS [C] FROM [City] AS [City] WHERE [City].[Id] = [Users].[CityId])
 */
</code></pre>
<p><strong>select 子查询：</strong></p>
<pre><code class="lang-csharp">var result = context.Query&lt;User&gt;().Select(a =&gt; new
{
    CityName = context.Query&lt;City&gt;().Where(c =&gt; c.Id == a.CityId).First().Name,
    User = a
}).ToList();
/*
 * SELECT 
 *      (SELECT TOP (1) [City].[Name] AS [C] FROM [City] AS [City] WHERE [City].[Id] = [Users].[CityId]) AS [CityName],
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users]
 */
</code></pre>
<p><strong>统计：</strong></p>
<pre><code class="lang-csharp">var statisticsResult = context.Query&lt;City&gt;().Select(a =&gt; new
{
    UserCount = context.Query&lt;User&gt;().Where(u =&gt; u.CityId == a.Id).Count(),
    MaxAge = context.Query&lt;User&gt;().Where(u =&gt; u.CityId == a.Id).Max(c =&gt; c.Age),
    AvgAge = context.Query&lt;User&gt;().Where(u =&gt; u.CityId == a.Id).Average(c =&gt; c.Age),
}).ToList();
/*
 * SELECT 
 *      (SELECT COUNT(1) AS [C] FROM [Users] AS [Users] WHERE [Users].[CityId] = [City].[Id]) AS [UserCount],
 *      (SELECT MAX([Users].[Age]) AS [C] FROM [Users] AS [Users] WHERE [Users].[CityId] = [City].[Id]) AS [MaxAge],
 *      (SELECT CAST(AVG([Users].[Age]) AS FLOAT) AS [C] FROM [Users] AS [Users] WHERE [Users].[CityId] = [City].[Id]) AS [AvgAge]
 * FROM [City] AS [City]
 */
</code></pre>
', '# 复杂查询
IQuery<T> 接口支持多表连接查询、聚合查询、分组查询，这几个接口配合使用可以让我们开发达到事半功倍的效果。对于一般的复杂查询，Chloe 还是游刃有余的。
**example 1：**
连接子查询：
```csharp
var userQuery = context.Query<User>();

var cityIdsQuery = context.Query<City>().Where(a => a.Name.Contains("北京")).Select(a => a.Id);

/* 建立连接 */
var view = userQuery.InnerJoin(cityIdsQuery, (user, cityId) => user.CityId == cityId).Select((user, cityId) => user);

/* 执行查询 */
List<User> userList = view.ToList();

/*
 * 生成的 sql：
 * SELECT [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
   FROM [Users] AS [Users] 
   INNER JOIN 
   (SELECT [City].[Id] AS [C] FROM [City] AS [City] WHERE [City].[Name] LIKE ''%'' + N''北京'' + ''%'') AS [T] 
   ON [Users].[CityId] = [T].[C]
 */
```
**example 2：连接、分组、聚合查询结合**
现有 Users 表、City 表，他们的关系是一个 User 隶属一个 City，一个 City 有多个用户。假设，现在有需求要查出 City 的信息，**同时也要把该 City 下用户最小的年龄输出**，如果用原生 sql 写的话大概是：
```sql
select City.*,T.MinAge from City left join (select CityId,Min(Users.Age) as MinAge 
from Users group by Users.CityId) as T on City.Id=T.CityId
```
这类的查询 Chloe 也完全可以做到：
```csharp
IQuery<User> users = context.Query<User>();
IQuery<City> cities = context.Query<City>();
var gq = users.GroupBy(a => a.CityId).Select(a => new { a.CityId, MinAge = AggregateFunctions.Min(a.Age) });

cities.LeftJoin(gq, (city, g) => city.Id == g.CityId).Select((city, g) => new { City = city, MinAge = g.MinAge }).ToList();
/*
 * SELECT [T].[MinAge] AS [MinAge],[City].[Id] AS [Id],[City].[Name] AS [Name],[City].[ProvinceId] AS [ProvinceId] 
   FROM [City] AS [City] 
   LEFT JOIN (SELECT [Users].[CityId] AS [CityId],MIN([Users].[Age]) AS [MinAge] 
   FROM [Users] AS [Users] GROUP BY [Users].[CityId]) AS [T] ON [City].[Id] = [T].[CityId]
 */
```
**exists 查询：**
```csharp
/* IQuery<T>.Any() 方法组合就会生成 exists 子查询 sql 语句 */
users = context.Query<User>().Where(a => context.Query<City>().Where(c => c.Id == a.CityId).Any()).ToList();
/*
 * SELECT 
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users] 
 * WHERE Exists (SELECT N''1'' AS [C] FROM [City] AS [City] WHERE [City].[Id] = [Users].[CityId])
 */
```
**select 子查询：**
```csharp
var result = context.Query<User>().Select(a => new
{
    CityName = context.Query<City>().Where(c => c.Id == a.CityId).First().Name,
    User = a
}).ToList();
/*
 * SELECT 
 *      (SELECT TOP (1) [City].[Name] AS [C] FROM [City] AS [City] WHERE [City].[Id] = [Users].[CityId]) AS [CityName],
 *      [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
 * FROM [Users] AS [Users]
 */
```
**统计：**
```csharp
var statisticsResult = context.Query<City>().Select(a => new
{
    UserCount = context.Query<User>().Where(u => u.CityId == a.Id).Count(),
    MaxAge = context.Query<User>().Where(u => u.CityId == a.Id).Max(c => c.Age),
    AvgAge = context.Query<User>().Where(u => u.CityId == a.Id).Average(c => c.Age),
}).ToList();
/*
 * SELECT 
 *      (SELECT COUNT(1) AS [C] FROM [Users] AS [Users] WHERE [Users].[CityId] = [City].[Id]) AS [UserCount],
 *      (SELECT MAX([Users].[Age]) AS [C] FROM [Users] AS [Users] WHERE [Users].[CityId] = [City].[Id]) AS [MaxAge],
 *      (SELECT CAST(AVG([Users].[Age]) AS FLOAT) AS [C] FROM [Users] AS [Users] WHERE [Users].[CityId] = [City].[Id]) AS [AvgAge]
 * FROM [City] AS [City]
 */
```', '2016-12-03 15:37:53.477', '2016-12-23 23:36:12.3604783', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325512137098395648, '使用进阶-动态排序', '使用进阶-动态排序', '使用进阶-动态排序', '<h1 id="h1-u52A8u6001u6392u5E8F"><a name="动态排序" class="reference-link"></a><span class="header-link octicon octicon-link"></span>动态排序</h1><p>在一些后台系统中，很多查询的排序字段是不定的，需要动态排序的场景不少。动态排序接口以扩展的形式实现，需要引用 Chloe.Extension.dll，nuget 安装命令：<strong>Install-Package Chloe.Extension</strong><br><strong>简单用法：</strong><br>这种用法针对简单的实体。</p>
<pre><code class="lang-csharp">var userQuery = context.Query&lt;User&gt;();
userQuery = userQuery.OrderBy(&quot;Age asc,Id desc&quot;);/* 传入字符串，多个排序以 &#39;,&#39; 分隔 */
List&lt;User&gt; users = userQuery.ToList();
/*
 * 生成的 sql：
 * SELECT [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
   FROM [Users] AS [Users] 
   ORDER BY [Users].[Age] ASC,[Users].[Id] DESC
 */
</code></pre>
<p><strong>高级用法：</strong><br>当查询返回的类型是复杂类型的时候可以使用这种用法。</p>
<pre><code class="lang-csharp">var userQuery = context.Query&lt;User&gt;();
var cityQuery = context.Query&lt;City&gt;();

/* 建立连接 */
var user_city = userQuery.LeftJoin(cityQuery, (user, city) =&gt; user.CityId == city.Id);

/* Select 返回的是一个复杂的匿名类型 */
var view = user_city.Select((user, city) =&gt; new { User = user, City = city });

/* 传入字符串排序 */
view = view.OrderBy(&quot;User.Age asc,User.Id desc&quot;);
var result = view.ToList();
/*
 * SELECT [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name],[City].[Id] AS [Id0],[City].[Name] AS [Name0],[City].[ProvinceId] AS [ProvinceId] 
   FROM [Users] AS [Users] 
   LEFT JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   ORDER BY [Users].[Age] ASC,[Users].[Id] DESC
 */
</code></pre>
', '# 动态排序
在一些后台系统中，很多查询的排序字段是不定的，需要动态排序的场景不少。动态排序接口以扩展的形式实现，需要引用 Chloe.Extension.dll，nuget 安装命令：**Install-Package Chloe.Extension**
**简单用法：**
这种用法针对简单的实体。
```csharp
var userQuery = context.Query<User>();
userQuery = userQuery.OrderBy("Age asc,Id desc");/* 传入字符串，多个排序以 '','' 分隔 */
List<User> users = userQuery.ToList();
/*
 * 生成的 sql：
 * SELECT [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name] 
   FROM [Users] AS [Users] 
   ORDER BY [Users].[Age] ASC,[Users].[Id] DESC
 */
```
**高级用法：**
当查询返回的类型是复杂类型的时候可以使用这种用法。
```csharp
var userQuery = context.Query<User>();
var cityQuery = context.Query<City>();

/* 建立连接 */
var user_city = userQuery.LeftJoin(cityQuery, (user, city) => user.CityId == city.Id);

/* Select 返回的是一个复杂的匿名类型 */
var view = user_city.Select((user, city) => new { User = user, City = city });

/* 传入字符串排序 */
view = view.OrderBy("User.Age asc,User.Id desc");
var result = view.ToList();
/*
 * SELECT [Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[Users].[Id] AS [Id],[Users].[Name] AS [Name],[City].[Id] AS [Id0],[City].[Name] AS [Name0],[City].[ProvinceId] AS [ProvinceId] 
   FROM [Users] AS [Users] 
   LEFT JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
   ORDER BY [Users].[Age] ASC,[Users].[Id] DESC
 */
```', '2016-12-03 15:57:59.533', '2017-04-03 21:54:05.1723479', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325833069088210944, 'Github-Chloe-README.md', 'Github-Chloe-README.md', 'Github-Chloe-README.md', '<h1 id="h1-chloe"><a name="Chloe" class="reference-link"></a><span class="header-link octicon octicon-link"></span>Chloe</h1><p>Chloe is a lightweight Object/Relational Mapping(ORM) library.<br>The query interface is similar to LINQ.You can query data like LINQ and do any things(Join Query | Group Query | Aggregate Query | Insert | Batch Update | Batch Delete) by lambda with Chloe.ORM.</p>
<p><strong>Documentation</strong>: <a href="http://www.52chloe.com/Wiki/Document" title="http://www.52chloe.com/Wiki/Document">http://www.52chloe.com/Wiki/Document</a> .NET交流群：325936847，只要您<strong>愿意</strong>，即可加入 </p>
<p><strong>Source code of ‘www.52chloe.com’</strong>: <a href="https://github.com/shuxinqin/Ace" title="https://github.com/shuxinqin/Ace">https://github.com/shuxinqin/Ace</a></p>
<h1 id="h1-nuget-install-command"><a name="NuGet Install Command" class="reference-link"></a><span class="header-link octicon octicon-link"></span>NuGet Install Command</h1><table>
<thead>
<tr>
<th></th>
<th>.NET Framework</th>
<th>.NET Core</th>
</tr>
</thead>
<tbody>
<tr>
<td>SqlServer</td>
<td>Install-Package Chloe.SqlServer</td>
<td>Install-Package ChloeCore.SqlServer</td>
</tr>
<tr>
<td>MySql</td>
<td>Install-Package Chloe.MySql</td>
<td>Install-Package ChloeCore.MySql</td>
</tr>
<tr>
<td>Oracle</td>
<td>Install-Package Chloe.Oracle</td>
<td>-</td>
</tr>
<tr>
<td>SQLite</td>
<td>Install-Package Chloe.SQLite</td>
<td>Install-Package ChloeCore.SQLite</td>
</tr>
</tbody>
</table>
<h1 id="h1-usage"><a name="Usage" class="reference-link"></a><span class="header-link octicon octicon-link"></span>Usage</h1><ul>
<li><strong>Entity</strong><br>```C#<br>public enum Gender<br>{<br>  Man = 1,<br>  Woman<br>}</li></ul>
<p>[Table(“Users”)]<br>public class User<br>{<br>    [Column(IsPrimaryKey = true)]<br>    [AutoIncrement]<br>    public int Id { get; set; }<br>    public string Name { get; set; }<br>    public Gender? Gender { get; set; }<br>    public int? Age { get; set; }<br>    public int? CityId { get; set; }<br>    public DateTime? OpTime { get; set; }<br>}</p>
<p>public class City<br>{<br>    [Column(IsPrimaryKey = true)]<br>    public int Id { get; set; }<br>    public string Name { get; set; }<br>    public int ProvinceId { get; set; }<br>}</p>
<p>public class Province<br>{<br>    [Column(IsPrimaryKey = true)]<br>    public int Id { get; set; }<br>    public string Name { get; set; }<br>}</p>
<pre><code>* **DbContext**
```C#
IDbContext context = new MsSqlContext(DbHelper.ConnectionString);
IQuery&lt;User&gt; q = context.Query&lt;User&gt;();
</code></pre><ul>
<li><strong>Query</strong><br>```C#<br>IQuery&lt;User&gt; q = context.Query&lt;User&gt;();<br>q.Where(a =&gt; a.Id &gt; 0).FirstOrDefault();<br>q.Where(a =&gt; a.Id &gt; 0).ToList();<br>q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).ToList();<br>q.Where(a =&gt; a.Id &gt; 0).Take(999).OrderBy(a =&gt; a.Age).ToList();</li></ul>
<p>q.Where(a =&gt; a.Id &gt; 0).OrderBy(a =&gt; a.Age).ThenByDesc(a =&gt; a.Id).Select(a =&gt; new { a.Id, a.Name }).Skip(1).Take(999).ToList();<br>/*</p>
<ul>
<li>SELECT TOP (999) [T].[Id] AS [Id],[T].[Name] AS [Name] FROM (SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],ROW_NUMBER() OVER(ORDER BY [Users].[Age] ASC,[Users].[Id] DESC) AS [ROW_NUMBER_0] FROM [Users] AS [Users] WHERE [Users].[Id] &gt; 0) AS [T] WHERE [T].[ROW_NUMBER_0] &gt; 1<br>*/</li></ul>
<p>q.Where(a =&gt; a.Id &gt; 0).Where(a =&gt; a.Name.Contains(“lu”)).ToList();<br>/*</p>
<ul>
<li>SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] </li><li>FROM [Users] AS [Users] </li><li>WHERE ([Users].[Id] &gt; 0 AND [Users].[Name] LIKE ‘%’ + N’lu’ + ‘%’)<br>*/<br>```<ul>
<li><strong>Join Query</strong><br>```C#<br>MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString);</li></ul>
</li></ul>
<p>IQuery&lt;User&gt; users = context.Query&lt;User&gt;();<br>IQuery&lt;City&gt; cities = context.Query&lt;City&gt;();<br>IQuery&lt;Province&gt; provinces = context.Query&lt;Province&gt;();</p>
<p>IJoiningQuery&lt;User, City&gt; user_city = users.InnerJoin(cities, (user, city) =&gt; user.CityId == city.Id);<br>IJoiningQuery&lt;User, City, Province&gt; user_city_province = user_city.InnerJoin(provinces, (user, city, province) =&gt; city.ProvinceId == province.Id);</p>
<p>user_city_province.Select((user, city, province) =&gt; new { UserId = user.Id, CityName = city.Name, ProvinceName = province.Name }).Where(a =&gt; a.UserId == 1).ToList();<br>/*</p>
<ul>
<li>SELECT [Users].[Id] AS [UserId],[City].[Name] AS [CityName],[Province].[Name] AS [ProvinceName] </li><li>FROM [Users] AS [Users] </li><li>INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] </li><li>INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] </li><li>WHERE [Users].[Id] = 1<br>*/</li></ul>
<p>var view = user_city_province.Select((user, city, province) =&gt; new { User = user, City = city, Province = province });</p>
<p>view.Where(a =&gt; a.User.Id == 1).ToList();<br>/*</p>
<ul>
<li>SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[City].[Id] AS [Id0],[City].[Name] AS [Name0],[City].[ProvinceId] AS [ProvinceId],[Province].[Id] AS [Id1],[Province].[Name] AS [Name1] </li><li>FROM [Users] AS [Users] </li><li>INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] </li><li>INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] </li><li>WHERE [Users].[Id] = 1<br>*/</li></ul>
<p>view.Where(a =&gt; a.User.Id == 1).Select(a =&gt; new { UserId = a.User.Id, CityName = a.City.Name, ProvinceName = a.Province.Name }).ToList();<br>/*</p>
<ul>
<li>SELECT [Users].[Id] AS [UserId],[City].[Name] AS [CityName],[Province].[Name] AS [ProvinceName] </li><li>FROM [Users] AS [Users] </li><li>INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] </li><li>INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] </li><li>WHERE [Users].[Id] = 1<br>*/</li></ul>
<p>/*</p>
<ul>
<li>Chloe also supports left join,right join and full join query.</li><li>For details please see ‘<a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe/IQuery%60.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe/IQuery%60.cs</a>‘.<br>*/<br>```<ul>
<li><strong>Group Query</strong><br>```C#<br>IQuery&lt;User&gt; q = context.Query&lt;User&gt;();</li></ul>
</li></ul>
<p>IGroupingQuery&lt;User&gt; g = q.Where(a =&gt; a.Id &gt; 0).GroupBy(a =&gt; a.Age);<br>g = g.Having(a =&gt; a.Age &gt; 1 &amp;&amp; AggregateFunctions.Count() &gt; 0);</p>
<p>g.Select(a =&gt; new { a.Age, Count = AggregateFunctions.Count(), Sum = AggregateFunctions.Sum(a.Age), Max = AggregateFunctions.Max(a.Age), Min = AggregateFunctions.Min(a.Age), Avg = AggregateFunctions.Average(a.Age) }).ToList();<br>/*</p>
<ul>
<li>SELECT [Users].[Age] AS [Age],COUNT(1) AS [Count],SUM([Users].[Age]) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS FLOAT) AS [Avg] </li><li>FROM [Users] AS [Users] </li><li>WHERE [Users].[Id] &gt; 0 </li><li>GROUP BY [Users].[Age] HAVING ([Users].[Age] &gt; 1 AND COUNT(1) &gt; 0)<br>*/<pre><code>* **Sql Query**
```C#
context.SqlQuery&lt;User&gt;(&quot;select Id,Name,Age from Users where Name=<a href="https://github.com/name" title="&#64;name" class="at-link">@name</a>&quot;, DbParam.Create(&quot;<a href="https://github.com/name" title="&#64;name" class="at-link">@name</a>&quot;, &quot;lu&quot;)).ToList();
context.SqlQuery&lt;int&gt;(&quot;select Id from Users&quot;).ToList();
</code></pre><ul>
<li><strong>Aggregate Query</strong><br>```C#<br>IQuery&lt;User&gt; q = context.Query&lt;User&gt;();</li></ul>
</li></ul>
<p>q.Select(a =&gt; AggregateFunctions.Count()).First();<br>/*</p>
<ul>
<li>SELECT TOP (1) COUNT(1) AS [C] FROM [Users] AS [Users]<br>*/</li></ul>
<p>q.Select(a =&gt; new { Count = AggregateFunctions.Count(), LongCount = AggregateFunctions.LongCount(), Sum = AggregateFunctions.Sum(a.Age), Max = AggregateFunctions.Max(a.Age), Min = AggregateFunctions.Min(a.Age), Average = AggregateFunctions.Average(a.Age) }).First();<br>/*</p>
<ul>
<li>SELECT TOP (1) COUNT(1) AS [Count],COUNT_BIG(1) AS [LongCount],SUM([Users].[Age]) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS FLOAT) AS [Average] </li><li>FROM [Users] AS [Users]<br>*/</li></ul>
<p>var count = q.Count();<br>/*</p>
<ul>
<li>SELECT COUNT(1) AS [C] FROM [Users] AS [Users]<br>*/</li></ul>
<p>var longCount = q.LongCount();<br>/*</p>
<ul>
<li>SELECT COUNT_BIG(1) AS [C] FROM [Users] AS [Users]<br>*/</li></ul>
<p>var sum = q.Sum(a =&gt; a.Age);<br>/*</p>
<ul>
<li>SELECT SUM([Users].[Age]) AS [C] FROM [Users] AS [Users]<br>*/</li></ul>
<p>var max = q.Max(a =&gt; a.Age);<br>/*</p>
<ul>
<li>SELECT MAX([Users].[Age]) AS [C] FROM [Users] AS [Users]<br>*/</li></ul>
<p>var min = q.Min(a =&gt; a.Age);<br>/*</p>
<ul>
<li>SELECT MIN([Users].[Age]) AS [C] FROM [Users] AS [Users]<br>*/</li></ul>
<p>var avg = q.Average(a =&gt; a.Age);<br>/*</p>
<ul>
<li>SELECT CAST(AVG([Users].[Age]) AS FLOAT) AS [C] FROM [Users] AS [Users]<br>*/<br>```<ul>
<li><strong>Method</strong><br>```C#<br>IQuery&lt;User&gt; q = context.Query&lt;User&gt;();</li></ul>
</li></ul>
<p>var space = new char[] { ‘ ‘ };</p>
<p>DateTime startTime = DateTime.Now;<br>DateTime endTime = DateTime.Now.AddDays(1);<br>q.Select(a =&gt; new<br>{<br>    Id = a.Id,</p>
<pre><code>String_Length = (int?)a.Name.Length,//LEN([Users].[Name])
Substring = a.Name.Substring(0),//SUBSTRING([Users].[Name],0 + 1,LEN([Users].[Name]))
Substring1 = a.Name.Substring(1),//SUBSTRING([Users].[Name],1 + 1,LEN([Users].[Name]))
Substring1_2 = a.Name.Substring(1, 2),//SUBSTRING([Users].[Name],1 + 1,2)
ToLower = a.Name.ToLower(),//LOWER([Users].[Name])
ToUpper = a.Name.ToUpper(),//UPPER([Users].[Name])
IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//too long
Contains = (bool?)a.Name.Contains(&quot;s&quot;),//
Trim = a.Name.Trim(),//RTRIM(LTRIM([Users].[Name]))
TrimStart = a.Name.TrimStart(space),//LTRIM([Users].[Name])
TrimEnd = a.Name.TrimEnd(space),//RTRIM([Users].[Name])
StartsWith = (bool?)a.Name.StartsWith(&quot;s&quot;),//
EndsWith = (bool?)a.Name.EndsWith(&quot;s&quot;),//

DiffYears = DbFunctions.DiffYears(startTime, endTime),//DATEDIFF(YEAR,@P_0,@P_1)
DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//DATEDIFF(MONTH,@P_0,@P_1)
DiffDays = DbFunctions.DiffDays(startTime, endTime),//DATEDIFF(DAY,@P_0,@P_1)
DiffHours = DbFunctions.DiffHours(startTime, endTime),//DATEDIFF(HOUR,@P_0,@P_1)
DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//DATEDIFF(MINUTE,@P_0,@P_1)
DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//DATEDIFF(SECOND,@P_0,@P_1)
DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//DATEDIFF(MILLISECOND,@P_0,@P_1)
//DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//DATEDIFF(MICROSECOND,@P_0,@P_1)  Exception

AddYears = startTime.AddYears(1),//DATEADD(YEAR,1,@P_0)
AddMonths = startTime.AddMonths(1),//DATEADD(MONTH,1,@P_0)
AddDays = startTime.AddDays(1),//DATEADD(DAY,1,@P_0)
AddHours = startTime.AddHours(1),//DATEADD(HOUR,1,@P_0)
AddMinutes = startTime.AddMinutes(2),//DATEADD(MINUTE,2,@P_0)
AddSeconds = startTime.AddSeconds(120),//DATEADD(SECOND,120,@P_0)
AddMilliseconds = startTime.AddMilliseconds(20000),//DATEADD(MILLISECOND,20000,@P_0)

Now = DateTime.Now,//GETDATE()
UtcNow = DateTime.UtcNow,//GETUTCDATE()
Today = DateTime.Today,//CAST(GETDATE() AS DATE)
Date = DateTime.Now.Date,//CAST(GETDATE() AS DATE)
Year = DateTime.Now.Year,//DATEPART(YEAR,GETDATE())
Month = DateTime.Now.Month,//DATEPART(MONTH,GETDATE())
Day = DateTime.Now.Day,//DATEPART(DAY,GETDATE())
Hour = DateTime.Now.Hour,//DATEPART(HOUR,GETDATE())
Minute = DateTime.Now.Minute,//DATEPART(MINUTE,GETDATE())
Second = DateTime.Now.Second,//DATEPART(SECOND,GETDATE())
Millisecond = DateTime.Now.Millisecond,//DATEPART(MILLISECOND,GETDATE())
DayOfWeek = DateTime.Now.DayOfWeek,//(DATEPART(WEEKDAY,GETDATE()) - 1)

Int_Parse = int.Parse(&quot;1&quot;),//CAST(N&#39;1&#39; AS INT)
Int16_Parse = Int16.Parse(&quot;11&quot;),//CAST(N&#39;11&#39; AS SMALLINT)
Long_Parse = long.Parse(&quot;2&quot;),//CAST(N&#39;2&#39; AS BIGINT)
Double_Parse = double.Parse(&quot;3&quot;),//CAST(N&#39;3&#39; AS FLOAT)
Float_Parse = float.Parse(&quot;4&quot;),//CAST(N&#39;4&#39; AS REAL)
//Decimal_Parse = decimal.Parse(&quot;5&quot;),//CAST(N&#39;5&#39; AS DECIMAL)  ps: &#39;Decimal.Parse(string s)&#39; is not supported now,because we don&#39;t know the precision and scale information.
Guid_Parse = Guid.Parse(&quot;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&quot;),//CAST(N&#39;D544BC4C-739E-4CD3-A3D3-7BF803FCE179&#39; AS UNIQUEIDENTIFIER) AS [Guid_Parse]

Bool_Parse = bool.Parse(&quot;1&quot;),//CASE WHEN CAST(N&#39;1&#39; AS BIT) = CAST(1 AS BIT) THEN CAST(1 AS BIT) WHEN NOT (CAST(N&#39;1&#39; AS BIT) = CAST(1 AS BIT)) THEN CAST(0 AS BIT) ELSE NULL END AS [Bool_Parse]
DateTime_Parse = DateTime.Parse(&quot;1992-1-16&quot;),//CAST(N&#39;1992-1-16&#39; AS DATETIME) AS [DateTime_Parse]

B = a.Age == null ? false : a.Age &gt; 1,
</code></pre><p>}).ToList();</p>
<pre><code>* **Insert**
```C#
IDbContext context = new MsSqlContext(DbHelper.ConnectionString);

//return the key value
int id = (int)context.Insert&lt;User&gt;(() =&gt; new User() { Name = &quot;lu&quot;, Age = 18, Gender = Gender.Man, CityId = 1, OpTime = DateTime.Now });
/*
 * INSERT INTO [Users]([Name],[Age],[Gender],[CityId],[OpTime]) VALUES(N&#39;lu&#39;,18,1,1,GETDATE());SELECT @@IDENTITY
 */


User user = new User();
user.Name = &quot;lu&quot;;
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = new DateTime(1992, 1, 16);

user = context.Insert(user);
/*
 * String @P_0 = &quot;lu&quot;;
   Gender @P_1 = Man;
   Int32 @P_2 = 18;
   Int32 @P_3 = 1;
   DateTime @P_4 = &quot;1992/1/16 0:00:00&quot;;
   INSERT INTO [Users]([Name],[Gender],[Age],[CityId],[OpTime]) VALUES(@P_0,@P_1,@P_2,@P_3,@P_4);SELECT @@IDENTITY
 */
</code></pre><ul>
<li><strong>Update</strong><br>```C#<br>MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString);</li></ul>
<p>context.Update&lt;User&gt;(a =&gt; a.Id == 1, a =&gt; new User() { Name = a.Name, Age = a.Age + 100, Gender = Gender.Man, OpTime = DateTime.Now });<br>/*</p>
<ul>
<li>UPDATE [Users] SET [Name]=[Users].[Name],[Age]=([Users].[Age] + 100),[Gender]=1,[OpTime]=GETDATE() WHERE [Users].[Id] = 1<br>*/</li></ul>
<p>context.Update&lt;User&gt;(a =&gt; a.Gender == Gender.Woman, a =&gt; new User() { Age = a.Age - 10, OpTime = DateTime.Now });<br>/*</p>
<ul>
<li>UPDATE [Users] SET [Age]=([Users].[Age] - 10),[OpTime]=GETDATE() WHERE [Users].[Gender] = 2<br>*/</li></ul>
<p>User user = new User();<br>user.Id = 1;<br>user.Name = “lu”;<br>user.Age = 28;<br>user.Gender = Gender.Man;<br>user.OpTime = DateTime.Now;</p>
<p>context.Update(user); //update all columns<br>/*</p>
<ul>
<li>String <a href="https://github.com/P_0" title="&#64;P_0" class="at-link">@P_0</a> = “lu”;<br>Gender <a href="https://github.com/P_1" title="&#64;P_1" class="at-link">@P_1</a> = Man;<br>Int32 <a href="https://github.com/P_2" title="&#64;P_2" class="at-link">@P_2</a> = 28;<br>Nullable&lt;Int32&gt; <a href="https://github.com/P_3" title="&#64;P_3" class="at-link">@P_3</a> = NULL;<br>DateTime <a href="https://github.com/P_4" title="&#64;P_4" class="at-link">@P_4</a> = “2016/7/8 11&#58;28&#58;27”;<br>Int32 <a href="https://github.com/P_5" title="&#64;P_5" class="at-link">@P_5</a> = 1;<br>UPDATE [Users] SET [Name]=<a href="https://github.com/P_0" title="&#64;P_0" class="at-link">@P_0</a>,[Gender]=<a href="https://github.com/P_1" title="&#64;P_1" class="at-link">@P_1</a>,[Age]=<a href="https://github.com/P_2" title="&#64;P_2" class="at-link">@P_2</a>,[CityId]=<a href="https://github.com/P_3" title="&#64;P_3" class="at-link">@P_3</a>,[OpTime]=<a href="https://github.com/P_4" title="&#64;P_4" class="at-link">@P_4</a> WHERE [Users].[Id] = <a href="https://github.com/P_5" title="&#64;P_5" class="at-link">@P_5</a><br>*/</li></ul>
<p>context.TrackEntity(user);//track entity<br>user.Name = user.Name + “1”;<br>context.Update(user);//update the column ‘Name’ only<br>/*</p>
<ul>
<li>String <a href="https://github.com/P_0" title="&#64;P_0" class="at-link">@P_0</a> = “lu1”;<br>Int32 <a href="https://github.com/P_1" title="&#64;P_1" class="at-link">@P_1</a> = 1;<br>UPDATE [Users] SET [Name]=<a href="https://github.com/P_0" title="&#64;P_0" class="at-link">@P_0</a> WHERE [Users].[Id] = <a href="https://github.com/P_1" title="&#64;P_1" class="at-link">@P_1</a><br>*/<br>```<ul>
<li><strong>Delete</strong><br>```C#<br>MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString);</li></ul>
</li></ul>
<p>context.Delete&lt;User&gt;(a =&gt; a.Id == 1);<br>/*</p>
<ul>
<li>DELETE [Users] WHERE [Users].[Id] = 1<br>*/</li></ul>
<p>context.Delete&lt;User&gt;(a =&gt; a.Gender == null);<br>/*</p>
<ul>
<li>DELETE [Users] WHERE [Users].[Gender] IS NULL<br>*/</li></ul>
<p>User user = new User();<br>user.Id = 1;<br>context.Delete(user);<br>/*</p>
<ul>
<li>Int32 <a href="https://github.com/P_0" title="&#64;P_0" class="at-link">@P_0</a> = 1;<br>DELETE [Users] WHERE [Users].[Id] = <a href="https://github.com/P_0" title="&#64;P_0" class="at-link">@P_0</a><br>*/<br>```<h1 id="h1-license"><a name="License" class="reference-link"></a><span class="header-link octicon octicon-link"></span>License</h1><a href="http://opensource.org/licenses/MIT">MIT</a> License</li></ul>
<p>notes：早期使用 apache 2.0 开源协议，从 2017-3-3 起切换至更宽松的 MIT 协议</p>
', '# Chloe
Chloe is a lightweight Object/Relational Mapping(ORM) library.
The query interface is similar to LINQ.You can query data like LINQ and do any things(Join Query | Group Query | Aggregate Query | Insert | Batch Update | Batch Delete) by lambda with Chloe.ORM.

**Documentation**: [http://www.52chloe.com/Wiki/Document](http://www.52chloe.com/Wiki/Document "http://www.52chloe.com/Wiki/Document") .NET交流群：325936847，只要您**愿意**，即可加入 

**Source code of ''www.52chloe.com''**: [https://github.com/shuxinqin/Ace](https://github.com/shuxinqin/Ace "https://github.com/shuxinqin/Ace")

# NuGet Install Command

|              | .NET Framework  | .NET Core  |
| ------------ | --------------- | ---------- |
| SqlServer  | Install-Package Chloe.SqlServer  | Install-Package ChloeCore.SqlServer  |
| MySql  | Install-Package Chloe.MySql  |  Install-Package ChloeCore.MySql |
| Oracle  | Install-Package Chloe.Oracle  |  - |
| SQLite  | Install-Package Chloe.SQLite  |  Install-Package ChloeCore.SQLite |

# Usage
* **Entity**
```C#
public enum Gender
{
    Man = 1,
    Woman
}

[Table("Users")]
public class User
{
    [Column(IsPrimaryKey = true)]
    [AutoIncrement]
    public int Id { get; set; }
    public string Name { get; set; }
    public Gender? Gender { get; set; }
    public int? Age { get; set; }
    public int? CityId { get; set; }
    public DateTime? OpTime { get; set; }
}

public class City
{
    [Column(IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
    public int ProvinceId { get; set; }
}

public class Province
{
    [Column(IsPrimaryKey = true)]
    public int Id { get; set; }
    public string Name { get; set; }
}
```
* **DbContext**
```C#
IDbContext context = new MsSqlContext(DbHelper.ConnectionString);
IQuery<User> q = context.Query<User>();
```
* **Query**
```C#
IQuery<User> q = context.Query<User>();
q.Where(a => a.Id > 0).FirstOrDefault();
q.Where(a => a.Id > 0).ToList();
q.Where(a => a.Id > 0).OrderBy(a => a.Age).ToList();
q.Where(a => a.Id > 0).Take(999).OrderBy(a => a.Age).ToList();

q.Where(a => a.Id > 0).OrderBy(a => a.Age).ThenByDesc(a => a.Id).Select(a => new { a.Id, a.Name }).Skip(1).Take(999).ToList();
/*
 * SELECT TOP (999) [T].[Id] AS [Id],[T].[Name] AS [Name] FROM (SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],ROW_NUMBER() OVER(ORDER BY [Users].[Age] ASC,[Users].[Id] DESC) AS [ROW_NUMBER_0] FROM [Users] AS [Users] WHERE [Users].[Id] > 0) AS [T] WHERE [T].[ROW_NUMBER_0] > 1
 */

q.Where(a => a.Id > 0).Where(a => a.Name.Contains("lu")).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime] 
 * FROM [Users] AS [Users] 
 * WHERE ([Users].[Id] > 0 AND [Users].[Name] LIKE ''%'' + N''lu'' + ''%'')
 */
```
* **Join Query**
```C#
MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString);

IQuery<User> users = context.Query<User>();
IQuery<City> cities = context.Query<City>();
IQuery<Province> provinces = context.Query<Province>();

IJoiningQuery<User, City> user_city = users.InnerJoin(cities, (user, city) => user.CityId == city.Id);
IJoiningQuery<User, City, Province> user_city_province = user_city.InnerJoin(provinces, (user, city, province) => city.ProvinceId == province.Id);

user_city_province.Select((user, city, province) => new { UserId = user.Id, CityName = city.Name, ProvinceName = province.Name }).Where(a => a.UserId == 1).ToList();
/*
 * SELECT [Users].[Id] AS [UserId],[City].[Name] AS [CityName],[Province].[Name] AS [ProvinceName] 
 * FROM [Users] AS [Users] 
 * INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
 * INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
 * WHERE [Users].[Id] = 1
 */
 
var view = user_city_province.Select((user, city, province) => new { User = user, City = city, Province = province });
 
view.Where(a => a.User.Id == 1).ToList();
/*
 * SELECT [Users].[Id] AS [Id],[Users].[Name] AS [Name],[Users].[Gender] AS [Gender],[Users].[Age] AS [Age],[Users].[CityId] AS [CityId],[Users].[OpTime] AS [OpTime],[City].[Id] AS [Id0],[City].[Name] AS [Name0],[City].[ProvinceId] AS [ProvinceId],[Province].[Id] AS [Id1],[Province].[Name] AS [Name1] 
 * FROM [Users] AS [Users] 
 * INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
 * INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
 * WHERE [Users].[Id] = 1
 */
 
view.Where(a => a.User.Id == 1).Select(a => new { UserId = a.User.Id, CityName = a.City.Name, ProvinceName = a.Province.Name }).ToList();
/*
 * SELECT [Users].[Id] AS [UserId],[City].[Name] AS [CityName],[Province].[Name] AS [ProvinceName] 
 * FROM [Users] AS [Users] 
 * INNER JOIN [City] AS [City] ON [Users].[CityId] = [City].[Id] 
 * INNER JOIN [Province] AS [Province] ON [City].[ProvinceId] = [Province].[Id] 
 * WHERE [Users].[Id] = 1
 */

/*
 * Chloe also supports left join,right join and full join query.
 * For details please see ''https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe/IQuery%60.cs''.
 */
```
* **Group Query**
```C#
IQuery<User> q = context.Query<User>();

IGroupingQuery<User> g = q.Where(a => a.Id > 0).GroupBy(a => a.Age);
g = g.Having(a => a.Age > 1 && AggregateFunctions.Count() > 0);

g.Select(a => new { a.Age, Count = AggregateFunctions.Count(), Sum = AggregateFunctions.Sum(a.Age), Max = AggregateFunctions.Max(a.Age), Min = AggregateFunctions.Min(a.Age), Avg = AggregateFunctions.Average(a.Age) }).ToList();
/*
 * SELECT [Users].[Age] AS [Age],COUNT(1) AS [Count],SUM([Users].[Age]) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS FLOAT) AS [Avg] 
 * FROM [Users] AS [Users] 
 * WHERE [Users].[Id] > 0 
 * GROUP BY [Users].[Age] HAVING ([Users].[Age] > 1 AND COUNT(1) > 0)
 */
```
* **Sql Query**
```C#
context.SqlQuery<User>("select Id,Name,Age from Users where Name=@name", DbParam.Create("@name", "lu")).ToList();
context.SqlQuery<int>("select Id from Users").ToList();
```
* **Aggregate Query**
```C#
IQuery<User> q = context.Query<User>();

q.Select(a => AggregateFunctions.Count()).First();
/*
 * SELECT TOP (1) COUNT(1) AS [C] FROM [Users] AS [Users]
 */

q.Select(a => new { Count = AggregateFunctions.Count(), LongCount = AggregateFunctions.LongCount(), Sum = AggregateFunctions.Sum(a.Age), Max = AggregateFunctions.Max(a.Age), Min = AggregateFunctions.Min(a.Age), Average = AggregateFunctions.Average(a.Age) }).First();
/*
 * SELECT TOP (1) COUNT(1) AS [Count],COUNT_BIG(1) AS [LongCount],SUM([Users].[Age]) AS [Sum],MAX([Users].[Age]) AS [Max],MIN([Users].[Age]) AS [Min],CAST(AVG([Users].[Age]) AS FLOAT) AS [Average] 
 * FROM [Users] AS [Users]
 */

var count = q.Count();
/*
 * SELECT COUNT(1) AS [C] FROM [Users] AS [Users]
 */

var longCount = q.LongCount();
/*
 * SELECT COUNT_BIG(1) AS [C] FROM [Users] AS [Users]
 */

var sum = q.Sum(a => a.Age);
/*
 * SELECT SUM([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var max = q.Max(a => a.Age);
/*
 * SELECT MAX([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var min = q.Min(a => a.Age);
/*
 * SELECT MIN([Users].[Age]) AS [C] FROM [Users] AS [Users]
 */

var avg = q.Average(a => a.Age);
/*
 * SELECT CAST(AVG([Users].[Age]) AS FLOAT) AS [C] FROM [Users] AS [Users]
 */
```
* **Method**
```C#
IQuery<User> q = context.Query<User>();

var space = new char[] { '' '' };

DateTime startTime = DateTime.Now;
DateTime endTime = DateTime.Now.AddDays(1);
q.Select(a => new
{
    Id = a.Id,

    String_Length = (int?)a.Name.Length,//LEN([Users].[Name])
    Substring = a.Name.Substring(0),//SUBSTRING([Users].[Name],0 + 1,LEN([Users].[Name]))
    Substring1 = a.Name.Substring(1),//SUBSTRING([Users].[Name],1 + 1,LEN([Users].[Name]))
    Substring1_2 = a.Name.Substring(1, 2),//SUBSTRING([Users].[Name],1 + 1,2)
    ToLower = a.Name.ToLower(),//LOWER([Users].[Name])
    ToUpper = a.Name.ToUpper(),//UPPER([Users].[Name])
    IsNullOrEmpty = string.IsNullOrEmpty(a.Name),//too long
    Contains = (bool?)a.Name.Contains("s"),//
    Trim = a.Name.Trim(),//RTRIM(LTRIM([Users].[Name]))
    TrimStart = a.Name.TrimStart(space),//LTRIM([Users].[Name])
    TrimEnd = a.Name.TrimEnd(space),//RTRIM([Users].[Name])
    StartsWith = (bool?)a.Name.StartsWith("s"),//
    EndsWith = (bool?)a.Name.EndsWith("s"),//

    DiffYears = DbFunctions.DiffYears(startTime, endTime),//DATEDIFF(YEAR,@P_0,@P_1)
    DiffMonths = DbFunctions.DiffMonths(startTime, endTime),//DATEDIFF(MONTH,@P_0,@P_1)
    DiffDays = DbFunctions.DiffDays(startTime, endTime),//DATEDIFF(DAY,@P_0,@P_1)
    DiffHours = DbFunctions.DiffHours(startTime, endTime),//DATEDIFF(HOUR,@P_0,@P_1)
    DiffMinutes = DbFunctions.DiffMinutes(startTime, endTime),//DATEDIFF(MINUTE,@P_0,@P_1)
    DiffSeconds = DbFunctions.DiffSeconds(startTime, endTime),//DATEDIFF(SECOND,@P_0,@P_1)
    DiffMilliseconds = DbFunctions.DiffMilliseconds(startTime, endTime),//DATEDIFF(MILLISECOND,@P_0,@P_1)
    //DiffMicroseconds = DbFunctions.DiffMicroseconds(startTime, endTime),//DATEDIFF(MICROSECOND,@P_0,@P_1)  Exception

    AddYears = startTime.AddYears(1),//DATEADD(YEAR,1,@P_0)
    AddMonths = startTime.AddMonths(1),//DATEADD(MONTH,1,@P_0)
    AddDays = startTime.AddDays(1),//DATEADD(DAY,1,@P_0)
    AddHours = startTime.AddHours(1),//DATEADD(HOUR,1,@P_0)
    AddMinutes = startTime.AddMinutes(2),//DATEADD(MINUTE,2,@P_0)
    AddSeconds = startTime.AddSeconds(120),//DATEADD(SECOND,120,@P_0)
    AddMilliseconds = startTime.AddMilliseconds(20000),//DATEADD(MILLISECOND,20000,@P_0)
	
    Now = DateTime.Now,//GETDATE()
    UtcNow = DateTime.UtcNow,//GETUTCDATE()
    Today = DateTime.Today,//CAST(GETDATE() AS DATE)
    Date = DateTime.Now.Date,//CAST(GETDATE() AS DATE)
    Year = DateTime.Now.Year,//DATEPART(YEAR,GETDATE())
    Month = DateTime.Now.Month,//DATEPART(MONTH,GETDATE())
    Day = DateTime.Now.Day,//DATEPART(DAY,GETDATE())
    Hour = DateTime.Now.Hour,//DATEPART(HOUR,GETDATE())
    Minute = DateTime.Now.Minute,//DATEPART(MINUTE,GETDATE())
    Second = DateTime.Now.Second,//DATEPART(SECOND,GETDATE())
    Millisecond = DateTime.Now.Millisecond,//DATEPART(MILLISECOND,GETDATE())
    DayOfWeek = DateTime.Now.DayOfWeek,//(DATEPART(WEEKDAY,GETDATE()) - 1)

    Int_Parse = int.Parse("1"),//CAST(N''1'' AS INT)
    Int16_Parse = Int16.Parse("11"),//CAST(N''11'' AS SMALLINT)
    Long_Parse = long.Parse("2"),//CAST(N''2'' AS BIGINT)
    Double_Parse = double.Parse("3"),//CAST(N''3'' AS FLOAT)
    Float_Parse = float.Parse("4"),//CAST(N''4'' AS REAL)
    //Decimal_Parse = decimal.Parse("5"),//CAST(N''5'' AS DECIMAL)  ps: ''Decimal.Parse(string s)'' is not supported now,because we don''t know the precision and scale information.
    Guid_Parse = Guid.Parse("D544BC4C-739E-4CD3-A3D3-7BF803FCE179"),//CAST(N''D544BC4C-739E-4CD3-A3D3-7BF803FCE179'' AS UNIQUEIDENTIFIER) AS [Guid_Parse]

    Bool_Parse = bool.Parse("1"),//CASE WHEN CAST(N''1'' AS BIT) = CAST(1 AS BIT) THEN CAST(1 AS BIT) WHEN NOT (CAST(N''1'' AS BIT) = CAST(1 AS BIT)) THEN CAST(0 AS BIT) ELSE NULL END AS [Bool_Parse]
    DateTime_Parse = DateTime.Parse("1992-1-16"),//CAST(N''1992-1-16'' AS DATETIME) AS [DateTime_Parse]

    B = a.Age == null ? false : a.Age > 1,
}).ToList();
```
* **Insert**
```C#
IDbContext context = new MsSqlContext(DbHelper.ConnectionString);

//return the key value
int id = (int)context.Insert<User>(() => new User() { Name = "lu", Age = 18, Gender = Gender.Man, CityId = 1, OpTime = DateTime.Now });
/*
 * INSERT INTO [Users]([Name],[Age],[Gender],[CityId],[OpTime]) VALUES(N''lu'',18,1,1,GETDATE());SELECT @@IDENTITY
 */

 
User user = new User();
user.Name = "lu";
user.Age = 18;
user.Gender = Gender.Man;
user.CityId = 1;
user.OpTime = new DateTime(1992, 1, 16);

user = context.Insert(user);
/*
 * String @P_0 = "lu";
   Gender @P_1 = Man;
   Int32 @P_2 = 18;
   Int32 @P_3 = 1;
   DateTime @P_4 = "1992/1/16 0:00:00";
   INSERT INTO [Users]([Name],[Gender],[Age],[CityId],[OpTime]) VALUES(@P_0,@P_1,@P_2,@P_3,@P_4);SELECT @@IDENTITY
 */
```
* **Update**
```C#
MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString);

context.Update<User>(a => a.Id == 1, a => new User() { Name = a.Name, Age = a.Age + 100, Gender = Gender.Man, OpTime = DateTime.Now });
/*
 * UPDATE [Users] SET [Name]=[Users].[Name],[Age]=([Users].[Age] + 100),[Gender]=1,[OpTime]=GETDATE() WHERE [Users].[Id] = 1
 */

context.Update<User>(a => a.Gender == Gender.Woman, a => new User() { Age = a.Age - 10, OpTime = DateTime.Now });
/*
 * UPDATE [Users] SET [Age]=([Users].[Age] - 10),[OpTime]=GETDATE() WHERE [Users].[Gender] = 2
 */


User user = new User();
user.Id = 1;
user.Name = "lu";
user.Age = 28;
user.Gender = Gender.Man;
user.OpTime = DateTime.Now;

context.Update(user); //update all columns
/*
 * String @P_0 = "lu";
   Gender @P_1 = Man;
   Int32 @P_2 = 28;
   Nullable<Int32> @P_3 = NULL;
   DateTime @P_4 = "2016/7/8 11:28:27";
   Int32 @P_5 = 1;
   UPDATE [Users] SET [Name]=@P_0,[Gender]=@P_1,[Age]=@P_2,[CityId]=@P_3,[OpTime]=@P_4 WHERE [Users].[Id] = @P_5
 */

context.TrackEntity(user);//track entity
user.Name = user.Name + "1";
context.Update(user);//update the column ''Name'' only
/*
 * String @P_0 = "lu1";
   Int32 @P_1 = 1;
   UPDATE [Users] SET [Name]=@P_0 WHERE [Users].[Id] = @P_1
 */
```
* **Delete**
```C#
MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString);

context.Delete<User>(a => a.Id == 1);
/*
 * DELETE [Users] WHERE [Users].[Id] = 1
 */

context.Delete<User>(a => a.Gender == null);
/*
 * DELETE [Users] WHERE [Users].[Gender] IS NULL
 */
 
 
User user = new User();
user.Id = 1;
context.Delete(user);
/*
 * Int32 @P_0 = 1;
   DELETE [Users] WHERE [Users].[Id] = @P_0
 */
```
# License
[MIT](http://opensource.org/licenses/MIT) License

notes：早期使用 apache 2.0 开源协议，从 2017-3-3 起切换至更宽松的 MIT 协议', '2016-12-04 13:13:15.681574', '2017-04-03 21:51:15.2471962', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3325873886481874944, 'Chloe-性能评测', '性能测评', 'Chloe-性能评测', '<h1 id="h1-u6027u80FDu8BC4u6D4B"><a name="性能评测" class="reference-link"></a><span class="header-link octicon octicon-link"></span>性能评测</h1><p>测评对象：EntityFramework6.1、Dapper 和 Chloe.ORM。<br><strong>1.映射能力</strong><br>一次查50万条数据，总共测试5轮，测试结果数据如下：</p>
<table>
<thead>
<tr>
<th></th>
<th>Chloe.IQuery(ms)</th>
<th>Chloe.SqlQuery(ms)</th>
<th>Dapper.Query(ms)</th>
<th>EF.IQueryable(ms)</th>
<th>EF.SqlQuery(ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td>第1轮</td>
<td>6976</td>
<td>7170</td>
<td>7948</td>
<td>7704</td>
<td>7744</td>
</tr>
<tr>
<td>第2轮</td>
<td>7357</td>
<td>6853</td>
<td>8410</td>
<td>8328</td>
<td>7783</td>
</tr>
<tr>
<td>第3轮</td>
<td>7610</td>
<td>7833</td>
<td>8107</td>
<td>9795</td>
<td>8706</td>
</tr>
<tr>
<td>第4轮</td>
<td>7296</td>
<td>6957</td>
<td>7760</td>
<td>8643</td>
<td>7873</td>
</tr>
<tr>
<td>第5轮</td>
<td>9636</td>
<td>6705</td>
<td>8805</td>
<td>8946</td>
<td>8544</td>
</tr>
<tr>
<td><strong>平均</strong></td>
<td><strong>7775</strong></td>
<td><strong>7103</strong></td>
<td><strong>8206</strong></td>
<td><strong>8683</strong></td>
<td><strong>8130</strong></td>
</tr>
</tbody>
</table>
<p><strong>2.查询能力</strong><br>一次查询只查一条数据，循环执行20000次查询。</p>
<table>
<thead>
<tr>
<th></th>
<th>Chloe.IQuery(ms)</th>
<th>Chloe.SqlQuery(ms)</th>
<th>Dapper.Query(ms)</th>
<th>EF.IQueryable(ms)</th>
<th>EF.SqlQuery(ms)</th>
</tr>
</thead>
<tbody>
<tr>
<td>第1轮</td>
<td>15281</td>
<td>11858</td>
<td>11981</td>
<td>31394</td>
<td>19309</td>
</tr>
<tr>
<td>第2轮</td>
<td>15194</td>
<td>12177</td>
<td>12314</td>
<td>31464</td>
<td>18161</td>
</tr>
<tr>
<td>第3轮</td>
<td>15967</td>
<td>12348</td>
<td>12366</td>
<td>31082</td>
<td>18030</td>
</tr>
<tr>
<td>第4轮</td>
<td>15371</td>
<td>11793</td>
<td>12479</td>
<td>32314</td>
<td>18356</td>
</tr>
<tr>
<td>第5轮</td>
<td>15350</td>
<td>11921</td>
<td>11937</td>
<td>35023</td>
<td>18356</td>
</tr>
<tr>
<td><strong>平均</strong></td>
<td><strong>15411</strong></td>
<td><strong>12019</strong></td>
<td><strong>12215</strong></td>
<td><strong>32255</strong></td>
<td><strong>18442</strong></td>
</tr>
</tbody>
</table>
<p>以上测试，EF 均使用了 AsNoTracking。测试效果在不同机子可能会有略微差别，以上数据仅供参考。<br>数据来源：<a href="http://www.cnblogs.com/so9527/p/5674498.html" title="http://www.cnblogs.com/so9527/p/5674498.html">http://www.cnblogs.com/so9527/p/5674498.html</a></p>
', '# 性能评测
测评对象：EntityFramework6.1、Dapper 和 Chloe.ORM。
**1.映射能力**
一次查50万条数据，总共测试5轮，测试结果数据如下：

|   | Chloe.IQuery(ms)  | Chloe.SqlQuery(ms)  | Dapper.Query(ms)  | EF.IQueryable(ms)  | EF.SqlQuery(ms)  |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| 第1轮  | 6976 | 7170  | 7948  | 7704  | 7744  |
| 第2轮  | 7357  | 6853  | 8410  | 8328  | 7783  |
| 第3轮  | 7610  | 7833  | 8107  | 9795  | 8706 |
| 第4轮  | 7296  | 6957  | 7760  | 8643  | 7873  |
| 第5轮  | 9636  | 6705  | 8805  | 8946  | 8544  |
| **平均**  | **7775**  | **7103**  | **8206**  | **8683**  | **8130**  |

**2.查询能力**
一次查询只查一条数据，循环执行20000次查询。

|   | Chloe.IQuery(ms)  | Chloe.SqlQuery(ms)  | Dapper.Query(ms)  | EF.IQueryable(ms)  | EF.SqlQuery(ms)  |
| ------------ | ------------ | ------------ | ------------ | ------------ | ------------ |
| 第1轮  | 15281 | 11858  | 11981  | 31394  | 19309  |
| 第2轮  | 15194  | 12177  | 12314  | 31464  | 18161  |
| 第3轮  | 15967  | 12348  | 12366  | 31082  | 18030 |
| 第4轮  | 15371  | 11793  | 12479  | 32314  | 18356  |
| 第5轮  | 15350  | 11921  | 11937  | 35023  | 18356  |
| **平均**  | **15411**  | **12019**  | **12215**  | **32255**  | **18442**  |

以上测试，EF 均使用了 AsNoTracking。测试效果在不同机子可能会有略微差别，以上数据仅供参考。
数据来源：[http://www.cnblogs.com/so9527/p/5674498.html](http://www.cnblogs.com/so9527/p/5674498.html "http://www.cnblogs.com/so9527/p/5674498.html")', '2016-12-04 15:55:27.3078924', '2016-12-04 16:09:45.7248896', 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3337853076894646272, 'Sql拦截器', 'Sql拦截器', 'Sql拦截器', '<h1 id="h1-u62E6u622Au5668"><a name="拦截器" class="reference-link"></a><span class="header-link octicon octicon-link"></span>拦截器</h1><p>Chloe 借鉴 EF，支持了拦截器功能。通过该功能可以拦截 sql 语句和监视 sql 执行用时。<br><strong>拦截器定义：</strong><br>自定义的拦截器必须实现 IDbCommandInterceptor 接口。</p>
<pre><code class="lang-csharp">class DbCommandInterceptor : IDbCommandInterceptor
{
    /* 执行 DbCommand.ExecuteReader() 时调用 */
    public void ReaderExecuting(IDbCommand command, DbCommandInterceptionContext&lt;IDataReader&gt; interceptionContext)
    {
        interceptionContext.DataBag.Add(&quot;startTime&quot;, DateTime.Now);
        Console.WriteLine(command.CommandText);
    }
    /* 执行 DbCommand.ExecuteReader() 后调用 */
    public void ReaderExecuted(IDbCommand command, DbCommandInterceptionContext&lt;IDataReader&gt; interceptionContext)
    {
        DateTime startTime = (DateTime)(interceptionContext.DataBag[&quot;startTime&quot;]);
        Console.WriteLine(DateTime.Now.Subtract(startTime).TotalMilliseconds);
        if (interceptionContext.Exception == null)
            Console.WriteLine(interceptionContext.Result.FieldCount);
    }

    /* 执行 DbCommand.ExecuteNonQuery() 时调用 */
    public void NonQueryExecuting(IDbCommand command, DbCommandInterceptionContext&lt;int&gt; interceptionContext)
    {
        interceptionContext.DataBag.Add(&quot;startTime&quot;, DateTime.Now);
        Console.WriteLine(command.CommandText);
    }
    /* 执行 DbCommand.ExecuteNonQuery() 后调用 */
    public void NonQueryExecuted(IDbCommand command, DbCommandInterceptionContext&lt;int&gt; interceptionContext)
    {
        DateTime startTime = (DateTime)(interceptionContext.DataBag[&quot;startTime&quot;]);
        Console.WriteLine(DateTime.Now.Subtract(startTime).TotalMilliseconds);
        if (interceptionContext.Exception == null)
            Console.WriteLine(interceptionContext.Result);
    }

    /* 执行 DbCommand.ExecuteScalar() 时调用 */
    public void ScalarExecuting(IDbCommand command, DbCommandInterceptionContext&lt;object&gt; interceptionContext)
    {
        interceptionContext.DataBag.Add(&quot;startTime&quot;, DateTime.Now);
        Console.WriteLine(command.CommandText);
    }
    /* 执行 DbCommand.ExecuteScalar() 后调用 */
    public void ScalarExecuted(IDbCommand command, DbCommandInterceptionContext&lt;object&gt; interceptionContext)
    {
        DateTime startTime = (DateTime)(interceptionContext.DataBag[&quot;startTime&quot;]);
        Console.WriteLine(DateTime.Now.Subtract(startTime).TotalMilliseconds);
        if (interceptionContext.Exception == null)
            Console.WriteLine(interceptionContext.Result);
    }
}
</code></pre>
<p><strong>全局拦截器：</strong><br>这种用法针对所有的 DbContext 有效，建议在程序启动时添加。</p>
<pre><code class="lang-csharp">IDbCommandInterceptor interceptor = new DbCommandInterceptor();
DbInterception.Add(interceptor);
</code></pre>
<p><strong>单个DbContext拦截器：</strong><br>这种用法只会对单个 DbContext 有效，建议在创建 DbContext 时添加。</p>
<pre><code class="lang-csharp">IDbContext context = new MsSqlContext(&quot;Your connection string&quot;);
IDbCommandInterceptor interceptor = new DbCommandInterceptor();
context.Session.AddInterceptor(interceptor);
</code></pre>
', '# 拦截器
Chloe 借鉴 EF，支持了拦截器功能。通过该功能可以拦截 sql 语句和监视 sql 执行用时。
**拦截器定义：**
自定义的拦截器必须实现 IDbCommandInterceptor 接口。
```csharp
class DbCommandInterceptor : IDbCommandInterceptor
{
    /* 执行 DbCommand.ExecuteReader() 时调用 */
    public void ReaderExecuting(IDbCommand command, DbCommandInterceptionContext<IDataReader> interceptionContext)
    {
        interceptionContext.DataBag.Add("startTime", DateTime.Now);
        Console.WriteLine(command.CommandText);
    }
	/* 执行 DbCommand.ExecuteReader() 后调用 */
    public void ReaderExecuted(IDbCommand command, DbCommandInterceptionContext<IDataReader> interceptionContext)
    {
        DateTime startTime = (DateTime)(interceptionContext.DataBag["startTime"]);
        Console.WriteLine(DateTime.Now.Subtract(startTime).TotalMilliseconds);
        if (interceptionContext.Exception == null)
            Console.WriteLine(interceptionContext.Result.FieldCount);
    }

    /* 执行 DbCommand.ExecuteNonQuery() 时调用 */
    public void NonQueryExecuting(IDbCommand command, DbCommandInterceptionContext<int> interceptionContext)
    {
        interceptionContext.DataBag.Add("startTime", DateTime.Now);
        Console.WriteLine(command.CommandText);
    }
	/* 执行 DbCommand.ExecuteNonQuery() 后调用 */
    public void NonQueryExecuted(IDbCommand command, DbCommandInterceptionContext<int> interceptionContext)
    {
        DateTime startTime = (DateTime)(interceptionContext.DataBag["startTime"]);
        Console.WriteLine(DateTime.Now.Subtract(startTime).TotalMilliseconds);
        if (interceptionContext.Exception == null)
            Console.WriteLine(interceptionContext.Result);
    }

	/* 执行 DbCommand.ExecuteScalar() 时调用 */
    public void ScalarExecuting(IDbCommand command, DbCommandInterceptionContext<object> interceptionContext)
    {
        interceptionContext.DataBag.Add("startTime", DateTime.Now);
        Console.WriteLine(command.CommandText);
    }
	/* 执行 DbCommand.ExecuteScalar() 后调用 */
    public void ScalarExecuted(IDbCommand command, DbCommandInterceptionContext<object> interceptionContext)
    {
        DateTime startTime = (DateTime)(interceptionContext.DataBag["startTime"]);
        Console.WriteLine(DateTime.Now.Subtract(startTime).TotalMilliseconds);
        if (interceptionContext.Exception == null)
            Console.WriteLine(interceptionContext.Result);
    }
}
```
**全局拦截器：**
这种用法针对所有的 DbContext 有效，建议在程序启动时添加。
```csharp
IDbCommandInterceptor interceptor = new DbCommandInterceptor();
DbInterception.Add(interceptor);
```
**单个DbContext拦截器：**
这种用法只会对单个 DbContext 有效，建议在创建 DbContext 时添加。
```csharp
IDbContext context = new MsSqlContext("Your connection string");
IDbCommandInterceptor interceptor = new DbCommandInterceptor();
context.Session.AddInterceptor(interceptor);
```', '2017-01-06 17:16:28.8630742', null, 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3432725391804989440, '实用扩展', null, '实用扩展', '<h1 id="h1-u5B9Eu7528u6269u5C55"><a name="实用扩展" class="reference-link"></a><span class="header-link octicon octicon-link"></span>实用扩展</h1><p>框架提供了许多实用的扩展方法，<strong>需要引用 Chloe.Extension.dll</strong>，同时也要 <strong>using Chloe;</strong>，nuget 安装命令：<strong>Install-Package Chloe.Extension</strong><br><strong>异步：</strong><br>IDbContext 与 IQuery&lt;T&gt; 接口异步扩展，具体可参考：<a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbContextAsyncExtension.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbContextAsyncExtension.cs</a><br><a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/QueryAsyncExtension.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/QueryAsyncExtension.cs</a><br><strong>快速映射：</strong><br>MapTo 扩展方法可实现<strong>实体</strong>与 Model 间快速映射。</p>
<pre><code class="lang-csharp">/* 只查询 UserModel 中有的字段 */
List&lt;UserModel&gt; userModels = context.Query&lt;User&gt;().MapTo&lt;UserModel&gt;().ToList();

/*或者*/
List&lt;UserModel&gt; userModels = context.Query&lt;User&gt;().ToList&lt;UserModel&gt;();
</code></pre>
<p><strong>忽略查询字段：</strong><br>Ignore 扩展方法可实现查询数据时不包含某些字段。</p>
<pre><code class="lang-csharp">/* 查询 User 表，但忽略掉 Name 和 Age 属性，生成的 sql 中不会包含 Name 和 Age 字段 */
context.Query&lt;User&gt;().Ignore(&quot;Name&quot;, &quot;Age&quot;).ToList();

/* 以 lambda 的方式 */
context.Query&lt;User&gt;().Ignore(a =&gt; new { a.Name, a.Age }).ToList();
</code></pre>
<p><strong>更新部分字段：</strong><br>UpdateOnly 扩展方法可实现更新部分字段。</p>
<pre><code class="lang-csharp">User user = new User() { Id = 1, Name = &quot;shuxin&quot;, Age = 18, Gender = Gender.Man, NickName = &quot;so&quot; };

/* 只更新字段 Name 和 Age */
context.UpdateOnly&lt;User&gt;(user, a =&gt; new { a.Name, a.Age });  //lambda 方式
context.UpdateOnly&lt;User&gt;(user, &quot;Name&quot;, &quot;Age&quot;);  //字符串方式
</code></pre>
<p><strong>获取 DataTable：</strong></p>
<pre><code class="lang-csharp">DataTable dt = context.Session.ExecuteDataTable(&quot;select * from users where age&gt;=@age&quot;, new { age = 18 });
</code></pre>
<p><strong>FormatSqlQuery（仅.NET Core版本支持）：</strong><br>FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化。</p>
<pre><code class="lang-csharp">int age = 18;
List&lt;User&gt; users = context.FormatSqlQuery&lt;User&gt;($&quot;select * from Users where age&gt;={age}&quot;).ToList();

//或者
FormattableString sql = $&quot;select * from Users where age&gt;={age}&quot;; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery&lt;User&gt;(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 @P_0 = 18;
   select * from Users where age&gt;=@P_0
 */
</code></pre>
', '# 实用扩展
框架提供了许多实用的扩展方法，**需要引用 Chloe.Extension.dll**，同时也要 **using Chloe;**，nuget 安装命令：**Install-Package Chloe.Extension**
**异步：**
IDbContext 与 IQuery<T> 接口异步扩展，具体可参考：https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/DbContextAsyncExtension.cs
https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.Extension/QueryAsyncExtension.cs
**快速映射：**
MapTo 扩展方法可实现**实体**与 Model 间快速映射。
```csharp
/* 只查询 UserModel 中有的字段 */
List<UserModel> userModels = context.Query<User>().MapTo<UserModel>().ToList();

/*或者*/
List<UserModel> userModels = context.Query<User>().ToList<UserModel>();
```
**忽略查询字段：**
Ignore 扩展方法可实现查询数据时不包含某些字段。
```csharp
/* 查询 User 表，但忽略掉 Name 和 Age 属性，生成的 sql 中不会包含 Name 和 Age 字段 */
context.Query<User>().Ignore("Name", "Age").ToList();

/* 以 lambda 的方式 */
context.Query<User>().Ignore(a => new { a.Name, a.Age }).ToList();
```
**更新部分字段：**
UpdateOnly 扩展方法可实现更新部分字段。
```csharp
User user = new User() { Id = 1, Name = "shuxin", Age = 18, Gender = Gender.Man, NickName = "so" };

/* 只更新字段 Name 和 Age */
context.UpdateOnly<User>(user, a => new { a.Name, a.Age });  //lambda 方式
context.UpdateOnly<User>(user, "Name", "Age");  //字符串方式
```
**获取 DataTable：**
```csharp
DataTable dt = context.Session.ExecuteDataTable("select * from users where age>=@age", new { age = 18 });
```
**FormatSqlQuery（仅.NET Core版本支持）：**
FormatSqlQuery 扩展方法可以执行原生sql语句，并且会自动参数化。
```csharp
int age = 18;
List<User> users = context.FormatSqlQuery<User>($"select * from Users where age>={age}").ToList();

//或者
FormattableString sql = $"select * from Users where age>={age}"; //此处声明变量不能是 var 或者 string，否则会生成非参数化 sql，有潜在的 sql 注入问题
users = context.FormatSqlQuery<User>(sql).ToList();

/*
 * 生成参数化 sql：
 * Input Int32 @P_0 = 18;
   select * from Users where age>=@P_0
 */
```', '2017-09-25 12:25:11.3810035', null, 0, null);
INSERT INTO "main"."WikiDocument" VALUES (3432741205165735936, '批量插入', null, 'SqlServer-批量插入', '<h1 id="h1-u6279u91CFu63D2u5165"><a name="批量插入" class="reference-link"></a><span class="header-link octicon octicon-link"></span>批量插入</h1><p><strong>BulkInsert：</strong><br>Chloe.SqlServer.BulkInsert() 方法可以将大批量的数据插入 SqlServer，内部实现基于 SqlBulkCopy。方法定义位于<a href="https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.SqlServer/MsSqlContext.cs">https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.SqlServer/MsSqlContext.cs</a> 。<br>使用方式如下：</p>
<pre><code class="lang-csharp">List&lt;TestEntity&gt; entities = new List&lt;TestEntity&gt;();
for (int i = 0; i &lt; 100000; i++)
{
    entities.Add(new TestEntity()
    {
        F_Byte = 1,
        F_Int16 = 1,
        F_Int32 = i,
        F_Int64 = i,
        F_Double = i,
        F_Float = i,
        F_Decimal = i,
        F_Bool = true,
        F_DateTime = DateTime.Now,
        F_String = &quot;lu&quot; + i.ToString()
    });
}

using (MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString))
{
    context.BulkInsert(entities);
}
</code></pre>
', '# 批量插入
**BulkInsert：**
Chloe.SqlServer.BulkInsert() 方法可以将大批量的数据插入 SqlServer，内部实现基于 SqlBulkCopy。方法定义位于https://github.com/shuxinqin/Chloe/blob/master/src/DotNet/Chloe.SqlServer/MsSqlContext.cs 。
使用方式如下：
```csharp
List<TestEntity> entities = new List<TestEntity>();
for (int i = 0; i < 100000; i++)
{
    entities.Add(new TestEntity()
    {
        F_Byte = 1,
        F_Int16 = 1,
        F_Int32 = i,
        F_Int64 = i,
        F_Double = i,
        F_Float = i,
        F_Decimal = i,
        F_Bool = true,
        F_DateTime = DateTime.Now,
        F_String = "lu" + i.ToString()
    });
}

using (MsSqlContext context = new MsSqlContext(DbHelper.ConnectionString))
{
    context.BulkInsert(entities);
}
```', '2017-09-25 13:28:01.5795246', null, 0, null);

-- ----------------------------
-- Table structure for WikiMenuItem
-- ----------------------------
DROP TABLE IF EXISTS "main"."WikiMenuItem";
CREATE TABLE [WikiMenuItem](
	[Id] varchar(50) PRIMARY KEY NOT NULL,
	[ParentId] varchar(50) NULL,
	[Name] nvarchar(100) NULL,
	[DocumentId] varchar(100) NULL,
	[SortCode] int NULL,
	[IsEnabled] int NOT NULL,
	[CreationTime] datetime NOT NULL);

-- ----------------------------
-- Records of WikiMenuItem
-- ----------------------------
INSERT INTO "main"."WikiMenuItem" VALUES ('0229cd4475014678aab6a2a30055df4e', '4de0d7a7609646db97ed165a20116add', '基本查询', 3325155613347938304, 4, 1, '2016-12-02 16:25:19.13');
INSERT INTO "main"."WikiMenuItem" VALUES ('0581d42795d048c7bf6f070ab9abbe04', '0aa3d30328fd49d98641999f8c4393a1', 'DbFunctions', 3324788085501198336, 8, 1, '2016-12-01 16:02:11.82');
INSERT INTO "main"."WikiMenuItem" VALUES ('0622103789d04583ba05bdfb7c5958ac', '4de0d7a7609646db97ed165a20116add', '聚合查询', 3325155763537575936, 7, 1, '2016-12-02 16:26:00.357');
INSERT INTO "main"."WikiMenuItem" VALUES ('095ee201e96a40c38919b681dabb2b0f', 'd133d6a8b6064de6af14851bbbf3b6b1', '聚合查询', 3325149550670249984, 7, 1, '2016-12-02 16:18:00.857');
INSERT INTO "main"."WikiMenuItem" VALUES ('0aa3d30328fd49d98641999f8c4393a1', null, '接口一览', null, 1, 1, '2016-12-01 15:08:41.967');
INSERT INTO "main"."WikiMenuItem" VALUES ('0c8fdabbb00d499bbb8b7c40823c257b', '4de0d7a7609646db97ed165a20116add', '实体定义', 3325155511531208704, 2, 1, '2016-12-02 16:24:33.09');
INSERT INTO "main"."WikiMenuItem" VALUES ('0d195df806d04c3582e7bc839ea94876', 'e7e1cfb2856d492faeaadc8e2962ac76', '更新数据', 3325146391176544256, 10, 1, '2016-12-02 15:53:00.897');
INSERT INTO "main"."WikiMenuItem" VALUES ('0dad2c1700774046bddc3c72c39324ef', '6e5b779e849e459f957f3abef2a277e6', '事务', 3324837890621440000, 13, 1, '2016-12-01 19:22:29.723');
INSERT INTO "main"."WikiMenuItem" VALUES ('111d5aafd0e3495ab8d1cd6d590eeddd', 'e7e1cfb2856d492faeaadc8e2962ac76', '聚合查询', 3325146192995680256, 7, 1, '2016-12-02 15:52:08.193');
INSERT INTO "main"."WikiMenuItem" VALUES ('1176ff41a980443dbc6b12b5383564f8', '6e5b779e849e459f957f3abef2a277e6', '插入数据', 3324837619082199040, 9, 1, '2016-12-01 19:21:25.633');
INSERT INTO "main"."WikiMenuItem" VALUES ('1887d73bc1b7487ea1b6dbaf676a7403', 'e7e1cfb2856d492faeaadc8e2962ac76', '实体特性', 3325145692988506112, 1, 1, '2016-12-02 15:46:39.977');
INSERT INTO "main"."WikiMenuItem" VALUES ('1cb702e488544a13bb885f2dad051a66', 'd133d6a8b6064de6af14851bbbf3b6b1', '更新数据', 3325149712301948928, 10, 1, '2016-12-02 16:18:41.747');
INSERT INTO "main"."WikiMenuItem" VALUES ('1d0c549780cb453a8da9d0f496808f3c', '6e5b779e849e459f957f3abef2a277e6', '存储过程', 3324837828717707264, 12, 1, '2016-12-01 19:22:16.5');
INSERT INTO "main"."WikiMenuItem" VALUES ('1d57b23aeb4141e5b903f65442535522', 'd133d6a8b6064de6af14851bbbf3b6b1', '多表连接', 3325149375134433280, 5, 1, '2016-12-02 16:17:32.457');
INSERT INTO "main"."WikiMenuItem" VALUES ('2306b7b2c026499eb839ed212ce027f8', 'e7e1cfb2856d492faeaadc8e2962ac76', '插入数据', 3325146327683170304, 9, 1, '2016-12-02 15:52:41.947');
INSERT INTO "main"."WikiMenuItem" VALUES ('2823256324a14d2094a34b7087393e4c', '6e5b779e849e459f957f3abef2a277e6', '常用函数', 3325141727961939968, 14, 1, '2016-12-02 15:27:13.69');
INSERT INTO "main"."WikiMenuItem" VALUES ('29b71a2ab28346e4ae8c2fdee32265e0', 'd133d6a8b6064de6af14851bbbf3b6b1', '删除数据', 3325149761299808256, 11, 1, '2016-12-02 16:18:56.047');
INSERT INTO "main"."WikiMenuItem" VALUES ('2e07e5f795d84ffba9c49b5882d430d5', '6e5b779e849e459f957f3abef2a277e6', '执行Sql', 3324834901575860224, 8, 1, '2016-12-01 19:20:35.203');
INSERT INTO "main"."WikiMenuItem" VALUES ('313a300c33444764bb19ff0b3b575ed9', '0aa3d30328fd49d98641999f8c4393a1', 'IOrderedQuery', 3324761124187930624, 3, 1, '2016-12-01 15:10:06.613');
INSERT INTO "main"."WikiMenuItem" VALUES ('31844a305baa4b5f90c22d253af18b91', 'd133d6a8b6064de6af14851bbbf3b6b1', '事务', 3325150155606327296, 13, 1, '2016-12-02 16:19:27.227');
INSERT INTO "main"."WikiMenuItem" VALUES ('324ab3ef4a644103aa9b098141f324e2', 'e7e1cfb2856d492faeaadc8e2962ac76', '事务', 3325146606914764800, 13, 1, '2016-12-02 15:53:54.59');
INSERT INTO "main"."WikiMenuItem" VALUES ('39f15c0e90684f17aa20a603135e26cf', '4de0d7a7609646db97ed165a20116add', '实体特性', 3325155467776229376, 1, 1, '2016-12-02 16:24:10.337');
INSERT INTO "main"."WikiMenuItem" VALUES ('3d62622a211c4fe58e7a0ffdd1216330', '6e5b779e849e459f957f3abef2a277e6', '基本查询', 3324802610879266816, 4, 1, '2016-12-01 17:22:07.043');
INSERT INTO "main"."WikiMenuItem" VALUES ('438b113e0fdd4ad1a2369980c20767bf', '0aa3d30328fd49d98641999f8c4393a1', 'IJoiningQuery', 3324766621741875200, 5, 1, '2016-12-01 15:11:13.53');
INSERT INTO "main"."WikiMenuItem" VALUES ('45dbafd1df34415483f7d8856a887908', '6e5b779e849e459f957f3abef2a277e6', '实体特性', 3324793835434803200, 1, 1, '2016-12-01 16:54:57.097');
INSERT INTO "main"."WikiMenuItem" VALUES ('45f9b44dc1204faba11b12b134f03137', 'd133d6a8b6064de6af14851bbbf3b6b1', '存储过程', 3325150100572864512, 12, 1, '2016-12-02 16:19:12.107');
INSERT INTO "main"."WikiMenuItem" VALUES ('4612e6b3b38d4efe864af6ecb64068e3', 'e7e1cfb2856d492faeaadc8e2962ac76', '实体定义', 3325145777671503872, 2, 1, '2016-12-02 15:50:00.467');
INSERT INTO "main"."WikiMenuItem" VALUES ('4de0d7a7609646db97ed165a20116add', null, 'SQLite', null, 5, 1, '2016-12-02 15:30:33.237');
INSERT INTO "main"."WikiMenuItem" VALUES ('4eb47e95f65b4256b0a398c2f6431fb3', '0aa3d30328fd49d98641999f8c4393a1', 'IDbSession', 3324773693170647040, 6, 1, '2016-12-01 15:11:30.71');
INSERT INTO "main"."WikiMenuItem" VALUES ('50b8e57344444f14867bdedabe14337d', 'd133d6a8b6064de6af14851bbbf3b6b1', '插入数据', 3325149662540726272, 9, 1, '2016-12-02 16:18:29.767');
INSERT INTO "main"."WikiMenuItem" VALUES ('5732a9242e30414cabe6e48a3bab4fbf', 'e7e1cfb2856d492faeaadc8e2962ac76', '常用函数', 3325146654268456960, 14, 1, '2016-12-02 15:54:08.393');
INSERT INTO "main"."WikiMenuItem" VALUES ('58aa3699bc0442f9b9bbb820063f1c83', 'e7e1cfb2856d492faeaadc8e2962ac76', '分组查询', 3325146123546394624, 6, 1, '2016-12-02 15:51:49.913');
INSERT INTO "main"."WikiMenuItem" VALUES ('5af4040dbfed49018af695a95fc66966', '6e5b779e849e459f957f3abef2a277e6', '分组查询', 3324832206215446528, 6, 1, '2016-12-01 19:20:00.78');
INSERT INTO "main"."WikiMenuItem" VALUES ('5b20c56fd04340baa95015bddd4836ff', '4de0d7a7609646db97ed165a20116add', '创建DbContext', 3325155568988979200, 3, 1, '2016-12-02 16:24:48.483');
INSERT INTO "main"."WikiMenuItem" VALUES ('5c56cd25bbca40fb8802e4437426db92', '4de0d7a7609646db97ed165a20116add', '分组查询', 3325155712383844352, 6, 1, '2016-12-02 16:25:47.493');
INSERT INTO "main"."WikiMenuItem" VALUES ('6bc7f42dda8d463aad0de7979103870b', '0aa3d30328fd49d98641999f8c4393a1', 'IQuery', 3324760360224817152, 2, 1, '2016-12-01 15:09:49.147');
INSERT INTO "main"."WikiMenuItem" VALUES ('6cd0d1e9c74c41cd9a912eaaa51b2f88', '4de0d7a7609646db97ed165a20116add', '存储过程', 3325155999823691776, 12, 1, '2016-12-02 16:27:05.9');
INSERT INTO "main"."WikiMenuItem" VALUES ('6e5b779e849e459f957f3abef2a277e6', null, 'SqlServer', null, 2, 1, '2016-11-19 00:00:00');
INSERT INTO "main"."WikiMenuItem" VALUES ('6edc1a9ad849481f882a1fc9eb469845', 'e7e1cfb2856d492faeaadc8e2962ac76', '创建DbContext', 3325145866628497408, 3, 1, '2016-12-02 15:50:33.37');
INSERT INTO "main"."WikiMenuItem" VALUES ('6f10fffb4abc449dbe20903608f5ca97', 'd133d6a8b6064de6af14851bbbf3b6b1', '创建DbContext', 3325149282020884480, 3, 1, '2016-12-02 16:16:59.383');
INSERT INTO "main"."WikiMenuItem" VALUES ('7444ce78fe1a46ddb06b640d03003fb8', '0aa3d30328fd49d98641999f8c4393a1', 'IDbContext', 3324756912431431680, 1, 1, '2016-12-01 15:09:24.02');
INSERT INTO "main"."WikiMenuItem" VALUES ('7b844f2b778c403e90b7e3d7b97a6518', 'bdc06740283949158e793a1c0dcff031', '复杂查询', 3325507078541279232, 1, 1, '2016-12-03 16:09:22.217');
INSERT INTO "main"."WikiMenuItem" VALUES ('8066e9effe6d40159ca87018031f9698', 'e7e1cfb2856d492faeaadc8e2962ac76', '执行Sql', 3325146263711645696, 8, 1, '2016-12-02 15:52:25.97');
INSERT INTO "main"."WikiMenuItem" VALUES ('823dc8efd03643dca96bb52f4c34a21f', '4de0d7a7609646db97ed165a20116add', '事务', 3325156054349643776, 13, 1, '2016-12-02 16:27:18.23');
INSERT INTO "main"."WikiMenuItem" VALUES ('8659eea519c54e4e9cbd2b7bb81321c4', 'd133d6a8b6064de6af14851bbbf3b6b1', '实体特性', 3325149150596562944, 1, 1, '2016-12-02 16:16:14.903');
INSERT INTO "main"."WikiMenuItem" VALUES ('8c0d3eae2b284c9196d3eed666c2b165', 'e7e1cfb2856d492faeaadc8e2962ac76', '删除数据', 3325146449968103424, 11, 1, '2016-12-02 15:53:15.623');
INSERT INTO "main"."WikiMenuItem" VALUES ('920aac90c3aa4d458359de132448b663', 'e7e1cfb2856d492faeaadc8e2962ac76', '基本查询', 3325145930688102400, 4, 1, '2016-12-02 15:51:20.15');
INSERT INTO "main"."WikiMenuItem" VALUES ('93f4b30e2b9f45f1bdade3549923e8ef', '4de0d7a7609646db97ed165a20116add', '常用函数', 3325156110087749632, 14, 1, '2016-12-02 16:27:31.517');
INSERT INTO "main"."WikiMenuItem" VALUES ('9754b3651f4d40d5b07aa265aeb9666d', '4de0d7a7609646db97ed165a20116add', '插入数据', 3325155856416243712, 9, 1, '2016-12-02 16:26:25.08');
INSERT INTO "main"."WikiMenuItem" VALUES ('99d90325ce1647a3828cfadcfb025292', '0aa3d30328fd49d98641999f8c4393a1', 'AggregateFunctions', 3324786622028840960, 7, 1, '2016-12-01 16:01:59.133');
INSERT INTO "main"."WikiMenuItem" VALUES ('9acd51b68efa4bfa83fa30b077fca917', '6e5b779e849e459f957f3abef2a277e6', '删除数据', 3324837762527395840, 11, 1, '2016-12-01 19:22:03.537');
INSERT INTO "main"."WikiMenuItem" VALUES ('a8d13bd653e54496aeab28f6eec4696a', 'd133d6a8b6064de6af14851bbbf3b6b1', '分组查询', 3325149450531241984, 6, 1, '2016-12-02 16:17:47.527');
INSERT INTO "main"."WikiMenuItem" VALUES ('ac0095b2fbda4731a2efdcb942320b45', '4de0d7a7609646db97ed165a20116add', '删除数据', 3325155947889819648, 11, 1, '2016-12-02 16:26:53.463');
INSERT INTO "main"."WikiMenuItem" VALUES ('b17f31ef1a434b419bbadc2f35557e9b', '4de0d7a7609646db97ed165a20116add', '更新数据', 3325155899147812864, 10, 1, '2016-12-02 16:26:41.887');
INSERT INTO "main"."WikiMenuItem" VALUES ('b3303381a5ad4f818f30e1912bdae33d', '6e5b779e849e459f957f3abef2a277e6', '创建DbContext', 3324798423210655744, 3, 1, '2016-12-01 16:55:42.597');
INSERT INTO "main"."WikiMenuItem" VALUES ('b58ca60e2f75482dbd0982ae04d8fc73', '4de0d7a7609646db97ed165a20116add', '执行Sql', 3325155811822403584, 8, 1, '2016-12-02 16:26:12.277');
INSERT INTO "main"."WikiMenuItem" VALUES ('b7eeba275f6a4243aa0f0a382590f07a', '6e5b779e849e459f957f3abef2a277e6', '实体定义', 3324795934096752640, 2, 1, '2016-12-01 16:55:19.547');
INSERT INTO "main"."WikiMenuItem" VALUES ('b992ac53aba142e3b8fc8e9b7e5b5503', 'd133d6a8b6064de6af14851bbbf3b6b1', '常用函数', 3325150214624378880, 14, 1, '2016-12-02 16:19:41.757');
INSERT INTO "main"."WikiMenuItem" VALUES ('bdc06740283949158e793a1c0dcff031', null, '使用进阶', null, 6, 1, '2016-12-03 16:08:54.997');
INSERT INTO "main"."WikiMenuItem" VALUES ('bf5286c0067f42ffb18f58103a8cbe22', 'e7e1cfb2856d492faeaadc8e2962ac76', '存储过程', 3325146546785222656, 12, 1, '2016-12-02 15:53:30.813');
INSERT INTO "main"."WikiMenuItem" VALUES ('c5af1363d0c24b3cba2c8cbcd4df2edb', 'bdc06740283949158e793a1c0dcff031', '动态排序', 3325512137098395648, 2, 1, '2016-12-03 16:09:35.527');
INSERT INTO "main"."WikiMenuItem" VALUES ('c65aff6f48a640caa94771b74ea744d9', '6e5b779e849e459f957f3abef2a277e6', '更新数据', 3324837696316112896, 10, 1, '2016-12-01 19:21:48.997');
INSERT INTO "main"."WikiMenuItem" VALUES ('c912268134834507a6fdb9eb7dd7a966', '4de0d7a7609646db97ed165a20116add', '多表连接', 3325155661880229888, 5, 1, '2016-12-02 16:25:33.31');
INSERT INTO "main"."WikiMenuItem" VALUES ('c91e639b61c34936a65b31008bc65136', 'd133d6a8b6064de6af14851bbbf3b6b1', '基本查询', 3325149327977873408, 4, 1, '2016-12-02 16:17:16.527');
INSERT INTO "main"."WikiMenuItem" VALUES ('c9957c52ce8e4baf8f1b680eebfb6cf0', '6e5b779e849e459f957f3abef2a277e6', '多表连接', 3324809512287731712, 5, 1, '2016-12-01 18:11:29.19');
INSERT INTO "main"."WikiMenuItem" VALUES ('ca12fc2048f04775846e77a0a955dc32', '6e5b779e849e459f957f3abef2a277e6', '聚合查询', 3324833832581988352, 7, 1, '2016-12-01 19:20:20.37');
INSERT INTO "main"."WikiMenuItem" VALUES ('d133d6a8b6064de6af14851bbbf3b6b1', null, 'Oracle', null, 4, 1, '2016-11-26 21:30:50.913');
INSERT INTO "main"."WikiMenuItem" VALUES ('d322377ea275446bb400069b5ee233cb', 'e7e1cfb2856d492faeaadc8e2962ac76', '多表连接', 3325146061768491008, 5, 1, '2016-12-02 15:51:34.517');
INSERT INTO "main"."WikiMenuItem" VALUES ('e70a8a96f7dc4c058d0b13da3f5fac23', '0aa3d30328fd49d98641999f8c4393a1', 'IGroupingQuery', 3324765409034371072, 4, 1, '2016-12-01 15:10:56.987');
INSERT INTO "main"."WikiMenuItem" VALUES ('e70ed5a2386e4bba813281b21728d6a6', 'd133d6a8b6064de6af14851bbbf3b6b1', '实体定义', 3325149206355640320, 2, 1, '2016-12-02 16:16:33.29');
INSERT INTO "main"."WikiMenuItem" VALUES ('e7e1cfb2856d492faeaadc8e2962ac76', null, 'MySql', null, 3, 1, '2016-11-19 00:00:00');
INSERT INTO "main"."WikiMenuItem" VALUES ('ff3e67c39f884e4791e06379513fee8c', 'd133d6a8b6064de6af14851bbbf3b6b1', '执行Sql', 3325149605842124800, 8, 1, '2016-12-02 16:18:14.877');
INSERT INTO "main"."WikiMenuItem" VALUES ('4880ec5f1bbd46f59df171675c9a5c7a', null, '其它', null, 7, 1, '2016-12-04 16:09:05.6886841');
INSERT INTO "main"."WikiMenuItem" VALUES ('b4958b8839df4ed48cc7900fe98ff3a4', '4880ec5f1bbd46f59df171675c9a5c7a', '性能评测', 3325873886481874944, 1, 1, '2016-12-04 16:09:32.3358668');
INSERT INTO "main"."WikiMenuItem" VALUES ('e22022e11cc84c0f8c610a6661e7d203', 'bdc06740283949158e793a1c0dcff031', 'Sql拦截器', 3337853076894646272, 3, 1, '2017-01-06 17:18:07.0068558');
INSERT INTO "main"."WikiMenuItem" VALUES ('ca51c083db1c4c13a2aac5e051cc91fb', 'bdc06740283949158e793a1c0dcff031', '实用扩展', 3432725391804989440, 4, 1, '2017-09-25 12:57:34.6039404');
