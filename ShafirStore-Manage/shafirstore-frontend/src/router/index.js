import { createRouter, createWebHistory } from 'vue-router'
import routes from './routes'
import { useUserStore } from '@/store/user'
import { useShopStore } from '@/store/shop'

const router = createRouter({
  history: createWebHistory(),
  routes
})

let isValidatingToken = false
let validationPromise = null

async function validateToken(userStore) {
  if (!userStore.token) return false

  if (!userStore.userInfo) {
    if (isValidatingToken) {
      return validationPromise
    }
    isValidatingToken = true
    validationPromise = (async () => {
      try {
        await userStore.fetchUserInfo()
        return true
      } catch (error) {
        userStore.token = ''
        userStore.userInfo = null
        localStorage.removeItem('token')
        localStorage.removeItem('userInfo')
        return false
      } finally {
        isValidatingToken = false
        validationPromise = null
      }
    })()
    return validationPromise
  }
  return true
}

router.beforeEach(async (to, from, next) => {
  const userStore = useUserStore()
  const shopStore = useShopStore()

  if (to.meta.requiresAuth) {
    if (!userStore.isLoggedIn) {
      next('/login')
      return
    }

    const isValid = await validateToken(userStore)
    if (!isValid) {
      next('/login')
      return
    }

    if (to.meta.requiredRole && userStore.roleKey !== to.meta.requiredRole) {
      next('/home')
      return
    }

    if (to.meta.requiredRoles && !to.meta.requiredRoles.includes(userStore.roleKey)) {
      next('/home')
      return
    }

    if (userStore.isLoggedIn && shopStore.storeList.length === 0) {
      try {
        await shopStore.fetchStoreList()
        if (userStore.storeId && !shopStore.currentStoreId) {
          shopStore.setCurrentStore(userStore.storeId, '')
        }
      } catch (error) {
        console.error('获取店铺列表失败:', error)
      }
    }
  }

  if (to.path === '/login' && userStore.isLoggedIn) {
    const isValid = await validateToken(userStore)
    if (isValid) {
      next('/')
      return
    }
  }

  next()
})

export default router
