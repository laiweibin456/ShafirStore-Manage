/*
 ============================================
  ShafirStore 多店铺系统 - 补充缺失数据脚本
 ============================================
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- =============================================
-- 1. 为春熙店(store_id=2)复制商品
-- =============================================

INSERT INTO `product` (`store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 2, p.`name`, 
       (SELECT pc2.id FROM `product_category` pc2 WHERE pc2.store_id = 2 AND pc2.name = pc.name LIMIT 1),
       p.`price`, p.`cost_price`, p.`unit`, p.`shelf_life_days`, p.`image_url`, p.`description`, p.`status`, NOW(), NOW()
FROM `product` p
JOIN `product_category` pc ON p.category_id = pc.id AND pc.store_id = 1
WHERE p.store_id = 1;

-- =============================================
-- 2. 为天府店(store_id=3)复制商品
-- =============================================

INSERT INTO `product` (`store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT 3, p.`name`,
       (SELECT pc2.id FROM `product_category` pc2 WHERE pc2.store_id = 3 AND pc2.name = pc.name LIMIT 1),
       p.`price`, p.`cost_price`, p.`unit`, p.`shelf_life_days`, p.`image_url`, p.`description`, p.`status`, NOW(), NOW()
FROM `product` p
JOIN `product_category` pc ON p.category_id = pc.id AND pc.store_id = 1
WHERE p.store_id = 1;

-- =============================================
-- 3. 为春熙店(store_id=2)初始化库存
-- =============================================

INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `alert_threshold`, `create_time`, `update_time`)
SELECT 2, p.id, 50, 10, NOW(), NOW() FROM `product` p WHERE p.store_id = 2;

-- =============================================
-- 4. 为天府店(store_id=3)初始化库存
-- =============================================

INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `alert_threshold`, `create_time`, `update_time`)
SELECT 3, p.id, 50, 10, NOW(), NOW() FROM `product` p WHERE p.store_id = 3;

-- =============================================
-- 5. 为春熙店(store_id=2)复制会员等级
-- =============================================

INSERT INTO `member_level` (`store_id`, `name`, `level`, `discount`, `min_amount`, `points_rate`, `status`, `create_time`)
SELECT 2, ml.`name`, ml.`level`, ml.`discount`, ml.`min_amount`, ml.`points_rate`, ml.`status`, NOW() FROM `member_level` ml WHERE ml.`store_id` = 1;

-- =============================================
-- 6. 为天府店(store_id=3)复制会员等级
-- =============================================

INSERT INTO `member_level` (`store_id`, `name`, `level`, `discount`, `min_amount`, `points_rate`, `status`, `create_time`)
SELECT 3, ml.`name`, ml.`level`, ml.`discount`, ml.`min_amount`, ml.`points_rate`, ml.`status`, NOW() FROM `member_level` ml WHERE ml.`store_id` = 1;

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
