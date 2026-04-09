<template>
  <div class="inventory-alerts">
    <div class="header-section">
      <div class="header-left">
        <h2>库存预警</h2>
      </div>
      <div class="header-right">
        <el-button @click="handleBack">
          <el-icon><ArrowLeft /></el-icon>
          返回
        </el-button>
        <el-button type="primary" @click="handleRefresh">
          <el-icon><Refresh /></el-icon>
          刷新
        </el-button>
      </div>
    </div>

    <div class="stats-row">
      <div class="alert-stat critical">
        <div class="stat-value">{{ alerts.length }}</div>
        <div class="stat-label">预警商品数量</div>
      </div>
      <div class="alert-stat info">
        <div class="stat-value">{{ totalShortage }}</div>
        <div class="stat-label">缺货总量</div>
      </div>
    </div>

    <div class="table-container" v-loading="loading">
      <el-table :data="alerts" border stripe style="width: 100%">
        <el-table-column prop="productName" label="商品名称" min-width="150" />
        <el-table-column prop="categoryName" label="分类" width="120" />
        <el-table-column prop="quantity" label="当前库存" width="100">
          <template #default="{ row }">
            <span class="low-stock-value">{{ row.quantity }} {{ row.unit }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="alertThreshold" label="预警阈值" width="100">
          <template #default="{ row }">
            <el-tag type="danger">{{ row.alertThreshold }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="差额" width="100">
          <template #default="{ row }">
            <span class="shortage-value">差 {{ row.alertThreshold - row.quantity }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="price" label="单价" width="100">
          <template #default="{ row }"> ¥{{ row.price }} </template>
        </el-table-column>
        <el-table-column label="紧急程度" width="120">
          <template #default="{ row }">
            <el-tag :type="getUrgentType(row)">
              {{ getUrgentLabel(row) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link size="small" @click="handleStockIn(row)">立即入库</el-button>
            <el-button type="warning" link size="small" @click="handleSetThreshold(row)">设置阈值</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-empty v-if="!loading && alerts.length === 0" description="暂无预警商品，库存状态良好" />
    </div>

    <el-dialog
      v-model="thresholdDialogVisible"
      title="设置预警阈值"
      width="400px"
    >
      <el-form ref="thresholdFormRef" :model="thresholdForm" :rules="thresholdRules" label-width="100px">
        <el-form-item label="商品">
          <el-input v-model="thresholdForm.productName" disabled />
        </el-form-item>
        <el-form-item label="当前阈值">
          <el-input :value="thresholdForm.currentThreshold" disabled />
        </el-form-item>
        <el-form-item label="新阈值" prop="threshold">
          <el-input-number v-model="thresholdForm.threshold" :min="0" style="width: 100%" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="thresholdDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitThreshold">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { ArrowLeft, Refresh } from '@element-plus/icons-vue'
import { useRouter } from 'vue-router'
import { getLowStockAlerts, updateAlertThreshold } from '@/api/inventory'

const router = useRouter()
const loading = ref(false)
const alerts = ref([])
const thresholdDialogVisible = ref(false)
const thresholdFormRef = ref(null)

const thresholdForm = reactive({
  productId: null,
  productName: '',
  currentThreshold: 0,
  threshold: 10
})

const thresholdRules = {
  threshold: [{ required: true, message: '请输入预警阈值', trigger: 'blur' }]
}

const totalShortage = computed(() => {
  return alerts.value.reduce((sum, item) => sum + Math.max(0, item.alertThreshold - item.quantity), 0)
})

const getUrgentType = (row) => {
  const shortage = row.alertThreshold - row.quantity
  if (shortage >= row.alertThreshold * 0.5) return 'danger'
  if (shortage >= row.alertThreshold * 0.3) return 'warning'
  return 'info'
}

const getUrgentLabel = (row) => {
  const shortage = row.alertThreshold - row.quantity
  if (shortage >= row.alertThreshold * 0.5) return '紧急'
  if (shortage >= row.alertThreshold * 0.3) return '较急'
  return '一般'
}

const fetchAlerts = async () => {
  loading.value = true
  try {
    const res = await getLowStockAlerts()
    alerts.value = res.data || []
  } catch (error) {
    ElMessage.error('获取预警数据失败')
  } finally {
    loading.value = false
  }
}

const handleRefresh = () => {
  fetchAlerts()
}

const handleBack = () => {
  router.push('/inventory')
}

const handleStockIn = (row) => {
  router.push({ path: '/inventory/in', query: { productId: row.productId } })
}

const handleSetThreshold = (row) => {
  thresholdForm.productId = row.productId
  thresholdForm.productName = row.productName
  thresholdForm.currentThreshold = row.alertThreshold
  thresholdForm.threshold = row.alertThreshold
  thresholdDialogVisible.value = true
}

const submitThreshold = async () => {
  if (!thresholdFormRef.value) return
  await thresholdFormRef.value.validate(async (valid) => {
    if (!valid) return
    try {
      await updateAlertThreshold(thresholdForm.productId, thresholdForm.threshold)
      ElMessage.success('阈值设置成功')
      thresholdDialogVisible.value = false
      fetchAlerts()
    } catch (error) {
      ElMessage.error('设置失败')
    }
  })
}

onMounted(() => {
  fetchAlerts()
})
</script>

<style scoped>
.inventory-alerts {
  width: 100%;
  padding: 0 10px;
}

.header-section {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.header-left h2 {
  font-size: 22px;
  color: #333;
  margin: 0;
}

.header-right {
  display: flex;
  gap: 12px;
}

.stats-row {
  display: flex;
  gap: 20px;
  margin-bottom: 20px;
}

.alert-stat {
  flex: 1;
  padding: 20px;
  border-radius: 12px;
  text-align: center;
}

.alert-stat.critical {
  background: linear-gradient(135deg, #f56c6c 0%, #d93636 100%);
  color: #fff;
}

.alert-stat.info {
  background: linear-gradient(135deg, #e6a23c 0%, #cf9236 100%);
  color: #fff;
}

.stat-value {
  font-size: 32px;
  font-weight: 700;
}

.stat-label {
  font-size: 14px;
  opacity: 0.9;
  margin-top: 8px;
}

.table-container {
  background: #fff;
  padding: 20px;
  border-radius: 12px;
}

.low-stock-value {
  color: #f56c6c;
  font-weight: 600;
}

.shortage-value {
  color: #e6a23c;
  font-weight: 600;
}
</style>
