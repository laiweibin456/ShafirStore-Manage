# 莎菲尔菓子门店管理系统 - 项目启动指南

## 一、项目简介

莎菲尔菓子门店管理系统是一套面向烘焙门店的综合性管理平台，采用前后端分离架构，主要包含以下三个模块：

| 模块 | 技术栈 | 说明 |
|------|--------|------|
| 后端服务 | Spring Boot 3.2.2 + Java 17 | 提供 RESTful API |
| 前端管理后台 | Vue 3 + Vite + Element Plus | PC端管理系统 |
| 微信小程序 | 原生小程序 | 客户小程序端 |

---

## 二、环境配置要求

### 2.1 操作系统
- **推荐**: Windows 10/11 (64位)
- **可选**: macOS 10.14+、Ubuntu 18.04+

### 2.2 必要开发工具及版本要求

| 工具 | 最低版本 | 推荐版本 | 说明 |
|------|----------|----------|------|
| JDK | 17 | 17.0.9 | 后端运行环境 |
| Node.js | 18 | 20.x LTS | 前端构建工具 |
| npm | 9.x | 10.x | 前端包管理器 |
| MySQL | 8.0 | 8.0.35 | 关系型数据库 |
| Maven | 3.8 | 3.9.6 | 后端项目构建 |
| Nginx | 1.20 | 1.28.3 | 图片服务器（已提供） |
| IDE | - | IntelliJ IDEA 2023+ / VS Code | 开发IDE |

### 2.3 硬件要求
- **内存**: 建议 8GB 以上（开发环境）
- **硬盘**: 建议 20GB 以上可用空间
- **网络**: 需要访问外网以下载依赖

---

## 三、详细安装步骤

### 3.1 安装 JDK 17

**Windows 环境：**
1. 访问 [Oracle JDK 下载](https://www.oracle.com/java/technologies/downloads/#java17) 或 [Eclipse Temurin](https://adoptium.net/)
2. 下载 Windows x64 MSI 安装包
3. 双击运行安装程序
4. 设置环境变量：
   ```powershell
   # 新建系统变量
   JAVA_HOME = C:\Program Files\Java\jdk-17
   
   # 编辑 Path 添加
   %JAVA_HOME%\bin
   ```
5. 验证安装：
   ```powershell
   java -version
   ```

### 3.2 安装 Node.js 和 npm

1. 访问 [Node.js 官网](https://nodejs.org/)
2. 下载 Windows x64 LTS 版本（20.x）
3. 运行安装程序，勾选 "Add to PATH"
4. 验证安装：
   ```powershell
   node -v
   npm -v
   ```

### 3.3 安装 MySQL 8.0

**Windows 环境：**
1. 下载 [MySQL Installer](https://dev.mysql.com/downloads/installer/)
2. 运行安装程序，选择 "Full" 安装类型
3. 设置 root 密码为：`123456`（或稍后修改配置文件）
4. 确保 MySQL 服务运行在端口 3306
5. 验证安装：
   ```powershell
   mysql -u root -p
   ```

### 3.4 安装 Maven

1. 访问 [Maven 下载](https://maven.apache.org/download.cgi)
2. 下载 Binary zip archive
3. 解压到目录（如：`C:\apache-maven-3.9.6`）
4. 设置环境变量：
   ```powershell
   # 新建系统变量
   MAVEN_HOME = C:\apache-maven-3.9.6
   
   # 编辑 Path 添加
   %MAVEN_HOME%\bin
   ```
5. 验证安装：
   ```powershell
   mvn -version
   ```

### 3.5 配置 Maven 镜像（可选，加速下载）

编辑 `MAVEN_HOME\conf\settings.xml`，在 `<mirrors>` 标签内添加：

```xml
<mirror>
    <id>aliyun</id>
    <mirrorOf>central</mirrorOf>
    <name>Aliyun Maven</name>
    <url>https://maven.aliyun.com/repository/central</url>
</mirror>
```

---

## 四、项目部署

### 4.1 克隆/复制项目

将项目文件夹 `ShafirStore-Manage` 复制到本地目录。

### 4.2 数据库初始化

**推荐使用项目提供的 `shafir_store.sql` 文件**，而不是手动创建表结构。

1. 登录 MySQL：
   ```powershell
   mysql -u root -p
   ```

2. 创建数据库：
   ```sql
   CREATE DATABASE shafir_store DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   EXIT;
   ```

3. 执行数据库初始化脚本：
   ```powershell
   # 方式一：使用命令行
   mysql -u root -p shafir_store < sql\shafir_store.sql
   
   # 方式二：使用 Navicat
   # 打开 Navicat -> 连接 MySQL -> 新建数据库 shafir_store
   # 右键数据库 -> 执行 SQL 文件 -> 选择 sql\shafir_store.sql
   ```

4. **验证数据是否正确插入**：
   ```sql
   mysql -u root -p
   USE shafir_store;
   SELECT id, username, password, real_name, role_id, status FROM sys_user;
   ```
   
   **预期输出**：
   ```
   +----+----------+-----------+-----------+---------+--------+
   | id | username | password | real_name | role_id | status |
   +----+----------+-----------+-----------+---------+--------+
   |  1 | admin    | 123456   | 系统管理员 |       1 |      1 |
   |  2 | zhangsan | 123456   | 张三      |       2 |      1 |
   +----+----------+-----------+-----------+---------+--------+
   ```
   
   **如果密码不是 `123456`（而是 `$2a$10$...` 格式），说明使用了错误的 SQL 文件**，请确认使用的是 `shafir_store.sql` 而不是其他文件。

**注意**：如果 `sql\init_database.sql` 不存在，请使用以下脚本初始化：

```sql
-- 创建所有必要的表
CREATE DATABASE IF NOT EXISTS shafir_store DEFAULT CHARACTER SET utf8mb4;

USE shafir_store;

-- 用户表
CREATE TABLE IF NOT EXISTS `user` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(50) NOT NULL UNIQUE,
    `password` VARCHAR(100) NOT NULL,
    `real_name` VARCHAR(50),
    `phone` VARCHAR(20),
    `role` VARCHAR(20) DEFAULT 'STAFF',
    `status` TINYINT DEFAULT 1,
    `deleted` TINYINT DEFAULT 0,
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP,
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 商品分类表
CREATE TABLE IF NOT EXISTS `product_category` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `parent_id` BIGINT DEFAULT 0,
    `sort` INT DEFAULT 0,
    `deleted` TINYINT DEFAULT 0,
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 商品表
CREATE TABLE IF NOT EXISTS `product` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(100) NOT NULL,
    `category_id` BIGINT,
    `price` DECIMAL(10,2) NOT NULL,
    `stock` INT DEFAULT 0,
    `image` VARCHAR(255),
    `description` TEXT,
    `status` TINYINT DEFAULT 1,
    `deleted` TINYINT DEFAULT 0,
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 会员表
CREATE TABLE IF NOT EXISTS `member` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50) NOT NULL,
    `phone` VARCHAR(20) NOT NULL UNIQUE,
    `level` VARCHAR(20) DEFAULT 'BRONZE',
    `points` INT DEFAULT 0,
    `balance` DECIMAL(10,2) DEFAULT 0,
    `status` TINYINT DEFAULT 1,
    `deleted` TINYINT DEFAULT 0,
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 订单表
CREATE TABLE IF NOT EXISTS `order` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `order_no` VARCHAR(50) NOT NULL UNIQUE,
    `member_id` BIGINT,
    `total_amount` DECIMAL(10,2) NOT NULL,
    `discount_amount` DECIMAL(10,2) DEFAULT 0,
    `pay_amount` DECIMAL(10,2) NOT NULL,
    `pay_type` VARCHAR(20),
    `status` VARCHAR(20) DEFAULT 'PENDING',
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 库存表
CREATE TABLE IF NOT EXISTS `inventory` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT NOT NULL,
    `quantity` INT NOT NULL,
    `min_stock` INT DEFAULT 10,
    `max_stock` INT DEFAULT 100,
    `deleted` TINYINT DEFAULT 0,
    `update_time` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- 库存记录表
CREATE TABLE IF NOT EXISTS `inventory_record` (
    `id` BIGINT AUTO_INCREMENT PRIMARY KEY,
    `product_id` BIGINT NOT NULL,
    `type` VARCHAR(20) NOT NULL,
    `quantity` INT NOT NULL,
    `operator_id` BIGINT,
    `remark` VARCHAR(255),
    `create_time` DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- 插入默认管理员账号（密码：123456，明文存储）
INSERT INTO `sys_user` (`username`, `password`, `real_name`, `phone`, `role_id`, `status`) VALUES
('admin', '123456', '系统管理员', '13800138000', 1, 1),
('zhangsan', '123456', '张三', '13800138001', 2, 1);
```

## ⚠️ 重要说明：密码存储方式

**本项目使用明文密码存储和验证**。

登录验证逻辑位于 `AuthController.java`：

```java
// AuthController.java 第 38 行 - 明文比对
if (!request.getPassword().equals(user.getPassword())) {
    // 直接使用 String.equals() 比对
}
```

**重要**：
- `sys_user` 表中的 `password` 字段存储的是**明文密码** `123456`
- 不要使用 BCrypt 哈希值，否则无法登录
- 项目已移除所有 BCrypt 相关代码

---

### 4.3 修改后端配置文件

编辑 `shafirStore-manage\src\main\resources\application.yml`，根据实际情况修改数据库连接信息：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/shafir_store?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true
    username: root
    password: 123456  # 修改为你的 MySQL 密码
```

如果图片上传路径需要修改：

```yaml
upload:
  path: C:/Users/Administrator/Desktop/宝宝的毕业设计/ShafirStore-Manage/nginx-1.28.3/images/products
  base-url: http://localhost:8081/images/products
```

### 4.4 安装前端依赖

```powershell
cd shafirstore-frontend
npm install
```

---

## 五、本地开发环境启动

### 5.1 启动图片服务器（Nginx）

```powershell
cd nginx-1.28.3
.\nginx.exe
```

验证 Nginx 是否启动成功：
```powershell
tasklist /fi "imagename eq nginx.exe"
```

### 5.2 启动后端服务

**方式一：使用 Maven**
```powershell
cd shafirStore-manage
mvn spring-boot:run
```

**方式二：使用 IDE**
1. 使用 IntelliJ IDEA 打开 `shafirStore-manage` 文件夹
2. 等待 Maven 依赖下载完成
3. 右键 `ShafirStoreApplication.java` -> Run 'ShafirStoreApplication'
4. 后端服务启动于 http://localhost:8080

**方式三：运行 JAR**
```powershell
cd shafirStore-manage
mvn clean package -DskipTests
java -jar target/shafir-store-manage-1.0.0.jar
```

### 5.3 启动前端服务

```powershell
cd shafirstore-frontend
npm run dev
```

前端服务启动于 http://localhost:5173

### 5.4 启动微信小程序开发工具

1. 下载并打开 [微信开发者工具](https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html)
2. 导入项目：`shafirstore-mini\miniprogram`
3. 修改 `utils/request.js` 中的接口地址为你的本地后端地址

---

## 六、验证项目成功启动

### 6.1 检查服务端口

确保以下端口未被占用：
- **8080**: 后端 API 服务
- **5173**: 前端开发服务器
- **8081**: Nginx 图片服务器
- **3306**: MySQL 数据库

```powershell
netstat -ano | findstr "8080 5173 8081 3306"
```

### 6.2 访问前端管理后台

1. 打开浏览器访问：http://localhost:5173
2. 如果看到登录页面，说明前后端连接正常
3. 使用以下账号登录：
   - **管理员账号**: admin / 123456
   - **店员账号**: zhangsan / 123456

### 6.3 API 接口测试

使用 Postman 或浏览器访问：

```bash
# 测试后端是否正常运行
GET http://localhost:8080/api

# 测试登录接口
POST http://localhost:8080/api/auth/login
Content-Type: application/json

{
    "username": "admin",
    "password": "123456"
}
```

### 6.4 检查图片服务器

访问：http://localhost:8081/images/products/

如果能看到图片列表，说明 Nginx 图片服务器运行正常。

---

## 七、常见问题及解决方案

### Q1: Maven 依赖下载失败

**问题描述**：`Could not resolve dependencies` 或下载超时

**解决方案**：
1. 检查网络连接
2. 配置 Maven 镜像（如上述 3.5 节）
3. 清理并重新下载：
   ```powershell
   mvn clean install -U
   ```

### Q2: 端口被占用

**问题描述**：`Port 8080 was already in use`

**解决方案**：
1. 查找占用端口的进程：
   ```powershell
   netstat -ano | findstr "8080"
   ```
2. 结束进程（替换 PID 为实际进程ID）：
   ```powershell
   taskkill /PID <PID> /F
   ```
3. 或者修改 `application.yml` 中的端口号

### Q3: MySQL 连接失败

**问题描述**：`Connection refused` 或 `Access denied`

**解决方案**：
1. 确认 MySQL 服务已启动：
   ```powershell
   net start | findstr "MySQL"
   ```
2. 检查用户名密码是否正确
3. 检查 MySQL 是否允许远程连接
4. 确认数据库已创建

### Q4: 前端无法连接后端 API

**问题描述**：登录失败或请求超时

**解决方案**：
1. 确认后端服务已启动并运行在 8080 端口
2. 检查 `vite.config.js` 中的代理配置
3. 检查浏览器控制台是否有 CORS 错误
4. 确认数据库中有默认账号数据

### Q5: 图片上传失败

**问题描述**：上传商品图片时报错

**解决方案**：
1. 确认 Nginx 已启动
2. 检查上传目录是否存在且有写入权限
3. 检查 `application.yml` 中的 `upload.path` 配置
4. 检查 Nginx 配置中的图片路径映射

### Q6: npm install 失败

**问题描述**：安装依赖时报错

**解决方案**：
1. 清理 npm 缓存：
   ```powershell
   npm cache clean --force
   ```
2. 删除 `node_modules` 和 `package-lock.json`
3. 重新安装：
   ```powershell
   npm install
   ```
4. 使用淘宝镜像（可选）：
   ```powershell
   npm config set registry https://registry.npmmirror.com
   ```

### Q7: Vue 项目启动后空白页

**问题描述**：访问 http://localhost:5173 显示空白

**解决方案**：
1. 检查浏览器控制台是否有报错
2. 确认所有依赖已正确安装
3. 尝试清除浏览器缓存
4. 检查 `vite.config.js` 配置是否正确

### Q8: JWT Token 过期

**问题描述**：登录后一段时间无法访问 API

**解决方案**：
1. 重新登录获取新 Token
2. 检查后端服务器时间是否正确
3. 调整 `application.yml` 中的 token 过期时间：
   ```yaml
   jwt:
     expiration: 7200000  # 2小时
   ```

### Q9: 别人无法登录（密码正确但失败）

**问题描述**：使用相同的 SQL 文件初始化数据库后，无法使用 admin/123456 登录

**可能原因**：
1. SQL 文件没有完整执行（部分表或数据缺失）
2. 数据库连接配置与 SQL 文件中的编码不匹配
3. MySQL 版本差异导致字符集问题

**解决方案**：
1. 确认 `shafir_store.sql` 文件完整执行：
   ```sql
   -- 检查数据是否插入
   SELECT * FROM sys_user;
   ```
2. 确认 `application.yml` 中的数据库名称、用户名、密码正确
3. 确认数据库字符集为 `utf8mb4`：
   ```sql
   ALTER DATABASE shafir_store CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
   ```
4. 重新执行 SQL 文件前，先删除旧数据库：
   ```sql
   DROP DATABASE IF EXISTS shafir_store;
   ```

---

## 八、项目默认账号

| 角色 | 用户名 | 密码 | 说明 |
|------|--------|------|------|
| 店长/管理员 | admin | 123456 | 拥有所有权限 |
| 店员 | zhangsan | 123456 | 基础操作权限 |

---

## 九、项目技术栈汇总

### 后端技术栈
- **框架**: Spring Boot 3.2.2
- **安全**: Spring Security 6
- **ORM**: MyBatis-Plus 3.5.5
- **数据库**: MySQL 8.0
- **认证**: JWT (jjwt 0.12.5)
- **工具**: Hutool 5.8.25

### 前端技术栈
- **框架**: Vue 3.5.30
- **构建**: Vite 8.0.1
- **路由**: Vue Router 4.6.4
- **状态**: Pinia 3.0.4
- **UI**: Element Plus 2.13.6
- **图表**: ECharts 6.0.0
- **HTTP**: Axios 1.13.6

---

## 十、相关文档

项目还包含以下开发文档，可供参考：

| 文档 | 位置 | 说明 |
|------|------|------|
| 系统开发全流程方案.md | 项目根目录 | 完整开发流程 |
| 技术栈方案.md | 项目根目录 | 技术选型说明 |
| 小程序完整开发流程.md | 项目根目录 | 微信小程序开发 |
| 图片上传功能使用指南.md | 项目根目录 | 图片上传说明 |

---

## 十一、联系与支持

如果在使用过程中遇到问题，请检查：
1. 所有必需工具是否已正确安装
2. 所有服务是否已启动
3. 配置文件中的路径和端口是否正确
4. 数据库是否已初始化

祝开发顺利！
