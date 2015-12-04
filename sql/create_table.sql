/*==============================================================*/
/* DBMS name:      MySQL 5.6                                    */
/* Created on:     2015/11/22 14:58:54                          */
/*==============================================================*/
DROP TABLE IF EXISTS T_ADMIN_USER;

DROP TABLE IF EXISTS T_ADMIN_RESOURCES;

DROP TABLE IF EXISTS T_ADMIN_ROLE;

DROP TABLE IF EXISTS T_ADMIN_ROLE_RESOURCE;

/*==============================================================*/
/* Table: T_ADMIN_USER                                      */
/*==============================================================*/
CREATE TABLE T_ADMIN_USER
(
   ID			INT(11)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
   USERNAME             VARCHAR(100) NOT NULL DEFAULT '' COMMENT '登录用户名',
   PASSWORD             VARCHAR(100) NOT NULL DEFAULT '' COMMENT '密码',
   REALNAME             VARCHAR(100) NOT NULL DEFAULT '' COMMENT '真实用户名',
   RETRY                NUMERIC(2,0) NOT NULL DEFAULT 3  COMMENT '允许最大登录次数',
   STATUS               NUMERIC(6,0) NOT NULL DEFAULT 1 COMMENT '状态',
   CREATEDATE           NUMERIC(16,0)NOT NULL COMMENT '创建时间',
   LASTDATE             NUMERIC(16,0)NOT NULL COMMENT '最后一次登陆时间',
   ROLECODE             VARCHAR(100) NOT NULL DEFAULT '' COMMENT '角色代码',
   PRIMARY KEY (ID),
   UNIQUE INDEX `UNQ_INX_NAME` USING BTREE (`USERNAME`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='用户信息表';

/*==============================================================*/
/* Table: T_ADMIN_ROLE                                          */
/*==============================================================*/
CREATE TABLE T_ADMIN_ROLE
(
   ID			INT(11)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
   ROLECODE             VARCHAR(100) NOT NULL  DEFAULT '' COMMENT '角色代码',
   ROLENAME             VARCHAR(100) NOT NULL  DEFAULT '' COMMENT '角色名称',
   PRIMARY KEY (ID),
   UNIQUE INDEX `UNQ_INX_ROLECODE` USING BTREE (`ROLECODE`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='角色表';

/*==============================================================*/
/* Table: T_ADMIN_ROLE_RESOURCE                               */
/*==============================================================*/
CREATE TABLE T_ADMIN_ROLE_RESOURCE
(
   ID			INT(11)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
   ROLECODE             VARCHAR(100) NOT NULL COMMENT '角色代码',
   RESOURCEID         NUMERIC(8,0) NOT NULL COMMENT '资源代码',
   PRIMARY KEY (ID),
   UNIQUE INDEX `UNQ_INX_ROLE_SRC` USING BTREE (`ROLECODE`,`RESOURCEID`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='角色资源关系表';

/*==============================================================*/
/* Table: T_ADMIN_RESOURCES                                    */
/*==============================================================*/
CREATE TABLE T_ADMIN_RESOURCES
(
   ID			INT(11)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',	
   RID                  NUMERIC(8,0) NOT NULL COMMENT '资源id',
   PID                  NUMERIC(8,0) NOT NULL DEFAULT 0 COMMENT '父级id',
   NAME                 VARCHAR(100) NOT NULL DEFAULT '' COMMENT '资源名称',
   URL                  VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'URL地址',
   LEAF                 NUMERIC(6,0) NOT NULL DEFAULT 1 COMMENT '是否为叶子节点',
   STATUS               NUMERIC(6,0) NOT NULL DEFAULT 0 COMMENT '状态',
   ORDERID              NUMERIC(6,0) NOT NULL DEFAULT 0 COMMENT '排序号',
   ICON                 VARCHAR(100) NOT NULL DEFAULT '' COMMENT '菜单显示图片信息',
   PRIMARY KEY (ID),
   UNIQUE INDEX `UNQ_INX_RID` USING BTREE (`RID`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='资源表';