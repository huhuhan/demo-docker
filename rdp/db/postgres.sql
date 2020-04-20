/*
 Navicat Premium Data Transfer

 Source Server         : 101.91.199.54-postgres
 Source Server Type    : PostgreSQL
 Source Server Version : 90426
 Source Host           : 101.91.199.54:5432
 Source Catalog        : rdp_server
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90426
 File Encoding         : 65001

 Date: 18/03/2020 15:10:39
*/


-- ----------------------------
-- Sequence structure for data_set_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."data_set_seq";
CREATE SEQUENCE "public"."data_set_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 100
CACHE 1;

-- ----------------------------
-- Sequence structure for data_source_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."data_source_seq";
CREATE SEQUENCE "public"."data_source_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 200
CACHE 1;

-- ----------------------------
-- Table structure for chart_test
-- ----------------------------
DROP TABLE IF EXISTS "public"."chart_test";
CREATE TABLE "public"."chart_test" (
  "id" int4 NOT NULL,
  "model" varchar(255) COLLATE "pg_catalog"."default",
  "val" varchar(255) COLLATE "pg_catalog"."default",
  "type" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of chart_test
-- ----------------------------
INSERT INTO "public"."chart_test" VALUES (1, '1', '100', '1');
INSERT INTO "public"."chart_test" VALUES (2, '2', '200', '2');
INSERT INTO "public"."chart_test" VALUES (3, '3', '300', '1');
INSERT INTO "public"."chart_test" VALUES (4, '4', '400', '2');
INSERT INTO "public"."chart_test" VALUES (5, '1', '500', '1');
INSERT INTO "public"."chart_test" VALUES (6, '2', '600', '2');
INSERT INTO "public"."chart_test" VALUES (7, '3', '700', '1');
INSERT INTO "public"."chart_test" VALUES (8, '4', '800', '2');

-- ----------------------------
-- Table structure for data_set
-- ----------------------------
DROP TABLE IF EXISTS "public"."data_set";
CREATE TABLE "public"."data_set" (
  "dt_id" int4 NOT NULL DEFAULT nextval('data_set_seq'::regclass),
  "dt_name" varchar(80) COLLATE "pg_catalog"."default",
  "ds_id" int4,
  "type" varchar(10) COLLATE "pg_catalog"."default",
  "sql" varchar(5000) COLLATE "pg_catalog"."default",
  "data_type" varchar(10) COLLATE "pg_catalog"."default",
  "sts" varchar(1) COLLATE "pg_catalog"."default",
  "tx_time" timestamp(6),
  "up_time" timestamp(6),
  "tx_op" varchar(30) COLLATE "pg_catalog"."default",
  "up_op" varchar(30) COLLATE "pg_catalog"."default",
  "order_by_str" varchar(255) COLLATE "pg_catalog"."default",
  "params" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."data_set"."dt_id" IS '数据集编号';
COMMENT ON COLUMN "public"."data_set"."dt_name" IS '数据集名称';
COMMENT ON COLUMN "public"."data_set"."ds_id" IS '数据源编号';
COMMENT ON COLUMN "public"."data_set"."type" IS '数据集分类';
COMMENT ON COLUMN "public"."data_set"."sql" IS '数据集SQL';
COMMENT ON COLUMN "public"."data_set"."data_type" IS '数据来源类型';
COMMENT ON COLUMN "public"."data_set"."sts" IS '数据集状态';
COMMENT ON COLUMN "public"."data_set"."tx_op" IS '登记人';
COMMENT ON COLUMN "public"."data_set"."up_op" IS '更新人';
COMMENT ON COLUMN "public"."data_set"."order_by_str" IS '排序字段';
COMMENT ON COLUMN "public"."data_set"."params" IS '参数设置';
COMMENT ON TABLE "public"."data_set" IS '数据集表';

-- ----------------------------
-- Records of data_set
-- ----------------------------
INSERT INTO "public"."data_set" VALUES (4, '测试SQL', 107, '1', 'select * from db_type', 'sql', '1', '2018-09-03 10:24:32', '2018-09-04 11:31:01', 'admin', 'admin', NULL, NULL);
INSERT INTO "public"."data_set" VALUES (7, '系统日志', 107, 'rsdb', 'select * from sys_log', 'sql', '1', NULL, '2018-09-05 14:52:51', NULL, NULL, NULL, NULL);
INSERT INTO "public"."data_set" VALUES (11, '测试数据', 107, 'rsdb', 'select * from chart_test', 'sql', '1', '2018-09-17 15:15:48', '2018-09-17 15:15:48', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for data_source
-- ----------------------------
DROP TABLE IF EXISTS "public"."data_source";
CREATE TABLE "public"."data_source" (
  "id" int4 NOT NULL DEFAULT nextval('data_source_seq'::regclass),
  "name" varchar(80) COLLATE "pg_catalog"."default",
  "model" varchar(10) COLLATE "pg_catalog"."default",
  "type" varchar(20) COLLATE "pg_catalog"."default",
  "version" varchar(10) COLLATE "pg_catalog"."default",
  "driver" varchar(100) COLLATE "pg_catalog"."default",
  "addr" varchar(300) COLLATE "pg_catalog"."default",
  "usr" varchar(100) COLLATE "pg_catalog"."default",
  "password" varchar(200) COLLATE "pg_catalog"."default",
  "icon" varchar(20) COLLATE "pg_catalog"."default",
  "readonly" varchar(1) COLLATE "pg_catalog"."default",
  "sts" varchar(1) COLLATE "pg_catalog"."default",
  "tx_time" timestamp(6),
  "up_time" timestamp(6),
  "tx_op" varchar(30) COLLATE "pg_catalog"."default",
  "up_op" varchar(30) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."data_source"."id" IS '数据源编号';
COMMENT ON COLUMN "public"."data_source"."name" IS '数据源名称';
COMMENT ON COLUMN "public"."data_source"."model" IS '数据源种类  json   db';
COMMENT ON COLUMN "public"."data_source"."type" IS '数据源类型';
COMMENT ON COLUMN "public"."data_source"."version" IS '数据源版本';
COMMENT ON COLUMN "public"."data_source"."driver" IS '驱动';
COMMENT ON COLUMN "public"."data_source"."addr" IS '地址';
COMMENT ON COLUMN "public"."data_source"."usr" IS '用户';
COMMENT ON COLUMN "public"."data_source"."password" IS '密码';
COMMENT ON COLUMN "public"."data_source"."icon" IS '图标';
COMMENT ON COLUMN "public"."data_source"."readonly" IS '只读';
COMMENT ON COLUMN "public"."data_source"."sts" IS '状态';
COMMENT ON COLUMN "public"."data_source"."tx_op" IS '登记人';
COMMENT ON COLUMN "public"."data_source"."up_op" IS '更新人';
COMMENT ON TABLE "public"."data_source" IS '数据源表';

-- ----------------------------
-- Records of data_source
-- ----------------------------
INSERT INTO "public"."data_source" VALUES (121, 'report_demo', 'rsdb', 'sqlite', NULL, 'org.sqlite.JDBC', 'jdbc:sqlite::resource:db/report_demo.db', '', '', 'SQLite', '0', '1', NULL, '2018-11-28 11:20:33', NULL, 'admin');
INSERT INTO "public"."data_source" VALUES (148, '天气', 'json', 'json', NULL, NULL, 'http://t.weather.sojson.com/api/weather/city/101030100', NULL, NULL, 'Json', NULL, '1', NULL, '2018-11-16 14:49:14', NULL, 'admin');
INSERT INTO "public"."data_source" VALUES (161, 'jnreport_demo', 'jndi', 'mysql', NULL, NULL, 'java:comp/env/jdbc/report_demo', NULL, NULL, 'Jndi', '1', '1', NULL, '2018-11-30 10:44:48', NULL, 'admin');
INSERT INTO "public"."data_source" VALUES (200, 'activiti5', 'rsdb', 'postgresql', NULL, 'org.postgresql.Driver', 'jdbc:postgresql://localhost:5432/activiti5', 'postgres', '123!Feiwei', 'PostgreSQL', '1', '1', '2020-02-28 00:00:00', '2020-02-28 14:55:19.228', 'admin', 'admin');
INSERT INTO "public"."data_source" VALUES (163, 'HomeStead_v2', 'rsdb', 'postgresql', NULL, 'org.postgresql.Driver', 'jdbc:postgresql://101.91.199.54:5432/HomeStead_v2', 'postgres', '123!Feiwei', 'PostgreSQL', '1', '1', NULL, '2020-03-18 06:00:44.951', NULL, 'admin');
INSERT INTO "public"."data_source" VALUES (162, 'HomeStead', 'rsdb', 'postgresql', NULL, 'org.postgresql.Driver', 'jdbc:postgresql://101.91.199.54:5432/HomeStead', 'postgres', '123!Feiwei', 'PostgreSQL', '1', '1', NULL, '2020-03-18 06:00:57.133', NULL, 'admin');
INSERT INTO "public"."data_source" VALUES (201, '保险项目报表', 'rsdb', 'postgresql', NULL, 'org.postgresql.Driver', 'jdbc:postgresql://101.91.199.54:5432/aginsurance', 'postgres', '123!Feiwei', 'PostgreSQL', '1', '1', NULL, '2020-03-18 06:01:01.988', NULL, 'admin');

-- ----------------------------
-- Table structure for db_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."db_type";
CREATE TABLE "public"."db_type" (
  "id" int4 NOT NULL,
  "name" varchar(80) COLLATE "pg_catalog"."default",
  "model" varchar(20) COLLATE "pg_catalog"."default",
  "type" varchar(20) COLLATE "pg_catalog"."default",
  "driver" varchar(100) COLLATE "pg_catalog"."default",
  "addr_demo" varchar(120) COLLATE "pg_catalog"."default",
  "sts" varchar(1) COLLATE "pg_catalog"."default",
  "icon" varchar(80) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."db_type"."id" IS '类型编号';
COMMENT ON COLUMN "public"."db_type"."name" IS '类型名称';
COMMENT ON COLUMN "public"."db_type"."model" IS '数据类型大类';
COMMENT ON COLUMN "public"."db_type"."type" IS '支持类型';
COMMENT ON COLUMN "public"."db_type"."driver" IS '数据库驱动';
COMMENT ON COLUMN "public"."db_type"."addr_demo" IS '数据库地址例子';
COMMENT ON COLUMN "public"."db_type"."sts" IS '状态';
COMMENT ON COLUMN "public"."db_type"."icon" IS '图标';
COMMENT ON TABLE "public"."db_type" IS '数据库支持类型';

-- ----------------------------
-- Records of db_type
-- ----------------------------
INSERT INTO "public"."db_type" VALUES (101, 'MySql', 'rsdb', 'mysql', 'com.mysql.jdbc.Driver', 'jdbc:mysql://<host>:<port>/<database_name>', '1', 'MySql');
INSERT INTO "public"."db_type" VALUES (201, 'Oracle', 'rsdb', 'oracle', 'oracle.jdbc.driver.OracleDriver', 'jdbc:oracle:thin:@//<host>:<port>:<ServiceName>', '1', 'Oracle');
INSERT INTO "public"."db_type" VALUES (301, 'Db2 type2', 'rsdb', 'db2', 'com.ibm.db2.jcc.DB2Driver', 'jdbc:db2:<database_name>', '1', 'Db2 type2');
INSERT INTO "public"."db_type" VALUES (302, 'Db2 type4', 'rsdb', 'db2', 'com.ibm.db2.jcc.DB2Driver', 'jdbc:db2://<host>[:<port>]/<database_name>', '1', 'Db2 type4');
INSERT INTO "public"."db_type" VALUES (401, 'SQL Server 2000', 'rsdb', 'sqlserver', 'com.microsoft.jdbc.sqlserver.SQLServerDriver', 'jdbc:microsoft:sqlserver://:', '0', 'SqlServer');
INSERT INTO "public"."db_type" VALUES (402, 'SQL Server 2005', 'rsdb', 'sqlserver', 'com.microsoft.sqlserver.jdbc.SQLServerDriver', 'jdbc:sqlserver://<server_name>:<port>;DatabaseName=<DatabaseName>', '1', 'SqlServer');
INSERT INTO "public"."db_type" VALUES (501, 'Sybase', 'rsdb', 'sysbase', 'com.sybase.jdbc3.jdbc.SybDriver', 'jdbc:sybase:Tds::', '0', 'Sybase');
INSERT INTO "public"."db_type" VALUES (601, 'PostgreSQL', 'rsdb', 'postgresql', 'org.postgresql.Driver', 'jdbc:postgresql://:/', '1', 'PostgreSQL');
INSERT INTO "public"."db_type" VALUES (701, 'SQLite', 'rsdb', 'sqlite', 'org.sqlite.JDBC', 'jdbc:sqlite:D:\\xxxdatabase.db', '0', 'SQLite');
INSERT INTO "public"."db_type" VALUES (801, 'MongoDB', 'nosqldb', 'mongodb', NULL, 'mongodb://userName:password@host/?authSource=databaseName&amp;ssh=false', '0', 'MongoDB');
INSERT INTO "public"."db_type" VALUES (901, 'Xml', 'file', 'xml', NULL, NULL, '0', 'Xml');
INSERT INTO "public"."db_type" VALUES (902, 'API请求', 'file', 'json', NULL, NULL, '1', 'Json');
INSERT INTO "public"."db_type" VALUES (903, 'Csv', 'file', 'csv', NULL, NULL, '0', 'Csv');
INSERT INTO "public"."db_type" VALUES (904, 'Excel', 'file', 'excel', NULL, NULL, '0', 'Excel');
INSERT INTO "public"."db_type" VALUES (1001, 'JNDI', 'jndi', 'jndi', '', '', '1', 'Jndi');

-- ----------------------------
-- Table structure for demo_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."demo_user";
CREATE TABLE "public"."demo_user" (
  "user_id" int4 NOT NULL,
  "user_name" varchar(80) COLLATE "pg_catalog"."default",
  "user_org" varchar(20) COLLATE "pg_catalog"."default",
  "user_org_name" varchar(80) COLLATE "pg_catalog"."default",
  "wages" float8,
  "position" varchar(30) COLLATE "pg_catalog"."default",
  "reg_date" varchar(8) COLLATE "pg_catalog"."default",
  "user_tel" varchar(30) COLLATE "pg_catalog"."default",
  "user_addr" varchar(80) COLLATE "pg_catalog"."default",
  "user_post" varchar(6) COLLATE "pg_catalog"."default",
  "user_sts" varchar(1) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."demo_user"."user_id" IS '用户编号';
COMMENT ON COLUMN "public"."demo_user"."user_name" IS '用户名称';
COMMENT ON COLUMN "public"."demo_user"."user_org" IS '用户机构';
COMMENT ON COLUMN "public"."demo_user"."user_org_name" IS '机构名称';
COMMENT ON COLUMN "public"."demo_user"."wages" IS '薪资';
COMMENT ON COLUMN "public"."demo_user"."position" IS '职位';
COMMENT ON COLUMN "public"."demo_user"."reg_date" IS '登记日期';
COMMENT ON COLUMN "public"."demo_user"."user_tel" IS '电话';
COMMENT ON COLUMN "public"."demo_user"."user_addr" IS '地址';
COMMENT ON COLUMN "public"."demo_user"."user_post" IS '邮编';
COMMENT ON COLUMN "public"."demo_user"."user_sts" IS '用户状态';
COMMENT ON TABLE "public"."demo_user" IS '演示用户表';

-- ----------------------------
-- Records of demo_user
-- ----------------------------
INSERT INTO "public"."demo_user" VALUES (1, '申志强', '100101', '综合部', 15000, '人力资源', '20141024', '13403555190', '辽宁', '047300', '1');
INSERT INTO "public"."demo_user" VALUES (111, '王建国', '100101', '综合部', 16000, '人力资源', '20141113', '15364758000', '北京', '046000', '0');
INSERT INTO "public"."demo_user" VALUES (112, '张义芳', '100101', '综合部', 20000, '人力资源', '20141117', '15935538888', '河南', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (113, '原琼', '100101', '综合部', 20000.5, '人力资源', '20141208', '13333550900', '北京', '046000', '0');
INSERT INTO "public"."demo_user" VALUES (114, '马惠军', '100102', '财务部', 12000, '财务经理', '20141015', '13383458811', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (115, '武继宏', '100102', '财务部', 13500, '财务经理', '20140707', '13834776068', '山西', '046000', '2');
INSERT INTO "public"."demo_user" VALUES (116, '宋利敏', '100103', '风险部', 8000, '风控经理', '20140707', '15234556806', '北京', '046000', '0');
INSERT INTO "public"."demo_user" VALUES (117, '王冀玲', '100103', '风险部', 10000, '风控经理', '20140707', '13333554333', '山东', '047300', '1');
INSERT INTO "public"."demo_user" VALUES (118, '李燕红', '100104', '资金部', 50000, '资金经理', '20140707', '13333550900', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (119, '郑  强', '100104', '资金部', 16000, '资金经理', '20140707', '13383458811', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (121, '冯  莅', '100105', '业务部', 20000, '客户经理', '20140707', '13834776068', '天津', '046000', '0');
INSERT INTO "public"."demo_user" VALUES (122, '李静', '100105', '业务部', 20000.5, '客户经理', '20140707', '15234556806', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (123, '卫晓勤', '100108', '总裁办', 12000, '总助', '20140707', '13333554333', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (124, '张源', '100103', '风险部', 13500, '风控经理', '20140707', '13333550900', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (125, '冯浩', '100103', '风险部', 8000, '风控经理', '20140707', '13383458811', '河北', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (126, '张亚强', '100104', '资金部', 10000, '资金经理', '20140707', '15392555666', '石家庄', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (127, '靳伟', '100104', '资金部', 50000, '资金经理', '20140707', '13994675055', '河北', '047300', '0');
INSERT INTO "public"."demo_user" VALUES (128, '倪刚', '100105', '业务部', 10000, '客户经理', '20140707', '13720964398', '石家庄', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (129, '王泓杰', '100105', '业务部', 16000, '客户经理', '20140707', '18625504986', '石家庄', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (130, '李晓波', '100105', '业务部', 20000, '客户经理', '20140707', '13935513232', '河北', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (131, '张洋铭', '100105', '业务部', 20000.5, '客户经理', '20111219', '15234699068', '石家庄', '046100', '1');
INSERT INTO "public"."demo_user" VALUES (132, '宋东', '100105', '业务部', 12000, '客户经理', '20111219', '13453515589', '辽宁', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (133, '李淑荣', '100105', '业务部', 13500, '客户经理', '20111222', '13283557468', '北京', '046000', '3');
INSERT INTO "public"."demo_user" VALUES (134, '马垒布', '100105', '业务部', 8000, '客户经理', '20111223', '18003456655', '河南', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (135, '陈和平', '100105', '业务部', 10000, '客户经理', '20111228', '18635531186', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (136, '叶昌银', '100105', '业务部', 16000, '客户经理', '20111229', '13203558555', '北京', '047300', '1');
INSERT INTO "public"."demo_user" VALUES (137, '王增', '100105', '业务部', 20000, '客户经理', '20120116', '15835557732', '山西', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (138, '梁姝丽', '100105', '业务部', 20000.5, '客户经理', '20120118', '13453535388', '北京', '046000', '4');
INSERT INTO "public"."demo_user" VALUES (139, '申亚丽', '100105', '业务部', 12000, '客户经理', '20120118', '18635559721', '山东', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (141, '牛彩红', '100105', '业务部', 13500, '客户经理', '20120119', '13835567286', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (142, '陈玉芬', '100105', '业务部', 8000, '客户经理', '20120208', '18636510130', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (143, '秦虎明', '100105', '业务部', 10000, '客户经理', '20120221', '15935502225', '天津', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (144, '卢风莲', '100105', '业务部', 50000, '客户经理', '20120301', '13509753890', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (145, '李静', '100103', '风险部', 10000, '风控经理', '20120302', '18636518169', '北京', '047300', '1');
INSERT INTO "public"."demo_user" VALUES (146, '申建文', '100103', '风险部', 10000, '风控经理', '20120328', '13467048348', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (147, '王慧芳', '100104', '资金部', 10000, '资金经理', '20120328', '13233363689', '河北', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (148, '马建刚', '100104', '资金部', 10000, '资金经理', '20131017', '18235562999', '石家庄', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (149, '孛森润', '100101', '综合部', 10000, '人力资源', '20131018', '13096666703', '河北', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (151, '宋拴琴', '100101', '综合部', 10000, '人力资源', '20131028', '13994659670', '石家庄', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (152, '姜旭军', '100101', '综合部', 10001.5, '综合部总监', '20131030', '18636518186', '石家庄', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (153, '丁路广', '100102', '财务部', 15000, '财务部出纳', '20130805', '15534555586', '辽宁', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (154, '陈连胜', '100102', '财务部', 16000, '财务部总监', '20130805', '18903452550', '北京', '047300', '1');
INSERT INTO "public"."demo_user" VALUES (155, '苗艳芳', '100103', '风险部', 20000, '风控经理', '20130829', '13994633133', '河南', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (156, '张俊莲', '100103', '风险部', 20000.5, '风控总监', '20130829', '13994631297', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (157, '陈永庆', '100104', '资金部', 12000, '资金经理', '20130917', '15534578988', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (158, '李晓飞', '100104', '资金部', 13500, '资金总监', '20130917', '15935533271', '山西', '046100', '1');
INSERT INTO "public"."demo_user" VALUES (159, '葛明伟', '100105', '业务部', 8000, '客户经理', '20130927', '18635550586', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (160, '王金才', '100105', '业务部', 10000, '业务总监', '20131010', '15035554586', '山东', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (161, '王炜', '100108', '总裁办', 50000, '总裁CEO', '20140409', '13333550900', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (162, '张亚楠', '100108', '总裁办', 50000, '总助', '20140409', '13383458811', '北京', '046000', '1');
INSERT INTO "public"."demo_user" VALUES (163, '段卫军', '100105', '业务部', 8000, '客户经理', '20140409', '13513553121', '天津', '047300', '1');

-- ----------------------------
-- Table structure for ds_showcol
-- ----------------------------
DROP TABLE IF EXISTS "public"."ds_showcol";
CREATE TABLE "public"."ds_showcol" (
  "show_id" int4 NOT NULL,
  "dt_id" int4,
  "use_id" int4,
  "is_show" varchar(1) COLLATE "pg_catalog"."default",
  "data_type" varchar(10) COLLATE "pg_catalog"."default",
  "alias" varchar(80) COLLATE "pg_catalog"."default",
  "describe" varchar(200) COLLATE "pg_catalog"."default",
  "tx_time" timestamp(6),
  "tx_op" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."ds_showcol"."show_id" IS '显示编号';
COMMENT ON COLUMN "public"."ds_showcol"."dt_id" IS '数据集编号';
COMMENT ON COLUMN "public"."ds_showcol"."use_id" IS '引用表编号';
COMMENT ON COLUMN "public"."ds_showcol"."is_show" IS '是否显示';
COMMENT ON COLUMN "public"."ds_showcol"."data_type" IS '数据类型';
COMMENT ON COLUMN "public"."ds_showcol"."alias" IS '别名';
COMMENT ON COLUMN "public"."ds_showcol"."describe" IS '描述';
COMMENT ON COLUMN "public"."ds_showcol"."tx_op" IS '登记人';
COMMENT ON TABLE "public"."ds_showcol" IS '数据集表显示字段表';

-- ----------------------------
-- Table structure for dt_filter
-- ----------------------------
DROP TABLE IF EXISTS "public"."dt_filter";
CREATE TABLE "public"."dt_filter" (
  "filter_id" int4 NOT NULL,
  "dt_id" int4,
  "table_name" varchar(80) COLLATE "pg_catalog"."default",
  "column" varchar(30) COLLATE "pg_catalog"."default",
  "col_type" varchar(1) COLLATE "pg_catalog"."default",
  "operator" varchar(10) COLLATE "pg_catalog"."default",
  "param_type" varchar(1) COLLATE "pg_catalog"."default",
  "param" varchar(30) COLLATE "pg_catalog"."default",
  "tx_time" timestamp(6),
  "up_time" timestamp(6),
  "tx_op" varchar(30) COLLATE "pg_catalog"."default",
  "up_op" varchar(30) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."dt_filter"."filter_id" IS '过滤编号';
COMMENT ON COLUMN "public"."dt_filter"."dt_id" IS '数据集编号';
COMMENT ON COLUMN "public"."dt_filter"."table_name" IS '过滤表名';
COMMENT ON COLUMN "public"."dt_filter"."column" IS '过滤字段';
COMMENT ON COLUMN "public"."dt_filter"."col_type" IS '操作符';
COMMENT ON COLUMN "public"."dt_filter"."param_type" IS '参数数据类型';
COMMENT ON COLUMN "public"."dt_filter"."param" IS '参数';
COMMENT ON COLUMN "public"."dt_filter"."tx_op" IS '登记人';
COMMENT ON COLUMN "public"."dt_filter"."up_op" IS '更新人';
COMMENT ON TABLE "public"."dt_filter" IS '数据集过滤';

-- ----------------------------
-- Table structure for dt_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."dt_param";
CREATE TABLE "public"."dt_param" (
  "param_id" int4 NOT NULL,
  "param_name" varchar(80) COLLATE "pg_catalog"."default",
  "dt_id" int4,
  "param_type" varchar(255) COLLATE "pg_catalog"."default",
  "data_type" varchar(255) COLLATE "pg_catalog"."default",
  "if_values" varchar(1) COLLATE "pg_catalog"."default",
  "tx_time" timestamp(6),
  "up_time" timestamp(6),
  "tx_op" varchar(30) COLLATE "pg_catalog"."default",
  "up_op" varchar(30) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."dt_param"."param_id" IS '参数编号';
COMMENT ON COLUMN "public"."dt_param"."param_name" IS '参数名称';
COMMENT ON COLUMN "public"."dt_param"."dt_id" IS '数据集编号';
COMMENT ON COLUMN "public"."dt_param"."param_type" IS '参数类型';
COMMENT ON COLUMN "public"."dt_param"."data_type" IS '数据类型';
COMMENT ON COLUMN "public"."dt_param"."if_values" IS '是否多值';
COMMENT ON COLUMN "public"."dt_param"."tx_op" IS '登记人';
COMMENT ON COLUMN "public"."dt_param"."up_op" IS '更新人';
COMMENT ON TABLE "public"."dt_param" IS '数据集参数表';

-- ----------------------------
-- Table structure for dt_table
-- ----------------------------
DROP TABLE IF EXISTS "public"."dt_table";
CREATE TABLE "public"."dt_table" (
  "use_id" int4 NOT NULL,
  "dt_id" int4 NOT NULL,
  "table_name" varchar(80) COLLATE "pg_catalog"."default",
  "table_comments" varchar(120) COLLATE "pg_catalog"."default",
  "level" varchar(1) COLLATE "pg_catalog"."default",
  "show_name" varchar(80) COLLATE "pg_catalog"."default",
  "px" int4,
  "py" int4,
  "tx_time" timestamp(6),
  "up_time" timestamp(6),
  "tx_op" varchar(30) COLLATE "pg_catalog"."default",
  "up_op" varchar(30) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."dt_table"."use_id" IS '编号';
COMMENT ON COLUMN "public"."dt_table"."dt_id" IS '数据集编号';
COMMENT ON COLUMN "public"."dt_table"."table_name" IS '表名';
COMMENT ON COLUMN "public"."dt_table"."table_comments" IS '表说明';
COMMENT ON COLUMN "public"."dt_table"."level" IS '层级';
COMMENT ON COLUMN "public"."dt_table"."show_name" IS '显示名称';
COMMENT ON COLUMN "public"."dt_table"."px" IS '横向位置';
COMMENT ON COLUMN "public"."dt_table"."py" IS '纵向位置';
COMMENT ON COLUMN "public"."dt_table"."tx_op" IS '登记人';
COMMENT ON COLUMN "public"."dt_table"."up_op" IS '更新人';
COMMENT ON TABLE "public"."dt_table" IS '据集使用表';

-- ----------------------------
-- Table structure for dt_table_rs
-- ----------------------------
DROP TABLE IF EXISTS "public"."dt_table_rs";
CREATE TABLE "public"."dt_table_rs" (
  "rs_id" int4 NOT NULL,
  "use_id" int4 NOT NULL,
  "rs_type" varchar(10) COLLATE "pg_catalog"."default",
  "rs_model" varchar(1) COLLATE "pg_catalog"."default",
  "tx_time" timestamp(6),
  "up_time" timestamp(6),
  "tx_op" varchar(30) COLLATE "pg_catalog"."default",
  "up_op" varchar(30) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."dt_table_rs"."rs_id" IS '关系编号';
COMMENT ON COLUMN "public"."dt_table_rs"."use_id" IS '引用编号';
COMMENT ON COLUMN "public"."dt_table_rs"."rs_type" IS '关系类型(union/join)';
COMMENT ON COLUMN "public"."dt_table_rs"."rs_model" IS '关系模式';
COMMENT ON COLUMN "public"."dt_table_rs"."tx_op" IS '登记人';
COMMENT ON COLUMN "public"."dt_table_rs"."up_op" IS '更新人';
COMMENT ON TABLE "public"."dt_table_rs" IS '数据集引用表关系表';

-- ----------------------------
-- Table structure for dt_table_rs_condition
-- ----------------------------
DROP TABLE IF EXISTS "public"."dt_table_rs_condition";
CREATE TABLE "public"."dt_table_rs_condition" (
  "cd_id" int4 NOT NULL,
  "cd_type" varchar(10) COLLATE "pg_catalog"."default",
  "rename" varchar(255) COLLATE "pg_catalog"."default",
  "left_table" varchar(255) COLLATE "pg_catalog"."default",
  "left_col" varchar(255) COLLATE "pg_catalog"."default",
  "operator" varchar(255) COLLATE "pg_catalog"."default",
  "right_table" varchar(255) COLLATE "pg_catalog"."default",
  "right_col" varchar(255) COLLATE "pg_catalog"."default",
  "tx_time" timestamp(6),
  "tx_op" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."dt_table_rs_condition"."cd_id" IS '关系编号';
COMMENT ON COLUMN "public"."dt_table_rs_condition"."cd_type" IS '关系类型';
COMMENT ON COLUMN "public"."dt_table_rs_condition"."rename" IS '输出名称';
COMMENT ON COLUMN "public"."dt_table_rs_condition"."left_table" IS '左侧表';
COMMENT ON COLUMN "public"."dt_table_rs_condition"."left_col" IS '左侧字段';
COMMENT ON COLUMN "public"."dt_table_rs_condition"."operator" IS '操作符';
COMMENT ON COLUMN "public"."dt_table_rs_condition"."right_table" IS '右侧表';
COMMENT ON COLUMN "public"."dt_table_rs_condition"."right_col" IS '右侧字段';
COMMENT ON COLUMN "public"."dt_table_rs_condition"."tx_op" IS '登记人';
COMMENT ON TABLE "public"."dt_table_rs_condition" IS '数据集表关系表';

-- ----------------------------
-- Table structure for dtl
-- ----------------------------
DROP TABLE IF EXISTS "public"."dtl";
CREATE TABLE "public"."dtl" (
  "nian" varchar(11) COLLATE "pg_catalog"."default",
  "yue" varchar(2) COLLATE "pg_catalog"."default",
  "dian" varchar(10) COLLATE "pg_catalog"."default",
  "shui" varchar(10) COLLATE "pg_catalog"."default",
  "yuefei" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of dtl
-- ----------------------------
INSERT INTO "public"."dtl" VALUES ('2015', '1', '128.50', '68', '11');
INSERT INTO "public"."dtl" VALUES ('2015', '2', '99.00', '60', '12');
INSERT INTO "public"."dtl" VALUES ('2015', '3', '238.50', '90', '13');
INSERT INTO "public"."dtl" VALUES ('2015', '4', '430.00', '120', '14');
INSERT INTO "public"."dtl" VALUES ('2016', '1', '328.00', '150', '15');
INSERT INTO "public"."dtl" VALUES ('2016', '2', '266.50', '72', '16');
INSERT INTO "public"."dtl" VALUES ('2014', '1', '180.50', '76', '17');
INSERT INTO "public"."dtl" VALUES ('2014', '2', '200.50', '89', '18');
INSERT INTO "public"."dtl" VALUES ('2014', '3', '219.00', '28', '19');

-- ----------------------------
-- Table structure for dtlc
-- ----------------------------
DROP TABLE IF EXISTS "public"."dtlc";
CREATE TABLE "public"."dtlc" (
  "nianc" varchar(11) COLLATE "pg_catalog"."default",
  "yuec" varchar(2) COLLATE "pg_catalog"."default",
  "dianc" varchar(10) COLLATE "pg_catalog"."default",
  "shuic" varchar(10) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of dtlc
-- ----------------------------
INSERT INTO "public"."dtlc" VALUES ('2015', '1', '11.50', '36');
INSERT INTO "public"."dtlc" VALUES ('2015', '2', '87.50', '28');
INSERT INTO "public"."dtlc" VALUES ('2015', '3', '90.00', '60');
INSERT INTO "public"."dtlc" VALUES ('2015', '4', '78.50', '30');
INSERT INTO "public"."dtlc" VALUES ('2016', '1', '120.50', '80');
INSERT INTO "public"."dtlc" VALUES ('2016', '2', '216.00', '110');
INSERT INTO "public"."dtlc" VALUES ('2014', '1', '29.00', '85');
INSERT INTO "public"."dtlc" VALUES ('2014', '2', '59.50', '98');
INSERT INTO "public"."dtlc" VALUES ('2014', '3', '108.50', '120');

-- ----------------------------
-- Table structure for material
-- ----------------------------
DROP TABLE IF EXISTS "public"."material";
CREATE TABLE "public"."material" (
  "material_id" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "material_name" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "material_path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "material_relative_path" varchar(255) COLLATE "pg_catalog"."default" NOT NULL,
  "material_tags" varchar(255) COLLATE "pg_catalog"."default",
  "material_group" varchar(255) COLLATE "pg_catalog"."default",
  "upload_time" timestamp(6),
  "upload_user" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."material"."material_id" IS '素材ID';
COMMENT ON COLUMN "public"."material"."material_name" IS '素材名称';
COMMENT ON COLUMN "public"."material"."material_path" IS '路径';
COMMENT ON COLUMN "public"."material"."material_relative_path" IS '相对路径';
COMMENT ON COLUMN "public"."material"."material_tags" IS '标签';
COMMENT ON COLUMN "public"."material"."material_group" IS '分组';
COMMENT ON COLUMN "public"."material"."upload_time" IS '上传时间';
COMMENT ON COLUMN "public"."material"."upload_user" IS '上传用户';

-- ----------------------------
-- Records of material
-- ----------------------------
INSERT INTO "public"."material" VALUES ('04191808-e9ff-48a3-9a39-3d6b00f15253', 'dec-text-14.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMDQxOTE4MDgtZTlmZi00OGEzLTlhMzktM2Q2YjAwZjE1MjUzLnBuZw==', 'material/04191808-e9ff-48a3-9a39-3d6b00f15253.png', NULL, '边框', '2019-07-26 11:28:22', 'admin');
INSERT INTO "public"."material" VALUES ('0aa0f3d9-047c-4c6c-8388-c6cba8e79b2b', 'pic-9.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMGFhMGYzZDktMDQ3Yy00YzZjLTgzODgtYzZjYmE4ZTc5YjJiLnBuZw==', 'material/0aa0f3d9-047c-4c6c-8388-c6cba8e79b2b.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('0aee1faf-9eb2-4e1d-9af6-af3da37d5fae', 'dec-title-5.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMGFlZTFmYWYtOWViMi00ZTFkLTlhZjYtYWYzZGEzN2Q1ZmFlLnBuZw==', 'material/0aee1faf-9eb2-4e1d-9af6-af3da37d5fae.png', NULL, '标题', '2019-07-26 11:27:44', 'admin');
INSERT INTO "public"."material" VALUES ('0c39e1c7-4689-4f7b-8dbe-3107a0a96f52', 'pic-g2N6DyaQF6LPAs4B.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMGMzOWUxYzctNDY4OS00ZjdiLThkYmUtMzEwN2EwYTk2ZjUyLnBuZw==', 'material/0c39e1c7-4689-4f7b-8dbe-3107a0a96f52.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('1157bc4b-a22f-42dc-b765-5b3a19b3fe11', 'dec-gif-8.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTE1N2JjNGItYTIyZi00MmRjLWI3NjUtNWIzYTE5YjNmZTExLmdpZg==', 'material/1157bc4b-a22f-42dc-b765-5b3a19b3fe11.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('12046eb6-432f-478f-b878-c3c817a19bd0', 'pic-4.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTIwNDZlYjYtNDMyZi00NzhmLWI4NzgtYzNjODE3YTE5YmQwLnBuZw==', 'material/12046eb6-432f-478f-b878-c3c817a19bd0.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('12b4c191-4fae-4b2e-a9c9-c80a474b7206', 'pic-232-f5b366790d3979f7.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTJiNGMxOTEtNGZhZS00YjJlLWE5YzktYzgwYTQ3NGI3MjA2LmdpZg==', 'material/12b4c191-4fae-4b2e-a9c9-c80a474b7206.gif', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('137a7572-2be2-4bef-a932-bfe39fa746e0', 'dec-text-10.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTM3YTc1NzItMmJlMi00YmVmLWE5MzItYmZlMzlmYTc0NmUwLnBuZw==', 'material/137a7572-2be2-4bef-a932-bfe39fa746e0.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('13e3e1be-65f5-4fe6-8c75-ad099ec8acc5', 'dec-pic-1.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTNlM2UxYmUtNjVmNS00ZmU2LThjNzUtYWQwOTllYzhhY2M1LnBuZw==', 'material/13e3e1be-65f5-4fe6-8c75-ad099ec8acc5.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('14653cb5-e046-48d2-adab-d3b45541049f', 'BailysBeads_ROW6229832412_1920x1080.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTQ2NTNjYjUtZTA0Ni00OGQyLWFkYWItZDNiNDU1NDEwNDlmLmpwZw==', 'material/14653cb5-e046-48d2-adab-d3b45541049f.jpg', NULL, '背景', '2019-07-26 11:18:13', 'admin');
INSERT INTO "public"."material" VALUES ('14bd2f2c-10c9-4aa4-9810-49b7fd5a2073', 'background-44cWxfnyxe4Vj3XF.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTRiZDJmMmMtMTBjOS00YWE0LTk4MTAtNDliN2ZkNWEyMDczLmpwZw==', 'material/14bd2f2c-10c9-4aa4-9810-49b7fd5a2073.jpg', NULL, '背景', '2019-07-26 11:43:13', 'admin');
INSERT INTO "public"."material" VALUES ('17ede46c-ac4a-4326-820a-23748291f87a', 'pic-4yvtgiMdd2c8fwn4.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTdlZGU0NmMtYWM0YS00MzI2LTgyMGEtMjM3NDgyOTFmODdhLnBuZw==', 'material/17ede46c-ac4a-4326-820a-23748291f87a.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('18f6a015-9a5c-4ad0-8998-700f364355ab', '2.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMThmNmEwMTUtOWE1Yy00YWQwLTg5OTgtNzAwZjM2NDM1NWFiLmpwZw==', 'material/18f6a015-9a5c-4ad0-8998-700f364355ab.jpg', NULL, '背景', '2019-07-26 11:26:17', 'admin');
INSERT INTO "public"."material" VALUES ('199a71bc-e3bd-4d94-9ff2-bfd0f07f4850', 'daySec-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMTk5YTcxYmMtZTNiZC00ZDk0LTlmZjItYmZkMGYwN2Y0ODUwLnBuZw==', 'material/199a71bc-e3bd-4d94-9ff2-bfd0f07f4850.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('1ae6fedf-5bd4-4519-a789-2c9381f86fe3', 'dec-text-2.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMWFlNmZlZGYtNWJkNC00NTE5LWE3ODktMmM5MzgxZjg2ZmUzLnBuZw==', 'material/1ae6fedf-5bd4-4519-a789-2c9381f86fe3.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('1d318726-f415-445d-9467-521846465383', 'dec-text-13.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMWQzMTg3MjYtZjQxNS00NDVkLTk0NjctNTIxODQ2NDY1MzgzLnBuZw==', 'material/1d318726-f415-445d-9467-521846465383.png', NULL, '边框', '2019-07-26 11:28:22', 'admin');
INSERT INTO "public"."material" VALUES ('1d464fa2-9538-4b10-ba14-153d2e49f757', 'reset-btn-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMWQ0NjRmYTItOTUzOC00YjEwLWJhMTQtMTUzZDJlNDlmNzU3LnBuZw==', 'material/1d464fa2-9538-4b10-ba14-153d2e49f757.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('1ea8e2f2-861b-4089-87d8-0fb56f03bf53', 'pic-86BKa8kymLuDfLG7.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMWVhOGUyZjItODYxYi00MDg5LTg3ZDgtMGZiNTZmMDNiZjUzLnBuZw==', 'material/1ea8e2f2-861b-4089-87d8-0fb56f03bf53.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('254d4d29-fa36-4e33-8baf-2b53ea53d488', '2.png', 'RDpcWUhcd29ya3NwYWNlXFJEUFxCRERQeDY0XGRhdGFcXG1hdGVyaWFsLzI1NGQ0ZDI5LWZhMzYtNGUzMy04YmFmLTJiNTNlYTUzZDQ4OC5wbmc=', 'material/254d4d29-fa36-4e33-8baf-2b53ea53d488.png', NULL, '静态素材', '2019-12-06 17:52:31', 'admin');
INSERT INTO "public"."material" VALUES ('270471ab-71bb-4368-b04e-ac8bd749540f', 'web.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMjcwNDcxYWItNzFiYi00MzY4LWIwNGUtYWM4YmQ3NDk1NDBmLnBuZw==', 'material/270471ab-71bb-4368-b04e-ac8bd749540f.png', NULL, '静态素材', '2019-07-26 11:29:13', 'admin');
INSERT INTO "public"."material" VALUES ('276bf332-fc18-404d-b526-367b63447d6d', 'dec-title-3.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMjc2YmYzMzItZmMxOC00MDRkLWI1MjYtMzY3YjYzNDQ3ZDZkLnBuZw==', 'material/276bf332-fc18-404d-b526-367b63447d6d.png', NULL, '标题', '2019-07-26 11:27:44', 'admin');
INSERT INTO "public"."material" VALUES ('2881f5f1-689d-494e-969c-07c07d32ff6a', 'day-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMjg4MWY1ZjEtNjg5ZC00OTRlLTk2OWMtMDdjMDdkMzJmZjZhLnBuZw==', 'material/2881f5f1-689d-494e-969c-07c07d32ff6a.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('29252d63-a334-4a34-b4f6-27403d55174d', 'reset-btn.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMjkyNTJkNjMtYTMzNC00YTM0LWI0ZjYtMjc0MDNkNTUxNzRkLnBuZw==', 'material/29252d63-a334-4a34-b4f6-27403d55174d.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('2bfe8272-53cd-4ce5-a3e4-c7ff3977bb05', 'pic-147-8940a6a3e6cdc2b0.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMmJmZTgyNzItNTNjZC00Y2U1LWEzZTQtYzdmZjM5NzdiYjA1LnBuZw==', 'material/2bfe8272-53cd-4ce5-a3e4-c7ff3977bb05.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('313ee2c7-506b-4385-b288-831a15ed05ef', 'pic-7.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMzEzZWUyYzctNTA2Yi00Mzg1LWIyODgtODMxYTE1ZWQwNWVmLnBuZw==', 'material/313ee2c7-506b-4385-b288-831a15ed05ef.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('36b401ff-d01b-4e6a-b4bb-f64275ab653e', 'background-88VwuczRK2Rx8iRx.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMzZiNDAxZmYtZDAxYi00ZTZhLWI0YmItZjY0Mjc1YWI2NTNlLmpwZw==', 'material/36b401ff-d01b-4e6a-b4bb-f64275ab653e.jpg', NULL, '背景', '2019-07-26 11:43:14', 'admin');
INSERT INTO "public"."material" VALUES ('37830c9b-54e5-4976-a58a-da95627e8475', 'dec-text-11.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMzc4MzBjOWItNTRlNS00OTc2LWE1OGEtZGE5NTYyN2U4NDc1LnBuZw==', 'material/37830c9b-54e5-4976-a58a-da95627e8475.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('37e332d9-8064-4d43-a4df-7c4fd2b68ab6', 'pic-230-1abf980f5d966f30.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvMzdlMzMyZDktODA2NC00ZDQzLWE0ZGYtN2M0ZmQyYjY4YWI2LmdpZg==', 'material/37e332d9-8064-4d43-a4df-7c4fd2b68ab6.gif', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('3ae79e15-eb1c-47d3-9dbe-1a3431887dcf', 'dec-gif-13.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvM2FlNzllMTUtZWIxYy00N2QzLTlkYmUtMWEzNDMxODg3ZGNmLmdpZg==', 'material/3ae79e15-eb1c-47d3-9dbe-1a3431887dcf.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('3b6509e3-9595-49bb-9376-f019d6e8ab2b', 'dec-pic-4.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvM2I2NTA5ZTMtOTU5NS00OWJiLTkzNzYtZjAxOWQ2ZThhYjJiLnBuZw==', 'material/3b6509e3-9595-49bb-9376-f019d6e8ab2b.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('3ccac1b7-bbeb-4a3c-99ac-01c70d090252', 'pic-6scio8hXYU2qCTa8.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvM2NjYWMxYjctYmJlYi00YTNjLTk5YWMtMDFjNzBkMDkwMjUyLnBuZw==', 'material/3ccac1b7-bbeb-4a3c-99ac-01c70d090252.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('3ce9bb85-68de-426b-94a1-d30cff052bdf', 'dec-gif-9.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvM2NlOWJiODUtNjhkZS00MjZiLTk0YTEtZDMwY2ZmMDUyYmRmLmdpZg==', 'material/3ce9bb85-68de-426b-94a1-d30cff052bdf.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('412be5bb-233f-42d4-908d-c2208d28c149', '5.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNDEyYmU1YmItMjMzZi00MmQ0LTkwOGQtYzIyMDhkMjhjMTQ5LnBuZw==', 'material/412be5bb-233f-42d4-908d-c2208d28c149.png', NULL, '背景', '2019-07-26 11:26:18', 'admin');
INSERT INTO "public"."material" VALUES ('4a68321a-14aa-47b7-ae94-0a4c00928102', 'dec-pic-3.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNGE2ODMyMWEtMTRhYS00N2I3LWFlOTQtMGE0YzAwOTI4MTAyLnBuZw==', 'material/4a68321a-14aa-47b7-ae94-0a4c00928102.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('4b7ca71c-0a05-4ed2-bd6a-07b5b5d9e65b', 'text-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNGI3Y2E3MWMtMGEwNS00ZWQyLWJkNmEtMDdiNWI1ZDllNjViLnBuZw==', 'material/4b7ca71c-0a05-4ed2-bd6a-07b5b5d9e65b.png', NULL, '静态素材', '2019-07-26 11:29:13', 'admin');
INSERT INTO "public"."material" VALUES ('4b88e748-3439-4bb9-8cea-abb734a90315', 'dec-text-4.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNGI4OGU3NDgtMzQzOS00YmI5LThjZWEtYWJiNzM0YTkwMzE1LnBuZw==', 'material/4b88e748-3439-4bb9-8cea-abb734a90315.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('4bbb0ca5-3c26-40a9-a0b5-7ce13c4c1bed', 'pic-145-21e245aedee0de09.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNGJiYjBjYTUtM2MyNi00MGE5LWEwYjUtN2NlMTNjNGMxYmVkLnBuZw==', 'material/4bbb0ca5-3c26-40a9-a0b5-7ce13c4c1bed.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('4d8dfc0a-9d07-4015-af42-03eaa3883393', 'pic-233-e01e793cd1bdcdc9.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNGQ4ZGZjMGEtOWQwNy00MDE1LWFmNDItMDNlYWEzODgzMzkzLmdpZg==', 'material/4d8dfc0a-9d07-4015-af42-03eaa3883393.gif', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('51f21c16-e0ff-4e93-8d60-06c212aa1697', 'dec-gif-3.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNTFmMjFjMTYtZTBmZi00ZTkzLThkNjAtMDZjMjEyYWExNjk3LmdpZg==', 'material/51f21c16-e0ff-4e93-8d60-06c212aa1697.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('523f91be-477e-491e-a8a1-6503a84998f4', 'daySec.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNTIzZjkxYmUtNDc3ZS00OTFlLWE4YTEtNjUwM2E4NDk5OGY0LnBuZw==', 'material/523f91be-477e-491e-a8a1-6503a84998f4.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('5b3d1d7a-b735-45fc-9eb1-9b997b041317', 'dec-gif-18.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNWIzZDFkN2EtYjczNS00NWZjLTllYjEtOWI5OTdiMDQxMzE3LmdpZg==', 'material/5b3d1d7a-b735-45fc-9eb1-9b997b041317.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('61224255-0992-4420-be18-3a5372d87e13', 'select-btn.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNjEyMjQyNTUtMDk5Mi00NDIwLWJlMTgtM2E1MzcyZDg3ZTEzLnBuZw==', 'material/61224255-0992-4420-be18-3a5372d87e13.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('61e3eebc-cb7a-4cb0-804a-fdeb5a4db79d', 'dec-title-2.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNjFlM2VlYmMtY2I3YS00Y2IwLTgwNGEtZmRlYjVhNGRiNzlkLnBuZw==', 'material/61e3eebc-cb7a-4cb0-804a-fdeb5a4db79d.png', NULL, '标题', '2019-07-26 11:27:44', 'admin');
INSERT INTO "public"."material" VALUES ('66fea28d-bcb2-4f84-8aa5-613773c322d9', 'background-3.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNjZmZWEyOGQtYmNiMi00Zjg0LThhYTUtNjEzNzczYzMyMmQ5LnBuZw==', 'material/66fea28d-bcb2-4f84-8aa5-613773c322d9.png', NULL, '背景', '2019-07-26 11:43:13', 'admin');
INSERT INTO "public"."material" VALUES ('67a6598c-9d08-43ba-86db-72586d9d9584', 'dec-gif-14.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNjdhNjU5OGMtOWQwOC00M2JhLTg2ZGItNzI1ODZkOWQ5NTg0LmdpZg==', 'material/67a6598c-9d08-43ba-86db-72586d9d9584.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('688e4294-c129-4152-b8ad-fcef58f1833a', 'dec-text-3.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNjg4ZTQyOTQtYzEyOS00MTUyLWI4YWQtZmNlZjU4ZjE4MzNhLnBuZw==', 'material/688e4294-c129-4152-b8ad-fcef58f1833a.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('68c57f7a-43a3-4645-a8ed-8d4d8c67870a', 'pic-6.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNjhjNTdmN2EtNDNhMy00NjQ1LWE4ZWQtOGQ0ZDhjNjc4NzBhLnBuZw==', 'material/68c57f7a-43a3-4645-a8ed-8d4d8c67870a.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('6987c7aa-e013-4059-8918-900f238c726d', 'pic-237-dc21156e2c9fe530.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNjk4N2M3YWEtZTAxMy00MDU5LTg5MTgtOTAwZjIzOGM3MjZkLmdpZg==', 'material/6987c7aa-e013-4059-8918-900f238c726d.gif', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('6baf35ac-645a-40a3-8062-1fea8c4eff86', '6.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNmJhZjM1YWMtNjQ1YS00MGEzLTgwNjItMWZlYThjNGVmZjg2LmpwZw==', 'material/6baf35ac-645a-40a3-8062-1fea8c4eff86.jpg', NULL, '背景', '2019-07-26 11:26:18', 'admin');
INSERT INTO "public"."material" VALUES ('6d8c550e-42be-4048-b319-9c812ea22de2', 'text-list.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNmQ4YzU1MGUtNDJiZS00MDQ4LWIzMTktOWM4MTJlYTIyZGUyLnBuZw==', 'material/6d8c550e-42be-4048-b319-9c812ea22de2.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('6e57d133-3201-4931-b908-af239e7c7f0e', 'dec-text-8.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNmU1N2QxMzMtMzIwMS00OTMxLWI5MDgtYWYyMzllN2M3ZjBlLnBuZw==', 'material/6e57d133-3201-4931-b908-af239e7c7f0e.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('6eefd4c4-61fb-493b-931f-147214d32a07', 'background-zKvVf3rb7brY6rK8.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNmVlZmQ0YzQtNjFmYi00OTNiLTkzMWYtMTQ3MjE0ZDMyYTA3LmpwZw==', 'material/6eefd4c4-61fb-493b-931f-147214d32a07.jpg', NULL, '背景', '2019-07-26 11:43:14', 'admin');
INSERT INTO "public"."material" VALUES ('719e0da1-515b-4ad7-8f36-7cc3f70d4d21', '3.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNzE5ZTBkYTEtNTE1Yi00YWQ3LThmMzYtN2NjM2Y3MGQ0ZDIxLmpwZw==', 'material/719e0da1-515b-4ad7-8f36-7cc3f70d4d21.jpg', NULL, '背景', '2019-07-26 11:26:17', 'admin');
INSERT INTO "public"."material" VALUES ('76523f85-6d80-468a-b23f-b41ce2715350', 'background-1.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNzY1MjNmODUtNmQ4MC00NjhhLWIyM2YtYjQxY2UyNzE1MzUwLnBuZw==', 'material/76523f85-6d80-468a-b23f-b41ce2715350.png', NULL, '背景', '2019-07-26 11:43:13', 'admin');
INSERT INTO "public"."material" VALUES ('788029eb-3f03-4c8e-9ef7-b120357a40f6', 'pic-77nxFJv3pkX4mpUQ.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNzg4MDI5ZWItM2YwMy00YzhlLTllZjctYjEyMDM1N2E0MGY2LnBuZw==', 'material/788029eb-3f03-4c8e-9ef7-b120357a40f6.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('79e41112-3f09-4869-a35a-66b8e9facbe2', 'pic-3.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvNzllNDExMTItM2YwOS00ODY5LWEzNWEtNjZiOGU5ZmFjYmUyLnBuZw==', 'material/79e41112-3f09-4869-a35a-66b8e9facbe2.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('80719e06-ec05-46e0-bda6-593338c82776', 'dec-gif-7.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvODA3MTllMDYtZWMwNS00NmUwLWJkYTYtNTkzMzM4YzgyNzc2LmdpZg==', 'material/80719e06-ec05-46e0-bda6-593338c82776.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('8199c7e5-3467-459a-a3d1-2398508d0bf0', 'pic-146-8920af838646a629.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvODE5OWM3ZTUtMzQ2Ny00NTlhLWEzZDEtMjM5ODUwOGQwYmYwLnBuZw==', 'material/8199c7e5-3467-459a-a3d1-2398508d0bf0.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('83646bb7-d85b-4b14-8a08-4d9b89e33332', 'Section.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvODM2NDZiYjctZDg1Yi00YjE0LThhMDgtNGQ5Yjg5ZTMzMzMyLnBuZw==', 'material/83646bb7-d85b-4b14-8a08-4d9b89e33332.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('874b3e92-21c3-4ace-a36f-ab256917f289', 'background-2.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvODc0YjNlOTItMjFjMy00YWNlLWEzNmYtYWIyNTY5MTdmMjg5LnBuZw==', 'material/874b3e92-21c3-4ace-a36f-ab256917f289.png', NULL, '背景', '2019-07-26 11:43:13', 'admin');
INSERT INTO "public"."material" VALUES ('8f980368-bf4e-4ff2-880f-61406518ff9f', 'web-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOGY5ODAzNjgtYmY0ZS00ZmYyLTg4MGYtNjE0MDY1MThmZjlmLnBuZw==', 'material/8f980368-bf4e-4ff2-880f-61406518ff9f.png', NULL, '静态素材', '2019-07-26 11:29:13', 'admin');
INSERT INTO "public"."material" VALUES ('917f0c04-e44e-4ca0-a00f-2fbdda827c40', 'pic-aUM23LyRC6HZ9CCM.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTE3ZjBjMDQtZTQ0ZS00Y2EwLWEwMGYtMmZiZGRhODI3YzQwLnBuZw==', 'material/917f0c04-e44e-4ca0-a00f-2fbdda827c40.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('91e240a4-18f2-474e-b3b0-bf99f38422d0', 'dec-text-9.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTFlMjQwYTQtMThmMi00NzRlLWIzYjAtYmY5OWYzODQyMmQwLnBuZw==', 'material/91e240a4-18f2-474e-b3b0-bf99f38422d0.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('9263c49e-8490-4770-a93e-8ab5e3bdfabe', 'background-g4Q9Ar2kRDRpr8yK.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTI2M2M0OWUtODQ5MC00NzcwLWE5M2UtOGFiNWUzYmRmYWJlLmpwZw==', 'material/9263c49e-8490-4770-a93e-8ab5e3bdfabe.jpg', NULL, '背景', '2019-07-26 11:43:14', 'admin');
INSERT INTO "public"."material" VALUES ('935ef94f-43d0-489a-a6de-9579c22b1113', 'pic-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTM1ZWY5NGYtNDNkMC00ODlhLWE2ZGUtOTU3OWMyMmIxMTEzLnBuZw==', 'material/935ef94f-43d0-489a-a6de-9579c22b1113.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('94449bfc-b358-4fff-b634-4738d197257b', 'dec-gif-10.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTQ0NDliZmMtYjM1OC00ZmZmLWI2MzQtNDczOGQxOTcyNTdiLmdpZg==', 'material/94449bfc-b358-4fff-b634-4738d197257b.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('94e44186-386d-4123-bbe3-76df74f4270e', 'text-select-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTRlNDQxODYtMzg2ZC00MTIzLWJiZTMtNzZkZjc0ZjQyNzBlLnBuZw==', 'material/94e44186-386d-4123-bbe3-76df74f4270e.png', NULL, '静态素材', '2019-07-26 11:29:13', 'admin');
INSERT INTO "public"."material" VALUES ('9538a06f-ebff-4d94-a42a-9d3322d04e89', 'text-list-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTUzOGEwNmYtZWJmZi00ZDk0LWE0MmEtOWQzMzIyZDA0ZTg5LnBuZw==', 'material/9538a06f-ebff-4d94-a42a-9d3322d04e89.png', NULL, '静态素材', '2019-07-26 11:29:13', 'admin');
INSERT INTO "public"."material" VALUES ('954ddb2a-298e-4a05-aef3-ff340e978563', 'dec-pic-2.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTU0ZGRiMmEtMjk4ZS00YTA1LWFlZjMtZmYzNDBlOTc4NTYzLnBuZw==', 'material/954ddb2a-298e-4a05-aef3-ff340e978563.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('9764c054-85b8-4566-b38e-b5cb38ce04b1', 'pic-PMx4yFtQ9Bwk24Ye.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvOTc2NGMwNTQtODViOC00NTY2LWIzOGUtYjVjYjM4Y2UwNGIxLnBuZw==', 'material/9764c054-85b8-4566-b38e-b5cb38ce04b1.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('a26793bd-bd9a-4d57-80ab-785c57956093', 'pic-238-0e821128f121a815.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYTI2NzkzYmQtYmQ5YS00ZDU3LTgwYWItNzg1YzU3OTU2MDkzLmdpZg==', 'material/a26793bd-bd9a-4d57-80ab-785c57956093.gif', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('a34ce658-da3a-43c5-a21d-ee9e99071086', 'dec-gif-17.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYTM0Y2U2NTgtZGEzYS00M2M1LWEyMWQtZWU5ZTk5MDcxMDg2LmdpZg==', 'material/a34ce658-da3a-43c5-a21d-ee9e99071086.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('a38be52d-8e61-4abf-ad2e-1b1faa22ab4b', 'dec-gif-12.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYTM4YmU1MmQtOGU2MS00YWJmLWFkMmUtMWIxZmFhMjJhYjRiLmdpZg==', 'material/a38be52d-8e61-4abf-ad2e-1b1faa22ab4b.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('a406cfb7-5002-45f2-be24-b4f27357d501', 'pic-rx8P7K2RLhNKMqY8.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYTQwNmNmYjctNTAwMi00NWYyLWJlMjQtYjRmMjczNTdkNTAxLnBuZw==', 'material/a406cfb7-5002-45f2-be24-b4f27357d501.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('a9d46cfb-0657-489c-86eb-7dc8b5bea29d', 'pic-240-e9640eece337d0dc.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYTlkNDZjZmItMDY1Ny00ODljLTg2ZWItN2RjOGI1YmVhMjlkLmdpZg==', 'material/a9d46cfb-0657-489c-86eb-7dc8b5bea29d.gif', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('aaeac45f-de9f-4f0a-a7cd-2e30b70dafed', 'dec-gif-6.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYWFlYWM0NWYtZGU5Zi00ZjBhLWE3Y2QtMmUzMGI3MGRhZmVkLmdpZg==', 'material/aaeac45f-de9f-4f0a-a7cd-2e30b70dafed.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('ab3162e1-bdcd-4b38-94de-2ac5923c8037', 'Section-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYWIzMTYyZTEtYmRjZC00YjM4LTk0ZGUtMmFjNTkyM2M4MDM3LnBuZw==', 'material/ab3162e1-bdcd-4b38-94de-2ac5923c8037.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('ad07161c-c4a4-4365-abfa-4e4db906b4c9', 'select-btn-white.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYWQwNzE2MWMtYzRhNC00MzY1LWFiZmEtNGU0ZGI5MDZiNGM5LnBuZw==', 'material/ad07161c-c4a4-4365-abfa-4e4db906b4c9.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('ad0e2bfe-b21c-4a08-90df-2ad1442e784f', 'background-49uxqXBm2G2jQqod.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYWQwZTJiZmUtYjIxYy00YTA4LTkwZGYtMmFkMTQ0MmU3ODRmLmpwZw==', 'material/ad0e2bfe-b21c-4a08-90df-2ad1442e784f.jpg', NULL, '背景', '2019-07-26 11:43:14', 'admin');
INSERT INTO "public"."material" VALUES ('ae0427e3-7d18-466a-b47a-e01d6006da62', 'dec-text-5.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYWUwNDI3ZTMtN2QxOC00NjZhLWI0N2EtZTAxZDYwMDZkYTYyLnBuZw==', 'material/ae0427e3-7d18-466a-b47a-e01d6006da62.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('ae8fcb47-d59f-47db-be48-0b652f01ea60', 'pic-6EuNuYY8tzmZTB38.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYWU4ZmNiNDctZDU5Zi00N2RiLWJlNDgtMGI2NTJmMDFlYTYwLnBuZw==', 'material/ae8fcb47-d59f-47db-be48-0b652f01ea60.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('b266f4be-6309-41b6-b806-49c34b6eb9e9', 'pic-136-ad9201b14eb6c652.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYjI2NmY0YmUtNjMwOS00MWI2LWI4MDYtNDljMzRiNmViOWU5LnBuZw==', 'material/b266f4be-6309-41b6-b806-49c34b6eb9e9.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('b65f1794-6a5c-4c26-be12-fef8ceb46657', 'dec-text-12.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYjY1ZjE3OTQtNmE1Yy00YzI2LWJlMTItZmVmOGNlYjQ2NjU3LnBuZw==', 'material/b65f1794-6a5c-4c26-be12-fef8ceb46657.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('b8787db0-a95d-4776-9ec5-44ef028dde88', 'dec-title-4.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYjg3ODdkYjAtYTk1ZC00Nzc2LTllYzUtNDRlZjAyOGRkZTg4LnBuZw==', 'material/b8787db0-a95d-4776-9ec5-44ef028dde88.png', NULL, '标题', '2019-07-26 11:27:44', 'admin');
INSERT INTO "public"."material" VALUES ('bf776683-6ea4-478f-a874-1679355eae88', 'dec-gif-4.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYmY3NzY2ODMtNmVhNC00NzhmLWE4NzQtMTY3OTM1NWVhZTg4LmdpZg==', 'material/bf776683-6ea4-478f-a874-1679355eae88.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('c32744fd-4cd6-4ae3-8d3a-103dca78297f', '4.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYzMyNzQ0ZmQtNGNkNi00YWUzLThkM2EtMTAzZGNhNzgyOTdmLmpwZw==', 'material/c32744fd-4cd6-4ae3-8d3a-103dca78297f.jpg', NULL, '背景', '2019-07-26 11:26:17', 'admin');
INSERT INTO "public"."material" VALUES ('c41bd8c9-ae9e-4804-ad71-ab7d67748893', 'pic-5.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYzQxYmQ4YzktYWU5ZS00ODA0LWFkNzEtYWI3ZDY3NzQ4ODkzLnBuZw==', 'material/c41bd8c9-ae9e-4804-ad71-ab7d67748893.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('c45bed22-8269-410c-a696-b7f71aabc8bc', 'dec-gif-11.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYzQ1YmVkMjItODI2OS00MTBjLWE2OTYtYjdmNzFhYWJjOGJjLmdpZg==', 'material/c45bed22-8269-410c-a696-b7f71aabc8bc.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('c4e84fdc-bc31-40ea-8d4b-52b8a3e6d3bc', 'text-select.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYzRlODRmZGMtYmMzMS00MGVhLThkNGItNTJiOGEzZTZkM2JjLnBuZw==', 'material/c4e84fdc-bc31-40ea-8d4b-52b8a3e6d3bc.png', NULL, '静态素材', '2019-07-26 11:29:13', 'admin');
INSERT INTO "public"."material" VALUES ('c576a6ac-fe6b-4abf-a035-91aa6eada5f6', 'dec-gif-5.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYzU3NmE2YWMtZmU2Yi00YWJmLWEwMzUtOTFhYTZlYWRhNWY2LmdpZg==', 'material/c576a6ac-fe6b-4abf-a035-91aa6eada5f6.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('c5b46b79-2664-478b-92e1-0455b7332860', 'pic-img.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYzViNDZiNzktMjY2NC00NzhiLTkyZTEtMDQ1NWI3MzMyODYwLnBuZw==', 'material/c5b46b79-2664-478b-92e1-0455b7332860.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('c9244177-6557-40aa-ae5c-c31dbfb8c322', 'pic-228-2cff2e714fff18e2.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvYzkyNDQxNzctNjU1Ny00MGFhLWFlNWMtYzMxZGJmYjhjMzIyLmdpZg==', 'material/c9244177-6557-40aa-ae5c-c31dbfb8c322.gif', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('cd800847-d7ea-4c36-9586-b201c0bdae71', 'dec-gif-15.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvY2Q4MDA4NDctZDdlYS00YzM2LTk1ODYtYjIwMWMwYmRhZTcxLmdpZg==', 'material/cd800847-d7ea-4c36-9586-b201c0bdae71.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('cecbc26b-838a-4688-8123-e8e7083f1c4a', 'dec-text-6.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvY2VjYmMyNmItODM4YS00Njg4LTgxMjMtZThlNzA4M2YxYzRhLnBuZw==', 'material/cecbc26b-838a-4688-8123-e8e7083f1c4a.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('d0e6bd59-df62-4f9f-b4e8-6e472d4e3653', 'pic-134-963e5094b0dba95b.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZDBlNmJkNTktZGY2Mi00ZjlmLWI0ZTgtNmU0NzJkNGUzNjUzLnBuZw==', 'material/d0e6bd59-df62-4f9f-b4e8-6e472d4e3653.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('d1c4fc99-836d-451f-9379-6163327671b1', 'dec-title-6.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZDFjNGZjOTktODM2ZC00NTFmLTkzNzktNjE2MzMyNzY3MWIxLnBuZw==', 'material/d1c4fc99-836d-451f-9379-6163327671b1.png', NULL, '标题', '2019-07-26 11:27:44', 'admin');
INSERT INTO "public"."material" VALUES ('d2648046-85af-439d-a805-4c12b05be645', 'pic-139-091a0b3cae26a353.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZDI2NDgwNDYtODVhZi00MzlkLWE4MDUtNGMxMmIwNWJlNjQ1LnBuZw==', 'material/d2648046-85af-439d-a805-4c12b05be645.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('d5650d71-e5be-48ca-a346-74b0495d25f8', 'pic-143-1471b2dcc36fdc59.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZDU2NTBkNzEtZTViZS00OGNhLWEzNDYtNzRiMDQ5NWQyNWY4LnBuZw==', 'material/d5650d71-e5be-48ca-a346-74b0495d25f8.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('e1b53d49-bb32-48d1-a419-a93fb4db63c7', 'text-img.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZTFiNTNkNDktYmIzMi00OGQxLWE0MTktYTkzZmI0ZGI2M2M3LnBuZw==', 'material/e1b53d49-bb32-48d1-a419-a93fb4db63c7.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('e2394830-61a3-4ee3-adff-4fd8030b05a0', 'dec-text-7.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZTIzOTQ4MzAtNjFhMy00ZWUzLWFkZmYtNGZkODAzMGIwNWEwLnBuZw==', 'material/e2394830-61a3-4ee3-adff-4fd8030b05a0.png', NULL, '边框', '2019-07-26 11:28:21', 'admin');
INSERT INTO "public"."material" VALUES ('e7c97c3e-4e50-4112-aeba-52847d29b294', 'dec-gif-16.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZTdjOTdjM2UtNGU1MC00MTEyLWFlYmEtNTI4NDdkMjliMjk0LmdpZg==', 'material/e7c97c3e-4e50-4112-aeba-52847d29b294.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('e8b23127-5def-442b-a93b-dcacdccf07b9', 'pic-142-8933834d7b2e57e4.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZThiMjMxMjctNWRlZi00NDJiLWE5M2ItZGNhY2RjY2YwN2I5LnBuZw==', 'material/e8b23127-5def-442b-a93b-dcacdccf07b9.png', NULL, '其他', '2019-07-26 14:10:23', 'admin');
INSERT INTO "public"."material" VALUES ('e8d02b4a-4207-4452-a4d8-e469f38b90d0', 'dec-gif-20.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZThkMDJiNGEtNDIwNy00NDUyLWE0ZDgtZTQ2OWYzOGI5MGQwLmdpZg==', 'material/e8d02b4a-4207-4452-a4d8-e469f38b90d0.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('ec782a94-0d1a-4d3d-ac81-49ef940560cc', 'dec-gif-1.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZWM3ODJhOTQtMGQxYS00ZDNkLWFjODEtNDllZjk0MDU2MGNjLmdpZg==', 'material/ec782a94-0d1a-4d3d-ac81-49ef940560cc.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('f007ff6d-d261-4266-9b4c-b11291f118c2', 'year-img.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZjAwN2ZmNmQtZDI2MS00MjY2LTliNGMtYjExMjkxZjExOGMyLnBuZw==', 'material/f007ff6d-d261-4266-9b4c-b11291f118c2.png', NULL, '静态素材', '2019-07-26 11:29:13', 'admin');
INSERT INTO "public"."material" VALUES ('f0301a59-81e2-42e1-a5d8-7a3fdc4b81de', 'pic-239-ce970cb4d39a64db.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZjAzMDFhNTktODFlMi00MmUxLWE1ZDgtN2EzZmRjNGI4MWRlLmdpZg==', 'material/f0301a59-81e2-42e1-a5d8-7a3fdc4b81de.gif', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('f296660c-bc12-4041-bd87-ed97d3660a1f', 'dec-title-1.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZjI5NjY2MGMtYmMxMi00MDQxLWJkODctZWQ5N2QzNjYwYTFmLnBuZw==', 'material/f296660c-bc12-4041-bd87-ed97d3660a1f.png', NULL, '标题', '2019-07-26 11:27:44', 'admin');
INSERT INTO "public"."material" VALUES ('f387fa1d-5351-459f-9b46-085322a9d78d', 'pic-1.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZjM4N2ZhMWQtNTM1MS00NTlmLTliNDYtMDg1MzIyYTlkNzhkLnBuZw==', 'material/f387fa1d-5351-459f-9b46-085322a9d78d.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('f4648606-c2be-4da2-8149-c71fec7527f6', 'dec-gif-2.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZjQ2NDg2MDYtYzJiZS00ZGEyLTgxNDktYzcxZmVjNzUyN2Y2LmdpZg==', 'material/f4648606-c2be-4da2-8149-c71fec7527f6.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');
INSERT INTO "public"."material" VALUES ('f9752a89-6b3c-481e-b00b-b0f74a7d06f2', '1.jpg', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZjk3NTJhODktNmIzYy00ODFlLWIwMGItYjBmNzRhN2QwNmYyLmpwZw==', 'material/f9752a89-6b3c-481e-b00b-b0f74a7d06f2.jpg', NULL, '背景', '2019-07-26 11:26:16', 'admin');
INSERT INTO "public"."material" VALUES ('f9bfb551-5d2b-4ee1-9694-8d20e4bbec86', 'day.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZjliZmI1NTEtNWQyYi00ZWUxLTk2OTQtOGQyMGU0YmJlYzg2LnBuZw==', 'material/f9bfb551-5d2b-4ee1-9694-8d20e4bbec86.png', NULL, '静态素材', '2019-07-26 11:29:12', 'admin');
INSERT INTO "public"."material" VALUES ('fc00f01e-7360-4aa8-b4be-d8e88d35ea53', 'pic-2.png', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZmMwMGYwMWUtNzM2MC00YWE4LWI0YmUtZDhlODhkMzVlYTUzLnBuZw==', 'material/fc00f01e-7360-4aa8-b4be-d8e88d35ea53.png', NULL, '其他', '2019-07-26 14:10:22', 'admin');
INSERT INTO "public"."material" VALUES ('fe2c7c95-a539-4eca-81ed-7dba7c9c48ca', 'dec-gif-19.gif', 'Rzpc5ryU56S6546v5aKDXEJERFB4NjRcZGF0YVxcbWF0ZXJpYWwvZmUyYzdjOTUtYTUzOS00ZWNhLTgxZWQtN2RiYTdjOWM0OGNhLmdpZg==', 'material/fe2c7c95-a539-4eca-81ed-7dba7c9c48ca.gif', NULL, '动态素材', '2019-07-26 11:29:37', 'admin');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_config";
CREATE TABLE "public"."sys_config" (
  "id" int8 NOT NULL,
  "param_key" varchar(50) COLLATE "pg_catalog"."default",
  "param_value" varchar(2000) COLLATE "pg_catalog"."default",
  "status" int2,
  "remark" varchar(500) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_config"."param_key" IS 'key';
COMMENT ON COLUMN "public"."sys_config"."param_value" IS 'value';
COMMENT ON COLUMN "public"."sys_config"."status" IS '状态   0：隐藏   1：显示';
COMMENT ON COLUMN "public"."sys_config"."remark" IS '备注';
COMMENT ON TABLE "public"."sys_config" IS '系统配置信息表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO "public"."sys_config" VALUES (1, 'CLOUD_STORAGE_CONFIG_KEY', '{"aliyunAccessKeyId":"","aliyunAccessKeySecret":"","aliyunBucketName":"","aliyunDomain":"","aliyunEndPoint":"","aliyunPrefix":"","qcloudBucketName":"","qcloudDomain":"","qcloudPrefix":"","qcloudSecretId":"","qcloudSecretKey":"","qiniuAccessKey":"NrgMfABZxWLo5B-YYSjoE8-AZ1EISdi1Z3ubLOeZ","qiniuBucketName":"ios-app","qiniuDomain":"http://7xqbwh.dl1.z0.glb.clouddn.com","qiniuPrefix":"upload","qiniuSecretKey":"uIwJHevMRWU0VLxFvgy0tAcOdGqasdtVlJkdy6vV","type":1}', 0, '云存储配置信息');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "dept_id" int8 NOT NULL,
  "parent_id" int8,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "order_num" int4,
  "del_flag" int2
)
;
COMMENT ON COLUMN "public"."sys_dept"."parent_id" IS '上级部门ID，一级部门为0';
COMMENT ON COLUMN "public"."sys_dept"."name" IS '部门名称';
COMMENT ON COLUMN "public"."sys_dept"."order_num" IS '排序';
COMMENT ON COLUMN "public"."sys_dept"."del_flag" IS '是否删除  -1：已删除  0：正常';
COMMENT ON TABLE "public"."sys_dept" IS '部门管理';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" VALUES (1, 0, '总部', 0, 0);
INSERT INTO "public"."sys_dept" VALUES (2, 1, '大连分公司', 1, 0);
INSERT INTO "public"."sys_dept" VALUES (3, 2, '研发部', 3, 0);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict";
CREATE TABLE "public"."sys_dict" (
  "id" int8 NOT NULL,
  "name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "type" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "value" varchar(1000) COLLATE "pg_catalog"."default" NOT NULL,
  "order_num" int4,
  "remark" varchar(255) COLLATE "pg_catalog"."default",
  "del_flag" int2
)
;
COMMENT ON COLUMN "public"."sys_dict"."name" IS '字典名称';
COMMENT ON COLUMN "public"."sys_dict"."type" IS '字典类型';
COMMENT ON COLUMN "public"."sys_dict"."code" IS '字典码';
COMMENT ON COLUMN "public"."sys_dict"."value" IS '字典值';
COMMENT ON COLUMN "public"."sys_dict"."order_num" IS '排序';
COMMENT ON COLUMN "public"."sys_dict"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_dict"."del_flag" IS '删除标记  -1：已删除  0：正常';
COMMENT ON TABLE "public"."sys_dict" IS '数据字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO "public"."sys_dict" VALUES (1, '性别', 'sex', '0', '女', 0, NULL, 0);
INSERT INTO "public"."sys_dict" VALUES (2, '性别', 'sex', '1', '男', 1, NULL, 0);
INSERT INTO "public"."sys_dict" VALUES (3, '性别', 'sex', '2', '未知', 3, NULL, 0);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_log";
CREATE TABLE "public"."sys_log" (
  "id" int8 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default",
  "operation" varchar(50) COLLATE "pg_catalog"."default",
  "method" varchar(200) COLLATE "pg_catalog"."default",
  "params" varchar(5000) COLLATE "pg_catalog"."default",
  "time" int8 NOT NULL,
  "ip" varchar(64) COLLATE "pg_catalog"."default",
  "create_date" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_log"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_log"."operation" IS '用户操作';
COMMENT ON COLUMN "public"."sys_log"."method" IS '请求方法';
COMMENT ON COLUMN "public"."sys_log"."params" IS '请求参数';
COMMENT ON COLUMN "public"."sys_log"."time" IS '执行时长(毫秒)';
COMMENT ON COLUMN "public"."sys_log"."ip" IS 'IP地址';
COMMENT ON COLUMN "public"."sys_log"."create_date" IS '创建时间';
COMMENT ON TABLE "public"."sys_log" IS '系统日志';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO "public"."sys_log" VALUES (1, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 14, '127.0.0.1', '2019-12-09 11:13:22');
INSERT INTO "public"."sys_log" VALUES (2, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 114, '127.0.0.1', '2019-12-19 17:21:47');
INSERT INTO "public"."sys_log" VALUES (3, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 7, '127.0.0.1', '2019-12-19 17:22:59');
INSERT INTO "public"."sys_log" VALUES (4, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 121, '127.0.0.1', '2019-12-23 13:48:59');
INSERT INTO "public"."sys_log" VALUES (5, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 82, '0:0:0:0:0:0:0:1', '2019-12-25 11:16:59');
INSERT INTO "public"."sys_log" VALUES (6, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 169, '0:0:0:0:0:0:0:1', '2019-12-25 15:19:30');
INSERT INTO "public"."sys_log" VALUES (7, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 551, '127.0.0.1', '2019-12-25 15:22:48');
INSERT INTO "public"."sys_log" VALUES (8, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 96, '0:0:0:0:0:0:0:1', '2019-12-25 15:26:04');
INSERT INTO "public"."sys_log" VALUES (9, 'admin', '导出选中模板', 'io.report.modules.rdp.controller.RdpController.down()', NULL, 73, '0:0:0:0:0:0:0:1', '2019-12-25 15:28:20');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_menu";
CREATE TABLE "public"."sys_menu" (
  "menu_id" int8 NOT NULL,
  "parent_id" int8,
  "name" varchar(50) COLLATE "pg_catalog"."default",
  "url" varchar(200) COLLATE "pg_catalog"."default",
  "perms" varchar(500) COLLATE "pg_catalog"."default",
  "type" int4,
  "icon" varchar(50) COLLATE "pg_catalog"."default",
  "order_num" int4,
  "open_mode" varchar(10) COLLATE "pg_catalog"."default"
)
;
COMMENT ON COLUMN "public"."sys_menu"."parent_id" IS '父菜单ID，一级菜单为0';
COMMENT ON COLUMN "public"."sys_menu"."name" IS '菜单名称';
COMMENT ON COLUMN "public"."sys_menu"."url" IS '菜单URL';
COMMENT ON COLUMN "public"."sys_menu"."perms" IS '授权(多个用逗号分隔，如：user:list,user:create)';
COMMENT ON COLUMN "public"."sys_menu"."type" IS '类型   0：目录   1：菜单   2：按钮';
COMMENT ON COLUMN "public"."sys_menu"."icon" IS '菜单图标';
COMMENT ON COLUMN "public"."sys_menu"."order_num" IS '排序';
COMMENT ON COLUMN "public"."sys_menu"."open_mode" IS '打开方式';
COMMENT ON TABLE "public"."sys_menu" IS '菜单管理';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO "public"."sys_menu" VALUES (1, 0, '系统管理', NULL, NULL, 0, 'fa fa-cog', 99, '_self');
INSERT INTO "public"."sys_menu" VALUES (2, 1, '管理员管理', 'modules/sys/user.html', NULL, 1, 'fa fa-user', 1, '_self');
INSERT INTO "public"."sys_menu" VALUES (3, 1, '角色管理', 'modules/sys/role.html', NULL, 1, 'fa fa-user-secret', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (4, 1, '菜单管理', 'modules/sys/menu.html', NULL, 1, 'fa fa-th-list', 3, '_self');
INSERT INTO "public"."sys_menu" VALUES (5, 1, 'SQL监控', 'druid/sql.html', NULL, 1, 'fa fa-bug', 4, '_self');
INSERT INTO "public"."sys_menu" VALUES (15, 2, '查看', NULL, 'sys:user:list,sys:user:info', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (16, 2, '新增', NULL, 'sys:user:save,sys:role:select', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (17, 2, '修改', NULL, 'sys:user:update,sys:role:select', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (18, 2, '删除', NULL, 'sys:user:delete', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (19, 3, '查看', NULL, 'sys:role:list,sys:role:info', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (20, 3, '新增', NULL, 'sys:role:save,sys:menu:perms', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (21, 3, '修改', NULL, 'sys:role:update,sys:menu:perms', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (22, 3, '删除', NULL, 'sys:role:delete', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (23, 4, '查看', NULL, 'sys:menu:list,sys:menu:info', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (24, 4, '新增', NULL, 'sys:menu:save,sys:menu:select', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (25, 4, '修改', NULL, 'sys:menu:update,sys:menu:select', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (26, 4, '删除', NULL, 'sys:menu:delete', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (27, 1, '参数管理', 'modules/sys/config.html', 'sys:config:list,sys:config:info,sys:config:save,sys:config:update,sys:config:delete', 1, 'fa fa-sun-o', 6, '_self');
INSERT INTO "public"."sys_menu" VALUES (29, 1, '系统日志', 'modules/sys/log.html', 'sys:log:list', 1, 'fa fa-file-text-o', 7, '_self');
INSERT INTO "public"."sys_menu" VALUES (31, 1, '部门管理', 'modules/sys/dept.html', NULL, 1, 'fa fa-file-code-o', 1, '_self');
INSERT INTO "public"."sys_menu" VALUES (32, 31, '查看', NULL, 'sys:dept:list,sys:dept:info', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (33, 31, '新增', NULL, 'sys:dept:save,sys:dept:select', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (34, 31, '修改', NULL, 'sys:dept:update,sys:dept:select', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (35, 31, '删除', NULL, 'sys:dept:delete', 2, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (36, 1, '字典管理', 'modules/sys/dict.html', NULL, 1, 'fa fa-bookmark-o', 6, '_self');
INSERT INTO "public"."sys_menu" VALUES (37, 36, '查看', NULL, 'sys:dict:list,sys:dict:info', 2, NULL, 6, '_self');
INSERT INTO "public"."sys_menu" VALUES (38, 36, '新增', NULL, 'sys:dict:save', 2, NULL, 6, '_self');
INSERT INTO "public"."sys_menu" VALUES (39, 36, '修改', NULL, 'sys:dict:update', 2, NULL, 6, '_self');
INSERT INTO "public"."sys_menu" VALUES (40, 36, '删除', NULL, 'sys:dict:delete', 2, NULL, 6, '_self');
INSERT INTO "public"."sys_menu" VALUES (92, 0, '设计器', NULL, NULL, 0, 'fa fa-paper-plane', 3, '_self');
INSERT INTO "public"."sys_menu" VALUES (93, 92, '大屏设计器', './modules/bddp/home.html', NULL, 1, 'fa fa-pencil-square-o', 0, '_blank');
INSERT INTO "public"."sys_menu" VALUES (94, 1, '授权信息', 'AsReport?authMessage=1', 'grant:info', 1, 'fa fa-shield', 99, '_self');
INSERT INTO "public"."sys_menu" VALUES (95, 0, '大屏DEMO', NULL, NULL, 0, 'fa fa-tv', 100, '_self');
INSERT INTO "public"."sys_menu" VALUES (96, 95, '三农大数据指挥舱', 'bddpshow/show/c99268a7bdf0a8c8dec37f4e5927910d', NULL, 1, 'fa fa-eye', 10, '_blank');
INSERT INTO "public"."sys_menu" VALUES (97, 95, '信贷综合业务驾驶舱', 'bddpshow/show/044a1af39843779cde39678289c42240', NULL, 1, 'fa fa-eye', 10, '_blank');
INSERT INTO "public"."sys_menu" VALUES (98, 95, '综合业务_模板1_首页', 'bddpshow/show/41284e70ef854b0bc215fe95ec9f6aae', NULL, 1, 'fa fa-eye', 1, '_blank');
INSERT INTO "public"."sys_menu" VALUES (99, 95, '综合业务_模板3_三列样式', 'bddpshow/show/51284e70ef854b0bc215fe95ec9f6aae', NULL, 1, 'fa fa-eye', 4, '_blank');
INSERT INTO "public"."sys_menu" VALUES (100, 95, '综合业务_模板2_三行模块', 'bddpshow/show/d76cbda028bebf896552816e981c3cc2', NULL, 1, 'fa fa-eye', 5, '_blank');
INSERT INTO "public"."sys_menu" VALUES (101, 95, '综合业务_模板4_七块', 'bddpshow/show/61284e70ef854b0bc215fe95ec9f6aae', '', 1, 'fa fa-eye', 5, '_blank');
INSERT INTO "public"."sys_menu" VALUES (102, 0, 'BI配置', NULL, NULL, 0, 'fa fa-bars', 98, '_self');
INSERT INTO "public"."sys_menu" VALUES (103, 102, '数据集', 'developing.html?num=1', NULL, 1, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (104, 102, '数据挖掘', 'developing.html?num=2', NULL, 1, NULL, 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (105, 95, '业务风险_模板1', 'bddpshow/show/4286e3f913e364025ddc91d74ab7a5ad', NULL, 1, 'fa fa-eye', 7, '_blank');
INSERT INTO "public"."sys_menu" VALUES (106, 107, '左右轮播1', 'modules/bddp/swiper/swiper.html', NULL, 1, 'fa fa-eye', 99, '_blank');
INSERT INTO "public"."sys_menu" VALUES (107, 0, '整套报表轮播效果', NULL, NULL, 0, 'fa fa-refresh', 101, '_self');
INSERT INTO "public"."sys_menu" VALUES (108, 107, '左右轮播-淡入式', 'modules/bddp/swiper/swiperfade.html', NULL, 1, 'fa fa-eye', 0, '_blank');
INSERT INTO "public"."sys_menu" VALUES (109, 107, '左右轮播-自动切换', 'modules/bddp/swiper/swiperauto.html', NULL, 1, 'fa fa-eye', 0, '_blank');
INSERT INTO "public"."sys_menu" VALUES (110, 107, '不规则切换式1', 'modules/bddp/swiper/swiper.html', NULL, 1, 'fa fa-eye', 0, '_blank');
INSERT INTO "public"."sys_menu" VALUES (111, 95, '公司预览图', 'bddpshow/show/e22d6f7344ea0645b84c60a0a5a57cda', NULL, 1, 'fa fa-eye', 2, '_blank');
INSERT INTO "public"."sys_menu" VALUES (112, 95, '人力资源', 'bddpshow/show/45eef4da7a8f4b56235e24190acd800f', NULL, 1, 'fa fa-eye', 9, '_blank');
INSERT INTO "public"."sys_menu" VALUES (113, 0, '报表管理', NULL, NULL, 0, 'fa fa-table', 4, '_self');
INSERT INTO "public"."sys_menu" VALUES (114, 92, '网格式报表设计器', './modules/rdp/rdpDesign.html', NULL, 1, 'fa fa-braille', 0, '_blank');
INSERT INTO "public"."sys_menu" VALUES (115, 113, '网格报表管理', 'modules/rdp/list.html', NULL, 1, 'fa fa-user', 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (116, 0, '公共数据源配置', 'modules/ser/config/rdpDataConfig.html', NULL, 1, 'fa fa-database', 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (117, 0, '网格报表DEMO', NULL, NULL, 0, 'fa fa-table', 99, '_self');
INSERT INTO "public"."sys_menu" VALUES (118, 117, '交叉-客户与产品交叉报表', 'rdppage/show/1ea3e7ef2e8d9bd9a44ba3f24a1417de', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (119, 117, '分组-地域客户信息报表', 'rdppage/show/04c65e333d6c8cf1e006c054f8d6158b', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (120, 117, '分块-用户信息', 'rdppage/show/b0f44689bd804c43d59d85871a99711c', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (121, 117, '详情-入库通知书', 'rdppage/main/f001db5305e400fe28bb5f3ebac7e451', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (122, 117, '动态-水电费统计', 'rdppage/show/f004ff76e9e10b6b7d4ecb396608ee0a', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (123, 117, '对比-季度对比分析报表', 'rdppage/show/23a58db31668eef064370d9706a3896c', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (124, 117, '预警-客户风险预警报表', 'rdppage/show/8b9873d6fb7e14e93794ee7fc11cc3a0', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (125, 117, '一体化生成-查询列表', 'modules/rdp/demo/demo2.html', NULL, 1, 'fa fa-eye', 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (126, 117, '自定义查询条件-查询列表', 'modules/rdp/demo/demo1.html', NULL, 1, 'fa fa-eye', 0, '_self');
INSERT INTO "public"."sys_menu" VALUES (129, 117, '动态列JAVABEAN', 'modules/rdp/javabean/c.html', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (131, 107, '盒模型切换', 'modules/bddp/swiper/swipercube.html', NULL, 1, 'fa fa-eye', 0, '_blank');
INSERT INTO "public"."sys_menu" VALUES (132, 113, '大屏幕报表管理', 'modules/bddp/home.html', NULL, 1, NULL, 0, '_blank');
INSERT INTO "public"."sys_menu" VALUES (133, 0, '填报报表DEMO', '', NULL, 0, 'fa fa-wpforms', 100, '_self');
INSERT INTO "public"."sys_menu" VALUES (134, 133, '人员基本情况表', 'rdppage/main/e93657d429ea44bfe6f5b7872676b35f', NULL, 1, 'fa fa-eye', 1, '_self');
INSERT INTO "public"."sys_menu" VALUES (135, 133, '申报事项审批单', 'rdppage/main/6fbd2deabc701284edeb14003b26baea', NULL, 1, 'fa fa-eye', 2, '_self');
INSERT INTO "public"."sys_menu" VALUES (136, 133, '申报事项审批单编辑', 'rdppage/main/5bd730f8f1b65b0908e383ad76d15642', NULL, 1, 'fa fa-eye', 3, '_self');
INSERT INTO "public"."sys_menu" VALUES (137, 133, '填报添加验证DEMO', 'rdppage/main/b00eaf643bd2034ebc2a2e402a785667', NULL, 1, 'fa fa-eye', 4, '_self');
INSERT INTO "public"."sys_menu" VALUES (138, 133, '填报详情明细', 'rdppage/main/3132737d6c808d35f2fbc60f6ec6e2a5', NULL, 1, 'fa fa-eye', 5, '_self');
INSERT INTO "public"."sys_menu" VALUES (140, 0, '素材管理', 'modules/material/material.html', NULL, 1, 'fa fa-object-group', 3, '_self');
INSERT INTO "public"."sys_menu" VALUES (141, NULL, '查看', NULL, 'material:material:list,material:material:info', 2, NULL, 6, NULL);
INSERT INTO "public"."sys_menu" VALUES (142, NULL, '新增', NULL, 'material:material:save', 2, NULL, 6, NULL);
INSERT INTO "public"."sys_menu" VALUES (143, NULL, '修改', NULL, 'material:material:update', 2, NULL, 6, NULL);
INSERT INTO "public"."sys_menu" VALUES (144, NULL, '删除', NULL, 'material:material:delete', 2, NULL, 6, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "role_id" int8 NOT NULL,
  "role_name" varchar(100) COLLATE "pg_catalog"."default",
  "remark" varchar(100) COLLATE "pg_catalog"."default",
  "dept_id" int8,
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."remark" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."dept_id" IS '部门ID';
COMMENT ON COLUMN "public"."sys_role"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."sys_role" IS '角色';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (1, '开发人员', NULL, 1, '2018-10-31 17:27:10');
INSERT INTO "public"."sys_role" VALUES (2, '业务人员', NULL, 1, '2018-10-31 17:28:01');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_dept";
CREATE TABLE "public"."sys_role_dept" (
  "id" int8 NOT NULL,
  "role_id" int8,
  "dept_id" int8
)
;
COMMENT ON COLUMN "public"."sys_role_dept"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_dept"."dept_id" IS '部门ID';
COMMENT ON TABLE "public"."sys_role_dept" IS '角色与部门对应关系';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO "public"."sys_role_dept" VALUES (1, 1, 1);
INSERT INTO "public"."sys_role_dept" VALUES (2, 1, 2);
INSERT INTO "public"."sys_role_dept" VALUES (3, 1, 3);
INSERT INTO "public"."sys_role_dept" VALUES (4, 2, 1);
INSERT INTO "public"."sys_role_dept" VALUES (5, 2, 2);
INSERT INTO "public"."sys_role_dept" VALUES (6, 2, 3);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role_menu";
CREATE TABLE "public"."sys_role_menu" (
  "id" int8 NOT NULL,
  "role_id" int8,
  "menu_id" int8
)
;
COMMENT ON COLUMN "public"."sys_role_menu"."role_id" IS '角色ID';
COMMENT ON COLUMN "public"."sys_role_menu"."menu_id" IS '菜单ID';
COMMENT ON TABLE "public"."sys_role_menu" IS '角色与菜单对应关系';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO "public"."sys_role_menu" VALUES (1, 1, 92);
INSERT INTO "public"."sys_role_menu" VALUES (2, 1, 93);
INSERT INTO "public"."sys_role_menu" VALUES (3, 1, 114);
INSERT INTO "public"."sys_role_menu" VALUES (4, 1, 95);
INSERT INTO "public"."sys_role_menu" VALUES (5, 1, 96);
INSERT INTO "public"."sys_role_menu" VALUES (6, 1, 97);
INSERT INTO "public"."sys_role_menu" VALUES (7, 1, 98);
INSERT INTO "public"."sys_role_menu" VALUES (8, 1, 99);
INSERT INTO "public"."sys_role_menu" VALUES (9, 1, 100);
INSERT INTO "public"."sys_role_menu" VALUES (10, 1, 101);
INSERT INTO "public"."sys_role_menu" VALUES (11, 1, 105);
INSERT INTO "public"."sys_role_menu" VALUES (12, 1, 111);
INSERT INTO "public"."sys_role_menu" VALUES (13, 1, 112);
INSERT INTO "public"."sys_role_menu" VALUES (14, 1, 102);
INSERT INTO "public"."sys_role_menu" VALUES (15, 1, 103);
INSERT INTO "public"."sys_role_menu" VALUES (16, 1, 104);
INSERT INTO "public"."sys_role_menu" VALUES (17, 1, 107);
INSERT INTO "public"."sys_role_menu" VALUES (18, 1, 106);
INSERT INTO "public"."sys_role_menu" VALUES (19, 1, 108);
INSERT INTO "public"."sys_role_menu" VALUES (20, 1, 109);
INSERT INTO "public"."sys_role_menu" VALUES (21, 1, 110);
INSERT INTO "public"."sys_role_menu" VALUES (22, 1, 113);
INSERT INTO "public"."sys_role_menu" VALUES (23, 1, 115);
INSERT INTO "public"."sys_role_menu" VALUES (24, 1, 116);
INSERT INTO "public"."sys_role_menu" VALUES (25, 1, 117);
INSERT INTO "public"."sys_role_menu" VALUES (26, 1, 118);
INSERT INTO "public"."sys_role_menu" VALUES (27, 1, 119);
INSERT INTO "public"."sys_role_menu" VALUES (28, 1, 120);
INSERT INTO "public"."sys_role_menu" VALUES (29, 1, 121);
INSERT INTO "public"."sys_role_menu" VALUES (30, 1, 122);
INSERT INTO "public"."sys_role_menu" VALUES (31, 1, 123);
INSERT INTO "public"."sys_role_menu" VALUES (32, 1, 124);
INSERT INTO "public"."sys_role_menu" VALUES (33, 1, 125);
INSERT INTO "public"."sys_role_menu" VALUES (34, 1, 126);
INSERT INTO "public"."sys_role_menu" VALUES (35, 1, 129);
INSERT INTO "public"."sys_role_menu" VALUES (36, 2, 95);
INSERT INTO "public"."sys_role_menu" VALUES (37, 2, 96);
INSERT INTO "public"."sys_role_menu" VALUES (38, 2, 97);
INSERT INTO "public"."sys_role_menu" VALUES (39, 2, 98);
INSERT INTO "public"."sys_role_menu" VALUES (40, 2, 99);
INSERT INTO "public"."sys_role_menu" VALUES (41, 2, 100);
INSERT INTO "public"."sys_role_menu" VALUES (42, 2, 101);
INSERT INTO "public"."sys_role_menu" VALUES (43, 2, 105);
INSERT INTO "public"."sys_role_menu" VALUES (44, 2, 111);
INSERT INTO "public"."sys_role_menu" VALUES (45, 2, 112);
INSERT INTO "public"."sys_role_menu" VALUES (46, 2, 107);
INSERT INTO "public"."sys_role_menu" VALUES (47, 2, 106);
INSERT INTO "public"."sys_role_menu" VALUES (48, 2, 108);
INSERT INTO "public"."sys_role_menu" VALUES (49, 2, 109);
INSERT INTO "public"."sys_role_menu" VALUES (50, 2, 110);
INSERT INTO "public"."sys_role_menu" VALUES (51, 2, 117);
INSERT INTO "public"."sys_role_menu" VALUES (52, 2, 118);
INSERT INTO "public"."sys_role_menu" VALUES (53, 2, 119);
INSERT INTO "public"."sys_role_menu" VALUES (54, 2, 120);
INSERT INTO "public"."sys_role_menu" VALUES (55, 2, 121);
INSERT INTO "public"."sys_role_menu" VALUES (56, 2, 122);
INSERT INTO "public"."sys_role_menu" VALUES (57, 2, 123);
INSERT INTO "public"."sys_role_menu" VALUES (58, 2, 124);
INSERT INTO "public"."sys_role_menu" VALUES (59, 2, 125);
INSERT INTO "public"."sys_role_menu" VALUES (60, 2, 126);
INSERT INTO "public"."sys_role_menu" VALUES (61, 2, 129);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "user_id" int8 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(100) COLLATE "pg_catalog"."default",
  "salt" varchar(20) COLLATE "pg_catalog"."default",
  "email" varchar(100) COLLATE "pg_catalog"."default",
  "mobile" varchar(100) COLLATE "pg_catalog"."default",
  "status" int2,
  "dept_id" int8,
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."sys_user"."password" IS '密码';
COMMENT ON COLUMN "public"."sys_user"."salt" IS '盐';
COMMENT ON COLUMN "public"."sys_user"."email" IS '邮箱';
COMMENT ON COLUMN "public"."sys_user"."mobile" IS '手机号';
COMMENT ON COLUMN "public"."sys_user"."status" IS '状态  0：禁用   1：正常';
COMMENT ON COLUMN "public"."sys_user"."dept_id" IS '部门ID';
COMMENT ON COLUMN "public"."sys_user"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."sys_user" IS '系统用户';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES (10, 'fwadmin', '2f229d62f92f7e59c1f6f2a0f0ac66ad6e94c7f9a255fded446fc790897f469f', 'jKYAi50e07rLDUxnDmAi', 'yanghan@51jianku.com', NULL, 1, 1, '2020-01-13 10:39:26');
INSERT INTO "public"."sys_user" VALUES (2, 'user', '7e9591ff11ba1fa4ef8f9c56483b79aed081f0beb46672820b6f9b1bb3aeed2a', 'rJOkHEBBEkdL1nt7ifW1', 'user@qq.com', '13112345678', 0, 1, '2018-10-31 17:25:39');
INSERT INTO "public"."sys_user" VALUES (3, 'guest', '93ee72a556fd66126ac88633516c6ebe76c1490e99f92c3aa4a8e3cf2677080b', 'i8surV6S6L64zP5SO6yY', 'guest@qq.com', '13212345678', 0, 1, '2018-10-31 17:26:20');
INSERT INTO "public"."sys_user" VALUES (4, 'wangli', '62eb29365851ecb8b71dde6f1eb06b27bcdc5dd214cfcc8f92120125591453e3', 'B1McpZZIbPEyZRkgMTAZ', 'wangli@qq.com', NULL, 0, 3, '2018-11-15 16:22:46');
INSERT INTO "public"."sys_user" VALUES (1, 'admin', 'fd51f3a9d06269c7f5238007b11c2b45fe60ce9c0c81de27e7f873ba7ad4238d', 'YzcmCZNvbXocrsz9dm8e', 'yanghan@51jianku.com', ' ', 1, 1, '2018-08-27 14:00:00');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_role";
CREATE TABLE "public"."sys_user_role" (
  "id" int8 NOT NULL,
  "user_id" int8,
  "role_id" int8
)
;
COMMENT ON COLUMN "public"."sys_user_role"."user_id" IS '用户ID';
COMMENT ON COLUMN "public"."sys_user_role"."role_id" IS '角色ID';
COMMENT ON TABLE "public"."sys_user_role" IS '用户与角色对应关系';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO "public"."sys_user_role" VALUES (1, 2, 1);
INSERT INTO "public"."sys_user_role" VALUES (2, 3, 2);
INSERT INTO "public"."sys_user_role" VALUES (3, 4, 1);
INSERT INTO "public"."sys_user_role" VALUES (4, 5, 1);
INSERT INTO "public"."sys_user_role" VALUES (5, 6, 1);
INSERT INTO "public"."sys_user_role" VALUES (6, 7, 1);
INSERT INTO "public"."sys_user_role" VALUES (7, 10, 1);

-- ----------------------------
-- Table structure for tb_token
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_token";
CREATE TABLE "public"."tb_token" (
  "user_id" int8 NOT NULL,
  "token" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "expire_time" timestamp(6),
  "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."tb_token"."token" IS 'token';
COMMENT ON COLUMN "public"."tb_token"."expire_time" IS '过期时间';
COMMENT ON COLUMN "public"."tb_token"."update_time" IS '更新时间';
COMMENT ON TABLE "public"."tb_token" IS '用户Token';

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."tb_user";
CREATE TABLE "public"."tb_user" (
  "user_id" int8 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "mobile" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "password" varchar(64) COLLATE "pg_catalog"."default",
  "create_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."tb_user"."username" IS '用户名';
COMMENT ON COLUMN "public"."tb_user"."mobile" IS '手机号';
COMMENT ON COLUMN "public"."tb_user"."password" IS '密码';
COMMENT ON COLUMN "public"."tb_user"."create_time" IS '创建时间';
COMMENT ON TABLE "public"."tb_user" IS '用户';

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO "public"."tb_user" VALUES (1, 'mark', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', '2017-03-23 22:37:41');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"public"."data_set_seq"', 101, false);
SELECT setval('"public"."data_source_seq"', 202, true);

-- ----------------------------
-- Primary Key structure for table chart_test
-- ----------------------------
ALTER TABLE "public"."chart_test" ADD CONSTRAINT "chart_test_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table data_set
-- ----------------------------
ALTER TABLE "public"."data_set" ADD CONSTRAINT "data_set_pkey" PRIMARY KEY ("dt_id");

-- ----------------------------
-- Primary Key structure for table data_source
-- ----------------------------
ALTER TABLE "public"."data_source" ADD CONSTRAINT "data_source_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table db_type
-- ----------------------------
ALTER TABLE "public"."db_type" ADD CONSTRAINT "db_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table demo_user
-- ----------------------------
ALTER TABLE "public"."demo_user" ADD CONSTRAINT "demo_user_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table ds_showcol
-- ----------------------------
ALTER TABLE "public"."ds_showcol" ADD CONSTRAINT "ds_showcol_pkey" PRIMARY KEY ("show_id");

-- ----------------------------
-- Primary Key structure for table dt_filter
-- ----------------------------
ALTER TABLE "public"."dt_filter" ADD CONSTRAINT "dt_filter_pkey" PRIMARY KEY ("filter_id");

-- ----------------------------
-- Primary Key structure for table dt_param
-- ----------------------------
ALTER TABLE "public"."dt_param" ADD CONSTRAINT "dt_param_pkey" PRIMARY KEY ("param_id");

-- ----------------------------
-- Primary Key structure for table dt_table
-- ----------------------------
ALTER TABLE "public"."dt_table" ADD CONSTRAINT "dt_table_pkey" PRIMARY KEY ("use_id", "dt_id");

-- ----------------------------
-- Primary Key structure for table dt_table_rs
-- ----------------------------
ALTER TABLE "public"."dt_table_rs" ADD CONSTRAINT "dt_table_rs_pkey" PRIMARY KEY ("rs_id", "use_id");

-- ----------------------------
-- Primary Key structure for table dt_table_rs_condition
-- ----------------------------
ALTER TABLE "public"."dt_table_rs_condition" ADD CONSTRAINT "dt_table_rs_condition_pkey" PRIMARY KEY ("cd_id");

-- ----------------------------
-- Primary Key structure for table material
-- ----------------------------
ALTER TABLE "public"."material" ADD CONSTRAINT "material_pkey" PRIMARY KEY ("material_id");

-- ----------------------------
-- Indexes structure for table sys_config
-- ----------------------------
CREATE INDEX "param_key" ON "public"."sys_config" USING btree (
  "param_key" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_config
-- ----------------------------
ALTER TABLE "public"."sys_config" ADD CONSTRAINT "sys_config_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("dept_id");

-- ----------------------------
-- Indexes structure for table sys_dict
-- ----------------------------
CREATE INDEX "type" ON "public"."sys_dict" USING btree (
  "type" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST,
  "code" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_dict
-- ----------------------------
ALTER TABLE "public"."sys_dict" ADD CONSTRAINT "sys_dict_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_log
-- ----------------------------
ALTER TABLE "public"."sys_log" ADD CONSTRAINT "sys_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_menu
-- ----------------------------
ALTER TABLE "public"."sys_menu" ADD CONSTRAINT "sys_menu_pkey" PRIMARY KEY ("menu_id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("role_id");

-- ----------------------------
-- Primary Key structure for table sys_role_dept
-- ----------------------------
ALTER TABLE "public"."sys_role_dept" ADD CONSTRAINT "sys_role_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role_menu
-- ----------------------------
ALTER TABLE "public"."sys_role_menu" ADD CONSTRAINT "sys_role_menu_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table sys_user
-- ----------------------------
CREATE INDEX "username" ON "public"."sys_user" USING btree (
  "username" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table sys_user_role
-- ----------------------------
ALTER TABLE "public"."sys_user_role" ADD CONSTRAINT "sys_user_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table tb_token
-- ----------------------------
CREATE INDEX "token" ON "public"."tb_token" USING btree (
  "token" COLLATE "pg_catalog"."default" "pg_catalog"."text_ops" ASC NULLS LAST
);

-- ----------------------------
-- Primary Key structure for table tb_token
-- ----------------------------
ALTER TABLE "public"."tb_token" ADD CONSTRAINT "tb_token_pkey" PRIMARY KEY ("user_id");
