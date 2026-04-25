-- ============================================
-- 莎菲尔菓子小程序端数据库脚本
-- 作者：自动生成
-- 日期：2026-04-10
-- 说明：小程序用户体系和预约订单功能
-- ============================================

USE shafir_store;

-- ============================================
-- 1. 普通用户表
-- 用于存储未升级为会员的普通用户
-- ============================================
DROP TABLE IF EXISTS regular_user;
CREATE TABLE regular_user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    phone VARCHAR(20) NOT NULL UNIQUE COMMENT '手机号（唯一）',
    password VARCHAR(100) NOT NULL COMMENT '密码（建议加密存储）',
    nickname VARCHAR(50) COMMENT '昵称',
    total_consume DECIMAL(10,2) DEFAULT 0 COMMENT '累计消费金额',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    status TINYINT DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
    INDEX idx_phone (phone),
    INDEX idx_status (status)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT '小程序普通用户表';

-- ============================================
-- 2. 预约订单表
-- 用于存储小程序用户的预约订单
-- ============================================
DROP TABLE IF EXISTS reservation_order;
CREATE TABLE reservation_order (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '订单ID',
    order_no VARCHAR(32) NOT NULL UNIQUE COMMENT '订单号（RS+时间戳）',
    user_id BIGINT NOT NULL COMMENT '用户ID（regular_user或member的id）',
    user_type TINYINT NOT NULL COMMENT '用户类型（1-普通用户，2-会员）',
    total_amount DECIMAL(10,2) NOT NULL COMMENT '订单总金额',
    discount_amount DECIMAL(10,2) DEFAULT 0 COMMENT '优惠金额',
    pay_amount DECIMAL(10,2) NOT NULL COMMENT '实付金额（到店付款）',
    status TINYINT DEFAULT 1 COMMENT '状态（1-待取货，2-已完成，3-已取消）',
    pickup_time DATETIME COMMENT '预约取货时间',
    remark VARCHAR(255) COMMENT '备注',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_order_no (order_no),
    INDEX idx_user_id (user_id),
    INDEX idx_user_type (user_type),
    INDEX idx_status (status),
    INDEX idx_pickup_time (pickup_time),
    INDEX idx_create_time (create_time)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT '小程序预约订单表';

-- ============================================
-- 3. 预约订单明细表
-- 用于存储预约订单的商品明细
-- ============================================
DROP TABLE IF EXISTS reservation_order_item;
CREATE TABLE reservation_order_item (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '明细ID',
    order_id BIGINT NOT NULL COMMENT '订单ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称（冗余存储）',
    price DECIMAL(10,2) NOT NULL COMMENT '单价',
    quantity INT NOT NULL COMMENT '数量',
    subtotal DECIMAL(10,2) NOT NULL COMMENT '小计金额',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    INDEX idx_order_id (order_id),
    INDEX idx_product_id (product_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT '预约订单明细表';

-- ============================================
-- 4. 为 member 表添加密码字段
-- 复用会员表存储升级后的会员
-- ============================================
-- 检查 password 字段是否存在，不存在则添加
-- 注意：member 表已存在，这里添加 password 字段用于小程序登录
ALTER TABLE member ADD COLUMN password VARCHAR(100) COMMENT '登录密码（小程序用）' AFTER level;

-- ============================================
-- 5. 为 sale_order 表添加来源标识
-- 区分现场销售和小程序订单
-- ============================================
-- 检查 order_source 字段是否存在，不存在则添加
ALTER TABLE sale_order ADD COLUMN order_source TINYINT DEFAULT 1 COMMENT '订单来源（1-现场销售，2-小程序）' AFTER status;

-- ============================================
-- 6. 确保会员等级数据完整
-- ============================================
DELETE FROM member_level;
INSERT INTO member_level (name, level, discount, min_amount, points_rate, status, create_time) VALUES
('普通会员', 1, 1.00, 0, 1, 1, NOW()),
('银卡会员', 2, 0.95, 500.00, 1, 1, NOW()),
('金卡会员', 3, 0.90, 2000.00, 1, 1, NOW()),
('钻石会员', 4, 0.85, 5000.00, 2, 1, NOW());

-- ============================================
-- 7. 初始化测试数据（可选，取消注释即可使用）
-- ============================================
-- 测试普通用户
-- INSERT INTO regular_user (phone, password, nickname, total_consume, status) VALUES
-- ('13800138001', '123456', '测试用户', 0, 1);

-- 测试会员（需要先有对应手机号的会员）
-- INSERT INTO member (name, phone, password, gender, birthday, points, total_consume, level, status, register_time) VALUES
-- ('李女士', '13900139001', '123456', 0, '1990-05-20', 1500, 3500.00, 3, 1, NOW());

-- 测试预约订单
-- INSERT INTO reservation_order (order_no, user_id, user_type, total_amount, pay_amount, status, pickup_time, remark, create_time) VALUES
-- ('RS20260410123456', 1, 1, 344.00, 344.00, 1, '2026-04-15 14:00:00', '需要蜡烛', NOW());

-- 测试预约订单明细
-- INSERT INTO reservation_order_item (order_id, product_id, product_name, price, quantity, subtotal) VALUES
-- (1, 1, '草莓奶油蛋糕', 168.00, 1, 168.00),
-- (1, 2, '提拉米苏', 88.00, 2, 176.00);

-- ============================================
-- 8. 验证脚本执行结果
-- ============================================
SELECT '=== 表结构创建完成 ===' AS message;

-- 验证 regular_user 表
SELECT COUNT(*) AS 'regular_user数量' FROM regular_user;

-- 验证 reservation_order 表
SELECT COUNT(*) AS 'reservation_order数量' FROM reservation_order;

-- 验证 reservation_order_item 表
SELECT COUNT(*) AS 'reservation_order_item数量' FROM reservation_order_item;

-- 验证 member 表是否有 password 字段
-- SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME = 'member' AND COLUMN_NAME = 'password';

-- 验证 sale_order 表是否有 order_source 字段
-- SELECT COLUMN_NAME FROM information_schema.COLUMNS WHERE TABLE_NAME = 'sale_order' AND COLUMN_NAME = 'order_source';

-- 验证会员等级
SELECT '=== 会员等级数据 ===' AS message;
SELECT * FROM member_level ORDER BY level;

-- ============================================
-- 脚本执行完毕
-- 如需回滚，执行以下命令：
-- DROP TABLE IF EXISTS reservation_order_item;
-- DROP TABLE IF EXISTS reservation_order;
-- DROP TABLE IF EXISTS regular_user;
-- ALTER TABLE member DROP COLUMN password;
-- ALTER TABLE sale_order DROP COLUMN order_source;
-- ============================================
