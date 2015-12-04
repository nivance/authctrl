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
   ID			INT(11)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',
   USERNAME             VARCHAR(100) NOT NULL DEFAULT '' COMMENT '��¼�û���',
   PASSWORD             VARCHAR(100) NOT NULL DEFAULT '' COMMENT '����',
   REALNAME             VARCHAR(100) NOT NULL DEFAULT '' COMMENT '��ʵ�û���',
   RETRY                NUMERIC(2,0) NOT NULL DEFAULT 3  COMMENT '��������¼����',
   STATUS               NUMERIC(6,0) NOT NULL DEFAULT 1 COMMENT '״̬',
   CREATEDATE           NUMERIC(16,0)NOT NULL COMMENT '����ʱ��',
   LASTDATE             NUMERIC(16,0)NOT NULL COMMENT '���һ�ε�½ʱ��',
   ROLECODE             VARCHAR(100) NOT NULL DEFAULT '' COMMENT '��ɫ����',
   PRIMARY KEY (ID),
   UNIQUE INDEX `UNQ_INX_NAME` USING BTREE (`USERNAME`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='�û���Ϣ��';

/*==============================================================*/
/* Table: T_ADMIN_ROLE                                          */
/*==============================================================*/
CREATE TABLE T_ADMIN_ROLE
(
   ID			INT(11)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',
   ROLECODE             VARCHAR(100) NOT NULL  DEFAULT '' COMMENT '��ɫ����',
   ROLENAME             VARCHAR(100) NOT NULL  DEFAULT '' COMMENT '��ɫ����',
   PRIMARY KEY (ID),
   UNIQUE INDEX `UNQ_INX_ROLECODE` USING BTREE (`ROLECODE`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='��ɫ��';

/*==============================================================*/
/* Table: T_ADMIN_ROLE_RESOURCE                               */
/*==============================================================*/
CREATE TABLE T_ADMIN_ROLE_RESOURCE
(
   ID			INT(11)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',
   ROLECODE             VARCHAR(100) NOT NULL COMMENT '��ɫ����',
   RESOURCEID         NUMERIC(8,0) NOT NULL COMMENT '��Դ����',
   PRIMARY KEY (ID),
   UNIQUE INDEX `UNQ_INX_ROLE_SRC` USING BTREE (`ROLECODE`,`RESOURCEID`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='��ɫ��Դ��ϵ��';

/*==============================================================*/
/* Table: T_ADMIN_RESOURCES                                    */
/*==============================================================*/
CREATE TABLE T_ADMIN_RESOURCES
(
   ID			INT(11)  UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '����',	
   RID                  NUMERIC(8,0) NOT NULL COMMENT '��Դid',
   PID                  NUMERIC(8,0) NOT NULL DEFAULT 0 COMMENT '����id',
   NAME                 VARCHAR(100) NOT NULL DEFAULT '' COMMENT '��Դ����',
   URL                  VARCHAR(200) NOT NULL DEFAULT '' COMMENT 'URL��ַ',
   LEAF                 NUMERIC(6,0) NOT NULL DEFAULT 1 COMMENT '�Ƿ�ΪҶ�ӽڵ�',
   STATUS               NUMERIC(6,0) NOT NULL DEFAULT 0 COMMENT '״̬',
   ORDERID              NUMERIC(6,0) NOT NULL DEFAULT 0 COMMENT '�����',
   ICON                 VARCHAR(100) NOT NULL DEFAULT '' COMMENT '�˵���ʾͼƬ��Ϣ',
   PRIMARY KEY (ID),
   UNIQUE INDEX `UNQ_INX_RID` USING BTREE (`RID`)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT='��Դ��';