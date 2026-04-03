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
            <div class="summary-row" v-if="currentMember">
              <span>会员折扣：</span>
              <span class="discount-tag">{{ getDiscountText() }}</span>
            </div>
            <div class="summary-row">
              <span>订单总额：</span>
              <span class="total-amount">¥{{ finalAmount.toFixed(2) }}</span>
            </div>
          </div>

          <div class="payment-section">
            <div class="payment-method">
              <span class="label">支付方式：</span>
              <el-radio-group v-model="payType" @change="handlePayTypeChange">
                <el-radio :value="1">现金</el-radio>
                <el-radio :value="2">微信</el-radio>
                <el-radio :value="3">支付宝</el-radio>
                <el-radio :value="4">会员卡</el-radio>
              </el-radio-group>
            </div>

            <div class="member-section" v-if="payType === 4">
              <div class="member-input-row">
                <el-input
                  v-model="memberPhone"
                  placeholder="请输入会员手机号"
                  style="width: 200px"
                  @keyup.enter="handleSearchMember"
                />
                <el-button type="primary" @click="handleSearchMember">查询</el-button>
                <el-button type="success" @click="showPointsExchangeDialog">积分兑换</el-button>
              </div>
              <div v-if="currentMember" class="member-info">
                <el-tag :type="getLevelTagType(currentMember.level)">
                  {{ getLevelName(currentMember.level) }}
                </el-tag>
                <span class="member-name">{{ currentMember.name }}</span>
                <span class="member-points">积分: {{ currentMember.points || 0 }}</span>
              </div>
              <div v-else-if="memberSearched" class="member-not-found">
                未找到该会员
              </div>
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
              :disabled="cartItems.length === 0 || (payType === 4 && !currentMember)"
              :loading="submitting"
              @click="handleSubmitOrder"
            >
              提交订单（¥{{ finalAmount.toFixed(2) }}）
            </el-button>
          </div>
        </div>
      </el-col>
    </el-row>

    <el-dialog
      v-model="pointsExchangeVisible"
      title="积分兑换商品"
      width="700px"
    >
      <div class="exchange-info">
        <span>当前积分: <strong>{{ currentMember?.points || 0 }}</strong></span>
        <span>商品所需积分 = 商品价格 × 3</span>
      </div>
      <div class="exchange-products" v-loading="loadingExchangeProducts">
        <div
          v-for="product in exchangeProducts"
          :key="product.id"
          class="exchange-product-item"
          :class="{ 'cannot-exchange': !canExchange(product), 'out-of-stock': product.stockQuantity === 0 }"
          @click="handleExchangeProduct(product)"
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
          <div class="product-points">所需积分: {{ getRequiredPoints(product) }}</div>
          <div class="product-stock" :class="{ 'low': (product.stockQuantity || 0) < 5 }">
            库存: {{ product.stockQuantity || 0 }}
          </div>
        </div>
      </div>
    </el-dialog>

    <el-dialog
      v-model="exchangeConfirmVisible"
      title="确认兑换"
      width="400px"
    >
      <div v-if="exchangeProduct" class="exchange-confirm-content">
        <p>商品名称: {{ exchangeProduct.name }}</p>
        <p>商品价格: ¥{{ exchangeProduct.price }}</p>
        <p>所需积分: {{ getRequiredPoints(exchangeProduct) }}</p>
        <p>当前积分: {{ currentMember?.points || 0 }}</p>
        <p class="exchange-tip">确认使用积分兑换此商品？</p>
      </div>
      <template #footer>
        <el-button @click="exchangeConfirmVisible = false">取消</el-button>
        <el-button type="primary" :loading="exchangeLoading" @click="confirmExchange">确认兑换</el-button>
      </template>
    </el-dialog>
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
import { getMemberByPhone } from '@/api/member'
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

const memberPhone = ref('')
const memberSearched = ref(false)
const currentMember = ref(null)
const pointsExchangeVisible = ref(false)
const exchangeConfirmVisible = ref(false)
const exchangeProduct = ref(null)
const exchangeLoading = ref(false)
const loadingExchangeProducts = ref(false)
const exchangeProducts = ref([])

const discountMap = {
  1: 0.95,
  2: 0.90,
  3: 0.85,
  4: 0.80
}

const levelNameMap = {
  1: '普通会员',
  2: '银卡会员',
  3: '金卡会员',
  4: '钻石会员'
}

const isBirthday = (birthday) => {
  if (!birthday) return false
  const today = new Date()
  const birth = new Date(birthday)
  return today.getMonth() === birth.getMonth() && today.getDate() === birth.getDate()
}

const getMemberDiscount = () => {
  if (!currentMember.value) return 1
  const level = currentMember.value.level || 1
  let discount = discountMap[level] || 0.95
  if (isBirthday(currentMember.value.birthday)) {
    discount = Math.max(0.50, discount - 0.30)
  }
  return discount
}

const finalAmount = computed(() => {
  const baseAmount = totalAmount.value
  if (payType.value === 4 && currentMember.value) {
    return baseAmount * getMemberDiscount()
  }
  return baseAmount
})

const getDiscountText = () => {
  if (!currentMember.value) return ''
  const discount = getMemberDiscount()
  if (isBirthday(currentMember.value.birthday)) {
    return `${(discount * 10).toFixed(1)}折 (生日优惠)`
  }
  return `${(discount * 10).toFixed(1)}折`
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

const getLevelName = (level) => {
  return levelNameMap[level] || '普通会员'
}

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
}

const handleCategoryChange = () => {
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
  }
}

const handlePayTypeChange = () => {
  if (payType.value !== 4) {
    currentMember.value = null
    memberPhone.value = ''
    memberSearched.value = false
  }
}

const handleSearchMember = async () => {
  if (!memberPhone.value) {
    ElMessage.warning('请输入会员手机号')
    return
  }
  try {
    const res = await getMemberByPhone(memberPhone.value)
    if (res.data) {
      currentMember.value = res.data
      memberSearched.value = true
      ElMessage.success(`欢迎 ${res.data.name}！您的等级是：${getLevelName(res.data.level)}`)
    } else {
      currentMember.value = null
      memberSearched.value = true
      ElMessage.warning('未找到该会员')
    }
  } catch (error) {
    currentMember.value = null
    memberSearched.value = true
    ElMessage.error('查询会员失败')
  }
}

const showPointsExchangeDialog = async () => {
  if (!currentMember.value) {
    ElMessage.warning('请先查询会员')
    return
  }
  pointsExchangeVisible.value = true
  loadingExchangeProducts.value = true
  try {
    const res = await getProductList({ pageNum: 1, pageSize: 1000, status: 1 })
    exchangeProducts.value = res.data?.records || []
    for (const product of exchangeProducts.value) {
      try {
        const invRes = await getInventoryByProductId(product.id)
        if (invRes.data) {
          product.stockQuantity = invRes.data.quantity || 0
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
    loadingExchangeProducts.value = false
  }
}

const getRequiredPoints = (product) => {
  return Math.floor(product.price * 3)
}

const canExchange = (product) => {
  if (!currentMember.value) return false
  if ((product.stockQuantity || 0) === 0) return false
  const requiredPoints = getRequiredPoints(product)
  return (currentMember.value.points || 0) >= requiredPoints
}

const handleExchangeProduct = (product) => {
  if ((product.stockQuantity || 0) === 0) {
    ElMessage.warning('该商品库存为0')
    return
  }
  const requiredPoints = getRequiredPoints(product)
  if ((currentMember.value.points || 0) < requiredPoints) {
    ElMessage.warning(`您的积分不足，需要 ${requiredPoints} 积分，当前 ${currentMember.value.points} 积分`)
    return
  }
  exchangeProduct.value = product
  exchangeConfirmVisible.value = true
}

const confirmExchange = async () => {
  if (!exchangeProduct.value || !currentMember.value) return
  exchangeLoading.value = true
  try {
    const requiredPoints = getRequiredPoints(exchangeProduct.value)
    const orderData = {
      productIds: [exchangeProduct.value.productId || exchangeProduct.value.id],
      quantities: [1],
      memberId: currentMember.value.id,
      payType: 5,
      remark: `积分兑换，消耗 ${requiredPoints} 积分`,
      pointsDeduct: requiredPoints
    }
    await createOrder(orderData)
    const newPoints = (currentMember.value.points || 0) - requiredPoints
    currentMember.value = { ...currentMember.value, points: newPoints }
    exchangeProduct.value.stockQuantity = (exchangeProduct.value.stockQuantity || 0) - 1
    const productIndex = productList.value.findIndex(p => p.id === (exchangeProduct.value.productId || exchangeProduct.value.id))
    if (productIndex !== -1) {
      productList.value[productIndex].stockQuantity = Math.max(0, (productList.value[productIndex].stockQuantity || 0) - 1)
    }
    ElMessage.success('积分兑换成功！')
    exchangeConfirmVisible.value = false
    exchangeProduct.value = null
  } catch (error) {
    ElMessage.error(error.message || '积分兑换失败')
  } finally {
    exchangeLoading.value = false
  }
}

const handleSubmitOrder = async () => {
  if (cartItems.value.length === 0) {
    ElMessage.warning('请选择商品')
    return
  }

  if (payType.value === 4 && !currentMember.value) {
    ElMessage.warning('请先查询会员')
    return
  }

  submitting.value = true
  try {
    const productIds = cartItems.value.map(item => item.productId)
    const quantities = cartItems.value.map(item => item.quantity)

    let pointsEarned = 0
    if (payType.value === 4) {
      pointsEarned = Math.floor(finalAmount.value / 10)
    }

    await createOrder({
      productIds,
      quantities,
      memberId: currentMember.value?.id || null,
      payType: payType.value,
      remark: remark.value,
      pointsEarned
    })

    ElMessage.success('订单创建成功！' + (pointsEarned > 0 ? ` 获得 ${pointsEarned} 积分` : ''))

    cartItems.value = []
    remark.value = ''
    if (payType.value === 4 && currentMember.value) {
      const newPoints = (currentMember.value.points || 0) + pointsEarned
      currentMember.value = { ...currentMember.value, points: newPoints }
    }

    await fetchProducts()

    ElMessageBox.confirm('订单创建成功，是否前往订单列表查看？', '提示', {
      confirmButtonText: '查看订单',
      cancelButtonText: '继续收银',
      type: 'success'
    }).then(() => {
      router.push('/sale/order')
    }).catch(() => {
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

.discount-tag {
  color: #67c23a;
  font-weight: 600;
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

.member-section {
  background: #f5f7fa;
  padding: 16px;
  border-radius: 8px;
  margin-bottom: 16px;
}

.member-input-row {
  display: flex;
  gap: 10px;
  align-items: center;
  margin-bottom: 12px;
}

.member-info {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 10px 0;
}

.member-name {
  font-size: 16px;
  font-weight: 600;
  color: #333;
}

.member-points {
  font-size: 14px;
  color: #e6a23c;
  font-weight: 600;
}

.member-not-found {
  color: #f56c6c;
  font-size: 14px;
  padding: 10px 0;
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

.exchange-info {
  display: flex;
  justify-content: space-between;
  padding: 12px 16px;
  background: #f5f7fa;
  border-radius: 8px;
  margin-bottom: 20px;
  font-size: 14px;
  color: #666;
}

.exchange-info strong {
  color: #e6a23c;
  font-size: 16px;
}

.exchange-products {
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(140px, 1fr));
  gap: 16px;
  max-height: 400px;
  overflow-y: auto;
  padding: 4px;
}

.exchange-product-item {
  background: #f9f9f9;
  border-radius: 10px;
  padding: 12px;
  text-align: center;
  cursor: pointer;
  transition: all 0.3s;
  border: 2px solid transparent;
}

.exchange-product-item:hover {
  background: #f0f0f0;
  border-color: #67c23a;
  transform: translateY(-2px);
}

.exchange-product-item.cannot-exchange {
  opacity: 0.5;
  cursor: not-allowed;
}

.exchange-product-item.cannot-exchange:hover {
  border-color: transparent;
  transform: none;
}

.exchange-product-item.out-of-stock {
  opacity: 0.5;
  cursor: not-allowed;
}

.exchange-product-item .product-image {
  width: 70px;
  height: 70px;
  margin: 0 auto 8px;
}

.exchange-product-item .product-name {
  font-size: 12px;
}

.exchange-product-item .product-price {
  font-size: 14px;
  margin-bottom: 4px;
}

.exchange-product-item .product-points {
  font-size: 11px;
  color: #e6a23c;
  font-weight: 600;
  margin-bottom: 4px;
}

.exchange-confirm-content {
  text-align: left;
}

.exchange-confirm-content p {
  margin: 8px 0;
  font-size: 14px;
  color: #666;
}

.exchange-confirm-content .exchange-tip {
  color: #409eff;
  font-weight: 600;
  margin-top: 16px;
}
</style>