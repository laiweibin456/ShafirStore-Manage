-- 会员系统优化：统一用户体系
-- 所有用户都存储在 member 表中，废弃 regular_user 表

-- 1. 为 member 表添加 password 字段
-- 先检查字段是否存在，如果不存在则添加
SET @column_exists = (SELECT COUNT(*) FROM information_schema.COLUMNS 
    WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'member' AND COLUMN_NAME = 'password');
SET @sql = IF(@column_exists = 0, 
    'ALTER TABLE `member` ADD COLUMN `password` VARCHAR(255) DEFAULT NULL COMMENT ''密码''', 
    'SELECT ''password column already exists''');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- 2. 将 regular_user 表中的密码同步到 member 表
UPDATE `member` m
JOIN `regular_user` r ON m.phone = r.phone
SET m.password = r.password
WHERE m.password IS NULL;

-- 3. 为 member 表设置默认密码（如果没有密码的用户）
UPDATE `member` SET password = '123456' WHERE password IS NULL OR password = '';

-- 4. 确保所有会员都有 level（默认为1-普通会员）
UPDATE `member` SET level = 1 WHERE level IS NULL;

-- 5. 确保所有会员都有积分和消费金额
UPDATE `member` SET points = 0 WHERE points IS NULL;
UPDATE `member` SET total_consume = 0 WHERE total_consume IS NULL;
