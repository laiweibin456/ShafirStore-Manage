<template>
  <div class="inventory-list">
    <div class="header-section">
      <div class="header-left">
        <h2>库存管理</h2>
      </div>
      <div class="header-right">
        <el-input
          v-model="searchKeyword"
          placeholder="搜索商品名称..."
          prefix-icon="Search"
          clearable
          class="search-input"
          @input="handleSearch"
        />
        <el-button type="primary" @click="handleStockIn">
          <el-icon><Plus /></el-icon>
          入库
        </el-button>
        <el-button type="warning" @click="handleStockOut">
          <el-icon><Minus /></el-icon>
          出库
        </el-button>
        <el-button type="info" @click="handleViewRecords">
          <el-icon><Document /></el-icon>
          记录
        </el-button>
      </div>
    </div>

    <div class="stats-cards">
      <el-row :gutter="20">
        <el-col :span="6">
          <div class="stat-card">
            <div class="stat-icon total">
              <el-icon :size="30"><Box /></el-icon>
            </div>
            <div class="stat-info">
              <div class="stat-value">{{ statistics.totalProducts }}</div>
              <div class="stat-label">商品种类</div>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="stat-card">
            <div class="stat-icon stock">
              <el-icon :size="30"><Goods /></el-icon>
            </div>
            <div class="stat-info">
              <div class="stat-value">{{ statistics.totalQuantity }}</div>
              <div class="stat-label">库存总量</div>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="stat-card">
            <div class="stat-icon warning">
              <el-icon :size="30"><Warning /></el-icon>
            </div>
            <div class="stat-info">
              <div class="stat-value warning-value">{{ statistics.lowStockCount }}</div>
              <div class="stat-label">低库存预警</div>
            </div>
          </div>
        </el-col>
        <el-col :span="6">
          <div class="stat-card">
            <div class="stat-icon value">
              <el-icon :size="30"><Money /></el-icon>
            </div>
            <div class="stat-info">
              <div class="stat-value">¥{{ statistics.totalValue }}</div>
              <div class="stat-label">库存价值</div>
            </div>
          </div>
        </el-col>
      </el-row>
    </div>

    <div class="table-container" v-loading="loading">
      <el-table :data="tableData" border stripe style="width: 100%">
        <el-table-column prop="productName" label="商品名称" min-width="150" />
        <el-table-column prop="categoryName" label="分类" width="120" />
        <el-table-column prop="quantity" label="库存数量" width="100">
          <template #default="{ row }">
            <span :class="{ 'low-stock': row.isLowStock }">{{ row.quantity }} {{ row.unit }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="alertThreshold" label="预警阈值" width="100" />
        <el-table-column label="库存状态" width="100">
          <template #default="{ row }">
            <el-tag :type="row.isLowStock ? 'danger' : 'success'">
              {{ row.isLowStock ? '库存不足' : '正常' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="price" label="单价" width="100">
          <template #default="{ row }"> ¥{{ row.price }} </template>
        </el-table-column>
        <el-table-column prop="stockValue" label="库存价值" width="120">
          <template #default="{ row }"> ¥{{ row.stockValue }} </template>
        </el-table-column>
        <el-table-column prop="lastInTime" label="最后入库" width="160">
          <template #default="{ row }">{{ formatTime(row.lastInTime) }}</template>
        </el-table-column>
        <el-table-column prop="lastOutTime" label="最后出库" width="160">
          <template #default="{ row }">{{ formatTime(row.lastOutTime) }}</template>
        </el-table-column>
        <el-table-column label="操作" width="180" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link size="small" @click="handleStockInItem(row)">入库</el-button>
            <el-button type="warning" link size="small" @click="handleStockOutItem(row)">出库</el-button>
            <el-button type="info" link size="small" @click="handleAdjust(row)">调整</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-pagination
        v-if="pagination.total > 0"
        v-model:current-page="pagination.page"
        v-model:page-size="pagination.size"
        :total="pagination.total"
        :page-sizes="[10, 20, 50]"
        layout="total, sizes, prev, pager, next"
        @size-change="fetchData"
        @current-change="fetchData"
        class="pagination"
      />
    </div>

    <el-dialog
      v-model="stockInDialogVisible"
      title="商品入库"
      width="500px"
    >
      <el-form ref="stockInFormRef" :model="stockInForm" :rules="stockInRules" label-width="100px">
        <el-form-item label="商品">
          <el-input v-model="stockInForm.productName" disabled />
        </el-form-item>
        <el-form-item label="当前库存">
          <el-input v-model="stockInForm.currentQuantity" disabled />
        </el-form-item>
        <el-form-item label="入库数量" prop="quantity">
          <el-input-number v-model="stockInForm.quantity" :min="1" style="width: 100%" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="stockInForm.remark" type="textarea" :rows="2" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="stockInDialogVisible = false">取消</el-button>
        <el-button type="primary" :loading="loadingBtn" @click="submitStockIn">确定入库</el-button>
      </template>
    </el-dialog>

    <el-dialog
      v-model="stockOutDialogVisible"
      title="商品出库"
      width="500px"
    >
      <el-form ref="stockOutFormRef" :model="stockOutForm" :rules="stockOutRules" label-width="100px">
        <el-form-item label="商品">
          <el-input v-model="stockOutForm.productName" disabled />
        </el-form-item>
        <el-form-item label="当前库存">
          <el-input v-model="stockOutForm.currentQuantity" disabled />
        </el-form-item>
        <el-form-item label="出库数量" prop="quantity">
          <el-input-number v-model="stockOutForm.quantity" :min="1" :max="stockOutForm.currentQuantity" style="width: 100%" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="stockOutForm.remark" type="textarea" :rows="2" placeholder="请输入备注" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="stockOutDialogVisible = false">取消</el-button>
        <el-button type="primary" :loading="loadingBtn" @click="submitStockOut">确定出库</el-button>
      </template>
    </el-dialog>

    <el-dialog
      v-model="adjustDialogVisible"
      title="库存调整"
      width="500px"
    >
      <el-form ref="adjustFormRef" :model="adjustForm" :rules="adjustRules" label-width="100px">
        <el-form-item label="商品">
          <el-input v-model="adjustForm.productName" disabled />
        </el-form-item>
        <el-form-item label="原库存">
          <el-input v-model="adjustForm.beforeQuantity" disabled />
        </el-form-item>
        <el-form-item label="调整后库存" prop="quantity">
          <el-input-number v-model="adjustForm.quantity" :min="0" style="width: 100%" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="adjustForm.remark" type="textarea" :rows="2" placeholder="请输入调整原因" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="adjustDialogVisible = false">取消</el-button>
        <el-button type="primary" :loading="loadingBtn" @click="submitAdjust">确定调整</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { Box, Goods, Warning, Money } from '@element-plus/icons-vue'
import { getInventoryList, stockIn, stockOut, adjustStock, getInventoryStatistics } from '@/api/inventory'
import { useRouter } from 'vue-router'

const router = useRouter()
const loading = ref(false)
const loadingBtn = ref(false)
const tableData = ref([])
const searchKeyword = ref('')

const statistics = reactive({
  totalProducts: 0,
  totalQuantity: 0,
  lowStockCount: 0,
  totalValue: '0.00'
})

const pagination = reactive({
  page: 1,
  size: 10,
  total: 0
})

const stockInDialogVisible = ref(false)
const stockOutDialogVisible = ref(false)
const adjustDialogVisible = ref(false)
const stockInFormRef = ref(null)
const stockOutFormRef = ref(null)
const adjustFormRef = ref(null)

const stockInForm = reactive({
  productId: null,
  productName: '',
  currentQuantity: 0,
  quantity: 1,
  remark: ''
})

const stockOutForm = reactive({
  productId: null,
  productName: '',
  currentQuantity: 0,
  quantity: 1,
  remark: ''
})

const adjustForm = reactive({
  productId: null,
  productName: '',
  beforeQuantity: 0,
  quantity: 0,
  remark: ''
})

const stockInRules = {
  quantity: [{ required: true, message: '请输入入库数量', trigger: 'blur' }]
}

const stockOutRules = {
  quantity: [{ required: true, message: '请输入出库数量', trigger: 'blur' }]
}

const adjustRules = {
  quantity: [{ required: true, message: '请输入调整后库存', trigger: 'blur' }]
}

const fetchData = async () => {
  loading.value = true
  try {
    const params = {
      pageNum: pagination.page,
      pageSize: pagination.size
    }
    if (searchKeyword.value) {
      params.productName = searchKeyword.value
    }
    const res = await getInventoryList(params)
    tableData.value = res.data.records
    pagination.total = res.data.total
  } catch (error) {
    ElMessage.error('获取库存列表失败')
  } finally {
    loading.value = false
  }
}

const fetchStatistics = async () => {
  try {
    const res = await getInventoryStatistics()
    const list = res.data || []
    statistics.totalProducts = list.length
    statistics.totalQuantity = list.reduce((sum, item) => sum + (item.quantity || 0), 0)
    statistics.lowStockCount = list.filter(item => item.isLowStock).length
    statistics.totalValue = list.reduce((sum, item) => sum + (item.stockValue || 0), 0).toFixed(2)
  } catch (error) {
    console.error('获取统计数据失败', error)
  }
}

const handleSearch = () => {
  pagination.page = 1
  fetchData()
}

const handleStockIn = () => {
  router.push('/inventory/in')
}

const handleStockOut = () => {
  router.push('/inventory/out')
}

const handleViewRecords = () => {
  router.push('/inventory/records')
}

const handleStockInItem = (row) => {
  stockInForm.productId = row.productId
  stockInForm.productName = row.productName
  stockInForm.currentQuantity = row.quantity
  stockInForm.quantity = 1
  stockInForm.remark = ''
  stockInDialogVisible.value = true
}

const handleStockOutItem = (row) => {
  stockOutForm.productId = row.productId
  stockOutForm.productName = row.productName
  stockOutForm.currentQuantity = row.quantity
  stockOutForm.quantity = 1
  stockOutForm.remark = ''
  stockOutDialogVisible.value = true
}

const handleAdjust = (row) => {
  adjustForm.productId = row.productId
  adjustForm.productName = row.productName
  adjustForm.beforeQuantity = row.quantity
  adjustForm.quantity = row.quantity
  adjustForm.remark = ''
  adjustDialogVisible.value = true
}

const submitStockIn = async () => {
  if (!stockInFormRef.value) return
  await stockInFormRef.value.validate(async (valid) => {
    if (!valid) return
    loadingBtn.value = true
    try {
      await stockIn({
        productId: stockInForm.productId,
        quantity: stockInForm.quantity,
        remark: stockInForm.remark
      })
      ElMessage.success('入库成功')
      stockInDialogVisible.value = false
      fetchData()
      fetchStatistics()
    } catch (error) {
      ElMessage.error('入库失败')
    } finally {
      loadingBtn.value = false
    }
  })
}

const submitStockOut = async () => {
  if (!stockOutFormRef.value) return
  await stockOutFormRef.value.validate(async (valid) => {
    if (!valid) return
    loadingBtn.value = true
    try {
      await stockOut({
        productId: stockOutForm.productId,
        quantity: stockOutForm.quantity,
        remark: stockOutForm.remark
      })
      ElMessage.success('出库成功')
      stockOutDialogVisible.value = false
      fetchData()
      fetchStatistics()
    } catch (error) {
      ElMessage.error('出库失败')
    } finally {
      loadingBtn.value = false
    }
  })
}

const submitAdjust = async () => {
  if (!adjustFormRef.value) return
  await adjustFormRef.value.validate(async (valid) => {
    if (!valid) return
    loadingBtn.value = true
    try {
      await adjustStock({
        productId: adjustForm.productId,
        quantity: adjustForm.quantity,
        beforeQuantity: adjustForm.beforeQuantity,
        remark: adjustForm.remark
      })
      ElMessage.success('调整成功')
      adjustDialogVisible.value = false
      fetchData()
      fetchStatistics()
    } catch (error) {
      ElMessage.error('调整失败')
    } finally {
      loadingBtn.value = false
    }
  })
}

const formatTime = (time) => {
  if (!time) return '-'
  return time.substring(0, 19).replace('T', ' ')
}

onMounted(() => {
  fetchData()
  fetchStatistics()
})
</script>

<style scoped>
.inventory-list {
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
  align-items: center;
}

.search-input {
  width: 260px;
}

.stats-cards {
  margin-bottom: 20px;
}

.stat-card {
  display: flex;
  align-items: center;
  gap: 15px;
  padding: 20px;
  background: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
}

.stat-icon {
  width: 60px;
  height: 60px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #fff;
}

.stat-icon.total {
  background: linear-gradient(135deg, #409eff 0%, #337ecc 100%);
}

.stat-icon.stock {
  background: linear-gradient(135deg, #67c23a 0%, #529b2e 100%);
}

.stat-icon.warning {
  background: linear-gradient(135deg, #f56c6c 0%, #d93636 100%);
}

.stat-icon.value {
  background: linear-gradient(135deg, #e6a23c 0%, #cf9236 100%);
}

.stat-info {
  flex: 1;
}

.stat-value {
  font-size: 24px;
  font-weight: 700;
  color: #333;
}

.stat-value.warning-value {
  color: #f56c6c;
}

.stat-label {
  font-size: 14px;
  color: #999;
  margin-top: 4px;
}

.table-container {
  background: #fff;
  padding: 20px;
  border-radius: 12px;
}

.pagination {
  margin-top: 20px;
  justify-content: center;
}

.low-stock {
  color: #f56c6c;
  font-weight: 600;
}
</style>
