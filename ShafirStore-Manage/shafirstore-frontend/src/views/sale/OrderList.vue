<template>
  <div class="order-list-page">
    <div class="header-section">
      <div class="header-left">
        <h2>订单管理</h2>
      </div>
      <div class="header-right">
        <el-button type="primary" @click="handlePOS">
          <el-icon><Sell /></el-icon>
          收银结账
        </el-button>
      </div>
    </div>

    <div class="search-card">
      <el-form :inline="true" :model="searchForm">
        <el-form-item label="订单号">
          <el-input
            v-model="searchForm.orderNo"
            placeholder="请输入订单号"
            clearable
            style="width: 200px"
          />
        </el-form-item>
        <el-form-item label="订单状态">
          <el-select v-model="searchForm.status" placeholder="请选择状态" clearable style="width: 150px">
            <el-option label="进行中" :value="1" />
            <el-option label="已完成" :value="2" />
            <el-option label="已取消" :value="3" />
            <el-option label="已退款" :value="4" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch">
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

    <div class="table-card">
      <el-table
        :data="tableData"
        border
        stripe
        v-loading="loading"
        style="width: 100%"
      >
        <el-table-column prop="orderNo" label="订单号" width="180" />
        <el-table-column prop="createTime" label="下单时间" width="160">
          <template #default="{ row }">
            {{ formatDateTime(row.createTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="totalAmount" label="订单金额" width="120">
          <template #default="{ row }">
            <span class="amount">¥{{ row.totalAmount }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="discountAmount" label="优惠金额" width="100">
          <template #default="{ row }">
            <span class="discount">-¥{{ row.discountAmount || 0 }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="payAmount" label="实付金额" width="120">
          <template #default="{ row }">
            <span class="pay-amount">¥{{ row.payAmount }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="payType" label="支付方式" width="100">
          <template #default="{ row }">
            <el-tag :type="getPayTypeTag(row.payType)">
              {{ getPayTypeName(row.payType) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="订单状态" width="100">
          <template #default="{ row }">
            <el-tag :type="getStatusTag(row.status)">
              {{ getStatusName(row.status) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="operatorName" label="操作员" width="100" />
        <el-table-column prop="remark" label="备注" show-overflow-tooltip />
        <el-table-column label="操作" width="180" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleViewDetail(row)">
              查看详情
            </el-button>
            <el-button
              v-if="row.status === 1"
              type="warning"
              link
              @click="handleCancel(row)"
            >
              取消
            </el-button>
            <el-button
              v-if="row.status === 1 || row.status === 2"
              type="danger"
              link
              @click="handleRefund(row)"
            >
              退款
            </el-button>
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
      v-model="detailVisible"
      title="订单详情"
      width="700px"
    >
      <div class="order-detail" v-if="currentOrder">
        <el-descriptions :column="2" border>
          <el-descriptions-item label="订单号">{{ currentOrder.orderNo }}</el-descriptions-item>
          <el-descriptions-item label="订单状态">
            <el-tag :type="getStatusTag(currentOrder.status)">
              {{ getStatusName(currentOrder.status) }}
            </el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="下单时间">
            {{ formatDateTime(currentOrder.createTime) }}
          </el-descriptions-item>
          <el-descriptions-item label="操作员">{{ currentOrder.operatorName || '-' }}</el-descriptions-item>
          <el-descriptions-item label="支付方式">
            {{ getPayTypeName(currentOrder.payType) }}
          </el-descriptions-item>
          <el-descriptions-item label="备注">{{ currentOrder.remark || '-' }}</el-descriptions-item>
        </el-descriptions>

        <h4 class="items-title">商品明细</h4>
        <el-table :data="currentOrder.items" border size="small">
          <el-table-column prop="productName" label="商品名称" />
          <el-table-column prop="price" label="单价" width="100">
            <template #default="{ row }">¥{{ row.price }}</template>
          </el-table-column>
          <el-table-column prop="quantity" label="数量" width="80" />
          <el-table-column prop="subtotal" label="小计" width="100">
            <template #default="{ row }">
              <span class="subtotal">¥{{ row.subtotal }}</span>
            </template>
          </el-table-column>
        </el-table>

        <div class="amount-summary">
          <div class="summary-row">
            <span>商品总额：</span>
            <span>¥{{ currentOrder.totalAmount }}</span>
          </div>
          <div class="summary-row" v-if="currentOrder.discountAmount > 0">
            <span>优惠金额：</span>
            <span>-¥{{ currentOrder.discountAmount }}</span>
          </div>
          <div class="summary-row total">
            <span>实付金额：</span>
            <span>¥{{ currentOrder.payAmount }}</span>
          </div>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { useRouter } from 'vue-router'
import { getOrderList, getOrderDetail, cancelOrder, refundOrder } from '@/api/order'
import { Search, Refresh, Sell } from '@element-plus/icons-vue'

const router = useRouter()
const loading = ref(false)
const detailVisible = ref(false)
const tableData = ref([])
const currentOrder = ref(null)

const searchForm = reactive({
  orderNo: '',
  status: null
})

const pagination = reactive({
  page: 1,
  size: 10,
  total: 0
})

const formatDateTime = (dateTime) => {
  if (!dateTime) return '-'
  const date = new Date(dateTime)
  return date.toLocaleString('zh-CN', {
    year: 'numeric',
    month: '2-digit',
    day: '2-digit',
    hour: '2-digit',
    minute: '2-digit'
  })
}

const getPayTypeName = (type) => {
  const map = {
    1: '现金',
    2: '微信',
    3: '支付宝',
    4: '会员卡',
    5: '积分兑换'
  }
  return map[type] || '-'
}

const getPayTypeTag = (type) => {
  const map = {
    1: '',
    2: 'success',
    3: 'primary',
    4: 'warning'
  }
  return map[type] || ''
}

const getStatusName = (status) => {
  const map = {
    1: '进行中',
    2: '已完成',
    3: '已取消',
    4: '已退款'
  }
  return map[status] || '-'
}

const getStatusTag = (status) => {
  const map = {
    1: '',
    2: 'success',
    3: 'info',
    4: 'danger'
  }
  return map[status] || ''
}

const fetchData = async () => {
  loading.value = true
  try {
    const params = {
      pageNum: pagination.page,
      pageSize: pagination.size
    }
    if (searchForm.orderNo) {
      params.orderNo = searchForm.orderNo
    }
    if (searchForm.status !== null && searchForm.status !== '') {
      params.status = searchForm.status
    }
    const res = await getOrderList(params)
    tableData.value = res.data?.records || []
    pagination.total = res.data?.total || 0
  } catch (error) {
    ElMessage.error('获取订单列表失败')
  } finally {
    loading.value = false
  }
}

const handleSearch = () => {
  pagination.page = 1
  fetchData()
}

const handleReset = () => {
  searchForm.orderNo = ''
  searchForm.status = null
  pagination.page = 1
  fetchData()
}

const handlePOS = () => {
  router.push('/sale')
}

const handleViewDetail = async (row) => {
  try {
    const res = await getOrderDetail(row.id)
    currentOrder.value = res.data
    detailVisible.value = true
  } catch (error) {
    ElMessage.error('获取订单详情失败')
  }
}

const handleCancel = async (row) => {
  try {
    await ElMessageBox.confirm(
      `确定要取消订单 "${row.orderNo}" 吗？取消后库存将自动退回。`,
      '提示',
      {
        confirmButtonText: '确定取消',
        cancelButtonText: '暂不取消',
        type: 'warning'
      }
    )
    await cancelOrder(row.id)
    ElMessage.success('订单已取消')
    fetchData()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('取消订单失败')
    }
  }
}

const handleRefund = async (row) => {
  try {
    await ElMessageBox.prompt(
      `确定要退款订单 "${row.orderNo}" 吗？请输入退款原因：`,
      '退款确认',
      {
        confirmButtonText: '确定退款',
        cancelButtonText: '暂不退款',
        type: 'warning',
        inputPlaceholder: '请输入退款原因'
      }
    )
    const reason = '用户申请退款'
    await refundOrder(row.id, reason)
    ElMessage.success('退款成功')
    detailVisible.value = false
    fetchData()
  } catch (error) {
    if (error !== 'cancel' && error !== 'close') {
      ElMessage.error('退款失败')
    }
  }
}

onMounted(() => {
  fetchData()
})
</script>

<style scoped>
.order-list-page {
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

.search-card {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 20px;
}

.table-card {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
}

.amount {
  font-weight: 600;
  color: #333;
}

.discount {
  color: #67c23a;
}

.pay-amount {
  font-weight: 700;
  color: #f56c6c;
}

.pagination {
  margin-top: 20px;
  justify-content: center;
}

.order-detail {
  padding: 10px 0;
}

.items-title {
  margin: 20px 0 10px;
  font-size: 14px;
  font-weight: 600;
  color: #333;
}

.subtotal {
  font-weight: 600;
  color: #f56c6c;
}

.amount-summary {
  margin-top: 20px;
  padding: 15px;
  background: #f5f7fa;
  border-radius: 8px;
}

.summary-row {
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
  font-size: 14px;
  color: #666;
}

.summary-row.total {
  padding-top: 10px;
  border-top: 1px solid #ddd;
  font-size: 16px;
  font-weight: 700;
  color: #f56c6c;
}

.summary-row span:last-child {
  color: #333;
}

.summary-row.total span:last-child {
  color: #f56c6c;
}
</style>