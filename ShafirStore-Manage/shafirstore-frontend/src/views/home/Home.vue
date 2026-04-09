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
            <p class="stat-value">{{ stats.todayOrders }} 单</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-icon" style="background: #e6a23c">
            <el-icon><Coin /></el-icon>
          </div>
          <div class="stat-info">
            <p class="stat-label">今日销售额</p>
            <p class="stat-value">¥{{ stats.todaySales }}</p>
          </div>
        </el-card>
      </el-col>
      <el-col :span="6">
        <el-card class="stat-card">
          <div class="stat-icon" style="background: #9b59b6">
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
          <div ref="chartRef" class="chart-container"></div>
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
import { ref, onMounted, onUnmounted } from 'vue'
import { Goods, Sell, User, Warning, Coin } from '@element-plus/icons-vue'
import { getTodayOrderCount, getTodaySalesAmount } from '@/api/order'
import { getProductList } from '@/api/product'
import { getMemberCount } from '@/api/member'
import { getLowStockAlerts } from '@/api/inventory'
import { getDailySales } from '@/api/statistics'
import * as echarts from 'echarts'

const stats = ref({
  productCount: 0,
  todayOrders: 0,
  todaySales: 0,
  memberCount: 0,
  alertCount: 0
})

const chartRef = ref(null)
let chartInstance = null

const fetchProductCount = async () => {
  try {
    const res = await getProductList({ page: 1, pageSize: 1 })
    stats.value.productCount = res.data.total || 0
  } catch (error) {
    console.error('获取商品数量失败', error)
  }
}

const fetchMemberCount = async () => {
  try {
    const res = await getMemberCount()
    stats.value.memberCount = res.data || 0
  } catch (error) {
    console.error('获取会员数量失败', error)
  }
}

const fetchAlertCount = async () => {
  try {
    const res = await getLowStockAlerts()
    const alerts = res.data || []
    stats.value.alertCount = alerts.length || 0
  } catch (error) {
    console.error('获取库存预警失败', error)
  }
}

const fetchSalesData = async () => {
  try {
    const res = await getDailySales({ days: 7 })
    const salesData = res.data || []
    updateChart(salesData)
  } catch (error) {
    console.error('获取销售数据失败', error)
    const defaultData = [
      { date: getDay(-6), amount: 0 },
      { date: getDay(-5), amount: 0 },
      { date: getDay(-4), amount: 0 },
      { date: getDay(-3), amount: 0 },
      { date: getDay(-2), amount: 0 },
      { date: getDay(-1), amount: 0 },
      { date: getDay(0), amount: 0 }
    ]
    updateChart(defaultData)
  }
}

const getDay = (offset) => {
  const date = new Date()
  date.setDate(date.getDate() + offset)
  const month = date.getMonth() + 1
  const day = date.getDate()
  return `${month}-${day}`
}

const updateChart = (salesData) => {
  if (!chartRef.value) return

  const dates = salesData.map(item => item.date)
  const amounts = salesData.map(item => item.amount || 0)

  if (!chartInstance) {
    chartInstance = echarts.init(chartRef.value)
  }

  const option = {
    tooltip: {
      trigger: 'axis',
      formatter: '{b}<br/>销售额: ¥{c}'
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      boundaryGap: false,
      data: dates
    },
    yAxis: {
      type: 'value',
      axisLabel: {
        formatter: '¥{value}'
      }
    },
    series: [
      {
        name: '销售额',
        type: 'line',
        smooth: true,
        data: amounts,
        areaStyle: {
          color: {
            type: 'linear',
            x: 0,
            y: 0,
            x2: 0,
            y2: 1,
            colorStops: [
              { offset: 0, color: 'rgba(64, 158, 255, 0.3)' },
              { offset: 1, color: 'rgba(64, 158, 255, 0.05)' }
            ]
          }
        },
        itemStyle: {
          color: '#409eff'
        },
        lineStyle: {
          color: '#409eff'
        }
      }
    ]
  }

  chartInstance.setOption(option)
}

const handleResize = () => {
  if (chartInstance) {
    chartInstance.resize()
  }
}

const fetchStats = async () => {
  try {
    const [orderCountRes, salesRes] = await Promise.all([
      getTodayOrderCount(),
      getTodaySalesAmount()
    ])
    stats.value.todayOrders = orderCountRes.data || 0
    stats.value.todaySales = salesRes.data || 0

    await Promise.all([
      fetchProductCount(),
      fetchMemberCount(),
      fetchAlertCount()
    ])

    await fetchSalesData()
  } catch (error) {
    console.error('获取今日数据失败', error)
  }
}

onMounted(() => {
  fetchStats()
  window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
  if (chartInstance) {
    chartInstance.dispose()
    chartInstance = null
  }
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

.chart-container {
  height: 250px;
  width: 100%;
}

.quick-actions {
  display: flex;
  gap: 10px;
  flex-wrap: wrap;
}
</style>
