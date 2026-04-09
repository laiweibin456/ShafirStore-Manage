<template>
  <div class="stock-in-page">
    <div class="header-section">
      <div class="header-left">
        <h2>商品入库</h2>
      </div>
      <div class="header-right">
        <el-button @click="handleBack">
          <el-icon><ArrowLeft /></el-icon>
          返回
        </el-button>
      </div>
    </div>

    <div class="content-wrapper">
      <el-row :gutter="20">
        <el-col :span="16">
          <div class="form-card">
            <el-form ref="formRef" :model="form" :rules="rules" label-width="120px">
              <el-form-item label="选择商品" prop="productId">
                <el-select
                  v-model="form.productId"
                  placeholder="请选择商品"
                  filterable
                  style="width: 100%"
                  @change="handleProductChange"
                >
                  <el-option
                    v-for="product in productList"
                    :key="product.id"
                    :label="product.name"
                    :value="product.id"
                  >
                    <div class="product-option">
                      <span>{{ product.name }}</span>
                      <span class="product-info">当前库存: {{ getProductStock(product.id) }}</span>
                    </div>
                  </el-option>
                </el-select>
              </el-form-item>

              <el-form-item label="商品信息" v-if="selectedProduct">
                <div class="product-detail">
                  <el-descriptions :column="2" border>
                    <el-descriptions-item label="商品名称">{{ selectedProduct.name }}</el-descriptions-item>
                    <el-descriptions-item label="分类">{{ selectedProduct.categoryName }}</el-descriptions-item>
                    <el-descriptions-item label="当前库存">
                      <span class="stock-value">{{ getProductStock(form.productId) }} {{ selectedProduct.unit }}</span>
                    </el-descriptions-item>
                    <el-descriptions-item label="单价">¥{{ selectedProduct.price }}</el-descriptions-item>
                  </el-descriptions>
                </div>
              </el-form-item>

              <el-form-item label="入库数量" prop="quantity">
                <el-input-number v-model="form.quantity" :min="1" :max="99999" style="width: 100%" />
              </el-form-item>

              <el-form-item label="入库后库存">
                <span class="result-value">{{ form.quantity }}</span>
              </el-form-item>

              <el-form-item label="备注">
                <el-input v-model="form.remark" type="textarea" :rows="3" placeholder="请输入入库备注信息" />
              </el-form-item>

              <el-form-item>
                <el-button type="primary" :loading="loadingBtn" @click="handleSubmit" size="large">
                  <el-icon v-if="!loadingBtn"><Check /></el-icon>
                  确认入库
                </el-button>
                <el-button size="large" @click="handleBack">取消</el-button>
              </el-form-item>
            </el-form>
          </div>
        </el-col>

        <el-col :span="8">
          <div class="tips-card">
            <h4>入库说明</h4>
            <ul>
              <li>选择商品后，系统将自动显示当前库存</li>
              <li>入库数量必须大于0</li>
              <li>入库操作将记录操作人和操作时间</li>
              <li>请如实填写入库数量和备注信息</li>
              <li>入库后库存将自动更新</li>
            </ul>
          </div>
        </el-col>
      </el-row>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { useRouter } from 'vue-router'
import { Check, ArrowLeft } from '@element-plus/icons-vue'
import { getProductList } from '@/api/product'
import { stockIn, getInventoryList } from '@/api/inventory'

const router = useRouter()
const loadingBtn = ref(false)
const formRef = ref(null)
const productList = ref([])
const inventoryMap = ref({})

const form = reactive({
  productId: null,
  quantity: 1,
  remark: ''
})

const rules = {
  productId: [{ required: true, message: '请选择商品', trigger: 'change' }],
  quantity: [{ required: true, message: '请输入入库数量', trigger: 'blur' }]
}

const selectedProduct = computed(() => {
  if (!form.productId) return null
  return productList.value.find(p => p.id === form.productId)
})

const getProductStock = (productId) => {
  return inventoryMap.value[productId] || 0
}

const fetchProducts = async () => {
  try {
    const res = await getProductList({ pageNum: 1, pageSize: 1000, status: 1 })
    productList.value = res.data.records || []
  } catch (error) {
    ElMessage.error('获取商品列表失败')
  }
}

const fetchInventory = async () => {
  try {
    const res = await getInventoryList({ pageNum: 1, pageSize: 1000 })
    const records = res.data?.records || []
    records.forEach(item => {
      inventoryMap.value[item.productId] = item.quantity
    })
  } catch (error) {
    console.error('获取库存数据失败', error)
  }
}

const handleProductChange = () => {
  form.quantity = 1
}

const handleSubmit = async () => {
  if (!formRef.value) return
  await formRef.value.validate(async (valid) => {
    if (!valid) return
    loadingBtn.value = true
    try {
      await stockIn({
        productId: form.productId,
        quantity: form.quantity,
        remark: form.remark
      })
      ElMessage.success('入库成功')
      handleBack()
    } catch (error) {
      ElMessage.error('入库失败')
    } finally {
      loadingBtn.value = false
    }
  })
}

const handleBack = () => {
  router.push('/inventory')
}

onMounted(() => {
  fetchProducts()
  fetchInventory()
})
</script>

<style scoped>
.stock-in-page {
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

.content-wrapper {
  padding: 20px;
  background: #fff;
  border-radius: 12px;
}

.form-card {
  padding: 20px;
}

.product-option {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.product-info {
  font-size: 12px;
  color: #999;
}

.product-detail {
  width: 100%;
}

.stock-value {
  font-weight: 600;
  color: #67c23a;
}

.result-value {
  font-size: 20px;
  font-weight: 700;
  color: #409eff;
}

.tips-card {
  padding: 20px;
  background: #f5f7fa;
  border-radius: 8px;
  margin-top: 0;
}

.tips-card h4 {
  margin: 0 0 15px 0;
  color: #333;
  font-size: 16px;
}

.tips-card ul {
  margin: 0;
  padding-left: 20px;
  color: #666;
  font-size: 14px;
  line-height: 2;
}
</style>
