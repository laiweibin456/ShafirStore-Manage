import { createRouter, createWebHistory } from 'vue-router'
import routes from './routes'
import { useUserStore } from '@/store/user'
import { getCurrentUser } from '@/api/auth'

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
        await getCurrentUser()
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

    if (to.path === '/login') {
      next('/')
      return
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
