/*
 ShafirStore - 库存记录表添加商品名称字段
 执行时间：2026-04-25
 
 功能：为 inventory_record 表添加 product_name 字段，冗余存储商品名称
 目的：解决删除商品后库存记录无法显示商品名称的问题
*/

SET NAMES utf8mb4;

-- 1. 添加 product_name 字段
ALTER TABLE `inventory_record`
    ADD COLUMN `product_name` VARCHAR(100) DEFAULT NULL COMMENT '商品名称（冗余存储）' AFTER `remark`;

-- 2. 更新现有数据的商品名称
UPDATE `inventory_record` ir
    INNER JOIN `product` p ON ir.product_id = p.id
SET ir.product_name = p.name
WHERE ir.product_name IS NULL;

-- 3. 验证更新结果
SELECT '=== 库存记录商品名称更新统计 ===' AS info;
SELECT 
    COUNT(*) AS total_records,
    SUM(CASE WHEN product_name IS NOT NULL THEN 1 ELSE 0 END) AS with_name,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS without_name
FROM inventory_record;

-- 4. 查看部分数据
SELECT '=== 库存记录示例数据 ===' AS info;
SELECT id, product_id, product_name, type, quantity, create_time
FROM inventory_record
ORDER BY create_time DESC
LIMIT 10;
