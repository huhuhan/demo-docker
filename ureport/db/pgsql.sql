/*
 Navicat Premium Data Transfer

 Source Server         : postgres-192.168.0.82
 Source Server Type    : PostgreSQL
 Source Server Version : 90615
 Source Host           : 192.168.0.82:5432
 Source Catalog        : ureport
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90615
 File Encoding         : 65001

 Date: 19/11/2020 14:39:59
*/


-- ----------------------------
-- Sequence structure for report_file_s
-- ----------------------------
DROP SEQUENCE IF EXISTS "report_file_s";
CREATE SEQUENCE "report_file_s"
    INCREMENT 1
    MINVALUE  1
    MAXVALUE 9223372036854775807
    START 1
    CACHE 1;

-- ----------------------------
-- Table structure for report_file
-- ----------------------------
DROP TABLE IF EXISTS "report_file";
CREATE TABLE "report_file" (
    "id" int8 NOT NULL DEFAULT nextval('report_file_s'::regclass),
    "name" varchar(1000) COLLATE "pg_catalog"."default",
    "content" text COLLATE "pg_catalog"."default",
    "create_time" timestamp(6),
    "update_time" timestamp(6)
)
;
COMMENT ON COLUMN "report_file"."id" IS '主键';
COMMENT ON COLUMN "report_file"."name" IS '报表名称';
COMMENT ON COLUMN "report_file"."content" IS '报表内容';
COMMENT ON COLUMN "report_file"."create_time" IS '创建时间';
COMMENT ON COLUMN "report_file"."update_time" IS '更新时间';
COMMENT ON TABLE "report_file" IS '报表信息记录表';

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
SELECT setval('"report_file_s"', 1, true);

-- ----------------------------
-- Primary Key structure for table report_file
-- ----------------------------
ALTER TABLE "report_file" ADD CONSTRAINT "report_file_pkey" PRIMARY KEY ("id");
