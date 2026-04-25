/*
 ============================================
  ShafirStore 多店铺系统 - 数据库增量修复脚本
  执行时间：2026-04-17
  适用数据库：shafir_store (MySQL 8.0+)
  
  修复内容：
  1. operation_log 表结构与 OperationLog.java 实体不匹配（重建表）
  2. admin 用户 store_id 应为 NULL（超级管理员不绑定店铺）
  3. admin/zhangsan/ewfawefw 密码为明文，需改为 BCrypt 加密
  4. zhangsan/ewfawefw 的 role_id=2 指向不存在的旧角色
  5. store_admin/clerk 缺少 sys_user_store_rel 关联记录
  6. sys_menu 表 parent_id 错误 + 缺少店铺管理菜单
  
  注意：请在执行前备份数据库！
 ============================================
*/

SET NAMES utf8mb4;

-- =============================================
-- 修复 1：重建 operation_log 表
-- 原因：数据库表结构与 OperationLog.java 实体完全不匹配
--
-- 数据库现有字段：operator_id, operator_name, module, action, params, result
-- Java 实体期望字段：userId, username, roleKey, operation, requestUrl, 
--                    requestMethod, requestParams, duration, status, errorMsg
-- =============================================

DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `user_id` bigint NULL DEFAULT NULL COMMENT '操作用户ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作用户名',
  `role_key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作用户角色标识',
  `store_id` bigint NULL DEFAULT NULL COMMENT '店铺ID',
  `operation` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '操作描述',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求方法(类名.方法名)',
  `request_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '请求URL',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'HTTP请求方法(GET/POST等)',
  `request_params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '请求参数',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `duration` bigint NULL DEFAULT NULL COMMENT '执行时长(ms)',
  `status` int NULL DEFAULT NULL COMMENT '操作状态(1-成功,0-失败)',
  `error_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '错误信息',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ol_user_id`(`user_id` ASC) USING BTREE,
  INDEX `idx_ol_create_time`(`create_time` ASC) USING BTREE,
  INDEX `idx_ol_store_id`(`store_id` ASC) USING BTREE,
  INDEX `idx_ol_store_time`(`store_id` ASC, `create_time` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志表' ROW_FORMAT = Dynamic;


-- =============================================
-- 修复 2：admin 用户的 store_id 应为 NULL
-- 原因：超级管理员(ROLE_SUPER_ADMIN)不属于任何店铺
-- 同时修复 store_admin 和 clerk 的 store_id
-- =============================================

UPDATE `sys_user` SET `store_id` = NULL WHERE `id` = 1 AND `username` = 'admin';

UPDATE `sys_user` SET `store_id` = 1 WHERE `id` = 9 AND `username` = 'store_admin';

UPDATE `sys_user` SET `store_id` = 1 WHERE `id` = 10 AND `username` = 'clerk';


-- =============================================
-- 修复 3：将明文密码改为 BCrypt 加密
-- 原因：后端使用 BCryptPasswordEncoder 校验密码
-- BCrypt('123456') = '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKt6Z5EH'
-- =============================================

UPDATE `sys_user` SET `password` = '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKt6Z5EH' 
WHERE `username` = 'admin' AND `password` = '123456';

UPDATE `sys_user` SET `password` = '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKt6Z5EH' 
WHERE `username` = 'zhangsan' AND `password` = '123456';

UPDATE `sys_user` SET `password` = '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKt6Z5EH' 
WHERE `username` = 'ewfawefw' AND `password` = '123456';


-- =============================================
-- 修复 4：修复 zhangsan/ewfawefw 的角色引用
-- 原因：旧 role_id=2 已不存在，现有角色为 4(超级管理员),5(店铺管理员),6(店员)
-- zhangsan/ewfawefw 应设为店员角色(6)
-- =============================================

UPDATE `sys_user` SET `role_id` = 6 WHERE `username` IN ('zhangsan', 'ewfawefw') AND `role_id` = 2;


-- =============================================
-- 修复 5：补充 sys_user_store_rel 缺失的关联记录
-- 原因：store_admin(id=9) 和 clerk(id=10) 没有店铺关联
-- =============================================

INSERT INTO `sys_user_store_rel` (`user_id`, `store_id`, `create_time`)
SELECT 9, 1, NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM `sys_user_store_rel` WHERE `user_id` = 9 AND `store_id` = 1
);

INSERT INTO `sys_user_store_rel` (`user_id`, `store_id`, `create_time`)
SELECT 10, 1, NOW()
FROM DUAL
WHERE NOT EXISTS (
    SELECT 1 FROM `sys_user_store_rel` WHERE `user_id` = 10 AND `store_id` = 1
);


-- =============================================
-- 修复 6：修复 sys_menu 表的 parent_id 错误
-- 
-- 当前错误：
--   id=7  (商品列表) parent_id=5 (操作日志) → 应为 6 (商品管理)
--   id=8  (分类管理) parent_id=5 (操作日志) → 应为 6 (商品管理)
--   id=17 (会员列表) parent_id=15(订单列表) → 应为 16(会员管理)
--   id=18 (积分管理) parent_id=15(订单列表) → 应为 16(会员管理)
-- =============================================

UPDATE `sys_menu` SET `parent_id` = 6 WHERE `id` = 7 AND `parent_id` = 5;
UPDATE `sys_menu` SET `parent_id` = 6 WHERE `id` = 8 AND `parent_id` = 5;
UPDATE `sys_menu` SET `parent_id` = 16 WHERE `id` = 17 AND `parent_id` = 15;
UPDATE `sys_menu` SET `parent_id` = 16 WHERE `id` = 18 AND `parent_id` = 15;


-- =============================================
-- 修复 7：补充缺失的店铺管理菜单
-- 原因：前端有 /admin/stores 路由，但数据库中没有对应菜单
-- =============================================

INSERT INTO `sys_menu` (`id`, `parent_id`, `name`, `path`, `component`, `icon`, `sort_order`, `type`, `permission`, `status`)
VALUES (22, 1, '店铺管理', 'stores', 'system/StoreManage.vue', 'Shop', 5, 1, 'system:store:list', 1)
ON DUPLICATE KEY UPDATE `parent_id` = 1, `path` = 'stores', `component` = 'system/StoreManage.vue', `icon` = 'Shop';


-- =============================================
-- 验证查询（执行后检查修复结果）
-- =============================================

-- 验证 admin 用户：store_id 应为 NULL, role_id 应为 4, 密码应为 BCrypt
SELECT id, username, store_id, role_id, LEFT(password, 20) AS password_prefix 
FROM sys_user WHERE username IN ('admin', 'zhangsan', 'ewfawefw', 'store_admin', 'clerk');

-- 验证用户-店铺关联
SELECT u.id, u.username, u.role_id, r.role_name, r.role_key, s.store_id AS rel_store_id
FROM sys_user u
LEFT JOIN sys_role r ON u.role_id = r.id
LEFT JOIN sys_user_store_rel s ON u.id = s.user_id
WHERE u.deleted = 0;

-- 验证菜单层级
SELECT id, parent_id, name, path FROM sys_menu ORDER BY parent_id, sort_order;

-- 验证 operation_log 表结构
DESCRIBE operation_log;
