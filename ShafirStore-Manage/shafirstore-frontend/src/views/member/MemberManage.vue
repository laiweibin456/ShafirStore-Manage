<template>
  <div class="member-manage">
    <div class="header-section">
      <div class="header-left">
        <h2>会员管理</h2>
      </div>
      <div class="header-right">
        <el-input
          v-model="searchKeyword"
          placeholder="搜索姓名/手机号..."
          prefix-icon="Search"
          clearable
          class="search-input"
          @input="handleSearch"
        />
        <el-button type="primary" @click="handleAdd">
          <el-icon><Plus /></el-icon>
          新增会员
        </el-button>
      </div>
    </div>

    <div class="filter-card">
      <el-form :inline="true" :model="filterForm">
        <el-form-item label="会员等级">
          <el-select v-model="filterForm.level" placeholder="请选择等级" clearable style="width: 150px" @change="handleFilter">
            <el-option label="普通会员" :value="1" />
            <el-option label="银卡会员" :value="2" />
            <el-option label="金卡会员" :value="3" />
            <el-option label="钻石会员" :value="4" />
          </el-select>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="filterForm.status" placeholder="请选择状态" clearable style="width: 150px" @change="handleFilter">
            <el-option label="正常" :value="1" />
            <el-option label="禁用" :value="0" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleFilter">查询</el-button>
          <el-button @click="handleReset">重置</el-button>
        </el-form-item>
      </el-form>
    </div>

    <div class="stats-row">
      <div class="stat-card">
        <div class="stat-icon total">
          <el-icon :size="30"><User /></el-icon>
        </div>
        <div class="stat-info">
          <div class="stat-value">{{ statistics.total }}</div>
          <div class="stat-label">会员总数</div>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon active">
          <el-icon :size="30"><UserFilled /></el-icon>
        </div>
        <div class="stat-info">
          <div class="stat-value">{{ statistics.active }}</div>
          <div class="stat-label">活跃会员</div>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon points">
          <el-icon :size="30"><Coin /></el-icon>
        </div>
        <div class="stat-info">
          <div class="stat-value">{{ statistics.totalPoints }}</div>
          <div class="stat-label">累计积分</div>
        </div>
      </div>
      <div class="stat-card">
        <div class="stat-icon consume">
          <el-icon :size="30"><Money /></el-icon>
        </div>
        <div class="stat-info">
          <div class="stat-value">¥{{ statistics.totalConsume }}</div>
          <div class="stat-label">累计消费</div>
        </div>
      </div>
    </div>

    <div class="table-card" v-loading="loading">
      <el-table :data="tableData" border stripe style="width: 100%">
        <el-table-column prop="name" label="姓名" width="100" />
        <el-table-column prop="phone" label="手机号" width="130" />
        <el-table-column prop="gender" label="性别" width="70">
          <template #default="{ row }">
            {{ row.gender === 1 ? '男' : row.gender === 0 ? '女' : '-' }}
          </template>
        </el-table-column>
        <el-table-column prop="birthday" label="生日" width="120" />
        <el-table-column prop="levelName" label="会员等级" width="100">
          <template #default="{ row }">
            <el-tag :type="getLevelTagType(row.level)">
              {{ row.levelName || '普通会员' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="points" label="积分余额" width="100">
          <template #default="{ row }">
            <span class="points-value">{{ row.points || 0 }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="totalConsume" label="累计消费" width="120">
          <template #default="{ row }">
            <span class="consume-value">¥{{ row.totalConsume || 0 }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="80">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'danger'">
              {{ row.status === 1 ? '正常' : '禁用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="registerTime" label="注册时间" width="170">
          <template #default="{ row }">
            {{ formatDateTime(row.registerTime) }}
          </template>
        </el-table-column>
        <el-table-column label="操作" width="280" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link size="small" @click="handleViewDetail(row)">详情</el-button>
            <el-button type="success" link size="small" @click="handleEdit(row)">编辑</el-button>
            <el-button type="warning" link size="small" @click="handleAdjustPoints(row)">调积分</el-button>
            <el-button
              :type="row.status === 1 ? 'danger' : 'success'"
              link
              size="small"
              @click="handleToggleStatus(row)"
            >
              {{ row.status === 1 ? '禁用' : '启用' }}
            </el-button>
            <el-button type="danger" link size="small" @click="handleDelete(row)">删除</el-button>
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
      title="会员详情"
      width="600px"
    >
      <el-descriptions :column="2" border v-if="currentMember">
        <el-descriptions-item label="会员姓名">{{ currentMember.name }}</el-descriptions-item>
        <el-descriptions-item label="手机号">{{ currentMember.phone }}</el-descriptions-item>
        <el-descriptions-item label="性别">
          {{ currentMember.gender === 1 ? '男' : currentMember.gender === 0 ? '女' : '-' }}
        </el-descriptions-item>
        <el-descriptions-item label="生日">{{ currentMember.birthday || '-' }}</el-descriptions-item>
        <el-descriptions-item label="会员等级">
          <el-tag :type="getLevelTagType(currentMember.level)">
            {{ currentMember.levelName || '普通会员' }}
          </el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="积分余额">
          <span class="points-value">{{ currentMember.points || 0 }}</span>
        </el-descriptions-item>
        <el-descriptions-item label="累计消费">
          <span class="consume-value">¥{{ currentMember.totalConsume || 0 }}</span>
        </el-descriptions-item>
        <el-descriptions-item label="状态">
          <el-tag :type="currentMember.status === 1 ? 'success' : 'danger'">
            {{ currentMember.status === 1 ? '正常' : '禁用' }}
          </el-tag>
        </el-descriptions-item>
        <el-descriptions-item label="注册时间" :span="2">
          {{ formatDateTime(currentMember.registerTime) }}
        </el-descriptions-item>
      </el-descriptions>
      <template #footer>
        <el-button @click="detailVisible = false">关闭</el-button>
        <el-button type="primary" @click="handleEditFromDetail">编辑信息</el-button>
      </template>
    </el-dialog>

    <el-dialog
      v-model="formVisible"
      :title="isEdit ? '编辑会员' : '新增会员'"
      width="500px"
      @close="handleClose"
    >
      <el-form ref="formRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="姓名" prop="name">
          <el-input v-model="form.name" placeholder="请输入会员姓名" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入手机号" maxlength="11" />
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="form.gender">
            <el-radio :label="1">男</el-radio>
            <el-radio :label="0">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="生日">
          <el-date-picker
            v-model="form.birthday"
            type="date"
            placeholder="选择生日"
            style="width: 100%"
            format="YYYY-MM-DD"
            value-format="YYYY-MM-DD"
          />
        </el-form-item>
        <el-form-item label="会员等级">
          <el-select v-model="form.level" placeholder="请选择等级" style="width: 100%">
            <el-option label="普通会员" :value="1" />
            <el-option label="银卡会员" :value="2" />
            <el-option label="金卡会员" :value="3" />
            <el-option label="钻石会员" :value="4" />
          </el-select>
        </el-form-item>
        <el-form-item label="初始积分">
          <el-input-number v-model="form.points" :min="0" :max="999999" style="width: 100%" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="form.status">
            <el-radio :label="1">正常</el-radio>
            <el-radio :label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="handleClose">取消</el-button>
        <el-button type="primary" :loading="loadingBtn" @click="handleSubmit">确定</el-button>
      </template>
    </el-dialog>

    <el-dialog
      v-model="pointsVisible"
      title="调整积分"
      width="400px"
    >
      <el-form ref="pointsFormRef" :model="pointsForm" :rules="pointsRules" label-width="100px">
        <el-form-item label="会员">
          <el-input v-model="pointsForm.memberName" disabled />
        </el-form-item>
        <el-form-item label="当前积分">
          <el-input v-model="pointsForm.currentPoints" disabled />
        </el-form-item>
        <el-form-item label="操作类型" prop="type">
          <el-radio-group v-model="pointsForm.type">
            <el-radio :label="1">增加积分</el-radio>
            <el-radio :label="2">扣减积分</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="积分数量" prop="points">
          <el-input-number v-model="pointsForm.points" :min="1" :max="999999" style="width: 100%" />
        </el-form-item>
        <el-form-item label="备注">
          <el-input v-model="pointsForm.remark" placeholder="请输入备注信息" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="pointsVisible = false">取消</el-button>
        <el-button type="primary" :loading="loadingBtn" @click="handleSubmitPoints">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { User, UserFilled, Coin, Money, Plus } from '@element-plus/icons-vue'
import { getMemberList, addMember, updateMember, updateMemberStatus, deleteMember, updatePoints } from '@/api/member'

const loading = ref(false)
const loadingBtn = ref(false)
const tableData = ref([])
const detailVisible = ref(false)
const formVisible = ref(false)
const pointsVisible = ref(false)
const isEdit = ref(false)
const formRef = ref(null)
const pointsFormRef = ref(null)
const currentMember = ref(null)

const searchKeyword = ref('')
const filterForm = reactive({
  level: null,
  status: null
})

const pagination = reactive({
  page: 1,
  size: 10,
  total: 0
})

const statistics = reactive({
  total: 0,
  active: 0,
  totalPoints: 0,
  totalConsume: '0.00'
})

const form = reactive({
  id: null,
  name: '',
  phone: '',
  gender: 1,
  birthday: '',
  level: 1,
  points: 0,
  status: 1
})

const pointsForm = reactive({
  memberId: null,
  memberName: '',
  currentPoints: 0,
  type: 1,
  points: 0,
  remark: ''
})

const rules = {
  name: [{ required: true, message: '请输入会员姓名', trigger: 'blur' }],
  phone: [
    { required: true, message: '请输入手机号', trigger: 'blur' },
    { pattern: /^1[3-9]\d{9}$/, message: '请输入正确的手机号', trigger: 'blur' }
  ]
}

const pointsRules = {
  type: [{ required: true, message: '请选择操作类型', trigger: 'change' }],
  points: [{ required: true, message: '请输入积分数量', trigger: 'blur' }]
}

const getLevelTagType = (level) => {
  const map = {
    1: '',
    2: 'info',
    3: 'warning',
    4: 'danger'
  }
  return map[level] || ''
}

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

const fetchData = async () => {
  loading.value = true
  try {
    const params = {
      pageNum: pagination.page,
      pageSize: pagination.size
    }
    if (searchKeyword.value) {
      params.keyword = searchKeyword.value
    }
    if (filterForm.level !== null) {
      params.level = filterForm.level
    }
    if (filterForm.status !== null) {
      params.status = filterForm.status
    }
    const res = await getMemberList(params)
    tableData.value = res.data?.records || []
    pagination.total = res.data?.total || 0
    updateStatistics()
  } catch (error) {
    ElMessage.error('获取会员列表失败')
  } finally {
    loading.value = false
  }
}

const updateStatistics = () => {
  statistics.total = pagination.total
  statistics.active = tableData.value.filter(m => m.status === 1).length
  statistics.totalPoints = tableData.value.reduce((sum, m) => sum + (m.points || 0), 0)
  const totalConsume = tableData.value.reduce((sum, m) => sum + Number(m.totalConsume || 0), 0)
  statistics.totalConsume = totalConsume.toFixed(2)
}

const handleSearch = () => {
  pagination.page = 1
  fetchData()
}

const handleFilter = () => {
  pagination.page = 1
  fetchData()
}

const handleReset = () => {
  searchKeyword.value = ''
  filterForm.level = null
  filterForm.status = null
  pagination.page = 1
  fetchData()
}

const handleAdd = () => {
  isEdit.value = false
  form.id = null
  form.name = ''
  form.phone = ''
  form.gender = 1
  form.birthday = ''
  form.level = 1
  form.points = 0
  form.status = 1
  formVisible.value = true
}

const handleViewDetail = (row) => {
  currentMember.value = row
  detailVisible.value = true
}

const handleEdit = (row) => {
  isEdit.value = true
  form.id = row.id
  form.name = row.name
  form.phone = row.phone
  form.gender = row.gender
  form.birthday = row.birthday
  form.level = row.level
  form.points = row.points
  form.status = row.status
  formVisible.value = true
}

const handleEditFromDetail = () => {
  detailVisible.value = false
  handleEdit(currentMember.value)
}

const handleClose = () => {
  formRef.value?.resetFields()
  formVisible.value = false
}

const handleSubmit = async () => {
  if (!formRef.value) return
  await formRef.value.validate(async (valid) => {
    if (!valid) return
    loadingBtn.value = true
    try {
      if (isEdit.value) {
        await updateMember(form)
        ElMessage.success('更新成功')
      } else {
        await addMember(form)
        ElMessage.success('新增成功')
      }
      handleClose()
      fetchData()
    } catch (error) {
      ElMessage.error(error.message || (isEdit.value ? '更新失败' : '新增失败'))
    } finally {
      loadingBtn.value = false
    }
  })
}

const handleAdjustPoints = (row) => {
  pointsForm.memberId = row.id
  pointsForm.memberName = row.name
  pointsForm.currentPoints = row.points || 0
  pointsForm.type = 1
  pointsForm.points = 0
  pointsForm.remark = ''
  pointsVisible.value = true
}

const handleSubmitPoints = async () => {
  if (!pointsFormRef.value) return
  await pointsFormRef.value.validate(async (valid) => {
    if (!valid) return
    loadingBtn.value = true
    try {
      await updatePoints({
        memberId: pointsForm.memberId,
        type: pointsForm.type,
        points: pointsForm.points,
        remark: pointsForm.remark
      })
      ElMessage.success('积分调整成功')
      pointsVisible.value = false
      fetchData()
    } catch (error) {
      ElMessage.error(error.message || '积分调整失败')
    } finally {
      loadingBtn.value = false
    }
  })
}

const handleToggleStatus = async (row) => {
  const newStatus = row.status === 1 ? 0 : 1
  const action = newStatus === 1 ? '启用' : '禁用'
  try {
    await ElMessageBox.confirm(`确定要${action}会员 "${row.name}" 吗？`, '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await updateMemberStatus(row.id, newStatus)
    ElMessage.success(`${action}成功`)
    fetchData()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error(`${action}失败`)
    }
  }
}

const handleDelete = async (row) => {
  try {
    await ElMessageBox.confirm(`确定要删除会员 "${row.name}" 吗？`, '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await deleteMember(row.id)
    ElMessage.success('删除成功')
    fetchData()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('删除失败')
    }
  }
}

onMounted(() => {
  fetchData()
})
</script>

<style scoped>
.member-manage {
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

.filter-card {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 20px;
}

.stats-row {
  display: flex;
  gap: 20px;
  margin-bottom: 20px;
}

.stat-card {
  flex: 1;
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

.stat-icon.active {
  background: linear-gradient(135deg, #67c23a 0%, #529b2e 100%);
}

.stat-icon.points {
  background: linear-gradient(135deg, #e6a23c 0%, #cf9236 100%);
}

.stat-icon.consume {
  background: linear-gradient(135deg, #f56c6c 0%, #d93636 100%);
}

.stat-info {
  flex: 1;
}

.stat-value {
  font-size: 24px;
  font-weight: 700;
  color: #333;
}

.stat-label {
  font-size: 14px;
  color: #999;
  margin-top: 4px;
}

.table-card {
  background: #fff;
  padding: 20px;
  border-radius: 12px;
}

.points-value {
  color: #e6a23c;
  font-weight: 600;
}

.consume-value {
  color: #f56c6c;
  font-weight: 600;
}

.pagination {
  margin-top: 20px;
  justify-content: center;
}
</style>