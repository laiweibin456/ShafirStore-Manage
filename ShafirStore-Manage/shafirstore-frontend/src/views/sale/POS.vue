<template>
  <div class="pos-container">
    <el-row :gutter="16" class="pos-main">
      <el-col :span="14">
        <div class="product-section">
          <div class="section-header">
            <h3>商品选择</h3>
            <el-input
              v-model="searchKeyword"
              placeholder="搜索商品..."
              prefix-icon="Search"
              clearable
              style="width: 240px"
              @input="handleSearch"
            />
          </div>

          <div class="category-tabs">
            <el-radio-group v-model="activeCategory" @change="handleCategoryChange">
              <el-radio-button label="all">全部</el-radio-button>
              <el-radio-button
                v-for="cat in categoryList"
                :key="cat.id"
                :value="cat.id"
              >
                {{ cat.name }}
              </el-radio-button>
            </el-radio-group>
          </div>

          <div class="product-grid" v-loading="loadingProducts">
            <div
              v-for="product in filteredProducts"
              :key="product.id"
              class="product-item"
              :class="{ 'out-of-stock': product.stockQuantity === 0 }"
              @click="handleProductClick(product)"
            >
              <div class="product-image">
                <el-image
                  v-if="product.imageUrl"
                  :src="product.imageUrl"
                  fit="cover"
                >
                  <template #error>
                    <div class="image-placeholder">
                      <el-icon :size="30"><Goods /></el-icon>
                    </div>
                  </template>
                </el-image>
                <div v-else class="image-placeholder">
                  <el-icon :size="30"><Goods /></el-icon>
                </div>
              </div>
              <div class="product-name">{{ product.name }}</div>
              <div class="product-price">¥{{ product.price }}</div>
              <div class="product-stock" :class="{ 'low': (product.stockQuantity || 0) < 5 }">
                库存: {{ product.stockQuantity || 0 }}
              </div>
            </div>
          </div>
        </div>
      </el-col>

      <el-col :span="10">
        <div class="order-section">
          <div class="section-header">
            <h3>当前订单</h3>
            <el-button text type="danger" @click="handleClearCart" :disabled="cartItems.length === 0">
              清空
            </el-button>
          </div>

          <div class="cart-items" v-if="cartItems.length > 0">
            <div
              v-for="(item, index) in cartItems"
              :key="index"
              class="cart-item"
            >
              <div class="item-info">
                <div class="item-name">{{ item.name }}</div>
                <div class="item-price">¥{{ item.price }} × {{ item.quantity }}</div>
              </div>
              <div class="item-actions">
                <el-input-number
                  v-model="item.quantity"
                  :min="1"
                  :max="item.stockQuantity"
                  size="small"
                  @change="handleQuantityChange(item)"
                />
                <div class="item-subtotal">¥{{ (item.price * item.quantity).toFixed(2) }}</div>
                <el-button type="danger" size="small" circle @click="handleRemoveItem(index)">
                  <el-icon><Delete /></el-icon>
                </el-button>
              </div>
            </div>
          </div>

          <el-empty v-else description="购物车为空" />

          <div class="order-summary">
            <div class="summary-row">
              <span>商品数量：</span>
              <span>{{ totalQuantity }} 件</span>
            </div>
            <div class="summary-row">
              <span>订单总额：</span>
              <span class="total-amount">¥{{ totalAmount.toFixed(2) }}</span>
            </div>
          </div>

          <div class="payment-section">
            <div class="payment-method">
              <span class="label">支付方式：</span>
              <el-radio-group v-model="payType">
                <el-radio :value="1">现金</el-radio>
                <el-radio :value="2">微信</el-radio>
                <el-radio :value="3">支付宝</el-radio>
                <el-radio :value="4">会员卡</el-radio>
              </el-radio-group>
            </div>

            <div class="remark-input">
              <el-input
                v-model="remark"
                placeholder="订单备注（可选）"
                type="textarea"
                :rows="2"
              />
            </div>

            <el-button
              type="primary"
              size="large"
              class="submit-btn"
              :disabled="cartItems.length === 0"
              :loading="submitting"
              @click="handleSubmitOrder"
            >
              提交订单（¥{{ totalAmount.toFixed(2) }}）
            </el-button>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { useRouter } from 'vue-router'
import { getProductList } from '@/api/product'
import { getAllCategories } from '@/api/category'
import { createOrder } from '@/api/order'
import { getInventoryByProductId } from '@/api/inventory'
import { Goods, Delete } from '@element-plus/icons-vue'

const router = useRouter()
const loadingProducts = ref(false)
const submitting = ref(false)
const searchKeyword = ref('')
const activeCategory = ref('all')
const categoryList = ref([])
const productList = ref([])
const inventoryMap = ref({})

const cartItems = ref([])
const payType = ref(2)
const remark = ref('')

const filteredProducts = computed(() => {
  let result = productList.value

  if (activeCategory.value !== 'all') {
    result = result.filter(p => p.categoryId === activeCategory.value)
  }

  if (searchKeyword.value) {
    const keyword = searchKeyword.value.toLowerCase()
    result = result.filter(p => p.name.toLowerCase().includes(keyword))
  }

  return result
})

const totalQuantity = computed(() => {
  return cartItems.value.reduce((sum, item) => sum + item.quantity, 0)
})

const totalAmount = computed(() => {
  return cartItems.value.reduce((sum, item) => sum + item.price * item.quantity, 0)
})

const fetchProducts = async () => {
  loadingProducts.value = true
  try {
    const res = await getProductList({ pageNum: 1, pageSize: 1000, status: 1 })
    productList.value = res.data?.records || []

    for (const product of productList.value) {
      try {
        const invRes = await getInventoryByProductId(product.id)
        if (invRes.data) {
          product.stockQuantity = invRes.data.quantity || 0
          inventoryMap.value[product.id] = invRes.data.quantity || 0
        } else {
          product.stockQuantity = 0
        }
      } catch {
        product.stockQuantity = 0
      }
    }
  } catch (error) {
    ElMessage.error('获取商品列表失败')
  } finally {
    loadingProducts.value = false
  }
}

const fetchCategories = async () => {
  try {
    const res = await getAllCategories()
    categoryList.value = res.data || []
  } catch (error) {
    console.error('获取分类列表失败', error)
  }
}

const handleSearch = () => {
  // 搜索由computed处理
}

const handleCategoryChange = () => {
  // 分类切换由computed处理
}

const handleProductClick = (product) => {
  if ((product.stockQuantity || 0) === 0) {
    ElMessage.warning('该商品库存为0，无法添加')
    return
  }

  const existingItem = cartItems.value.find(item => item.productId === product.id)

  if (existingItem) {
    if (existingItem.quantity < product.stockQuantity) {
      existingItem.quantity++
    } else {
      ElMessage.warning('库存不足')
    }
  } else {
    cartItems.value.push({
      productId: product.id,
      name: product.name,
      price: product.price,
      quantity: 1,
      stockQuantity: product.stockQuantity,
      unit: product.unit
    })
  }
}

const handleQuantityChange = (item) => {
  if (item.quantity > item.stockQuantity) {
    ElMessage.warning('库存不足')
    item.quantity = item.stockQuantity
  }
}

const handleRemoveItem = (index) => {
  cartItems.value.splice(index, 1)
}

const handleClearCart = async () => {
  try {
    await ElMessageBox.confirm('确定要清空购物车吗？', '提示', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    cartItems.value = []
    remark.value = ''
  } catch {
    // 用户取消
  }
}

const handleSubmitOrder = async () => {
  if (cartItems.value.length === 0) {
    ElMessage.warning('请选择商品')
    return
  }

  submitting.value = true
  try {
    const productIds = cartItems.value.map(item => item.productId)
    const quantities = cartItems.value.map(item => item.quantity)

    await createOrder({
      productIds,
      quantities,
      memberId: null,
      payType: payType.value,
      remark: remark.value
    })

    ElMessage.success('订单创建成功')

    cartItems.value = []
    remark.value = ''

    await fetchProducts()

    ElMessageBox.confirm('订单创建成功，是否前往订单列表查看？', '提示', {
      confirmButtonText: '查看订单',
      cancelButtonText: '继续收银',
      type: 'success'
    }).then(() => {
      router.push('/sale/order')
    }).catch(() => {
      // 继续收银
    })
  } catch (error) {
    ElMessage.error(error.message || '订单创建失败')
  } finally {
    submitting.value = false
  }
}

onMounted(() => {
  fetchProducts()
  fetchCategories()
})
</script>

<style scoped>
.pos-container {
  width: 100%;
  padding: 0;
  height: calc(100vh - 120px);
}

.pos-main {
  height: 100%;
}

.product-section {
  background: #fff;
  border-radius: 12px;
  padding: 20px;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.order-section {
  background: #fff;
  border-radius: 12px;
  padding: 20px;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.section-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 20px;
}

.section-header h3 {
  font-size: 18px;
  font-weight: 600;
  color: #333;
  margin: 0;
}

.category-tabs {
  margin-bottom: 20px;
  overflow-x: auto;
}

.category-tabs :deep(.el-radio-group) {
  display: flex;
  flex-wrap: nowrap;
}

.category-tabs :deep(.el-radio-button__inner) {
  white-space: nowrap;
}

.product-grid {
  flex: 1;
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
  gap: 16px;
  overflow-y: auto;
  padding-right: 8px;
}

.product-item {
  background: #f9f9f9;
  border-radius: 10px;
  padding: 12px;
  text-align: center;
  cursor: pointer;
  transition: all 0.3s;
  border: 2px solid transparent;
}

.product-item:hover {
  background: #f0f0f0;
  border-color: #409eff;
  transform: translateY(-2px);
}

.product-item.out-of-stock {
  opacity: 0.5;
  cursor: not-allowed;
}

.product-image {
  width: 80px;
  height: 80px;
  margin: 0 auto 10px;
  border-radius: 8px;
  overflow: hidden;
  background: #fff;
}

.product-image .el-image {
  width: 100%;
  height: 100%;
}

.image-placeholder {
  width: 100%;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #ccc;
}

.product-name {
  font-size: 13px;
  font-weight: 500;
  color: #333;
  margin-bottom: 6px;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}

.product-price {
  font-size: 16px;
  font-weight: 700;
  color: #f56c6c;
  margin-bottom: 4px;
}

.product-stock {
  font-size: 11px;
  color: #909399;
}

.product-stock.low {
  color: #f56c6c;
}

.cart-items {
  flex: 1;
  overflow-y: auto;
  margin-bottom: 20px;
}

.cart-item {
  display: flex;
  justify-content: space-between;
  align-items: center;
  padding: 12px;
  border-bottom: 1px solid #eee;
}

.item-info {
  flex: 1;
}

.item-name {
  font-size: 14px;
  font-weight: 500;
  color: #333;
  margin-bottom: 4px;
}

.item-price {
  font-size: 12px;
  color: #909399;
}

.item-actions {
  display: flex;
  align-items: center;
  gap: 10px;
}

.item-actions :deep(.el-input-number) {
  width: 100px;
}

.item-subtotal {
  font-size: 14px;
  font-weight: 600;
  color: #f56c6c;
  min-width: 60px;
  text-align: right;
}

.order-summary {
  border-top: 2px solid #409eff;
  padding-top: 16px;
  margin-bottom: 20px;
}

.summary-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
  font-size: 14px;
  color: #666;
}

.total-amount {
  font-size: 24px;
  font-weight: 700;
  color: #f56c6c;
}

.payment-section {
  border-top: 1px solid #eee;
  padding-top: 16px;
}

.payment-method {
  margin-bottom: 16px;
}

.payment-method .label {
  font-size: 14px;
  color: #666;
  margin-bottom: 10px;
  display: block;
}

.payment-method :deep(.el-radio-group) {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
}

.remark-input {
  margin-bottom: 16px;
}

.submit-btn {
  width: 100%;
  height: 50px;
  font-size: 18px;
  font-weight: 600;
}
</style>