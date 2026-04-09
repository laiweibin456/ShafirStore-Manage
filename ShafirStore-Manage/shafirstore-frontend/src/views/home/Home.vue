<template>
  <div class="home-container">
    <div class="welcome-section">
      <div class="welcome-content">
        <h1 class="welcome-title">{{ greeting }}，{{ userStore.realName || userStore.username }}</h1>
        <p class="welcome-subtitle">欢迎使用莎菲尔菓子门店管理系统，祝您工作愉快！</p>
      </div>
      <div class="welcome-time">
        <p class="current-date">{{ currentDate }}</p>
        <p class="current-time">{{ currentTime }}</p>
      </div>
    </div>

    <el-row :gutter="20" class="stats-row">
      <el-col :span="6" v-for="(stat, index) in statsData" :key="index">
        <el-card class="stat-card" :class="`stat-card-${index}`" @click="handleStatClick(stat.path)">
          <div class="stat-content">
            <div class="stat-info">
              <p class="stat-label">{{ stat.label }}</p>
              <p class="stat-value">{{ stat.value }}</p>
              <p class="stat-change" :class="stat.changeType">
                <el-icon v-if="stat.changeType === 'up'"><Top /></el-icon>
                <el-icon v-else-if="stat.changeType === 'down'"><Bottom /></el-icon>
                <span>{{ stat.change }}</span>
              </p>
            </div>
            <div class="stat-icon-wrapper">
              <el-icon class="stat-icon"><component :is="stat.icon" /></el-icon>
            </div>
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="chart-section">
      <el-col :span="16">
        <el-card class="chart-card">
          <template #header>
            <div class="card-header">
              <span class="card-title">销售趋势</span>
              <el-radio-group v-model="salesPeriod" size="small" @change="handlePeriodChange">
                <el-radio-button label="7">近7天</el-radio-button>
                <el-radio-button label="30">近30天</el-radio-button>
              </el-radio-group>
            </div>
          </template>
          <div ref="salesChartRef" class="chart-container"></div>
        </el-card>
      </el-col>

      <el-col :span="8">
        <el-card class="rank-card">
          <template #header>
            <span class="card-title">销售排行 TOP 5</span>
          </template>
          <div class="rank-list">
            <div v-for="(item, index) in productRanking" :key="index" class="rank-item">
              <span class="rank-number" :class="`rank-${index + 1}`">{{ index + 1 }}</span>
              <span class="rank-name">{{ item.productName || item.name || '未知商品' }}</span>
              <span class="rank-sales">{{ item.salesCount || item.sales || item.quantity || 0 }} 单</span>
            </div>
            <el-empty v-if="productRanking.length === 0" description="暂无排行数据" />
          </div>
        </el-card>
      </el-col>
    </el-row>

    <el-row :gutter="20" class="bottom-section">
      <el-col :span="12">
        <el-card class="order-card">
          <template #header>
            <div class="card-header">
              <span class="card-title">近期订单</span>
              <el-button type="primary" link @click="$router.push('/sale/order')">查看更多</el-button>
            </div>
          </template>
          <el-table :data="recentOrders" style="width: 100%" :show-header="true">
            <el-table-column prop="orderNo" label="订单号" width="120" />
            <el-table-column prop="totalAmount" label="金额" width="80">
              <template #default="scope">
                <span class="amount">¥{{ scope.row.totalAmount || scope.row.amount || 0 }}</span>
              </template>
            </el-table-column>
            <el-table-column prop="status" label="状态">
              <template #default="scope">
                <el-tag :type="getOrderStatusType(scope.row.status)" size="small">
                  {{ getOrderStatusText(scope.row.status) }}
                </el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="createTime" label="时间" width="100">
              <template #default="scope">
                {{ formatTime(scope.row.createTime) }}
              </template>
            </el-table-column>
          </el-table>
        </el-card>
      </el-col>

      <el-col :span="12">
        <el-card class="alert-card">
          <template #header>
            <div class="card-header">
              <span class="card-title">库存预警</span>
              <el-button type="primary" link @click="$router.push('/inventory/alerts')">查看更多</el-button>
            </div>
          </template>
          <div class="alert-list">
            <el-alert
              v-for="(alert, index) in lowStockAlerts"
              :key="index"
              :title="`${getAlertProductName(alert)} 库存不足`"
              type="warning"
              :description="`当前库存: ${alert.stockQuantity || alert.stock || alert.quantity || 0} ${alert.unit || '个'}`"
              show-icon
              :closable="false"
              class="alert-item"
            />
            <el-empty v-if="lowStockAlerts.length === 0" description="暂无库存预警" />
          </div>
        </el-card>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted, onUnmounted, nextTick } from 'vue'
import { useRouter } from 'vue-router'
import { useUserStore } from '@/store/user'
import {
  Goods, Sell, Coin, User,
  Top, Bottom
} from '@element-plus/icons-vue'
import { getTodayOrderCount, getTodaySalesAmount } from '@/api/order'
import { getProductList } from '@/api/product'
import { getMemberCount } from '@/api/member'
import { getLowStockAlerts } from '@/api/inventory'
import { getDailySales, getProductSalesRanking } from '@/api/statistics'
import { getOrderList } from '@/api/order'
import * as echarts from 'echarts'

const router = useRouter()
const userStore = useUserStore()

const salesPeriod = ref('7')
const salesChartRef = ref(null)
const recentOrders = ref([])
const productRanking = ref([])
const lowStockAlerts = ref([])

let chartInstance = null
let timeInterval = null

const statsData = reactive([
  {
    label: '商品数量',
    value: 0,
    icon: Goods,
    path: '/product',
    change: '总商品数',
    changeType: 'neutral'
  },
  {
    label: '今日订单',
    value: 0,
    icon: Sell,
    path: '/sale/order',
    change: '较昨日',
    changeType: 'up'
  },
  {
    label: '今日销售额',
    value: 0,
    icon: Coin,
    path: '/sale/order',
    change: '较昨日',
    changeType: 'up'
  },
  {
    label: '会员数量',
    value: 0,
    icon: User,
    path: '/member',
    change: '总会员数',
    changeType: 'neutral'
  }
])

const currentDate = ref('')
const currentTime = ref('')

const greeting = computed(() => {
  const hour = new Date().getHours()
  if (hour < 6) return '凌晨好'
  if (hour < 9) return '早上好'
  if (hour < 12) return '上午好'
  if (hour < 14) return '中午好'
  if (hour < 18) return '下午好'
  if (hour < 22) return '晚上好'
  return '夜里好'
})

const updateDateTime = () => {
  const now = new Date()
  const year = now.getFullYear()
  const month = String(now.getMonth() + 1).padStart(2, '0')
  const day = String(now.getDate()).padStart(2, '0')
  const hours = String(now.getHours()).padStart(2, '0')
  const minutes = String(now.getMinutes()).padStart(2, '0')
  const seconds = String(now.getSeconds()).padStart(2, '0')

  currentDate.value = `${year}-${month}-${day}`
  currentTime.value = `${hours}:${minutes}:${seconds}`
}

const formatTime = (timeStr) => {
  if (!timeStr) return ''
  const date = new Date(timeStr)
  if (isNaN(date.getTime())) return timeStr
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  const hours = String(date.getHours()).padStart(2, '0')
  const minutes = String(date.getMinutes()).padStart(2, '0')
  return `${month}-${day} ${hours}:${minutes}`
}

const handleStatClick = (path) => {
  router.push(path)
}

const fetchStats = async () => {
  try {
    const [orderCountRes, salesRes] = await Promise.all([
      getTodayOrderCount(),
      getTodaySalesAmount()
    ])

    statsData[1].value = orderCountRes.data ?? orderCountRes?.data?.count ?? 0
    statsData[2].value = salesRes.data ?? salesRes?.data?.amount ?? 0

    const productRes = await getProductList({ page: 1, pageSize: 1 })
    statsData[0].value = productRes.data?.total ?? productRes.data?.length ?? 0

    const memberRes = await getMemberCount()
    statsData[3].value = memberRes.data ?? memberRes?.data?.count ?? 0
  } catch (error) {
    console.error('获取统计数据失败', error)
  }
}

const generateDefaultChartData = (days) => {
  const data = []
  for (let i = days - 1; i >= 0; i--) {
    const date = new Date()
    date.setDate(date.getDate() - i)
    data.push({
      date: `${date.getMonth() + 1}-${date.getDate()}`,
      amount: 0
    })
  }
  return data
}

const fetchSalesData = async () => {
  try {
    const days = parseInt(salesPeriod.value)
    const res = await getDailySales({ days })

    let salesData = []
    if (res.data?.data && Array.isArray(res.data.data)) {
      salesData = res.data.data
    } else if (res.data?.dates && res.data?.amounts) {
      salesData = res.data.dates.map((date, index) => ({
        date: date,
        amount: res.data.amounts[index] || 0
      }))
    }

    if (salesData.length === 0) {
      salesData = generateDefaultChartData(days)
    }

    await nextTick()
    updateSalesChart(salesData)
  } catch (error) {
    console.error('获取销售数据失败', error)
    const defaultData = generateDefaultChartData(parseInt(salesPeriod.value))
    await nextTick()
    updateSalesChart(defaultData)
  }
}

const updateSalesChart = (salesData) => {
  if (!salesChartRef.value) {
    console.warn('图表容器不存在')
    return
  }

  const dates = salesData.map(item => item.date || '')
  const amounts = salesData.map(item => Number(item.amount) || 0)

  if (!chartInstance) {
    chartInstance = echarts.init(salesChartRef.value)
  }

  const option = {
    tooltip: {
      trigger: 'axis',
      backgroundColor: 'rgba(255, 255, 255, 0.95)',
      borderColor: '#e6e6e6',
      borderWidth: 1,
      textStyle: {
        color: '#333'
      },
      formatter: (params) => {
        const param = params[0]
        return `<strong>${param.name}</strong><br/>
                销售额: <strong style="color: #409eff">¥${Number(param.value).toFixed(2)}</strong>`
      }
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      top: '10%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      boundaryGap: true,
      data: dates,
      axisLine: {
        lineStyle: {
          color: '#e6e6e6'
        }
      },
      axisLabel: {
        color: '#666'
      }
    },
    yAxis: {
      type: 'value',
      axisLine: {
        show: false
      },
      axisTick: {
        show: false
      },
      splitLine: {
        lineStyle: {
          color: '#f5f5f5'
        }
      },
      axisLabel: {
        color: '#666',
        formatter: (value) => {
          if (value >= 10000) {
            return (value / 10000).toFixed(1) + 'w'
          }
          if (value >= 1000) {
            return (value / 1000).toFixed(1) + 'k'
          }
          return value
        }
      }
    },
    series: [
      {
        name: '销售额',
        type: 'bar',
        barWidth: '60%',
        data: amounts,
        itemStyle: {
          color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
            { offset: 0, color: '#409eff' },
            { offset: 1, color: '#66b1ff' }
          ]),
          borderRadius: [4, 4, 0, 0]
        },
        emphasis: {
          itemStyle: {
            color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
              { offset: 0, color: '#337ecc' },
              { offset: 1, color: '#409eff' }
            ])
          }
        }
      }
    ]
  }

  chartInstance.setOption(option, true)
}

const handlePeriodChange = () => {
  fetchSalesData()
}

const fetchRecentOrders = async () => {
  try {
    const res = await getOrderList({ page: 1, pageSize: 5 })
    let orders = res.data?.records || res.data || []

    if (!Array.isArray(orders)) {
      orders = []
    }

    recentOrders.value = orders.slice(0, 5)
  } catch (error) {
    console.error('获取近期订单失败', error)
    recentOrders.value = []
  }
}

const fetchProductRanking = async () => {
  try {
    const res = await getProductSalesRanking({ limit: 5 })
    let ranking = []

    if (res.data?.ranking && Array.isArray(res.data.ranking)) {
      ranking = res.data.ranking
    } else if (Array.isArray(res.data)) {
      ranking = res.data
    } else {
      console.warn('排行数据格式异常:', res.data)
    }

    productRanking.value = ranking.slice(0, 5)
  } catch (error) {
    console.error('获取产品排行失败', error)
    productRanking.value = []
  }
}

const getAlertProductName = (alert) => {
  return alert.productName || alert.name || alert.productId || '未知商品'
}

const fetchLowStockAlerts = async () => {
  try {
    const res = await getLowStockAlerts()
    let alerts = res.data || []

    if (!Array.isArray(alerts)) {
      console.warn('库存预警数据格式异常:', alerts)
      alerts = []
    }

    lowStockAlerts.value = alerts.slice(0, 3)
  } catch (error) {
    console.error('获取库存预警失败', error)
    lowStockAlerts.value = []
  }
}

const getOrderStatusType = (status) => {
  const statusMap = {
    'PAID': 'success',
    'PENDING': 'warning',
    'CANCELLED': 'info',
    'REFUNDED': 'danger',
    'COMPLETED': 'success',
    '已支付': 'success',
    '待支付': 'warning',
    '已取消': 'info',
    '已退款': 'danger',
    '已完成': 'success'
  }
  return statusMap[String(status)?.toUpperCase()] || 'info'
}

const getOrderStatusText = (status) => {
  const statusTextMap = {
    'PAID': '已支付',
    'PENDING': '待支付',
    'CANCELLED': '已取消',
    'REFUNDED': '已退款',
    'COMPLETED': '已完成'
  }
  return statusTextMap[String(status)?.toUpperCase()] || status || '未知'
}

const handleResize = () => {
  if (chartInstance) {
    chartInstance.resize()
  }
}

const fetchAllData = async () => {
  await Promise.allSettled([
    fetchStats(),
    fetchRecentOrders(),
    fetchProductRanking(),
    fetchLowStockAlerts()
  ])

  await nextTick()
  await fetchSalesData()
}

onMounted(() => {
  updateDateTime()
  timeInterval = setInterval(updateDateTime, 1000)
  fetchAllData()
  window.addEventListener('resize', handleResize)
})

onUnmounted(() => {
  window.removeEventListener('resize', handleResize)
  if (timeInterval) {
    clearInterval(timeInterval)
  }
  if (chartInstance) {
    chartInstance.dispose()
    chartInstance = null
  }
})
</script>

<style scoped>
.home-container {
  padding: 0;
}

.welcome-section {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 24px 32px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border-radius: 12px;
  margin-bottom: 24px;
  color: white;
  box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
}

.welcome-title {
  font-size: 28px;
  font-weight: 600;
  margin-bottom: 8px;
}

.welcome-subtitle {
  font-size: 14px;
  opacity: 0.9;
}

.current-date {
  font-size: 14px;
  opacity: 0.9;
  margin-bottom: 4px;
}

.current-time {
  font-size: 24px;
  font-weight: 600;
}

.stats-row {
  margin-bottom: 24px;
}

.stat-card {
  cursor: pointer;
  transition: all 0.3s ease;
  border: none;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.stat-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.12);
}

.stat-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.stat-info {
  flex: 1;
}

.stat-label {
  font-size: 14px;
  color: #999;
  margin-bottom: 8px;
}

.stat-value {
  font-size: 28px;
  font-weight: bold;
  color: #333;
  margin-bottom: 4px;
}

.stat-change {
  font-size: 12px;
  display: flex;
  align-items: center;
  gap: 4px;
}

.stat-change.up {
  color: #67c23a;
}

.stat-change.down {
  color: #f56c6c;
}

.stat-change.neutral {
  color: #999;
}

.stat-icon-wrapper {
  width: 60px;
  height: 60px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 28px;
  color: white;
  margin-left: 16px;
}

.stat-card-0 .stat-icon-wrapper {
  background: linear-gradient(135deg, #409eff, #66b1ff);
}

.stat-card-1 .stat-icon-wrapper {
  background: linear-gradient(135deg, #67c23a, #85ce61);
}

.stat-card-2 .stat-icon-wrapper {
  background: linear-gradient(135deg, #e6a23c, #ebb563);
}

.stat-card-3 .stat-icon-wrapper {
  background: linear-gradient(135deg, #9b59b6, #bb79d1);
}

.chart-section {
  margin-bottom: 24px;
}

.chart-card,
.rank-card,
.order-card,
.alert-card {
  height: 100%;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.card-title {
  font-size: 16px;
  font-weight: 600;
  color: #333;
}

.chart-container {
  height: 300px;
  width: 100%;
}

.rank-list {
  padding: 0;
}

.rank-item {
  display: flex;
  align-items: center;
  padding: 12px 0;
  border-bottom: 1px solid #f0f0f0;
}

.rank-item:last-child {
  border-bottom: none;
}

.rank-number {
  width: 24px;
  height: 24px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 12px;
  font-weight: bold;
  color: white;
  margin-right: 12px;
  background: #909399;
}

.rank-1 {
  background: linear-gradient(135deg, #ffd700, #ffb800);
  color: #333;
}

.rank-2 {
  background: linear-gradient(135deg, #c0c0c0, #a8a8a8);
}

.rank-3 {
  background: linear-gradient(135deg, #cd7f32, #b87333);
}

.rank-name {
  flex: 1;
  font-size: 14px;
  color: #333;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.rank-sales {
  font-size: 14px;
  color: #409eff;
  font-weight: 500;
}

.amount {
  color: #e6a23c;
  font-weight: 500;
}

.alert-list {
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.alert-item {
  margin-bottom: 0;
}

.bottom-section {
  margin-bottom: 24px;
}

:deep(.el-card__header) {
  padding: 16px 20px;
  border-bottom: 1px solid #f0f0f0;
}

:deep(.el-card__body) {
  padding: 16px 20px;
}

:deep(.el-table th) {
  background-color: #fafafa;
  color: #666;
  font-weight: 500;
}

:deep(.el-alert) {
  border-radius: 8px;
}
</style>
