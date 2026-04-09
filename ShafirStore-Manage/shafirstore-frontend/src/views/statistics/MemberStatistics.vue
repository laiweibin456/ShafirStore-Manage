<template>
  <div class="statistics-container">
    <el-card>
      <template #header>
        <span>会员统计概览</span>
      </template>

      <el-row :gutter="20" class="summary-row">
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">会员总数</p>
            <p class="value">{{ summaryData.totalMembers || 0 }}</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">活跃会员</p>
            <p class="value">{{ summaryData.activeMembers || 0 }}</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">累计消费</p>
            <p class="value">¥{{ summaryData.totalConsume?.toFixed(2) || '0.00' }}</p>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="summary-item">
            <p class="label">积分总量</p>
            <p class="value">{{ summaryData.totalPoints || 0 }}</p>
          </div>
        </el-col>
      </el-row>

      <el-row :gutter="20">
        <el-col :span="12">
          <div class="chart-container">
            <h4>会员等级分布</h4>
            <div ref="levelPieChart" class="chart"></div>
          </div>
        </el-col>
        <el-col :span="12">
          <div class="chart-container">
            <h4>新增会员趋势（近30天）</h4>
            <div ref="newMemberChart" class="chart"></div>
          </div>
        </el-col>
      </el-row>
    </el-card>

    <el-card class="mt-20">
      <template #header>
        <div class="card-header">
          <span>会员消费排行 TOP10</span>
          <el-button type="primary" link @click="$router.push('/member')">
            查看全部 <el-icon><ArrowRight /></el-icon>
          </el-button>
        </div>
      </template>

      <el-table :data="memberRanking" border stripe>
        <el-table-column prop="rank" label="排名" width="80">
          <template #default="{ row }">
            <el-tag :type="row.rank <= 3 ? 'gold' : 'info'" effect="dark">
              {{ row.rank }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="name" label="姓名" />
        <el-table-column prop="phone" label="手机号" width="130" />
        <el-table-column prop="levelName" label="会员等级" width="100">
          <template #default="{ row }">
            <el-tag :type="getLevelType(row.level)">{{ row.levelName }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="totalConsume" label="累计消费" width="120">
          <template #default="{ row }">
            ¥{{ row.totalConsume?.toFixed(2) || '0.00' }}
          </template>
        </el-table-column>
        <el-table-column prop="points" label="当前积分" width="100" />
      </el-table>
    </el-card>
  </div>
</template>

<script setup>
import { ref, onMounted, nextTick } from 'vue'
import { ArrowRight } from '@element-plus/icons-vue'
import * as echarts from 'echarts'
import { getMemberSummary, getNewMembers, getMemberConsumeRanking } from '@/api/statistics'

const summaryData = ref({
  totalMembers: 0,
  activeMembers: 0,
  totalConsume: 0,
  totalPoints: 0,
  levelDistribution: {}
})

const newMemberData = ref({
  members: []
})

const memberRanking = ref([])

const levelPieChart = ref(null)
const newMemberChart = ref(null)
let levelPieChartInstance = null
let newMemberChartInstance = null

const fetchMemberSummary = async () => {
  try {
    const res = await getMemberSummary()
    summaryData.value = res.data || {}
    await nextTick()
    initLevelPieChart()
  } catch (error) {
    console.error('获取会员汇总失败', error)
  }
}

const fetchNewMembers = async () => {
  try {
    const res = await getNewMembers({ days: 30 })
    newMemberData.value = res.data || { members: [] }
    await nextTick()
    initNewMemberChart()
  } catch (error) {
    console.error('获取新增会员失败', error)
  }
}

const fetchMemberRanking = async () => {
  try {
    const res = await getMemberConsumeRanking({ limit: 10 })
    memberRanking.value = res.data?.ranking || []
  } catch (error) {
    console.error('获取会员排行失败', error)
  }
}

const initLevelPieChart = () => {
  if (!levelPieChart.value) return

  if (levelPieChartInstance) {
    levelPieChartInstance.dispose()
  }

  levelPieChartInstance = echarts.init(levelPieChart.value)

  const levelMap = {
    1: '普通会员',
    2: '银卡会员',
    3: '金卡会员',
    4: '钻石会员'
  }

  const levelColors = {
    1: '#909399',
    2: '#C0C0C0',
    3: '#FFD700',
    4: '#E6A23C'
  }

  const distribution = summaryData.value.levelDistribution || {}
  const data = Object.entries(distribution).map(([level, count]) => ({
    name: levelMap[level] || `等级${level}`,
    value: count,
    itemStyle: { color: levelColors[level] || '#909399' }
  }))

  if (data.length === 0) {
    data.push({ name: '暂无数据', value: 0, itemStyle: { color: '#E4E7ED' } })
  }

  const option = {
    tooltip: {
      trigger: 'item',
      formatter: '{b}: {c}人 ({d}%)'
    },
    legend: {
      orient: 'vertical',
      left: 'left',
      top: 'center'
    },
    series: [{
      name: '会员等级',
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
        formatter: '{b}: {c}'
      },
      data: data
    }]
  }

  levelPieChartInstance.setOption(option)
}

const initNewMemberChart = () => {
  if (!newMemberChart.value) return

  if (newMemberChartInstance) {
    newMemberChartInstance.dispose()
  }

  newMemberChartInstance = echarts.init(newMemberChart.value)

  const members = newMemberData.value.members || []

  const option = {
    tooltip: {
      trigger: 'item',
      formatter: '{b}: {c}人'
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
      data: ['近30天'],
      axisLine: { lineStyle: { color: '#999' } },
      axisLabel: { color: '#666' }
    },
    yAxis: {
      type: 'value',
      min: 0,
      minInterval: 1,
      axisLine: { show: false },
      axisLabel: { color: '#666' },
      splitLine: { lineStyle: { color: '#eee' } }
    },
    series: [{
      name: '新增会员',
      type: 'bar',
      data: [{ value: members.length, itemStyle: { color: '#409EFF' } }],
      barWidth: '50%',
      itemStyle: {
        borderRadius: [8, 8, 0, 0]
      },
      label: {
        show: true,
        position: 'top',
        formatter: '{c} 人'
      }
    }]
  }

  newMemberChartInstance.setOption(option)
}

const getLevelType = (level) => {
  const typeMap = {
    1: 'info',
    2: 'warning',
    3: 'success',
    4: 'danger'
  }
  return typeMap[level] || 'info'
}

const handleResize = () => {
  levelPieChartInstance?.resize()
  newMemberChartInstance?.resize()
}

onMounted(async () => {
  await fetchMemberSummary()
  await fetchNewMembers()
  await fetchMemberRanking()

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

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.mt-20 {
  margin-top: 20px;
}

:deep(.el-tag--gold) {
  background: linear-gradient(135deg, #FFD700, #FFA500);
  border-color: #FFD700;
  color: #fff;
}
</style>