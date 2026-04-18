-- 积分兑换功能数据库迁移
-- 执行此SQL来添加积分兑换相关字段

-- 1. 为预定订单表添加积分消耗字段
ALTER TABLE reservation_order ADD COLUMN points_deduct INT DEFAULT 0 COMMENT '积分消耗';

-- 2. 为预定订单项表添加积分兑换相关字段
ALTER TABLE reservation_order_item ADD COLUMN original_price DECIMAL(10,2) DEFAULT NULL COMMENT '原价';
ALTER TABLE reservation_order_item ADD COLUMN is_points_exchange TINYINT(1) DEFAULT 0 COMMENT '是否积分兑换';
ALTER TABLE reservation_order_item ADD COLUMN required_points INT DEFAULT NULL COMMENT '所需积分';

-- 3. 为销售订单项表添加积分兑换相关字段
ALTER TABLE sale_order_item ADD COLUMN original_price DECIMAL(10,2) DEFAULT NULL COMMENT '原价';
ALTER TABLE sale_order_item ADD COLUMN is_points_exchange TINYINT(1) DEFAULT 0 COMMENT '是否积分兑换';
ALTER TABLE sale_order_item ADD COLUMN required_points INT DEFAULT NULL COMMENT '所需积分';
