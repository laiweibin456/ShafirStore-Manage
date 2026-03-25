# 莎菲尔菓子门店管理系统

## 项目简介

莎菲尔菓子门店管理系统是一套面向烘焙门店的综合性管理平台，采用前后端分离架构实现。主要功能包括员工管理、商品管理、库存管理、会员管理、销售订单管理等核心模块。

## 技术栈清单

### 后端技术栈

| 技术组件 | 名称 | 版本号 | 说明 |
|---------|------|--------|------|
| **Java** | JDK | 17+ | 运行环境 |
| **Spring Boot** | 框架 | 3.2.2 | 核心开发框架 |
| **Spring Security** | 安全框架 | 6.2.x | 身份认证与授权 |
| **MyBatis-Plus** | ORM框架 | 3.5.5 | 数据库访问层 |
| **MySQL** | 数据库 | 8.0+ | 关系型数据库 |
| **JWT** | Token认证 | 0.12.5 | 无状态身份令牌 |
| **JJWT** | JWT实现 | 0.12.5 | JSON Web Token |
| **Hutool** | 工具库 | 5.8.25 | 工具类集合 |
| **Lombok** | 注解处理器 | - | 简化代码 |
| **Maven** | 构建工具 | 3.8+ | 项目构建与依赖管理 |

### 前端技术栈

| 技术组件 | 名称 | 版本号 | 说明 |
|---------|------|--------|------|
| **Vue.js** | 渐进式框架 | 3.5.30 | 核心框架 |
| **Vite** | 构建工具 | 8.0.1 | 开发服务器与打包 |
| **Vue Router** | 路由管理 | 4.6.4 | 单页应用路由 |
| **Pinia** | 状态管理 | 3.0.4 | Vue状态管理 |
| **Axios** | HTTP客户端 | 1.13.6 | API请求 |
| **Element Plus** | UI组件库 | 2.13.6 | 桌面端组件库 |
| **ECharts** | 数据可视化 | 6.0.0 | 图表库 |

### 开发工具

| 工具 | 名称 | 说明 |
|------|------|------|
| **IDE** | IntelliJ IDEA / VS Code | 后端/前端开发IDE |
| **数据库工具** | Navicat / DataGrip | 数据库管理 |
| **API测试** | Postman | 接口调试 |
| **版本控制** | Git | 代码版本管理 |

## 环境要求

### 开发环境

- **操作系统**: Windows 10/11、macOS、Linux
- **内存**: 建议 8GB 以上
- **硬盘**: 建议 20GB 以上可用空间

### 运行要求

- **JDK**: 17 或更高版本
- **Node.js**: 18 或更高版本
- **MySQL**: 8.0 或更高版本
- **Maven**: 3.8 或更高版本

## 项目结构

```
ShafirStore-Manage/
├── shafirStore-manage/          # 后端项目
│   ├── src/
│   │   └── main/
│   │       ├── java/com/shafir/store/
│   │       │   ├── controller/   # 控制器层
│   │       │   ├── service/     # 服务层
│   │       │   ├── repository/  # 数据访问层
│   │       │   ├── entity/      # 实体类
│   │       │   ├── common/      # 公共组件
│   │       │   └── config/      # 配置类
│   │       └── resources/
│   │           └── application.yml
│   └── pom.xml
│
├── shafirstore-frontend/       # 前端项目
│   ├── src/
│   │   ├── api/                 # API接口
│   │   ├── assets/              # 静态资源
│   │   ├── components/          # 公共组件
│   │   ├── layout/              # 布局组件
│   │   ├── router/              # 路由配置
│   │   ├── store/               # 状态管理
│   │   └── views/               # 页面组件
│   ├── public/                  # 公共静态资源
│   ├── package.json
│   └── vite.config.js
│
└── sql/                         # 数据库脚本
    └── init_database.sql
```

## 快速开始

### 1. 环境准备

确保已安装 JDK 17+、Node.js 18+、MySQL 8.0+ 和 Maven 3.8+。

### 2. 数据库初始化

```bash
# 登录MySQL并创建数据库
mysql -u root -p
CREATE DATABASE shafir_store DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
EXIT;

# 执行数据库初始化脚本
mysql -u root -p shafir_store < sql/init_database.sql
```

### 3. 启动后端服务

```bash
cd shafirStore-manage
mvn spring-boot:run
```

后端服务启动于 http://localhost:8080

### 4. 启动前端服务

```bash
cd shafirstore-frontend
npm install
npm run dev
```

前端服务启动于 http://localhost:5173

### 5. 登录测试

- **账号**: admin
- **密码**: 123456

## 默认账号

| 账号 | 密码 | 角色 |
|------|------|------|
| admin | 123456 | 店长 |
| zhangsan | 123456 | 店员 |

## License

本项目仅用于毕业设计学习参考。
