<template>
  <el-container class="layout-container">
    <el-header class="header">
      <div class="header-left">
        <h2>莎菲尔菓子门店管理系统</h2>
      </div>
      <div class="header-right">
        <el-select
          v-if="shopStore.storeList.length > 0"
          v-model="shopStore.currentStoreId"
          placeholder="选择店铺"
          class="store-selector"
          @change="handleStoreChange"
        >
          <el-option
            v-for="store in shopStore.storeList"
            :key="store.id"
            :label="store.storeName"
            :value="store.id"
          />
        </el-select>

        <span class="username">{{ userStore.realName || userStore.username }}</span>
        <el-dropdown @command="handleCommand">
          <span class="user-dropdown">
            <el-icon><Avatar /></el-icon>
          </span>
          <template #dropdown>
            <el-dropdown-menu>
              <el-dropdown-item command="profile">个人中心</el-dropdown-item>
              <el-dropdown-item command="logout" divided>退出登录</el-dropdown-item>
            </el-dropdown-menu>
          </template>
        </el-dropdown>
      </div>
    </el-header>

    <el-container>
      <el-aside width="200px" class="sidebar">
        <el-menu
          :default-active="activeMenu"
          router
          class="sidebar-menu"
        >
          <el-menu-item index="/home">
            <el-icon><HomeFilled /></el-icon>
            <span>首页</span>
          </el-menu-item>

          <el-menu-item index="/product">
            <el-icon><Goods /></el-icon>
            <span>商品管理</span>
          </el-menu-item>

          <el-sub-menu index="/inventory">
            <template #title>
              <el-icon><Box /></el-icon>
              <span>库存管理</span>
            </template>
            <el-menu-item index="/inventory">
              <el-icon><List /></el-icon>
              <span>库存列表</span>
            </el-menu-item>
            <el-menu-item index="/inventory/in">
              <el-icon><Top /></el-icon>
              <span>商品入库</span>
            </el-menu-item>
            <el-menu-item index="/inventory/out">
              <el-icon><Bottom /></el-icon>
              <span>商品出库</span>
            </el-menu-item>
            <el-menu-item index="/inventory/records">
              <el-icon><Document /></el-icon>
              <span>库存记录</span>
            </el-menu-item>
            <el-menu-item index="/inventory/alerts">
              <el-icon><Warning /></el-icon>
              <span>库存预警</span>
            </el-menu-item>
          </el-sub-menu>

          <el-sub-menu index="/sale">
            <template #title>
              <el-icon><Sell /></el-icon>
              <span>销售管理</span>
            </template>
            <el-menu-item index="/sale">
              <el-icon><ShoppingCart /></el-icon>
              <span>收银台</span>
            </el-menu-item>
            <el-menu-item index="/sale/order">
              <el-icon><Document /></el-icon>
              <span>订单管理</span>
            </el-menu-item>
          </el-sub-menu>

          <el-menu-item v-if="userStore.isAdmin" index="/member">
            <el-icon><User /></el-icon>
            <span>会员管理</span>
          </el-menu-item>

          <el-sub-menu v-if="userStore.isAdmin" index="/statistics">
            <template #title>
              <el-icon><DataAnalysis /></el-icon>
              <span>统计分析</span>
            </template>
            <el-menu-item index="/statistics/sales">
              <el-icon><TrendCharts /></el-icon>
              <span>销售统计</span>
            </el-menu-item>
            <el-menu-item index="/statistics/inventory">
              <el-icon><Box /></el-icon>
              <span>库存统计</span>
            </el-menu-item>
            <el-menu-item index="/statistics/member">
              <el-icon><User /></el-icon>
              <span>会员统计</span>
            </el-menu-item>
          </el-sub-menu>

          <el-menu-item v-if="userStore.isAdmin" index="/system/user">
            <el-icon><Setting /></el-icon>
            <span>用户管理</span>
          </el-menu-item>

          <el-menu-item v-if="userStore.isSuperAdmin" index="/admin/stores">
            <el-icon><OfficeBuilding /></el-icon>
            <span>店铺管理</span>
          </el-menu-item>

          <el-menu-item v-if="userStore.isSuperAdmin" index="/admin/dashboard">
            <el-icon><Monitor /></el-icon>
            <span>总控仪表盘</span>
          </el-menu-item>
        </el-menu>
      </el-aside>

      <el-main class="main-content">
        <router-view />
      </el-main>
    </el-container>
  </el-container>
</template>

<script setup>
import { computed, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { useUserStore } from '@/store/user'
import { useShopStore } from '@/store/shop'
import { ElMessage } from 'element-plus'
import {
  HomeFilled, Goods, Box, Sell, User, DataAnalysis, Setting, Avatar,
  List, Top, Bottom, Document, Warning, ShoppingCart, TrendCharts,
  OfficeBuilding, Monitor
} from '@element-plus/icons-vue'

const router = useRouter()
const route = useRoute()
const userStore = useUserStore()
const shopStore = useShopStore()

const activeMenu = computed(() => route.path)

onMounted(async () => {
  if (userStore.isLoggedIn) {
    try {
      await shopStore.fetchStoreList()
      if (userStore.storeId && !shopStore.currentStoreId) {
        shopStore.setCurrentStore(userStore.storeId, '')
      }
    } catch (error) {
      console.error('获取店铺列表失败:', error)
    }
  }
})

const handleStoreChange = async (storeId) => {
  try {
    const res = await shopStore.switchCurrentStore(storeId)
    if (res.data && res.data.userInfo) {
      userStore.updateUserInfo(res.data.userInfo)
    }
    if (res.data && res.data.token) {
      localStorage.setItem('token', res.data.token)
    }
    ElMessage.success('已切换到：' + shopStore.currentStoreName)
  } catch (error) {
    ElMessage.error('切换店铺失败')
  }
}

const handleCommand = async (command) => {
  if (command === 'logout') {
    await userStore.logout()
    ElMessage.success('已退出登录')
    router.push('/login')
  } else if (command === 'profile') {
    router.push('/profile')
  }
}
</script>

<style scoped>
.layout-container {
  height: 100vh;
}

.header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #fff;
  border-bottom: 1px solid #e6e6e6;
  padding: 0 20px;
}

.header-left h2 {
  font-size: 18px;
  color: #333;
  margin: 0;
}

.header-right {
  display: flex;
  align-items: center;
  gap: 10px;
}

.store-selector {
  width: 200px;
}

.username {
  font-size: 14px;
  color: #666;
}

.user-dropdown {
  cursor: pointer;
  display: flex;
  align-items: center;
  font-size: 20px;
  color: #666;
}

.sidebar {
  background: #f5f5f5;
  border-right: 1px solid #e6e6e6;
}

.sidebar-menu {
  border-right: none;
  background: transparent;
}

.main-content {
  background: #f8f8f8;
  padding: 20px;
  overflow-y: auto;
}
</style>
