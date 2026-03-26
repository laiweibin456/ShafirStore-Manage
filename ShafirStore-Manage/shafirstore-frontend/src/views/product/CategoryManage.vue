<template>
  <div class="category-manage">
    <el-card>
      <template #header>
        <div class="header-actions">
          <span>商品分类</span>
          <el-button type="primary" @click="handleAddTop">新增分类</el-button>
        </div>
      </template>

      <el-tree
        :data="categoryTree"
        :props="{ label: 'name', children: 'children' }"
        node-key="id"
        default-expand-all
        v-loading="loading"
      >
        <template #default="{ node, data }">
          <span class="tree-node">
            <span class="node-content">
              <span class="node-label">{{ node.label }}</span>
              <el-tag v-if="!data.parentId || data.parentId === 0" type="warning" size="small">父类</el-tag>
              <el-tag v-else type="info" size="small">子类</el-tag>
            </span>
            <span class="node-actions">
              <el-button type="primary" link size="small" @click="handleEdit(data)">编辑</el-button>
              <el-button type="danger" link size="small" @click="handleDelete(data)">删除</el-button>
            </span>
          </span>
        </template>
      </el-tree>
    </el-card>

    <el-dialog
      :model-value="dialogVisible"
      :title="isEdit ? '编辑分类' : '新增分类'"
      width="500px"
      @close="handleClose"
    >
      <el-form ref="formRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="上级分类" v-if="!isEdit">
          <el-select v-model="form.parentId" placeholder="请选择上级分类" clearable style="width: 100%">
            <el-option label="无（顶级父类）" :value="0" />
            <el-option
              v-for="cat in parentCategories"
              :key="cat.id"
              :label="cat.name"
              :value="cat.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="分类名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入分类名称" />
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
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getCategoryTree, getAllCategories, addCategory, updateCategory, deleteCategory } from '@/api/category'

const loading = ref(false)
const loadingBtn = ref(false)
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref(null)
const categoryTree = ref([])
const flatCategories = ref([])

const form = reactive({
  id: null,
  parentId: 0,
  name: '',
  status: 1
})

const rules = {
  name: [
    { required: true, message: '请输入分类名称', trigger: 'blur' }
  ]
}

const parentCategories = computed(() => {
  return flatCategories.value.filter(c => !c.parentId || c.parentId === 0)
})

const fetchData = async () => {
  loading.value = true
  try {
    const [treeRes, allRes] = await Promise.all([
      getCategoryTree(),
      getAllCategories()
    ])
    categoryTree.value = treeRes.data
    flatCategories.value = allRes.data
  } catch (error) {
    ElMessage.error('获取分类列表失败')
  } finally {
    loading.value = false
  }
}

const handleAddTop = () => {
  isEdit.value = false
  form.id = null
  form.parentId = 0
  form.name = ''
  form.status = 1
  dialogVisible.value = true
}

const handleEdit = (data) => {
  isEdit.value = true
  form.id = data.id
  form.parentId = data.parentId || 0
  form.name = data.name
  form.status = data.status
  dialogVisible.value = true
}

const handleClose = () => {
  formRef.value?.resetFields()
  dialogVisible.value = false
}

const handleSubmit = async () => {
  if (!formRef.value) return

  await formRef.value.validate(async (valid) => {
    if (!valid) return

    loadingBtn.value = true
    try {
      if (isEdit.value) {
        await updateCategory(form.id, form)
        ElMessage.success('更新成功')
      } else {
        await addCategory(form)
        ElMessage.success('新增成功')
      }
      handleClose()
      fetchData()
    } catch (error) {
      const msg = error?.response?.data?.message || (isEdit.value ? '更新失败' : '新增失败')
      ElMessage.error(msg)
    } finally {
      loadingBtn.value = false
    }
  })
}

const handleDelete = async (data) => {
  const isParent = !data.parentId || data.parentId === 0
  const message = isParent
    ? `确定要删除分类 "${data.name}" 及其所有子类吗？`
    : `确定要删除分类 "${data.name}" 吗？`

  try {
    await ElMessageBox.confirm(message, '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await deleteCategory(data.id)
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
.category-manage {
  width: 100%;
}

.header-actions {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.tree-node {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: 100%;
  padding-right: 20px;
}

.node-content {
  display: flex;
  align-items: center;
  gap: 10px;
}

.node-label {
  font-size: 14px;
}

.node-actions {
  display: flex;
  gap: 10px;
}
</style>