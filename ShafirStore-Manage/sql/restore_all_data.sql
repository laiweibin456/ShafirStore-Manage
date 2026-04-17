/*
 ============================================
  ShafirStore 多店铺系统 - 完整数据恢复脚本
  执行时间：2026-04-17
  
  此脚本会：
  1. 检查并恢复总店商品数据
  2. 为春熙店和天府店复制商品
  3. 初始化所有店铺的库存
  4. 初始化所有店铺的会员等级
 ============================================
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =============================================
-- 0. 先查看当前商品数量
-- =============================================
SELECT '当前商品数量:' AS info;
SELECT store_id, COUNT(*) AS cnt FROM product GROUP BY store_id;

-- =============================================
-- 1. 确保总店有商品数据（如果丢失则重新插入）
-- =============================================

-- 检查总店是否有商品，如果没有则插入
INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 1, 1, '竹·童', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/5eed5603-364f-40ef-994a-5b07d71249a8.png', '抹茶、芝士、柠檬风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 1);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 2, 1, '热带雨林', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/037f08c4-12a8-4e6e-964e-bd693f561531.png', '香草、芒果、百香果、椰子风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 2);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 3, 1, '日不落', 1, 38.00, 15.20, '个', 1, 'http://localhost:8081/images/products/baea3602-3e96-4ec8-88db-2ea8d39d14e0.png', '桂花乌龙、香橙风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 3);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 4, 1, '巴斯克芝士蛋糕', 1, 21.00, 8.40, '个', 1, 'http://localhost:8081/images/products/bd2280af-6c24-4130-b7db-7d02028c79ce.png', '芝士、柠檬风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 4);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 5, 1, '开心果 KIRI 巴斯克', 1, 23.00, 9.20, '个', 1, 'http://localhost:8081/images/products/c3f412ed-640e-4fe8-a08f-e3226dcbc067.png', '芝士、开心果风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 5);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 6, 1, '玫瑰乳酪海盐卷', 2, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/c1ddc88e-85df-476c-9b3e-287e4ffd9fe9.png', '玫瑰乳酪风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 6);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 7, 1, '咖啡酥皮海盐卷', 2, 12.00, 4.80, '个', 1, 'http://localhost:8081/images/products/6210e986-8351-4ac8-81b3-92203bb6d12a.png', '咖啡风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 7);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 8, 1, '双重黑巧海盐卷', 2, 13.00, 5.20, '个', 1, 'http://localhost:8081/images/products/a2d198a8-03cf-4dd8-b78a-755b8d245ea7.png', '黑巧克力风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 8);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 9, 1, '全麦海盐卷', 2, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/c3321f33-8d0b-4c89-942f-fd8d2b59be91.png', '全麦风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 9);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 10, 1, '猪肉脯四叶草', 2, 10.00, 4.00, '个', 1, 'http://localhost:8081/images/products/a6cef250-fb4c-4c3e-8ef6-a84a0da6075a.png', '猪肉脯风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 10);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 11, 1, '夏威夷可可脆片', 3, 20.00, 8.00, '罐', 30, '', '夏威夷果、可可风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 11);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 12, 1, '芝士脆条', 3, 15.00, 6.00, '罐', 30, NULL, '芝士风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 12);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 13, 1, '蜂蜜吐司条', 3, 10.00, 4.00, '袋', 30, NULL, '蜂蜜风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 13);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 14, 1, '坚果挞', 3, 11.00, 4.40, '个', 30, NULL, '混合坚果风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 14);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 15, 1, '全麦碧根果蔓越莓司康', 3, 10.00, 4.00, '个', 30, NULL, '全麦、碧根果、蔓越莓风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 15);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 16, 1, '原味 Kiri 巴斯克蛋糕', 4, 178.00, 71.20, '6 寸', 1, NULL, '原味 Kiri 巴斯克风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 16);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 17, 1, '黑松露西班牙火腿巴斯克', 4, 198.00, 79.20, '6 寸', 1, NULL, '黑松露、西班牙火腿风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 17);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 18, 1, '开心果 kiri 巴斯克蛋糕', 4, 198.00, 79.20, '6 寸', 1, NULL, '开心果、Kiri 芝士风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 18);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 19, 1, '蓝莓花', 4, 178.00, 71.20, '6 寸', 1, NULL, '蓝莓风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 19);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 20, 1, '奥利奥生巧巴斯克', 4, 198.00, 79.20, '6 寸', 1, NULL, '奥利奥、生巧克力风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 20);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 21, 1, '美式咖啡 (冰/热)', 5, 16.00, 6.40, '杯', 1, NULL, '经典美式风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 21);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 22, 1, '澳白', 5, 19.00, 7.60, '杯', 1, NULL, '澳白咖啡风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 22);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 23, 1, '拿铁', 5, 20.00, 8.00, '杯', 1, NULL, '经典拿铁风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 23);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 24, 1, '燕麦拿铁', 5, 25.00, 10.00, '杯', 1, NULL, '燕麦奶、咖啡风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 24);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 25, 1, '鸭屎香柠檬茶', 5, 18.00, 7.20, '杯', 1, NULL, '鸭屎香茶底、柠檬风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 25);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 26, 1, '香草栗子马卡龙', 6, 12.00, 4.80, '个', 7, NULL, '香草、栗子风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 26);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 27, 1, '抹茶马卡龙', 6, 12.00, 4.80, '个', 7, NULL, '抹茶风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 27);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 28, 1, '蓝莓马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '蓝莓风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 28);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 29, 1, '海盐焦糖马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '海盐、焦糖风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 29);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 30, 1, '荔枝草莓马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '荔枝、草莓风味', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 30);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 31, 1, '手工曲奇礼盒', 7, 68.00, 28.00, '盒', 30, NULL, '多种口味手工曲奇，精美礼盒包装', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 31);

INSERT INTO `product` (`id`, `store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 32, 1, '定制生日牌', 7, 8.00, 3.00, '个', 365, NULL, '可定制生日祝福蜡烛牌', 1, NOW(), NOW() FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `product` WHERE `id` = 32);

-- =============================================
-- 2. 为春熙店复制商品（使用新的ID，避免冲突）
-- =============================================

INSERT INTO `product` (`store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 2, p.`name`, 
       (SELECT pc2.id FROM `product_category` pc2 WHERE pc2.store_id = 2 AND pc2.name = pc.name LIMIT 1),
       p.`price`, p.`cost_price`, p.`unit`, p.`shelf_life_days`, p.`image_url`, p.`description`, p.`status`, NOW(), NOW()
FROM `product` p
JOIN `product_category` pc ON p.category_id = pc.id AND pc.store_id = 1
WHERE p.store_id = 1
AND NOT EXISTS (
    SELECT 1 FROM `product` p2 WHERE p2.store_id = 2 AND p2.name = p.name
);

-- =============================================
-- 3. 为天府店复制商品
-- =============================================

INSERT INTO `product` (`store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 3, p.`name`,
       (SELECT pc2.id FROM `product_category` pc2 WHERE pc2.store_id = 3 AND pc2.name = pc.name LIMIT 1),
       p.`price`, p.`cost_price`, p.`unit`, p.`shelf_life_days`, p.`image_url`, p.`description`, p.`status`, NOW(), NOW()
FROM `product` p
JOIN `product_category` pc ON p.category_id = pc.id AND pc.store_id = 1
WHERE p.store_id = 1
AND NOT EXISTS (
    SELECT 1 FROM `product` p3 WHERE p3.store_id = 3 AND p3.name = p.name
);

-- =============================================
-- 4. 为春熙店初始化库存
-- =============================================

INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `alert_threshold`, `create_time`, `update_time`)
SELECT 2, p.id, 50, 10, NOW(), NOW() 
FROM `product` p 
WHERE p.store_id = 2
AND NOT EXISTS (
    SELECT 1 FROM `inventory` i WHERE i.store_id = 2 AND i.product_id = p.id
);

-- =============================================
-- 5. 为天府店初始化库存
-- =============================================

INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `alert_threshold`, `create_time`, `update_time`)
SELECT 3, p.id, 50, 10, NOW(), NOW() 
FROM `product` p 
WHERE p.store_id = 3
AND NOT EXISTS (
    SELECT 1 FROM `inventory` i WHERE i.store_id = 3 AND i.product_id = p.id
);

-- =============================================
-- 6. 为总店初始化库存（如果缺失）
-- =============================================

INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `alert_threshold`, `create_time`, `update_time`)
SELECT 1, p.id, 50, 10, NOW(), NOW() 
FROM `product` p 
WHERE p.store_id = 1
AND NOT EXISTS (
    SELECT 1 FROM `inventory` i WHERE i.store_id = 1 AND i.product_id = p.id
);

-- =============================================
-- 7. 为春熙店复制会员等级
-- =============================================

INSERT INTO `member_level` (`store_id`, `name`, `level`, `discount`, `min_amount`, `points_rate`, `status`, `create_time`)
SELECT 2, ml.`name`, ml.`level`, ml.`discount`, ml.`min_amount`, ml.`points_rate`, ml.`status`, NOW() 
FROM `member_level` ml 
WHERE ml.`store_id` = 1
AND NOT EXISTS (
    SELECT 1 FROM `member_level` ml2 WHERE ml2.store_id = 2 AND ml2.name = ml.name
);

-- =============================================
-- 8. 为天府店复制会员等级
-- =============================================

INSERT INTO `member_level` (`store_id`, `name`, `level`, `discount`, `min_amount`, `points_rate`, `status`, `create_time`)
SELECT 3, ml.`name`, ml.`level`, ml.`discount`, ml.`min_amount`, ml.`points_rate`, ml.`status`, NOW() 
FROM `member_level` ml 
WHERE ml.`store_id` = 1
AND NOT EXISTS (
    SELECT 1 FROM `member_level` ml3 WHERE ml3.store_id = 3 AND ml3.name = ml.name
);

SET FOREIGN_KEY_CHECKS = 1;

-- =============================================
-- 验证查询
-- =============================================

SELECT '=== 各店铺商品数量 ===' AS info;
SELECT st.store_name, COUNT(p.id) AS product_count
FROM store st LEFT JOIN product p ON st.id = p.store_id
GROUP BY st.id, st.store_name;

SELECT '=== 各店铺库存数量 ===' AS info;
SELECT st.store_name, COUNT(i.id) AS inventory_count
FROM store st LEFT JOIN inventory i ON st.id = i.store_id
GROUP BY st.id, st.store_name;

SELECT '=== 各店铺会员等级数量 ===' AS info;
SELECT st.store_name, COUNT(ml.id) AS level_count
FROM store st LEFT JOIN member_level ml ON st.id = ml.store_id
GROUP BY st.id, st.store_name;
