-- ============================================
-- 莎菲尔菓子门店管理系统 商品数据更新 SQL
-- 更新内容：7 个商品分类 + 32 个商品数据
-- ============================================

USE shafir_store;

-- ============================================
-- 1. 更新商品分类数据（7 个分类）
-- ============================================
-- 先清空现有分类
DELETE FROM product_category WHERE id > 0;

INSERT INTO product_category (id, name, sort_order, status, create_time, update_time) VALUES
(1, '法式甜点', 1, 1, NOW(), NOW()),
(2, '欧式面包', 2, 1, NOW(), NOW()),
(3, '常温蛋糕', 3, 1, NOW(), NOW()),
(4, '生日蛋糕', 4, 1, NOW(), NOW()),
(5, '饮品', 5, 1, NOW(), NOW()),
(6, '马卡龙', 6, 1, NOW(), NOW()),
(7, '其他', 7, 1, NOW(), NOW());

-- ============================================
-- 2. 更新商品数据
-- ============================================
-- 先清空现有商品
DELETE FROM product WHERE id > 0;

-- 法式甜点 (分类 ID: 1)
INSERT INTO product (id, name, category_id, price, cost_price, unit, shelf_life_days, image_url, description, status, create_time, update_time) VALUES
(1, '竹·童', 1, 38.00, 15.20, '个', 1, NULL, '抹茶、芝士、柠檬风味', 1, NOW(), NOW()),
(2, '热带雨林', 1, 38.00, 15.20, '个', 1, NULL, '香草、芒果、百香果、椰子风味', 1, NOW(), NOW()),
(3, '日不落', 1, 38.00, 15.20, '个', 1, NULL, '桂花乌龙、香橙风味', 1, NOW(), NOW()),
(4, '巴斯克芝士蛋糕', 1, 21.00, 8.40, '个', 1, NULL, '芝士、柠檬风味', 1, NOW(), NOW()),
(5, '开心果 KIRI 巴斯克', 1, 23.00, 9.20, '个', 1, NULL, '芝士、开心果风味', 1, NOW(), NOW());

-- 欧式面包 (分类 ID: 2)
INSERT INTO product (id, name, category_id, price, cost_price, unit, shelf_life_days, image_url, description, status, create_time, update_time) VALUES
(6, '玫瑰乳酪海盐卷', 2, 10.00, 4.00, '个', 1, NULL, '玫瑰乳酪风味', 1, NOW(), NOW()),
(7, '咖啡酥皮海盐卷', 2, 12.00, 4.80, '个', 1, NULL, '咖啡风味', 1, NOW(), NOW()),
(8, '双重黑巧海盐卷', 2, 13.00, 5.20, '个', 1, NULL, '黑巧克力风味', 1, NOW(), NOW()),
(9, '全麦海盐卷', 2, 10.00, 4.00, '个', 1, NULL, '全麦风味', 1, NOW(), NOW()),
(10, '猪肉脯四叶草', 2, 10.00, 4.00, '个', 1, NULL, '猪肉脯风味', 1, NOW(), NOW());

-- 常温蛋糕 (分类 ID: 3)
INSERT INTO product (id, name, category_id, price, cost_price, unit, shelf_life_days, image_url, description, status, create_time, update_time) VALUES
(11, '夏威夷可可脆片', 3, 20.00, 8.00, '罐', 30, NULL, '夏威夷果、可可风味', 1, NOW(), NOW()),
(12, '芝士脆条', 3, 15.00, 6.00, '罐', 30, NULL, '芝士风味', 1, NOW(), NOW()),
(13, '蜂蜜吐司条', 3, 10.00, 4.00, '袋', 30, NULL, '蜂蜜风味', 1, NOW(), NOW()),
(14, '坚果挞', 3, 11.00, 4.40, '个', 30, NULL, '混合坚果风味', 1, NOW(), NOW()),
(15, '全麦碧根果蔓越莓司康', 3, 10.00, 4.00, '个', 30, NULL, '全麦、碧根果、蔓越莓风味', 1, NOW(), NOW());

-- 生日蛋糕 (分类 ID: 4)
INSERT INTO product (id, name, category_id, price, cost_price, unit, shelf_life_days, image_url, description, status, create_time, update_time) VALUES
(16, '原味 Kiri 巴斯克蛋糕', 4, 178.00, 71.20, '6 寸', 1, NULL, '原味 Kiri 巴斯克风味', 1, NOW(), NOW()),
(17, '黑松露西班牙火腿巴斯克', 4, 198.00, 79.20, '6 寸', 1, NULL, '黑松露、西班牙火腿风味', 1, NOW(), NOW()),
(18, '开心果 kiri 巴斯克蛋糕', 4, 198.00, 79.20, '6 寸', 1, NULL, '开心果、Kiri 芝士风味', 1, NOW(), NOW()),
(19, '蓝莓花', 4, 178.00, 71.20, '6 寸', 1, NULL, '蓝莓风味', 1, NOW(), NOW()),
(20, '奥利奥生巧巴斯克', 4, 198.00, 79.20, '6 寸', 1, NULL, '奥利奥、生巧克力风味', 1, NOW(), NOW());

-- 饮品 (分类 ID: 5)
INSERT INTO product (id, name, category_id, price, cost_price, unit, shelf_life_days, image_url, description, status, create_time, update_time) VALUES
(21, '美式咖啡 (冰/热)', 5, 16.00, 6.40, '杯', 1, NULL, '经典美式风味', 1, NOW(), NOW()),
(22, '澳白', 5, 19.00, 7.60, '杯', 1, NULL, '澳白咖啡风味', 1, NOW(), NOW()),
(23, '拿铁', 5, 20.00, 8.00, '杯', 1, NULL, '经典拿铁风味', 1, NOW(), NOW()),
(24, '燕麦拿铁', 5, 25.00, 10.00, '杯', 1, NULL, '燕麦奶、咖啡风味', 1, NOW(), NOW()),
(25, '鸭屎香柠檬茶', 5, 18.00, 7.20, '杯', 1, NULL, '鸭屎香茶底、柠檬风味', 1, NOW(), NOW());

-- 马卡龙 (分类 ID: 6)
INSERT INTO product (id, name, category_id, price, cost_price, unit, shelf_life_days, image_url, description, status, create_time, update_time) VALUES
(26, '香草栗子马卡龙', 6, 12.00, 4.80, '个', 7, NULL, '香草、栗子风味', 1, NOW(), NOW()),
(27, '抹茶马卡龙', 6, 12.00, 4.80, '个', 7, NULL, '抹茶风味', 1, NOW(), NOW()),
(28, '蓝莓马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '蓝莓风味', 1, NOW(), NOW()),
(29, '海盐焦糖马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '海盐、焦糖风味', 1, NOW(), NOW()),
(30, '荔枝草莓马卡龙', 6, 13.00, 5.20, '个', 7, NULL, '荔枝、草莓风味', 1, NOW(), NOW());

-- 其他 (分类 ID: 7)
INSERT INTO product (id, name, category_id, price, cost_price, unit, shelf_life_days, image_url, description, status, create_time, update_time) VALUES
(31, '手工曲奇礼盒', 7, 68.00, 28.00, '盒', 30, NULL, '多种口味手工曲奇，精美礼盒包装', 1, NOW(), NOW()),
(32, '定制生日牌', 7, 8.00, 3.00, '个', 365, NULL, '可定制生日祝福蜡烛牌', 1, NOW(), NOW());

-- ============================================
-- 3. 重新初始化库存数据
-- ============================================
-- 先清空现有库存
DELETE FROM inventory WHERE id > 0;

INSERT INTO inventory (product_id, quantity, alert_threshold, create_time, update_time)
SELECT id, 50, 10, NOW(), NOW() FROM product;

-- ============================================
-- 4. 验证数据
-- ============================================
SELECT '数据更新完成！' AS message;

SELECT '=== 商品分类 ===' AS '';
SELECT id, name, sort_order, status FROM product_category ORDER BY sort_order;

SELECT '=== 商品数量统计 ===' AS '';
SELECT pc.name AS '分类', COUNT(p.id) AS '商品数量'
FROM product_category pc
LEFT JOIN product p ON pc.id = p.category_id
GROUP BY pc.id, pc.name
ORDER BY pc.sort_order;

SELECT '=== 总商品数 ===' AS '';
SELECT COUNT(*) AS '总商品数' FROM product;
