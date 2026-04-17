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

 Date: 17/04/2026 17:30:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '库存ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `quantity` int NULL DEFAULT 0 COMMENT '当前库存数量',
  `alert_threshold` int NULL DEFAULT 10 COMMENT '预警阈值',
  `last_in_time` datetime NULL DEFAULT NULL COMMENT '最后入库时间',
  `last_out_time` datetime NULL DEFAULT NULL COMMENT '最后出库时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_inventory_store_product`(`store_id` ASC, `product_id` ASC) USING BTREE,
  INDEX `idx_inventory_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (13, 1, 1, 8, 10, '2026-04-03 22:33:11', '2026-04-09 19:30:10', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (14, 1, 2, 49, 10, '2026-03-29 22:39:50', '2026-03-30 17:42:03', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (15, 1, 3, 49, 10, NULL, '2026-04-10 23:41:02', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (16, 1, 4, 0, 10, '2026-04-09 16:21:06', '2026-04-10 23:41:02', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (17, 1, 5, 48, 10, NULL, '2026-04-10 23:41:02', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (18, 1, 6, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (19, 1, 7, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (20, 1, 8, 48, 10, '2026-04-03 22:33:11', '2026-04-03 22:33:40', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (21, 1, 9, 48, 10, '2026-04-03 22:33:11', '2026-04-10 23:41:02', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (22, 1, 10, 48, 10, '2026-04-03 22:33:10', '2026-04-03 22:33:40', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (23, 1, 11, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (24, 1, 12, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (25, 1, 13, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (26, 1, 14, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (27, 1, 15, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (28, 1, 16, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (29, 1, 17, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (30, 1, 18, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (31, 1, 19, 49, 10, NULL, '2026-03-30 17:42:03', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (32, 1, 20, 50, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (33, 1, 21, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (34, 1, 22, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (35, 1, 23, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (36, 1, 24, 49, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (37, 1, 25, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (38, 1, 26, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (39, 1, 27, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (40, 1, 28, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (41, 1, 29, 49, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (42, 1, 30, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (43, 1, 31, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `inventory` VALUES (44, 1, 32, 50, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-03-27 20:13:15');

-- ----------------------------
-- Table structure for inventory_record
-- ----------------------------
DROP TABLE IF EXISTS `inventory_record`;
CREATE TABLE `inventory_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `type` tinyint NOT NULL COMMENT '类型（1-入库，2-出库）',
  `quantity` int NOT NULL COMMENT '数量',
  `before_quantity` int NULL DEFAULT NULL COMMENT '操作前数量',
  `after_quantity` int NULL DEFAULT NULL COMMENT '操作后数量',
  `order_id` bigint NULL DEFAULT NULL COMMENT '关联订单ID',
  `operator_id` bigint NULL DEFAULT NULL COMMENT '操作人ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_ir_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_ir_store_time`(`store_id` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '库存记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory_record
-- ----------------------------
INSERT INTO `inventory_record` VALUES (1, 1, 1, 3, -1, 50, 49, NULL, NULL, '', '2026-03-29 22:38:52');
INSERT INTO `inventory_record` VALUES (2, 1, 1, 3, -39, 49, 10, NULL, NULL, '', '2026-03-29 22:39:14');
INSERT INTO `inventory_record` VALUES (3, 1, 1, 2, 1, 10, 9, NULL, NULL, '', '2026-03-29 22:39:25');
INSERT INTO `inventory_record` VALUES (4, 1, 1, 1, 1, 9, 10, NULL, NULL, '', '2026-03-29 22:39:41');
INSERT INTO `inventory_record` VALUES (5, 1, 2, 1, 1, 50, 51, NULL, NULL, '', '2026-03-29 22:39:49');
INSERT INTO `inventory_record` VALUES (6, 1, 2, 2, 1, 51, 50, NULL, NULL, '', '2026-03-29 22:39:51');
INSERT INTO `inventory_record` VALUES (7, 1, 1, 2, 1, 10, 9, NULL, NULL, '', '2026-03-29 22:40:41');
INSERT INTO `inventory_record` VALUES (8, 1, 1, 1, 1, 9, 10, NULL, NULL, '', '2026-03-29 22:40:54');
INSERT INTO `inventory_record` VALUES (9, 1, 1, 2, 1, 10, 9, 1, 1, '销售出库，订单号：ORD202603301997', '2026-03-30 17:42:02');
INSERT INTO `inventory_record` VALUES (10, 1, 2, 2, 1, 50, 49, 1, 1, '销售出库，订单号：ORD202603301997', '2026-03-30 17:42:02');
INSERT INTO `inventory_record` VALUES (11, 1, 8, 2, 1, 50, 49, 1, 1, '销售出库，订单号：ORD202603301997', '2026-03-30 17:42:02');
INSERT INTO `inventory_record` VALUES (12, 1, 19, 2, 1, 50, 49, 1, 1, '销售出库，订单号：ORD202603301997', '2026-03-30 17:42:02');
INSERT INTO `inventory_record` VALUES (13, 1, 24, 2, 1, 50, 49, 1, 1, '销售出库，订单号：ORD202603301997', '2026-03-30 17:42:02');
INSERT INTO `inventory_record` VALUES (14, 1, 29, 2, 1, 50, 49, 1, 1, '销售出库，订单号：ORD202603301997', '2026-03-30 17:42:02');
INSERT INTO `inventory_record` VALUES (15, 1, 10, 2, 1, 50, 49, 2, 1, '销售出库，订单号：ORD202604015602', '2026-04-01 16:23:52');
INSERT INTO `inventory_record` VALUES (16, 1, 1, 2, 1, 9, 8, 3, 1, '销售出库，订单号：ORD202604037438', '2026-04-03 22:23:22');
INSERT INTO `inventory_record` VALUES (17, 1, 8, 2, 1, 49, 48, 3, 1, '销售出库，订单号：ORD202604037438', '2026-04-03 22:23:22');
INSERT INTO `inventory_record` VALUES (18, 1, 9, 2, 1, 50, 49, 3, 1, '销售出库，订单号：ORD202604037438', '2026-04-03 22:23:22');
INSERT INTO `inventory_record` VALUES (19, 1, 1, 2, 1, 8, 7, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (20, 1, 8, 2, 1, 48, 47, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (21, 1, 9, 2, 1, 49, 48, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (22, 1, 10, 2, 1, 49, 48, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (23, 1, 25, 2, 2, 50, 48, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (24, 1, 24, 2, 2, 49, 47, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (25, 1, 30, 2, 1, 50, 49, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (26, 1, 29, 2, 1, 49, 48, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (27, 1, 28, 2, 1, 50, 49, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (28, 1, 27, 2, 1, 50, 49, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (29, 1, 26, 2, 1, 50, 49, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (30, 1, 31, 2, 1, 50, 49, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (31, 1, 32, 2, 1, 50, 49, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (32, 1, 21, 2, 2, 50, 48, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (33, 1, 22, 2, 2, 50, 48, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (34, 1, 23, 2, 1, 50, 49, 4, 1, '销售出库，订单号：ORD202604037004', '2026-04-03 22:25:29');
INSERT INTO `inventory_record` VALUES (35, 1, 1, 1, 1, 7, 8, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (36, 1, 8, 1, 1, 47, 48, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (37, 1, 9, 1, 1, 48, 49, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (38, 1, 10, 1, 1, 48, 49, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (39, 1, 25, 1, 2, 48, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (40, 1, 24, 1, 2, 47, 49, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (41, 1, 30, 1, 1, 49, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (42, 1, 29, 1, 1, 48, 49, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (43, 1, 28, 1, 1, 49, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (44, 1, 27, 1, 1, 49, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (45, 1, 26, 1, 1, 49, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (46, 1, 31, 1, 1, 49, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (47, 1, 32, 1, 1, 49, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (48, 1, 21, 1, 2, 48, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (49, 1, 22, 1, 2, 48, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (50, 1, 23, 1, 1, 49, 50, NULL, 1, '订单取消退回，订单号：ORD202604037004', '2026-04-03 22:33:09');
INSERT INTO `inventory_record` VALUES (51, 1, 1, 1, 1, 8, 9, NULL, 1, '订单取消退回，订单号：ORD202604037438', '2026-04-03 22:33:11');
INSERT INTO `inventory_record` VALUES (52, 1, 8, 1, 1, 48, 49, NULL, 1, '订单取消退回，订单号：ORD202604037438', '2026-04-03 22:33:11');
INSERT INTO `inventory_record` VALUES (53, 1, 9, 1, 1, 49, 50, NULL, 1, '订单取消退回，订单号：ORD202604037438', '2026-04-03 22:33:11');
INSERT INTO `inventory_record` VALUES (54, 1, 10, 2, 1, 49, 48, 5, 1, '销售出库，订单号：ORD202604038185', '2026-04-03 22:33:40');
INSERT INTO `inventory_record` VALUES (55, 1, 9, 2, 1, 50, 49, 5, 1, '销售出库，订单号：ORD202604038185', '2026-04-03 22:33:40');
INSERT INTO `inventory_record` VALUES (56, 1, 8, 2, 1, 49, 48, 5, 1, '销售出库，订单号：ORD202604038185', '2026-04-03 22:33:40');
INSERT INTO `inventory_record` VALUES (57, 1, 4, 2, 50, 50, 0, NULL, NULL, '', '2026-04-09 16:11:47');
INSERT INTO `inventory_record` VALUES (58, 1, 4, 1, 1, 0, 1, NULL, NULL, '', '2026-04-09 16:21:05');
INSERT INTO `inventory_record` VALUES (59, 1, 1, 2, 1, 9, 8, 6, 1, '销售出库，订单号：ORD202604091473', '2026-04-09 19:30:10');
INSERT INTO `inventory_record` VALUES (60, 1, 5, 2, 2, 50, 48, 7, 1, '销售出库，订单号：ORD202604106528', '2026-04-10 23:41:01');
INSERT INTO `inventory_record` VALUES (61, 1, 4, 2, 1, 1, 0, 7, 1, '销售出库，订单号：ORD202604106528', '2026-04-10 23:41:01');
INSERT INTO `inventory_record` VALUES (62, 1, 3, 2, 1, 50, 49, 7, 1, '销售出库，订单号：ORD202604106528', '2026-04-10 23:41:01');
INSERT INTO `inventory_record` VALUES (63, 1, 9, 2, 1, 49, 48, 7, 1, '销售出库，订单号：ORD202604106528', '2026-04-10 23:41:01');

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '会员ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '会员姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `gender` tinyint NULL DEFAULT NULL COMMENT '性别（0-女，1-男）',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `points` int NULL DEFAULT 0 COMMENT '积分余额',
  `total_consume` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '累计消费金额',
  `level` tinyint NULL DEFAULT 1 COMMENT '会员等级（1-普通，2-银卡，3-金卡，4-钻石）',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录密码（小程序用）',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
  `register_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (1, '李女士', '13900139001', 0, '1990-04-03', 1511, 3625.80, 3, NULL, 1, '2026-03-25 15:03:33', '2026-04-10 23:41:02');
INSERT INTO `member` VALUES (2, '王先生', '13900139002', 1, '1995-08-15', 500, 800.00, 2, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `member` VALUES (3, '张小姐', '13900139003', 0, '1992-12-01', 200, 300.00, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');

-- ----------------------------
-- Table structure for member_level
-- ----------------------------
DROP TABLE IF EXISTS `member_level`;
CREATE TABLE `member_level`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '等级名称',
  `level` tinyint NOT NULL COMMENT '等级值',
  `discount` decimal(3, 2) NULL DEFAULT 1.00 COMMENT '折扣率',
  `min_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '最低消费门槛',
  `points_rate` int NULL DEFAULT 1 COMMENT '积分倍率',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_level`(`level` ASC) USING BTREE,
  INDEX `idx_ml_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_level
-- ----------------------------
INSERT INTO `member_level` VALUES (5, 1, '普通会员', 1, 1.00, 0.00, 1, 1, '2026-04-11 15:44:08');
INSERT INTO `member_level` VALUES (6, 1, '银卡会员', 2, 0.95, 500.00, 1, 1, '2026-04-11 15:44:08');
INSERT INTO `member_level` VALUES (7, 1, '金卡会员', 3, 0.90, 2000.00, 1, 1, '2026-04-11 15:44:08');
INSERT INTO `member_level` VALUES (8, 1, '钻石会员', 4, 0.85, 5000.00, 2, 1, '2026-04-11 15:44:08');

-- ----------------------------
-- Table structure for member_points_record
-- ----------------------------
DROP TABLE IF EXISTS `member_points_record`;
CREATE TABLE `member_points_record`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `type` tinyint NOT NULL COMMENT '类型（1-增加，2-扣减）',
  `points` int NOT NULL COMMENT '积分数量',
  `balance` int NULL DEFAULT NULL COMMENT '操作后余额',
  `order_id` bigint NULL DEFAULT NULL COMMENT '关联订单ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_mpr_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员积分记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_points_record
-- ----------------------------
INSERT INTO `member_points_record` VALUES (1, 1, 1, 1, 2, 1502, 5, '会员消费获得积分', '2026-04-03 22:33:40');
INSERT INTO `member_points_record` VALUES (2, 1, 1, 1, 9, 1511, 7, '会员消费获得积分', '2026-04-10 23:41:02');

-- ----------------------------
-- Table structure for member_store_rel
-- ----------------------------
DROP TABLE IF EXISTS `member_store_rel`;
CREATE TABLE `member_store_rel`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `store_id` bigint NOT NULL COMMENT '店铺ID',
  `total_consume` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '本店铺累计消费金额',
  `points` int NULL DEFAULT 0 COMMENT '本店铺积分余额',
  `level` tinyint NULL DEFAULT 1 COMMENT '本店铺会员等级',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用,1-正常)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_member_store`(`member_id` ASC, `store_id` ASC) USING BTREE,
  INDEX `idx_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_store_level`(`store_id` ASC, `level` ASC) USING BTREE,
  INDEX `idx_store_consume`(`store_id` ASC, `total_consume` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员-店铺关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_store_rel
-- ----------------------------
INSERT INTO `member_store_rel` VALUES (1, 1, 1, 3625.80, 1511, 3, 1, '2026-04-16 20:24:56', '2026-04-16 20:24:56');
INSERT INTO `member_store_rel` VALUES (2, 2, 1, 800.00, 500, 2, 1, '2026-04-16 20:24:56', '2026-04-16 20:24:56');
INSERT INTO `member_store_rel` VALUES (3, 3, 1, 300.00, 200, 1, 1, '2026-04-16 20:24:56', '2026-04-16 20:24:56');

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `operator_id` bigint NULL DEFAULT NULL COMMENT '操作人ID',
  `operator_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作人姓名',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作模块',
  `action` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作动作',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方法',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求参数',
  `result` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '返回结果',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_operator_id`(`operator_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_ol_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称',
  `category_id` bigint NOT NULL COMMENT '分类ID',
  `price` decimal(10, 2) NOT NULL COMMENT '售价',
  `cost_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '成本价',
  `unit` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '个' COMMENT '单位',
  `shelf_life_days` int NULL DEFAULT NULL COMMENT '保质期(天)',
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '商品图片URL',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '商品描述',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（0-下架，1-上架）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_product_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_product_store_category`(`store_id` ASC, `category_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, '竹·童', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/5eed5603-364f-40ef-994a-5b07d71249a8.png', '抹茶、芝士、柠檬风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:44:27');
INSERT INTO `product` VALUES (2, 1, '热带雨林', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/037f08c4-12a8-4e6e-964e-bd693f561531.png', '香草、芒果、百香果、椰子风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:42:42');
INSERT INTO `product` VALUES (3, 1, '日不落', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/baea3602-3e96-4ec8-88db-2ea8d39d14e0.png', '桂花乌龙、香橙风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:43:15');
INSERT INTO `product` VALUES (4, 1, '巴斯克芝士蛋糕', 1, 21.00, 8.40, '个', 1, 'http://localhost:8081/images/products/bd2280af-6c24-4130-b7db-7d02028c79ce.png', '芝士、柠檬风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:43:23');
INSERT INTO `product` VALUES (5, 1, '开心果 KIRI 巴斯克', 1, 23.00, 9.20, '个', 1, 'http://localhost:8081/images/products/c3f412ed-640e-4fe8-a08f-e3226dcbc067.png', '芝士、开心果风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:43:31');
INSERT INTO `product` VALUES (6, 1, '玫瑰乳酪海盐卷', 2, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/c1ddc88e-85df-476c-9b3e-287e4ffd9fe9.png', '玫瑰乳酪风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:51:47');
INSERT INTO `product` VALUES (7, 1, '咖啡酥皮海盐卷', 2, 12.00, 4.80, '个', 1, 'http://localhost:8081/images/products/6210e986-8351-4ac8-81b3-92203bb6d12a.png', '咖啡风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:51:53');
INSERT INTO `product` VALUES (8, 1, '双重黑巧海盐卷', 2, 13.00, 5.20, '个', 1, 'http://localhost:8081/images/products/a2d198a8-03cf-4dd8-b78a-755b8d245ea7.png', '黑巧克力风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:52:02');
INSERT INTO `product` VALUES (9, 1, '全麦海盐卷', 2, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/c3321f33-8d0b-4c89-942f-fd8d2b59be91.png', '全麦风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:52:09');
INSERT INTO `product` VALUES (10, 1, '猪肉脯四叶草', 2, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/a6cef250-fb4c-4c3e-8ef6-a84a0da6075a.png', '猪肉脯风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:53:41');
INSERT INTO `product` VALUES (11, 1, '夏威夷可可脆片', 3, 20.00, 8.00, '罐', 30, '', '夏威夷果、可可风味', 1, '2026-03-27 20:13:15', '2026-03-28 17:20:57');
INSERT INTO `product` VALUES (12, 1, '芝士脆条', 3, 15.00, 6.00, '罐', 30, NULL, '芝士风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (13, 1, '蜂蜜吐司条', 3, 10.00, 4.00, '袋', 30, NULL, '蜂蜜风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (14, 1, '坚果挞', 3, 11.00, 4.40, '个', 30, NULL, '混合坚果风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (15, 1, '全麦碧根果蔓越莓司康', 3, 10.00, 4.00, '个', 30, NULL, '全麦、碧根果、蔓越莓风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (16, 1, '原味 Kiri 巴斯克蛋糕', 4, 178.00, 71.20, '6 寸', 1, NULL, '原味 Kiri 巴斯克风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (17, 1, '黑松露西班牙火腿巴斯克', 4, 198.00, 79.20, '6 寸', 1, NULL, '黑松露、西班牙火腿风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (18, 1, '开心果 kiri 巴斯克蛋糕', 4, 198.00, 79.20, '6 寸', 1, NULL, '开心果、Kiri 芝士风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (19, 1, '蓝莓花', 4, 178.00, 71.20, '6 寸', 1, NULL, '蓝莓风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (20, 1, '奥利奥生巧巴斯克', 4, 198.00, 79.20, '6 寸', 1, NULL, '奥利奥、生巧克力风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (21, 1, '美式咖啡 (冰/热)', 5, 16.00, 6.40, '杯', 1, NULL, '经典美式风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (22, 1, '澳白', 5, 19.00, 7.60, '杯', 1, NULL, '澳白咖啡风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (23, 1, '拿铁', 5, 20.00, 8.00, '杯', 1, NULL, '经典拿铁风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (24, 1, '燕麦拿铁', 5, 25.00, 10.00, '杯', 1, NULL, '燕麦奶、咖啡风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (25, 1, '鸭屎香柠檬茶', 5, 18.00, 7.20, '杯', 1, NULL, '鸭屎香茶底、柠檬风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (26, 1, '香草栗子马卡龙', 6, 12.00, 4.80, '个', 7, NULL, '香草、栗子风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (27, 1, '抹茶马卡龙', 6, 12.00, 4.80, '个', 7, NULL, '抹茶风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (28, 1, '蓝莓马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '蓝莓风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (29, 1, '海盐焦糖马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '海盐、焦糖风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (30, 1, '荔枝草莓马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '荔枝、草莓风味', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (31, 1, '手工曲奇礼盒', 7, 68.00, 28.00, '盒', 30, NULL, '多种口味手工曲奇，精美礼盒包装', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product` VALUES (32, 1, '定制生日牌', 7, 8.00, 3.00, '个', 365, NULL, '可定制生日祝福蜡烛牌', 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类名称',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pc_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES (1, 1, '法式甜点', 1, 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product_category` VALUES (2, 1, '欧式面包', 2, 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product_category` VALUES (3, 1, '常温蛋糕', 3, 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product_category` VALUES (4, 1, '生日蛋糕', 4, 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product_category` VALUES (5, 1, '饮品', 5, 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product_category` VALUES (6, 1, '马卡龙', 6, 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');
INSERT INTO `product_category` VALUES (7, 1, '其他', 7, 1, '2026-03-27 20:13:15', '2026-03-27 20:13:15');

-- ----------------------------
-- Table structure for regular_user
-- ----------------------------
DROP TABLE IF EXISTS `regular_user`;
CREATE TABLE `regular_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号（唯一）',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码（建议加密存储）',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '昵称',
  `total_consume` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '累计消费金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone` ASC) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '小程序普通用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of regular_user
-- ----------------------------
INSERT INTO `regular_user` VALUES (1, '14366547634', '123456', '你好', 0.00, '2026-04-11 21:20:05', '2026-04-11 21:20:05', 1);
INSERT INTO `regular_user` VALUES (2, '12345678901', '123456', '高峰时段', 0.00, '2026-04-11 21:21:35', '2026-04-11 21:21:35', 1);

-- ----------------------------
-- Table structure for reservation_order
-- ----------------------------
DROP TABLE IF EXISTS `reservation_order`;
CREATE TABLE `reservation_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号（RS+时间戳）',
  `user_id` bigint NOT NULL COMMENT '用户ID（regular_user或member的id）',
  `user_type` tinyint NOT NULL COMMENT '用户类型（1-普通用户，2-会员）',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠金额',
  `pay_amount` decimal(10, 2) NOT NULL COMMENT '实付金额（到店付款）',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（1-待取货，2-已完成，3-已取消）',
  `pickup_time` datetime NULL DEFAULT NULL COMMENT '预约取货时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_user_type`(`user_type` ASC) USING BTREE,
  INDEX `idx_status`(`status` ASC) USING BTREE,
  INDEX `idx_pickup_time`(`pickup_time` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_ro_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_ro_store_status`(`store_id` ASC, `status` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '小程序预约订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation_order
-- ----------------------------

-- ----------------------------
-- Table structure for reservation_order_item
-- ----------------------------
DROP TABLE IF EXISTS `reservation_order_item`;
CREATE TABLE `reservation_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '明细ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称（冗余存储）',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `quantity` int NOT NULL COMMENT '数量',
  `subtotal` decimal(10, 2) NOT NULL COMMENT '小计金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE,
  INDEX `idx_roi_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '预约订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for sale_order
-- ----------------------------
DROP TABLE IF EXISTS `sale_order`;
CREATE TABLE `sale_order`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '订单ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `order_no` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `member_id` bigint NULL DEFAULT NULL COMMENT '会员ID',
  `total_amount` decimal(10, 2) NOT NULL COMMENT '订单总金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠金额',
  `pay_amount` decimal(10, 2) NOT NULL COMMENT '实付金额',
  `points_discount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '积分抵扣',
  `pay_type` tinyint NOT NULL COMMENT '支付方式（1-现金，2-微信，3-支付宝，4-会员卡）',
  `order_type` tinyint NULL DEFAULT 1 COMMENT '订单类型（1-正常销售，2-退款）',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（1-进行中，2-已完成，3-已取消，4-已退款）',
  `order_source` tinyint NULL DEFAULT 1 COMMENT '订单来源（1-现场销售，2-小程序）',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `operator_id` bigint NULL DEFAULT NULL COMMENT '操作员ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_so_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_so_store_time`(`store_id` ASC, `create_time` ASC) USING BTREE,
  INDEX `idx_so_store_status`(`store_id` ASC, `status` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_order
-- ----------------------------
INSERT INTO `sale_order` VALUES (1, 1, 'ORD202603301997', NULL, 305.00, 0.00, 305.00, 0.00, 2, 1, 1, 1, '', 1, '2026-03-30 17:42:03', '2026-03-30 17:42:02');
INSERT INTO `sale_order` VALUES (2, 1, 'ORD202604015602', NULL, 10.00, 0.00, 10.00, 0.00, 4, 1, 1, 1, '', 1, '2026-04-01 16:23:53', '2026-04-01 16:23:52');
INSERT INTO `sale_order` VALUES (3, 1, 'ORD202604037438', 1, 61.00, 0.00, 61.00, 0.00, 4, 1, 3, 1, '', 1, '2026-04-03 22:23:22', '2026-04-03 22:33:11');
INSERT INTO `sale_order` VALUES (4, 1, 'ORD202604037004', 1, 386.00, 0.00, 386.00, 0.00, 4, 1, 3, 1, '', 1, '2026-04-03 22:25:29', '2026-04-03 22:33:10');
INSERT INTO `sale_order` VALUES (5, 1, 'ORD202604038185', 1, 33.00, 4.95, 28.05, 0.00, 4, 1, 1, 1, '', 1, '2026-04-03 22:33:40', '2026-04-03 22:33:40');
INSERT INTO `sale_order` VALUES (6, 1, 'ORD202604091473', NULL, 38.00, 0.00, 38.00, 0.00, 2, 1, 1, 1, '', 1, '2026-04-09 19:30:10', '2026-04-09 19:30:10');
INSERT INTO `sale_order` VALUES (7, 1, 'ORD202604106528', 1, 115.00, 17.25, 97.75, 0.00, 4, 1, 1, 1, '', 1, '2026-04-10 23:41:02', '2026-04-10 23:41:01');

-- ----------------------------
-- Table structure for sale_order_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_order_item`;
CREATE TABLE `sale_order_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '明细ID',
  `store_id` bigint NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `order_id` bigint NOT NULL COMMENT '订单ID',
  `product_id` bigint NOT NULL COMMENT '商品ID',
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品名称（冗余）',
  `price` decimal(10, 2) NOT NULL COMMENT '单价',
  `quantity` int NOT NULL COMMENT '数量',
  `subtotal` decimal(10, 2) NOT NULL COMMENT '小计金额',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_order_id`(`order_id` ASC) USING BTREE,
  INDEX `idx_product_id`(`product_id` ASC) USING BTREE,
  INDEX `idx_soi_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_soi_store_product`(`store_id` ASC, `product_id` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sale_order_item
-- ----------------------------
INSERT INTO `sale_order_item` VALUES (1, 1, 1, 1, '竹·童', 38.00, 1, 38.00, '2026-03-30 17:42:03');
INSERT INTO `sale_order_item` VALUES (2, 1, 1, 2, '热带雨林', 38.00, 1, 38.00, '2026-03-30 17:42:03');
INSERT INTO `sale_order_item` VALUES (3, 1, 1, 8, '双重黑巧海盐卷', 13.00, 1, 13.00, '2026-03-30 17:42:03');
INSERT INTO `sale_order_item` VALUES (4, 1, 1, 19, '蓝莓花', 178.00, 1, 178.00, '2026-03-30 17:42:03');
INSERT INTO `sale_order_item` VALUES (5, 1, 1, 24, '燕麦拿铁', 25.00, 1, 25.00, '2026-03-30 17:42:03');
INSERT INTO `sale_order_item` VALUES (6, 1, 1, 29, '海盐焦糖马卡龙', 13.00, 1, 13.00, '2026-03-30 17:42:03');
INSERT INTO `sale_order_item` VALUES (7, 1, 2, 10, '猪肉脯四叶草', 10.00, 1, 10.00, '2026-04-01 16:23:53');
INSERT INTO `sale_order_item` VALUES (8, 1, 3, 1, '竹·童', 38.00, 1, 38.00, '2026-04-03 22:23:22');
INSERT INTO `sale_order_item` VALUES (9, 1, 3, 8, '双重黑巧海盐卷', 13.00, 1, 13.00, '2026-04-03 22:23:22');
INSERT INTO `sale_order_item` VALUES (10, 1, 3, 9, '全麦海盐卷', 10.00, 1, 10.00, '2026-04-03 22:23:22');
INSERT INTO `sale_order_item` VALUES (11, 1, 4, 1, '竹·童', 38.00, 1, 38.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (12, 1, 4, 8, '双重黑巧海盐卷', 13.00, 1, 13.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (13, 1, 4, 9, '全麦海盐卷', 10.00, 1, 10.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (14, 1, 4, 10, '猪肉脯四叶草', 10.00, 1, 10.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (15, 1, 4, 25, '鸭屎香柠檬茶', 18.00, 2, 36.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (16, 1, 4, 24, '燕麦拿铁', 25.00, 2, 50.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (17, 1, 4, 30, '荔枝草莓马卡龙', 13.00, 1, 13.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (18, 1, 4, 29, '海盐焦糖马卡龙', 13.00, 1, 13.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (19, 1, 4, 28, '蓝莓马卡龙', 13.00, 1, 13.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (20, 1, 4, 27, '抹茶马卡龙', 12.00, 1, 12.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (21, 1, 4, 26, '香草栗子马卡龙', 12.00, 1, 12.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (22, 1, 4, 31, '手工曲奇礼盒', 68.00, 1, 68.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (23, 1, 4, 32, '定制生日牌', 8.00, 1, 8.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (24, 1, 4, 21, '美式咖啡 (冰/热)', 16.00, 2, 32.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (25, 1, 4, 22, '澳白', 19.00, 2, 38.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (26, 1, 4, 23, '拿铁', 20.00, 1, 20.00, '2026-04-03 22:25:29');
INSERT INTO `sale_order_item` VALUES (27, 1, 5, 10, '猪肉脯四叶草', 10.00, 1, 10.00, '2026-04-03 22:33:40');
INSERT INTO `sale_order_item` VALUES (28, 1, 5, 9, '全麦海盐卷', 10.00, 1, 10.00, '2026-04-03 22:33:40');
INSERT INTO `sale_order_item` VALUES (29, 1, 5, 8, '双重黑巧海盐卷', 13.00, 1, 13.00, '2026-04-03 22:33:40');
INSERT INTO `sale_order_item` VALUES (30, 1, 6, 1, '竹·童', 38.00, 1, 38.00, '2026-04-09 19:30:10');
INSERT INTO `sale_order_item` VALUES (31, 1, 7, 5, '开心果 KIRI 巴斯克', 23.00, 2, 46.00, '2026-04-10 23:41:02');
INSERT INTO `sale_order_item` VALUES (32, 1, 7, 4, '巴斯克芝士蛋糕', 21.00, 1, 21.00, '2026-04-10 23:41:02');
INSERT INTO `sale_order_item` VALUES (33, 1, 7, 3, '日不落', 38.00, 1, 38.00, '2026-04-10 23:41:02');
INSERT INTO `sale_order_item` VALUES (34, 1, 7, 9, '全麦海盐卷', 10.00, 1, 10.00, '2026-04-10 23:41:02');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '店铺ID',
  `store_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺名称',
  `store_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '店铺编码(唯一标识)',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '店铺地址',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `business_hours` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '营业时间(如 09:00-21:00)',
  `logo_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '店铺Logo URL',
  `longitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '经度(LBS定位用)',
  `latitude` decimal(10, 6) NULL DEFAULT NULL COMMENT '纬度(LBS定位用)',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态(0-禁用,1-正常)',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_store_code`(`store_code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '店铺表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES (1, '莎菲尔菓子(总店)', 'STORE001', '成都市武侯区', '028-88888888', '09:00-21:00', NULL, NULL, NULL, 1, '2026-04-16 20:24:56', '2026-04-16 20:24:56');
INSERT INTO `store` VALUES (3, '2店', '002', '广东省顺德', '13244567854', '', NULL, NULL, NULL, 1, '2026-04-17 16:44:43', '2026-04-17 16:44:43');

-- ----------------------------
-- Table structure for store_daily_summary
-- ----------------------------
DROP TABLE IF EXISTS `store_daily_summary`;
CREATE TABLE `store_daily_summary`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `store_id` bigint NOT NULL COMMENT '店铺ID',
  `summary_date` date NOT NULL COMMENT '统计日期',
  `order_count` int NULL DEFAULT 0 COMMENT '订单数量',
  `total_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '订单总金额',
  `discount_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '优惠金额',
  `pay_amount` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '实付金额',
  `member_count` int NULL DEFAULT 0 COMMENT '当日活跃会员数',
  `new_member_count` int NULL DEFAULT 0 COMMENT '当日新增会员数',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_store_date`(`store_id` ASC, `summary_date` ASC) USING BTREE,
  INDEX `idx_summary_date`(`summary_date` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '店铺日汇总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of store_daily_summary
-- ----------------------------

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由路径',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单图标',
  `sort_order` int NULL DEFAULT 0 COMMENT '排序',
  `type` tinyint NULL DEFAULT 1 COMMENT '类型（1-菜单，2-按钮）',
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`parent_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system', NULL, 'Setting', 100, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'user', 'system/UserManage.vue', 'User', 1, 1, 'system:user:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'role', 'system/RoleManage.vue', 'Role', 2, 1, 'system:role:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'menu', 'system/MenuManage.vue', 'Menu', 3, 1, 'system:menu:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (5, 1, '操作日志', 'log', 'system/OperationLog.vue', 'Document', 4, 1, 'system:log:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (6, 0, '商品管理', '/product', NULL, 'Goods', 10, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (7, 5, '商品列表', 'list', 'product/ProductList.vue', 'List', 1, 1, 'product:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (8, 5, '分类管理', 'category', 'product/CategoryManage.vue', 'Collection', 2, 1, 'product:category', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (9, 0, '库存管理', '/inventory', NULL, 'Box', 20, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (10, 9, '库存列表', 'list', 'inventory/InventoryList.vue', 'List', 1, 1, 'inventory:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (11, 9, '入库管理', 'in', 'inventory/InventoryIn.vue', 'Bottom', 2, 1, 'inventory:in', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (12, 9, '出库管理', 'out', 'inventory/InventoryOut.vue', 'Top', 3, 1, 'inventory:out', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (13, 0, '销售管理', '/sale', NULL, 'Sell', 30, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (14, 13, '收银台', 'pos', 'sale/POS.vue', 'Money', 1, 1, 'sale:pos', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (15, 13, '订单列表', 'order', 'sale/OrderList.vue', 'Tickets', 2, 1, 'sale:order:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (16, 0, '会员管理', '/member', NULL, 'UserFilled', 40, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (17, 15, '会员列表', 'list', 'member/MemberList.vue', 'List', 1, 1, 'member:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (18, 15, '积分管理', 'points', 'member/MemberPoints.vue', 'Coin', 2, 1, 'member:points', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (19, 0, '统计分析', '/statistics', NULL, 'DataAnalysis', 50, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (20, 19, '销售统计', 'sales', 'statistics/SalesStatistics.vue', 'TrendCharts', 1, 1, 'statistics:sales', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (21, 19, '会员统计', 'member', 'statistics/MemberStatistics.vue', 'User', 2, 1, 'statistics:member', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `store_id` bigint NULL DEFAULT NULL COMMENT '店铺ID(NULL表示全局角色)',
  `role_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色标识',
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '角色描述',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (4, NULL, '系统管理员', 'ROLE_SUPER_ADMIN', '管理所有店铺，拥有所有权限', 1, '2026-04-17 16:38:07', '2026-04-17 16:38:07');
INSERT INTO `sys_role` VALUES (5, NULL, '店铺管理员', 'ROLE_STORE_ADMIN', '管理单个店铺，可管理本店库存、销售、用户，但不能管理商品和会员', 1, '2026-04-17 16:38:07', '2026-04-17 16:38:07');
INSERT INTO `sys_role` VALUES (6, NULL, '普通店员', 'ROLE_CLERK', '负责本店的基本库存管理和销售管理', 1, '2026-04-17 16:38:07', '2026-04-17 16:38:07');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `store_id` bigint NULL DEFAULT NULL COMMENT '店铺ID(NULL表示超级管理员)',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码（BCrypt加密）',
  `real_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '头像',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `status` tinyint NULL DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除（0-未删除，1-已删除）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_username`(`username` ASC) USING BTREE,
  INDEX `idx_user_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 1, 'admin', '123456', '系统管理员', '13800138000', NULL, NULL, 4, 1, '2026-03-25 15:03:33', '2026-04-17 16:38:07', 0);
INSERT INTO `sys_user` VALUES (2, 1, 'zhangsan', '123456', '张三', '', '', NULL, 2, 1, '2026-03-25 15:03:33', '2026-04-16 20:24:56', 0);
INSERT INTO `sys_user` VALUES (3, 1, 'ewfawefw', '123456', 'waefawef', '', '', NULL, 2, 1, '2026-03-26 16:47:19', '2026-04-16 20:24:56', 0);
INSERT INTO `sys_user` VALUES (9, NULL, 'store_admin', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EH', '店铺管理员', '13800000001', 'store_admin@test.com', NULL, 5, 1, '2026-04-17 16:38:07', '2026-04-17 16:38:07', 0);
INSERT INTO `sys_user` VALUES (10, NULL, 'clerk', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iAt6Z5EH', '普通店员', '13800000002', 'clerk@test.com', NULL, 6, 1, '2026-04-17 16:38:07', '2026-04-17 16:38:07', 0);

-- ----------------------------
-- Table structure for sys_user_store_rel
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_store_rel`;
CREATE TABLE `sys_user_store_rel`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` bigint NOT NULL COMMENT '系统用户ID',
  `store_id` bigint NOT NULL COMMENT '店铺ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_store`(`user_id` ASC, `store_id` ASC) USING BTREE,
  INDEX `idx_store_id`(`store_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户-店铺关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_store_rel
-- ----------------------------
INSERT INTO `sys_user_store_rel` VALUES (1, 1, 1, '2026-04-16 20:24:56');
INSERT INTO `sys_user_store_rel` VALUES (2, 2, 1, '2026-04-16 20:24:56');
INSERT INTO `sys_user_store_rel` VALUES (3, 3, 1, '2026-04-16 20:24:56');

SET FOREIGN_KEY_CHECKS = 1;
