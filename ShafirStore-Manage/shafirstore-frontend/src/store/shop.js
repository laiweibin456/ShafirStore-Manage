import { defineStore } from 'pinia'
import { getMyStores, switchStore } from '@/api/store'
import { useUserStore } from './user'

export const useShopStore = defineStore('shop', {
  state: () => ({
    currentStoreId: null,
    storeList: [],
    currentStoreName: ''
  }),

  getters: {
    hasMultipleStores: (state) => state.storeList.length > 1,
    currentStore: (state) => state.storeList.find(s => s.id === state.currentStoreId),
    hasSelectedStore: (state) => state.currentStoreId !== null
  },

  actions: {
    async fetchStoreList() {
      try {
        const res = await getMyStores()
        this.storeList = res.data || []

        if (this.storeList.length > 0) {
          if (!this.currentStoreId || !this.storeList.find(s => s.id === this.currentStoreId)) {
            this.currentStoreId = this.storeList[0].id
            this.currentStoreName = this.storeList[0].storeName
          }
        }

        return res
      } catch (error) {
        throw error
      }
    },

    async switchCurrentStore(storeId) {
      try {
        const res = await switchStore(storeId)
        this.currentStoreId = storeId
        const store = this.storeList.find(s => s.id === storeId)
        this.currentStoreName = store ? store.storeName : ''
        return res
      } catch (error) {
        throw error
      }
    },

    setCurrentStore(storeId, storeName) {
      this.currentStoreId = storeId
      this.currentStoreName = storeName
    }
  }
})
