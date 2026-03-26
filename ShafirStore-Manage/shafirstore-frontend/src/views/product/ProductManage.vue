<template>
  <div class="product-manage">
    <div class="header-section">
      <div class="header-left">
        <h2>商品管理</h2>
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
        <el-button type="primary" @click="handleAdd">
          <el-icon><Plus /></el-icon>
          新增商品
        </el-button>
      </div>
    </div>

    <div class="category-tabs">
      <el-tabs v-model="activeCategory" @tab-change="handleCategoryChange">
        <el-tab-pane label="全部" name="all" />
        <el-tab-pane
          v-for="cat in categoryList"
          :key="cat.id"
          :label="cat.name"
          :name="cat.id"
        />
      </el-tabs>
    </div>

    <div class="product-grid" v-loading="loading">
      <el-empty v-if="!loading && tableData.length === 0" description="暂无商品" />

      <div
        v-for="item in tableData"
        :key="item.id"
        class="product-card"
        @click="handleCardClick(item)"
      >
        <div class="card-image">
          <el-image
            v-if="item.imageUrl"
            :src="item.imageUrl"
            fit="cover"
            class="product-image"
          >
            <template #error>
              <div class="image-placeholder">
                <el-icon :size="40"><Picture /></el-icon>
              </div>
            </template>
          </el-image>
          <div v-else class="image-placeholder">
            <el-icon :size="40"><Picture /></el-icon>
          </div>
          <div class="card-status" :class="item.status === 1 ? 'status-on' : 'status-off'">
            {{ item.status === 1 ? '上架中' : '已下架' }}
          </div>
        </div>
        <div class="card-info">
          <h4 class="product-name">{{ item.name }}</h4>
          <div class="product-price">¥{{ item.price }}</div>
          <div class="product-category">{{ item.categoryName }}</div>
        </div>
      </div>
    </div>

    <el-pagination
      v-if="pagination.total > 0"
      v-model:current-page="pagination.page"
      v-model:page-size="pagination.size"
      :total="pagination.total"
      :page-sizes="[12, 24, 36]"
      layout="total, sizes, prev, pager, next"
      @size-change="fetchData"
      @current-change="fetchData"
      class="pagination"
    />

    <el-dialog
      v-model="detailVisible"
      :title="currentProduct?.name"
      width="700px"
      class="product-detail-dialog"
    >
      <div class="product-detail" v-if="currentProduct">
        <div class="detail-main">
          <div class="detail-image">
            <el-image
              v-if="currentProduct.imageUrl"
              :src="currentProduct.imageUrl"
              fit="contain"
              class="detail-product-image"
            >
              <template #error>
                <div class="image-placeholder large">
                  <el-icon :size="60"><Picture /></el-icon>
                </div>
              </template>
            </el-image>
            <div v-else class="image-placeholder large">
              <el-icon :size="60"><Picture /></el-icon>
            </div>
          </div>
          <div class="detail-info">
            <div class="info-row">
              <span class="label">商品名称：</span>
              <span class="value">{{ currentProduct.name }}</span>
            </div>
            <div class="info-row">
              <span class="label">商品分类：</span>
              <span class="value">{{ currentProduct.categoryName }}</span>
            </div>
            <div class="info-row">
              <span class="label">商品价格：</span>
              <span class="value price">¥{{ currentProduct.price }}</span>
            </div>
            <div class="info-row">
              <span class="label">成本价格：</span>
              <span class="value">¥{{ currentProduct.costPrice }}</span>
            </div>
            <div class="info-row">
              <span class="label">商品单位：</span>
              <span class="value">{{ currentProduct.unit }}</span>
            </div>
            <div class="info-row">
              <span class="label">保质期：</span>
              <span class="value">{{ currentProduct.shelfLifeDays }}天</span>
            </div>
            <div class="info-row">
              <span class="label">商品状态：</span>
              <el-tag :type="currentProduct.status === 1 ? 'success' : 'danger'">
                {{ currentProduct.status === 1 ? '上架' : '下架' }}
              </el-tag>
            </div>
            <div class="info-row description">
              <span class="label">商品描述：</span>
              <span class="value">{{ currentProduct.description || '暂无描述' }}</span>
            </div>
          </div>
        </div>
      </div>
      <template #footer>
        <el-button @click="detailVisible = false">关闭</el-button>
        <el-button type="warning" @click="handleToggleStatus">
          {{ currentProduct?.status === 1 ? '下架' : '上架' }}
        </el-button>
        <el-button type="primary" @click="handleEdit">
          <el-icon><Edit /></el-icon>
          编辑
        </el-button>
        <el-button type="danger" @click="handleDelete">
          <el-icon><Delete /></el-icon>
          删除
        </el-button>
      </template>
    </el-dialog>

    <el-dialog
      :model-value="dialogVisible"
      :title="isEdit ? '编辑商品' : '新增商品'"
      width="600px"
      @close="handleClose"
    >
      <el-form ref="formRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="商品名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入商品名称" />
        </el-form-item>
        <el-form-item label="商品分类" prop="categoryId">
          <el-select v-model="form.categoryId" placeholder="请选择分类" style="width: 100%">
            <el-option
              v-for="cat in categoryList"
              :key="cat.id"
              :label="cat.name"
              :value="cat.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="售价" prop="price">
          <el-input-number v-model="form.price" :min="0" :precision="2" :controls="false" style="width: 100%" />
        </el-form-item>
        <el-form-item label="成本价">
          <el-input-number v-model="form.costPrice" :min="0" :precision="2" :controls="false" style="width: 100%" />
        </el-form-item>
        <el-form-item label="单位">
          <el-input v-model="form.unit" placeholder="如：个、袋、盒、杯" style="width: 100%" />
        </el-form-item>
        <el-form-item label="保质期(天)">
          <el-input-number v-model="form.shelfLifeDays" :min="0" :controls="false" style="width: 100%" />
        </el-form-item>
        <el-form-item label="商品图片">
          <el-input v-model="form.imageUrl" placeholder="请输入图片URL" />
        </el-form-item>
        <el-form-item label="商品描述">
          <el-input v-model="form.description" type="textarea" :rows="3" placeholder="请输入商品描述" />
        </el-form-item>
        <el-form-item label="状态">
          <el-radio-group v-model="form.status">
            <el-radio :label="1">上架</el-radio>
            <el-radio :label="0">下架</el-radio>
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
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { getProductList, addProduct, updateProduct, deleteProduct, updateProductStatus } from '@/api/product'
import { getAllCategories } from '@/api/category'

const loading = ref(false)
const loadingBtn = ref(false)
const dialogVisible = ref(false)
const detailVisible = ref(false)
const isEdit = ref(false)
const formRef = ref(null)
const tableData = ref([])
const categoryList = ref([])
const currentProduct = ref(null)
const activeCategory = ref('all')
const searchKeyword = ref('')

const pagination = reactive({
  page: 1,
  size: 12,
  total: 0
})

const form = reactive({
  id: null,
  name: '',
  categoryId: null,
  price: 0,
  costPrice: 0,
  unit: '个',
  shelfLifeDays: 0,
  imageUrl: '',
  description: '',
  status: 1
})

const rules = {
  name: [{ required: true, message: '请输入商品名称', trigger: 'blur' }],
  categoryId: [{ required: true, message: '请选择商品分类', trigger: 'change' }],
  price: [{ required: true, message: '请输入售价', trigger: 'blur' }]
}

const fetchData = async () => {
  loading.value = true
  try {
    const params = {
      pageNum: pagination.page,
      pageSize: pagination.size
    }
    if (activeCategory.value !== 'all') {
      params.categoryId = activeCategory.value
    }
    if (searchKeyword.value) {
      params.name = searchKeyword.value
    }
    const res = await getProductList(params)
    tableData.value = res.data.records
    pagination.total = res.data.total
  } catch (error) {
    ElMessage.error('获取商品列表失败')
  } finally {
    loading.value = false
  }
}

const fetchCategories = async () => {
  try {
    const res = await getAllCategories()
    categoryList.value = res.data
  } catch (error) {
    console.error('获取分类列表失败', error)
  }
}

const handleCategoryChange = () => {
  pagination.page = 1
  fetchData()
}

const handleSearch = () => {
  pagination.page = 1
  fetchData()
}

const handleCardClick = (item) => {
  currentProduct.value = item
  detailVisible.value = true
}

const handleAdd = () => {
  isEdit.value = false
  form.id = null
  form.name = ''
  form.categoryId = null
  form.price = 0
  form.costPrice = 0
  form.unit = '个'
  form.shelfLifeDays = 0
  form.imageUrl = ''
  form.description = ''
  form.status = 1
  dialogVisible.value = true
}

const handleEdit = () => {
  if (!currentProduct.value) return
  detailVisible.value = false
  isEdit.value = true
  form.id = currentProduct.value.id
  form.name = currentProduct.value.name
  form.categoryId = currentProduct.value.categoryId
  form.price = currentProduct.value.price
  form.costPrice = currentProduct.value.costPrice
  form.unit = currentProduct.value.unit
  form.shelfLifeDays = currentProduct.value.shelfLifeDays
  form.imageUrl = currentProduct.value.imageUrl || ''
  form.description = currentProduct.value.description || ''
  form.status = currentProduct.value.status
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
        await updateProduct(form.id, form)
        ElMessage.success('更新成功')
      } else {
        await addProduct(form)
        ElMessage.success('新增成功')
      }
      handleClose()
      fetchData()
    } catch (error) {
      ElMessage.error(isEdit.value ? '更新失败' : '新增失败')
    } finally {
      loadingBtn.value = false
    }
  })
}

const handleToggleStatus = async () => {
  if (!currentProduct.value) return
  const newStatus = currentProduct.value.status === 1 ? 0 : 1
  const action = newStatus === 1 ? '上架' : '下架'
  try {
    await ElMessageBox.confirm(`确定要${action}商品 "${currentProduct.value.name}" 吗？`, '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await updateProductStatus(currentProduct.value.id, newStatus)
    ElMessage.success(`${action}成功`)
    detailVisible.value = false
    fetchData()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error(`${action}失败`)
    }
  }
}

const handleDelete = async () => {
  if (!currentProduct.value) return
  try {
    await ElMessageBox.confirm(`确定要删除商品 "${currentProduct.value.name}" 吗？`, '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await deleteProduct(currentProduct.value.id)
    ElMessage.success('删除成功')
    detailVisible.value = false
    fetchData()
  } catch (error) {
    if (error !== 'cancel') {
      ElMessage.error('删除失败')
    }
  }
}

onMounted(() => {
  fetchData()
  fetchCategories()
})
</script>

<style scoped>
.product-manage {
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

.category-tabs {
  margin-bottom: 20px;
  background: #fff;
  padding: 15px 20px;
  border-radius: 8px;
}

.product-grid {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
  gap: 20px;
  min-height: 300px;
}

.product-card {
  background: #fff;
  border-radius: 12px;
  overflow: hidden;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06);
}

.product-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.12);
}

.card-image {
  position: relative;
  width: 100%;
  height: 180px;
  background: #f5f5f5;
}

.product-image {
  width: 100%;
  height: 100%;
}

.image-placeholder {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #f0f0f0 0%, #e0e0e0 100%);
  color: #bbb;
}

.image-placeholder.large {
  height: 300px;
}

.card-status {
  position: absolute;
  top: 10px;
  right: 10px;
  padding: 4px 10px;
  border-radius: 12px;
  font-size: 12px;
  color: #fff;
}

.status-on {
  background: linear-gradient(135deg, #67c23a 0%, #529b2e 100%);
}

.status-off {
  background: linear-gradient(135deg, #909399 0%, #6d6d6d 100%);
}

.card-info {
  padding: 15px;
}

.product-name {
  font-size: 15px;
  font-weight: 600;
  color: #333;
  margin: 0 0 8px 0;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.product-price {
  font-size: 20px;
  font-weight: 700;
  color: #f56c6c;
  margin-bottom: 4px;
}

.product-category {
  font-size: 12px;
  color: #999;
}

.pagination {
  margin-top: 30px;
  justify-content: center;
}

.product-detail-dialog :deep(.el-dialog__body) {
  padding: 20px;
}

.product-detail {
  width: 100%;
}

.detail-main {
  display: flex;
  gap: 30px;
}

.detail-image {
  flex-shrink: 0;
  width: 300px;
  height: 300px;
  background: #f5f5f5;
  border-radius: 8px;
  overflow: hidden;
}

.detail-product-image {
  width: 100%;
  height: 100%;
}

.detail-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 12px;
}

.info-row {
  display: flex;
  align-items: center;
  gap: 10px;
}

.info-row.description {
  align-items: flex-start;
}

.info-row .label {
  font-size: 14px;
  color: #999;
  min-width: 80px;
}

.info-row .value {
  font-size: 14px;
  color: #333;
}

.info-row .value.price {
  font-size: 24px;
  font-weight: 700;
  color: #f56c6c;
}
</style>