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

 Date: 17/04/2026 20:51:11
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
) ENGINE = InnoDB AUTO_INCREMENT = 171 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (13, 1, 1, 10, 10, '2026-04-17 20:29:54', '2026-04-09 19:30:10', '2026-03-27 20:13:15', '2026-03-27 20:13:15');
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
INSERT INTO `inventory` VALUES (45, 2, 34, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (46, 2, 35, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (47, 2, 36, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (48, 2, 37, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (49, 2, 38, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (50, 2, 39, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (51, 2, 40, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (52, 2, 41, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (53, 2, 42, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (54, 2, 43, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (55, 2, 44, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (56, 2, 45, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (57, 2, 46, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (58, 2, 47, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (59, 2, 48, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (60, 2, 49, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (61, 2, 50, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (62, 2, 51, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (63, 2, 52, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (64, 2, 53, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (65, 2, 54, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (66, 2, 55, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (67, 2, 56, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (68, 2, 57, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (69, 2, 58, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (70, 2, 59, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (71, 2, 60, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (72, 2, 61, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (73, 2, 62, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (74, 2, 63, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (75, 2, 64, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (76, 2, 65, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (108, 3, 97, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (109, 3, 98, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (110, 3, 99, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (111, 3, 100, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (112, 3, 101, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (113, 3, 102, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (114, 3, 103, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (115, 3, 104, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (116, 3, 105, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (117, 3, 106, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (118, 3, 107, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (119, 3, 108, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (120, 3, 109, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (121, 3, 110, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (122, 3, 111, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (123, 3, 112, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (124, 3, 113, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (125, 3, 114, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (126, 3, 115, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (127, 3, 116, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (128, 3, 117, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (129, 3, 118, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (130, 3, 119, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (131, 3, 120, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (132, 3, 121, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (133, 3, 122, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (134, 3, 123, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (135, 3, 124, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (136, 3, 125, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (137, 3, 126, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (138, 3, 127, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (139, 3, 128, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');

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
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '库存记录表' ROW_FORMAT = Dynamic;

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
INSERT INTO `inventory_record` VALUES (64, 1, 1, 1, 2, 8, 10, NULL, NULL, '', '2026-04-17 20:29:54');

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member_level
-- ----------------------------
INSERT INTO `member_level` VALUES (5, 1, '普通会员', 1, 1.00, 0.00, 1, 1, '2026-04-11 15:44:08');
INSERT INTO `member_level` VALUES (6, 1, '银卡会员', 2, 0.95, 500.00, 1, 1, '2026-04-11 15:44:08');
INSERT INTO `member_level` VALUES (7, 1, '金卡会员', 3, 0.90, 2000.00, 1, 1, '2026-04-11 15:44:08');
INSERT INTO `member_level` VALUES (8, 1, '钻石会员', 4, 0.85, 5000.00, 2, 1, '2026-04-11 15:44:08');
INSERT INTO `member_level` VALUES (9, 2, '普通会员', 1, 1.00, 0.00, 1, 1, '2026-04-17 20:11:48');
INSERT INTO `member_level` VALUES (10, 2, '银卡会员', 2, 0.95, 500.00, 1, 1, '2026-04-17 20:11:48');
INSERT INTO `member_level` VALUES (11, 2, '金卡会员', 3, 0.90, 2000.00, 1, 1, '2026-04-17 20:11:48');
INSERT INTO `member_level` VALUES (12, 2, '钻石会员', 4, 0.85, 5000.00, 2, 1, '2026-04-17 20:11:48');
INSERT INTO `member_level` VALUES (16, 3, '普通会员', 1, 1.00, 0.00, 1, 1, '2026-04-17 20:11:48');
INSERT INTO `member_level` VALUES (17, 3, '银卡会员', 2, 0.95, 500.00, 1, 1, '2026-04-17 20:11:48');
INSERT INTO `member_level` VALUES (18, 3, '金卡会员', 3, 0.90, 2000.00, 1, 1, '2026-04-17 20:11:48');
INSERT INTO `member_level` VALUES (19, 3, '钻石会员', 4, 0.85, 5000.00, 2, 1, '2026-04-17 20:11:48');

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
  `user_id` bigint NULL DEFAULT NULL COMMENT '操作用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作用户名',
  `role_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作用户角色标识',
  `store_id` bigint NULL DEFAULT NULL COMMENT '店铺ID',
  `operation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作描述',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方法(类名.方法名)',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求URL',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'HTTP请求方法(GET/POST等)',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求参数',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `duration` bigint NULL DEFAULT NULL COMMENT '执行时长(ms)',
  `status` int NULL DEFAULT NULL COMMENT '操作状态(1-成功,0-失败)',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '错误信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ol_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_ol_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_ol_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_ol_store_time`(`store_id` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 627 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of operation_log
-- ----------------------------
INSERT INTO `operation_log` VALUES (1, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 20:12:37');
INSERT INTO `operation_log` VALUES (2, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 20:12:37');
INSERT INTO `operation_log` VALUES (3, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 20:12:37');
INSERT INTO `operation_log` VALUES (4, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 20:12:37');
INSERT INTO `operation_log` VALUES (5, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 20:12:37');
INSERT INTO `operation_log` VALUES (6, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:12:37');
INSERT INTO `operation_log` VALUES (7, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:12:37');
INSERT INTO `operation_log` VALUES (8, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:12:40');
INSERT INTO `operation_log` VALUES (9, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:12:40');
INSERT INTO `operation_log` VALUES (10, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:12:42');
INSERT INTO `operation_log` VALUES (11, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:12:42');
INSERT INTO `operation_log` VALUES (12, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:12:43');
INSERT INTO `operation_log` VALUES (13, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:12:43');
INSERT INTO `operation_log` VALUES (14, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:12:44');
INSERT INTO `operation_log` VALUES (15, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:12:44');
INSERT INTO `operation_log` VALUES (16, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:12:44');
INSERT INTO `operation_log` VALUES (17, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:12:45');
INSERT INTO `operation_log` VALUES (18, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:12:47');
INSERT INTO `operation_log` VALUES (19, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:12:47');
INSERT INTO `operation_log` VALUES (20, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:12:47');
INSERT INTO `operation_log` VALUES (21, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-list', 'MemberController.list', '/api/members', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 20:12:49');
INSERT INTO `operation_log` VALUES (22, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 20:12:55');
INSERT INTO `operation_log` VALUES (23, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 21, 1, NULL, '2026-04-17 20:12:55');
INSERT INTO `operation_log` VALUES (24, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:16');
INSERT INTO `operation_log` VALUES (25, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:16');
INSERT INTO `operation_log` VALUES (26, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:16');
INSERT INTO `operation_log` VALUES (27, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:13:16');
INSERT INTO `operation_log` VALUES (28, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:13:16');
INSERT INTO `operation_log` VALUES (29, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:16');
INSERT INTO `operation_log` VALUES (30, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:18');
INSERT INTO `operation_log` VALUES (31, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:18');
INSERT INTO `operation_log` VALUES (32, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:13:19');
INSERT INTO `operation_log` VALUES (33, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:13:19');
INSERT INTO `operation_log` VALUES (34, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:19');
INSERT INTO `operation_log` VALUES (35, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:19');
INSERT INTO `operation_log` VALUES (36, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:13:20');
INSERT INTO `operation_log` VALUES (37, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:13:20');
INSERT INTO `operation_log` VALUES (38, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:21');
INSERT INTO `operation_log` VALUES (39, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:21');
INSERT INTO `operation_log` VALUES (40, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:21');
INSERT INTO `operation_log` VALUES (41, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:23');
INSERT INTO `operation_log` VALUES (42, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-17 20:13:23');
INSERT INTO `operation_log` VALUES (43, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:13:26');
INSERT INTO `operation_log` VALUES (44, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:13:26');
INSERT INTO `operation_log` VALUES (45, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:26');
INSERT INTO `operation_log` VALUES (46, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:13:26');
INSERT INTO `operation_log` VALUES (47, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:13:26');
INSERT INTO `operation_log` VALUES (48, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:14:10');
INSERT INTO `operation_log` VALUES (49, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:14:10');
INSERT INTO `operation_log` VALUES (50, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:14:10');
INSERT INTO `operation_log` VALUES (51, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:14:10');
INSERT INTO `operation_log` VALUES (52, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:14:10');
INSERT INTO `operation_log` VALUES (53, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:14:10');
INSERT INTO `operation_log` VALUES (54, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:14:11');
INSERT INTO `operation_log` VALUES (55, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:14:11');
INSERT INTO `operation_log` VALUES (56, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:14:12');
INSERT INTO `operation_log` VALUES (57, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:14:12');
INSERT INTO `operation_log` VALUES (58, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:14:12');
INSERT INTO `operation_log` VALUES (59, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:14:12');
INSERT INTO `operation_log` VALUES (60, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:14:12');
INSERT INTO `operation_log` VALUES (61, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:14:13');
INSERT INTO `operation_log` VALUES (62, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:14:13');
INSERT INTO `operation_log` VALUES (63, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:14:13');
INSERT INTO `operation_log` VALUES (64, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:15:27');
INSERT INTO `operation_log` VALUES (65, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:15:27');
INSERT INTO `operation_log` VALUES (66, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:15:28');
INSERT INTO `operation_log` VALUES (67, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:15:28');
INSERT INTO `operation_log` VALUES (68, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:17:56');
INSERT INTO `operation_log` VALUES (69, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:17:56');
INSERT INTO `operation_log` VALUES (70, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:17:56');
INSERT INTO `operation_log` VALUES (71, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:17:56');
INSERT INTO `operation_log` VALUES (72, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:17:58');
INSERT INTO `operation_log` VALUES (73, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:17:58');
INSERT INTO `operation_log` VALUES (74, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:17:58');
INSERT INTO `operation_log` VALUES (75, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:17:58');
INSERT INTO `operation_log` VALUES (76, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:17:58');
INSERT INTO `operation_log` VALUES (77, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:17:59');
INSERT INTO `operation_log` VALUES (78, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:17:59');
INSERT INTO `operation_log` VALUES (79, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:18:33');
INSERT INTO `operation_log` VALUES (80, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:18:33');
INSERT INTO `operation_log` VALUES (81, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 20:18:33');
INSERT INTO `operation_log` VALUES (82, 14, 'clerk_tianfu', 'ROLE_CLERK', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 20:18:33');
INSERT INTO `operation_log` VALUES (83, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:18:41');
INSERT INTO `operation_log` VALUES (84, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:18:41');
INSERT INTO `operation_log` VALUES (85, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:18:41');
INSERT INTO `operation_log` VALUES (86, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:18:41');
INSERT INTO `operation_log` VALUES (87, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 20:18:41');
INSERT INTO `operation_log` VALUES (88, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:18:41');
INSERT INTO `operation_log` VALUES (89, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:18:41');
INSERT INTO `operation_log` VALUES (90, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:18:43');
INSERT INTO `operation_log` VALUES (91, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:18:43');
INSERT INTO `operation_log` VALUES (92, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:18:44');
INSERT INTO `operation_log` VALUES (93, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:18:44');
INSERT INTO `operation_log` VALUES (94, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:18:44');
INSERT INTO `operation_log` VALUES (95, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:18:44');
INSERT INTO `operation_log` VALUES (96, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:18:45');
INSERT INTO `operation_log` VALUES (97, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:18:45');
INSERT INTO `operation_log` VALUES (98, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:18:45');
INSERT INTO `operation_log` VALUES (99, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:18:45');
INSERT INTO `operation_log` VALUES (100, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 389, 1, NULL, '2026-04-17 20:22:23');
INSERT INTO `operation_log` VALUES (101, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 20:22:23');
INSERT INTO `operation_log` VALUES (102, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-17 20:22:23');
INSERT INTO `operation_log` VALUES (103, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 20:22:24');
INSERT INTO `operation_log` VALUES (104, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 20:22:24');
INSERT INTO `operation_log` VALUES (105, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:22:35');
INSERT INTO `operation_log` VALUES (106, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 20:22:35');
INSERT INTO `operation_log` VALUES (107, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:22:35');
INSERT INTO `operation_log` VALUES (108, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 20:22:35');
INSERT INTO `operation_log` VALUES (109, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 20:22:35');
INSERT INTO `operation_log` VALUES (110, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:22:35');
INSERT INTO `operation_log` VALUES (111, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:22:35');
INSERT INTO `operation_log` VALUES (112, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:22:37');
INSERT INTO `operation_log` VALUES (113, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:22:37');
INSERT INTO `operation_log` VALUES (114, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:22:38');
INSERT INTO `operation_log` VALUES (115, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:22:38');
INSERT INTO `operation_log` VALUES (116, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:22:38');
INSERT INTO `operation_log` VALUES (117, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:22:38');
INSERT INTO `operation_log` VALUES (118, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:22:39');
INSERT INTO `operation_log` VALUES (119, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:22:39');
INSERT INTO `operation_log` VALUES (120, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:22:39');
INSERT INTO `operation_log` VALUES (121, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:22:39');
INSERT INTO `operation_log` VALUES (122, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:22:40');
INSERT INTO `operation_log` VALUES (123, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:22:40');
INSERT INTO `operation_log` VALUES (124, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:22:41');
INSERT INTO `operation_log` VALUES (125, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:22:41');
INSERT INTO `operation_log` VALUES (126, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:22:41');
INSERT INTO `operation_log` VALUES (127, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:22:41');
INSERT INTO `operation_log` VALUES (128, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:22:41');
INSERT INTO `operation_log` VALUES (129, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:22:41');
INSERT INTO `operation_log` VALUES (130, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:23:13');
INSERT INTO `operation_log` VALUES (131, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:23:13');
INSERT INTO `operation_log` VALUES (132, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:23:13');
INSERT INTO `operation_log` VALUES (133, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:23:13');
INSERT INTO `operation_log` VALUES (134, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 20:23:13');
INSERT INTO `operation_log` VALUES (135, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:23:13');
INSERT INTO `operation_log` VALUES (136, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:23:14');
INSERT INTO `operation_log` VALUES (137, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:23:14');
INSERT INTO `operation_log` VALUES (138, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:23:15');
INSERT INTO `operation_log` VALUES (139, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:23:15');
INSERT INTO `operation_log` VALUES (140, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 393, 1, NULL, '2026-04-17 20:26:09');
INSERT INTO `operation_log` VALUES (141, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 535, 1, NULL, '2026-04-17 20:26:09');
INSERT INTO `operation_log` VALUES (142, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 141, 1, NULL, '2026-04-17 20:26:18');
INSERT INTO `operation_log` VALUES (143, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 151, 1, NULL, '2026-04-17 20:26:18');
INSERT INTO `operation_log` VALUES (144, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 120, 1, NULL, '2026-04-17 20:26:19');
INSERT INTO `operation_log` VALUES (145, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 129, 1, NULL, '2026-04-17 20:26:19');
INSERT INTO `operation_log` VALUES (146, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 20:26:20');
INSERT INTO `operation_log` VALUES (147, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (148, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 88, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (149, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (150, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (151, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (152, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (153, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (154, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (155, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (156, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (157, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (158, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (159, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (160, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (161, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (162, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (163, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (164, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (165, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (166, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (167, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (168, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (169, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (170, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (171, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (172, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (173, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (174, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (175, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (176, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (177, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (178, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (179, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (180, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (181, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (182, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (183, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:21');
INSERT INTO `operation_log` VALUES (184, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (185, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (186, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (187, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (188, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (189, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (190, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (191, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (192, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (193, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (194, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (195, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (196, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (197, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (198, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (199, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (200, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (201, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (202, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (203, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (204, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (205, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (206, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (207, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (208, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (209, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (210, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (211, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (212, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (213, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/97', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (214, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/98', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (215, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/99', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (216, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/100', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (217, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/101', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (218, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/102', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (219, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/103', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (220, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/104', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (221, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/105', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (222, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/106', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (223, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/107', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (224, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/108', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (225, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/109', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (226, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/110', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (227, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/111', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (228, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/112', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (229, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/113', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (230, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/114', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (231, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/115', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (232, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/116', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (233, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/117', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (234, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/118', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (235, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/119', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (236, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/120', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (237, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/121', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (238, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/122', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (239, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/123', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (240, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/124', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (241, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/125', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (242, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/126', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (243, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/127', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:22');
INSERT INTO `operation_log` VALUES (244, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/128', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:23');
INSERT INTO `operation_log` VALUES (245, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 20:26:27');
INSERT INTO `operation_log` VALUES (246, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:27');
INSERT INTO `operation_log` VALUES (247, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 82, 1, NULL, '2026-04-17 20:26:27');
INSERT INTO `operation_log` VALUES (248, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:27');
INSERT INTO `operation_log` VALUES (249, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:26:27');
INSERT INTO `operation_log` VALUES (250, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:27');
INSERT INTO `operation_log` VALUES (251, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:27');
INSERT INTO `operation_log` VALUES (252, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (253, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (254, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (255, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (256, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (257, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (258, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (259, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (260, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (261, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (262, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (263, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (264, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (265, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (266, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (267, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (268, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (269, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (270, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (271, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (272, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (273, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (274, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (275, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (276, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (277, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (278, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (279, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (280, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (281, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (282, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (283, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (284, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (285, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (286, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (287, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (288, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (289, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (290, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (291, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (292, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (293, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (294, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (295, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (296, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (297, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (298, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (299, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (300, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (301, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (302, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (303, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (304, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (305, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (306, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (307, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (308, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (309, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (310, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:28');
INSERT INTO `operation_log` VALUES (311, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (312, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/97', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (313, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/98', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (314, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/99', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (315, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/100', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (316, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/101', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (317, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/102', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (318, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/103', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (319, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/104', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (320, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/105', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (321, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/106', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (322, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/107', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (323, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/108', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (324, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/109', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (325, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/110', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (326, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/111', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (327, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/112', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (328, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/113', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (329, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/114', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (330, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/115', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (331, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/116', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (332, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/117', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (333, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/118', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (334, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/119', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (335, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/120', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (336, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/121', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (337, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/122', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (338, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/123', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (339, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/124', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (340, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/125', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (341, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/126', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (342, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/127', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (343, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/128', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:26:29');
INSERT INTO `operation_log` VALUES (344, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:28:38');
INSERT INTO `operation_log` VALUES (345, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:28:38');
INSERT INTO `operation_log` VALUES (346, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 20:28:38');
INSERT INTO `operation_log` VALUES (347, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 20:28:38');
INSERT INTO `operation_log` VALUES (348, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:28:38');
INSERT INTO `operation_log` VALUES (349, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 96, 1, NULL, '2026-04-17 20:29:48');
INSERT INTO `operation_log` VALUES (350, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 106, 1, NULL, '2026-04-17 20:29:48');
INSERT INTO `operation_log` VALUES (351, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-stockIn', 'InventoryController.stockIn', '/api/inventory/in', 'POST', NULL, '0:0:0:0:0:0:0:1', 26, 1, NULL, '2026-04-17 20:29:54');
INSERT INTO `operation_log` VALUES (352, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 20:29:54');
INSERT INTO `operation_log` VALUES (353, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 96, 1, NULL, '2026-04-17 20:29:54');
INSERT INTO `operation_log` VALUES (354, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 323, 1, NULL, '2026-04-17 20:36:08');
INSERT INTO `operation_log` VALUES (355, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 20:36:08');
INSERT INTO `operation_log` VALUES (356, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 73, 1, NULL, '2026-04-17 20:36:08');
INSERT INTO `operation_log` VALUES (357, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 201, 1, NULL, '2026-04-17 20:36:08');
INSERT INTO `operation_log` VALUES (358, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 142, 1, NULL, '2026-04-17 20:36:13');
INSERT INTO `operation_log` VALUES (359, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 148, 1, NULL, '2026-04-17 20:36:13');
INSERT INTO `operation_log` VALUES (360, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 120, 1, NULL, '2026-04-17 20:36:14');
INSERT INTO `operation_log` VALUES (361, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 131, 1, NULL, '2026-04-17 20:36:14');
INSERT INTO `operation_log` VALUES (362, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 20:36:14');
INSERT INTO `operation_log` VALUES (363, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 20:36:15');
INSERT INTO `operation_log` VALUES (364, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 93, 1, NULL, '2026-04-17 20:36:15');
INSERT INTO `operation_log` VALUES (365, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 100, 1, NULL, '2026-04-17 20:36:15');
INSERT INTO `operation_log` VALUES (366, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:36:16');
INSERT INTO `operation_log` VALUES (367, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 20:36:22');
INSERT INTO `operation_log` VALUES (368, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (369, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 77, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (370, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (371, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (372, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (373, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (374, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (375, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (376, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (377, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (378, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:26');
INSERT INTO `operation_log` VALUES (379, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (380, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (381, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (382, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (383, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (384, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (385, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (386, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (387, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (388, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (389, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (390, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (391, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (392, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (393, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (394, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (395, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (396, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (397, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (398, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (399, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (400, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (401, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (402, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (403, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (404, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (405, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (406, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (407, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (408, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (409, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (410, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (411, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (412, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (413, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (414, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (415, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (416, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (417, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (418, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (419, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (420, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (421, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (422, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (423, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (424, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (425, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (426, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (427, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (428, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (429, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (430, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (431, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (432, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (433, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (434, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/97', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (435, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/98', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (436, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/99', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:27');
INSERT INTO `operation_log` VALUES (437, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/100', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (438, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/101', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (439, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/102', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (440, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/103', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (441, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/104', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (442, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/105', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (443, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/106', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (444, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/107', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (445, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/108', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (446, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/109', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (447, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/110', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (448, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/111', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (449, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/112', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (450, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/113', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (451, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/114', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (452, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/115', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (453, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/116', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (454, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/117', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (455, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/118', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (456, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/119', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (457, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/120', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (458, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/121', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (459, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/122', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (460, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/123', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (461, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/124', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (462, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/125', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (463, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/126', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (464, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/127', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (465, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/128', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:36:28');
INSERT INTO `operation_log` VALUES (466, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 20:36:29');
INSERT INTO `operation_log` VALUES (467, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 92, 1, NULL, '2026-04-17 20:36:29');
INSERT INTO `operation_log` VALUES (468, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:37:25');
INSERT INTO `operation_log` VALUES (469, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:37:25');
INSERT INTO `operation_log` VALUES (470, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:37:25');
INSERT INTO `operation_log` VALUES (471, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 20:37:25');
INSERT INTO `operation_log` VALUES (472, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 20:37:25');
INSERT INTO `operation_log` VALUES (473, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:37:25');
INSERT INTO `operation_log` VALUES (474, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:37:25');
INSERT INTO `operation_log` VALUES (475, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:37:28');
INSERT INTO `operation_log` VALUES (476, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 20:37:28');
INSERT INTO `operation_log` VALUES (477, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 20:37:30');
INSERT INTO `operation_log` VALUES (478, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 97, 1, NULL, '2026-04-17 20:37:30');
INSERT INTO `operation_log` VALUES (479, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 92, 1, NULL, '2026-04-17 20:37:34');
INSERT INTO `operation_log` VALUES (480, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 102, 1, NULL, '2026-04-17 20:37:34');
INSERT INTO `operation_log` VALUES (481, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:37:34');
INSERT INTO `operation_log` VALUES (482, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 94, 1, NULL, '2026-04-17 20:37:34');
INSERT INTO `operation_log` VALUES (483, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 107, 1, NULL, '2026-04-17 20:37:46');
INSERT INTO `operation_log` VALUES (484, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 115, 1, NULL, '2026-04-17 20:37:46');
INSERT INTO `operation_log` VALUES (485, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-17 20:37:47');
INSERT INTO `operation_log` VALUES (486, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 93, 1, NULL, '2026-04-17 20:37:47');
INSERT INTO `operation_log` VALUES (487, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 20:37:49');
INSERT INTO `operation_log` VALUES (488, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 20:37:50');
INSERT INTO `operation_log` VALUES (489, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:37:51');
INSERT INTO `operation_log` VALUES (490, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 20:37:52');
INSERT INTO `operation_log` VALUES (491, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:37:53');
INSERT INTO `operation_log` VALUES (492, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 20:37:53');
INSERT INTO `operation_log` VALUES (493, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:37:54');
INSERT INTO `operation_log` VALUES (494, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:37:54');
INSERT INTO `operation_log` VALUES (495, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 20:37:55');
INSERT INTO `operation_log` VALUES (496, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 20:37:56');
INSERT INTO `operation_log` VALUES (497, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-list', 'MemberController.list', '/api/members', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 20:38:41');
INSERT INTO `operation_log` VALUES (498, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:38:43');
INSERT INTO `operation_log` VALUES (499, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:38:43');
INSERT INTO `operation_log` VALUES (500, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-list', 'StoreController.list', '/api/stores', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:38:51');
INSERT INTO `operation_log` VALUES (501, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (502, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 83, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (503, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (504, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (505, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (506, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (507, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (508, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (509, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (510, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (511, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (512, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (513, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (514, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (515, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (516, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (517, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (518, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (519, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (520, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (521, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (522, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (523, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (524, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (525, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (526, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (527, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (528, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (529, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:48:59');
INSERT INTO `operation_log` VALUES (530, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (531, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (532, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (533, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (534, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (535, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (536, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (537, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (538, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (539, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (540, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (541, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (542, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (543, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (544, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (545, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (546, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (547, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (548, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (549, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (550, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (551, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (552, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (553, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (554, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (555, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (556, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (557, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (558, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (559, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (560, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (561, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (562, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (563, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (564, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (565, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (566, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (567, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/97', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (568, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/98', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (569, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/99', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (570, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/100', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (571, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/101', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (572, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/102', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (573, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/103', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (574, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/104', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (575, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/105', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (576, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/106', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (577, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/107', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (578, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/108', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (579, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/109', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (580, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/110', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (581, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/111', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (582, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/112', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (583, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/113', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (584, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/114', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (585, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/115', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (586, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/116', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (587, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/117', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (588, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/118', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:00');
INSERT INTO `operation_log` VALUES (589, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/119', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (590, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/120', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (591, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/121', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (592, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/122', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (593, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/123', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (594, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/124', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (595, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/125', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (596, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/126', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (597, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/127', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (598, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/128', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:49:01');
INSERT INTO `operation_log` VALUES (599, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 20:49:14');
INSERT INTO `operation_log` VALUES (600, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 94, 1, NULL, '2026-04-17 20:49:14');
INSERT INTO `operation_log` VALUES (601, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 93, 1, NULL, '2026-04-17 20:49:15');
INSERT INTO `operation_log` VALUES (602, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 99, 1, NULL, '2026-04-17 20:49:15');
INSERT INTO `operation_log` VALUES (603, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 94, 1, NULL, '2026-04-17 20:49:16');
INSERT INTO `operation_log` VALUES (604, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 101, 1, NULL, '2026-04-17 20:49:16');
INSERT INTO `operation_log` VALUES (605, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-17 20:49:16');
INSERT INTO `operation_log` VALUES (606, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 106, 1, NULL, '2026-04-17 20:49:16');
INSERT INTO `operation_log` VALUES (607, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:49:25');
INSERT INTO `operation_log` VALUES (608, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 20:49:25');
INSERT INTO `operation_log` VALUES (609, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 20:49:26');
INSERT INTO `operation_log` VALUES (610, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 96, 1, NULL, '2026-04-17 20:49:26');
INSERT INTO `operation_log` VALUES (611, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:49:33');
INSERT INTO `operation_log` VALUES (612, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:49:34');
INSERT INTO `operation_log` VALUES (613, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 20:49:35');
INSERT INTO `operation_log` VALUES (614, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 20:49:36');
INSERT INTO `operation_log` VALUES (615, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 20:49:36');
INSERT INTO `operation_log` VALUES (616, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 20:49:41');
INSERT INTO `operation_log` VALUES (617, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 20:49:43');
INSERT INTO `operation_log` VALUES (618, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 20:49:44');
INSERT INTO `operation_log` VALUES (619, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:50:18');
INSERT INTO `operation_log` VALUES (620, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:50:18');
INSERT INTO `operation_log` VALUES (621, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 20:50:18');
INSERT INTO `operation_log` VALUES (622, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 20:50:18');
INSERT INTO `operation_log` VALUES (623, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 20:50:18');
INSERT INTO `operation_log` VALUES (624, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:50:18');
INSERT INTO `operation_log` VALUES (625, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 20:50:19');
INSERT INTO `operation_log` VALUES (626, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 93, 1, NULL, '2026-04-17 20:50:19');

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
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

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
INSERT INTO `product` VALUES (34, 2, '竹·童', 50, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/5eed5603-364f-40ef-994a-5b07d71249a8.png', '抹茶、芝士、柠檬风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (35, 2, '热带雨林', 50, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/037f08c4-12a8-4e6e-964e-bd693f561531.png', '香草、芒果、百香果、椰子风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (36, 2, '日不落', 50, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/baea3602-3e96-4ec8-88db-2ea8d39d14e0.png', '桂花乌龙、香橙风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (37, 2, '巴斯克芝士蛋糕', 50, 21.00, 8.40, '个', 1, 'http://localhost:8081/images/products/bd2280af-6c24-4130-b7db-7d02028c79ce.png', '芝士、柠檬风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (38, 2, '开心果 KIRI 巴斯克', 50, 23.00, 9.20, '个', 1, 'http://localhost:8081/images/products/c3f412ed-640e-4fe8-a08f-e3226dcbc067.png', '芝士、开心果风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (39, 2, '玫瑰乳酪海盐卷', 51, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/c1ddc88e-85df-476c-9b3e-287e4ffd9fe9.png', '玫瑰乳酪风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (40, 2, '咖啡酥皮海盐卷', 51, 12.00, 4.80, '个', 1, 'http://localhost:8081/images/products/6210e986-8351-4ac8-81b3-92203bb6d12a.png', '咖啡风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (41, 2, '双重黑巧海盐卷', 51, 13.00, 5.20, '个', 1, 'http://localhost:8081/images/products/a2d198a8-03cf-4dd8-b78a-755b8d245ea7.png', '黑巧克力风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (42, 2, '全麦海盐卷', 51, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/c3321f33-8d0b-4c89-942f-fd8d2b59be91.png', '全麦风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (43, 2, '猪肉脯四叶草', 51, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/a6cef250-fb4c-4c3e-8ef6-a84a0da6075a.png', '猪肉脯风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (44, 2, '夏威夷可可脆片', 52, 20.00, 8.00, '罐', 30, '', '夏威夷果、可可风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (45, 2, '芝士脆条', 52, 15.00, 6.00, '罐', 30, NULL, '芝士风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (46, 2, '蜂蜜吐司条', 52, 10.00, 4.00, '袋', 30, NULL, '蜂蜜风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (47, 2, '坚果挞', 52, 11.00, 4.40, '个', 30, NULL, '混合坚果风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (48, 2, '全麦碧根果蔓越莓司康', 52, 10.00, 4.00, '个', 30, NULL, '全麦、碧根果、蔓越莓风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (49, 2, '原味 Kiri 巴斯克蛋糕', 53, 178.00, 71.20, '6 寸', 1, NULL, '原味 Kiri 巴斯克风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (50, 2, '黑松露西班牙火腿巴斯克', 53, 198.00, 79.20, '6 寸', 1, NULL, '黑松露、西班牙火腿风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (51, 2, '开心果 kiri 巴斯克蛋糕', 53, 198.00, 79.20, '6 寸', 1, NULL, '开心果、Kiri 芝士风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (52, 2, '蓝莓花', 53, 178.00, 71.20, '6 寸', 1, NULL, '蓝莓风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (53, 2, '奥利奥生巧巴斯克', 53, 198.00, 79.20, '6 寸', 1, NULL, '奥利奥、生巧克力风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (54, 2, '美式咖啡 (冰/热)', 54, 16.00, 6.40, '杯', 1, NULL, '经典美式风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (55, 2, '澳白', 54, 19.00, 7.60, '杯', 1, NULL, '澳白咖啡风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (56, 2, '拿铁', 54, 20.00, 8.00, '杯', 1, NULL, '经典拿铁风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (57, 2, '燕麦拿铁', 54, 25.00, 10.00, '杯', 1, NULL, '燕麦奶、咖啡风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (58, 2, '鸭屎香柠檬茶', 54, 18.00, 7.20, '杯', 1, NULL, '鸭屎香茶底、柠檬风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (59, 2, '香草栗子马卡龙', 55, 12.00, 4.80, '个', 7, NULL, '香草、栗子风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (60, 2, '抹茶马卡龙', 55, 12.00, 4.80, '个', 7, NULL, '抹茶风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (61, 2, '蓝莓马卡龙', 55, 13.00, 5.20, '个', 7, NULL, '蓝莓风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (62, 2, '海盐焦糖马卡龙', 55, 13.00, 5.20, '个', 7, NULL, '海盐、焦糖风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (63, 2, '荔枝草莓马卡龙', 55, 13.00, 5.20, '个', 7, NULL, '荔枝、草莓风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (64, 2, '手工曲奇礼盒', 56, 68.00, 28.00, '盒', 30, NULL, '多种口味手工曲奇，精美礼盒包装', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (65, 2, '定制生日牌', 56, 8.00, 3.00, '个', 365, NULL, '可定制生日祝福蜡烛牌', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (97, 3, '竹·童', 57, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/5eed5603-364f-40ef-994a-5b07d71249a8.png', '抹茶、芝士、柠檬风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (98, 3, '热带雨林', 57, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/037f08c4-12a8-4e6e-964e-bd693f561531.png', '香草、芒果、百香果、椰子风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (99, 3, '日不落', 57, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/baea3602-3e96-4ec8-88db-2ea8d39d14e0.png', '桂花乌龙、香橙风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (100, 3, '巴斯克芝士蛋糕', 57, 21.00, 8.40, '个', 1, 'http://localhost:8081/images/products/bd2280af-6c24-4130-b7db-7d02028c79ce.png', '芝士、柠檬风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (101, 3, '开心果 KIRI 巴斯克', 57, 23.00, 9.20, '个', 1, 'http://localhost:8081/images/products/c3f412ed-640e-4fe8-a08f-e3226dcbc067.png', '芝士、开心果风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (102, 3, '玫瑰乳酪海盐卷', 58, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/c1ddc88e-85df-476c-9b3e-287e4ffd9fe9.png', '玫瑰乳酪风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (103, 3, '咖啡酥皮海盐卷', 58, 12.00, 4.80, '个', 1, 'http://localhost:8081/images/products/6210e986-8351-4ac8-81b3-92203bb6d12a.png', '咖啡风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (104, 3, '双重黑巧海盐卷', 58, 13.00, 5.20, '个', 1, 'http://localhost:8081/images/products/a2d198a8-03cf-4dd8-b78a-755b8d245ea7.png', '黑巧克力风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (105, 3, '全麦海盐卷', 58, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/c3321f33-8d0b-4c89-942f-fd8d2b59be91.png', '全麦风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (106, 3, '猪肉脯四叶草', 58, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/a6cef250-fb4c-4c3e-8ef6-a84a0da6075a.png', '猪肉脯风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (107, 3, '夏威夷可可脆片', 59, 20.00, 8.00, '罐', 30, '', '夏威夷果、可可风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (108, 3, '芝士脆条', 59, 15.00, 6.00, '罐', 30, NULL, '芝士风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (109, 3, '蜂蜜吐司条', 59, 10.00, 4.00, '袋', 30, NULL, '蜂蜜风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (110, 3, '坚果挞', 59, 11.00, 4.40, '个', 30, NULL, '混合坚果风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (111, 3, '全麦碧根果蔓越莓司康', 59, 10.00, 4.00, '个', 30, NULL, '全麦、碧根果、蔓越莓风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (112, 3, '原味 Kiri 巴斯克蛋糕', 60, 178.00, 71.20, '6 寸', 1, NULL, '原味 Kiri 巴斯克风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (113, 3, '黑松露西班牙火腿巴斯克', 60, 198.00, 79.20, '6 寸', 1, NULL, '黑松露、西班牙火腿风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (114, 3, '开心果 kiri 巴斯克蛋糕', 60, 198.00, 79.20, '6 寸', 1, NULL, '开心果、Kiri 芝士风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (115, 3, '蓝莓花', 60, 178.00, 71.20, '6 寸', 1, NULL, '蓝莓风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (116, 3, '奥利奥生巧巴斯克', 60, 198.00, 79.20, '6 寸', 1, NULL, '奥利奥、生巧克力风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (117, 3, '美式咖啡 (冰/热)', 61, 16.00, 6.40, '杯', 1, NULL, '经典美式风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (118, 3, '澳白', 61, 19.00, 7.60, '杯', 1, NULL, '澳白咖啡风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (119, 3, '拿铁', 61, 20.00, 8.00, '杯', 1, NULL, '经典拿铁风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (120, 3, '燕麦拿铁', 61, 25.00, 10.00, '杯', 1, NULL, '燕麦奶、咖啡风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (121, 3, '鸭屎香柠檬茶', 61, 18.00, 7.20, '杯', 1, NULL, '鸭屎香茶底、柠檬风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (122, 3, '香草栗子马卡龙', 62, 12.00, 4.80, '个', 7, NULL, '香草、栗子风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (123, 3, '抹茶马卡龙', 62, 12.00, 4.80, '个', 7, NULL, '抹茶风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (124, 3, '蓝莓马卡龙', 62, 13.00, 5.20, '个', 7, NULL, '蓝莓风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (125, 3, '海盐焦糖马卡龙', 62, 13.00, 5.20, '个', 7, NULL, '海盐、焦糖风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (126, 3, '荔枝草莓马卡龙', 62, 13.00, 5.20, '个', 7, NULL, '荔枝、草莓风味', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (127, 3, '手工曲奇礼盒', 63, 68.00, 28.00, '盒', 30, NULL, '多种口味手工曲奇，精美礼盒包装', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `product` VALUES (128, 3, '定制生日牌', 63, 8.00, 3.00, '个', 365, NULL, '可定制生日祝福蜡烛牌', 1, '2026-04-17 20:11:48', '2026-04-17 20:11:48');

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
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品分类表' ROW_FORMAT = Dynamic;

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
INSERT INTO `product_category` VALUES (50, 2, '法式甜点', 1, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (51, 2, '欧式面包', 2, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (52, 2, '常温蛋糕', 3, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (53, 2, '生日蛋糕', 4, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (54, 2, '饮品', 5, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (55, 2, '马卡龙', 6, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (56, 2, '其他', 7, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (57, 3, '法式甜点', 1, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (58, 3, '欧式面包', 2, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (59, 3, '常温蛋糕', 3, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (60, 3, '生日蛋糕', 4, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (61, 3, '饮品', 5, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (62, 3, '马卡龙', 6, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');
INSERT INTO `product_category` VALUES (63, 3, '其他', 7, 1, '2026-04-17 20:05:12', '2026-04-17 20:05:12');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '小程序预约订单表' ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '预约订单明细表' ROW_FORMAT = Dynamic;

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
INSERT INTO `store` VALUES (2, '莎菲尔菓子(春熙店)', 'STORE002', '成都市锦江区春熙路88号', '028-66666666', '09:00-22:00', NULL, NULL, NULL, 1, '2026-04-17 20:01:56', '2026-04-17 20:01:56');
INSERT INTO `store` VALUES (3, '莎菲尔菓子(天府店)', 'STORE003', '成都市高新区天府大道999号', '028-77777777', '10:00-21:30', NULL, NULL, NULL, 1, '2026-04-17 16:44:43', '2026-04-17 20:01:56');

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
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, 0, '系统管理', '/system', NULL, 'Setting', 100, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (2, 1, '用户管理', 'user', 'system/UserManage.vue', 'User', 1, 1, 'system:user:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (3, 1, '角色管理', 'role', 'system/RoleManage.vue', 'Role', 2, 1, 'system:role:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (4, 1, '菜单管理', 'menu', 'system/MenuManage.vue', 'Menu', 3, 1, 'system:menu:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (5, 1, '操作日志', 'log', 'system/OperationLog.vue', 'Document', 4, 1, 'system:log:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (6, 0, '商品管理', '/product', NULL, 'Goods', 10, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (7, 6, '商品列表', 'list', 'product/ProductList.vue', 'List', 1, 1, 'product:list', 1, '2026-03-25 15:03:33', '2026-04-17 18:49:16');
INSERT INTO `sys_menu` VALUES (8, 6, '分类管理', 'category', 'product/CategoryManage.vue', 'Collection', 2, 1, 'product:category', 1, '2026-03-25 15:03:33', '2026-04-17 18:49:16');
INSERT INTO `sys_menu` VALUES (9, 0, '库存管理', '/inventory', NULL, 'Box', 20, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (10, 9, '库存列表', 'list', 'inventory/InventoryList.vue', 'List', 1, 1, 'inventory:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (11, 9, '入库管理', 'in', 'inventory/InventoryIn.vue', 'Bottom', 2, 1, 'inventory:in', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (12, 9, '出库管理', 'out', 'inventory/InventoryOut.vue', 'Top', 3, 1, 'inventory:out', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (13, 0, '销售管理', '/sale', NULL, 'Sell', 30, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (14, 13, '收银台', 'pos', 'sale/POS.vue', 'Money', 1, 1, 'sale:pos', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (15, 13, '订单列表', 'order', 'sale/OrderList.vue', 'Tickets', 2, 1, 'sale:order:list', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (16, 0, '会员管理', '/member', NULL, 'UserFilled', 40, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (17, 16, '会员列表', 'list', 'member/MemberList.vue', 'List', 1, 1, 'member:list', 1, '2026-03-25 15:03:33', '2026-04-17 18:49:16');
INSERT INTO `sys_menu` VALUES (18, 16, '积分管理', 'points', 'member/MemberPoints.vue', 'Coin', 2, 1, 'member:points', 1, '2026-03-25 15:03:33', '2026-04-17 18:49:16');
INSERT INTO `sys_menu` VALUES (19, 0, '统计分析', '/statistics', NULL, 'DataAnalysis', 50, 1, NULL, 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (20, 19, '销售统计', 'sales', 'statistics/SalesStatistics.vue', 'TrendCharts', 1, 1, 'statistics:sales', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (21, 19, '会员统计', 'member', 'statistics/MemberStatistics.vue', 'User', 2, 1, 'statistics:member', 1, '2026-03-25 15:03:33', '2026-03-25 15:03:33');
INSERT INTO `sys_menu` VALUES (22, 1, '店铺管理', 'stores', 'system/StoreManage.vue', 'Shop', 5, 1, 'system:store:list', 1, '2026-04-17 18:49:16', '2026-04-17 18:49:16');

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
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统用户表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, NULL, 'admin', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', '系统管理员', '13800138000', NULL, NULL, 4, 1, '2026-03-25 15:03:33', '2026-04-17 18:58:00', 0);
INSERT INTO `sys_user` VALUES (2, 1, 'zhangsan', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', '张三', '', '', NULL, 6, 1, '2026-03-25 15:03:33', '2026-04-17 19:05:27', 0);
INSERT INTO `sys_user` VALUES (3, 1, 'ewfawefw', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', 'waefawef', '', '', NULL, 6, 1, '2026-03-26 16:47:19', '2026-04-17 19:05:29', 0);
INSERT INTO `sys_user` VALUES (9, 1, 'admin_zongdian', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', '总店管理员', '13800000001', 'store_admin@test.com', NULL, 5, 1, '2026-04-17 16:38:07', '2026-04-17 20:01:56', 0);
INSERT INTO `sys_user` VALUES (10, 1, 'clerk_zongdian', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', '总店店员', '13800000002', 'clerk@test.com', NULL, 6, 1, '2026-04-17 16:38:07', '2026-04-17 20:01:56', 0);
INSERT INTO `sys_user` VALUES (11, 2, 'admin_chunxi', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', '春熙店管理员', '13800000003', NULL, NULL, 5, 1, '2026-04-17 20:01:56', '2026-04-17 20:13:53', 0);
INSERT INTO `sys_user` VALUES (12, 3, 'admin_tianfu', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', '天府店管理员', '13800000004', NULL, NULL, 5, 1, '2026-04-17 20:01:56', '2026-04-17 20:13:55', 0);
INSERT INTO `sys_user` VALUES (13, 2, 'clerk_chunxi', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', '春熙店店员', '13800000005', NULL, NULL, 6, 1, '2026-04-17 20:01:56', '2026-04-17 20:13:57', 0);
INSERT INTO `sys_user` VALUES (14, 3, 'clerk_tianfu', '$2a$10$hYRHyMKyYPtrverCpay9z.6N1emhpWJ38ujvCm0sSSDVFt10QMx6K', '天府店店员', '13800000006', NULL, NULL, 6, 1, '2026-04-17 20:01:56', '2026-04-17 20:13:59', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户-店铺关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_store_rel
-- ----------------------------
INSERT INTO `sys_user_store_rel` VALUES (1, 1, 1, '2026-04-16 20:24:56');
INSERT INTO `sys_user_store_rel` VALUES (18, 9, 1, '2026-04-17 20:05:12');
INSERT INTO `sys_user_store_rel` VALUES (19, 10, 1, '2026-04-17 20:05:12');
INSERT INTO `sys_user_store_rel` VALUES (20, 11, 2, '2026-04-17 20:05:12');
INSERT INTO `sys_user_store_rel` VALUES (21, 12, 3, '2026-04-17 20:05:12');
INSERT INTO `sys_user_store_rel` VALUES (22, 13, 2, '2026-04-17 20:05:12');
INSERT INTO `sys_user_store_rel` VALUES (23, 14, 3, '2026-04-17 20:05:12');
INSERT INTO `sys_user_store_rel` VALUES (24, 2, 1, '2026-04-17 20:05:12');
INSERT INTO `sys_user_store_rel` VALUES (25, 3, 1, '2026-04-17 20:05:12');

SET FOREIGN_KEY_CHECKS = 1;
