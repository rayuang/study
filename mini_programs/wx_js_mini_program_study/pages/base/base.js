// pages/base/base.js
var username = "wangruijie"
Page({

  /**
   * 页面的初始数据
   */
  data: { // 状态
    username: username,
    ids: ["a", "b", "c"],
    is_create: false,
    is_hidden: true,
    add_value: "",
    cont: ["asd", "vfv", "ewrr"]
  },
  update_username() {
    if (this.data.username === "wangruijie") {
      this.setData({
        username: "rayuang"
      })
    } else {
      this.setData({
        username: "wangruijie"
      })
    }
    console.log(this.data.username)
  },
  add_cont() {
    this.setData({
      cont: [this.data.add_value, ...this.data.cont]
    })
    // console.log("add")
  },
  handlerInput(evt) {
    this.setData({
      add_value: evt.detail.value
    })
    // console.log("input",evt.detail.value)
  },
  handlerDel(evt) {
    // console.log(evt.target.dataset.listid)
    this.data.cont.splice(evt.target.dataset.listid,1)
    this.setData({
      cont:this.data.cont
    })
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad(options) {

  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady() {

  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload() {

  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage() {

  }
})