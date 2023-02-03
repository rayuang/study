import express from 'express'
let app = express()
/* 
配置解析post参数的中间件-已内置，不用下载
*/
app.use(express.urlencoded({extended:false}))//kv传参格式
app.use(express.json())// 获取为json格式的请求参数


app.get("/login/:username/:password", (req, res) => {
    // 获取请求参数
    let params = req.params // /:name 方法
    let query = req.query // /?name= 方法
    console.log(params, query) // { username: 'wangruijie', password: '344165' }
    res.send({
        username: req.params.username,
        password: req.params.password
    })
})

app.post("/signup/:uname/:pword", (req, res) => {
    let u_info = req.body
    let info = req.params
    console.log(u_info,"/n /::",info)
    res.json({
        uname:"",
        pword:""
    })
})

app.listen(3000, () => {
    console.log("http://localhost:3000/")
})