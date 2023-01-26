import http from 'http'

// 创建服务器
http.createServer((req,res) => {
    // 回调函数，接受浏览器传的参数，返回渲染内容
    /* req 接受浏览器传来的参数
    res 返回的渲染内容 */
    res.write("hello world")
    res.end("[1,2,3]")
}).listen(8000, () => {
    // 创建成功的回调函数
    console.log("server start")
})