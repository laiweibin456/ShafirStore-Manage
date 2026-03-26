-- ============================================
-- 莎菲尔菓子门店管理系统 数据库初始化脚本
-- 数据库名称: shafir_store
-- ============================================

-- 创建数据库
CREATE DATABASE IF NOT EXISTS shafir_store
    DEFAULT CHARACTER SET utf8mb4
    COLLATE utf8mb4_unicode_ci;

USE shafir_store;

-- ============================================
-- 1. 角色表
-- ============================================
DROP TABLE IF EXISTS sys_role;
CREATE TABLE sys_role (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '角色ID',
    role_name VARCHAR(50) NOT NULL COMMENT '角色名称',
    role_key VARCHAR(50) NOT NULL COMMENT '角色标识',
    description VARCHAR(200) COMMENT '角色描述',
    status TINYINT DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '系统角色表';

-- ============================================
-- 2. 用户表
-- ============================================
DROP TABLE IF EXISTS sys_user;
CREATE TABLE sys_user (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '用户ID',
    username VARCHAR(50) NOT NULL UNIQUE COMMENT '用户名',
    password VARCHAR(100) NOT NULL COMMENT '密码（BCrypt加密）',
    real_name VARCHAR(50) COMMENT '真实姓名',
    phone VARCHAR(20) COMMENT '手机号',
    email VARCHAR(100) COMMENT '邮箱',
    avatar VARCHAR(255) COMMENT '头像',
    role_id BIGINT NOT NULL COMMENT '角色ID',
    status TINYINT DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_role_id (role_id),
    INDEX idx_username (username)
) COMMENT '系统用户表';

-- ============================================
-- 3. 菜单权限表
-- ============================================
DROP TABLE IF EXISTS sys_menu;
CREATE TABLE sys_menu (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '菜单ID',
    parent_id BIGINT DEFAULT 0 COMMENT '父菜单ID',
    name VARCHAR(50) NOT NULL COMMENT '菜单名称',
    path VARCHAR(200) COMMENT '路由路径',
    component VARCHAR(255) COMMENT '组件路径',
    icon VARCHAR(50) COMMENT '菜单图标',
    sort_order INT DEFAULT 0 COMMENT '排序',
    type TINYINT DEFAULT 1 COMMENT '类型（1-菜单，2-按钮）',
    permission VARCHAR(100) COMMENT '权限标识',
    status TINYINT DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_parent_id (parent_id)
) COMMENT '系统菜单表';

-- ============================================
-- 4. 商品分类表
-- ============================================
DROP TABLE IF EXISTS product_category;
CREATE TABLE product_category (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '分类ID',
    parent_id BIGINT DEFAULT 0 COMMENT '父分类ID',
    name VARCHAR(50) NOT NULL COMMENT '分类名称',
    icon VARCHAR(255) COMMENT '分类图标',
    sort_order INT DEFAULT 0 COMMENT '排序',
    status TINYINT DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '商品分类表';

-- ============================================
-- 5. 商品表
-- ============================================
DROP TABLE IF EXISTS product;
CREATE TABLE product (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '商品ID',
    name VARCHAR(100) NOT NULL COMMENT '商品名称',
    category_id BIGINT COMMENT '分类ID',
    price DECIMAL(10,2) NOT NULL COMMENT '销售价格',
    cost_price DECIMAL(10,2) COMMENT '成本价格',
    unit VARCHAR(20) DEFAULT '个' COMMENT '计量单位',
    shelf_life_days INT COMMENT '保质期（天）',
    image_url VARCHAR(255) COMMENT '商品图片',
    description TEXT COMMENT '商品描述',
    status TINYINT DEFAULT 1 COMMENT '状态（0-下架，1-上架）',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    deleted TINYINT DEFAULT 0 COMMENT '逻辑删除',
    INDEX idx_category_id (category_id),
    INDEX idx_status (status)
) COMMENT '商品表';

-- ============================================
-- 6. 库存表
-- ============================================
DROP TABLE IF EXISTS inventory;
CREATE TABLE inventory (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '库存ID',
    product_id BIGINT NOT NULL UNIQUE COMMENT '商品ID',
    quantity INT DEFAULT 0 COMMENT '当前库存数量',
    alert_threshold INT DEFAULT 10 COMMENT '预警阈值',
    last_in_time DATETIME COMMENT '最后入库时间',
    last_out_time DATETIME COMMENT '最后出库时间',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间'
) COMMENT '库存表';

-- ============================================
-- 7. 库存记录表
-- ============================================
DROP TABLE IF EXISTS inventory_record;
CREATE TABLE inventory_record (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '记录ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    type TINYINT NOT NULL COMMENT '类型（1-入库，2-出库）',
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

-- ============================================
-- 8. 会员等级表
-- ============================================
DROP TABLE IF EXISTS member_level;
CREATE TABLE member_level (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT 'ID',
    name VARCHAR(20) NOT NULL COMMENT '等级名称',
    level TINYINT NOT NULL COMMENT '等级值',
    discount DECIMAL(3,2) DEFAULT 1.00 COMMENT '折扣率',
    min_amount DECIMAL(10,2) DEFAULT 0 COMMENT '最低消费门槛',
    points_rate INT DEFAULT 1 COMMENT '积分倍率',
    status TINYINT DEFAULT 1 COMMENT '状态',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    INDEX idx_level (level)
) COMMENT '会员等级表';

-- ============================================
-- 9. 会员表
-- ============================================
DROP TABLE IF EXISTS member;
CREATE TABLE member (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '会员ID',
    name VARCHAR(50) NOT NULL COMMENT '会员姓名',
    phone VARCHAR(20) NOT NULL UNIQUE COMMENT '手机号',
    gender TINYINT COMMENT '性别（0-女，1-男）',
    birthday DATE COMMENT '生日',
    points INT DEFAULT 0 COMMENT '积分余额',
    total_consume DECIMAL(10,2) DEFAULT 0 COMMENT '累计消费金额',
    level TINYINT DEFAULT 1 COMMENT '会员等级（1-普通，2-银卡，3-金卡，4-钻石）',
    status TINYINT DEFAULT 1 COMMENT '状态（0-禁用，1-正常）',
    register_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_phone (phone)
) COMMENT '会员表';

-- ============================================
-- 10. 会员积分记录表
-- ============================================
DROP TABLE IF EXISTS member_points_record;
CREATE TABLE member_points_record (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '记录ID',
    member_id BIGINT NOT NULL COMMENT '会员ID',
    type TINYINT NOT NULL COMMENT '类型（1-增加，2-扣减）',
    points INT NOT NULL COMMENT '积分数量',
    balance INT COMMENT '操作后余额',
    order_id BIGINT COMMENT '关联订单ID',
    remark VARCHAR(255) COMMENT '备注',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
    INDEX idx_member_id (member_id),
    INDEX idx_order_id (order_id)
) COMMENT '会员积分记录表';

-- ============================================
-- 11. 订单表
-- ============================================
DROP TABLE IF EXISTS sale_order;
CREATE TABLE sale_order (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '订单ID',
    order_no VARCHAR(32) NOT NULL UNIQUE COMMENT '订单号',
    member_id BIGINT COMMENT '会员ID',
    total_amount DECIMAL(10,2) NOT NULL COMMENT '订单总金额',
    discount_amount DECIMAL(10,2) DEFAULT 0 COMMENT '优惠金额',
    pay_amount DECIMAL(10,2) NOT NULL COMMENT '实付金额',
    points_discount DECIMAL(10,2) DEFAULT 0 COMMENT '积分抵扣',
    pay_type TINYINT NOT NULL COMMENT '支付方式（1-现金，2-微信，3-支付宝，4-会员卡）',
    order_type TINYINT DEFAULT 1 COMMENT '订单类型（1-正常销售，2-退款）',
    status TINYINT DEFAULT 1 COMMENT '状态（1-进行中，2-已完成，3-已取消，4-已退款）',
    remark VARCHAR(255) COMMENT '备注',
    operator_id BIGINT COMMENT '操作员ID',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
    update_time DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    INDEX idx_order_no (order_no),
    INDEX idx_member_id (member_id),
    INDEX idx_create_time (create_time)
) COMMENT '订单表';

-- ============================================
-- 12. 订单明细表
-- ============================================
DROP TABLE IF EXISTS sale_order_item;
CREATE TABLE sale_order_item (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '明细ID',
    order_id BIGINT NOT NULL COMMENT '订单ID',
    product_id BIGINT NOT NULL COMMENT '商品ID',
    product_name VARCHAR(100) NOT NULL COMMENT '商品名称（冗余）',
    price DECIMAL(10,2) NOT NULL COMMENT '单价',
    quantity INT NOT NULL COMMENT '数量',
    subtotal DECIMAL(10,2) NOT NULL COMMENT '小计金额',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    INDEX idx_order_id (order_id),
    INDEX idx_product_id (product_id)
) COMMENT '订单明细表';

-- ============================================
-- 13. 操作日志表
-- ============================================
DROP TABLE IF EXISTS operation_log;
CREATE TABLE operation_log (
    id BIGINT PRIMARY KEY AUTO_INCREMENT COMMENT '日志ID',
    operator_id BIGINT COMMENT '操作人ID',
    operator_name VARCHAR(50) COMMENT '操作人姓名',
    module VARCHAR(50) COMMENT '操作模块',
    action VARCHAR(100) COMMENT '操作动作',
    method VARCHAR(200) COMMENT '请求方法',
    params TEXT COMMENT '请求参数',
    result TEXT COMMENT '返回结果',
    ip VARCHAR(50) COMMENT 'IP地址',
    create_time DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
    INDEX idx_operator_id (operator_id),
    INDEX idx_create_time (create_time)
) COMMENT '操作日志表';

-- ============================================
-- 初始化数据
-- ============================================

-- 插入角色数据
INSERT INTO sys_role (role_name, role_key, description) VALUES
('店长', 'ROLE_ADMIN', '拥有全部权限'),
('店员', 'ROLE_CLERK', '拥有基础操作权限');

-- 插入用户数据
-- 原始密码: 123456
INSERT INTO sys_user (username, password, real_name, phone, role_id, status) VALUES
('admin', '123456', '系统管理员', '13800138000', 1, 1),
('zhangsan', '123456', '张三', '13800138001', 2, 1);

-- 插入商品分类数据
INSERT INTO product_category (name, parent_id, sort_order, status) VALUES
('蛋糕', 0, 1, 1),
('面包', 0, 2, 1),
('饼干', 0, 3, 1),
('饮品', 0, 4, 1);

-- 插入蛋糕子分类
INSERT INTO product_category (name, parent_id, sort_order, status) VALUES
('生日蛋糕', 1, 1, 1),
('慕斯蛋糕', 1, 2, 1),
('芝士蛋糕', 1, 3, 1),
('奶油蛋糕', 1, 4, 1);

-- 插入面包子分类
INSERT INTO product_category (name, parent_id, sort_order, status) VALUES
('吐司', 2, 1, 1),
('法式面包', 2, 2, 1),
('软欧包', 2, 3, 1);

-- 插入商品数据
INSERT INTO product (name, category_id, price, cost_price, unit, shelf_life_days, description, status) VALUES
('草莓奶油蛋糕', 5, 168.00, 68.00, '个', 3, '新鲜草莓搭配动物奶油，精致美味', 1),
('提拉米苏', 6, 88.00, 38.00, '个', 2, '经典意式甜点，咖啡风味', 1),
('芒果慕斯', 6, 78.00, 32.00, '个', 2, '新鲜芒果制作，入口即化', 1),
('原味芝士蛋糕', 7, 58.00, 25.00, '个', 3, '浓郁芝士，口感绵密', 1),
('巧克力慕斯', 6, 68.00, 28.00, '个', 2, '纯正巧克力，丝滑享受', 1),
('原味吐司', 8, 12.00, 5.00, '袋', 5, '柔软可口，早餐必备', 1),
('红豆吐司', 8, 15.00, 6.50, '袋', 5, '香甜红豆，营养美味', 1),
('法式长棍', 9, 8.00, 3.00, '根', 2, '正宗法式面包，外脆内软', 1),
('黄油曲奇', 3, 28.00, 12.00, '盒', 30, '手工黄油曲奇，酥脆香甜', 1),
('蔓越莓饼干', 3, 32.00, 14.00, '盒', 30, '酸甜蔓越莓，口感丰富', 1),
('拿铁咖啡', 4, 22.00, 8.00, '杯', 1, '香浓拿铁，丝滑口感', 1),
('珍珠奶茶', 4, 18.00, 6.00, '杯', 1, 'Q弹珍珠，经典奶茶', 1);

-- 为已有商品初始化库存
INSERT INTO inventory (product_id, quantity, alert_threshold)
SELECT id, 50, 10 FROM product;

-- 插入会员等级数据
INSERT INTO member_level (name, level, discount, min_amount, points_rate, status) VALUES
('普通会员', 1, 1.00, 0, 1, 1),
('银卡会员', 2, 0.95, 500.00, 1, 1),
('金卡会员', 3, 0.90, 2000.00, 2, 1),
('钻石会员', 4, 0.85, 5000.00, 2, 1);

-- 插入测试会员数据
INSERT INTO member (name, phone, gender, birthday, points, total_consume, level, status) VALUES
('李女士', '13900139001', 0, '1990-05-20', 1500, 3500.00, 3, 1),
('王先生', '13900139002', 1, '1995-08-15', 500, 800.00, 2, 1),
('张小姐', '13900139003', 0, '1992-12-01', 200, 300.00, 1, 1);

-- 插入菜单数据（系统配置菜单）
INSERT INTO sys_menu (name, parent_id, path, component, icon, sort_order, type, permission, status) VALUES
('系统管理', 0, '/system', NULL, 'Setting', 100, 1, NULL, 1),
('用户管理', 1, 'user', 'system/UserManage.vue', 'User', 1, 1, 'system:user:list', 1),
('角色管理', 1, 'role', 'system/RoleManage.vue', 'Role', 2, 1, 'system:role:list', 1),
('菜单管理', 1, 'menu', 'system/MenuManage.vue', 'Menu', 3, 1, 'system:menu:list', 1),
('操作日志', 1, 'log', 'system/OperationLog.vue', 'Document', 4, 1, 'system:log:list', 1),
('商品管理', 0, '/product', NULL, 'Goods', 10, 1, NULL, 1),
('商品列表', 5, 'list', 'product/ProductList.vue', 'List', 1, 1, 'product:list', 1),
('分类管理', 5, 'category', 'product/CategoryManage.vue', 'Collection', 2, 1, 'product:category', 1),
('库存管理', 0, '/inventory', NULL, 'Box', 20, 1, NULL, 1),
('库存列表', 9, 'list', 'inventory/InventoryList.vue', 'List', 1, 1, 'inventory:list', 1),
('入库管理', 9, 'in', 'inventory/InventoryIn.vue', 'Bottom', 2, 1, 'inventory:in', 1),
('出库管理', 9, 'out', 'inventory/InventoryOut.vue', 'Top', 3, 1, 'inventory:out', 1),
('销售管理', 0, '/sale', NULL, 'Sell', 30, 1, NULL, 1),
('收银台', 13, 'pos', 'sale/POS.vue', 'Money', 1, 1, 'sale:pos', 1),
('订单列表', 13, 'order', 'sale/OrderList.vue', 'Tickets', 2, 1, 'sale:order:list', 1),
('会员管理', 0, '/member', NULL, 'UserFilled', 40, 1, NULL, 1),
('会员列表', 15, 'list', 'member/MemberList.vue', 'List', 1, 1, 'member:list', 1),
('积分管理', 15, 'points', 'member/MemberPoints.vue', 'Coin', 2, 1, 'member:points', 1),
('统计分析', 0, '/statistics', NULL, 'DataAnalysis', 50, 1, NULL, 1),
('销售统计', 19, 'sales', 'statistics/SalesStatistics.vue', 'TrendCharts', 1, 1, 'statistics:sales', 1),
('会员统计', 19, 'member', 'statistics/MemberStatistics.vue', 'User', 2, 1, 'statistics:member', 1);

-- ============================================
-- 验证数据
-- ============================================
SELECT '数据初始化完成！' AS message;
SELECT COUNT(*) AS '角色数量' FROM sys_role;
SELECT COUNT(*) AS '用户数量' FROM sys_user;
SELECT COUNT(*) AS '商品数量' FROM product;
SELECT COUNT(*) AS '会员数量' FROM member;
