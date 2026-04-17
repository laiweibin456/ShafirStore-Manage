/*
 ============================================
  ShafirStore 多店铺系统 - 设置不同店铺的差异化库存
  执行时间：2026-04-17
  
  功能：为每个店铺设置不同的库存数量
 ============================================
*/

SET NAMES utf8mb4;

-- =============================================
-- 1. 更新总店(store_id=1)的库存 - 随机库存
-- =============================================

UPDATE `inventory` SET `quantity` = FLOOR(RAND() * 100) + 1 WHERE `store_id` = 1;

-- =============================================
-- 2. 更新春熙店(store_id=2)的库存 - 随机库存
-- =============================================

UPDATE `inventory` SET `quantity` = FLOOR(RAND() * 80) + 10 WHERE `store_id` = 2;

-- =============================================
-- 3. 更新天府店(store_id=3)的库存 - 随机库存
-- =============================================

UPDATE `inventory` SET `quantity` = FLOOR(RAND() * 60) + 5 WHERE `store_id` = 3;

-- =============================================
-- 验证查询 - 查看各店铺库存分布
-- =============================================

SELECT '=== 各店铺库存统计 ===' AS info;
SELECT 
    st.store_name,
    COUNT(i.id) AS product_count,
    SUM(i.quantity) AS total_stock,
    MIN(i.quantity) AS min_stock,
    MAX(i.quantity) AS max_stock,
    AVG(i.quantity) AS avg_stock
FROM store st
JOIN inventory i ON st.id = i.store_id
GROUP BY st.id, st.store_name;

SELECT '=== 各店铺库存详情（前5条） ===' AS info;
SELECT st.store_name, p.name AS product_name, i.quantity
FROM inventory i
JOIN store st ON i.store_id = st.id
JOIN product p ON i.product_id = p.id
WHERE st.id = 1
ORDER BY i.quantity DESC
LIMIT 5;

SELECT st.store_name, p.name AS product_name, i.quantity
FROM inventory i
JOIN store st ON i.store_id = st.id
JOIN product p ON i.product_id = p.id
WHERE st.id = 2
ORDER BY i.quantity DESC
LIMIT 5;

SELECT st.store_name, p.name AS product_name, i.quantity
FROM inventory i
JOIN store st ON i.store_id = st.id
JOIN product p ON i.product_id = p.id
WHERE st.id = 3
ORDER BY i.quantity DESC
LIMIT 5;
