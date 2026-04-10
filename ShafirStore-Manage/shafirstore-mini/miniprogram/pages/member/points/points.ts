// pages/member/points/points.ts
Page({
  data: {
    points: 0,
    records: []
  },

  onLoad() {
    this.loadPointsData()
  },

  async loadPointsData() {
    // TODO: 调用接口获取积分数据
    this.setData({
      points: 1500,
      records: []
    })
  }
})
