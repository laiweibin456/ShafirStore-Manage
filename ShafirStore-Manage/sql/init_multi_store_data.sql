/*
 ============================================
  ShafirStore 多店铺系统 - 多店铺数据初始化脚本（简化版）
  执行时间：2026-04-17
  适用数据库：shafir_store (MySQL 8.0+)
  
  密码统一为 BCrypt 加密的 123456
  请先执行 fix_current_db.sql 修复基础数据
 ============================================
*/

SET NAMES utf8mb4;

-- =============================================
-- 1. 更新店铺信息
-- =============================================

UPDATE `store` SET `store_code` = 'STORE001', `store_name` = '莎菲尔菓子(总店)', 
       `address` = '成都市武侯区', `phone` = '028-88888888', `business_hours` = '09:00-21:00'
WHERE `id` = 1;

INSERT INTO `store` (`id`, `store_name`, `store_code`, `address`, `phone`, `business_hours`, `status`)
VALUES (2, '莎菲尔菓子(春熙店)', 'STORE002', '成都市锦江区春熙路88号', '028-66666666', '09:00-22:00', 1)
ON DUPLICATE KEY UPDATE `store_name` = '莎菲尔菓子(春熙店)';

INSERT INTO `store` (`id`, `store_name`, `store_code`, `address`, `phone`, `business_hours`, `status`)
VALUES (3, '莎菲尔菓子(天府店)', 'STORE003', '成都市高新区天府大道999号', '028-77777777', '10:00-21:30', 1)
ON DUPLICATE KEY UPDATE `store_name` = '莎菲尔菓子(天府店)';


-- =============================================
-- 2. 创建店铺管理员和店员账号
-- =============================================

-- 总店管理员（修改已有账号）
UPDATE `sys_user` SET `store_id` = 1, `username` = 'admin_zongdian', `real_name` = '总店管理员', `role_id` = 5 
WHERE `id` = 9;

-- 春熙店管理员
INSERT INTO `sys_user` (`id`, `store_id`, `username`, `password`, `real_name`, `phone`, `role_id`, `status`)
VALUES (11, 2, 'admin_chunxi', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKt6Z5EH', '春熙店管理员', '13800000003', 5, 1)
ON DUPLICATE KEY UPDATE `store_id` = 2, `role_id` = 5;

-- 天府店管理员
INSERT INTO `sys_user` (`id`, `store_id`, `username`, `password`, `real_name`, `phone`, `role_id`, `status`)
VALUES (12, 3, 'admin_tianfu', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKt6Z5EH', '天府店管理员', '13800000004', 5, 1)
ON DUPLICATE KEY UPDATE `store_id` = 3, `role_id` = 5;

-- 总店店员（修改已有账号）
UPDATE `sys_user` SET `store_id` = 1, `username` = 'clerk_zongdian', `real_name` = '总店店员', `role_id` = 6 
WHERE `id` = 10;

-- 春熙店店员
INSERT INTO `sys_user` (`id`, `store_id`, `username`, `password`, `real_name`, `phone`, `role_id`, `status`)
VALUES (13, 2, 'clerk_chunxi', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKt6Z5EH', '春熙店店员', '13800000005', 6, 1)
ON DUPLICATE KEY UPDATE `store_id` = 2, `role_id` = 6;

-- 天府店店员
INSERT INTO `sys_user` (`id`, `store_id`, `username`, `password`, `real_name`, `phone`, `role_id`, `status`)
VALUES (14, 3, 'clerk_tianfu', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKt6Z5EH', '天府店店员', '13800000006', 6, 1)
ON DUPLICATE KEY UPDATE `store_id` = 3, `role_id` = 6;

-- 修复旧用户归属
UPDATE `sys_user` SET `store_id` = 1 WHERE `id` IN (2, 3);


-- =============================================
-- 3. 建立用户-店铺关联
-- =============================================

-- 先删除可能存在的重复记录
DELETE FROM `sys_user_store_rel` WHERE `user_id` IN (9, 10, 11, 12, 13, 14, 2, 3);

-- 重新插入关联
INSERT INTO `sys_user_store_rel` (`user_id`, `store_id`, `create_time`) VALUES
(9, 1, NOW()),
(10, 1, NOW()),
(11, 2, NOW()),
(12, 3, NOW()),
(13, 2, NOW()),
(14, 3, NOW()),
(2, 1, NOW()),
(3, 1, NOW());


-- =============================================
-- 4. 为新店铺复制商品分类
-- =============================================

-- 先删除可能存在的旧数据
DELETE FROM `product_category` WHERE `store_id` IN (2, 3);

-- 复制分类
INSERT INTO `product_category` (`store_id`, `name`, `sort_order`, `status`, `create_time`, `update_time`)
SELECT 2, `name`, `sort_order`, `status`, NOW(), NOW() FROM `product_category` WHERE `store_id` = 1;

INSERT INTO `product_category` (`store_id`, `name`, `sort_order`, `status`, `create_time`, `update_time`)
SELECT 3, `name`, `sort_order`, `status`, NOW(), NOW() FROM `product_category` WHERE `store_id` = 1;


-- =============================================
-- 5. 为新店铺复制商品
-- =============================================

DELETE FROM `product` WHERE `store_id` IN (2, 3);

INSERT INTO `product` (`store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 2, `name`, 
       (SELECT pc2.id FROM `product_category` pc2 WHERE pc2.store_id = 2 AND pc2.name = pc.name LIMIT 1),
       `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, NOW(), NOW()
FROM `product` p
JOIN `product_category` pc ON p.category_id = pc.id AND pc.store_id = 1
WHERE p.store_id = 1;

INSERT INTO `product` (`store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 3, `name`,
       (SELECT pc2.id FROM `product_category` pc2 WHERE pc2.store_id = 3 AND pc2.name = pc.name LIMIT 1),
       `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, NOW(), NOW()
FROM `product` p
JOIN `product_category` pc ON p.category_id = pc.id AND pc.store_id = 1
WHERE p.store_id = 1;


-- =============================================
-- 6. 为新店铺初始化库存
-- =============================================

DELETE FROM `inventory` WHERE `store_id` IN (2, 3);

INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `alert_threshold`, `create_time`, `update_time`)
SELECT 2, p.id, 50, 10, NOW(), NOW() FROM `product` p WHERE p.store_id = 2;

INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `alert_threshold`, `create_time`, `update_time`)
SELECT 3, p.id, 50, 10, NOW(), NOW() FROM `product` p WHERE p.store_id = 3;


-- =============================================
-- 7. 为新店铺初始化会员等级
-- =============================================

DELETE FROM `member_level` WHERE `store_id` IN (2, 3);

INSERT INTO `member_level` (`store_id`, `name`, `level`, `discount`, `min_amount`, `points_rate`, `status`, `create_time`)
SELECT 2, `name`, `level`, `discount`, `min_amount`, `points_rate`, `status`, NOW() FROM `member_level` WHERE `store_id` = 1;

INSERT INTO `member_level` (`store_id`, `name`, `level`, `discount`, `min_amount`, `points_rate`, `status`, `create_time`)
SELECT 3, `name`, `level`, `discount`, `min_amount`, `points_rate`, `status`, NOW() FROM `member_level` WHERE `store_id` = 1;


-- =============================================
-- 验证查询
-- =============================================

SELECT '=== 店铺列表 ===' AS info;
SELECT id, store_name, store_code FROM store ORDER BY id;

SELECT '=== 用户列表 ===' AS info;
SELECT u.id, u.username, u.real_name, u.store_id, r.role_name
FROM sys_user u LEFT JOIN sys_role r ON u.role_id = r.id
WHERE u.deleted = 0 ORDER BY u.id;

SELECT '=== 用户-店铺关联 ===' AS info;
SELECT u.username, s.store_id, st.store_name
FROM sys_user u
JOIN sys_user_store_rel s ON u.id = s.user_id
JOIN store st ON s.store_id = st.id
WHERE u.deleted = 0 ORDER BY s.store_id;

SELECT '=== 各店铺商品数量 ===' AS info;
SELECT st.store_name, COUNT(p.id) AS product_count
FROM store st LEFT JOIN product p ON st.id = p.store_id
GROUP BY st.id;

SELECT '=== 各店铺库存数量 ===' AS info;
SELECT st.store_name, COUNT(i.id) AS inventory_count
FROM store st LEFT JOIN inventory i ON st.id = i.store_id
GROUP BY st.id;
