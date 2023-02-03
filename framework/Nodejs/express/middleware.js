import express from 'express'
import studyRouter from './router/studyRouter.js'
const app = express()

let c = (req, res, next) => {
    console.log("走了中间件")
    next()
}
// 应用级中间件都挂在app身上，不加第一个参数后续就一定会执行
// 第一个参数为路径,即匹配此路径开始的
app.use("/index", c)
app.get("/index/html", (req, res) => {
    res.json({ a: "bc" })
})

// 路由中间件
app.use("/home", studyRouter)

// 错误中间件
app.use((req, res) => {
   res.status(404).send("404")
}) 

// 内置中间件
// 指定文件夹为静态资源文件夹
app.use(express.static('public'))

app.listen(3000, () => {
    console.log("http://localhost:3000")
})

