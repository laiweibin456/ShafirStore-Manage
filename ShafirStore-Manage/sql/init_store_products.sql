-- 初始化各店铺的商品、分类、库存数据
-- 确保每个店铺都有独立的完整商品体系

-- ========================================
-- 1. 为 store_id=2 (春熙店) 复制分类
-- ========================================
INSERT INTO `product_category` (`id`, `store_id`, `name`, `sort_order`, `status`, `create_time`, `update_time`)
SELECT NULL, 2, name, sort_order, status, NOW(), NOW()
FROM `product_category`
WHERE `store_id` = 1;

-- ========================================
-- 2. 为 store_id=3 (天府店) 复制分类
-- ========================================
INSERT INTO `product_category` (`id`, `store_id`, `name`, `sort_order`, `status`, `create_time`, `update_time`)
SELECT NULL, 3, name, sort_order, status, NOW(), NOW()
FROM `product_category`
WHERE `store_id` = 1;

-- ========================================
-- 3. 为 store_id=2 (春熙店) 复制商品（关联新分类ID）
-- ========================================
INSERT INTO `product` (`store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT
    2,
    p.name,
    pc_new.id,
    p.price,
    p.cost_price,
    p.unit,
    p.shelf_life_days,
    p.image_url,
    p.description,
    p.status,
    NOW(),
    NOW()
FROM `product` p
JOIN `product_category` pc_old ON p.category_id = pc_old.id AND pc_old.store_id = 1
JOIN `product_category` pc_new ON pc_new.name = pc_old.name AND pc_new.store_id = 2
WHERE p.store_id = 1;

-- ========================================
-- 4. 为 store_id=3 (天府店) 复制商品（关联新分类ID）
-- ========================================
INSERT INTO `product` (`store_id`, `name`, `category_id`, `price`, `cost_price`, `unit`, `shelf_life_days`, `image_url`, `description`, `status`, `create_time`, `update_time`)
SELECT
    3,
    p.name,
    pc_new.id,
    p.price,
    p.cost_price,
    p.unit,
    p.shelf_life_days,
    p.image_url,
    p.description,
    p.status,
    NOW(),
    NOW()
FROM `product` p
JOIN `product_category` pc_old ON p.category_id = pc_old.id AND pc_old.store_id = 1
JOIN `product_category` pc_new ON pc_new.name = pc_old.name AND pc_new.store_id = 3
WHERE p.store_id = 1;

-- ========================================
-- 5. 为 store_id=2 (春熙店) 复制库存（不同库存量）
-- ========================================
INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `min_quantity`, `max_quantity`, `unit_cost`, `status`)
SELECT
    2,
    p_new.id,
    CASE
        WHEN p_new.category_id IN (SELECT id FROM product_category WHERE store_id=2 AND name='法式甜点') THEN FLOOR(RAND() * 10 + 8)
        WHEN p_new.category_id IN (SELECT id FROM product_category WHERE store_id=2 AND name='欧式面包') THEN FLOOR(RAND() * 30 + 25)
        WHEN p_new.category_id IN (SELECT id FROM product_category WHERE store_id=2 AND name='常温蛋糕') THEN FLOOR(RAND() * 40 + 35)
        WHEN p_new.category_id IN (SELECT id FROM product_category WHERE store_id=2 AND name='生日蛋糕') THEN FLOOR(RAND() * 6 + 3)
        ELSE FLOOR(RAND() * 15 + 10)
    END,
    5,
    100,
    i.unit_cost,
    1
FROM `inventory` i
JOIN `product` p_old ON i.product_id = p_old.id AND p_old.store_id = 1
JOIN `product` p_new ON p_new.name = p_old.name AND p_new.store_id = 2
WHERE i.store_id = 1;

-- ========================================
-- 6. 为 store_id=3 (天府店) 复制库存（不同库存量）
-- ========================================
INSERT INTO `inventory` (`store_id`, `product_id`, `quantity`, `min_quantity`, `max_quantity`, `unit_cost`, `status`)
SELECT
    3,
    p_new.id,
    CASE
        WHEN p_new.category_id IN (SELECT id FROM product_category WHERE store_id=3 AND name='法式甜点') THEN FLOOR(RAND() * 12 + 5)
        WHEN p_new.category_id IN (SELECT id FROM product_category WHERE store_id=3 AND name='欧式面包') THEN FLOOR(RAND() * 20 + 18)
        WHEN p_new.category_id IN (SELECT id FROM product_category WHERE store_id=3 AND name='常温蛋糕') THEN FLOOR(RAND() * 50 + 28)
        WHEN p_new.category_id IN (SELECT id FROM product_category WHERE store_id=3 AND name='生日蛋糕') THEN FLOOR(RAND() * 4 + 2)
        ELSE FLOOR(RAND() * 18 + 7)
    END,
    5,
    100,
    i.unit_cost,
    1
FROM `inventory` i
JOIN `product` p_old ON i.product_id = p_old.id AND p_old.store_id = 1
JOIN `product` p_new ON p_new.name = p_old.name AND p_new.store_id = 3
WHERE i.store_id = 1;

-- ========================================
-- 清理之前可能存在的重复数据（可选）
-- ========================================
DELETE FROM `product_category` WHERE `store_id` = 2 AND `id` BETWEEN 50 AND 60;
