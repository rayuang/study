import express from "express"
const app = express()
// express路由路径支持正则表达式写法
app.get("/", (req, res) => {
    res.write("helloworld")
    res.end()
})
app.get("/login", (req, res) => {
    res.json({ uid: "0001", username: "wang" })
})
/**
 * 此路径表示路径中?前面的字母(i)可以省略
 */
app.get("/logi?n", (req, res) => {
    res.json({ uid: "0002", username: "wang" })
})
app.get("/signup/:username/:password", (req, res) => {
    res.json({ uid: "0001", username: "wang" })
})
/**
 * 表示匹配路径中+前面的字符可以有n个
 */
app.get("/ab+cd", (req, res) => {
    res.json({ uid: "0001", username: "wang" })
})
/**
 * 路径中*匹配任意长度的字符
 */
app.get("/ab*cd", (req, res) => {
    res.json({ uid: "0001", username: "wang" })
})
/**
 * 路径中()?表示括号中可有可不有
 */
app.get("/lo(gi)?n", (req, res) => {
    res.json({ uid: "0001", username: "wang" })
})
/* 
多个中间件
*/
app.get("/main", (req, res, next) => {
    console.log("执行1")
    // 将此中间件计算结果传入下个中间件
    res.hobby = "ball"
    // res.json({a:1})
    // 调用next执行下个中间件，不调用执行当前，但只能调用一个res.*(),后面还有中间件若不调用next会被挂起
    next()
}, (req, res) => {
    console.log("调用next执行2")
    res.json({ b: res.hobby })
})

/* 
以上写法可写成如下
let a = function(req,res,next){
    next()
}
let b = function(req,res,next){
    res.send("---")
}
app.get("/main2",[a,b])
*/
let c = (req,res,next)=>{
    console.log("走了中间件")
    next()
}
// 应用级中间件都挂在app身上，不加第一个参数后续就一定会执行
// 第一个参数为路径,即匹配此路径开始的
app.use("/index",c)
app.get("/index/html", (req, res) => {
    res.json({a:"bc"})
})



app.listen(3000, () => {
    console.log("server start http://localhost:3000")
})