<template>
  <div class="store-manage">
    <div class="page-header">
      <h2>店铺管理</h2>
      <el-button type="primary" @click="showAddDialog">新增店铺</el-button>
    </div>

    <el-table :data="storeList" border stripe v-loading="loading">
      <el-table-column prop="id" label="ID" width="80" />
      <el-table-column prop="storeName" label="店铺名称" width="180" />
      <el-table-column prop="storeCode" label="店铺编码" width="120" />
      <el-table-column prop="address" label="地址" min-width="200" />
      <el-table-column prop="phone" label="电话" width="140" />
      <el-table-column prop="businessHours" label="营业时间" width="140" />
      <el-table-column prop="status" label="状态" width="100">
        <template #default="{ row }">
          <el-tag :type="row.status === 1 ? 'success' : 'danger'">
            {{ row.status === 1 ? '营业中' : '已停业' }}
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" width="200" fixed="right">
        <template #default="{ row }">
          <el-button size="small" @click="handleEdit(row)">编辑</el-button>
          <el-button
            size="small"
            :type="row.status === 1 ? 'warning' : 'success'"
            @click="handleToggleStatus(row)"
          >
            {{ row.status === 1 ? '停业' : '营业' }}
          </el-button>
          <el-button size="small" type="danger" @click="handleDelete(row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <div class="pagination-wrapper">
      <el-pagination
        v-model:current-page="pageNum"
        v-model:page-size="pageSize"
        :total="total"
        :page-sizes="[10, 20, 50]"
        layout="total, sizes, prev, pager, next"
        @size-change="fetchStoreList"
        @current-change="fetchStoreList"
      />
    </div>

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑店铺' : '新增店铺'" width="500px">
      <el-form :model="formData" label-width="100px">
        <el-form-item label="店铺名称" required>
          <el-input v-model="formData.storeName" placeholder="请输入店铺名称" />
        </el-form-item>
        <el-form-item label="店铺编码" required>
          <el-input v-model="formData.storeCode" placeholder="请输入店铺编码" :disabled="isEdit" />
        </el-form-item>
        <el-form-item label="地址">
          <el-input v-model="formData.address" placeholder="请输入地址" />
        </el-form-item>
        <el-form-item label="电话">
          <el-input v-model="formData.phone" placeholder="请输入电话" />
        </el-form-item>
        <el-form-item label="营业时间">
          <el-input v-model="formData.businessHours" placeholder="如：08:00-22:00" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit" :loading="submitting">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, onMounted } from 'vue'
import { getStoreList, createStore, updateStore, updateStoreStatus, deleteStore } from '@/api/store'
import { ElMessage, ElMessageBox } from 'element-plus'

const loading = ref(false)
const storeList = ref([])
const pageNum = ref(1)
const pageSize = ref(10)
const total = ref(0)

const dialogVisible = ref(false)
const isEdit = ref(false)
const submitting = ref(false)
const formData = ref({
  id: null,
  storeName: '',
  storeCode: '',
  address: '',
  phone: '',
  businessHours: ''
})

const fetchStoreList = async () => {
  loading.value = true
  try {
    const res = await getStoreList({
      pageNum: pageNum.value,
      pageSize: pageSize.value
    })
    storeList.value = res.data.records || []
    total.value = res.data.total || 0
  } catch (error) {
    ElMessage.error('获取店铺列表失败')
  } finally {
    loading.value = false
  }
}

const showAddDialog = () => {
  isEdit.value = false
  formData.value = {
    id: null,
    storeName: '',
    storeCode: '',
    address: '',
    phone: '',
    businessHours: ''
  }
  dialogVisible.value = true
}

const handleEdit = (row) => {
  isEdit.value = true
  formData.value = { ...row }
  dialogVisible.value = true
}

const handleSubmit = async () => {
  if (!formData.value.storeName || !formData.value.storeCode) {
    ElMessage.warning('请填写店铺名称和编码')
    return
  }
  submitting.value = true
  try {
    if (isEdit.value) {
      await updateStore(formData.value.id, formData.value)
      ElMessage.success('更新成功')
    } else {
      await createStore(formData.value)
      ElMessage.success('创建成功')
    }
    dialogVisible.value = false
    fetchStoreList()
  } catch (error) {
    ElMessage.error(isEdit.value ? '更新失败' : '创建失败')
  } finally {
    submitting.value = false
  }
}

const handleToggleStatus = async (row) => {
  const newStatus = row.status === 1 ? 0 : 1
  const action = newStatus === 1 ? '营业' : '停业'
  try {
    await ElMessageBox.confirm(`确认将店铺【${row.storeName}】设为${action}状态？`, '提示', {
      type: 'warning'
    })
    await updateStoreStatus(row.id, newStatus)
    ElMessage.success('操作成功')
    fetchStoreList()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('操作失败')
    }
  }
}

const handleDelete = async (row) => {
  try {
    await ElMessageBox.confirm(`确认删除店铺【${row.storeName}】？此操作不可恢复！`, '警告', {
      type: 'warning'
    })
    await deleteStore(row.id)
    ElMessage.success('删除成功')
    fetchStoreList()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('删除失败')
    }
  }
}

onMounted(() => {
  fetchStoreList()
})
</script>

<style scoped>
.store-manage {
  padding: 0;
}

.page-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.page-header h2 {
  margin: 0;
  font-size: 20px;
}

.pagination-wrapper {
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
}
</style>
