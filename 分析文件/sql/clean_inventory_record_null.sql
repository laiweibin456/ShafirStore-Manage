/*
 ShafirStore - 清理 inventory_record 表中 product_name 为空的记录
 执行时间：2026-04-25
 
 功能：删除 inventory_record 表中 product_name 为 NULL 的记录
*/

SET NAMES utf8mb4;

-- 查看将要删除的记录数量
SELECT '=== 即将删除的记录统计 ===' AS info;
SELECT COUNT(*) AS will_delete_count
FROM inventory_record
WHERE product_name IS NULL;

-- 查看将要删除的记录详情
SELECT '=== 即将删除的记录详情 ===' AS info;
SELECT id, store_id, product_id, type, quantity, create_time
FROM inventory_record
WHERE product_name IS NULL
ORDER BY create_time DESC;

-- 执行删除
DELETE FROM inventory_record
WHERE product_name IS NULL;

-- 验证删除结果
SELECT '=== 删除后统计 ===' AS info;
SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN product_name IS NOT NULL THEN 1 ELSE 0 END) AS with_name,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS without_name
FROM inventory_record;
