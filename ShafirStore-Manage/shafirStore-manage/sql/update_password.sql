-- 更新用户密码（密码123456的正确BCrypt哈希）
UPDATE sys_user SET password = '$2a$10$znNmsDG6DOY0hPUpZerPNuMM/JwSRyprt20UPN3yo1g4j19qPUOIKK' WHERE username = 'admin';
UPDATE sys_user SET password = '$2a$10$znNmsDG6DOY0hPUpZerPNuMM/JwSRyprt20UPN3yo1g4j19qPUOIKK' WHERE username = 'zhangsan';