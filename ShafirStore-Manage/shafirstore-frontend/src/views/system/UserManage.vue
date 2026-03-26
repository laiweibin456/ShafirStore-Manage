<template>
  <div class="user-manage">
    <el-card>
      <template #header>
        <div class="header-actions">
          <el-form :inline="true" :model="queryForm" class="query-form">
            <el-form-item label="用户名">
              <el-input v-model="queryForm.username" placeholder="请输入用户名" clearable />
            </el-form-item>
            <el-form-item label="姓名">
              <el-input v-model="queryForm.realName" placeholder="请输入姓名" clearable />
            </el-form-item>
            <el-form-item label="角色">
              <el-select v-model="queryForm.roleId" placeholder="请选择角色" clearable>
                <el-option
                  v-for="role in roleList"
                  :key="role.roleId"
                  :label="role.roleName"
                  :value="role.roleId"
                />
              </el-select>
            </el-form-item>
            <el-form-item label="状态">
              <el-select v-model="queryForm.status" placeholder="请选择状态" clearable>
                <el-option :label="'正常'" :value="1" />
                <el-option :label="'禁用'" :value="0" />
              </el-select>
            </el-form-item>
            <el-form-item>
              <el-button type="primary" @click="handleSearch">查询</el-button>
              <el-button @click="handleReset">重置</el-button>
            </el-form-item>
          </el-form>
          <el-button type="primary" @click="handleAdd">新增用户</el-button>
        </div>
      </template>

      <el-table :data="tableData" border stripe v-loading="loading">
        <el-table-column prop="id" label="ID" width="80" />
        <el-table-column prop="username" label="用户名" />
        <el-table-column prop="realName" label="姓名" />
        <el-table-column prop="phone" label="手机号" width="120" />
        <el-table-column prop="email" label="邮箱" width="180" />
        <el-table-column prop="roleName" label="角色" width="100">
          <template #default="{ row }">
            <el-tag :type="row.roleId === 1 ? 'danger' : 'info'">
              {{ row.roleName || '未分配' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="80">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'danger'">
              {{ row.status === 1 ? '正常' : '禁用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="180" />
        <el-table-column label="操作" width="300" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleEdit(row)">编辑</el-button>
            <el-button type="warning" link @click="handleResetPwd(row)">重置密码</el-button>
            <el-button
              :type="row.status === 1 ? 'danger' : 'success'"
              link
              @click="handleToggleStatus(row)"
            >
              {{ row.status === 1 ? '禁用' : '启用' }}
            </el-button>
            <el-button type="danger" link @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-pagination
        v-model:current-page="pagination.page"
        v-model:page-size="pagination.size"
        :total="pagination.total"
        :page-sizes="[10, 20, 50]"
        layout="total, sizes, prev, pager, next, jumper"
        @size-change="fetchData"
        @current-change="fetchData"
      />
    </el-card>

    <user-form
      v-model:visible="formVisible"
      :user-id="currentUserId"
      :role-list="roleList"
      @success="handleFormSuccess"
    />
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getUserList, getAllRoles, updateUserStatus, deleteUser, resetPassword } from '@/api/user'
import UserForm from './UserForm.vue'

const loading = ref(false)
const tableData = ref([])
const roleList = ref([])
const formVisible = ref(false)
const currentUserId = ref(null)

const queryForm = reactive({
  username: '',
  realName: '',
  roleId: null,
  status: null
})

const pagination = reactive({
  page: 1,
  size: 10,
  total: 0
})

const fetchData = async () => {
  loading.value = true
  try {
    const res = await getUserList({
      pageNum: pagination.page,
      pageSize: pagination.size,
      ...queryForm
    })
    tableData.value = res.data.records
    pagination.total = res.data.total
  } catch (error) {
    ElMessage.error('获取用户列表失败')
  } finally {
    loading.value = false
  }
}

const fetchRoles = async () => {
  try {
    const res = await getAllRoles()
    roleList.value = res.data
  } catch (error) {
    console.error('获取角色列表失败', error)
  }
}

const handleSearch = () => {
  pagination.page = 1
  fetchData()
}

const handleReset = () => {
  queryForm.username = ''
  queryForm.realName = ''
  queryForm.roleId = null
  queryForm.status = null
  handleSearch()
}

const handleAdd = () => {
  currentUserId.value = null
  formVisible.value = true
}

const handleEdit = (row) => {
  currentUserId.value = row.id
  formVisible.value = true
}

const handleResetPwd = async (row) => {
  try {
    await ElMessageBox.confirm(`确定要重置用户 "${row.username}" 的密码吗？默认密码为 123456`, '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await resetPassword(row.id, '123456')
    ElMessage.success('密码重置成功')
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('重置密码失败')
    }
  }
}

const handleToggleStatus = async (row) => {
  const newStatus = row.status === 1 ? 0 : 1
  const action = newStatus === 1 ? '启用' : '禁用'
  try {
    await ElMessageBox.confirm(`确定要${action}用户 "${row.username}" 吗？`, '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await updateUserStatus(row.id, newStatus)
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
    await ElMessageBox.confirm(`确定要删除用户 "${row.username}" 吗？`, '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await deleteUser(row.id)
    ElMessage.success('删除成功')
    fetchData()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('删除失败')
    }
  }
}

const handleFormSuccess = () => {
  fetchData()
}

onMounted(() => {
  fetchData()
  fetchRoles()
})
</script>

<style scoped>
.user-manage {
  width: 100%;
}

.header-actions {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}

.query-form {
  flex: 1;
}

.query-form :deep(.el-form-item) {
  margin-bottom: 0;
}

.query-form :deep(.el-select) {
  width: 200px;
}
</style>