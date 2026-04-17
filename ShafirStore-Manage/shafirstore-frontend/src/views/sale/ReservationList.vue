<template>
  <div class="reservation-list-page">
    <div class="header-section">
      <div class="header-left">
        <h2>预定订单管理</h2>
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
            <el-option label="待取货" :value="1" />
            <el-option label="已完成" :value="2" />
            <el-option label="已取消" :value="3" />
          </el-select>
        </el-form-item>
        <el-form-item label="手机号">
          <el-input
            v-model="searchForm.phone"
            placeholder="请输入手机号"
            clearable
            style="width: 160px"
          />
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

    <div class="stats-card">
      <div class="stat-item">
        <span class="stat-label">待处理</span>
        <span class="stat-value pending">{{ statusCount.pending }}</span>
      </div>
      <div class="stat-item">
        <span class="stat-label">已完成</span>
        <span class="stat-value completed">{{ statusCount.completed }}</span>
      </div>
      <div class="stat-item">
        <span class="stat-label">已取消</span>
        <span class="stat-value cancelled">{{ statusCount.cancelled }}</span>
      </div>
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
        <el-table-column prop="userNickname" label="客户" width="100" />
        <el-table-column prop="userPhone" label="手机号" width="130" />
        <el-table-column prop="memberLevelName" label="会员等级" width="100">
          <template #default="{ row }">
            <el-tag size="small" type="warning">{{ row.memberLevelName || '普通用户' }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="totalAmount" label="订单金额" width="110">
          <template #default="{ row }">
            <span class="amount">¥{{ row.totalAmount }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="discountAmount" label="优惠" width="90">
          <template #default="{ row }">
            <span class="discount">-¥{{ row.discountAmount || 0 }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="payAmount" label="实付金额" width="110">
          <template #default="{ row }">
            <span class="pay-amount">¥{{ row.payAmount }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="pickupTime" label="预约取货时间" width="160">
          <template #default="{ row }">
            {{ formatDateTime(row.pickupTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="90">
          <template #default="{ row }">
            <el-tag :type="getStatusTag(row.status)">
              {{ getStatusName(row.status) }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="下单时间" width="160">
          <template #default="{ row }">
            {{ formatDateTime(row.createTime) }}
          </template>
        </el-table-column>
        <el-table-column prop="remark" label="备注" show-overflow-tooltip width="120" />
        <el-table-column label="操作" width="220" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleViewDetail(row)">
              详情
            </el-button>
            <el-button
              v-if="row.status === 1"
              type="success"
              link
              @click="handleConfirmPayment(row)"
            >
              确认支付
            </el-button>
            <el-button
              v-if="row.status === 1"
              type="danger"
              link
              @click="handleCancel(row)"
            >
              取消
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
      title="预定订单详情"
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
          <el-descriptions-item label="客户姓名">{{ currentOrder.userNickname || '-' }}</el-descriptions-item>
          <el-descriptions-item label="手机号">{{ currentOrder.userPhone || '-' }}</el-descriptions-item>
          <el-descriptions-item label="会员等级">{{ currentOrder.memberLevelName || '普通用户' }}</el-descriptions-item>
          <el-descriptions-item label="下单时间">
            {{ formatDateTime(currentOrder.createTime) }}
          </el-descriptions-item>
          <el-descriptions-item label="预约取货时间">
            {{ formatDateTime(currentOrder.pickupTime) }}
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

        <div class="detail-actions" v-if="currentOrder.status === 1">
          <el-button type="success" @click="handleConfirmPayment(currentOrder)">
            确认支付
          </el-button>
          <el-button type="danger" @click="handleCancel(currentOrder)">
            取消订单
          </el-button>
        </div>
      </div>
    </el-dialog>

    <el-dialog
      v-model="payDialogVisible"
      title="确认支付"
      width="450px"
    >
      <div class="pay-dialog-content" v-if="currentOrder">
        <p>订单号：{{ currentOrder.orderNo }}</p>
        <p>实付金额：<span class="pay-amount">¥{{ currentOrder.payAmount }}</span></p>
        <el-form label-width="80px">
          <el-form-item label="支付方式">
            <el-select v-model="payType" style="width: 200px">
              <el-option label="现金" :value="1" />
              <el-option label="微信" :value="2" />
              <el-option label="支付宝" :value="3" />
              <el-option label="会员卡" :value="4" />
            </el-select>
          </el-form-item>
        </el-form>
      </div>
      <template #footer>
        <el-button @click="payDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitPayment" :loading="payLoading">确认收款</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getReservationList, getReservationDetail, confirmReservationPayment, cancelReservation } from '@/api/order'
import { Search, Refresh } from '@element-plus/icons-vue'

const loading = ref(false)
const detailVisible = ref(false)
const payDialogVisible = ref(false)
const payLoading = ref(false)
const tableData = ref([])
const currentOrder = ref(null)
const payType = ref(1)

const searchForm = reactive({
  orderNo: '',
  status: null,
  phone: ''
})

const pagination = reactive({
  page: 1,
  size: 10,
  total: 0
})

const statusCount = reactive({
  pending: 0,
  completed: 0,
  cancelled: 0
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

const getStatusName = (status) => {
  const map = { 1: '待取货', 2: '已完成', 3: '已取消' }
  return map[status] || '-'
}

const getStatusTag = (status) => {
  const map = { 1: 'warning', 2: 'success', 3: 'info' }
  return map[status] || ''
}

const fetchData = async () => {
  loading.value = true
  try {
    const params = {
      pageNum: pagination.page,
      pageSize: pagination.size
    }
    if (searchForm.orderNo) params.orderNo = searchForm.orderNo
    if (searchForm.status !== null && searchForm.status !== '') params.status = searchForm.status
    if (searchForm.phone) params.phone = searchForm.phone

    const res = await getReservationList(params)
    tableData.value = res.data?.records || []
    pagination.total = res.data?.total || 0

    updateStatusCount()
  } catch (error) {
    ElMessage.error('获取预定订单列表失败')
  } finally {
    loading.value = false
  }
}

const updateStatusCount = async () => {
  try {
    const [pendingRes, completedRes, cancelledRes] = await Promise.all([
      getReservationList({ pageNum: 1, pageSize: 1, status: 1 }),
      getReservationList({ pageNum: 1, pageSize: 1, status: 2 }),
      getReservationList({ pageNum: 1, pageSize: 1, status: 3 })
    ])
    statusCount.pending = pendingRes.data?.total || 0
    statusCount.completed = completedRes.data?.total || 0
    statusCount.cancelled = cancelledRes.data?.total || 0
  } catch (e) {
    // ignore
  }
}

const handleSearch = () => {
  pagination.page = 1
  fetchData()
}

const handleReset = () => {
  searchForm.orderNo = ''
  searchForm.status = null
  searchForm.phone = ''
  pagination.page = 1
  fetchData()
}

const handleViewDetail = async (row) => {
  try {
    const res = await getReservationDetail(row.id)
    currentOrder.value = res.data
    detailVisible.value = true
  } catch (error) {
    ElMessage.error('获取订单详情失败')
  }
}

const handleConfirmPayment = (row) => {
  if (row.items) {
    currentOrder.value = row
  } else {
    currentOrder.value = row
  }
  payType.value = 1
  payDialogVisible.value = true
}

const submitPayment = async () => {
  if (!currentOrder.value) return
  payLoading.value = true
  try {
    const res = await confirmReservationPayment(currentOrder.value.id, payType.value)
    payDialogVisible.value = false
    detailVisible.value = false
    ElMessage.success('支付确认成功')
    if (res.data && res.data.upgraded) {
      ElMessage.info('客户已升级为：' + res.data.newLevelName)
    }
    fetchData()
  } catch (error) {
    ElMessage.error('确认支付失败：' + (error.message || '未知错误'))
  } finally {
    payLoading.value = false
  }
}

const handleCancel = async (row) => {
  try {
    await ElMessageBox.confirm(
      `确定要取消预定订单 "${row.orderNo}" 吗？取消后库存将自动恢复。`,
      '取消预定',
      {
        confirmButtonText: '确定取消',
        cancelButtonText: '暂不取消',
        type: 'warning'
      }
    )
    await cancelReservation(row.id)
    ElMessage.success('订单已取消，库存已恢复')
    detailVisible.value = false
    fetchData()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('取消订单失败')
    }
  }
}

onMounted(() => {
  fetchData()
})
</script>

<style scoped>
.reservation-list-page {
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

.stats-card {
  display: flex;
  gap: 20px;
  margin-bottom: 20px;
}

.stat-item {
  background: #fff;
  padding: 15px 25px;
  border-radius: 8px;
  display: flex;
  flex-direction: column;
  align-items: center;
  min-width: 120px;
}

.stat-label {
  font-size: 13px;
  color: #999;
  margin-bottom: 5px;
}

.stat-value {
  font-size: 24px;
  font-weight: 700;
}

.stat-value.pending {
  color: #E6A23C;
}

.stat-value.completed {
  color: #67C23A;
}

.stat-value.cancelled {
  color: #909399;
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

.detail-actions {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
  gap: 10px;
}

.pay-dialog-content p {
  margin: 10px 0;
  font-size: 14px;
}
</style>
