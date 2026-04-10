// typings/global.d.ts
// 全局类型声明

declare function getApp(): any
declare function getCurrentPages(): any[]

// wx 对象类型声明
declare const wx: {
  login(options?: any): void
  getUserProfile(options?: any): void
  getStorageSync(key: string): any
  setStorageSync(key: string, value: any): void
  removeStorageSync(key: string): void
  clearStorageSync(): void
  request(options?: any): void
  navigateTo(options?: any): void
  redirectTo(options?: any): void
  switchTab(options?: any): void
  navigateBack(options?: any): void
  showToast(options?: any): void
  showLoading(options?: any): void
  hideLoading(): void
  showModal(options?: any): void
  showActionSheet(options?: any): void
  setStorage(options?: any): void
  getStorage(options?: any): void
  removeStorage(options?: any): void
  setTabBarBadge(options?: any): void
  removeTabBarBadge(options?: any): void
  setNavigationBarTitle(options?: any): void
  pageScrollTo(options?: any): void
  getLocation(options?: any): void
  chooseImage(options?: any): void
  previewImage(options?: any): void
  scanCode(options?: any): void
  makePhoneCall(options?: any): void
}

// Page 构造器类型
declare function Page(options: any): void

// Component 构造器类型
declare function Component(options: any): void

// App 构造器类型
declare function App(options: any): void

// 接口响应类型
interface ResponseData<T = any> {
  code: number
  message: string
  data: T
  timestamp: number
}
