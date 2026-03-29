-- 库存管理模块数据库脚本
-- 创建日期: 2026-03-29

-- 库存表
CREATE TABLE IF NOT EXISTS inventory (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '库存ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    quantity INT DEFAULT 0 COMMENT '当前库存数量',
    alert_threshold INT DEFAULT 10 COMMENT '预警阈值',
    last_in_time DATETIME COMMENT '最后入库时间',
    last_out_time DATETIME COMMENT '最后出库时间',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    UNIQUE KEY uk_product_id (product_id)
) COMMENT '库存表';

-- 库存记录表
CREATE TABLE IF NOT EXISTS inventory_record (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '记录ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    type TINYINT NOT NULL COMMENT '类型（1-入库，2-出库，3-盘点调整）',
    quantity INT NOT NULL COMMENT '数量',
    before_quantity INT COMMENT '操作前数量',
    after_quantity INT COMMENT '操作后数量',
    order_id BIGINT COMMENT '关联订单ID',
    operator_id BIGINT COMMENT '操作人ID',
    remark VARCHAR(255) COMMENT '备注',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
    INDEX idx_product_id (product_id),
    INDEX idx_order_id (order_id),
    INDEX idx_create_time (create_time)
) COMMENT '库存记录表';

-- 为已有商品初始化库存
INSERT INTO inventory (product_id, quantity, alert_threshold)
SELECT id, 0, 10 FROM product
WHERE NOT EXISTS (SELECT 1 FROM inventory WHERE inventory.product_id = product.id);
