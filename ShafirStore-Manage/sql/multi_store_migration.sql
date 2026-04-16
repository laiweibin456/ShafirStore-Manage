/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80045 (8.0.45)
 Source Host           : localhost:3306
 Source Schema         : shafir_store

 Target Server Type    : MySQL
 Target Server Version : 80045 (8.0.45)
 File Encoding         : 65001

 Date: 16/04/2026
 Description: 多店铺改造数据库迁移脚本
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 第一部分：创建新增表
-- ============================================

-- ----------------------------
-- Table structure for store (店铺表)
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '店铺ID',
  `store_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `store_code` varchar(50) NOT NULL COMMENT '店铺编码(唯一标识)',
  `address` varchar(255) DEFAULT NULL COMMENT '店铺地址',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `business_hours` varchar(100) DEFAULT NULL COMMENT '营业时间(如 09:00-21:00)',
  `logo_url` varchar(255) DEFAULT NULL COMMENT '店铺Logo URL',
  `longitude` decimal(10,6) DEFAULT NULL COMMENT '经度(LBS定位用)',
  `latitude` decimal(10,6) DEFAULT NULL COMMENT '纬度(LBS定位用)',
  `status` tinyint DEFAULT 1 COMMENT '状态(0-禁用,1-正常)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_code` (`store_code`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='店铺表';

-- ----------------------------
-- Table structure for member_store_rel (会员店铺关联表)
-- ----------------------------
DROP TABLE IF EXISTS `member_store_rel`;
CREATE TABLE `member_store_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `store_id` bigint NOT NULL COMMENT '店铺ID',
  `total_consume` decimal(10,2) DEFAULT 0.00 COMMENT '本店铺累计消费金额',
  `points` int DEFAULT 0 COMMENT '本店铺积分余额',
  `level` tinyint DEFAULT 1 COMMENT '本店铺会员等级',
  `status` tinyint DEFAULT 1 COMMENT '状态(0-禁用,1-正常)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_member_store` (`member_id`, `store_id`) USING BTREE,
  KEY `idx_store_id` (`store_id`) USING BTREE,
  KEY `idx_store_level` (`store_id`, `level`) USING BTREE,
  KEY `idx_store_consume` (`store_id`, `total_consume`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='会员-店铺关联表';

-- ----------------------------
-- Table structure for sys_user_store_rel (用户店铺关联表)
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_store_rel`;
CREATE TABLE `sys_user_store_rel` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '系统用户ID',
  `store_id` bigint NOT NULL COMMENT '店铺ID',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_store` (`user_id`, `store_id`) USING BTREE,
  KEY `idx_store_id` (`store_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='用户-店铺关联表';

-- ----------------------------
-- Table structure for store_daily_summary (店铺日汇总表)
-- ----------------------------
DROP TABLE IF EXISTS `store_daily_summary`;
CREATE TABLE `store_daily_summary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` bigint NOT NULL COMMENT '店铺ID',
  `summary_date` date NOT NULL COMMENT '统计日期',
  `order_count` int DEFAULT 0 COMMENT '订单数量',
  `total_amount` decimal(10,2) DEFAULT 0.00 COMMENT '订单总金额',
  `discount_amount` decimal(10,2) DEFAULT 0.00 COMMENT '优惠金额',
  `pay_amount` decimal(10,2) DEFAULT 0.00 COMMENT '实付金额',
  `member_count` int DEFAULT 0 COMMENT '当日活跃会员数',
  `new_member_count` int DEFAULT 0 COMMENT '当日新增会员数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_store_date` (`store_id`, `summary_date`) USING BTREE,
  KEY `idx_summary_date` (`summary_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='店铺日汇总表';

-- ============================================
-- 第二部分：现有表添加 store_id 字段
-- ============================================

-- ----------------------------
-- 1. product_category 添加 store_id
-- ----------------------------
ALTER TABLE `product_category`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_pc_store_id` ON `product_category`(`store_id`) USING BTREE;

-- ----------------------------
-- 2. product 添加 store_id
-- ----------------------------
ALTER TABLE `product`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_product_store_id` ON `product`(`store_id`) USING BTREE;
CREATE INDEX `idx_product_store_category` ON `product`(`store_id`, `category_id`) USING BTREE;

-- ----------------------------
-- 3. inventory 添加 store_id (需重建唯一索引)
-- ----------------------------
ALTER TABLE `inventory`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

DROP INDEX `product_id` ON `inventory`;
CREATE UNIQUE INDEX `uk_inventory_store_product` ON `inventory`(`store_id`, `product_id`) USING BTREE;
CREATE INDEX `idx_inventory_store_id` ON `inventory`(`store_id`) USING BTREE;

-- ----------------------------
-- 4. inventory_record 添加 store_id
-- ----------------------------
ALTER TABLE `inventory_record`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_ir_store_id` ON `inventory_record`(`store_id`) USING BTREE;
CREATE INDEX `idx_ir_store_time` ON `inventory_record`(`store_id`, `create_time`) USING BTREE;

-- ----------------------------
-- 5. sale_order 添加 store_id
-- ----------------------------
ALTER TABLE `sale_order`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_so_store_id` ON `sale_order`(`store_id`) USING BTREE;
CREATE INDEX `idx_so_store_time` ON `sale_order`(`store_id`, `create_time`) USING BTREE;
CREATE INDEX `idx_so_store_status` ON `sale_order`(`store_id`, `status`, `create_time`) USING BTREE;

-- ----------------------------
-- 6. sale_order_item 添加 store_id
-- ----------------------------
ALTER TABLE `sale_order_item`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_soi_store_id` ON `sale_order_item`(`store_id`) USING BTREE;
CREATE INDEX `idx_soi_store_product` ON `sale_order_item`(`store_id`, `product_id`, `create_time`) USING BTREE;

-- ----------------------------
-- 7. member_level 添加 store_id
-- ----------------------------
ALTER TABLE `member_level`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_ml_store_id` ON `member_level`(`store_id`) USING BTREE;

-- ----------------------------
-- 8. member_points_record 添加 store_id
-- ----------------------------
ALTER TABLE `member_points_record`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_mpr_store_id` ON `member_points_record`(`store_id`) USING BTREE;

-- ----------------------------
-- 9. reservation_order 添加 store_id
-- ----------------------------
ALTER TABLE `reservation_order`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_ro_store_id` ON `reservation_order`(`store_id`) USING BTREE;
CREATE INDEX `idx_ro_store_status` ON `reservation_order`(`store_id`, `status`) USING BTREE;

-- ----------------------------
-- 10. reservation_order_item 添加 store_id
-- ----------------------------
ALTER TABLE `reservation_order_item`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_roi_store_id` ON `reservation_order_item`(`store_id`) USING BTREE;

-- ----------------------------
-- 11. sys_role 添加 store_id
-- ----------------------------
ALTER TABLE `sys_role`
    ADD COLUMN `store_id` bigint DEFAULT NULL COMMENT '店铺ID(NULL表示全局角色)' AFTER `id`;

CREATE INDEX `idx_role_store_id` ON `sys_role`(`store_id`) USING BTREE;

-- ----------------------------
-- 12. sys_user 添加 store_id
-- ----------------------------
ALTER TABLE `sys_user`
    ADD COLUMN `store_id` bigint DEFAULT NULL COMMENT '店铺ID(NULL表示超级管理员)' AFTER `id`;

CREATE INDEX `idx_user_store_id` ON `sys_user`(`store_id`) USING BTREE;

-- ----------------------------
-- 13. operation_log 添加 store_id
-- ----------------------------
ALTER TABLE `operation_log`
    ADD COLUMN `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID' AFTER `id`;

CREATE INDEX `idx_ol_store_id` ON `operation_log`(`store_id`) USING BTREE;

-- ============================================
-- 第三部分：插入默认数据
-- ============================================

-- ----------------------------
-- 插入默认店铺
-- ----------------------------
INSERT INTO `store` (`id`, `store_name`, `store_code`, `address`, `phone`, `business_hours`, `status`)
VALUES (1, '莎菲尔菓子(总店)', 'STORE001', '成都市武侯区', '028-88888888', '09:00-21:00', 1);

-- ----------------------------
-- 建立用户-店铺关联
-- ----------------------------
INSERT INTO `sys_user_store_rel` (`user_id`, `store_id`)
SELECT `id`, 1 FROM `sys_user`;

-- ----------------------------
-- 建立会员-店铺关联 (从现有会员数据迁移)
-- ----------------------------
INSERT INTO `member_store_rel` (`member_id`, `store_id`, `total_consume`, `points`, `level`, `status`)
SELECT `id`, 1, `total_consume`, `points`, `level`, `status` FROM `member`;

-- ============================================
-- 第四部分：角色体系更新
-- ============================================

-- ----------------------------
-- 新增超级管理员角色
-- ----------------------------
INSERT INTO `sys_role` (`role_name`, `role_key`, `description`, `store_id`, `status`)
VALUES ('超级管理员', 'ROLE_SUPER_ADMIN', '管理所有店铺，拥有最高权限', NULL, 1);

-- ----------------------------
-- 更新现有管理员角色为店铺管理员
-- ----------------------------
UPDATE `sys_role` SET 
    `role_key` = 'ROLE_STORE_ADMIN',
    `role_name` = '店铺管理员',
    `description` = '管理本店铺全部功能',
    `store_id` = 1
WHERE `role_key` = 'ROLE_ADMIN';

-- ----------------------------
-- 更新店员角色
-- ----------------------------
UPDATE `sys_role` SET 
    `description` = '收银台操作、库存出入库、查看本店铺订单',
    `store_id` = 1
WHERE `role_key` = 'ROLE_CLERK';

-- ----------------------------
-- 更新管理员用户为超级管理员
-- ----------------------------
UPDATE `sys_user` SET `role_id` = (SELECT `id` FROM `sys_role` WHERE `role_key` = 'ROLE_SUPER_ADMIN')
WHERE `username` = 'admin';

-- ----------------------------
-- 更新管理员用户的store_id为NULL (超级管理员不属于特定店铺)
-- ----------------------------
UPDATE `sys_user` SET `store_id` = NULL
WHERE `username` = 'admin';

-- ----------------------------
-- 更新普通用户的store_id为1
-- ----------------------------
UPDATE `sys_user` SET `store_id` = 1
WHERE `store_id` IS NULL;

-- ============================================
-- 第五部分：数据验证
-- ============================================

-- 验证各表记录数
SELECT 'store' AS tbl, COUNT(*) AS cnt FROM store
UNION ALL SELECT 'product_category', COUNT(*) FROM product_category
UNION ALL SELECT 'product', COUNT(*) FROM product
UNION ALL SELECT 'inventory', COUNT(*) FROM inventory
UNION ALL SELECT 'inventory_record', COUNT(*) FROM inventory_record
UNION ALL SELECT 'sale_order', COUNT(*) FROM sale_order
UNION ALL SELECT 'sale_order_item', COUNT(*) FROM sale_order_item
UNION ALL SELECT 'member', COUNT(*) FROM member
UNION ALL SELECT 'member_level', COUNT(*) FROM member_level
UNION ALL SELECT 'member_points_record', COUNT(*) FROM member_points_record
UNION ALL SELECT 'member_store_rel', COUNT(*) FROM member_store_rel
UNION ALL SELECT 'sys_user', COUNT(*) FROM sys_user
UNION ALL SELECT 'sys_role', COUNT(*) FROM sys_role
UNION ALL SELECT 'sys_user_store_rel', COUNT(*) FROM sys_user_store_rel;

SET FOREIGN_KEY_CHECKS = 1;
