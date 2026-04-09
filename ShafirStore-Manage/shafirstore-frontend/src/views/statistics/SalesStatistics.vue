<template>
  <div class="statistics-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>销售统计</span>
          <el-radio-group v-model="timeRange" size="default">
            <el-radio-button value="7">近7天</el-radio-button>
            <el-radio-button value="30">近30天</el-radio-button>
            <el-radio-button value="90">近3个月</el-radio-button>
          </el-radio-group>
        </div>
      </template>

      <el-row :gutter="20" class="summary-row">
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">销售总额</p>
            <p class="value">¥{{ overviewData.totalAmount?.toFixed(2) || '0.00' }}</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">订单总数</p>
            <p class="value">{{ overviewData.totalCount || 0 }} 单</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">平均客单价</p>
            <p class="value">¥{{ overviewData.avgAmount?.toFixed(2) || '0.00' }}</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">今日销售额</p>
            <p class="value">¥{{ overviewData.todaySales || '0.00' }}</p>
          </div>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="16">
          <div class="chart-container">
            <h4>销售趋势</h4>
            <div ref="salesTrendChart" class="chart"></div>
          </div>
        </el-col>
        <el-col :span="8">
          <div class="chart-container">
            <h4>月度销售统计</h4>
            <div ref="monthlySalesChart" class="chart"></div>
          </div>
        </el-col>
      </el-row>
    </el-card>

    <el-card class="mt-20">
      <template #header>
        <div class="card-header">
          <span>商品销售排行</span>
          <el-select v-model="rankingDays" placeholder="选择时间段" style="width: 150px">
            <el-option label="近7天" :value="7" />
            <el-option label="近30天" :value="30" />
            <el-option label="近90天" :value="90" />
          </el-select>
        </div>
      </template>

      <el-table :data="productRanking" border stripe>
        <el-table-column prop="rank" label="排名" width="80" />
        <el-table-column prop="productName" label="商品名称" />
        <el-table-column prop="quantity" label="销售数量" width="120" />
        <el-table-column prop="amount" label="销售金额" width="120">
          <template #default="{ row }">
            ¥{{ typeof row.amount === 'number' ? row.amount.toFixed(2) : row.amount }}
          </template>
        </el-table-column>
        <el-table-column label="占比" width="150">
          <template #default="{ row }">
            <el-progress
              :percentage="getPercentage(row.amount)"
              :stroke-width="12"
              :format="formatPercentage"
            />
          </template>
        </el-table-column>
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted, watch, nextTick } from 'vue'
import * as echarts from 'echarts'
import { getDailySales, getMonthlySales, getProductSalesRanking, getOverview } from '@/api/statistics'

const timeRange = ref('7')
const rankingDays = ref(30)

const overviewData = ref({
  totalAmount: 0,
  totalCount: 0,
  avgAmount: 0,
  todaySales: 0
})

const dailySalesData = ref({
  dates: [],
  amounts: []
})

const monthlySalesData = ref({
  months: [],
  amounts: []
})

const productRanking = ref([])
const productRankingTotal = ref(0)

const salesTrendChart = ref(null)
const monthlySalesChart = ref(null)
let salesTrendChartInstance = null
let monthlySalesChartInstance = null

const fetchOverview = async () => {
  try {
    const res = await getOverview()
    overviewData.value = res.data || {}
  } catch (error) {
    console.error('获取概览数据失败', error)
  }
}

const fetchDailySales = async () => {
  try {
    const res = await getDailySales({ days: parseInt(timeRange.value) })
    dailySalesData.value = res.data || { dates: [], amounts: [] }
    await nextTick()
    initSalesTrendChart()
  } catch (error) {
    console.error('获取日销售数据失败', error)
  }
}

const fetchMonthlySales = async () => {
  try {
    const res = await getMonthlySales({ months: 6 })
    monthlySalesData.value = res.data || { months: [], amounts: [] }
    await nextTick()
    initMonthlySalesChart()
  } catch (error) {
    console.error('获取月销售数据失败', error)
  }
}

const fetchProductRanking = async () => {
  try {
    const res = await getProductSalesRanking({ limit: 10 })
    productRanking.value = res.data?.ranking || []
    productRankingTotal.value = res.data?.totalAmount || 0
  } catch (error) {
    console.error('获取商品排行失败', error)
  }
}

const initSalesTrendChart = () => {
  if (!salesTrendChart.value) return

  if (salesTrendChartInstance) {
    salesTrendChartInstance.dispose()
  }

  salesTrendChartInstance = echarts.init(salesTrendChart.value)

  const option = {
    tooltip: {
      trigger: 'axis',
      formatter: (params) => {
        const param = params[0]
        return `${param.name}<br/>销售额: ¥${param.value}`
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
      data: dailySalesData.value.dates,
      boundaryGap: false,
      axisLine: { lineStyle: { color: '#999' } },
      axisLabel: { color: '#666' }
    },
    yAxis: {
      type: 'value',
      axisLine: { show: false },
      axisLabel: { color: '#666' },
      splitLine: { lineStyle: { color: '#eee' } }
    },
    series: [{
      name: '销售额',
      type: 'line',
      smooth: true,
      data: dailySalesData.value.amounts,
      areaStyle: {
        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
          { offset: 0, color: 'rgba(64, 158, 255, 0.3)' },
          { offset: 1, color: 'rgba(64, 158, 255, 0.05)' }
        ])
      },
      lineStyle: { color: '#409EFF', width: 2 },
      itemStyle: { color: '#409EFF' },
      symbol: 'circle',
      symbolSize: 6
    }]
  }

  salesTrendChartInstance.setOption(option)
}

const initMonthlySalesChart = () => {
  if (!monthlySalesChart.value) return

  if (monthlySalesChartInstance) {
    monthlySalesChartInstance.dispose()
  }

  monthlySalesChartInstance = echarts.init(monthlySalesChart.value)

  const option = {
    tooltip: {
      trigger: 'axis',
      formatter: (params) => {
        const param = params[0]
        return `${param.name}<br/>销售额: ¥${param.value}`
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
      data: monthlySalesData.value.months,
      axisLine: { lineStyle: { color: '#999' } },
      axisLabel: { color: '#666' }
    },
    yAxis: {
      type: 'value',
      axisLine: { show: false },
      axisLabel: { color: '#666' },
      splitLine: { lineStyle: { color: '#eee' } }
    },
    series: [{
      name: '销售额',
      type: 'bar',
      data: monthlySalesData.value.amounts,
      itemStyle: {
        color: new echarts.graphic.LinearGradient(0, 0, 0, 1, [
          { offset: 0, color: '#67C23A' },
          { offset: 1, color: '#95D475' }
        ])
      },
      barWidth: '50%'
    }]
  }

  monthlySalesChartInstance.setOption(option)
}

const getPercentage = (amount) => {
  if (!amount || !productRankingTotal.value) return 0
  return Math.round((Number(amount) / Number(productRankingTotal.value)) * 100)
}

const formatPercentage = (percentage) => `${percentage}%`

const handleResize = () => {
  salesTrendChartInstance?.resize()
  monthlySalesChartInstance?.resize()
}

watch(timeRange, () => {
  fetchDailySales()
})

watch(rankingDays, () => {
  fetchProductRanking()
})

onMounted(async () => {
  await fetchOverview()
  await fetchDailySales()
  await fetchMonthlySales()
  await fetchProductRanking()

  window.addEventListener('resize', handleResize)
})
</script>

<style scoped>
.statistics-container {
  padding: 20px;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
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
  height: 300px;
}

.mt-20 {
  margin-top: 20px;
}
</style>