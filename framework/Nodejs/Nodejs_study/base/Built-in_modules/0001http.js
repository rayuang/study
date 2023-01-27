import http from 'http'

// 创建服务器
http.createServer((req, res) => {
    // 回调函数，接受浏览器传的参数，返回渲染内容
    /* req 接受浏览器传来的参数
    res 返回的渲染内容 */
    if (req.url === "/favicon.ico") {
        return
    }
    console.log(req.url)
    // res.write("hello world")
    // 响应头
    res.writeHead(200, { "Content-Type": "text/html;charset=utf-8" })//普通文本：text/plain
    // 响应正文
    res.write(`
    <html>
        <b>你好</b>
    </html>
    `)
    // 若前面有其他的res.write()会将整个dom结构打印
    res.end("[1,2,3]")
}).listen(8000, () => {
    // 创建成功的回调函数
    console.log("server start")
})