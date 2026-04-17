<template>
  <div class="statistics-container">
    <el-card>
      <template #header>
        <span>库存统计概览<el-tag v-if="shopStore.currentStoreName" size="small" type="info" style="margin-left: 8px;">{{ shopStore.currentStoreName }}</el-tag></span>
      </template>

      <el-row :gutter="20" class="summary-row">
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">商品种类</p>
            <p class="value">{{ summaryData.totalProducts || 0 }}</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">库存总量</p>
            <p class="value">{{ summaryData.totalStock || 0 }}</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item warning">
            <p class="label">低库存预警</p>
            <p class="value">{{ summaryData.lowStockCount || 0 }}</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item danger">
            <p class="label">缺货商品</p>
            <p class="value">{{ summaryData.outOfStockCount || 0 }}</p>
          </div>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <div class="chart-container">
            <h4>库存状态分布</h4>
            <div ref="stockPieChart" class="chart"></div>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="chart-container">
            <h4>库存金额统计</h4>
            <div class="value-display">
              <p class="total-value">¥{{ summaryData.totalValue?.toFixed(2) || '0.00' }}</p>
              <p class="desc">当前库存总价值</p>
            </div>
          </div>
        </el-col>
      </el-row>
    </el-card>

    <el-card class="mt-20">
      <template #header>
        <div class="card-header">
          <span>低库存预警商品</span>
          <el-button type="primary" link @click="$router.push('/inventory/alerts')">
            查看全部 <el-icon><ArrowRight /></el-icon>
          </el-button>
        </div>
      </template>

      <el-table :data="lowStockProducts" border stripe>
        <el-table-column prop="productName" label="商品名称" />
        <el-table-column prop="quantity" label="当前库存" width="120">
          <template #default="{ row }">
            <el-tag type="danger">{{ row.quantity }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="alertThreshold" label="预警阈值" width="120" />
        <el-table-column prop="unit" label="单位" width="80" />
        <el-table-column prop="lastInTime" label="最后入库时间" width="180">
          <template #default="{ row }">
            {{ formatDate(row.lastInTime) }}
          </template>
        </el-table-column>
        <el-table-column label="库存状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.quantity <= 0 ? 'danger' : 'warning'">
              {{ row.quantity <= 0 ? '缺货' : '预警' }}
            </el-tag>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted, nextTick } from 'vue'
import { ArrowRight } from '@element-plus/icons-vue'
import * as echarts from 'echarts'
import { getInventorySummary, getLowStockProducts } from '@/api/statistics'
import { useShopStore } from '@/store/shop'

const shopStore = useShopStore()

const summaryData = ref({
  totalProducts: 0,
  totalStock: 0,
  lowStockCount: 0,
  outOfStockCount: 0,
  totalValue: 0
})

const lowStockProducts = ref([])

const stockPieChart = ref(null)
let stockPieChartInstance = null

const fetchInventorySummary = async () => {
  try {
    const res = await getInventorySummary()
    summaryData.value = res.data || {}
    await nextTick()
    initStockPieChart()
  } catch (error) {
    console.error('获取库存汇总失败', error)
  }
}

const fetchLowStockProducts = async () => {
  try {
    const res = await getLowStockProducts({ limit: 10 })
    lowStockProducts.value = res.data?.products || []
  } catch (error) {
    console.error('获取低库存商品失败', error)
  }
}

const initStockPieChart = () => {
  if (!stockPieChart.value) return

  if (stockPieChartInstance) {
    stockPieChartInstance.dispose()
  }

  stockPieChartInstance = echarts.init(stockPieChart.value)

  const normalCount = summaryData.value.totalProducts - summaryData.value.lowStockCount - summaryData.value.outOfStockCount

  const option = {
    tooltip: {
      trigger: 'item',
      formatter: '{b}: {c}种 ({d}%)'
    },
    legend: {
      orient: 'vertical',
      left: 'left',
      top: 'center'
    },
    series: [{
      name: '库存状态',
      type: 'pie',
      radius: ['40%', '70%'],
      avoidLabelOverlap: false,
      itemStyle: {
        borderRadius: 10,
        borderColor: '#fff',
        borderWidth: 2
      },
      label: {
        show: true,
        formatter: '{b}: {c}种'
      },
      data: [
        { value: Math.max(0, normalCount), name: '正常', itemStyle: { color: '#67C23A' } },
        { value: Math.max(0, summaryData.value.lowStockCount), name: '低库存', itemStyle: { color: '#E6A23C' } },
        { value: Math.max(0, summaryData.value.outOfStockCount), name: '缺货', itemStyle: { color: '#F56C6C' } }
      ]
    }]
  }

  stockPieChartInstance.setOption(option)
}

const formatDate = (dateStr) => {
  if (!dateStr) return '-'
  const date = new Date(dateStr)
  return date.toLocaleString('zh-CN', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit'
  })
}

const handleResize = () => {
  stockPieChartInstance?.resize()
}

onMounted(async () => {
  await fetchInventorySummary()
  await fetchLowStockProducts()

  window.addEventListener('resize', handleResize)
})
</script>

<style scoped>
.statistics-container {
  padding: 20px;
}

.summary-row {
  margin-bottom: 20px;
}

.summary-item {
  text-align: center;
  padding: 20px;
  background: #f5f7fa;
  border-radius: 8px;
}

.summary-item.warning {
  background: #fdf6ec;
}

.summary-item.warning .value {
  color: #E6A23C;
}

.summary-item.danger {
  background: #fef0f0;
}

.summary-item.danger .value {
  color: #F56C6C;
}

.summary-item .label {
  font-size: 14px;
  color: #999;
  margin-bottom: 10px;
}

.summary-item .value {
  font-size: 24px;
  font-weight: bold;
  color: #409EFF;
}

.chart-container {
  margin-top: 20px;
}

.chart-container h4 {
  margin-bottom: 15px;
  color: #333;
}

.chart {
  height: 280px;
}

.value-display {
  height: 280px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  background: #f5f7fa;
  border-radius: 8px;
}

.total-value {
  font-size: 36px;
  font-weight: bold;
  color: #409EFF;
  margin-bottom: 10px;
}

.desc {
  font-size: 14px;
  color: #999;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.mt-20 {
  margin-top: 20px;
}
</style>