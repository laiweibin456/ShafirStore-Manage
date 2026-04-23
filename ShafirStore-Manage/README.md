# 莎菲尔菓子门店管理系统

## 项目简介

莎菲尔菓子门店管理系统是一套面向烘焙门店的综合性管理平台，采用前后端分离架构，支持多店铺管理。系统包含 PC 端管理后台和微信小程序客户端，实现了商品管理、库存管理、会员管理、订单管理、数据统计等核心功能。

### 系统架构

| 子系统 | 技术栈 | 说明 |
|--------|--------|------|
| 后端服务 | Spring Boot 3.2.2 + Java 17 | RESTful API 服务 |
| 前端管理后台 | Vue 3 + Vite + Element Plus | PC 端管理系统 |
| 微信小程序 | 原生小程序 | 客户端应用 |
| 图片服务器 | Nginx 1.28.3 | 静态资源服务 |

---

## 功能特性

### PC 端管理后台

- **用户管理**：用户账号管理、角色权限控制（超级管理员、店铺管理员、店员）
- **店铺管理**：多店铺管理、店铺信息维护
- **商品管理**：商品分类、商品信息维护、商品图片上传
- **库存管理**：库存查询、入库/出库操作、库存记录、库存预警
- **会员管理**：会员信息管理、会员等级、积分管理
- **销售管理**：收银台（POS）、订单管理、预定订单
- **数据统计**：销售统计、库存统计、会员统计
- **系统功能**：操作日志、个人中心

### 微信小程序客户端

- **首页**：商品展示、店铺选择
- **商品预定**：商品浏览、预定下单
- **订单管理**：订单列表、订单详情
- **会员中心**：会员注册/登录、积分查询、个人设置

---

## 技术栈

### 后端技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| JDK | 17+ | Java 运行环境 |
| Spring Boot | 3.2.2 | 核心框架 |
| Spring Security | 6.2.x | 安全框架 |
| MyBatis-Plus | 3.5.5 | ORM 框架 |
| MySQL | 8.0+ | 关系型数据库 |
| JWT (JJWT) | 0.12.5 | Token 认证 |
| Hutool | 5.8.25 | 工具类库 |
| Lombok | - | 代码简化 |
| Maven | 3.8+ | 项目构建 |

### 前端技术栈

| 技术 | 版本 | 说明 |
|------|------|------|
| Vue.js | 3.5.30 | 渐进式框架 |
| Vite | 8.0.1 | 构建工具 |
| Vue Router | 4.6.4 | 路由管理 |
| Pinia | 3.0.4 | 状态管理 |
| Element Plus | 2.13.6 | UI 组件库 |
| ECharts | 6.0.0 | 数据可视化 |
| Axios | 1.13.6 | HTTP 客户端 |

### 微信小程序

| 技术 | 说明 |
|------|------|
| 原生小程序框架 | 微信小程序原生开发 |
| WeUI | 微信原生视觉体验 |

---

## 环境要求

### 开发环境

- **操作系统**：Windows 10/11、macOS 10.14+、Ubuntu 18.04+
- **内存**：建议 8GB 以上
- **硬盘**：建议 20GB 以上可用空间

### 软件要求

| 软件 | 最低版本 | 推荐版本 |
|------|----------|----------|
| JDK | 17 | 17.0.9 |
| Node.js | 18 | 20.x LTS |
| npm | 9.x | 10.x |
| MySQL | 8.0 | 8.0.35 |
| Maven | 3.8 | 3.9.6 |
| Nginx | 1.20 | 1.28.3（已提供） |

---

## 项目结构

```
ShafirStore-Manage/
├── shafirStore-manage/          # 后端项目
│   ├── src/main/
│   │   ├── java/com/shafir/store/
│   │   │   ├── common/          # 公共组件
│   │   │   │   ├── aspect/      # AOP 切面
│   │   │   │   ├── constant/    # 常量定义
│   │   │   │   ├── context/     # 上下文
│   │   │   │   ├── dto/         # 数据传输对象
│   │   │   │   ├── exception/   # 异常处理
│   │   │   │   ├── filter/      # 过滤器
│   │   │   │   ├── result/      # 统一响应
│   │   │   │   └── utils/       # 工具类
│   │   │   ├── config/          # 配置类
│   │   │   ├── controller/      # 控制器层
│   │   │   ├── entity/          # 实体类
│   │   │   ├── repository/      # 数据访问层
│   │   │   ├── security/        # 安全组件
│   │   │   └── service/         # 服务层
│   │   └── resources/
│   │       └── application.yml  # 配置文件
│   └── pom.xml
│
├── shafirstore-frontend/        # 前端项目
│   ├── src/
│   │   ├── api/                 # API 接口
│   │   ├── assets/              # 静态资源
│   │   ├── components/          # 公共组件
│   │   ├── layout/              # 布局组件
│   │   ├── router/              # 路由配置
│   │   ├── store/               # 状态管理
│   │   └── views/               # 页面组件
│   │       ├── admin/           # 管理员功能
│   │       ├── home/            # 首页
│   │       ├── inventory/       # 库存管理
│   │       ├── login/           # 登录
│   │       ├── member/          # 会员管理
│   │       ├── product/         # 商品管理
│   │       ├── sale/            # 销售管理
│   │       ├── statistics/      # 数据统计
│   │       └── system/          # 系统管理
│   ├── public/
│   ├── package.json
│   └── vite.config.js
│
├── shafirstore-mini/            # 微信小程序
│   ├── miniprogram/
│   │   ├── images/              # 图片资源
│   │   ├── pages/               # 页面
│   │   │   ├── cart/            # 购物车
│   │   │   ├── index/           # 首页
│   │   │   ├── member/          # 会员中心
│   │   │   ├── order/           # 订单
│   │   │   ├── product/         # 商品
│   │   │   ├── store/           # 店铺选择
│   │   │   └── user/            # 用户
│   │   ├── utils/               # 工具类
│   │   ├── app.js
│   │   ├── app.json
│   │   └── app.wxss
│   └── project.config.json
│
├── nginx-1.28.3/                # Nginx 图片服务器
│   ├── conf/
│   ├── images/products/         # 商品图片存储
│   └── nginx.exe
│
├── sql/                         # 数据库脚本
│   ├── shafir_store.sql         # 完整数据库（推荐）
│   ├── init_multi_store_data.sql
│   └── ...
│
└── PROJECT_STARTUP_GUIDE.md     # 详细启动指南
```

---

## 快速开始

### 1. 数据库初始化

```bash
# 登录 MySQL
mysql -u root -p

# 创建数据库
CREATE DATABASE shafir_store DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
EXIT;

# 执行初始化脚本（推荐使用 shafir_store.sql）
mysql -u root -p shafir_store < sql/shafir_store.sql
```

### 2. 修改配置文件

编辑 `shafirStore-manage/src/main/resources/application.yml`：

```yaml
spring:
  datasource:
    url: jdbc:mysql://localhost:3306/shafir_store?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai&allowPublicKeyRetrieval=true
    username: root
    password: 123456  # 修改为你的密码

upload:
  path: C:/Users/Administrator/Desktop/宝宝的毕业设计/ShafirStore-Manage/nginx-1.28.3/images/products
  base-url: http://localhost:8081/images/products
```

### 3. 启动 Nginx 图片服务器

```bash
cd nginx-1.28.3
.\nginx.exe
```

### 4. 启动后端服务

```bash
cd shafirStore-manage
mvn spring-boot:run
```

后端服务启动于 http://localhost:8080

### 5. 启动前端服务

```bash
cd shafirstore-frontend
npm install
npm run dev
```

前端服务启动于 http://localhost:5173

### 6. 启动微信小程序

1. 下载并安装 [微信开发者工具](https://developers.weixin.qq.com/miniprogram/dev/devtools/download.html)
2. 导入项目 `shafirstore-mini/miniprogram`
3. 修改 `utils/request.js` 中的接口地址

---

## 默认账号

| 角色 | 用户名 | 密码 | 权限说明 |
|------|--------|------|----------|
| 超级管理员 | admin | 123456 | 所有权限 |
| 店铺管理员 | admin_zongdian | 123456 | 店铺管理权限 |
| 店员 | zhangsan | 123456 | 基础操作权限 |

---

## 端口说明

| 服务 | 端口 | 说明 |
|------|------|------|
| 后端 API | 8080 | Spring Boot 服务 |
| 前端开发服务器 | 5173 | Vite 开发服务器 |
| 图片服务器 | 8081 | Nginx 静态资源 |
| MySQL | 3306 | 数据库服务 |

---

## API 接口

### 认证接口

```
POST /api/auth/login     # 用户登录
POST /api/auth/register  # 用户注册
```

### 商品接口

```
GET  /api/products       # 商品列表
GET  /api/products/{id}  # 商品详情
POST /api/products       # 新增商品
PUT  /api/products/{id}  # 更新商品
DELETE /api/products/{id} # 删除商品
```

### 库存接口

```
GET  /api/inventory      # 库存列表
POST /api/inventory/in   # 入库
POST /api/inventory/out  # 出库
GET  /api/inventory/records # 库存记录
GET  /api/inventory/alerts  # 库存预警
```

### 订单接口

```
GET  /api/orders         # 订单列表
GET  /api/orders/{id}    # 订单详情
POST /api/orders         # 创建订单
PUT  /api/orders/{id}/status # 更新订单状态
```

---

## 数据库表结构

### 核心数据表

| 表名 | 说明 |
|------|------|
| sys_user | 系统用户表 |
| role | 角色表 |
| store | 店铺表 |
| product | 商品表 |
| product_category | 商品分类表 |
| inventory | 库存表 |
| inventory_record | 库存记录表 |
| member | 会员表 |
| member_level | 会员等级表 |
| order | 订单表 |
| order_item | 订单明细表 |
| reservation_order | 预定订单表 |
| operation_log | 操作日志表 |

---

## 常见问题

### Q1: 端口被占用

```bash
# 查看端口占用
netstat -ano | findstr "8080"

# 结束进程
taskkill /PID <PID> /F
```

### Q2: Maven 依赖下载失败

配置阿里云镜像，编辑 `MAVEN_HOME/conf/settings.xml`：

```xml
<mirror>
    <id>aliyun</id>
    <mirrorOf>central</mirrorOf>
    <name>Aliyun Maven</name>
    <url>https://maven.aliyun.com/repository/central</url>
</mirror>
```

### Q3: 前端无法连接后端

检查 `vite.config.js` 中的代理配置：

```javascript
server: {
  proxy: {
    '/api': {
      target: 'http://localhost:8080',
      changeOrigin: true
    }
  }
}
```

### Q4: 图片上传失败

1. 确认 Nginx 已启动
2. 检查上传目录权限
3. 检查 `application.yml` 中的 `upload.path` 配置

---

## 相关文档

| 文档 | 说明 |
|------|------|
| [PROJECT_STARTUP_GUIDE.md](PROJECT_STARTUP_GUIDE.md) | 详细启动指南 |
| 技术栈方案.md | 技术选型说明 |
| 小程序完整开发流程.md | 微信小程序开发 |
| 多店铺改造方案.md | 多店铺功能说明 |

---

## License

本项目仅用于毕业设计学习参考。
