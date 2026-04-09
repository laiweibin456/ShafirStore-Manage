<template>
  <div class="inventory-records">
    <div class="header-section">
      <div class="header-left">
        <h2>库存记录</h2>
      </div>
      <div class="header-right">
        <el-button @click="handleBack">
          <el-icon><ArrowLeft /></el-icon>
          返回
        </el-button>
      </div>
    </div>

    <div class="filter-card">
      <el-form :inline="true" :model="filterForm">
        <el-form-item label="商品名称">
          <el-input v-model="filterForm.productName" placeholder="请输入商品名称" clearable />
        </el-form-item>
        <el-form-item label="记录类型">
          <el-select v-model="filterForm.type" placeholder="请选择" clearable style="width: 150px">
            <el-option label="入库" :value="1" />
            <el-option label="出库" :value="2" />
            <el-option label="盘点调整" :value="3" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleFilter">
            <el-icon><Search /></el-icon>
            查询
          </el-button>
          <el-button @click="handleReset">
            <el-icon><Refresh /></el-icon>
            重置
          </el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="table-container" v-loading="loading">
      <el-table :data="tableData" border stripe style="width: 100%">
        <el-table-column prop="productName" label="商品名称" min-width="150" />
        <el-table-column prop="typeName" label="记录类型" width="100">
          <template #default="{ row }">
            <el-tag :type="getTypeTagType(row.type)">
              {{ row.typeName }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="变动数量" width="120">
          <template #default="{ row }">
            <span :class="getQuantityClass(row.type, row.quantity)">
              {{ getQuantityDisplay(row.type, row.quantity) }}
            </span>
          </template>
        </el-table-column>
        <el-table-column prop="beforeQuantity" label="变动前" width="100" />
        <el-table-column prop="afterQuantity" label="变动后" width="100" />
        <el-table-column prop="remark" label="备注" min-width="150" />
        <el-table-column prop="createTime" label="操作时间" width="160">
          <template #default="{ row }">{{ formatTime(row.createTime) }}</template>
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
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { Search, Refresh, ArrowLeft } from '@element-plus/icons-vue'
import { useRouter } from 'vue-router'
import { getInventoryRecords } from '@/api/inventory'

const router = useRouter()
const loading = ref(false)
const tableData = ref([])

const filterForm = reactive({
  productName: '',
  type: null
})

const pagination = reactive({
  page: 1,
  size: 10,
  total: 0
})

const getTypeTagType = (type) => {
  const map = {
    1: 'success',
    2: 'warning',
    3: 'info'
  }
  return map[type] || ''
}

const getQuantityClass = (type, quantity) => {
  if (type === 1) return 'quantity-in'
  if (type === 2) return 'quantity-out'
  return 'quantity-adjust'
}

const getQuantityDisplay = (type, quantity) => {
  if (type === 1) return `+${quantity}`
  if (type === 2) return `-${quantity}`
  return quantity >= 0 ? `+${quantity}` : `${quantity}`
}

const formatTime = (time) => {
  if (!time) return '-'
  return time.substring(0, 19).replace('T', ' ')
}

const fetchData = async () => {
  loading.value = true
  try {
    const params = {
      pageNum: pagination.page,
      pageSize: pagination.size
    }
    if (filterForm.productName) {
      params.productName = filterForm.productName
    }
    if (filterForm.type) {
      params.type = filterForm.type
    }
    const res = await getInventoryRecords(params)
    tableData.value = res.data.records
    pagination.total = res.data.total
  } catch (error) {
    ElMessage.error('获取库存记录失败')
  } finally {
    loading.value = false
  }
}

const handleFilter = () => {
  pagination.page = 1
  fetchData()
}

const handleReset = () => {
  filterForm.productName = ''
  filterForm.type = null
  pagination.page = 1
  fetchData()
}

const handleBack = () => {
  router.push('/inventory')
}

onMounted(() => {
  fetchData()
})
</script>

<style scoped>
.inventory-records {
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

.filter-card {
  background: #fff;
  padding: 20px;
  border-radius: 12px;
  margin-bottom: 20px;
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

.quantity-in {
  color: #67c23a;
  font-weight: 600;
}

.quantity-out {
  color: #f56c6c;
  font-weight: 600;
}

.quantity-adjust {
  color: #409eff;
  font-weight: 600;
}
</style>
