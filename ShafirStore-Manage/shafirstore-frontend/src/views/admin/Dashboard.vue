<template>
  <div class="admin-dashboard">
    <div class="page-header">
      <h2>总控仪表盘</h2>
    </div>

    <el-row :gutter="20" class="summary-row">
      <el-col :span="6">
        <el-card shadow="hover">
          <div class="stat-card">
            <div class="stat-value">{{ overview.storeCount || 0 }}</div>
            <div class="stat-label">店铺总数</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover">
          <div class="stat-card">
            <div class="stat-value">{{ overview.todayTotalCount || 0 }}</div>
            <div class="stat-label">今日总订单</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover">
          <div class="stat-card">
            <div class="stat-value">¥{{ formatAmount(overview.todayTotalAmount) }}</div>
            <div class="stat-label">今日总销售额</div>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card shadow="hover">
          <div class="stat-card">
            <div class="stat-value">{{ overview.todayTotalCount > 0 ? (overview.todayTotalAmount / overview.todayTotalCount).toFixed(2) : '0.00' }}</div>
            <div class="stat-label">平均客单价</div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-card class="store-table-card">
      <template #header>
        <span>各店铺今日经营数据</span>
      </template>
      <el-table :data="overview.storeStats || []" border stripe v-loading="loading">
        <el-table-column prop="storeId" label="店铺ID" width="80" />
        <el-table-column prop="storeName" label="店铺名称" width="200" />
        <el-table-column prop="orderCount" label="今日订单数" width="120" />
        <el-table-column prop="totalAmount" label="今日销售额" width="150">
          <template #default="{ row }">
            ¥{{ formatAmount(row.totalAmount) }}
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import request from '@/api/request'
import { ElMessage } from 'element-plus'

const loading = ref(false)
const overview = ref({})

const fetchOverview = async () => {
  loading.value = true
  try {
    const res = await request({
      url: '/statistics/cross-store',
      method: 'get'
    })
    overview.value = res.data || {}
  } catch (error) {
    ElMessage.error('获取跨店铺统计失败')
  } finally {
    loading.value = false
  }
}

const formatAmount = (amount) => {
  if (!amount) return '0.00'
  return Number(amount).toFixed(2)
}

onMounted(() => {
  fetchOverview()
})
</script>

<style scoped>
.admin-dashboard {
  padding: 0;
}

.page-header {
  margin-bottom: 20px;
}

.page-header h2 {
  margin: 0;
  font-size: 20px;
}

.summary-row {
  margin-bottom: 20px;
}

.stat-card {
  text-align: center;
  padding: 10px 0;
}

.stat-value {
  font-size: 28px;
  font-weight: bold;
  color: #409eff;
  margin-bottom: 8px;
}

.stat-label {
  font-size: 14px;
  color: #999;
}

.store-table-card {
  margin-top: 20px;
}
</style>
