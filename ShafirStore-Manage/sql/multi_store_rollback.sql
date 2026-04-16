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
 Description: 多店铺改造数据库回滚脚本
 WARNING: 执行此脚本将撤销所有多店铺改造的数据库变更，请谨慎操作！
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ============================================
-- 第一部分：回滚角色体系变更
-- ============================================

-- 恢复管理员角色
UPDATE `sys_role` SET 
    `role_key` = 'ROLE_ADMIN',
    `role_name` = '店长',
    `description` = '拥有全部权限',
    `store_id` = NULL
WHERE `role_key` = 'ROLE_STORE_ADMIN';

-- 恢复店员角色
UPDATE `sys_role` SET 
    `description` = '拥有基础操作权限',
    `store_id` = NULL
WHERE `role_key` = 'ROLE_CLERK';

-- 删除超级管理员角色
DELETE FROM `sys_role` WHERE `role_key` = 'ROLE_SUPER_ADMIN';

-- 恢复管理员用户的角色关联
UPDATE `sys_user` SET `role_id` = (SELECT `id` FROM `sys_role` WHERE `role_key` = 'ROLE_ADMIN')
WHERE `username` = 'admin';

-- ============================================
-- 第二部分：删除新增表
-- ============================================

DROP TABLE IF EXISTS `store_daily_summary`;
DROP TABLE IF EXISTS `sys_user_store_rel`;
DROP TABLE IF EXISTS `member_store_rel`;
DROP TABLE IF EXISTS `store`;

-- ============================================
-- 第三部分：删除 store_id 字段和索引
-- ============================================

-- 1. product_category
DROP INDEX `idx_pc_store_id` ON `product_category`;
ALTER TABLE `product_category` DROP COLUMN `store_id`;

-- 2. product
DROP INDEX `idx_product_store_category` ON `product`;
DROP INDEX `idx_product_store_id` ON `product`;
ALTER TABLE `product` DROP COLUMN `store_id`;

-- 3. inventory (需恢复原唯一索引)
DROP INDEX `uk_inventory_store_product` ON `inventory`;
DROP INDEX `idx_inventory_store_id` ON `inventory`;
CREATE UNIQUE INDEX `product_id` ON `inventory`(`product_id`) USING BTREE;
ALTER TABLE `inventory` DROP COLUMN `store_id`;

-- 4. inventory_record
DROP INDEX `idx_ir_store_time` ON `inventory_record`;
DROP INDEX `idx_ir_store_id` ON `inventory_record`;
ALTER TABLE `inventory_record` DROP COLUMN `store_id`;

-- 5. sale_order
DROP INDEX `idx_so_store_status` ON `sale_order`;
DROP INDEX `idx_so_store_time` ON `sale_order`;
DROP INDEX `idx_so_store_id` ON `sale_order`;
ALTER TABLE `sale_order` DROP COLUMN `store_id`;

-- 6. sale_order_item
DROP INDEX `idx_soi_store_product` ON `sale_order_item`;
DROP INDEX `idx_soi_store_id` ON `sale_order_item`;
ALTER TABLE `sale_order_item` DROP COLUMN `store_id`;

-- 7. member_level
DROP INDEX `idx_ml_store_id` ON `member_level`;
ALTER TABLE `member_level` DROP COLUMN `store_id`;

-- 8. member_points_record
DROP INDEX `idx_mpr_store_id` ON `member_points_record`;
ALTER TABLE `member_points_record` DROP COLUMN `store_id`;

-- 9. reservation_order
DROP INDEX `idx_ro_store_status` ON `reservation_order`;
DROP INDEX `idx_ro_store_id` ON `reservation_order`;
ALTER TABLE `reservation_order` DROP COLUMN `store_id`;

-- 10. reservation_order_item
DROP INDEX `idx_roi_store_id` ON `reservation_order_item`;
ALTER TABLE `reservation_order_item` DROP COLUMN `store_id`;

-- 11. sys_role
DROP INDEX `idx_role_store_id` ON `sys_role`;
ALTER TABLE `sys_role` DROP COLUMN `store_id`;

-- 12. sys_user
DROP INDEX `idx_user_store_id` ON `sys_user`;
ALTER TABLE `sys_user` DROP COLUMN `store_id`;

-- 13. operation_log
DROP INDEX `idx_ol_store_id` ON `operation_log`;
ALTER TABLE `operation_log` DROP COLUMN `store_id`;

-- ============================================
-- 第四部分：验证回滚结果
-- ============================================

SELECT 'product_category' AS tbl, COUNT(*) AS cnt FROM product_category
UNION ALL SELECT 'product', COUNT(*) FROM product
UNION ALL SELECT 'inventory', COUNT(*) FROM inventory
UNION ALL SELECT 'inventory_record', COUNT(*) FROM inventory_record
UNION ALL SELECT 'sale_order', COUNT(*) FROM sale_order
UNION ALL SELECT 'sale_order_item', COUNT(*) FROM sale_order_item
UNION ALL SELECT 'member', COUNT(*) FROM member
UNION ALL SELECT 'member_level', COUNT(*) FROM member_level
UNION ALL SELECT 'member_points_record', COUNT(*) FROM member_points_record
UNION ALL SELECT 'sys_user', COUNT(*) FROM sys_user
UNION ALL SELECT 'sys_role', COUNT(*) FROM sys_role;

SET FOREIGN_KEY_CHECKS = 1;

-- 回滚完成提示
SELECT '回滚完成！所有多店铺相关的数据库变更已撤销。' AS message;
