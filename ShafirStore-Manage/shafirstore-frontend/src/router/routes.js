export default [
  {
    path: '/login',
    name: 'Login',
    component: () => import('@/views/login/Login.vue'),
    meta: { title: '登录', requiresAuth: false }
  },
  {
    path: '/',
    component: () => import('@/layout/Layout.vue'),
    redirect: '/home',
    meta: { requiresAuth: true },
    children: [
      {
        path: 'home',
        name: 'Home',
        component: () => import('@/views/home/Home.vue'),
        meta: { title: '首页', requiresAuth: true }
      },
      {
        path: 'profile',
        name: 'Profile',
        component: () => import('@/views/system/Profile.vue'),
        meta: { title: '个人中心', requiresAuth: true }
      },
      {
        path: 'system/user',
        name: 'UserManage',
        component: () => import('@/views/system/UserManage.vue'),
        meta: { title: '用户管理', requiresAuth: true }
      },
      {
        path: 'product',
        name: 'ProductManage',
        component: () => import('@/views/product/ProductManage.vue'),
        meta: { title: '商品管理', requiresAuth: true }
      },
      {
        path: 'inventory',
        name: 'InventoryList',
        component: () => import('@/views/inventory/InventoryList.vue'),
        meta: { title: '库存管理', requiresAuth: true }
      },
      {
        path: 'inventory/in',
        name: 'StockIn',
        component: () => import('@/views/inventory/StockIn.vue'),
        meta: { title: '商品入库', requiresAuth: true }
      },
      {
        path: 'inventory/out',
        name: 'StockOut',
        component: () => import('@/views/inventory/StockOut.vue'),
        meta: { title: '商品出库', requiresAuth: true }
      },
      {
        path: 'inventory/records',
        name: 'InventoryRecords',
        component: () => import('@/views/inventory/InventoryRecords.vue'),
        meta: { title: '库存记录', requiresAuth: true }
      },
      {
        path: 'inventory/alerts',
        name: 'InventoryAlerts',
        component: () => import('@/views/inventory/InventoryAlerts.vue'),
        meta: { title: '库存预警', requiresAuth: true }
      },
      {
        path: 'sale',
        name: 'POS',
        component: () => import('@/views/sale/POS.vue'),
        meta: { title: '收银台', requiresAuth: true }
      },
      {
        path: 'sale/order',
        name: 'OrderList',
        component: () => import('@/views/sale/OrderList.vue'),
        meta: { title: '订单管理', requiresAuth: true }
      },
      {
        path: 'member',
        name: 'MemberManage',
        component: () => import('@/views/member/MemberManage.vue'),
        meta: { title: '会员管理', requiresAuth: true }
      },
      {
        path: 'statistics/sales',
        name: 'SalesStatistics',
        component: () => import('@/views/statistics/SalesStatistics.vue'),
        meta: { title: '销售统计', requiresAuth: true }
      },
      {
        path: 'statistics/inventory',
        name: 'InventoryStatistics',
        component: () => import('@/views/statistics/InventoryStatistics.vue'),
        meta: { title: '库存统计', requiresAuth: true }
      },
      {
        path: 'statistics/member',
        name: 'MemberStatistics',
        component: () => import('@/views/statistics/MemberStatistics.vue'),
        meta: { title: '会员统计', requiresAuth: true }
      }
    ]
  }
]
