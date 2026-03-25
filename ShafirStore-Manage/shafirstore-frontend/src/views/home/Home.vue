<template>
  <div class="home-container">
    <h1>欢迎使用莎菲尔菓子门店管理系统</h1>
    <el-row :gutter="20" class="stats-row">
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-icon" style="background: #409eff">
            <el-icon><Goods /></el-icon>
          </div>
          <div class="stat-info">
            <p class="stat-label">商品数量</p>
            <p class="stat-value">{{ stats.productCount }}</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-icon" style="background: #67c23a">
            <el-icon><Sell /></el-icon>
          </div>
          <div class="stat-info">
            <p class="stat-label">今日订单</p>
            <p class="stat-value">{{ stats.todayOrders }}</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-icon" style="background: #e6a23c">
            <el-icon><User /></el-icon>
          </div>
          <div class="stat-info">
            <p class="stat-label">会员数量</p>
            <p class="stat-value">{{ stats.memberCount }}</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-icon" style="background: #f56c6c">
            <el-icon><Warning /></el-icon>
          </div>
          <div class="stat-info">
            <p class="stat-label">库存预警</p>
            <p class="stat-value">{{ stats.alertCount }}</p>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="mt-20">
      <el-col :span="12">
        <el-card>
          <template #header>
            <span>销售趋势</span>
          </template>
          <div class="chart-placeholder">
            <p>近7天销售趋势图</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="12">
        <el-card>
          <template #header>
            <span>快捷操作</span>
          </template>
          <div class="quick-actions">
            <el-button type="primary" @click="$router.push('/sale')">收银结账</el-button>
            <el-button type="success" @click="$router.push('/product')">商品管理</el-button>
            <el-button type="warning" @click="$router.push('/inventory')">库存管理</el-button>
            <el-button type="info" @click="$router.push('/member')">会员管理</el-button>
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { Goods, Sell, User, Warning } from '@element-plus/icons-vue'

const stats = ref({
  productCount: 12,
  todayOrders: 0,
  memberCount: 3,
  alertCount: 0
})

onMounted(() => {
  console.log('首页加载完成')
})
</script>

<style scoped>
.home-container h1 {
  margin-bottom: 20px;
  color: #333;
}

.stats-row {
  margin-bottom: 20px;
}

.stat-card {
  display: flex;
  align-items: center;
  gap: 15px;
}

.stat-icon {
  width: 60px;
  height: 60px;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 28px;
  color: white;
}

.stat-info {
  flex: 1;
}

.stat-label {
  font-size: 14px;
  color: #999;
  margin-bottom: 5px;
}

.stat-value {
  font-size: 24px;
  font-weight: bold;
  color: #333;
}

.chart-placeholder {
  height: 200px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f5f5f5;
  border-radius: 4px;
  color: #999;
}

.quick-actions {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
}
</style>
