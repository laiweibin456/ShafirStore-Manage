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

 Date: 18/04/2026 11:41:42
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
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '库存表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of inventory
-- ----------------------------
INSERT INTO `inventory` VALUES (13, 1, 1, 49, 10, '2026-04-17 22:36:47', '2026-04-17 22:35:53', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (14, 1, 2, 18, 10, '2026-03-29 22:39:50', '2026-03-30 17:42:03', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (15, 1, 3, 42, 10, NULL, '2026-04-10 23:41:02', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (16, 1, 4, 57, 10, '2026-04-09 16:21:06', '2026-04-10 23:41:02', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (17, 1, 5, 56, 10, '2026-04-18 11:36:35', '2026-04-18 11:35:02', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (18, 1, 6, 10, 10, '2026-04-17 21:44:43', NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (19, 1, 7, 74, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (20, 1, 8, 46, 10, '2026-04-03 22:33:11', '2026-04-03 22:33:40', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (21, 1, 9, 6, 10, '2026-04-03 22:33:11', '2026-04-10 23:41:02', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (22, 1, 10, 93, 10, '2026-04-17 21:46:33', '2026-04-17 21:46:15', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (23, 1, 11, 44, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (24, 1, 12, 40, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (25, 1, 13, 68, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (26, 1, 14, 20, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (27, 1, 15, 94, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (28, 1, 16, 8, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (29, 1, 17, 61, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (30, 1, 18, 81, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (31, 1, 19, 19, 10, NULL, '2026-03-30 17:42:03', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (32, 1, 20, 52, 10, NULL, NULL, '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (33, 1, 21, 3, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (34, 1, 22, 57, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (35, 1, 23, 77, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (36, 1, 24, 15, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (37, 1, 25, 42, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (38, 1, 26, 64, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (39, 1, 27, 95, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (40, 1, 28, 81, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (41, 1, 29, 21, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (42, 1, 30, 60, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (43, 1, 31, 38, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (44, 1, 32, 7, 10, '2026-04-03 22:33:10', '2026-04-03 22:25:29', '2026-03-27 20:13:15', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (45, 2, 34, 27, 10, '2026-04-17 22:54:28', '2026-04-17 22:24:22', '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (46, 2, 35, 77, 10, NULL, '2026-04-17 22:24:22', '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (47, 2, 36, 60, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (48, 2, 37, 58, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (49, 2, 38, 22, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (50, 2, 39, 86, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (51, 2, 40, 34, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (52, 2, 41, 61, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (53, 2, 42, 33, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (54, 2, 43, 52, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (55, 2, 44, 73, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (56, 2, 45, 38, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (57, 2, 46, 43, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (58, 2, 47, 11, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (59, 2, 48, 78, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (60, 2, 49, 27, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (61, 2, 50, 53, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (62, 2, 51, 12, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (63, 2, 52, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (64, 2, 53, 47, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (65, 2, 54, 75, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (66, 2, 55, 64, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (67, 2, 56, 86, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (68, 2, 57, 68, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (69, 2, 58, 74, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (70, 2, 59, 75, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (71, 2, 60, 64, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (72, 2, 61, 85, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (73, 2, 62, 62, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (74, 2, 63, 46, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (75, 2, 64, 34, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (76, 2, 65, 25, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (108, 3, 97, 9, 10, '2026-04-17 22:54:53', NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (109, 3, 98, 41, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (110, 3, 99, 60, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (111, 3, 100, 53, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (112, 3, 101, 19, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (113, 3, 102, 53, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (114, 3, 103, 22, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (115, 3, 104, 8, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (116, 3, 105, 29, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (117, 3, 106, 56, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (118, 3, 107, 8, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (119, 3, 108, 50, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 20:11:48');
INSERT INTO `inventory` VALUES (120, 3, 109, 38, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (121, 3, 110, 38, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (122, 3, 111, 9, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (123, 3, 112, 47, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (124, 3, 113, 23, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (125, 3, 114, 30, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (126, 3, 115, 15, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (127, 3, 116, 42, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (128, 3, 117, 41, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (129, 3, 118, 14, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (130, 3, 119, 63, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (131, 3, 120, 29, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (132, 3, 121, 10, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (133, 3, 122, 18, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (134, 3, 123, 55, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (135, 3, 124, 36, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (136, 3, 125, 10, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (137, 3, 126, 59, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (138, 3, 127, 19, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');
INSERT INTO `inventory` VALUES (139, 3, 128, 33, 10, NULL, NULL, '2026-04-17 20:11:48', '2026-04-17 21:34:42');

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
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '库存记录表' ROW_FORMAT = Dynamic;

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
INSERT INTO `inventory_record` VALUES (65, 1, 6, 1, 2, 8, 10, NULL, NULL, '', '2026-04-17 21:44:43');
INSERT INTO `inventory_record` VALUES (66, 1, 10, 2, 1, 93, 92, 8, 1, '销售出库，订单号：ORD01202604174725', '2026-04-17 21:46:14');
INSERT INTO `inventory_record` VALUES (67, 1, 10, 1, 1, 92, 93, NULL, 1, '订单退款退回，订单号：ORD01202604174725，原因：用户申请退款', '2026-04-17 21:46:33');
INSERT INTO `inventory_record` VALUES (68, 2, 34, 2, 1, 26, 25, 9, 11, '销售出库，订单号：ORD02202604175893', '2026-04-17 22:24:22');
INSERT INTO `inventory_record` VALUES (69, 2, 35, 2, 1, 78, 77, 9, 11, '销售出库，订单号：ORD02202604175893', '2026-04-17 22:24:22');
INSERT INTO `inventory_record` VALUES (70, 1, 1, 2, 2, 50, 48, NULL, NULL, '', '2026-04-17 22:35:30');
INSERT INTO `inventory_record` VALUES (71, 1, 1, 2, 2, 48, 46, NULL, NULL, '', '2026-04-17 22:35:53');
INSERT INTO `inventory_record` VALUES (72, 1, 1, 1, 2, 46, 48, NULL, NULL, '', '2026-04-17 22:36:11');
INSERT INTO `inventory_record` VALUES (73, 1, 1, 1, 1, 48, 49, NULL, NULL, '', '2026-04-17 22:36:46');
INSERT INTO `inventory_record` VALUES (74, 2, 34, 1, 2, 25, 27, NULL, NULL, '', '2026-04-17 22:54:27');
INSERT INTO `inventory_record` VALUES (75, 3, 97, 1, 2, 7, 9, NULL, NULL, '', '2026-04-17 22:54:52');
INSERT INTO `inventory_record` VALUES (76, 1, 5, 2, 1, 56, 55, NULL, 1, '预约订单预占库存', '2026-04-18 11:35:01');
INSERT INTO `inventory_record` VALUES (77, 1, 5, 1, 1, 55, 56, NULL, 1, '取消预约订单，恢复库存', '2026-04-18 11:36:35');

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员等级表' ROW_FORMAT = Dynamic;

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
  INDEX `idx_ol_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_ol_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_ol_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_ol_store_time`(`store_id` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2020 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = DYNAMIC;

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
INSERT INTO `operation_log` VALUES (627, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 104, 1, NULL, '2026-04-17 20:52:58');
INSERT INTO `operation_log` VALUES (628, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 112, 1, NULL, '2026-04-17 20:52:58');
INSERT INTO `operation_log` VALUES (629, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 101, 1, NULL, '2026-04-17 20:52:58');
INSERT INTO `operation_log` VALUES (630, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 115, 1, NULL, '2026-04-17 20:52:58');
INSERT INTO `operation_log` VALUES (631, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 20:52:59');
INSERT INTO `operation_log` VALUES (632, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 20:53:00');
INSERT INTO `operation_log` VALUES (633, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 20:53:01');
INSERT INTO `operation_log` VALUES (634, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (635, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 79, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (636, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (637, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (638, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (639, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (640, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (641, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (642, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (643, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (644, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (645, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (646, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (647, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (648, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (649, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (650, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (651, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (652, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (653, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (654, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (655, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (656, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (657, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (658, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (659, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (660, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:02');
INSERT INTO `operation_log` VALUES (661, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (662, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (663, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (664, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (665, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (666, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (667, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (668, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (669, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (670, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (671, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (672, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (673, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (674, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (675, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (676, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (677, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (678, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (679, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (680, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (681, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (682, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (683, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (684, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (685, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (686, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (687, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (688, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (689, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (690, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (691, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (692, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (693, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (694, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (695, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (696, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (697, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (698, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (699, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (700, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/97', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (701, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/98', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (702, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/99', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (703, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/100', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (704, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/101', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (705, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/102', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (706, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/103', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (707, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/104', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (708, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/105', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (709, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/106', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (710, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/107', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (711, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/108', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (712, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/109', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (713, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/110', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (714, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/111', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (715, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/112', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (716, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/113', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (717, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/114', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (718, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/115', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (719, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/116', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (720, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/117', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (721, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/118', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (722, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/119', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (723, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/120', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (724, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/121', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (725, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/122', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (726, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/123', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:03');
INSERT INTO `operation_log` VALUES (727, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/124', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:04');
INSERT INTO `operation_log` VALUES (728, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/125', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:53:04');
INSERT INTO `operation_log` VALUES (729, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/126', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:04');
INSERT INTO `operation_log` VALUES (730, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/127', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 20:53:04');
INSERT INTO `operation_log` VALUES (731, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/128', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:53:04');
INSERT INTO `operation_log` VALUES (732, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 20:53:10');
INSERT INTO `operation_log` VALUES (733, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 20:53:10');
INSERT INTO `operation_log` VALUES (734, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:55:28');
INSERT INTO `operation_log` VALUES (735, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 20:55:28');
INSERT INTO `operation_log` VALUES (736, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 20:55:28');
INSERT INTO `operation_log` VALUES (737, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 20:55:28');
INSERT INTO `operation_log` VALUES (738, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:05:35');
INSERT INTO `operation_log` VALUES (739, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:05:35');
INSERT INTO `operation_log` VALUES (740, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:05:35');
INSERT INTO `operation_log` VALUES (741, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:05:35');
INSERT INTO `operation_log` VALUES (742, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 389, 1, NULL, '2026-04-17 21:07:49');
INSERT INTO `operation_log` VALUES (743, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:07:49');
INSERT INTO `operation_log` VALUES (744, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:07:49');
INSERT INTO `operation_log` VALUES (745, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 52, 1, NULL, '2026-04-17 21:07:49');
INSERT INTO `operation_log` VALUES (746, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:07:53');
INSERT INTO `operation_log` VALUES (747, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:07:53');
INSERT INTO `operation_log` VALUES (748, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:07:54');
INSERT INTO `operation_log` VALUES (749, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:07:54');
INSERT INTO `operation_log` VALUES (750, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:07:55');
INSERT INTO `operation_log` VALUES (751, 9, 'admin_zongdian', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:07:55');
INSERT INTO `operation_log` VALUES (752, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:08:04');
INSERT INTO `operation_log` VALUES (753, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:08:04');
INSERT INTO `operation_log` VALUES (754, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:08:04');
INSERT INTO `operation_log` VALUES (755, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 21:08:04');
INSERT INTO `operation_log` VALUES (756, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 21:08:04');
INSERT INTO `operation_log` VALUES (757, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:08:04');
INSERT INTO `operation_log` VALUES (758, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:08:04');
INSERT INTO `operation_log` VALUES (759, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:08:05');
INSERT INTO `operation_log` VALUES (760, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:08:05');
INSERT INTO `operation_log` VALUES (761, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:08:06');
INSERT INTO `operation_log` VALUES (762, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:08:06');
INSERT INTO `operation_log` VALUES (763, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:08:08');
INSERT INTO `operation_log` VALUES (764, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:08:08');
INSERT INTO `operation_log` VALUES (765, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:08:10');
INSERT INTO `operation_log` VALUES (766, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:08:10');
INSERT INTO `operation_log` VALUES (767, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:08:25');
INSERT INTO `operation_log` VALUES (768, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:08:25');
INSERT INTO `operation_log` VALUES (769, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:08:28');
INSERT INTO `operation_log` VALUES (770, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:08:28');
INSERT INTO `operation_log` VALUES (771, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 392, 1, NULL, '2026-04-17 21:13:50');
INSERT INTO `operation_log` VALUES (772, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:13:50');
INSERT INTO `operation_log` VALUES (773, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:13:50');
INSERT INTO `operation_log` VALUES (774, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 30, 1, NULL, '2026-04-17 21:13:50');
INSERT INTO `operation_log` VALUES (775, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:13:53');
INSERT INTO `operation_log` VALUES (776, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:13:53');
INSERT INTO `operation_log` VALUES (777, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:13:53');
INSERT INTO `operation_log` VALUES (778, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:13:53');
INSERT INTO `operation_log` VALUES (779, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:13:59');
INSERT INTO `operation_log` VALUES (780, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:13:59');
INSERT INTO `operation_log` VALUES (781, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:14:00');
INSERT INTO `operation_log` VALUES (782, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:14:00');
INSERT INTO `operation_log` VALUES (783, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:14:01');
INSERT INTO `operation_log` VALUES (784, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:14:01');
INSERT INTO `operation_log` VALUES (785, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-list', 'MemberController.list', '/api/members', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 21:14:08');
INSERT INTO `operation_log` VALUES (786, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:14:12');
INSERT INTO `operation_log` VALUES (787, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 23, 1, NULL, '2026-04-17 21:14:12');
INSERT INTO `operation_log` VALUES (788, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:14:14');
INSERT INTO `operation_log` VALUES (789, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:14:14');
INSERT INTO `operation_log` VALUES (790, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 330, 1, NULL, '2026-04-17 21:14:41');
INSERT INTO `operation_log` VALUES (791, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 21:14:41');
INSERT INTO `operation_log` VALUES (792, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 21:14:41');
INSERT INTO `operation_log` VALUES (793, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 28, 1, NULL, '2026-04-17 21:14:41');
INSERT INTO `operation_log` VALUES (794, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:15:43');
INSERT INTO `operation_log` VALUES (795, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:15:43');
INSERT INTO `operation_log` VALUES (796, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:16:49');
INSERT INTO `operation_log` VALUES (797, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 21:16:49');
INSERT INTO `operation_log` VALUES (798, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 21:16:49');
INSERT INTO `operation_log` VALUES (799, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 21:16:49');
INSERT INTO `operation_log` VALUES (800, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:16:49');
INSERT INTO `operation_log` VALUES (801, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:16:49');
INSERT INTO `operation_log` VALUES (802, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:16:50');
INSERT INTO `operation_log` VALUES (803, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:16:50');
INSERT INTO `operation_log` VALUES (804, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:16:51');
INSERT INTO `operation_log` VALUES (805, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:16:51');
INSERT INTO `operation_log` VALUES (806, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:16:51');
INSERT INTO `operation_log` VALUES (807, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:16:51');
INSERT INTO `operation_log` VALUES (808, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:16:52');
INSERT INTO `operation_log` VALUES (809, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:16:52');
INSERT INTO `operation_log` VALUES (810, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:16:52');
INSERT INTO `operation_log` VALUES (811, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:16:53');
INSERT INTO `operation_log` VALUES (812, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 24, 1, NULL, '2026-04-17 21:16:53');
INSERT INTO `operation_log` VALUES (813, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:17:02');
INSERT INTO `operation_log` VALUES (814, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:17:02');
INSERT INTO `operation_log` VALUES (815, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:17:04');
INSERT INTO `operation_log` VALUES (816, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:17:04');
INSERT INTO `operation_log` VALUES (817, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:17:22');
INSERT INTO `operation_log` VALUES (818, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:17:22');
INSERT INTO `operation_log` VALUES (819, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:17:22');
INSERT INTO `operation_log` VALUES (820, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:17:22');
INSERT INTO `operation_log` VALUES (821, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 21:17:22');
INSERT INTO `operation_log` VALUES (822, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:17:22');
INSERT INTO `operation_log` VALUES (823, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:17:23');
INSERT INTO `operation_log` VALUES (824, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:17:23');
INSERT INTO `operation_log` VALUES (825, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:17:24');
INSERT INTO `operation_log` VALUES (826, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:17:24');
INSERT INTO `operation_log` VALUES (827, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:17:24');
INSERT INTO `operation_log` VALUES (828, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:17:24');
INSERT INTO `operation_log` VALUES (829, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 341, 1, NULL, '2026-04-17 21:23:31');
INSERT INTO `operation_log` VALUES (830, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:23:31');
INSERT INTO `operation_log` VALUES (831, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:23:31');
INSERT INTO `operation_log` VALUES (832, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 26, 1, NULL, '2026-04-17 21:23:31');
INSERT INTO `operation_log` VALUES (833, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:23:33');
INSERT INTO `operation_log` VALUES (834, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 21:23:33');
INSERT INTO `operation_log` VALUES (835, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 21:23:33');
INSERT INTO `operation_log` VALUES (836, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 21:23:33');
INSERT INTO `operation_log` VALUES (837, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:23:33');
INSERT INTO `operation_log` VALUES (838, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:23:41');
INSERT INTO `operation_log` VALUES (839, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:23:41');
INSERT INTO `operation_log` VALUES (840, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:23:41');
INSERT INTO `operation_log` VALUES (841, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:23:41');
INSERT INTO `operation_log` VALUES (842, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:23:41');
INSERT INTO `operation_log` VALUES (843, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:23:41');
INSERT INTO `operation_log` VALUES (844, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:23:41');
INSERT INTO `operation_log` VALUES (845, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:23:43');
INSERT INTO `operation_log` VALUES (846, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:23:43');
INSERT INTO `operation_log` VALUES (847, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 353, 1, NULL, '2026-04-17 21:27:24');
INSERT INTO `operation_log` VALUES (848, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:27:24');
INSERT INTO `operation_log` VALUES (849, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:27:24');
INSERT INTO `operation_log` VALUES (850, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:27:24');
INSERT INTO `operation_log` VALUES (851, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:27:26');
INSERT INTO `operation_log` VALUES (852, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:27:26');
INSERT INTO `operation_log` VALUES (853, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:27:33');
INSERT INTO `operation_log` VALUES (854, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 21:27:33');
INSERT INTO `operation_log` VALUES (855, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 27, 1, NULL, '2026-04-17 21:27:42');
INSERT INTO `operation_log` VALUES (856, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 59, 1, NULL, '2026-04-17 21:27:42');
INSERT INTO `operation_log` VALUES (857, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 52, 1, NULL, '2026-04-17 21:27:48');
INSERT INTO `operation_log` VALUES (858, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 60, 1, NULL, '2026-04-17 21:27:48');
INSERT INTO `operation_log` VALUES (859, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 20, 1, NULL, '2026-04-17 21:27:49');
INSERT INTO `operation_log` VALUES (860, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 50, 1, NULL, '2026-04-17 21:27:49');
INSERT INTO `operation_log` VALUES (861, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 20, 1, NULL, '2026-04-17 21:27:58');
INSERT INTO `operation_log` VALUES (862, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 20, 1, NULL, '2026-04-17 21:27:59');
INSERT INTO `operation_log` VALUES (863, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:27:59');
INSERT INTO `operation_log` VALUES (864, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 21, 1, NULL, '2026-04-17 21:28:01');
INSERT INTO `operation_log` VALUES (865, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 21:28:22');
INSERT INTO `operation_log` VALUES (866, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 21:28:22');
INSERT INTO `operation_log` VALUES (867, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:28:22');
INSERT INTO `operation_log` VALUES (868, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:28:22');
INSERT INTO `operation_log` VALUES (869, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:28:22');
INSERT INTO `operation_log` VALUES (870, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 21:28:22');
INSERT INTO `operation_log` VALUES (871, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:28:25');
INSERT INTO `operation_log` VALUES (872, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 21:28:27');
INSERT INTO `operation_log` VALUES (873, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 21:28:27');
INSERT INTO `operation_log` VALUES (874, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:35:43');
INSERT INTO `operation_log` VALUES (875, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:35:43');
INSERT INTO `operation_log` VALUES (876, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-17 21:35:43');
INSERT INTO `operation_log` VALUES (877, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 43, 1, NULL, '2026-04-17 21:35:43');
INSERT INTO `operation_log` VALUES (878, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:35:57');
INSERT INTO `operation_log` VALUES (879, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:35:57');
INSERT INTO `operation_log` VALUES (880, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:35:57');
INSERT INTO `operation_log` VALUES (881, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:35:57');
INSERT INTO `operation_log` VALUES (882, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:35:57');
INSERT INTO `operation_log` VALUES (883, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:35:57');
INSERT INTO `operation_log` VALUES (884, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:35:57');
INSERT INTO `operation_log` VALUES (885, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:36:00');
INSERT INTO `operation_log` VALUES (886, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:36:00');
INSERT INTO `operation_log` VALUES (887, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:36:02');
INSERT INTO `operation_log` VALUES (888, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:36:02');
INSERT INTO `operation_log` VALUES (889, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:36:04');
INSERT INTO `operation_log` VALUES (890, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:36:04');
INSERT INTO `operation_log` VALUES (891, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:36:05');
INSERT INTO `operation_log` VALUES (892, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:36:05');
INSERT INTO `operation_log` VALUES (893, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:36:06');
INSERT INTO `operation_log` VALUES (894, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:36:06');
INSERT INTO `operation_log` VALUES (895, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 17, 1, NULL, '2026-04-17 21:36:12');
INSERT INTO `operation_log` VALUES (896, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 21:36:12');
INSERT INTO `operation_log` VALUES (897, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:36:12');
INSERT INTO `operation_log` VALUES (898, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 21:36:12');
INSERT INTO `operation_log` VALUES (899, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-update', 'ProductController.update', '/api/products/4', 'PUT', NULL, '0:0:0:0:0:0:0:1', 24, 1, NULL, '2026-04-17 21:37:30');
INSERT INTO `operation_log` VALUES (900, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 21:37:30');
INSERT INTO `operation_log` VALUES (901, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:39:29');
INSERT INTO `operation_log` VALUES (902, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:39:29');
INSERT INTO `operation_log` VALUES (903, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:39:29');
INSERT INTO `operation_log` VALUES (904, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 21:39:29');
INSERT INTO `operation_log` VALUES (905, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:40:28');
INSERT INTO `operation_log` VALUES (906, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:40:28');
INSERT INTO `operation_log` VALUES (907, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:40:28');
INSERT INTO `operation_log` VALUES (908, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 21:40:28');
INSERT INTO `operation_log` VALUES (909, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 21:40:28');
INSERT INTO `operation_log` VALUES (910, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:40:28');
INSERT INTO `operation_log` VALUES (911, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:40:28');
INSERT INTO `operation_log` VALUES (912, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:40:30');
INSERT INTO `operation_log` VALUES (913, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 21:40:30');
INSERT INTO `operation_log` VALUES (914, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 21:40:32');
INSERT INTO `operation_log` VALUES (915, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 21:40:32');
INSERT INTO `operation_log` VALUES (916, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 21:40:34');
INSERT INTO `operation_log` VALUES (917, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 41, 1, NULL, '2026-04-17 21:40:34');
INSERT INTO `operation_log` VALUES (918, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 21:40:35');
INSERT INTO `operation_log` VALUES (919, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 21:40:35');
INSERT INTO `operation_log` VALUES (920, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 21:40:36');
INSERT INTO `operation_log` VALUES (921, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 21:40:36');
INSERT INTO `operation_log` VALUES (922, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:40:46');
INSERT INTO `operation_log` VALUES (923, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:40:46');
INSERT INTO `operation_log` VALUES (924, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 21:40:46');
INSERT INTO `operation_log` VALUES (925, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 21:40:46');
INSERT INTO `operation_log` VALUES (926, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 21:40:52');
INSERT INTO `operation_log` VALUES (927, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 21:40:52');
INSERT INTO `operation_log` VALUES (928, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:40:52');
INSERT INTO `operation_log` VALUES (929, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 21:40:52');
INSERT INTO `operation_log` VALUES (930, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:40:58');
INSERT INTO `operation_log` VALUES (931, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:40:58');
INSERT INTO `operation_log` VALUES (932, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:40:58');
INSERT INTO `operation_log` VALUES (933, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 21:40:58');
INSERT INTO `operation_log` VALUES (934, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:41:27');
INSERT INTO `operation_log` VALUES (935, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:41:32');
INSERT INTO `operation_log` VALUES (936, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:41:34');
INSERT INTO `operation_log` VALUES (937, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (938, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 30, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (939, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (940, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (941, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (942, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (943, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (944, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (945, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (946, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (947, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (948, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (949, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (950, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (951, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (952, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (953, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:39');
INSERT INTO `operation_log` VALUES (954, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (955, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (956, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (957, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (958, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (959, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (960, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (961, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (962, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (963, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (964, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (965, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (966, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (967, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (968, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (969, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (970, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:41:40');
INSERT INTO `operation_log` VALUES (971, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:41:47');
INSERT INTO `operation_log` VALUES (972, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 21:41:47');
INSERT INTO `operation_log` VALUES (973, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:41:51');
INSERT INTO `operation_log` VALUES (974, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:41:51');
INSERT INTO `operation_log` VALUES (975, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 21:41:51');
INSERT INTO `operation_log` VALUES (976, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 21:41:51');
INSERT INTO `operation_log` VALUES (977, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 21:41:52');
INSERT INTO `operation_log` VALUES (978, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 21:41:52');
INSERT INTO `operation_log` VALUES (979, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:41:53');
INSERT INTO `operation_log` VALUES (980, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 21:41:53');
INSERT INTO `operation_log` VALUES (981, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 21:41:59');
INSERT INTO `operation_log` VALUES (982, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 21:41:59');
INSERT INTO `operation_log` VALUES (983, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 21:42:00');
INSERT INTO `operation_log` VALUES (984, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 21:42:00');
INSERT INTO `operation_log` VALUES (985, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (986, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 29, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (987, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/97', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (988, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/98', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (989, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/99', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (990, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/100', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (991, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/101', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (992, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/102', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (993, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/103', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (994, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/104', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (995, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/105', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (996, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/106', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (997, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/107', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (998, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/108', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (999, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/109', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (1000, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/110', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (1001, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/111', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:02');
INSERT INTO `operation_log` VALUES (1002, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/112', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1003, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/113', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1004, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/114', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1005, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/115', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1006, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/116', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1007, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/117', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1008, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/118', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1009, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/119', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1010, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/120', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1011, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/121', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1012, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/122', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1013, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/123', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1014, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/124', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1015, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/125', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1016, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/126', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1017, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/127', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1018, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/128', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:42:03');
INSERT INTO `operation_log` VALUES (1019, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Member-list', 'MemberController.list', '/api/members', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:42:19');
INSERT INTO `operation_log` VALUES (1020, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:42:34');
INSERT INTO `operation_log` VALUES (1021, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 21:42:34');
INSERT INTO `operation_log` VALUES (1022, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 21:42:39');
INSERT INTO `operation_log` VALUES (1023, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 21:42:39');
INSERT INTO `operation_log` VALUES (1024, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:42:39');
INSERT INTO `operation_log` VALUES (1025, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 21:42:39');
INSERT INTO `operation_log` VALUES (1026, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:43:39');
INSERT INTO `operation_log` VALUES (1027, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:04');
INSERT INTO `operation_log` VALUES (1028, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:04');
INSERT INTO `operation_log` VALUES (1029, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:07');
INSERT INTO `operation_log` VALUES (1030, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:07');
INSERT INTO `operation_log` VALUES (1031, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1032, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 30, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1033, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1034, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1035, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1036, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1037, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1038, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1039, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1040, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1041, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1042, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1043, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1044, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1045, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1046, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1047, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1048, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1049, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1050, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1051, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1052, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1053, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1054, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1055, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1056, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1057, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1058, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1059, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1060, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1061, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1062, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1063, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1064, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:12');
INSERT INTO `operation_log` VALUES (1065, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:44:13');
INSERT INTO `operation_log` VALUES (1066, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1067, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 30, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1068, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1069, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1070, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1071, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1072, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1073, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1074, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1075, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1076, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1077, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1078, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1079, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1080, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1081, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1082, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1083, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1084, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1085, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1086, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1087, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1088, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1089, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1090, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1091, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1092, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1093, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1094, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1095, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:14');
INSERT INTO `operation_log` VALUES (1096, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:44:15');
INSERT INTO `operation_log` VALUES (1097, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:44:15');
INSERT INTO `operation_log` VALUES (1098, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:44:15');
INSERT INTO `operation_log` VALUES (1099, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:44:15');
INSERT INTO `operation_log` VALUES (1100, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:44:16');
INSERT INTO `operation_log` VALUES (1101, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 21:44:16');
INSERT INTO `operation_log` VALUES (1102, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 21:44:34');
INSERT INTO `operation_log` VALUES (1103, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 21:44:34');
INSERT INTO `operation_log` VALUES (1104, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 21:44:35');
INSERT INTO `operation_log` VALUES (1105, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 21:44:35');
INSERT INTO `operation_log` VALUES (1106, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 21:44:35');
INSERT INTO `operation_log` VALUES (1107, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 21:44:35');
INSERT INTO `operation_log` VALUES (1108, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-stockIn', 'InventoryController.stockIn', '/api/inventory/in', 'POST', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:44:43');
INSERT INTO `operation_log` VALUES (1109, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 21:44:43');
INSERT INTO `operation_log` VALUES (1110, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 52, 1, NULL, '2026-04-17 21:44:43');
INSERT INTO `operation_log` VALUES (1111, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 21:44:45');
INSERT INTO `operation_log` VALUES (1112, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1113, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 30, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1114, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1115, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1116, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1117, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1118, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1119, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1120, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1121, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1122, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1123, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1124, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:51');
INSERT INTO `operation_log` VALUES (1125, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1126, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1127, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1128, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1129, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1130, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1131, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1132, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1133, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1134, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1135, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1136, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1137, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1138, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1139, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1140, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1141, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1142, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1143, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1144, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1145, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:45:52');
INSERT INTO `operation_log` VALUES (1146, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-createOrder', 'OrderController.createOrder', '/api/orders', 'POST', NULL, '0:0:0:0:0:0:0:1', 26, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1147, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 28, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1148, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1149, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1150, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1151, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1152, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1153, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1154, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1155, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1156, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1157, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1158, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1159, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1160, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1161, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1162, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1163, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1164, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1165, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1166, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1167, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1168, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1169, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1170, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1171, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1172, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1173, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1174, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1175, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1176, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1177, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1178, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1179, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:15');
INSERT INTO `operation_log` VALUES (1180, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 21:46:18');
INSERT INTO `operation_log` VALUES (1181, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-refundOrder', 'OrderController.refundOrder', '/api/orders/8/refund', 'PUT', NULL, '0:0:0:0:0:0:0:1', 21, 1, NULL, '2026-04-17 21:46:33');
INSERT INTO `operation_log` VALUES (1182, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 21:46:33');
INSERT INTO `operation_log` VALUES (1183, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1184, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 31, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1185, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1186, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/2', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1187, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/3', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1188, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/4', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1189, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/5', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1190, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/6', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1191, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/7', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1192, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/8', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1193, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/9', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1194, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/10', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1195, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/11', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1196, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/12', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1197, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/13', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1198, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/14', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1199, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/15', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1200, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/16', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1201, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/17', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1202, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/18', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1203, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/19', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1204, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/20', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1205, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/21', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1206, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/22', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1207, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/23', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1208, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/24', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1209, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/25', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1210, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/26', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1211, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/27', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1212, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/28', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1213, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/29', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1214, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/30', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1215, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/31', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1216, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/32', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:46:39');
INSERT INTO `operation_log` VALUES (1217, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 21:46:43');
INSERT INTO `operation_log` VALUES (1218, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:47:02');
INSERT INTO `operation_log` VALUES (1219, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 21:47:16');
INSERT INTO `operation_log` VALUES (1220, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 21:47:16');
INSERT INTO `operation_log` VALUES (1221, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:51:54');
INSERT INTO `operation_log` VALUES (1222, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 21:51:54');
INSERT INTO `operation_log` VALUES (1223, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'User-delete', 'UserController.delete', '/api/users/2', 'DELETE', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 21:52:12');
INSERT INTO `operation_log` VALUES (1224, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:52:12');
INSERT INTO `operation_log` VALUES (1225, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'User-delete', 'UserController.delete', '/api/users/3', 'DELETE', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 21:52:14');
INSERT INTO `operation_log` VALUES (1226, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 21:52:14');
INSERT INTO `operation_log` VALUES (1227, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:42');
INSERT INTO `operation_log` VALUES (1228, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:42');
INSERT INTO `operation_log` VALUES (1229, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:42');
INSERT INTO `operation_log` VALUES (1230, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 21:52:42');
INSERT INTO `operation_log` VALUES (1231, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 21:52:42');
INSERT INTO `operation_log` VALUES (1232, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 21:52:42');
INSERT INTO `operation_log` VALUES (1233, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:52:42');
INSERT INTO `operation_log` VALUES (1234, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:42');
INSERT INTO `operation_log` VALUES (1235, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:52:52');
INSERT INTO `operation_log` VALUES (1236, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:52:52');
INSERT INTO `operation_log` VALUES (1237, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:52:52');
INSERT INTO `operation_log` VALUES (1238, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:52:52');
INSERT INTO `operation_log` VALUES (1239, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 21:52:52');
INSERT INTO `operation_log` VALUES (1240, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 21:52:52');
INSERT INTO `operation_log` VALUES (1241, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-17 21:52:56');
INSERT INTO `operation_log` VALUES (1242, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 21:52:56');
INSERT INTO `operation_log` VALUES (1243, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:58');
INSERT INTO `operation_log` VALUES (1244, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 29, 1, NULL, '2026-04-17 21:52:58');
INSERT INTO `operation_log` VALUES (1245, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/97', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:58');
INSERT INTO `operation_log` VALUES (1246, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/98', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1247, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/99', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1248, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/100', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1249, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/101', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1250, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/102', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1251, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/103', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1252, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/104', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1253, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/105', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1254, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/106', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1255, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/107', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1256, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/108', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1257, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/109', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1258, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/110', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1259, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/111', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1260, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/112', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1261, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/113', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1262, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/114', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1263, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/115', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1264, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/116', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1265, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/117', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1266, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/118', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1267, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/119', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1268, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/120', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1269, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/121', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1270, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/122', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1271, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/123', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1272, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/124', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1273, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/125', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1274, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/126', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1275, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/127', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1276, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/128', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:52:59');
INSERT INTO `operation_log` VALUES (1277, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:53:52');
INSERT INTO `operation_log` VALUES (1278, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:53:52');
INSERT INTO `operation_log` VALUES (1279, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:53:52');
INSERT INTO `operation_log` VALUES (1280, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:53:52');
INSERT INTO `operation_log` VALUES (1281, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:53:52');
INSERT INTO `operation_log` VALUES (1282, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:53:52');
INSERT INTO `operation_log` VALUES (1283, 14, 'clerk_tianfu', 'ROLE_CLERK', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:53:52');
INSERT INTO `operation_log` VALUES (1284, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:54:06');
INSERT INTO `operation_log` VALUES (1285, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:54:06');
INSERT INTO `operation_log` VALUES (1286, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:54:06');
INSERT INTO `operation_log` VALUES (1287, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:54:06');
INSERT INTO `operation_log` VALUES (1288, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 21:54:06');
INSERT INTO `operation_log` VALUES (1289, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 21:54:06');
INSERT INTO `operation_log` VALUES (1290, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 21:54:08');
INSERT INTO `operation_log` VALUES (1291, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 21:54:08');
INSERT INTO `operation_log` VALUES (1292, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:05:35');
INSERT INTO `operation_log` VALUES (1293, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 22:05:35');
INSERT INTO `operation_log` VALUES (1294, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:05:35');
INSERT INTO `operation_log` VALUES (1295, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 22:05:35');
INSERT INTO `operation_log` VALUES (1296, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 340, 1, NULL, '2026-04-17 22:23:11');
INSERT INTO `operation_log` VALUES (1297, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 22:23:12');
INSERT INTO `operation_log` VALUES (1298, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 31, 1, NULL, '2026-04-17 22:23:12');
INSERT INTO `operation_log` VALUES (1299, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 20, 1, NULL, '2026-04-17 22:23:12');
INSERT INTO `operation_log` VALUES (1300, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:23:23');
INSERT INTO `operation_log` VALUES (1301, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:23:23');
INSERT INTO `operation_log` VALUES (1302, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 22:23:23');
INSERT INTO `operation_log` VALUES (1303, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 22:23:23');
INSERT INTO `operation_log` VALUES (1304, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-17 22:23:23');
INSERT INTO `operation_log` VALUES (1305, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 22:23:23');
INSERT INTO `operation_log` VALUES (1306, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:23:23');
INSERT INTO `operation_log` VALUES (1307, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-list', 'StoreController.list', '/api/stores', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:23:24');
INSERT INTO `operation_log` VALUES (1308, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:23:25');
INSERT INTO `operation_log` VALUES (1309, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 31, 1, NULL, '2026-04-17 22:23:25');
INSERT INTO `operation_log` VALUES (1310, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:23:59');
INSERT INTO `operation_log` VALUES (1311, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:23:59');
INSERT INTO `operation_log` VALUES (1312, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:23:59');
INSERT INTO `operation_log` VALUES (1313, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:23:59');
INSERT INTO `operation_log` VALUES (1314, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 22:23:59');
INSERT INTO `operation_log` VALUES (1315, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 22:23:59');
INSERT INTO `operation_log` VALUES (1316, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:02');
INSERT INTO `operation_log` VALUES (1317, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 22:24:02');
INSERT INTO `operation_log` VALUES (1318, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:18');
INSERT INTO `operation_log` VALUES (1319, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 48, 1, NULL, '2026-04-17 22:24:18');
INSERT INTO `operation_log` VALUES (1320, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:24:18');
INSERT INTO `operation_log` VALUES (1321, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:18');
INSERT INTO `operation_log` VALUES (1322, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:18');
INSERT INTO `operation_log` VALUES (1323, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:24:18');
INSERT INTO `operation_log` VALUES (1324, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:18');
INSERT INTO `operation_log` VALUES (1325, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1326, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1327, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1328, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1329, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1330, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1331, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1332, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1333, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1334, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1335, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1336, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1337, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1338, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1339, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1340, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1341, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1342, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1343, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1344, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1345, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1346, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1347, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1348, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1349, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1350, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1351, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:19');
INSERT INTO `operation_log` VALUES (1352, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-createOrder', 'OrderController.createOrder', '/api/orders', 'POST', NULL, '0:0:0:0:0:0:0:1', 44, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1353, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1354, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1355, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1356, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1357, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1358, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1359, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1360, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1361, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1362, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1363, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1364, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1365, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1366, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1367, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1368, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1369, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1370, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1371, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1372, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:22');
INSERT INTO `operation_log` VALUES (1373, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1374, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1375, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1376, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1377, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1378, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1379, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1380, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1381, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1382, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1383, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1384, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1385, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:23');
INSERT INTO `operation_log` VALUES (1386, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 19, 1, NULL, '2026-04-17 22:24:31');
INSERT INTO `operation_log` VALUES (1387, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 22:24:31');
INSERT INTO `operation_log` VALUES (1388, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 22:24:31');
INSERT INTO `operation_log` VALUES (1389, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 43, 1, NULL, '2026-04-17 22:24:31');
INSERT INTO `operation_log` VALUES (1390, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:24:32');
INSERT INTO `operation_log` VALUES (1391, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 22:24:32');
INSERT INTO `operation_log` VALUES (1392, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:24:33');
INSERT INTO `operation_log` VALUES (1393, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:24:34');
INSERT INTO `operation_log` VALUES (1394, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:24:34');
INSERT INTO `operation_log` VALUES (1395, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:24:43');
INSERT INTO `operation_log` VALUES (1396, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:06');
INSERT INTO `operation_log` VALUES (1397, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:06');
INSERT INTO `operation_log` VALUES (1398, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:06');
INSERT INTO `operation_log` VALUES (1399, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:25:06');
INSERT INTO `operation_log` VALUES (1400, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:06');
INSERT INTO `operation_log` VALUES (1401, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:25:07');
INSERT INTO `operation_log` VALUES (1402, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:25:07');
INSERT INTO `operation_log` VALUES (1403, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:25:07');
INSERT INTO `operation_log` VALUES (1404, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 22:25:07');
INSERT INTO `operation_log` VALUES (1405, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:25:07');
INSERT INTO `operation_log` VALUES (1406, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 22:25:07');
INSERT INTO `operation_log` VALUES (1407, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:25:08');
INSERT INTO `operation_log` VALUES (1408, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:25:08');
INSERT INTO `operation_log` VALUES (1409, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1410, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1411, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1412, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1413, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1414, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1415, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1416, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1417, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1418, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1419, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1420, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1421, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1422, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1423, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1424, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1425, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1426, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1427, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1428, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1429, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1430, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1431, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1432, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1433, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1434, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1435, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1436, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1437, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1438, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1439, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1440, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1441, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1442, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1443, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:10');
INSERT INTO `operation_log` VALUES (1444, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1445, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1446, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1447, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1448, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1449, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1450, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1451, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1452, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1453, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1454, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1455, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1456, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1457, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1458, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1459, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1460, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1461, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1462, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1463, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1464, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1465, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1466, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1467, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1468, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1469, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1470, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1471, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1472, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1473, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1474, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1475, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:11');
INSERT INTO `operation_log` VALUES (1476, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:12');
INSERT INTO `operation_log` VALUES (1477, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:12');
INSERT INTO `operation_log` VALUES (1478, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1479, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 30, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1480, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1481, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1482, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1483, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1484, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1485, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1486, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1487, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1488, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1489, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1490, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1491, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1492, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1493, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1494, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1495, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1496, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1497, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1498, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1499, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1500, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1501, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1502, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1503, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1504, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:14');
INSERT INTO `operation_log` VALUES (1505, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1506, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1507, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1508, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1509, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1510, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1511, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1512, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1513, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1514, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 29, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1515, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1516, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1517, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1518, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1519, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1520, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1521, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1522, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1523, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1524, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1525, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1526, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1527, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1528, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1529, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1530, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1531, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1532, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1533, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1534, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1535, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1536, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1537, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1538, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1539, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1540, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1541, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1542, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1543, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1544, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1545, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:15');
INSERT INTO `operation_log` VALUES (1546, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:25:16');
INSERT INTO `operation_log` VALUES (1547, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 22:34:33');
INSERT INTO `operation_log` VALUES (1548, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:34:33');
INSERT INTO `operation_log` VALUES (1549, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:34:33');
INSERT INTO `operation_log` VALUES (1550, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 22:34:33');
INSERT INTO `operation_log` VALUES (1551, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 22:34:34');
INSERT INTO `operation_log` VALUES (1552, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:34:34');
INSERT INTO `operation_log` VALUES (1553, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:34:37');
INSERT INTO `operation_log` VALUES (1554, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:34:37');
INSERT INTO `operation_log` VALUES (1555, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 22:34:39');
INSERT INTO `operation_log` VALUES (1556, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 22:34:39');
INSERT INTO `operation_log` VALUES (1557, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:34:46');
INSERT INTO `operation_log` VALUES (1558, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 22:34:46');
INSERT INTO `operation_log` VALUES (1559, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:34:48');
INSERT INTO `operation_log` VALUES (1560, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:34:48');
INSERT INTO `operation_log` VALUES (1561, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:34:56');
INSERT INTO `operation_log` VALUES (1562, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:34:56');
INSERT INTO `operation_log` VALUES (1563, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:34:56');
INSERT INTO `operation_log` VALUES (1564, 11, 'admin_chunxi', 'ROLE_STORE_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:34:56');
INSERT INTO `operation_log` VALUES (1565, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:35:09');
INSERT INTO `operation_log` VALUES (1566, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:35:09');
INSERT INTO `operation_log` VALUES (1567, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:35:09');
INSERT INTO `operation_log` VALUES (1568, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:35:09');
INSERT INTO `operation_log` VALUES (1569, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:35:09');
INSERT INTO `operation_log` VALUES (1570, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:35:09');
INSERT INTO `operation_log` VALUES (1571, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:35:09');
INSERT INTO `operation_log` VALUES (1572, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 22:35:11');
INSERT INTO `operation_log` VALUES (1573, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:35:11');
INSERT INTO `operation_log` VALUES (1574, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:35:14');
INSERT INTO `operation_log` VALUES (1575, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:35:14');
INSERT INTO `operation_log` VALUES (1576, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:35:14');
INSERT INTO `operation_log` VALUES (1577, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:35:14');
INSERT INTO `operation_log` VALUES (1578, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:35:18');
INSERT INTO `operation_log` VALUES (1579, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:35:18');
INSERT INTO `operation_log` VALUES (1580, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:35:18');
INSERT INTO `operation_log` VALUES (1581, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 22:35:18');
INSERT INTO `operation_log` VALUES (1582, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:35:21');
INSERT INTO `operation_log` VALUES (1583, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:35:21');
INSERT INTO `operation_log` VALUES (1584, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 17, 1, NULL, '2026-04-17 22:35:21');
INSERT INTO `operation_log` VALUES (1585, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:35:21');
INSERT INTO `operation_log` VALUES (1586, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:35:25');
INSERT INTO `operation_log` VALUES (1587, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:35:25');
INSERT INTO `operation_log` VALUES (1588, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-stockOut', 'InventoryController.stockOut', '/api/inventory/out', 'POST', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:35:30');
INSERT INTO `operation_log` VALUES (1589, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:35:30');
INSERT INTO `operation_log` VALUES (1590, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 22:35:30');
INSERT INTO `operation_log` VALUES (1591, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:35:33');
INSERT INTO `operation_log` VALUES (1592, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:35:33');
INSERT INTO `operation_log` VALUES (1593, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:35:33');
INSERT INTO `operation_log` VALUES (1594, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:35:33');
INSERT INTO `operation_log` VALUES (1595, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:35:36');
INSERT INTO `operation_log` VALUES (1596, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:35:36');
INSERT INTO `operation_log` VALUES (1597, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:35:36');
INSERT INTO `operation_log` VALUES (1598, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:35:36');
INSERT INTO `operation_log` VALUES (1599, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:35:39');
INSERT INTO `operation_log` VALUES (1600, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:35:39');
INSERT INTO `operation_log` VALUES (1601, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:35:39');
INSERT INTO `operation_log` VALUES (1602, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 22:35:39');
INSERT INTO `operation_log` VALUES (1603, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 22:35:46');
INSERT INTO `operation_log` VALUES (1604, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 41, 1, NULL, '2026-04-17 22:35:46');
INSERT INTO `operation_log` VALUES (1605, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-stockOut', 'InventoryController.stockOut', '/api/inventory/out', 'POST', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-17 22:35:53');
INSERT INTO `operation_log` VALUES (1606, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:35:53');
INSERT INTO `operation_log` VALUES (1607, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:35:53');
INSERT INTO `operation_log` VALUES (1608, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:35:55');
INSERT INTO `operation_log` VALUES (1609, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 22:35:55');
INSERT INTO `operation_log` VALUES (1610, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 22:35:55');
INSERT INTO `operation_log` VALUES (1611, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 22:35:55');
INSERT INTO `operation_log` VALUES (1612, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 22:35:56');
INSERT INTO `operation_log` VALUES (1613, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:35:56');
INSERT INTO `operation_log` VALUES (1614, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:35:58');
INSERT INTO `operation_log` VALUES (1615, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:35:58');
INSERT INTO `operation_log` VALUES (1616, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:35:58');
INSERT INTO `operation_log` VALUES (1617, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 22:35:58');
INSERT INTO `operation_log` VALUES (1618, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:36:00');
INSERT INTO `operation_log` VALUES (1619, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:36:00');
INSERT INTO `operation_log` VALUES (1620, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:36:00');
INSERT INTO `operation_log` VALUES (1621, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:36:00');
INSERT INTO `operation_log` VALUES (1622, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:36:01');
INSERT INTO `operation_log` VALUES (1623, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 22:36:01');
INSERT INTO `operation_log` VALUES (1624, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 22:36:05');
INSERT INTO `operation_log` VALUES (1625, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:36:05');
INSERT INTO `operation_log` VALUES (1626, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-stockIn', 'InventoryController.stockIn', '/api/inventory/in', 'POST', NULL, '0:0:0:0:0:0:0:1', 17, 1, NULL, '2026-04-17 22:36:11');
INSERT INTO `operation_log` VALUES (1627, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:36:11');
INSERT INTO `operation_log` VALUES (1628, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:36:11');
INSERT INTO `operation_log` VALUES (1629, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:36:14');
INSERT INTO `operation_log` VALUES (1630, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:36:14');
INSERT INTO `operation_log` VALUES (1631, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 28, 1, NULL, '2026-04-17 22:36:14');
INSERT INTO `operation_log` VALUES (1632, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 49, 1, NULL, '2026-04-17 22:36:14');
INSERT INTO `operation_log` VALUES (1633, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:36:16');
INSERT INTO `operation_log` VALUES (1634, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:36:16');
INSERT INTO `operation_log` VALUES (1635, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:36:16');
INSERT INTO `operation_log` VALUES (1636, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:36:16');
INSERT INTO `operation_log` VALUES (1637, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:36:33');
INSERT INTO `operation_log` VALUES (1638, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 38, 1, NULL, '2026-04-17 22:36:33');
INSERT INTO `operation_log` VALUES (1639, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:36:43');
INSERT INTO `operation_log` VALUES (1640, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:36:43');
INSERT INTO `operation_log` VALUES (1641, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-stockIn', 'InventoryController.stockIn', '/api/inventory/in', 'POST', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 22:36:47');
INSERT INTO `operation_log` VALUES (1642, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 22:36:47');
INSERT INTO `operation_log` VALUES (1643, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:36:47');
INSERT INTO `operation_log` VALUES (1644, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:36:49');
INSERT INTO `operation_log` VALUES (1645, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:36:49');
INSERT INTO `operation_log` VALUES (1646, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:36:49');
INSERT INTO `operation_log` VALUES (1647, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:36:49');
INSERT INTO `operation_log` VALUES (1648, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:36:51');
INSERT INTO `operation_log` VALUES (1649, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:36:51');
INSERT INTO `operation_log` VALUES (1650, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:36:51');
INSERT INTO `operation_log` VALUES (1651, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:36:51');
INSERT INTO `operation_log` VALUES (1652, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:36:57');
INSERT INTO `operation_log` VALUES (1653, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:36:57');
INSERT INTO `operation_log` VALUES (1654, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:36:57');
INSERT INTO `operation_log` VALUES (1655, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:36:57');
INSERT INTO `operation_log` VALUES (1656, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:37:00');
INSERT INTO `operation_log` VALUES (1657, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:37:00');
INSERT INTO `operation_log` VALUES (1658, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:37:00');
INSERT INTO `operation_log` VALUES (1659, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:37:00');
INSERT INTO `operation_log` VALUES (1660, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 22:37:05');
INSERT INTO `operation_log` VALUES (1661, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:37:05');
INSERT INTO `operation_log` VALUES (1662, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:37:06');
INSERT INTO `operation_log` VALUES (1663, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:37:06');
INSERT INTO `operation_log` VALUES (1664, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:37:07');
INSERT INTO `operation_log` VALUES (1665, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:37:07');
INSERT INTO `operation_log` VALUES (1666, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-17 22:37:07');
INSERT INTO `operation_log` VALUES (1667, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 42, 1, NULL, '2026-04-17 22:37:07');
INSERT INTO `operation_log` VALUES (1668, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:37:10');
INSERT INTO `operation_log` VALUES (1669, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:37:10');
INSERT INTO `operation_log` VALUES (1670, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:37:10');
INSERT INTO `operation_log` VALUES (1671, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:37:10');
INSERT INTO `operation_log` VALUES (1672, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:37:11');
INSERT INTO `operation_log` VALUES (1673, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:37:11');
INSERT INTO `operation_log` VALUES (1674, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:37:11');
INSERT INTO `operation_log` VALUES (1675, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:37:11');
INSERT INTO `operation_log` VALUES (1676, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:37:13');
INSERT INTO `operation_log` VALUES (1677, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:37:13');
INSERT INTO `operation_log` VALUES (1678, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:37:13');
INSERT INTO `operation_log` VALUES (1679, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:37:13');
INSERT INTO `operation_log` VALUES (1680, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:37:15');
INSERT INTO `operation_log` VALUES (1681, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:37:15');
INSERT INTO `operation_log` VALUES (1682, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:37:15');
INSERT INTO `operation_log` VALUES (1683, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:37:15');
INSERT INTO `operation_log` VALUES (1684, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 22:37:17');
INSERT INTO `operation_log` VALUES (1685, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-17 22:37:17');
INSERT INTO `operation_log` VALUES (1686, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 22:37:19');
INSERT INTO `operation_log` VALUES (1687, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-list', 'StoreController.list', '/api/stores', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:37:22');
INSERT INTO `operation_log` VALUES (1688, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:37:23');
INSERT INTO `operation_log` VALUES (1689, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:37:23');
INSERT INTO `operation_log` VALUES (1690, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-17 22:37:24');
INSERT INTO `operation_log` VALUES (1691, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:37:26');
INSERT INTO `operation_log` VALUES (1692, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:37:26');
INSERT INTO `operation_log` VALUES (1693, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 22:37:26');
INSERT INTO `operation_log` VALUES (1694, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:37:28');
INSERT INTO `operation_log` VALUES (1695, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:37:28');
INSERT INTO `operation_log` VALUES (1696, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 22:37:28');
INSERT INTO `operation_log` VALUES (1697, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-17 22:37:29');
INSERT INTO `operation_log` VALUES (1698, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 22:37:29');
INSERT INTO `operation_log` VALUES (1699, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:53:18');
INSERT INTO `operation_log` VALUES (1700, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:53:18');
INSERT INTO `operation_log` VALUES (1701, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:53:18');
INSERT INTO `operation_log` VALUES (1702, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 22:53:18');
INSERT INTO `operation_log` VALUES (1703, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 353, 1, NULL, '2026-04-17 22:54:10');
INSERT INTO `operation_log` VALUES (1704, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-17 22:54:11');
INSERT INTO `operation_log` VALUES (1705, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 45, 1, NULL, '2026-04-17 22:54:11');
INSERT INTO `operation_log` VALUES (1706, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 87, 1, NULL, '2026-04-17 22:54:11');
INSERT INTO `operation_log` VALUES (1707, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:54:15');
INSERT INTO `operation_log` VALUES (1708, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:54:15');
INSERT INTO `operation_log` VALUES (1709, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 25, 1, NULL, '2026-04-17 22:54:15');
INSERT INTO `operation_log` VALUES (1710, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 62, 1, NULL, '2026-04-17 22:54:15');
INSERT INTO `operation_log` VALUES (1711, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:54:18');
INSERT INTO `operation_log` VALUES (1712, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:54:19');
INSERT INTO `operation_log` VALUES (1713, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 24, 1, NULL, '2026-04-17 22:54:19');
INSERT INTO `operation_log` VALUES (1714, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 53, 1, NULL, '2026-04-17 22:54:19');
INSERT INTO `operation_log` VALUES (1715, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 48, 1, NULL, '2026-04-17 22:54:22');
INSERT INTO `operation_log` VALUES (1716, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 54, 1, NULL, '2026-04-17 22:54:22');
INSERT INTO `operation_log` VALUES (1717, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-stockIn', 'InventoryController.stockIn', '/api/inventory/in', 'POST', NULL, '0:0:0:0:0:0:0:1', 23, 1, NULL, '2026-04-17 22:54:28');
INSERT INTO `operation_log` VALUES (1718, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 20, 1, NULL, '2026-04-17 22:54:28');
INSERT INTO `operation_log` VALUES (1719, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 50, 1, NULL, '2026-04-17 22:54:28');
INSERT INTO `operation_log` VALUES (1720, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:54:30');
INSERT INTO `operation_log` VALUES (1721, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:54:30');
INSERT INTO `operation_log` VALUES (1722, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 19, 1, NULL, '2026-04-17 22:54:30');
INSERT INTO `operation_log` VALUES (1723, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 43, 1, NULL, '2026-04-17 22:54:30');
INSERT INTO `operation_log` VALUES (1724, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:54:32');
INSERT INTO `operation_log` VALUES (1725, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:54:32');
INSERT INTO `operation_log` VALUES (1726, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:54:32');
INSERT INTO `operation_log` VALUES (1727, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 57, 1, NULL, '2026-04-17 22:54:32');
INSERT INTO `operation_log` VALUES (1728, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 39, 1, NULL, '2026-04-17 22:54:43');
INSERT INTO `operation_log` VALUES (1729, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 43, 1, NULL, '2026-04-17 22:54:43');
INSERT INTO `operation_log` VALUES (1730, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:54:44');
INSERT INTO `operation_log` VALUES (1731, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 22:54:44');
INSERT INTO `operation_log` VALUES (1732, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:54:44');
INSERT INTO `operation_log` VALUES (1733, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:54:47');
INSERT INTO `operation_log` VALUES (1734, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:54:47');
INSERT INTO `operation_log` VALUES (1735, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 34, 1, NULL, '2026-04-17 22:54:48');
INSERT INTO `operation_log` VALUES (1736, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:54:48');
INSERT INTO `operation_log` VALUES (1737, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-stockIn', 'InventoryController.stockIn', '/api/inventory/in', 'POST', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-17 22:54:53');
INSERT INTO `operation_log` VALUES (1738, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:54:53');
INSERT INTO `operation_log` VALUES (1739, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:54:53');
INSERT INTO `operation_log` VALUES (1740, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:54:54');
INSERT INTO `operation_log` VALUES (1741, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:54:57');
INSERT INTO `operation_log` VALUES (1742, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:54:57');
INSERT INTO `operation_log` VALUES (1743, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:54:57');
INSERT INTO `operation_log` VALUES (1744, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-17 22:55:00');
INSERT INTO `operation_log` VALUES (1745, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:00');
INSERT INTO `operation_log` VALUES (1746, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:55:00');
INSERT INTO `operation_log` VALUES (1747, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:02');
INSERT INTO `operation_log` VALUES (1748, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1749, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 29, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1750, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/34', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1751, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/35', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1752, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/36', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1753, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/37', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1754, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/38', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1755, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/39', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1756, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/40', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1757, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/41', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1758, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/42', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1759, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/43', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1760, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/44', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1761, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/45', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1762, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/46', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1763, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/47', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1764, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/48', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1765, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/49', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1766, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/50', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1767, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/51', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1768, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/52', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1769, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/53', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1770, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/54', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1771, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/55', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1772, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/56', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1773, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/57', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1774, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/58', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1775, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/59', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1776, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/60', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1777, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/61', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1778, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/62', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1779, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/63', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:05');
INSERT INTO `operation_log` VALUES (1780, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/64', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:06');
INSERT INTO `operation_log` VALUES (1781, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getByProductId', 'InventoryController.getByProductId', '/api/inventory/product/65', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:06');
INSERT INTO `operation_log` VALUES (1782, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:55:08');
INSERT INTO `operation_log` VALUES (1783, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:12');
INSERT INTO `operation_log` VALUES (1784, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:12');
INSERT INTO `operation_log` VALUES (1785, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 11, 1, NULL, '2026-04-17 22:55:12');
INSERT INTO `operation_log` VALUES (1786, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:14');
INSERT INTO `operation_log` VALUES (1787, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:14');
INSERT INTO `operation_log` VALUES (1788, 1, 'admin', 'ROLE_SUPER_ADMIN', 3, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:14');
INSERT INTO `operation_log` VALUES (1789, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:19');
INSERT INTO `operation_log` VALUES (1790, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:19');
INSERT INTO `operation_log` VALUES (1791, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:20');
INSERT INTO `operation_log` VALUES (1792, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:20');
INSERT INTO `operation_log` VALUES (1793, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'User-getAllRoles', 'UserController.getAllRoles', '/api/users/roles', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:24');
INSERT INTO `operation_log` VALUES (1794, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'User-list', 'UserController.list', '/api/users', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:55:24');
INSERT INTO `operation_log` VALUES (1795, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-list', 'StoreController.list', '/api/stores', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:28');
INSERT INTO `operation_log` VALUES (1796, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-17 22:55:40');
INSERT INTO `operation_log` VALUES (1797, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:40');
INSERT INTO `operation_log` VALUES (1798, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:55:40');
INSERT INTO `operation_log` VALUES (1799, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:55:40');
INSERT INTO `operation_log` VALUES (1800, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-17 22:55:40');
INSERT INTO `operation_log` VALUES (1801, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:55:40');
INSERT INTO `operation_log` VALUES (1802, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-17 22:58:47');
INSERT INTO `operation_log` VALUES (1803, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-17 22:58:47');
INSERT INTO `operation_log` VALUES (1804, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-17 22:58:48');
INSERT INTO `operation_log` VALUES (1805, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getStatistics', 'InventoryController.getStatistics', '/api/inventory/statistics', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-17 22:58:48');
INSERT INTO `operation_log` VALUES (1806, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 36, 1, NULL, '2026-04-17 22:58:48');
INSERT INTO `operation_log` VALUES (1807, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 40, 1, NULL, '2026-04-17 22:58:48');
INSERT INTO `operation_log` VALUES (1808, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-17 22:58:49');
INSERT INTO `operation_log` VALUES (1809, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-list', 'InventoryController.list', '/api/inventory', 'GET', NULL, '0:0:0:0:0:0:0:1', 37, 1, NULL, '2026-04-17 22:58:49');
INSERT INTO `operation_log` VALUES (1810, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getRecords', 'InventoryController.getRecords', '/api/inventory/records', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-17 22:58:49');
INSERT INTO `operation_log` VALUES (1811, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-17 22:58:50');
INSERT INTO `operation_log` VALUES (1812, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Member-list', 'MemberController.list', '/api/members', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-17 22:58:51');
INSERT INTO `operation_log` VALUES (1813, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 362, 1, NULL, '2026-04-18 00:21:46');
INSERT INTO `operation_log` VALUES (1814, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 00:21:47');
INSERT INTO `operation_log` VALUES (1815, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 00:21:47');
INSERT INTO `operation_log` VALUES (1816, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-18 00:21:47');
INSERT INTO `operation_log` VALUES (1817, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 00:21:47');
INSERT INTO `operation_log` VALUES (1818, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-18 00:21:47');
INSERT INTO `operation_log` VALUES (1819, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-18 00:21:47');
INSERT INTO `operation_log` VALUES (1820, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 00:21:47');
INSERT INTO `operation_log` VALUES (1821, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 00:21:49');
INSERT INTO `operation_log` VALUES (1822, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-18 00:21:49');
INSERT INTO `operation_log` VALUES (1823, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:22:17');
INSERT INTO `operation_log` VALUES (1824, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 00:22:17');
INSERT INTO `operation_log` VALUES (1825, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 00:22:17');
INSERT INTO `operation_log` VALUES (1826, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 25, 1, NULL, '2026-04-18 00:22:17');
INSERT INTO `operation_log` VALUES (1827, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 00:22:23');
INSERT INTO `operation_log` VALUES (1828, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 00:22:23');
INSERT INTO `operation_log` VALUES (1829, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 00:22:23');
INSERT INTO `operation_log` VALUES (1830, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 00:22:23');
INSERT INTO `operation_log` VALUES (1831, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 00:22:25');
INSERT INTO `operation_log` VALUES (1832, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:22:25');
INSERT INTO `operation_log` VALUES (1833, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:22:25');
INSERT INTO `operation_log` VALUES (1834, 1, 'admin', 'ROLE_SUPER_ADMIN', 2, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:22:25');
INSERT INTO `operation_log` VALUES (1835, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 00:22:27');
INSERT INTO `operation_log` VALUES (1836, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-18 00:22:27');
INSERT INTO `operation_log` VALUES (1837, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:22:27');
INSERT INTO `operation_log` VALUES (1838, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:22:27');
INSERT INTO `operation_log` VALUES (1839, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:22:27');
INSERT INTO `operation_log` VALUES (1840, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:22:27');
INSERT INTO `operation_log` VALUES (1841, NULL, NULL, NULL, NULL, 'MiniUser-login', 'MiniUserController.login', '/api/mini/login', 'POST', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 00:23:12');
INSERT INTO `operation_log` VALUES (1842, 1, '13900139001', 'member', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-18 00:23:14');
INSERT INTO `operation_log` VALUES (1843, 1, '13900139001', 'member', NULL, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-18 00:23:26');
INSERT INTO `operation_log` VALUES (1844, 1, '13900139001', 'member', NULL, 'ReservationOrder-list', 'ReservationOrderController.list', '/api/reservation-order/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 00:23:34');
INSERT INTO `operation_log` VALUES (1845, 1, '13900139001', 'member', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 00:23:57');
INSERT INTO `operation_log` VALUES (1846, NULL, NULL, NULL, NULL, 'MiniUser-login', 'MiniUserController.login', '/api/mini/login', 'POST', NULL, '0:0:0:0:0:0:0:1', 5, 0, '密码错误', '2026-04-18 00:24:24');
INSERT INTO `operation_log` VALUES (1847, NULL, NULL, NULL, NULL, 'MiniUser-login', 'MiniUserController.login', '/api/mini/login', 'POST', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 00:24:29');
INSERT INTO `operation_log` VALUES (1848, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 00:24:30');
INSERT INTO `operation_log` VALUES (1849, 1, '14366547634', 'regular_user', NULL, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:24:35');
INSERT INTO `operation_log` VALUES (1850, 1, '14366547634', 'regular_user', NULL, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 00:24:39');
INSERT INTO `operation_log` VALUES (1851, 1, '14366547634', 'regular_user', NULL, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:26:38');
INSERT INTO `operation_log` VALUES (1852, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:30:11');
INSERT INTO `operation_log` VALUES (1853, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-18 00:50:37');
INSERT INTO `operation_log` VALUES (1854, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 00:51:23');
INSERT INTO `operation_log` VALUES (1855, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 00:51:41');
INSERT INTO `operation_log` VALUES (1856, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 00:52:10');
INSERT INTO `operation_log` VALUES (1857, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:52:26');
INSERT INTO `operation_log` VALUES (1858, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 00:53:21');
INSERT INTO `operation_log` VALUES (1859, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 00:55:33');
INSERT INTO `operation_log` VALUES (1860, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 00:55:57');
INSERT INTO `operation_log` VALUES (1861, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 00:58:54');
INSERT INTO `operation_log` VALUES (1862, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 00:58:54');
INSERT INTO `operation_log` VALUES (1863, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 00:58:57');
INSERT INTO `operation_log` VALUES (1864, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:58:59');
INSERT INTO `operation_log` VALUES (1865, 1, '14366547634', 'regular_user', NULL, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 00:59:00');
INSERT INTO `operation_log` VALUES (1866, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 00:59:03');
INSERT INTO `operation_log` VALUES (1867, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:18:12');
INSERT INTO `operation_log` VALUES (1868, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:18:21');
INSERT INTO `operation_log` VALUES (1869, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-18 01:19:18');
INSERT INTO `operation_log` VALUES (1870, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:19:18');
INSERT INTO `operation_log` VALUES (1871, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:19:33');
INSERT INTO `operation_log` VALUES (1872, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 01:21:28');
INSERT INTO `operation_log` VALUES (1873, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:21:31');
INSERT INTO `operation_log` VALUES (1874, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 2, 1, NULL, '2026-04-18 01:21:31');
INSERT INTO `operation_log` VALUES (1875, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:25:06');
INSERT INTO `operation_log` VALUES (1876, 1, '14366547634', 'regular_user', NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:25:21');
INSERT INTO `operation_log` VALUES (1877, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:25:23');
INSERT INTO `operation_log` VALUES (1878, 1, '14366547634', 'regular_user', NULL, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:25:23');
INSERT INTO `operation_log` VALUES (1879, 1, '14366547634', 'regular_user', 2, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 409, 1, NULL, '2026-04-18 01:28:59');
INSERT INTO `operation_log` VALUES (1880, 1, '14366547634', 'regular_user', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:29:06');
INSERT INTO `operation_log` VALUES (1881, 1, '14366547634', 'regular_user', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:29:06');
INSERT INTO `operation_log` VALUES (1882, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 30, 1, NULL, '2026-04-18 01:29:06');
INSERT INTO `operation_log` VALUES (1883, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 22, 1, NULL, '2026-04-18 01:29:06');
INSERT INTO `operation_log` VALUES (1884, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 21, 1, NULL, '2026-04-18 01:29:12');
INSERT INTO `operation_log` VALUES (1885, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 17, 1, NULL, '2026-04-18 01:29:13');
INSERT INTO `operation_log` VALUES (1886, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 17, 1, NULL, '2026-04-18 01:29:13');
INSERT INTO `operation_log` VALUES (1887, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 01:29:14');
INSERT INTO `operation_log` VALUES (1888, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-18 01:29:15');
INSERT INTO `operation_log` VALUES (1889, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 01:29:16');
INSERT INTO `operation_log` VALUES (1890, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 01:29:16');
INSERT INTO `operation_log` VALUES (1891, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 01:29:17');
INSERT INTO `operation_log` VALUES (1892, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-18 01:29:17');
INSERT INTO `operation_log` VALUES (1893, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 01:29:17');
INSERT INTO `operation_log` VALUES (1894, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:30:04');
INSERT INTO `operation_log` VALUES (1895, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:30:04');
INSERT INTO `operation_log` VALUES (1896, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:30:04');
INSERT INTO `operation_log` VALUES (1897, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:30:04');
INSERT INTO `operation_log` VALUES (1898, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:30:04');
INSERT INTO `operation_log` VALUES (1899, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:30:04');
INSERT INTO `operation_log` VALUES (1900, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 01:30:05');
INSERT INTO `operation_log` VALUES (1901, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:30:05');
INSERT INTO `operation_log` VALUES (1902, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:30:05');
INSERT INTO `operation_log` VALUES (1903, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:30:05');
INSERT INTO `operation_log` VALUES (1904, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:30:05');
INSERT INTO `operation_log` VALUES (1905, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:30:05');
INSERT INTO `operation_log` VALUES (1906, 1, '14366547634', 'regular_user', 2, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 439, 1, NULL, '2026-04-18 01:30:26');
INSERT INTO `operation_log` VALUES (1907, 1, '14366547634', 'regular_user', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:30:28');
INSERT INTO `operation_log` VALUES (1908, 1, '14366547634', 'regular_user', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:30:28');
INSERT INTO `operation_log` VALUES (1909, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 32, 1, NULL, '2026-04-18 01:30:28');
INSERT INTO `operation_log` VALUES (1910, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 22, 1, NULL, '2026-04-18 01:30:28');
INSERT INTO `operation_log` VALUES (1911, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 20, 1, NULL, '2026-04-18 01:30:31');
INSERT INTO `operation_log` VALUES (1912, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 17, 1, NULL, '2026-04-18 01:30:32');
INSERT INTO `operation_log` VALUES (1913, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 17, 1, NULL, '2026-04-18 01:30:33');
INSERT INTO `operation_log` VALUES (1914, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-18 01:31:16');
INSERT INTO `operation_log` VALUES (1915, 1, '14366547634', 'regular_user', 2, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:31:18');
INSERT INTO `operation_log` VALUES (1916, 1, '14366547634', 'regular_user', 1, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:33:21');
INSERT INTO `operation_log` VALUES (1917, 1, '14366547634', 'regular_user', 1, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:33:45');
INSERT INTO `operation_log` VALUES (1918, 1, '14366547634', 'regular_user', 1, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:34:10');
INSERT INTO `operation_log` VALUES (1919, 1, '14366547634', 'regular_user', 1, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 403, 1, NULL, '2026-04-18 01:35:13');
INSERT INTO `operation_log` VALUES (1920, 1, '14366547634', 'regular_user', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-18 01:35:18');
INSERT INTO `operation_log` VALUES (1921, 1, '14366547634', 'regular_user', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 01:35:18');
INSERT INTO `operation_log` VALUES (1922, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-18 01:35:18');
INSERT INTO `operation_log` VALUES (1923, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 28, 1, NULL, '2026-04-18 01:35:18');
INSERT INTO `operation_log` VALUES (1924, 1, '14366547634', 'regular_user', 1, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:35:21');
INSERT INTO `operation_log` VALUES (1925, 1, '14366547634', 'regular_user', 2, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:35:27');
INSERT INTO `operation_log` VALUES (1926, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:35:33');
INSERT INTO `operation_log` VALUES (1927, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:35:34');
INSERT INTO `operation_log` VALUES (1928, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:35:35');
INSERT INTO `operation_log` VALUES (1929, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:35:36');
INSERT INTO `operation_log` VALUES (1930, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:35:36');
INSERT INTO `operation_log` VALUES (1931, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:35:37');
INSERT INTO `operation_log` VALUES (1932, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:35:37');
INSERT INTO `operation_log` VALUES (1933, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:35:38');
INSERT INTO `operation_log` VALUES (1934, 1, '14366547634', 'regular_user', 3, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:35:39');
INSERT INTO `operation_log` VALUES (1935, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:35:42');
INSERT INTO `operation_log` VALUES (1936, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:35:43');
INSERT INTO `operation_log` VALUES (1937, 1, '14366547634', 'regular_user', 2, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:35:44');
INSERT INTO `operation_log` VALUES (1938, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 01:35:46');
INSERT INTO `operation_log` VALUES (1939, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 01:35:47');
INSERT INTO `operation_log` VALUES (1940, 1, '14366547634', 'regular_user', 1, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 354, 1, NULL, '2026-04-18 01:40:53');
INSERT INTO `operation_log` VALUES (1941, 1, '14366547634', 'regular_user', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:40:55');
INSERT INTO `operation_log` VALUES (1942, 1, '14366547634', 'regular_user', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:40:55');
INSERT INTO `operation_log` VALUES (1943, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 32, 1, NULL, '2026-04-18 01:40:55');
INSERT INTO `operation_log` VALUES (1944, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 24, 1, NULL, '2026-04-18 01:40:55');
INSERT INTO `operation_log` VALUES (1945, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-18 01:40:57');
INSERT INTO `operation_log` VALUES (1946, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-18 01:40:58');
INSERT INTO `operation_log` VALUES (1947, 1, '14366547634', 'regular_user', 1, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:40:59');
INSERT INTO `operation_log` VALUES (1948, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:41:02');
INSERT INTO `operation_log` VALUES (1949, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:41:03');
INSERT INTO `operation_log` VALUES (1950, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:41:05');
INSERT INTO `operation_log` VALUES (1951, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:41:06');
INSERT INTO `operation_log` VALUES (1952, 1, '14366547634', 'regular_user', 2, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:42:49');
INSERT INTO `operation_log` VALUES (1953, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:43:44');
INSERT INTO `operation_log` VALUES (1954, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:43:45');
INSERT INTO `operation_log` VALUES (1955, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:43:46');
INSERT INTO `operation_log` VALUES (1956, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:43:47');
INSERT INTO `operation_log` VALUES (1957, 1, '14366547634', 'regular_user', 3, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:44:00');
INSERT INTO `operation_log` VALUES (1958, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:44:04');
INSERT INTO `operation_log` VALUES (1959, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:44:05');
INSERT INTO `operation_log` VALUES (1960, 1, '14366547634', 'regular_user', 2, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 01:46:52');
INSERT INTO `operation_log` VALUES (1961, 1, '14366547634', 'regular_user', 2, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:47:22');
INSERT INTO `operation_log` VALUES (1962, 1, '14366547634', 'regular_user', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 01:47:26');
INSERT INTO `operation_log` VALUES (1963, 1, '14366547634', 'regular_user', 2, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:47:26');
INSERT INTO `operation_log` VALUES (1964, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 24, 1, NULL, '2026-04-18 01:47:26');
INSERT INTO `operation_log` VALUES (1965, 1, '14366547634', 'regular_user', 2, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 01:47:26');
INSERT INTO `operation_log` VALUES (1966, 1, '14366547634', 'regular_user', 2, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:47:29');
INSERT INTO `operation_log` VALUES (1967, 1, '14366547634', 'regular_user', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 01:47:31');
INSERT INTO `operation_log` VALUES (1968, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 01:47:31');
INSERT INTO `operation_log` VALUES (1969, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 01:47:33');
INSERT INTO `operation_log` VALUES (1970, 1, '14366547634', 'regular_user', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 01:47:33');
INSERT INTO `operation_log` VALUES (1971, 1, '14366547634', 'regular_user', 1, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-18 01:47:35');
INSERT INTO `operation_log` VALUES (1972, 1, '14366547634', 'regular_user', 3, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 01:47:37');
INSERT INTO `operation_log` VALUES (1973, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 01:47:37');
INSERT INTO `operation_log` VALUES (1974, 1, '14366547634', 'regular_user', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 13, 1, NULL, '2026-04-18 01:47:38');
INSERT INTO `operation_log` VALUES (1975, NULL, NULL, NULL, NULL, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 1, 1, NULL, '2026-04-18 11:31:22');
INSERT INTO `operation_log` VALUES (1976, NULL, NULL, NULL, NULL, 'MiniUser-login', 'MiniUserController.login', '/api/mini/login', 'POST', NULL, '0:0:0:0:0:0:0:1', 69, 1, NULL, '2026-04-18 11:34:12');
INSERT INTO `operation_log` VALUES (1977, 1, '13900139001', 'member', 3, 'MiniUser-getUserInfo', 'MiniUserController.getUserInfo', '/api/mini/user-info', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-18 11:34:13');
INSERT INTO `operation_log` VALUES (1978, 1, '13900139001', 'member', 3, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 11:34:18');
INSERT INTO `operation_log` VALUES (1979, 1, '13900139001', 'member', 3, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 11:34:18');
INSERT INTO `operation_log` VALUES (1980, 1, '13900139001', 'member', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 35, 1, NULL, '2026-04-18 11:34:18');
INSERT INTO `operation_log` VALUES (1981, 1, '13900139001', 'member', 3, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 21, 1, NULL, '2026-04-18 11:34:18');
INSERT INTO `operation_log` VALUES (1982, 1, '13900139001', 'member', 3, 'Store-getAllStores', 'StoreController.getAllStores', '/api/stores/all', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-18 11:34:21');
INSERT INTO `operation_log` VALUES (1983, 1, '13900139001', 'member', 1, 'ProductCategory-getAllCategories', 'ProductCategoryController.getAllCategories', '/api/categories', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 11:34:23');
INSERT INTO `operation_log` VALUES (1984, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-18 11:34:23');
INSERT INTO `operation_log` VALUES (1985, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 20, 1, NULL, '2026-04-18 11:34:27');
INSERT INTO `operation_log` VALUES (1986, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-18 11:34:28');
INSERT INTO `operation_log` VALUES (1987, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 11:34:28');
INSERT INTO `operation_log` VALUES (1988, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 11:34:29');
INSERT INTO `operation_log` VALUES (1989, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 16, 1, NULL, '2026-04-18 11:34:30');
INSERT INTO `operation_log` VALUES (1990, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-18 11:34:30');
INSERT INTO `operation_log` VALUES (1991, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 15, 1, NULL, '2026-04-18 11:34:31');
INSERT INTO `operation_log` VALUES (1992, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 19, 1, NULL, '2026-04-18 11:34:31');
INSERT INTO `operation_log` VALUES (1993, 1, '13900139001', 'member', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 14, 1, NULL, '2026-04-18 11:34:34');
INSERT INTO `operation_log` VALUES (1994, 1, '13900139001', 'member', 1, 'ReservationOrder-create', 'ReservationOrderController.create', '/api/reservation-order/create', 'POST', NULL, '0:0:0:0:0:0:0:1', 60, 1, NULL, '2026-04-18 11:35:02');
INSERT INTO `operation_log` VALUES (1995, 1, '13900139001', 'member', 1, 'ReservationOrder-list', 'ReservationOrderController.list', '/api/reservation-order/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 12, 1, NULL, '2026-04-18 11:35:04');
INSERT INTO `operation_log` VALUES (1996, 1, '13900139001', 'member', 1, 'ReservationOrder-getById', 'ReservationOrderController.getById', '/api/reservation-order/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-18 11:35:09');
INSERT INTO `operation_log` VALUES (1997, 1, '13900139001', 'member', 1, 'ReservationOrder-list', 'ReservationOrderController.list', '/api/reservation-order/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-18 11:35:14');
INSERT INTO `operation_log` VALUES (1998, 1, '13900139001', 'member', 1, 'ReservationOrder-list', 'ReservationOrderController.list', '/api/reservation-order/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 11:35:18');
INSERT INTO `operation_log` VALUES (1999, 1, 'admin', 'ROLE_SUPER_ADMIN', NULL, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 11:35:48');
INSERT INTO `operation_log` VALUES (2000, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-getMyStores', 'StoreController.getMyStores', '/api/stores/my', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 11:35:48');
INSERT INTO `operation_log` VALUES (2001, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-getTodaySalesAmount', 'OrderController.getTodaySalesAmount', '/api/orders/today/sales', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-18 11:35:48');
INSERT INTO `operation_log` VALUES (2002, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-getTodayOrderCount', 'OrderController.getTodayOrderCount', '/api/orders/today/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-18 11:35:48');
INSERT INTO `operation_log` VALUES (2003, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Inventory-getLowStockAlerts', 'InventoryController.getLowStockAlerts', '/api/inventory/alerts', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-18 11:35:48');
INSERT INTO `operation_log` VALUES (2004, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Order-list', 'OrderController.list', '/api/orders', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-18 11:35:48');
INSERT INTO `operation_log` VALUES (2005, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Product-list', 'ProductController.list', '/api/products', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-18 11:35:48');
INSERT INTO `operation_log` VALUES (2006, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Member-getCount', 'MemberController.getCount', '/api/members/count', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 11:35:48');
INSERT INTO `operation_log` VALUES (2007, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Store-list', 'StoreController.list', '/api/stores', 'GET', NULL, '0:0:0:0:0:0:0:1', 6, 1, NULL, '2026-04-18 11:35:50');
INSERT INTO `operation_log` VALUES (2008, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-18 11:35:56');
INSERT INTO `operation_log` VALUES (2009, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 11:35:56');
INSERT INTO `operation_log` VALUES (2010, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 4, 1, NULL, '2026-04-18 11:35:56');
INSERT INTO `operation_log` VALUES (2011, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 10, 1, NULL, '2026-04-18 11:35:56');
INSERT INTO `operation_log` VALUES (2012, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminCancel', 'ReservationOrderController.adminCancel', '/api/reservation-order/admin/1/cancel', 'PUT', NULL, '0:0:0:0:0:0:0:1', 33, 1, NULL, '2026-04-18 11:36:35');
INSERT INTO `operation_log` VALUES (2013, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 8, 1, NULL, '2026-04-18 11:36:35');
INSERT INTO `operation_log` VALUES (2014, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 11:36:35');
INSERT INTO `operation_log` VALUES (2015, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 3, 1, NULL, '2026-04-18 11:36:35');
INSERT INTO `operation_log` VALUES (2016, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'ReservationOrder-adminList', 'ReservationOrderController.adminList', '/api/reservation-order/admin/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 5, 1, NULL, '2026-04-18 11:36:35');
INSERT INTO `operation_log` VALUES (2017, 1, '13900139001', 'member', 1, 'ReservationOrder-getById', 'ReservationOrderController.getById', '/api/reservation-order/1', 'GET', NULL, '0:0:0:0:0:0:0:1', 7, 1, NULL, '2026-04-18 11:36:42');
INSERT INTO `operation_log` VALUES (2018, 1, '13900139001', 'member', 1, 'ReservationOrder-list', 'ReservationOrderController.list', '/api/reservation-order/list', 'GET', NULL, '0:0:0:0:0:0:0:1', 9, 1, NULL, '2026-04-18 11:36:47');
INSERT INTO `operation_log` VALUES (2019, 1, 'admin', 'ROLE_SUPER_ADMIN', 1, 'Member-list', 'MemberController.list', '/api/members', 'GET', NULL, '0:0:0:0:0:0:0:1', 18, 1, NULL, '2026-04-18 11:38:24');

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
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '商品表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 1, '竹·童', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/5eed5603-364f-40ef-994a-5b07d71249a8.png', '抹茶、芝士、柠檬风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:44:27');
INSERT INTO `product` VALUES (2, 1, '热带雨林', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/037f08c4-12a8-4e6e-964e-bd693f561531.png', '香草、芒果、百香果、椰子风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:42:42');
INSERT INTO `product` VALUES (3, 1, '日不落', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/baea3602-3e96-4ec8-88db-2ea8d39d14e0.png', '桂花乌龙、香橙风味', 1, '2026-03-27 20:13:15', '2026-03-27 21:43:15');
INSERT INTO `product` VALUES (4, 1, '巴斯克芝士蛋糕', 1, 20.00, 8.40, '个', 1, 'http://localhost:8081/images/products/bd2280af-6c24-4130-b7db-7d02028c79ce.png', '芝士、柠檬风味', 1, '2026-03-27 20:13:15', '2026-04-17 21:37:29');
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '小程序预约订单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation_order
-- ----------------------------
INSERT INTO `reservation_order` VALUES (1, 1, 'RS20260418810692', 1, 2, 23.00, 0.00, 0.00, 3, '2026-04-18 10:00:00', '', '2026-04-18 11:35:02', '2026-04-18 11:36:35');

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '预约订单明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation_order_item
-- ----------------------------
INSERT INTO `reservation_order_item` VALUES (1, 1, 1, 5, '开心果 KIRI 巴斯克', 23.00, 1, 23.00, '2026-04-18 11:35:02');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sale_order` VALUES (8, 1, 'ORD01202604174725', NULL, 10.00, 0.00, 10.00, 0.00, 2, 1, 4, 1, ' | 退款原因：用户申请退款', 1, '2026-04-17 21:46:15', '2026-04-17 21:46:33');
INSERT INTO `sale_order` VALUES (9, 2, 'ORD02202604175893', NULL, 76.00, 0.00, 76.00, 0.00, 2, 1, 1, 1, '', 11, '2026-04-17 22:24:22', '2026-04-17 22:24:22');

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
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '订单明细表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sale_order_item` VALUES (35, 1, 8, 10, '猪肉脯四叶草', 10.00, 1, 10.00, '2026-04-17 21:46:15');
INSERT INTO `sale_order_item` VALUES (36, 2, 9, 34, '竹·童', 38.00, 1, 38.00, '2026-04-17 22:24:22');
INSERT INTO `sale_order_item` VALUES (37, 2, 9, 35, '热带雨林', 38.00, 1, 38.00, '2026-04-17 22:24:22');

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
